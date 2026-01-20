require "json"
require "time"

module Aws
  module ApiGatewayV2
    module Types

      # Represents a domain name and certificate for a portal.

      struct ACMManaged
        include JSON::Serializable

        # The certificate ARN.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @certificate_arn : String,
          @domain_name : String
        )
        end
      end


      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The error message.

      struct AccessDeniedExceptionResponseContent
        include JSON::Serializable

        # The message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Settings for logging access in a stage.

      struct AccessLogSettings
        include JSON::Serializable

        # The ARN of the CloudWatch Logs log group to receive access logs.

        @[JSON::Field(key: "destinationArn")]
        getter destination_arn : String?

        # A single line format of the access logs of data, as specified by selected $context variables. The
        # format must include at least $context.requestId.

        @[JSON::Field(key: "format")]
        getter format : String?

        def initialize(
          @destination_arn : String? = nil,
          @format : String? = nil
        )
        end
      end

      # Represents an API.

      struct Api
        include JSON::Serializable

        # The name of the API.

        @[JSON::Field(key: "name")]
        getter name : String

        # The API protocol.

        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be
        # ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This
        # property is required for WebSocket APIs.

        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String

        # The URI of the API, of the form {api-id}.execute-api.{region}.amazonaws.com. The stage name is
        # typically appended to this URI to form a complete path to a deployed API stage.

        @[JSON::Field(key: "apiEndpoint")]
        getter api_endpoint : String?

        # Specifies whether an API is managed by API Gateway. You can't update or delete a managed API by
        # using API Gateway. A managed API can be deleted only through the tooling or service that created it.

        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?

        # The API ID.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # An API key selection expression. Supported only for WebSocket APIs. See API Key Selection
        # Expressions .

        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?

        # A CORS configuration. Supported only for HTTP APIs.

        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?

        # The timestamp when the API was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The description of the API.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether clients can invoke your API by using the default execute-api endpoint. By default,
        # clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com
        # endpoint. To require that clients use a custom domain name to invoke your API, disable the default
        # endpoint.

        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?

        # Avoid validating models when creating a deployment. Supported only for WebSocket APIs.

        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?

        # The validation information during API import. This may include particular properties of your OpenAPI
        # definition which are ignored during import. Supported only for HTTP APIs.

        @[JSON::Field(key: "importInfo")]
        getter import_info : Array(String)?

        # The IP address types that can invoke the API.

        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # A collection of tags associated with the API.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # A version identifier for the API.

        @[JSON::Field(key: "version")]
        getter version : String?

        # The warning messages reported when failonwarnings is turned on during API import.

        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @name : String,
          @protocol_type : String,
          @route_selection_expression : String,
          @api_endpoint : String? = nil,
          @api_gateway_managed : Bool? = nil,
          @api_id : String? = nil,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @import_info : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # Represents an API mapping.

      struct ApiMapping
        include JSON::Serializable

        # The API identifier.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The API stage.

        @[JSON::Field(key: "stage")]
        getter stage : String

        # The API mapping identifier.

        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String?

        # The API mapping key.

        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?

        def initialize(
          @api_id : String,
          @stage : String,
          @api_mapping_id : String? = nil,
          @api_mapping_key : String? = nil
        )
        end
      end

      # Represents a collection of ApiMappings resources.

      struct ApiMappings
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ApiMapping)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ApiMapping)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a collection of APIs.

      struct Apis
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Api)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Api)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents an authorization configuration for a portal.

      struct Authorization
        include JSON::Serializable

        # The Amazon Cognito configuration.

        @[JSON::Field(key: "cognitoConfig")]
        getter cognito_config : Types::CognitoConfig?

        # Provide no authorization for your portal. This makes your portal publicly accesible on the web.

        @[JSON::Field(key: "none")]
        getter none : Types::None?

        def initialize(
          @cognito_config : Types::CognitoConfig? = nil,
          @none : Types::None? = nil
        )
        end
      end

      # Represents an authorizer.

      struct Authorizer
        include JSON::Serializable

        # The name of the authorizer.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To
        # specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
        # resource-based permissions on the Lambda function, don't specify this parameter. Supported only for
        # REQUEST authorizers.

        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?

        # The authorizer identifier.

        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?

        # Specifies the format of the payload sent to an HTTP API Lambda authorizer. Required for HTTP API
        # Lambda authorizers. Supported values are 1.0 and 2.0. To learn more, see Working with Amazon Web
        # Services Lambda authorizers for HTTP APIs .

        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?

        # The time to live (TTL) for cached authorizer results, in seconds. If it equals 0, authorization
        # caching is disabled. If it is greater than 0, API Gateway caches authorizer responses. The maximum
        # value is 3600, or 1 hour. Supported only for HTTP API Lambda authorizers.

        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?

        # The authorizer type. Specify REQUEST for a Lambda function using incoming request parameters.
        # Specify JWT to use JSON Web Tokens (supported only for HTTP APIs).

        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String?

        # The authorizer's Uniform Resource Identifier (URI). ForREQUEST authorizers, this must be a
        # well-formed Lambda function URI, for example,
        # arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2: {account_id}
        # :function: {lambda_function_name} /invocations. In general, the URI has this form:
        # arn:aws:apigateway: {region} :lambda:path/ {service_api} replaceable/>{region} is the same as the
        # region hosting the Lambda function, path indicates that the remaining substring in the URI should be
        # treated as the path to the resource, including the initial /. For Lambda functions, this is usually
        # of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.

        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?

        # Specifies whether a Lambda authorizer returns a response in a simple format. If enabled, the Lambda
        # authorizer can return a boolean value instead of an IAM policy. Supported only for HTTP APIs. To
        # learn more, see Working with Amazon Web Services Lambda authorizers for HTTP APIs .

        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?

        # The identity source for which authorization is requested. For a REQUEST authorizer, this is
        # optional. The value is a set of one or more mapping expressions of the specified request parameters.
        # The identity source can be headers, query string parameters, stage variables, and context
        # parameters. For example, if an Auth header and a Name query string parameter are defined as identity
        # sources, this value is route.request.header.Auth, route.request.querystring.Name for WebSocket APIs.
        # For HTTP APIs, use selection expressions prefixed with $, for example, $request.header.Auth,
        # $request.querystring.Name. These parameters are used to perform runtime validation for Lambda-based
        # authorizers by verifying all of the identity-related request parameters are present in the request,
        # not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda
        # function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function. For
        # HTTP APIs, identity sources are also used as the cache key when caching is enabled. To learn more,
        # see Working with Amazon Web Services Lambda authorizers for HTTP APIs . For JWT, a single entry that
        # specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only
        # header-based and query parameter-based selections are supported, for example
        # $request.header.Authorization.

        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)?

        # The validation expression does not apply to the REQUEST authorizer.

        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?

        # Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported
        # only for HTTP APIs.

        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?

        def initialize(
          @name : String,
          @authorizer_credentials_arn : String? = nil,
          @authorizer_id : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_type : String? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_source : Array(String)? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil
        )
        end
      end

      # Represents a collection of authorizers.

      struct Authorizers
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Authorizer)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Authorizer)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request is not valid, for example, the input is incomplete or incorrect. See the accompanying
      # error message for details.

      struct BadRequestException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The response content for bad request exception.

      struct BadRequestExceptionResponseContent
        include JSON::Serializable

        # The message of the bad request exception response content.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The configuration for using Amazon Cognito user pools to control access to your portal.

      struct CognitoConfig
        include JSON::Serializable

        # The app client ID.

        @[JSON::Field(key: "appClientId")]
        getter app_client_id : String

        # The user pool ARN.

        @[JSON::Field(key: "userPoolArn")]
        getter user_pool_arn : String

        # The user pool domain.

        @[JSON::Field(key: "userPoolDomain")]
        getter user_pool_domain : String

        def initialize(
          @app_client_id : String,
          @user_pool_arn : String,
          @user_pool_domain : String
        )
        end
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request. See the accompanying
      # error message for details.

      struct ConflictException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The resource identifier.

      struct ConflictExceptionResponseContent
        include JSON::Serializable

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents a CORS configuration. Supported only for HTTP APIs. See Configuring CORS for more
      # information.

      struct Cors
        include JSON::Serializable

        # Specifies whether credentials are included in the CORS request. Supported only for HTTP APIs.

        @[JSON::Field(key: "allowCredentials")]
        getter allow_credentials : Bool?

        # Represents a collection of allowed headers. Supported only for HTTP APIs.

        @[JSON::Field(key: "allowHeaders")]
        getter allow_headers : Array(String)?

        # Represents a collection of allowed HTTP methods. Supported only for HTTP APIs.

        @[JSON::Field(key: "allowMethods")]
        getter allow_methods : Array(String)?

        # Represents a collection of allowed origins. Supported only for HTTP APIs.

        @[JSON::Field(key: "allowOrigins")]
        getter allow_origins : Array(String)?

        # Represents a collection of exposed headers. Supported only for HTTP APIs.

        @[JSON::Field(key: "exposeHeaders")]
        getter expose_headers : Array(String)?

        # The number of seconds that the browser should cache preflight request results. Supported only for
        # HTTP APIs.

        @[JSON::Field(key: "maxAge")]
        getter max_age : Int32?

        def initialize(
          @allow_credentials : Bool? = nil,
          @allow_headers : Array(String)? = nil,
          @allow_methods : Array(String)? = nil,
          @allow_origins : Array(String)? = nil,
          @expose_headers : Array(String)? = nil,
          @max_age : Int32? = nil
        )
        end
      end

      # Represents the input parameters for a CreateApi request.

      struct CreateApiInput
        include JSON::Serializable

        # The name of the API.

        @[JSON::Field(key: "name")]
        getter name : String

        # The API protocol.

        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String

        # An API key selection expression. Supported only for WebSocket APIs. See API Key Selection
        # Expressions .

        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?

        # A CORS configuration. Supported only for HTTP APIs. See Configuring CORS for more information.

        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?

        # This property is part of quick create. It specifies the credentials required for the integration, if
        # any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway
        # to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be
        # passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on
        # supported Amazon Web Services services, specify null. Currently, this property is not used for HTTP
        # integrations. Supported only for HTTP APIs.

        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?

        # The description of the API.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether clients can invoke your API by using the default execute-api endpoint. By default,
        # clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com
        # endpoint. To require that clients use a custom domain name to invoke your API, disable the default
        # endpoint.

        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?

        # Avoid validating models when creating a deployment. Supported only for WebSocket APIs.

        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?

        # This property is part of quick create. If you don't specify a routeKey, a default route of $default
        # is created. The $default route acts as a catch-all for any request made to your API, for a
        # particular stage. The $default route key can't be modified. You can add routes after creating the
        # API, and you can update the route keys of additional routes. Supported only for HTTP APIs.

        @[JSON::Field(key: "routeKey")]
        getter route_key : String?

        # The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be
        # ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This
        # property is required for WebSocket APIs.

        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # This property is part of quick create. Quick create produces an API with an integration, a default
        # catch-all route, and a default stage which is configured to automatically deploy changes. For HTTP
        # integrations, specify a fully qualified URL. For Lambda integrations, specify a function ARN. The
        # type of the integration will be HTTP_PROXY or AWS_PROXY, respectively. Supported only for HTTP APIs.

        @[JSON::Field(key: "target")]
        getter target : String?

        # A version identifier for the API.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String,
          @protocol_type : String,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @route_key : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Represents the input parameters for a CreateApiMapping request.

      struct CreateApiMappingInput
        include JSON::Serializable

        # The API identifier.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The API stage.

        @[JSON::Field(key: "stage")]
        getter stage : String

        # The API mapping key.

        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?

        def initialize(
          @api_id : String,
          @stage : String,
          @api_mapping_key : String? = nil
        )
        end
      end


      struct CreateApiMappingRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "stage")]
        getter stage : String


        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?

        def initialize(
          @api_id : String,
          @domain_name : String,
          @stage : String,
          @api_mapping_key : String? = nil
        )
        end
      end


      struct CreateApiMappingResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String?


        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?


        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @api_id : String? = nil,
          @api_mapping_id : String? = nil,
          @api_mapping_key : String? = nil,
          @stage : String? = nil
        )
        end
      end


      struct CreateApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "routeKey")]
        getter route_key : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "target")]
        getter target : String?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String,
          @protocol_type : String,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @ip_address_type : String? = nil,
          @route_key : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct CreateApiResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiEndpoint")]
        getter api_endpoint : String?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "importInfo")]
        getter import_info : Array(String)?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "version")]
        getter version : String?


        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @api_endpoint : String? = nil,
          @api_gateway_managed : Bool? = nil,
          @api_id : String? = nil,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @import_info : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @protocol_type : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # Represents the input parameters for a CreateAuthorizer request.

      struct CreateAuthorizerInput
        include JSON::Serializable

        # The authorizer type. Specify REQUEST for a Lambda function using incoming request parameters.
        # Specify JWT to use JSON Web Tokens (supported only for HTTP APIs).

        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String

        # The identity source for which authorization is requested. For a REQUEST authorizer, this is
        # optional. The value is a set of one or more mapping expressions of the specified request parameters.
        # The identity source can be headers, query string parameters, stage variables, and context
        # parameters. For example, if an Auth header and a Name query string parameter are defined as identity
        # sources, this value is route.request.header.Auth, route.request.querystring.Name for WebSocket APIs.
        # For HTTP APIs, use selection expressions prefixed with $, for example, $request.header.Auth,
        # $request.querystring.Name. These parameters are used to perform runtime validation for Lambda-based
        # authorizers by verifying all of the identity-related request parameters are present in the request,
        # not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda
        # function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function. For
        # HTTP APIs, identity sources are also used as the cache key when caching is enabled. To learn more,
        # see Working with Amazon Web Services Lambda authorizers for HTTP APIs . For JWT, a single entry that
        # specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only
        # header-based and query parameter-based selections are supported, for example
        # $request.header.Authorization.

        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)

        # The name of the authorizer.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To
        # specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
        # resource-based permissions on the Lambda function, don't specify this parameter. Supported only for
        # REQUEST authorizers.

        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?

        # Specifies the format of the payload sent to an HTTP API Lambda authorizer. Required for HTTP API
        # Lambda authorizers. Supported values are 1.0 and 2.0. To learn more, see Working with Amazon Web
        # Services Lambda authorizers for HTTP APIs .

        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?

        # The time to live (TTL) for cached authorizer results, in seconds. If it equals 0, authorization
        # caching is disabled. If it is greater than 0, API Gateway caches authorizer responses. The maximum
        # value is 3600, or 1 hour. Supported only for HTTP API Lambda authorizers.

        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?

        # The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a
        # well-formed Lambda function URI, for example,
        # arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2: {account_id}
        # :function: {lambda_function_name} /invocations. In general, the URI has this form:
        # arn:aws:apigateway: {region} :lambda:path/ {service_api} replaceable/>{region} is the same as the
        # region hosting the Lambda function, path indicates that the remaining substring in the URI should be
        # treated as the path to the resource, including the initial /. For Lambda functions, this is usually
        # of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.

        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?

        # Specifies whether a Lambda authorizer returns a response in a simple format. By default, a Lambda
        # authorizer must return an IAM policy. If enabled, the Lambda authorizer can return a boolean value
        # instead of an IAM policy. Supported only for HTTP APIs. To learn more, see Working with Amazon Web
        # Services Lambda authorizers for HTTP APIs .

        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?

        # This parameter is not used.

        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?

        # Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported
        # only for HTTP APIs.

        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?

        def initialize(
          @authorizer_type : String,
          @identity_source : Array(String),
          @name : String,
          @authorizer_credentials_arn : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil
        )
        end
      end


      struct CreateAuthorizerRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String


        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?


        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?


        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?


        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?


        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?


        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?


        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?

        def initialize(
          @api_id : String,
          @authorizer_type : String,
          @identity_source : Array(String),
          @name : String,
          @authorizer_credentials_arn : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil
        )
        end
      end


      struct CreateAuthorizerResponse
        include JSON::Serializable


        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?


        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?


        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String?


        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?


        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?


        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)?


        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?


        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @authorizer_credentials_arn : String? = nil,
          @authorizer_id : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_type : String? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_source : Array(String)? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents the input parameters for a CreateDeployment request.

      struct CreateDeploymentInput
        include JSON::Serializable

        # The description for the deployment resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of an existing stage to associate with the deployment.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @description : String? = nil,
          @stage_name : String? = nil
        )
        end
      end


      struct CreateDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @api_id : String,
          @description : String? = nil,
          @stage_name : String? = nil
        )
        end
      end


      struct CreateDeploymentResponse
        include JSON::Serializable


        @[JSON::Field(key: "autoDeployed")]
        getter auto_deployed : Bool?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?


        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @auto_deployed : Bool? = nil,
          @created_date : Time? = nil,
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @deployment_status_message : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Represents the input parameters for a CreateDomainName request.

      struct CreateDomainNameInput
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The domain name configurations.

        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?

        # The mutual TLS authentication configuration for a custom domain name.

        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthenticationInput?

        # The routing mode API Gateway uses to route traffic to your APIs.

        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?

        # The collection of tags associated with a domain name.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
          @routing_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDomainNameRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?


        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthenticationInput?


        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
          @routing_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateDomainNameResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiMappingSelectionExpression")]
        getter api_mapping_selection_expression : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?


        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?


        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthentication?


        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_mapping_selection_expression : String? = nil,
          @domain_name : String? = nil,
          @domain_name_arn : String? = nil,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthentication? = nil,
          @routing_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input parameters for a CreateIntegration request.

      struct CreateIntegrationInput
        include JSON::Serializable

        # The integration type of an integration. One of the following: AWS: for integrating the route or
        # method request with an Amazon Web Services service action, including the Lambda function-invoking
        # action. With the Lambda function-invoking action, this is referred to as the Lambda custom
        # integration. With any other Amazon Web Services service action, this is known as Amazon Web Services
        # integration. Supported only for WebSocket APIs. AWS_PROXY: for integrating the route or method
        # request with a Lambda function or other Amazon Web Services service action. This integration is also
        # referred to as a Lambda proxy integration. HTTP: for integrating the route or method request with an
        # HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only
        # for WebSocket APIs. HTTP_PROXY: for integrating the route or method request with an HTTP endpoint,
        # with the client request passed through as-is. This is also referred to as HTTP proxy integration.
        # For HTTP API private integrations, use an HTTP_PROXY integration. MOCK: for integrating the route or
        # method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported
        # only for WebSocket APIs.

        @[JSON::Field(key: "integrationType")]
        getter integration_type : String

        # The ID of the VPC link for a private integration. Supported only for HTTP APIs.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The type of the network connection to the integration endpoint. Specify INTERNET for connections
        # through the public routable internet or VPC_LINK for private connections between API Gateway and
        # resources in a VPC. The default value is INTERNET.

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # Supported only for WebSocket APIs. Specifies how to handle response payload content type
        # conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following
        # behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the
        # corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
        # Base64-encoded string. If this property is not defined, the response payload will be passed through
        # from the integration response to the route response or method response without modification.

        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?

        # Specifies the credentials required for the integration, if any. For Amazon Web Services
        # integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the
        # role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the
        # request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported
        # Amazon Web Services services, don't specify this parameter.

        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?

        # The description of the integration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the integration's HTTP method type. For WebSocket APIs, if you use a Lambda integration,
        # you must set the integration method to POST.

        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?

        # Supported only for HTTP API AWS_PROXY integrations. Specifies the Amazon Web Services service action
        # to invoke. To learn more, see Integration subtype reference .

        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?

        # For a Lambda integration, specify the URI of a Lambda function. For an HTTP integration, specify a
        # fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load
        # Balancer listener, Network Load Balancer listener, or Amazon Web Services Cloud Map service. If you
        # specify the ARN of an Amazon Web Services Cloud Map service, API Gateway uses DiscoverInstances to
        # identify resources. You can use query parameters to target specific resources. To learn more, see
        # DiscoverInstances . For private integrations, all resources must be owned by the same Amazon Web
        # Services account.

        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?

        # Specifies the pass-through behavior for incoming requests based on the Content-Type header in the
        # request, and the available mapping templates specified as the requestTemplates property on the
        # Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
        # Supported only for WebSocket APIs. WHEN_NO_MATCH passes the request body for unmapped content types
        # through to the integration backend without transformation. NEVER rejects unmapped content types with
        # an HTTP 415 Unsupported Media Type response. WHEN_NO_TEMPLATES allows pass-through when the
        # integration has no content types mapped to templates. However, if there is at least one content type
        # defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type
        # response.

        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?

        # Specifies the format of the payload sent to an integration. Required for HTTP APIs. For HTTP APIs,
        # supported values for Lambda proxy integrations are 1.0 and 2.0. For all other integrations, 1.0 is
        # the only supported value. To learn more, see Working with Amazon Web Services Lambda proxy
        # integrations for HTTP APIs .

        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?

        # For WebSocket APIs, a key-value map specifying request parameters that are passed from the method
        # request to the backend. The key is an integration request parameter name and the associated value is
        # a method request parameter value or static value that must be enclosed within single quotes and
        # pre-encoded as required by the backend. The method request parameter value must match the pattern of
        # method.request. {location} . {name} , where {location} is querystring, path, or header; and {name}
        # must be a valid and unique method request parameter name. For HTTP API integrations with a specified
        # integrationSubtype, request parameters are a key-value map specifying parameters that are passed to
        # AWS_PROXY integrations. You can provide static values, or map request data, stage variables, or
        # context variables that are evaluated at runtime. To learn more, see Working with Amazon Web Services
        # service integrations for HTTP APIs . For HTTP API integrations without a specified
        # integrationSubtype request parameters are a key-value map specifying how to transform HTTP requests
        # before sending them to the backend. The key should follow the pattern
        # &lt;action>:&lt;header|querystring|path>.&lt;location> where action can be append, overwrite or
        # remove. For values, you can provide static values, or map request data, stage variables, or context
        # variables that are evaluated at runtime. To learn more, see Transforming API requests and responses
        # .

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?

        # Represents a map of Velocity templates that are applied on the request payload based on the value of
        # the Content-Type header sent by the client. The content type value is the key in this map, and the
        # template (as a String) is the value. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?

        # Supported only for HTTP APIs. You use response parameters to transform the HTTP response from a
        # backend integration before returning the response to clients. Specify a key-value map from a
        # selection key to response parameters. The selection key must be a valid HTTP status code within the
        # range of 200-599. Response parameters are a key-value map. The key must match the pattern
        # &lt;action>:&lt;header>.&lt;location> or overwrite.statuscode. The action can be append, overwrite
        # or remove. The value can be a static value, or map to response data, stage variables, or context
        # variables that are evaluated at runtime. To learn more, see Transforming API requests and responses
        # .

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?

        # The template selection expression for the integration.

        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        # Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000
        # milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for
        # HTTP APIs.

        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?

        # The TLS configuration for a private integration. If you specify a TLS configuration, private
        # integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.

        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfigInput?

        def initialize(
          @integration_type : String,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_method : String? = nil,
          @integration_subtype : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfigInput? = nil
        )
        end
      end


      struct CreateIntegrationRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationType")]
        getter integration_type : String


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?


        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?


        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?


        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?


        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?


        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?


        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?


        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?


        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfigInput?

        def initialize(
          @api_id : String,
          @integration_type : String,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_method : String? = nil,
          @integration_subtype : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfigInput? = nil
        )
        end
      end

      # Represents the input parameters for a CreateIntegrationResponse request.

      struct CreateIntegrationResponseInput
        include JSON::Serializable

        # The integration response key.

        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String

        # Specifies how to handle response payload content type conversions. Supported values are
        # CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following behaviors: CONVERT_TO_BINARY: Converts a
        # response payload from a Base64-encoded string to the corresponding binary blob. CONVERT_TO_TEXT:
        # Converts a response payload from a binary blob to a Base64-encoded string. If this property is not
        # defined, the response payload will be passed through from the integration response to the route
        # response or method response without modification.

        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?

        # A key-value map specifying response parameters that are passed to the method response from the
        # backend. The key is a method response header parameter name and the mapped value is an integration
        # response header value, a static value enclosed within a pair of single quotes, or a JSON expression
        # from the integration response body. The mapping key must match the pattern of
        # method.response.header.{name}, where {name} is a valid and unique header name. The mapped non-static
        # value must match the pattern of integration.response.header.{name} or
        # integration.response.body.{JSON-expression}, where {name} is a valid and unique response header name
        # and {JSON-expression} is a valid JSON expression without the $ prefix.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # The collection of response templates for the integration response as a string-to-string map of
        # key-value pairs. Response templates are represented as a key/value map, with a content-type as the
        # key and a template as the value.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # The template selection expression for the integration response. Supported only for WebSocket APIs.

        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @integration_response_key : String,
          @content_handling_strategy : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct CreateIntegrationResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String


        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?


        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @api_id : String,
          @integration_id : String,
          @integration_response_key : String,
          @content_handling_strategy : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct CreateIntegrationResponseResponse
        include JSON::Serializable


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String?


        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?


        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @content_handling_strategy : String? = nil,
          @integration_response_id : String? = nil,
          @integration_response_key : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct CreateIntegrationResult
        include JSON::Serializable


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?


        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String?


        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?


        @[JSON::Field(key: "integrationResponseSelectionExpression")]
        getter integration_response_selection_expression : String?


        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?


        @[JSON::Field(key: "integrationType")]
        getter integration_type : String?


        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?


        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?


        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?


        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?


        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?


        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_id : String? = nil,
          @integration_method : String? = nil,
          @integration_response_selection_expression : String? = nil,
          @integration_subtype : String? = nil,
          @integration_type : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfig? = nil
        )
        end
      end

      # Represents the input parameters for a CreateModel request.

      struct CreateModelInput
        include JSON::Serializable

        # The name of the model. Must be alphanumeric.

        @[JSON::Field(key: "name")]
        getter name : String

        # The schema for the model. For application/json models, this should be JSON schema draft 4 model.

        @[JSON::Field(key: "schema")]
        getter schema : String

        # The content-type for the model, for example, "application/json".

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The description of the model.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @schema : String,
          @content_type : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateModelRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "schema")]
        getter schema : String


        @[JSON::Field(key: "contentType")]
        getter content_type : String?


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @api_id : String,
          @name : String,
          @schema : String,
          @content_type : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct CreateModelResponse
        include JSON::Serializable


        @[JSON::Field(key: "contentType")]
        getter content_type : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modelId")]
        getter model_id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @content_type : String? = nil,
          @description : String? = nil,
          @model_id : String? = nil,
          @name : String? = nil,
          @schema : String? = nil
        )
        end
      end


      struct CreatePortalProductRequest
        include JSON::Serializable


        @[JSON::Field(key: "displayName")]
        getter display_name : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Creates a portal product.

      struct CreatePortalProductRequestContent
        include JSON::Serializable

        # The name of the portal product as it appears in a published portal.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # A description of the portal product.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePortalProductResponse
        include JSON::Serializable


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String?


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @display_order : Types::DisplayOrder? = nil,
          @last_modified : Time? = nil,
          @portal_product_arn : String? = nil,
          @portal_product_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Creates a portal product.

      struct CreatePortalProductResponseContent
        include JSON::Serializable

        # The display name for the portal product.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The timestamp when the portal product was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal product.

        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String

        # The portal product identifier.

        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        # A description of the portal product.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The visual ordering of the product pages and product REST endpoint pages in a published portal.

        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @last_modified : Time,
          @portal_product_arn : String,
          @portal_product_id : String,
          @description : String? = nil,
          @display_order : Types::DisplayOrder? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization


        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationRequest


        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent


        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?


        @[JSON::Field(key: "logoUri")]
        getter logo_uri : String?


        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization,
          @endpoint_configuration : Types::EndpointConfigurationRequest,
          @portal_content : Types::PortalContent,
          @included_portal_product_arns : Array(String)? = nil,
          @logo_uri : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Creates a portal.

      struct CreatePortalRequestContent
        include JSON::Serializable

        # The authentication configuration for the portal.

        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization

        # The domain configuration for the portal. Use a default domain provided by API Gateway or provide a
        # fully-qualified domain name that you own.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationRequest

        # The content of the portal.

        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent

        # The ARNs of the portal products included in the portal.

        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?

        # The URI for the portal logo image that is displayed in the portal header.

        @[JSON::Field(key: "logoUri")]
        getter logo_uri : String?

        # The name of the Amazon CloudWatch RUM app monitor for the portal.

        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization,
          @endpoint_configuration : Types::EndpointConfigurationRequest,
          @portal_content : Types::PortalContent,
          @included_portal_product_arns : Array(String)? = nil,
          @logo_uri : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreatePortalResponse
        include JSON::Serializable


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse?


        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?


        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?


        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String?


        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent?


        @[JSON::Field(key: "portalId")]
        getter portal_id : String?


        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?


        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?


        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization? = nil,
          @endpoint_configuration : Types::EndpointConfigurationResponse? = nil,
          @included_portal_product_arns : Array(String)? = nil,
          @last_modified : Time? = nil,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @portal_arn : String? = nil,
          @portal_content : Types::PortalContent? = nil,
          @portal_id : String? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Creates a portal.

      struct CreatePortalResponseContent
        include JSON::Serializable

        # The authorization for the portal. Supports Cognito-based user authentication or no authentication.

        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization

        # The endpoint configuration.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse

        # The ARNs of the portal products included in the portal.

        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)

        # The timestamp when the portal configuration was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal.

        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # The name, description, and theme for the portal.

        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent

        # The portal identifier.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The timestamp when the portal was last published.

        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?

        # A user-written description of the changes made in the last published version of the portal.

        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?

        # The current publishing status of the portal.

        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?

        # The name of the Amazon CloudWatch RUM app monitor.

        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        # Error information for failed portal operations. Contains details about any issues encountered during
        # portal creation or publishing.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization,
          @endpoint_configuration : Types::EndpointConfigurationResponse,
          @included_portal_product_arns : Array(String),
          @last_modified : Time,
          @portal_arn : String,
          @portal_content : Types::PortalContent,
          @portal_id : String,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProductPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        def initialize(
          @display_content : Types::DisplayContent,
          @portal_product_id : String
        )
        end
      end

      # Creates a product page.

      struct CreateProductPageRequestContent
        include JSON::Serializable

        # The content of the product page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent

        def initialize(
          @display_content : Types::DisplayContent
        )
        end
      end


      struct CreateProductPageResponse
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String?


        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String?

        def initialize(
          @display_content : Types::DisplayContent? = nil,
          @last_modified : Time? = nil,
          @product_page_arn : String? = nil,
          @product_page_id : String? = nil
        )
        end
      end

      # Creates a product page.

      struct CreateProductPageResponseContent
        include JSON::Serializable

        # The timestamp when the product page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product page.

        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String

        # The product page identifier.

        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String

        # The content of the product page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?

        def initialize(
          @last_modified : Time,
          @product_page_arn : String,
          @product_page_id : String,
          @display_content : Types::DisplayContent? = nil
        )
        end
      end


      struct CreateProductRestEndpointPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContent?


        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @portal_product_id : String,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier,
          @display_content : Types::EndpointDisplayContent? = nil,
          @try_it_state : String? = nil
        )
        end
      end

      # Creates a product REST endpoint page.

      struct CreateProductRestEndpointPageRequestContent
        include JSON::Serializable

        # The REST endpoint identifier.

        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier

        # The content of the product REST endpoint page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContent?

        # The try it state of the product REST endpoint page.

        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @rest_endpoint_identifier : Types::RestEndpointIdentifier,
          @display_content : Types::EndpointDisplayContent? = nil,
          @try_it_state : String? = nil
        )
        end
      end


      struct CreateProductRestEndpointPageResponse
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContentResponse?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String?


        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String?


        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?


        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @display_content : Types::EndpointDisplayContentResponse? = nil,
          @last_modified : Time? = nil,
          @product_rest_endpoint_page_arn : String? = nil,
          @product_rest_endpoint_page_id : String? = nil,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier? = nil,
          @status : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @try_it_state : String? = nil
        )
        end
      end

      # Creates a product REST endpoint page.

      struct CreateProductRestEndpointPageResponseContent
        include JSON::Serializable

        # The display content.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContentResponse

        # The timestamp when the product REST endpoint page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product REST endpoint page.

        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String

        # The product REST endpoint page identifier.

        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String

        # The REST endpoint identifier.

        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier

        # The status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The try it state.

        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        def initialize(
          @display_content : Types::EndpointDisplayContentResponse,
          @last_modified : Time,
          @product_rest_endpoint_page_arn : String,
          @product_rest_endpoint_page_id : String,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier,
          @status : String,
          @try_it_state : String,
          @status_exception : Types::StatusException? = nil
        )
        end
      end

      # Represents the input parameters for a CreateRoute request.

      struct CreateRouteInput
        include JSON::Serializable

        # The route key for the route. For HTTP APIs, the route key can be either $default, or a combination
        # of an HTTP method and resource path, for example, GET /pets.

        @[JSON::Field(key: "routeKey")]
        getter route_key : String

        # Specifies whether an API key is required for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?

        # The authorization scopes supported by this route.

        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?

        # The authorization type for the route. For WebSocket APIs, valid values are NONE for open access,
        # AWS_IAM for using Amazon Web Services IAM permissions, and CUSTOM for using a Lambda authorizer. For
        # HTTP APIs, valid values are NONE for open access, JWT for using JSON Web Tokens, AWS_IAM for using
        # Amazon Web Services IAM permissions, and CUSTOM for using a Lambda authorizer.

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?

        # The identifier of the Authorizer resource to be associated with this route. The authorizer
        # identifier is generated by API Gateway when you created the authorizer.

        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?

        # The model selection expression for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?

        # The operation name for the route.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # The request models for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?

        # The request parameters for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?

        # The route response selection expression for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?

        # The target for the route.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @route_key : String,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct CreateRouteRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeKey")]
        getter route_key : String


        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?


        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?


        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "operationName")]
        getter operation_name : String?


        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?


        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_id : String,
          @route_key : String,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end

      # Represents the input parameters for an CreateRouteResponse request.

      struct CreateRouteResponseInput
        include JSON::Serializable

        # The route response key.

        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String

        # The model selection expression for the route response. Supported only for WebSocket APIs.

        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?

        # The response models for the route response.

        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?

        # The route response parameters.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?

        def initialize(
          @route_response_key : String,
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil
        )
        end
      end


      struct CreateRouteResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String


        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?

        def initialize(
          @api_id : String,
          @route_id : String,
          @route_response_key : String,
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil
        )
        end
      end


      struct CreateRouteResponseResponse
        include JSON::Serializable


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String?


        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String?

        def initialize(
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_id : String? = nil,
          @route_response_key : String? = nil
        )
        end
      end


      struct CreateRouteResult
        include JSON::Serializable


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?


        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?


        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "operationName")]
        getter operation_name : String?


        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeId")]
        getter route_id : String?


        @[JSON::Field(key: "routeKey")]
        getter route_key : String?


        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?


        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_id : String? = nil,
          @route_key : String? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct CreateRoutingRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)


        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "priority")]
        getter priority : Int32


        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @actions : Array(Types::RoutingRuleAction),
          @conditions : Array(Types::RoutingRuleCondition),
          @domain_name : String,
          @priority : Int32,
          @domain_name_id : String? = nil
        )
        end
      end


      struct CreateRoutingRuleResponse
        include JSON::Serializable


        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)?


        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)?


        @[JSON::Field(key: "priority")]
        getter priority : Int32?


        @[JSON::Field(key: "routingRuleArn")]
        getter routing_rule_arn : String?


        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String?

        def initialize(
          @actions : Array(Types::RoutingRuleAction)? = nil,
          @conditions : Array(Types::RoutingRuleCondition)? = nil,
          @priority : Int32? = nil,
          @routing_rule_arn : String? = nil,
          @routing_rule_id : String? = nil
        )
        end
      end

      # Represents the input parameters for a CreateStage request.

      struct CreateStageInput
        include JSON::Serializable

        # The name of the stage.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # Settings for logging access in this stage.

        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?

        # Specifies whether updates to an API automatically trigger a new deployment. The default value is
        # false.

        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?

        # The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.

        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?

        # The default route settings for the stage.

        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?

        # The deployment identifier of the API stage.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The description for the API stage.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Route settings for the stage, by routeKey.

        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?

        # A map that defines the stage variables for a Stage. Variable names can have alphanumeric and
        # underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.

        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @stage_name : String,
          @access_log_settings : Types::AccessLogSettings? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_variables : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateStageRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String


        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?


        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?


        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?


        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?


        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_id : String,
          @stage_name : String,
          @access_log_settings : Types::AccessLogSettings? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_variables : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateStageResponse
        include JSON::Serializable


        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?


        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "lastDeploymentStatusMessage")]
        getter last_deployment_status_message : String?


        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?


        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?


        @[JSON::Field(key: "stageName")]
        getter stage_name : String?


        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_log_settings : Types::AccessLogSettings? = nil,
          @api_gateway_managed : Bool? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @created_date : Time? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @last_deployment_status_message : String? = nil,
          @last_updated_date : Time? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_name : String? = nil,
          @stage_variables : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input parameters for a CreateVpcLink request.

      struct CreateVpcLinkInput
        include JSON::Serializable

        # The name of the VPC link.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of subnet IDs to include in the VPC link.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # A list of security group IDs for the VPC link.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of tags.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateVpcLinkRequest
        include JSON::Serializable


        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)


        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @subnet_ids : Array(String),
          @security_group_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateVpcLinkResponse
        include JSON::Serializable


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?


        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String?


        @[JSON::Field(key: "vpcLinkStatus")]
        getter vpc_link_status : String?


        @[JSON::Field(key: "vpcLinkStatusMessage")]
        getter vpc_link_status_message : String?


        @[JSON::Field(key: "vpcLinkVersion")]
        getter vpc_link_version : String?

        def initialize(
          @created_date : Time? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_link_id : String? = nil,
          @vpc_link_status : String? = nil,
          @vpc_link_status_message : String? = nil,
          @vpc_link_version : String? = nil
        )
        end
      end

      # Represents custom colors for a published portal.

      struct CustomColors
        include JSON::Serializable

        # Represents the accent color.

        @[JSON::Field(key: "accentColor")]
        getter accent_color : String

        # Represents the background color.

        @[JSON::Field(key: "backgroundColor")]
        getter background_color : String

        # The errorValidationColor.

        @[JSON::Field(key: "errorValidationColor")]
        getter error_validation_color : String

        # Represents the header color.

        @[JSON::Field(key: "headerColor")]
        getter header_color : String

        # Represents the navigation color.

        @[JSON::Field(key: "navigationColor")]
        getter navigation_color : String

        # Represents the text color.

        @[JSON::Field(key: "textColor")]
        getter text_color : String

        def initialize(
          @accent_color : String,
          @background_color : String,
          @error_validation_color : String,
          @header_color : String,
          @navigation_color : String,
          @text_color : String
        )
        end
      end


      struct DeleteAccessLogSettingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @api_id : String,
          @stage_name : String
        )
        end
      end


      struct DeleteApiMappingRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String


        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @api_mapping_id : String,
          @domain_name : String
        )
        end
      end


      struct DeleteApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct DeleteAuthorizerRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String

        def initialize(
          @api_id : String,
          @authorizer_id : String
        )
        end
      end


      struct DeleteCorsConfigurationRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct DeleteDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @api_id : String,
          @deployment_id : String
        )
        end
      end


      struct DeleteDomainNameRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct DeleteIntegrationRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String

        def initialize(
          @api_id : String,
          @integration_id : String
        )
        end
      end


      struct DeleteIntegrationResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String


        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String

        def initialize(
          @api_id : String,
          @integration_id : String,
          @integration_response_id : String
        )
        end
      end


      struct DeleteModelRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @api_id : String,
          @model_id : String
        )
        end
      end


      struct DeletePortalProductRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        def initialize(
          @portal_product_id : String
        )
        end
      end


      struct DeletePortalProductSharingPolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        def initialize(
          @portal_product_id : String
        )
        end
      end


      struct DeletePortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        def initialize(
          @portal_id : String
        )
        end
      end


      struct DeleteProductPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String

        def initialize(
          @portal_product_id : String,
          @product_page_id : String
        )
        end
      end


      struct DeleteProductRestEndpointPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String

        def initialize(
          @portal_product_id : String,
          @product_rest_endpoint_page_id : String
        )
        end
      end


      struct DeleteRouteRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String

        def initialize(
          @api_id : String,
          @route_id : String
        )
        end
      end


      struct DeleteRouteRequestParameterRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "requestParameterKey")]
        getter request_parameter_key : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String

        def initialize(
          @api_id : String,
          @request_parameter_key : String,
          @route_id : String
        )
        end
      end


      struct DeleteRouteResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String


        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String

        def initialize(
          @api_id : String,
          @route_id : String,
          @route_response_id : String
        )
        end
      end


      struct DeleteRouteSettingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeKey")]
        getter route_key : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @api_id : String,
          @route_key : String,
          @stage_name : String
        )
        end
      end


      struct DeleteRoutingRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String


        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @domain_name : String,
          @routing_rule_id : String,
          @domain_name_id : String? = nil
        )
        end
      end


      struct DeleteStageRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @api_id : String,
          @stage_name : String
        )
        end
      end


      struct DeleteVpcLinkRequest
        include JSON::Serializable


        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String

        def initialize(
          @vpc_link_id : String
        )
        end
      end


      struct DeleteVpcLinkResponse
        include JSON::Serializable

        def initialize
        end
      end

      # An immutable representation of an API that can be called by users. A Deployment must be associated
      # with a Stage for it to be callable over the internet.

      struct Deployment
        include JSON::Serializable

        # Specifies whether a deployment was automatically released.

        @[JSON::Field(key: "autoDeployed")]
        getter auto_deployed : Bool?

        # The date and time when the Deployment resource was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # The identifier for the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The status of the deployment: PENDING, FAILED, or SUCCEEDED.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?

        # May contain additional feedback on the status of an API deployment.

        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?

        # The description for the deployment.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @auto_deployed : Bool? = nil,
          @created_date : Time? = nil,
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @deployment_status_message : String? = nil,
          @description : String? = nil
        )
        end
      end

      # A collection resource that contains zero or more references to your existing deployments, and links
      # that guide you on how to interact with your collection. The collection offers a paginated view of
      # the contained deployments.

      struct Deployments
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Deployment)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Deployment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DisablePortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        def initialize(
          @portal_id : String
        )
        end
      end

      # The content of the product page.

      struct DisplayContent
        include JSON::Serializable

        # The body.

        @[JSON::Field(key: "body")]
        getter body : String

        # The title.

        @[JSON::Field(key: "title")]
        getter title : String

        def initialize(
          @body : String,
          @title : String
        )
        end
      end

      # Contains any values that override the default configuration generated from API Gateway.

      struct DisplayContentOverrides
        include JSON::Serializable

        # By default, this is the documentation of your REST API from API Gateway. You can provide custom
        # documentation to override this value.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The URL for your REST API. By default, API Gateway uses the default execute API endpoint. You can
        # provide a custom domain to override this value.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The operation name of the product REST endpoint.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        def initialize(
          @body : String? = nil,
          @endpoint : String? = nil,
          @operation_name : String? = nil
        )
        end
      end

      # The display order.

      struct DisplayOrder
        include JSON::Serializable

        # Represents a list of sections which include section name and list of product REST endpoints for a
        # product.

        @[JSON::Field(key: "contents")]
        getter contents : Array(Types::Section)?

        # The ARN of the overview page.

        @[JSON::Field(key: "overviewPageArn")]
        getter overview_page_arn : String?

        # The product page ARNs.

        @[JSON::Field(key: "productPageArns")]
        getter product_page_arns : Array(String)?

        def initialize(
          @contents : Array(Types::Section)? = nil,
          @overview_page_arn : String? = nil,
          @product_page_arns : Array(String)? = nil
        )
        end
      end

      # Represents a domain name.

      struct DomainName
        include JSON::Serializable

        # The name of the DomainName resource.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The API mapping selection expression.

        @[JSON::Field(key: "apiMappingSelectionExpression")]
        getter api_mapping_selection_expression : String?

        # The ARN of the DomainName resource.

        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?

        # The domain name configurations.

        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?

        # The mutual TLS authentication configuration for a custom domain name.

        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthentication?

        # The routing mode API Gateway uses to route traffic to your APIs.

        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?

        # The collection of tags associated with a domain name.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @domain_name : String,
          @api_mapping_selection_expression : String? = nil,
          @domain_name_arn : String? = nil,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthentication? = nil,
          @routing_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The domain name configuration.

      struct DomainNameConfiguration
        include JSON::Serializable

        # A domain name for the API.

        @[JSON::Field(key: "apiGatewayDomainName")]
        getter api_gateway_domain_name : String?

        # An Amazon Web Services-managed certificate that will be used by the edge-optimized endpoint for this
        # domain name. Amazon Web Services Certificate Manager is the only supported source.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The user-friendly name of the certificate that will be used by the edge-optimized endpoint for this
        # domain name.

        @[JSON::Field(key: "certificateName")]
        getter certificate_name : String?

        # The timestamp when the certificate that was used by edge-optimized endpoint for this domain name was
        # uploaded.

        @[JSON::Field(key: "certificateUploadDate")]
        getter certificate_upload_date : Time?

        # Identifies the status of a domain name migration. Statuses can have a value of AVAILABLE, UPDATING,
        # PENDING_CERTIFICATE_REIMPORT, or PENDING_OWNERSHIP VERIFICATION. A domain can be modified if its
        # status is AVAILABLE. If the domain's status is UPDATING, you must wait until the current operation
        # is complete.

        @[JSON::Field(key: "domainNameStatus")]
        getter domain_name_status : String?

        # An optional text message containing detailed information about status of the domain name migration.

        @[JSON::Field(key: "domainNameStatusMessage")]
        getter domain_name_status_message : String?

        # The endpoint type.

        @[JSON::Field(key: "endpointType")]
        getter endpoint_type : String?

        # The Amazon Route 53 Hosted Zone ID of the endpoint.

        @[JSON::Field(key: "hostedZoneId")]
        getter hosted_zone_id : String?

        # The IP address types that can invoke the domain name. Use ipv4 to allow only IPv4 addresses to
        # invoke your domain name, or use dualstack to allow both IPv4 and IPv6 addresses to invoke your
        # domain name.

        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The Amazon resource name (ARN) for the public certificate issued by Certificate Manager. This ARN is
        # used to validate custom domain ownership. It's required only if you configure mutual TLS and use
        # either an ACM-imported or a private CA certificate ARN as the regionalCertificateArn.

        @[JSON::Field(key: "ownershipVerificationCertificateArn")]
        getter ownership_verification_certificate_arn : String?

        # The Transport Layer Security (TLS) version of the security policy for this domain name. The valid
        # values are TLS_1_0 and TLS_1_2.

        @[JSON::Field(key: "securityPolicy")]
        getter security_policy : String?

        def initialize(
          @api_gateway_domain_name : String? = nil,
          @certificate_arn : String? = nil,
          @certificate_name : String? = nil,
          @certificate_upload_date : Time? = nil,
          @domain_name_status : String? = nil,
          @domain_name_status_message : String? = nil,
          @endpoint_type : String? = nil,
          @hosted_zone_id : String? = nil,
          @ip_address_type : String? = nil,
          @ownership_verification_certificate_arn : String? = nil,
          @security_policy : String? = nil
        )
        end
      end

      # Represents a collection of domain names.

      struct DomainNames
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::DomainName)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DomainName)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents an endpoint configuration.

      struct EndpointConfigurationRequest
        include JSON::Serializable

        # Represents a domain name and certificate for a portal.

        @[JSON::Field(key: "acmManaged")]
        getter acm_managed : Types::ACMManaged?

        # Use the default portal domain name that is generated and managed by API Gateway.

        @[JSON::Field(key: "none")]
        getter none : Types::None?

        def initialize(
          @acm_managed : Types::ACMManaged? = nil,
          @none : Types::None? = nil
        )
        end
      end

      # Represents an endpoint configuration.

      struct EndpointConfigurationResponse
        include JSON::Serializable

        # The portal default domain name. This domain name is generated and managed by API Gateway.

        @[JSON::Field(key: "portalDefaultDomainName")]
        getter portal_default_domain_name : String

        # The portal domain hosted zone identifier.

        @[JSON::Field(key: "portalDomainHostedZoneId")]
        getter portal_domain_hosted_zone_id : String

        # The ARN of the ACM certificate.

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String?

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        def initialize(
          @portal_default_domain_name : String,
          @portal_domain_hosted_zone_id : String,
          @certificate_arn : String? = nil,
          @domain_name : String? = nil
        )
        end
      end

      # Represents the endpoint display content.

      struct EndpointDisplayContent
        include JSON::Serializable

        # If your product REST endpoint contains no overrides, the none object is returned.

        @[JSON::Field(key: "none")]
        getter none : Types::None?

        # The overrides for endpoint display content.

        @[JSON::Field(key: "overrides")]
        getter overrides : Types::DisplayContentOverrides?

        def initialize(
          @none : Types::None? = nil,
          @overrides : Types::DisplayContentOverrides? = nil
        )
        end
      end

      # The product REST endpoint page.

      struct EndpointDisplayContentResponse
        include JSON::Serializable

        # The URL to invoke your REST API.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The API documentation.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The operation name.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        def initialize(
          @endpoint : String,
          @body : String? = nil,
          @operation_name : String? = nil
        )
        end
      end


      struct ExportApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "outputType")]
        getter output_type : String


        @[JSON::Field(key: "specification")]
        getter specification : String


        @[JSON::Field(key: "exportVersion")]
        getter export_version : String?


        @[JSON::Field(key: "includeExtensions")]
        getter include_extensions : Bool?


        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @api_id : String,
          @output_type : String,
          @specification : String,
          @export_version : String? = nil,
          @include_extensions : Bool? = nil,
          @stage_name : String? = nil
        )
        end
      end


      struct ExportApiResponse
        include JSON::Serializable


        @[JSON::Field(key: "body")]
        getter body : Bytes?

        def initialize(
          @body : Bytes? = nil
        )
        end
      end


      struct GetApiMappingRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String


        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @api_mapping_id : String,
          @domain_name : String
        )
        end
      end


      struct GetApiMappingResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String?


        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?


        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @api_id : String? = nil,
          @api_mapping_id : String? = nil,
          @api_mapping_key : String? = nil,
          @stage : String? = nil
        )
        end
      end


      struct GetApiMappingsRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetApiMappingsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::ApiMapping)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ApiMapping)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String

        def initialize(
          @api_id : String
        )
        end
      end


      struct GetApiResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiEndpoint")]
        getter api_endpoint : String?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "importInfo")]
        getter import_info : Array(String)?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "version")]
        getter version : String?


        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @api_endpoint : String? = nil,
          @api_gateway_managed : Bool? = nil,
          @api_id : String? = nil,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @import_info : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @protocol_type : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end


      struct GetApisRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetApisResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Api)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Api)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetAuthorizerRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String

        def initialize(
          @api_id : String,
          @authorizer_id : String
        )
        end
      end


      struct GetAuthorizerResponse
        include JSON::Serializable


        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?


        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?


        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String?


        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?


        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?


        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)?


        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?


        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @authorizer_credentials_arn : String? = nil,
          @authorizer_id : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_type : String? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_source : Array(String)? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil,
          @name : String? = nil
        )
        end
      end


      struct GetAuthorizersRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetAuthorizersResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Authorizer)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Authorizer)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @api_id : String,
          @deployment_id : String
        )
        end
      end


      struct GetDeploymentResponse
        include JSON::Serializable


        @[JSON::Field(key: "autoDeployed")]
        getter auto_deployed : Bool?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?


        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @auto_deployed : Bool? = nil,
          @created_date : Time? = nil,
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @deployment_status_message : String? = nil,
          @description : String? = nil
        )
        end
      end


      struct GetDeploymentsRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDeploymentsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Deployment)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Deployment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDomainNameRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        def initialize(
          @domain_name : String
        )
        end
      end


      struct GetDomainNameResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiMappingSelectionExpression")]
        getter api_mapping_selection_expression : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?


        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?


        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthentication?


        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_mapping_selection_expression : String? = nil,
          @domain_name : String? = nil,
          @domain_name_arn : String? = nil,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthentication? = nil,
          @routing_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetDomainNamesRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetDomainNamesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::DomainName)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::DomainName)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntegrationRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String

        def initialize(
          @api_id : String,
          @integration_id : String
        )
        end
      end


      struct GetIntegrationResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String


        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String

        def initialize(
          @api_id : String,
          @integration_id : String,
          @integration_response_id : String
        )
        end
      end


      struct GetIntegrationResponseResponse
        include JSON::Serializable


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String?


        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?


        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @content_handling_strategy : String? = nil,
          @integration_response_id : String? = nil,
          @integration_response_key : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct GetIntegrationResponsesRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @integration_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntegrationResponsesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::IntegrationResponse)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::IntegrationResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntegrationResult
        include JSON::Serializable


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?


        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String?


        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?


        @[JSON::Field(key: "integrationResponseSelectionExpression")]
        getter integration_response_selection_expression : String?


        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?


        @[JSON::Field(key: "integrationType")]
        getter integration_type : String?


        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?


        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?


        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?


        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?


        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?


        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_id : String? = nil,
          @integration_method : String? = nil,
          @integration_response_selection_expression : String? = nil,
          @integration_subtype : String? = nil,
          @integration_type : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfig? = nil
        )
        end
      end


      struct GetIntegrationsRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetIntegrationsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Integration)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Integration)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetModelRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @api_id : String,
          @model_id : String
        )
        end
      end


      struct GetModelResponse
        include JSON::Serializable


        @[JSON::Field(key: "contentType")]
        getter content_type : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modelId")]
        getter model_id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @content_type : String? = nil,
          @description : String? = nil,
          @model_id : String? = nil,
          @name : String? = nil,
          @schema : String? = nil
        )
        end
      end


      struct GetModelTemplateRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "modelId")]
        getter model_id : String

        def initialize(
          @api_id : String,
          @model_id : String
        )
        end
      end


      struct GetModelTemplateResponse
        include JSON::Serializable


        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end


      struct GetModelsRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetModelsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Model)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Model)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetPortalProductRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "resourceOwnerAccountId")]
        getter resource_owner_account_id : String?

        def initialize(
          @portal_product_id : String,
          @resource_owner_account_id : String? = nil
        )
        end
      end


      struct GetPortalProductResponse
        include JSON::Serializable


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String?


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @display_order : Types::DisplayOrder? = nil,
          @last_modified : Time? = nil,
          @portal_product_arn : String? = nil,
          @portal_product_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Gets a portal product.

      struct GetPortalProductResponseContent
        include JSON::Serializable

        # The description of a portal product.

        @[JSON::Field(key: "description")]
        getter description : String

        # The display name.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The display order.

        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder

        # The timestamp when the portal product was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal product.

        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String

        # The portal product identifier.

        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @display_name : String,
          @display_order : Types::DisplayOrder,
          @last_modified : Time,
          @portal_product_arn : String,
          @portal_product_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetPortalProductSharingPolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        def initialize(
          @portal_product_id : String
        )
        end
      end


      struct GetPortalProductSharingPolicyResponse
        include JSON::Serializable


        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String?


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String?

        def initialize(
          @policy_document : String? = nil,
          @portal_product_id : String? = nil
        )
        end
      end

      # Gets a product sharing policy.

      struct GetPortalProductSharingPolicyResponseContent
        include JSON::Serializable

        # The product sharing policy.

        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        # The portal product identifier.

        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        def initialize(
          @policy_document : String,
          @portal_product_id : String
        )
        end
      end


      struct GetPortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        def initialize(
          @portal_id : String
        )
        end
      end


      struct GetPortalResponse
        include JSON::Serializable


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse?


        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?


        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?


        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String?


        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent?


        @[JSON::Field(key: "portalId")]
        getter portal_id : String?


        @[JSON::Field(key: "preview")]
        getter preview : Types::Preview?


        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?


        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?


        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization? = nil,
          @endpoint_configuration : Types::EndpointConfigurationResponse? = nil,
          @included_portal_product_arns : Array(String)? = nil,
          @last_modified : Time? = nil,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @portal_arn : String? = nil,
          @portal_content : Types::PortalContent? = nil,
          @portal_id : String? = nil,
          @preview : Types::Preview? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Gets a portal.

      struct GetPortalResponseContent
        include JSON::Serializable

        # The authorization for the portal.

        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization

        # The endpoint configuration.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse

        # The ARNs of the portal products included in the portal.

        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)

        # The timestamp when the portal was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal.

        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # Contains the content that is visible to portal consumers including the themes, display names, and
        # description.

        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent

        # The portal identifier.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The timestamp when the portal was last published.

        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?

        # The publish description used when the portal was last published.

        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?

        # Represents the preview endpoint and the any possible error messages during preview generation.

        @[JSON::Field(key: "preview")]
        getter preview : Types::Preview?

        # The publish status of a portal.

        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?

        # The CloudWatch RUM app monitor name.

        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization,
          @endpoint_configuration : Types::EndpointConfigurationResponse,
          @included_portal_product_arns : Array(String),
          @last_modified : Time,
          @portal_arn : String,
          @portal_content : Types::PortalContent,
          @portal_id : String,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @preview : Types::Preview? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetProductPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String


        @[JSON::Field(key: "resourceOwnerAccountId")]
        getter resource_owner_account_id : String?

        def initialize(
          @portal_product_id : String,
          @product_page_id : String,
          @resource_owner_account_id : String? = nil
        )
        end
      end


      struct GetProductPageResponse
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String?


        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String?

        def initialize(
          @display_content : Types::DisplayContent? = nil,
          @last_modified : Time? = nil,
          @product_page_arn : String? = nil,
          @product_page_id : String? = nil
        )
        end
      end

      # Gets a product page.

      struct GetProductPageResponseContent
        include JSON::Serializable

        # The content of the product page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent

        # The timestamp when the product page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product page.

        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String

        # The product page identifier.

        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String

        def initialize(
          @display_content : Types::DisplayContent,
          @last_modified : Time,
          @product_page_arn : String,
          @product_page_id : String
        )
        end
      end


      struct GetProductRestEndpointPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String


        @[JSON::Field(key: "includeRawDisplayContent")]
        getter include_raw_display_content : String?


        @[JSON::Field(key: "resourceOwnerAccountId")]
        getter resource_owner_account_id : String?

        def initialize(
          @portal_product_id : String,
          @product_rest_endpoint_page_id : String,
          @include_raw_display_content : String? = nil,
          @resource_owner_account_id : String? = nil
        )
        end
      end


      struct GetProductRestEndpointPageResponse
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContentResponse?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String?


        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String?


        @[JSON::Field(key: "rawDisplayContent")]
        getter raw_display_content : String?


        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?


        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @display_content : Types::EndpointDisplayContentResponse? = nil,
          @last_modified : Time? = nil,
          @product_rest_endpoint_page_arn : String? = nil,
          @product_rest_endpoint_page_id : String? = nil,
          @raw_display_content : String? = nil,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier? = nil,
          @status : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @try_it_state : String? = nil
        )
        end
      end

      # Gets a product REST endpoint page.

      struct GetProductRestEndpointPageResponseContent
        include JSON::Serializable

        # The content of the product REST endpoint page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContentResponse

        # The timestamp when the product REST endpoint page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product REST endpoint page.

        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String

        # The product REST endpoint page identifier.

        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String

        # The REST endpoint identifier.

        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier

        # The status of the product REST endpoint page.

        @[JSON::Field(key: "status")]
        getter status : String

        # The try it state.

        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String

        # The raw display content of the product REST endpoint page.

        @[JSON::Field(key: "rawDisplayContent")]
        getter raw_display_content : String?

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        def initialize(
          @display_content : Types::EndpointDisplayContentResponse,
          @last_modified : Time,
          @product_rest_endpoint_page_arn : String,
          @product_rest_endpoint_page_id : String,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier,
          @status : String,
          @try_it_state : String,
          @raw_display_content : String? = nil,
          @status_exception : Types::StatusException? = nil
        )
        end
      end


      struct GetRouteRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String

        def initialize(
          @api_id : String,
          @route_id : String
        )
        end
      end


      struct GetRouteResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String


        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String

        def initialize(
          @api_id : String,
          @route_id : String,
          @route_response_id : String
        )
        end
      end


      struct GetRouteResponseResponse
        include JSON::Serializable


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String?


        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String?

        def initialize(
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_id : String? = nil,
          @route_response_key : String? = nil
        )
        end
      end


      struct GetRouteResponsesRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @route_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetRouteResponsesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::RouteResponse)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RouteResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetRouteResult
        include JSON::Serializable


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?


        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?


        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "operationName")]
        getter operation_name : String?


        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeId")]
        getter route_id : String?


        @[JSON::Field(key: "routeKey")]
        getter route_key : String?


        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?


        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_id : String? = nil,
          @route_key : String? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct GetRoutesRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetRoutesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Route)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Route)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetRoutingRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String


        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @domain_name : String,
          @routing_rule_id : String,
          @domain_name_id : String? = nil
        )
        end
      end


      struct GetRoutingRuleResponse
        include JSON::Serializable


        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)?


        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)?


        @[JSON::Field(key: "priority")]
        getter priority : Int32?


        @[JSON::Field(key: "routingRuleArn")]
        getter routing_rule_arn : String?


        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String?

        def initialize(
          @actions : Array(Types::RoutingRuleAction)? = nil,
          @conditions : Array(Types::RoutingRuleCondition)? = nil,
          @priority : Int32? = nil,
          @routing_rule_arn : String? = nil,
          @routing_rule_id : String? = nil
        )
        end
      end


      struct GetStageRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @api_id : String,
          @stage_name : String
        )
        end
      end


      struct GetStageResponse
        include JSON::Serializable


        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?


        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "lastDeploymentStatusMessage")]
        getter last_deployment_status_message : String?


        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?


        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?


        @[JSON::Field(key: "stageName")]
        getter stage_name : String?


        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_log_settings : Types::AccessLogSettings? = nil,
          @api_gateway_managed : Bool? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @created_date : Time? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @last_deployment_status_message : String? = nil,
          @last_updated_date : Time? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_name : String? = nil,
          @stage_variables : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetStagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @api_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetStagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::Stage)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Stage)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetTagsRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct GetTagsResponse
        include JSON::Serializable


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetVpcLinkRequest
        include JSON::Serializable


        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String

        def initialize(
          @vpc_link_id : String
        )
        end
      end


      struct GetVpcLinkResponse
        include JSON::Serializable


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?


        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String?


        @[JSON::Field(key: "vpcLinkStatus")]
        getter vpc_link_status : String?


        @[JSON::Field(key: "vpcLinkStatusMessage")]
        getter vpc_link_status_message : String?


        @[JSON::Field(key: "vpcLinkVersion")]
        getter vpc_link_version : String?

        def initialize(
          @created_date : Time? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_link_id : String? = nil,
          @vpc_link_status : String? = nil,
          @vpc_link_status_message : String? = nil,
          @vpc_link_version : String? = nil
        )
        end
      end


      struct GetVpcLinksRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetVpcLinksResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::VpcLink)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::VpcLink)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The identifier parts of a product REST endpoint.

      struct IdentifierParts
        include JSON::Serializable

        # The method of the product REST endpoint.

        @[JSON::Field(key: "method")]
        getter method : String

        # The path of the product REST endpoint.

        @[JSON::Field(key: "path")]
        getter path : String

        # The REST API ID of the product REST endpoint.

        @[JSON::Field(key: "restApiId")]
        getter rest_api_id : String

        # The stage of the product REST endpoint.

        @[JSON::Field(key: "stage")]
        getter stage : String

        def initialize(
          @method : String,
          @path : String,
          @rest_api_id : String,
          @stage : String
        )
        end
      end

      # Represents the input to ImportAPI. Supported only for HTTP APIs.

      struct ImportApiInput
        include JSON::Serializable

        # The OpenAPI definition. Supported only for HTTP APIs.

        @[JSON::Field(key: "body")]
        getter body : String

        def initialize(
          @body : String
        )
        end
      end


      struct ImportApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "body")]
        getter body : String


        @[JSON::Field(key: "basepath")]
        getter basepath : String?


        @[JSON::Field(key: "failOnWarnings")]
        getter fail_on_warnings : Bool?

        def initialize(
          @body : String,
          @basepath : String? = nil,
          @fail_on_warnings : Bool? = nil
        )
        end
      end


      struct ImportApiResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiEndpoint")]
        getter api_endpoint : String?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "importInfo")]
        getter import_info : Array(String)?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "version")]
        getter version : String?


        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @api_endpoint : String? = nil,
          @api_gateway_managed : Bool? = nil,
          @api_id : String? = nil,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @import_info : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @protocol_type : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # Represents an integration.

      struct Integration
        include JSON::Serializable

        # Specifies whether an integration is managed by API Gateway. If you created an API using using quick
        # create, the resulting integration is managed by API Gateway. You can update a managed integration,
        # but you can't delete it.

        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?

        # The ID of the VPC link for a private integration. Supported only for HTTP APIs.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The type of the network connection to the integration endpoint. Specify INTERNET for connections
        # through the public routable internet or VPC_LINK for private connections between API Gateway and
        # resources in a VPC. The default value is INTERNET.

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # Supported only for WebSocket APIs. Specifies how to handle response payload content type
        # conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following
        # behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the
        # corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
        # Base64-encoded string. If this property is not defined, the response payload will be passed through
        # from the integration response to the route response or method response without modification.

        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?

        # Specifies the credentials required for the integration, if any. For Amazon Web Services
        # integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the
        # role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the
        # request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported
        # Amazon Web Services services, don't specify this parameter.

        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?

        # Represents the description of an integration.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Represents the identifier of an integration.

        @[JSON::Field(key: "integrationId")]
        getter integration_id : String?

        # Specifies the integration's HTTP method type.

        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?

        # The integration response selection expression for the integration. Supported only for WebSocket
        # APIs. See Integration Response Selection Expressions .

        @[JSON::Field(key: "integrationResponseSelectionExpression")]
        getter integration_response_selection_expression : String?

        # Supported only for HTTP API AWS_PROXY integrations. Specifies the Amazon Web Services service action
        # to invoke. To learn more, see Integration subtype reference .

        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?

        # The integration type of an integration. One of the following: AWS: for integrating the route or
        # method request with an Amazon Web Services service action, including the Lambda function-invoking
        # action. With the Lambda function-invoking action, this is referred to as the Lambda custom
        # integration. With any other Amazon Web Services service action, this is known as Amazon Web Services
        # integration. Supported only for WebSocket APIs. AWS_PROXY: for integrating the route or method
        # request with a Lambda function or other Amazon Web Services service action. This integration is also
        # referred to as a Lambda proxy integration. HTTP: for integrating the route or method request with an
        # HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only
        # for WebSocket APIs. HTTP_PROXY: for integrating the route or method request with an HTTP endpoint,
        # with the client request passed through as-is. This is also referred to as HTTP proxy integration.
        # MOCK: for integrating the route or method request with API Gateway as a "loopback" endpoint without
        # invoking any backend. Supported only for WebSocket APIs.

        @[JSON::Field(key: "integrationType")]
        getter integration_type : String?

        # For a Lambda integration, specify the URI of a Lambda function. For an HTTP integration, specify a
        # fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load
        # Balancer listener, Network Load Balancer listener, or Amazon Web Services Cloud Map service. If you
        # specify the ARN of an Amazon Web Services Cloud Map service, API Gateway uses DiscoverInstances to
        # identify resources. You can use query parameters to target specific resources. To learn more, see
        # DiscoverInstances . For private integrations, all resources must be owned by the same Amazon Web
        # Services account.

        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?

        # Specifies the pass-through behavior for incoming requests based on the Content-Type header in the
        # request, and the available mapping templates specified as the requestTemplates property on the
        # Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
        # Supported only for WebSocket APIs. WHEN_NO_MATCH passes the request body for unmapped content types
        # through to the integration backend without transformation. NEVER rejects unmapped content types with
        # an HTTP 415 Unsupported Media Type response. WHEN_NO_TEMPLATES allows pass-through when the
        # integration has no content types mapped to templates. However, if there is at least one content type
        # defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type
        # response.

        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?

        # Specifies the format of the payload sent to an integration. Required for HTTP APIs. For HTTP APIs,
        # supported values for Lambda proxy integrations are 1.0 and 2.0. For all other integrations, 1.0 is
        # the only supported value. To learn more, see Working with Amazon Web Services Lambda proxy
        # integrations for HTTP APIs .

        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?

        # For WebSocket APIs, a key-value map specifying request parameters that are passed from the method
        # request to the backend. The key is an integration request parameter name and the associated value is
        # a method request parameter value or static value that must be enclosed within single quotes and
        # pre-encoded as required by the backend. The method request parameter value must match the pattern of
        # method.request. {location} . {name} , where {location} is querystring, path, or header; and {name}
        # must be a valid and unique method request parameter name. For HTTP API integrations with a specified
        # integrationSubtype, request parameters are a key-value map specifying parameters that are passed to
        # AWS_PROXY integrations. You can provide static values, or map request data, stage variables, or
        # context variables that are evaluated at runtime. To learn more, see Working with Amazon Web Services
        # service integrations for HTTP APIs . For HTTP API integrations without a specified
        # integrationSubtype request parameters are a key-value map specifying how to transform HTTP requests
        # before sending them to backend integrations. The key should follow the pattern
        # &lt;action>:&lt;header|querystring|path>.&lt;location>. The action can be append, overwrite or
        # remove. For values, you can provide static values, or map request data, stage variables, or context
        # variables that are evaluated at runtime. To learn more, see Transforming API requests and responses
        # .

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?

        # Represents a map of Velocity templates that are applied on the request payload based on the value of
        # the Content-Type header sent by the client. The content type value is the key in this map, and the
        # template (as a String) is the value. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?

        # Supported only for HTTP APIs. You use response parameters to transform the HTTP response from a
        # backend integration before returning the response to clients. Specify a key-value map from a
        # selection key to response parameters. The selection key must be a valid HTTP status code within the
        # range of 200-599. Response parameters are a key-value map. The key must match the pattern
        # &lt;action>:&lt;header>.&lt;location> or overwrite.statuscode. The action can be append, overwrite
        # or remove. The value can be a static value, or map to response data, stage variables, or context
        # variables that are evaluated at runtime. To learn more, see Transforming API requests and responses
        # .

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?

        # The template selection expression for the integration. Supported only for WebSocket APIs.

        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        # Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000
        # milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for
        # HTTP APIs.

        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?

        # The TLS configuration for a private integration. If you specify a TLS configuration, private
        # integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.

        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_id : String? = nil,
          @integration_method : String? = nil,
          @integration_response_selection_expression : String? = nil,
          @integration_subtype : String? = nil,
          @integration_type : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfig? = nil
        )
        end
      end

      # Represents an integration response.

      struct IntegrationResponse
        include JSON::Serializable

        # The integration response key.

        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String

        # Supported only for WebSocket APIs. Specifies how to handle response payload content type
        # conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following
        # behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the
        # corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
        # Base64-encoded string. If this property is not defined, the response payload will be passed through
        # from the integration response to the route response or method response without modification.

        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?

        # The integration response ID.

        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String?

        # A key-value map specifying response parameters that are passed to the method response from the
        # backend. The key is a method response header parameter name and the mapped value is an integration
        # response header value, a static value enclosed within a pair of single quotes, or a JSON expression
        # from the integration response body. The mapping key must match the pattern of
        # method.response.header.{name}, where name is a valid and unique header name. The mapped non-static
        # value must match the pattern of integration.response.header.{name} or
        # integration.response.body.{JSON-expression}, where name is a valid and unique response header name
        # and JSON-expression is a valid JSON expression without the $ prefix.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # The collection of response templates for the integration response as a string-to-string map of
        # key-value pairs. Response templates are represented as a key/value map, with a content-type as the
        # key and a template as the value.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # The template selection expressions for the integration response.

        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @integration_response_key : String,
          @content_handling_strategy : String? = nil,
          @integration_response_id : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end

      # Represents a collection of integration responses.

      struct IntegrationResponses
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::IntegrationResponse)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::IntegrationResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a collection of integrations.

      struct Integrations
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Integration)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Integration)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported
      # only for HTTP APIs.

      struct JWTConfiguration
        include JSON::Serializable

        # A list of the intended recipients of the JWT. A valid JWT must provide an aud that matches at least
        # one entry in this list. See RFC 7519 . Required for the JWT authorizer type. Supported only for HTTP
        # APIs.

        @[JSON::Field(key: "audience")]
        getter audience : Array(String)?

        # The base domain of the identity provider that issues JSON Web Tokens. For example, an Amazon Cognito
        # user pool has the following format: https://cognito-idp. {region} .amazonaws.com/ {userPoolId} .
        # Required for the JWT authorizer type. Supported only for HTTP APIs.

        @[JSON::Field(key: "issuer")]
        getter issuer : String?

        def initialize(
          @audience : Array(String)? = nil,
          @issuer : String? = nil
        )
        end
      end

      # A limit has been exceeded. See the accompanying error message for details.

      struct LimitExceededException
        include JSON::Serializable

        # The limit type.

        @[JSON::Field(key: "limitType")]
        getter limit_type : String?

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @limit_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The response content for limit exceeded exception.

      struct LimitExceededExceptionResponseContent
        include JSON::Serializable

        # The limit type of the limit exceeded exception response content.

        @[JSON::Field(key: "limitType")]
        getter limit_type : String?

        # The message of the limit exceeded exception response content.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @limit_type : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct ListPortalProductsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil,
          @resource_owner : String? = nil
        )
        end
      end


      struct ListPortalProductsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::PortalProductSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PortalProductSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Lists portal products.

      struct ListPortalProductsResponseContent
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::PortalProductSummary)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PortalProductSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPortalsRequest
        include JSON::Serializable


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPortalsResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::PortalSummary)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PortalSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Lists portals.

      struct ListPortalsResponseContent
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::PortalSummary)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::PortalSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProductPagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resourceOwnerAccountId")]
        getter resource_owner_account_id : String?

        def initialize(
          @portal_product_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil,
          @resource_owner_account_id : String? = nil
        )
        end
      end


      struct ListProductPagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProductPageSummaryNoBody)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProductPageSummaryNoBody)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Lists product pages.

      struct ListProductPagesResponseContent
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProductPageSummaryNoBody)

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProductPageSummaryNoBody),
          @next_token : String? = nil
        )
        end
      end


      struct ListProductRestEndpointPagesRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "maxResults")]
        getter max_results : String?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "resourceOwnerAccountId")]
        getter resource_owner_account_id : String?

        def initialize(
          @portal_product_id : String,
          @max_results : String? = nil,
          @next_token : String? = nil,
          @resource_owner_account_id : String? = nil
        )
        end
      end


      struct ListProductRestEndpointPagesResponse
        include JSON::Serializable


        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProductRestEndpointPageSummaryNoBody)?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProductRestEndpointPageSummaryNoBody)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Lists the product rest endpoint pages in a portal product.

      struct ListProductRestEndpointPagesResponseContent
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::ProductRestEndpointPageSummaryNoBody)

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::ProductRestEndpointPageSummaryNoBody),
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutingRulesRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?


        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @domain_name : String,
          @domain_name_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutingRulesResponse
        include JSON::Serializable


        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "routingRules")]
        getter routing_rules : Array(Types::RoutingRule)?

        def initialize(
          @next_token : String? = nil,
          @routing_rules : Array(Types::RoutingRule)? = nil
        )
        end
      end

      # Represents a data model for an API. Supported only for WebSocket APIs. See Create Models and Mapping
      # Templates for Request and Response Mappings .

      struct Model
        include JSON::Serializable

        # The name of the model. Must be alphanumeric.

        @[JSON::Field(key: "name")]
        getter name : String

        # The content-type for the model, for example, "application/json".

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The description of the model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The model identifier.

        @[JSON::Field(key: "modelId")]
        getter model_id : String?

        # The schema for the model. For application/json models, this should be JSON schema draft 4 model.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @name : String,
          @content_type : String? = nil,
          @description : String? = nil,
          @model_id : String? = nil,
          @schema : String? = nil
        )
        end
      end

      # Represents a collection of data models. See Create Models and Mapping Templates for Request and
      # Response Mappings .

      struct Models
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Model)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Model)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # If specified, API Gateway performs two-way authentication between the client and the server. Clients
      # must present a trusted certificate to access your API.

      struct MutualTlsAuthentication
        include JSON::Serializable

        # An Amazon S3 URL that specifies the truststore for mutual TLS authentication, for example, s3://
        # bucket-name / key-name . The truststore can contain certificates from public or private certificate
        # authorities. To update the truststore, upload a new version to S3, and then update your custom
        # domain name to use the new version. To update the truststore, you must have permissions to access
        # the S3 object.

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

      # If specified, API Gateway performs two-way authentication between the client and the server. Clients
      # must present a trusted certificate to access your API.

      struct MutualTlsAuthenticationInput
        include JSON::Serializable

        # An Amazon S3 URL that specifies the truststore for mutual TLS authentication, for example, s3://
        # bucket-name / key-name . The truststore can contain certificates from public or private certificate
        # authorities. To update the truststore, upload a new version to S3, and then update your custom
        # domain name to use the new version. To update the truststore, you must have permissions to access
        # the S3 object.

        @[JSON::Field(key: "truststoreUri")]
        getter truststore_uri : String?

        # The version of the S3 object that contains your truststore. To specify a version, you must have
        # versioning enabled for the S3 bucket.

        @[JSON::Field(key: "truststoreVersion")]
        getter truststore_version : String?

        def initialize(
          @truststore_uri : String? = nil,
          @truststore_version : String? = nil
        )
        end
      end

      # The none option.

      struct None
        include JSON::Serializable

        def initialize
        end
      end

      # The resource specified in the request was not found. See the message field for more information.

      struct NotFoundException
        include JSON::Serializable

        # Describes the error encountered.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The resource type.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The response content for not found exception.

      struct NotFoundExceptionResponseContent
        include JSON::Serializable

        # The message of the not found exception response content.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The resource type of the not found exception response content.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Validation constraints imposed on parameters of a request (path, query string, headers).

      struct ParameterConstraints
        include JSON::Serializable

        # Whether or not the parameter is required.

        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @required : Bool? = nil
        )
        end
      end

      # Contains the content that is visible to portal consumers including the themes, display names, and
      # description.

      struct PortalContent
        include JSON::Serializable

        # The display name for the portal.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The theme for the portal.

        @[JSON::Field(key: "theme")]
        getter theme : Types::PortalTheme

        # A description of the portal.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @display_name : String,
          @theme : Types::PortalTheme,
          @description : String? = nil
        )
        end
      end

      # Represents a portal product.

      struct PortalProductSummary
        include JSON::Serializable

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String

        # The display name of a portal product.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The timestamp when the portal product was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of a portal product.

        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String

        # The portal product identifier.

        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String,
          @display_name : String,
          @last_modified : Time,
          @portal_product_arn : String,
          @portal_product_id : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents a portal summary.

      struct PortalSummary
        include JSON::Serializable

        # The authorization of the portal.

        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization

        # The endpoint configuration of the portal.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse

        # The ARNs of the portal products included in the portal.

        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)

        # The timestamp when the portal was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal.

        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # Contains the content that is visible to portal consumers including the themes, display names, and
        # description.

        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent

        # The portal identifier.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The timestamp when the portal was last published.

        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?

        # The description of the portal the last time it was published.

        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?

        # Represents the preview endpoint and the any possible error messages during preview generation.

        @[JSON::Field(key: "preview")]
        getter preview : Types::Preview?

        # The publish status.

        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?

        # The CloudWatch RUM app monitor name.

        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization,
          @endpoint_configuration : Types::EndpointConfigurationResponse,
          @included_portal_product_arns : Array(String),
          @last_modified : Time,
          @portal_arn : String,
          @portal_content : Types::PortalContent,
          @portal_id : String,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @preview : Types::Preview? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines the theme for a portal.

      struct PortalTheme
        include JSON::Serializable

        # Defines custom color values.

        @[JSON::Field(key: "customColors")]
        getter custom_colors : Types::CustomColors

        # The timestamp when the logo was last uploaded.

        @[JSON::Field(key: "logoLastUploaded")]
        getter logo_last_uploaded : Time?

        def initialize(
          @custom_colors : Types::CustomColors,
          @logo_last_uploaded : Time? = nil
        )
        end
      end

      # Contains the preview status and preview URL.

      struct Preview
        include JSON::Serializable

        # The status of the preview.

        @[JSON::Field(key: "previewStatus")]
        getter preview_status : String

        # The URL of the preview.

        @[JSON::Field(key: "previewUrl")]
        getter preview_url : String?

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        def initialize(
          @preview_status : String,
          @preview_url : String? = nil,
          @status_exception : Types::StatusException? = nil
        )
        end
      end


      struct PreviewPortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        def initialize(
          @portal_id : String
        )
        end
      end


      struct PreviewPortalResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a product page summary without listing any page content.

      struct ProductPageSummaryNoBody
        include JSON::Serializable

        # The timestamp when the product page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The page title.

        @[JSON::Field(key: "pageTitle")]
        getter page_title : String

        # The ARN of the product page.

        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String

        # The product page identifier.

        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String

        def initialize(
          @last_modified : Time,
          @page_title : String,
          @product_page_arn : String,
          @product_page_id : String
        )
        end
      end

      # A summary of a product REST endpoint page, without providing the page content.

      struct ProductRestEndpointPageSummaryNoBody
        include JSON::Serializable

        # The endpoint of the product REST endpoint page.

        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The timestamp when the product REST endpoint page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product REST endpoint page.

        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String

        # The product REST endpoint page identifier.

        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String

        # The REST endpoint identifier.

        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier

        # The status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The try it state of a product REST endpoint page.

        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String

        # The operation name of the product REST endpoint.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        def initialize(
          @endpoint : String,
          @last_modified : Time,
          @product_rest_endpoint_page_arn : String,
          @product_rest_endpoint_page_id : String,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier,
          @status : String,
          @try_it_state : String,
          @operation_name : String? = nil,
          @status_exception : Types::StatusException? = nil
        )
        end
      end


      struct PublishPortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalId")]
        getter portal_id : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @portal_id : String,
          @description : String? = nil
        )
        end
      end

      # Publish a portal.

      struct PublishPortalRequestContent
        include JSON::Serializable

        # The description of the portal. When the portal is published, this description becomes the last
        # published description.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end


      struct PublishPortalResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutPortalProductSharingPolicyRequest
        include JSON::Serializable


        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        def initialize(
          @policy_document : String,
          @portal_product_id : String
        )
        end
      end

      # The request content.

      struct PutPortalProductSharingPolicyRequestContent
        include JSON::Serializable

        # The product sharing policy.

        @[JSON::Field(key: "policyDocument")]
        getter policy_document : String

        def initialize(
          @policy_document : String
        )
        end
      end


      struct PutPortalProductSharingPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct PutRoutingRuleRequest
        include JSON::Serializable


        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)


        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "priority")]
        getter priority : Int32


        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String


        @[JSON::Field(key: "domainNameId")]
        getter domain_name_id : String?

        def initialize(
          @actions : Array(Types::RoutingRuleAction),
          @conditions : Array(Types::RoutingRuleCondition),
          @domain_name : String,
          @priority : Int32,
          @routing_rule_id : String,
          @domain_name_id : String? = nil
        )
        end
      end


      struct PutRoutingRuleResponse
        include JSON::Serializable


        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)?


        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)?


        @[JSON::Field(key: "priority")]
        getter priority : Int32?


        @[JSON::Field(key: "routingRuleArn")]
        getter routing_rule_arn : String?


        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String?

        def initialize(
          @actions : Array(Types::RoutingRuleAction)? = nil,
          @conditions : Array(Types::RoutingRuleCondition)? = nil,
          @priority : Int32? = nil,
          @routing_rule_arn : String? = nil,
          @routing_rule_id : String? = nil
        )
        end
      end

      # Overwrites the configuration of an existing API using the provided definition. Supported only for
      # HTTP APIs.

      struct ReimportApiInput
        include JSON::Serializable

        # The OpenAPI definition. Supported only for HTTP APIs.

        @[JSON::Field(key: "body")]
        getter body : String

        def initialize(
          @body : String
        )
        end
      end


      struct ReimportApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "body")]
        getter body : String


        @[JSON::Field(key: "basepath")]
        getter basepath : String?


        @[JSON::Field(key: "failOnWarnings")]
        getter fail_on_warnings : Bool?

        def initialize(
          @api_id : String,
          @body : String,
          @basepath : String? = nil,
          @fail_on_warnings : Bool? = nil
        )
        end
      end


      struct ReimportApiResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiEndpoint")]
        getter api_endpoint : String?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "importInfo")]
        getter import_info : Array(String)?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "version")]
        getter version : String?


        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @api_endpoint : String? = nil,
          @api_gateway_managed : Bool? = nil,
          @api_id : String? = nil,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @import_info : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @protocol_type : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end


      struct ResetAuthorizersCacheRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @api_id : String,
          @stage_name : String
        )
        end
      end

      # The REST API endpoint identifier.

      struct RestEndpointIdentifier
        include JSON::Serializable

        # The identifier parts of the REST endpoint identifier.

        @[JSON::Field(key: "identifierParts")]
        getter identifier_parts : Types::IdentifierParts?

        def initialize(
          @identifier_parts : Types::IdentifierParts? = nil
        )
        end
      end

      # Represents a route.

      struct Route
        include JSON::Serializable

        # The route key for the route. For HTTP APIs, the route key can be either $default, or a combination
        # of an HTTP method and resource path, for example, GET /pets.

        @[JSON::Field(key: "routeKey")]
        getter route_key : String

        # Specifies whether a route is managed by API Gateway. If you created an API using quick create, the
        # $default route is managed by API Gateway. You can't modify the $default route key.

        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?

        # Specifies whether an API key is required for this route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?

        # A list of authorization scopes configured on a route. The scopes are used with a JWT authorizer to
        # authorize the method invocation. The authorization works by matching the route scopes against the
        # scopes parsed from the access token in the incoming request. The method invocation is authorized if
        # any route scope matches a claimed scope in the access token. Otherwise, the invocation is not
        # authorized. When the route scope is configured, the client must provide an access token instead of
        # an identity token for authorization purposes.

        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?

        # The authorization type for the route. For WebSocket APIs, valid values are NONE for open access,
        # AWS_IAM for using Amazon Web Services IAM permissions, and CUSTOM for using a Lambda authorizer. For
        # HTTP APIs, valid values are NONE for open access, JWT for using JSON Web Tokens, AWS_IAM for using
        # Amazon Web Services IAM permissions, and CUSTOM for using a Lambda authorizer.

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?

        # The identifier of the Authorizer resource to be associated with this route. The authorizer
        # identifier is generated by API Gateway when you created the authorizer.

        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?

        # The model selection expression for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?

        # The operation name for the route.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # The request models for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?

        # The request parameters for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?

        # The route ID.

        @[JSON::Field(key: "routeId")]
        getter route_id : String?

        # The route response selection expression for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?

        # The target for the route.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @route_key : String,
          @api_gateway_managed : Bool? = nil,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_id : String? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end

      # Represents a route response.

      struct RouteResponse
        include JSON::Serializable

        # Represents the route response key of a route response.

        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String

        # Represents the model selection expression of a route response. Supported only for WebSocket APIs.

        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?

        # Represents the response models of a route response.

        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?

        # Represents the response parameters of a route response.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?

        # Represents the identifier of a route response.

        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String?

        def initialize(
          @route_response_key : String,
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_id : String? = nil
        )
        end
      end

      # Represents a collection of route responses.

      struct RouteResponses
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::RouteResponse)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::RouteResponse)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a collection of route settings.

      struct RouteSettings
        include JSON::Serializable

        # Specifies whether (true) or not (false) data trace logging is enabled for this route. This property
        # affects the log entries pushed to Amazon CloudWatch Logs. Supported only for WebSocket APIs.

        @[JSON::Field(key: "dataTraceEnabled")]
        getter data_trace_enabled : Bool?

        # Specifies whether detailed metrics are enabled.

        @[JSON::Field(key: "detailedMetricsEnabled")]
        getter detailed_metrics_enabled : Bool?

        # Specifies the logging level for this route: INFO, ERROR, or OFF. This property affects the log
        # entries pushed to Amazon CloudWatch Logs. Supported only for WebSocket APIs.

        @[JSON::Field(key: "loggingLevel")]
        getter logging_level : String?

        # Specifies the throttling burst limit.

        @[JSON::Field(key: "throttlingBurstLimit")]
        getter throttling_burst_limit : Int32?

        # Specifies the throttling rate limit.

        @[JSON::Field(key: "throttlingRateLimit")]
        getter throttling_rate_limit : Float64?

        def initialize(
          @data_trace_enabled : Bool? = nil,
          @detailed_metrics_enabled : Bool? = nil,
          @logging_level : String? = nil,
          @throttling_burst_limit : Int32? = nil,
          @throttling_rate_limit : Float64? = nil
        )
        end
      end

      # Represents a collection of routes.

      struct Routes
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Route)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Route)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a routing rule.

      struct RoutingRule
        include JSON::Serializable

        # The resulting action based on matching a routing rules condition. Only InvokeApi is supported.

        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)?

        # The conditions of the routing rule.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)?

        # The order in which API Gateway evaluates a rule. Priority is evaluated from the lowest value to the
        # highest value. Rules can't have the same priority. Priority values 1-1,000,000 are supported.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The ARN of the routing rule.

        @[JSON::Field(key: "routingRuleArn")]
        getter routing_rule_arn : String?

        # The ID of the routing rule.

        @[JSON::Field(key: "routingRuleId")]
        getter routing_rule_id : String?

        def initialize(
          @actions : Array(Types::RoutingRuleAction)? = nil,
          @conditions : Array(Types::RoutingRuleCondition)? = nil,
          @priority : Int32? = nil,
          @routing_rule_arn : String? = nil,
          @routing_rule_id : String? = nil
        )
        end
      end

      # Represents a routing rule action. The only supported action is invokeApi.

      struct RoutingRuleAction
        include JSON::Serializable

        # Action to invoke a stage of a target API. Only REST APIs are supported.

        @[JSON::Field(key: "invokeApi")]
        getter invoke_api : Types::RoutingRuleActionInvokeApi

        def initialize(
          @invoke_api : Types::RoutingRuleActionInvokeApi
        )
        end
      end

      # Represents an InvokeApi action.

      struct RoutingRuleActionInvokeApi
        include JSON::Serializable

        # The API identifier of the target API.

        @[JSON::Field(key: "apiId")]
        getter api_id : String

        # The name of the target stage.

        @[JSON::Field(key: "stage")]
        getter stage : String

        # The strip base path setting. When true, API Gateway strips the incoming matched base path when
        # forwarding the request to the target API.

        @[JSON::Field(key: "stripBasePath")]
        getter strip_base_path : Bool?

        def initialize(
          @api_id : String,
          @stage : String,
          @strip_base_path : Bool? = nil
        )
        end
      end

      # Represents a condition. Conditions can contain up to two matchHeaders conditions and one
      # matchBasePaths conditions. API Gateway evaluates header conditions and base path conditions
      # together. You can only use AND between header and base path conditions.

      struct RoutingRuleCondition
        include JSON::Serializable

        # The base path to be matched.

        @[JSON::Field(key: "matchBasePaths")]
        getter match_base_paths : Types::RoutingRuleMatchBasePaths?

        # The headers to be matched.

        @[JSON::Field(key: "matchHeaders")]
        getter match_headers : Types::RoutingRuleMatchHeaders?

        def initialize(
          @match_base_paths : Types::RoutingRuleMatchBasePaths? = nil,
          @match_headers : Types::RoutingRuleMatchHeaders? = nil
        )
        end
      end

      # Represents the input parameters for an RoutingRule request.

      struct RoutingRuleInput
        include JSON::Serializable

        # The resulting action based on matching a routing rules condition. Only InvokeApi is supported.

        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::RoutingRuleAction)

        # The conditions of the routing rule.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::RoutingRuleCondition)

        # The order in which API Gateway evaluates a rule. Priority is evaluated from the lowest value to the
        # highest value. Rules can't have the same priority. Priority values 1-1,000,000 are supported.

        @[JSON::Field(key: "priority")]
        getter priority : Int32

        def initialize(
          @actions : Array(Types::RoutingRuleAction),
          @conditions : Array(Types::RoutingRuleCondition),
          @priority : Int32
        )
        end
      end

      # Represents a MatchBasePaths condition.

      struct RoutingRuleMatchBasePaths
        include JSON::Serializable

        # The string of the case sensitive base path to be matched.

        @[JSON::Field(key: "anyOf")]
        getter any_of : Array(String)

        def initialize(
          @any_of : Array(String)
        )
        end
      end

      # Represents a MatchHeaderValue.

      struct RoutingRuleMatchHeaderValue
        include JSON::Serializable

        # The case insensitive header name to be matched. The header name must be less than 40 characters and
        # the only allowed characters are a-z, A-Z, 0-9, and the following special characters:
        # *?-!#$%&amp;'.^_`|~.

        @[JSON::Field(key: "header")]
        getter header : String

        # The case sensitive header glob value to be matched against entire header value. The header glob
        # value must be less than 128 characters and the only allowed characters are a-z, A-Z, 0-9, and the
        # following special characters: *?-!#$%&amp;'.^_`|~. Wildcard matching is supported for header glob
        # values but must be for *prefix-match, suffix-match*, or *infix*-match.

        @[JSON::Field(key: "valueGlob")]
        getter value_glob : String

        def initialize(
          @header : String,
          @value_glob : String
        )
        end
      end

      # Represents a MatchHeaders condition.

      struct RoutingRuleMatchHeaders
        include JSON::Serializable

        # The header name and header value glob to be matched. The matchHeaders condition is matched if any of
        # the header name and header value globs are matched.

        @[JSON::Field(key: "anyOf")]
        getter any_of : Array(Types::RoutingRuleMatchHeaderValue)

        def initialize(
          @any_of : Array(Types::RoutingRuleMatchHeaderValue)
        )
        end
      end

      # Represents collection of routing rules.

      struct RoutingRules
        include JSON::Serializable

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?


        @[JSON::Field(key: "routingRules")]
        getter routing_rules : Array(Types::RoutingRule)?

        def initialize(
          @next_token : String? = nil,
          @routing_rules : Array(Types::RoutingRule)? = nil
        )
        end
      end

      # Contains the section name and list of product REST endpoints for a product.

      struct Section
        include JSON::Serializable

        # The ARNs of the product REST endpoint pages in a portal product.

        @[JSON::Field(key: "productRestEndpointPageArns")]
        getter product_rest_endpoint_page_arns : Array(String)

        # The section name.

        @[JSON::Field(key: "sectionName")]
        getter section_name : String

        def initialize(
          @product_rest_endpoint_page_arns : Array(String),
          @section_name : String
        )
        end
      end

      # Represents an API stage.

      struct Stage
        include JSON::Serializable

        # The name of the stage.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # Settings for logging access in this stage.

        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?

        # Specifies whether a stage is managed by API Gateway. If you created an API using quick create, the
        # $default stage is managed by API Gateway. You can't modify the $default stage.

        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?

        # Specifies whether updates to an API automatically trigger a new deployment. The default value is
        # false.

        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?

        # The identifier of a client certificate for a Stage. Supported only for WebSocket APIs.

        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?

        # The timestamp when the stage was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # Default route settings for the stage.

        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?

        # The identifier of the Deployment that the Stage is associated with. Can't be updated if autoDeploy
        # is enabled.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The description of the stage.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Describes the status of the last deployment of a stage. Supported only for stages with autoDeploy
        # enabled.

        @[JSON::Field(key: "lastDeploymentStatusMessage")]
        getter last_deployment_status_message : String?

        # The timestamp when the stage was last updated.

        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?

        # Route settings for the stage, by routeKey.

        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?

        # A map that defines the stage variables for a stage resource. Variable names can have alphanumeric
        # and underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.

        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @stage_name : String,
          @access_log_settings : Types::AccessLogSettings? = nil,
          @api_gateway_managed : Bool? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @created_date : Time? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @last_deployment_status_message : String? = nil,
          @last_updated_date : Time? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_variables : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A collection of Stage resources that are associated with the ApiKey resource.

      struct Stages
        include JSON::Serializable

        # The elements from this collection.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::Stage)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::Stage)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents a StatusException.

      struct StatusException
        include JSON::Serializable

        # The exception.

        @[JSON::Field(key: "exception")]
        getter exception : String?

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @exception : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Represents the input parameters for a TagResource request.

      struct TagResourceInput
        include JSON::Serializable

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Represents a template.

      struct Template
        include JSON::Serializable

        # The template value.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @value : String? = nil
        )
        end
      end

      # The TLS configuration for a private integration. If you specify a TLS configuration, private
      # integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.

      struct TlsConfig
        include JSON::Serializable

        # If you specify a server name, API Gateway uses it to verify the hostname on the integration's
        # certificate. The server name is also included in the TLS handshake to support Server Name Indication
        # (SNI) or virtual hosting.

        @[JSON::Field(key: "serverNameToVerify")]
        getter server_name_to_verify : String?

        def initialize(
          @server_name_to_verify : String? = nil
        )
        end
      end

      # The TLS configuration for a private integration. If you specify a TLS configuration, private
      # integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.

      struct TlsConfigInput
        include JSON::Serializable

        # If you specify a server name, API Gateway uses it to verify the hostname on the integration's
        # certificate. The server name is also included in the TLS handshake to support Server Name Indication
        # (SNI) or virtual hosting.

        @[JSON::Field(key: "serverNameToVerify")]
        getter server_name_to_verify : String?

        def initialize(
          @server_name_to_verify : String? = nil
        )
        end
      end

      # A limit has been exceeded. See the accompanying error message for details.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "limitType")]
        getter limit_type : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @limit_type : String? = nil,
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable


        @[JSON::Field(key: "resource-arn")]
        getter resource_arn : String


        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Represents the input parameters for an UpdateApi request.

      struct UpdateApiInput
        include JSON::Serializable

        # An API key selection expression. Supported only for WebSocket APIs. See API Key Selection
        # Expressions .

        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?

        # A CORS configuration. Supported only for HTTP APIs.

        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?

        # This property is part of quick create. It specifies the credentials required for the integration, if
        # any. For a Lambda integration, three options are available. To specify an IAM Role for API Gateway
        # to assume, use the role's Amazon Resource Name (ARN). To require that the caller's identity be
        # passed through from the request, specify arn:aws:iam::*:user/*. To use resource-based permissions on
        # supported Amazon Web Services services, don't specify this parameter. Currently, this property is
        # not used for HTTP integrations. If provided, this value replaces the credentials associated with the
        # quick create integration. Supported only for HTTP APIs.

        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?

        # The description of the API.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies whether clients can invoke your API by using the default execute-api endpoint. By default,
        # clients can invoke your API with the default https://{api_id}.execute-api.{region}.amazonaws.com
        # endpoint. To require that clients use a custom domain name to invoke your API, disable the default
        # execute-api endpoint.

        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?

        # Avoid validating models when creating a deployment. Supported only for WebSocket APIs.

        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?

        # The IP address types that can invoke the API. Use ipv4 to allow only IPv4 addresses to invoke your
        # API, or use dualstack to allow both IPv4 and IPv6 addresses to invoke your API.

        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?

        # The name of the API.

        @[JSON::Field(key: "name")]
        getter name : String?

        # This property is part of quick create. If not specified, the route created using quick create is
        # kept. Otherwise, this value replaces the route key of the quick create route. Additional routes may
        # still be added after the API is updated. Supported only for HTTP APIs.

        @[JSON::Field(key: "routeKey")]
        getter route_key : String?

        # The route selection expression for the API. For HTTP APIs, the routeSelectionExpression must be
        # ${request.method} ${request.path}. If not provided, this will be the default for HTTP APIs. This
        # property is required for WebSocket APIs.

        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?

        # This property is part of quick create. For HTTP integrations, specify a fully qualified URL. For
        # Lambda integrations, specify a function ARN. The type of the integration will be HTTP_PROXY or
        # AWS_PROXY, respectively. The value provided updates the integration URI and integration type. You
        # can update a quick-created target, but you can't remove it from an API. Supported only for HTTP
        # APIs.

        @[JSON::Field(key: "target")]
        getter target : String?

        # A version identifier for the API.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @route_key : String? = nil,
          @route_selection_expression : String? = nil,
          @target : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateApiMapping request.

      struct UpdateApiMappingInput
        include JSON::Serializable

        # The API identifier.

        @[JSON::Field(key: "apiId")]
        getter api_id : String?

        # The API mapping key.

        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?

        # The API stage.

        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @api_id : String? = nil,
          @api_mapping_key : String? = nil,
          @stage : String? = nil
        )
        end
      end


      struct UpdateApiMappingRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?


        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @api_id : String,
          @api_mapping_id : String,
          @domain_name : String,
          @api_mapping_key : String? = nil,
          @stage : String? = nil
        )
        end
      end


      struct UpdateApiMappingResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiMappingId")]
        getter api_mapping_id : String?


        @[JSON::Field(key: "apiMappingKey")]
        getter api_mapping_key : String?


        @[JSON::Field(key: "stage")]
        getter stage : String?

        def initialize(
          @api_id : String? = nil,
          @api_mapping_id : String? = nil,
          @api_mapping_key : String? = nil,
          @stage : String? = nil
        )
        end
      end


      struct UpdateApiRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "routeKey")]
        getter route_key : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "target")]
        getter target : String?


        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @api_id : String,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @route_key : String? = nil,
          @route_selection_expression : String? = nil,
          @target : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct UpdateApiResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiEndpoint")]
        getter api_endpoint : String?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiId")]
        getter api_id : String?


        @[JSON::Field(key: "apiKeySelectionExpression")]
        getter api_key_selection_expression : String?


        @[JSON::Field(key: "corsConfiguration")]
        getter cors_configuration : Types::Cors?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "disableExecuteApiEndpoint")]
        getter disable_execute_api_endpoint : Bool?


        @[JSON::Field(key: "disableSchemaValidation")]
        getter disable_schema_validation : Bool?


        @[JSON::Field(key: "importInfo")]
        getter import_info : Array(String)?


        @[JSON::Field(key: "ipAddressType")]
        getter ip_address_type : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "protocolType")]
        getter protocol_type : String?


        @[JSON::Field(key: "routeSelectionExpression")]
        getter route_selection_expression : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "version")]
        getter version : String?


        @[JSON::Field(key: "warnings")]
        getter warnings : Array(String)?

        def initialize(
          @api_endpoint : String? = nil,
          @api_gateway_managed : Bool? = nil,
          @api_id : String? = nil,
          @api_key_selection_expression : String? = nil,
          @cors_configuration : Types::Cors? = nil,
          @created_date : Time? = nil,
          @description : String? = nil,
          @disable_execute_api_endpoint : Bool? = nil,
          @disable_schema_validation : Bool? = nil,
          @import_info : Array(String)? = nil,
          @ip_address_type : String? = nil,
          @name : String? = nil,
          @protocol_type : String? = nil,
          @route_selection_expression : String? = nil,
          @tags : Hash(String, String)? = nil,
          @version : String? = nil,
          @warnings : Array(String)? = nil
        )
        end
      end

      # The input parameters for an UpdateAuthorizer request.

      struct UpdateAuthorizerInput
        include JSON::Serializable

        # Specifies the required credentials as an IAM role for API Gateway to invoke the authorizer. To
        # specify an IAM role for API Gateway to assume, use the role's Amazon Resource Name (ARN). To use
        # resource-based permissions on the Lambda function, don't specify this parameter.

        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?

        # Specifies the format of the payload sent to an HTTP API Lambda authorizer. Required for HTTP API
        # Lambda authorizers. Supported values are 1.0 and 2.0. To learn more, see Working with Amazon Web
        # Services Lambda authorizers for HTTP APIs .

        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?

        # The time to live (TTL) for cached authorizer results, in seconds. If it equals 0, authorization
        # caching is disabled. If it is greater than 0, API Gateway caches authorizer responses. The maximum
        # value is 3600, or 1 hour. Supported only for HTTP API Lambda authorizers.

        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?

        # The authorizer type. Specify REQUEST for a Lambda function using incoming request parameters.
        # Specify JWT to use JSON Web Tokens (supported only for HTTP APIs).

        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String?

        # The authorizer's Uniform Resource Identifier (URI). For REQUEST authorizers, this must be a
        # well-formed Lambda function URI, for example,
        # arn:aws:apigateway:us-west-2:lambda:path/2015-03-31/functions/arn:aws:lambda:us-west-2: {account_id}
        # :function: {lambda_function_name} /invocations. In general, the URI has this form:
        # arn:aws:apigateway: {region} :lambda:path/ {service_api} replaceable/>{region} is the same as the
        # region hosting the Lambda function, path indicates that the remaining substring in the URI should be
        # treated as the path to the resource, including the initial /. For Lambda functions, this is usually
        # of the form /2015-03-31/functions/[FunctionARN]/invocations. Supported only for REQUEST authorizers.

        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?

        # Specifies whether a Lambda authorizer returns a response in a simple format. By default, a Lambda
        # authorizer must return an IAM policy. If enabled, the Lambda authorizer can return a boolean value
        # instead of an IAM policy. Supported only for HTTP APIs. To learn more, see Working with Amazon Web
        # Services Lambda authorizers for HTTP APIs .

        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?

        # The identity source for which authorization is requested. For a REQUEST authorizer, this is
        # optional. The value is a set of one or more mapping expressions of the specified request parameters.
        # The identity source can be headers, query string parameters, stage variables, and context
        # parameters. For example, if an Auth header and a Name query string parameter are defined as identity
        # sources, this value is route.request.header.Auth, route.request.querystring.Name for WebSocket APIs.
        # For HTTP APIs, use selection expressions prefixed with $, for example, $request.header.Auth,
        # $request.querystring.Name. These parameters are used to perform runtime validation for Lambda-based
        # authorizers by verifying all of the identity-related request parameters are present in the request,
        # not null, and non-empty. Only when this is true does the authorizer invoke the authorizer Lambda
        # function. Otherwise, it returns a 401 Unauthorized response without calling the Lambda function. For
        # HTTP APIs, identity sources are also used as the cache key when caching is enabled. To learn more,
        # see Working with Amazon Web Services Lambda authorizers for HTTP APIs . For JWT, a single entry that
        # specifies where to extract the JSON Web Token (JWT) from inbound requests. Currently only
        # header-based and query parameter-based selections are supported, for example
        # $request.header.Authorization.

        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)?

        # This parameter is not used.

        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?

        # Represents the configuration of a JWT authorizer. Required for the JWT authorizer type. Supported
        # only for HTTP APIs.

        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?

        # The name of the authorizer.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @authorizer_credentials_arn : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_type : String? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_source : Array(String)? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAuthorizerRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String


        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?


        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?


        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?


        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String?


        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?


        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?


        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)?


        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?


        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @api_id : String,
          @authorizer_id : String,
          @authorizer_credentials_arn : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_type : String? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_source : Array(String)? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateAuthorizerResponse
        include JSON::Serializable


        @[JSON::Field(key: "authorizerCredentialsArn")]
        getter authorizer_credentials_arn : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "authorizerPayloadFormatVersion")]
        getter authorizer_payload_format_version : String?


        @[JSON::Field(key: "authorizerResultTtlInSeconds")]
        getter authorizer_result_ttl_in_seconds : Int32?


        @[JSON::Field(key: "authorizerType")]
        getter authorizer_type : String?


        @[JSON::Field(key: "authorizerUri")]
        getter authorizer_uri : String?


        @[JSON::Field(key: "enableSimpleResponses")]
        getter enable_simple_responses : Bool?


        @[JSON::Field(key: "identitySource")]
        getter identity_source : Array(String)?


        @[JSON::Field(key: "identityValidationExpression")]
        getter identity_validation_expression : String?


        @[JSON::Field(key: "jwtConfiguration")]
        getter jwt_configuration : Types::JWTConfiguration?


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @authorizer_credentials_arn : String? = nil,
          @authorizer_id : String? = nil,
          @authorizer_payload_format_version : String? = nil,
          @authorizer_result_ttl_in_seconds : Int32? = nil,
          @authorizer_type : String? = nil,
          @authorizer_uri : String? = nil,
          @enable_simple_responses : Bool? = nil,
          @identity_source : Array(String)? = nil,
          @identity_validation_expression : String? = nil,
          @jwt_configuration : Types::JWTConfiguration? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateDeployment request.

      struct UpdateDeploymentInput
        include JSON::Serializable

        # The description for the deployment resource.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @description : String? = nil
        )
        end
      end


      struct UpdateDeploymentRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @api_id : String,
          @deployment_id : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateDeploymentResponse
        include JSON::Serializable


        @[JSON::Field(key: "autoDeployed")]
        getter auto_deployed : Bool?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?


        @[JSON::Field(key: "deploymentStatusMessage")]
        getter deployment_status_message : String?


        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @auto_deployed : Bool? = nil,
          @created_date : Time? = nil,
          @deployment_id : String? = nil,
          @deployment_status : String? = nil,
          @deployment_status_message : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateDomainName request.

      struct UpdateDomainNameInput
        include JSON::Serializable

        # The domain name configurations.

        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?

        # The mutual TLS authentication configuration for a custom domain name.

        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthenticationInput?

        # The routing mode API Gateway uses to route traffic to your APIs.

        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?

        def initialize(
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
          @routing_mode : String? = nil
        )
        end
      end


      struct UpdateDomainNameRequest
        include JSON::Serializable


        @[JSON::Field(key: "domainName")]
        getter domain_name : String


        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?


        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthenticationInput?


        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?

        def initialize(
          @domain_name : String,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
          @routing_mode : String? = nil
        )
        end
      end


      struct UpdateDomainNameResponse
        include JSON::Serializable


        @[JSON::Field(key: "apiMappingSelectionExpression")]
        getter api_mapping_selection_expression : String?


        @[JSON::Field(key: "domainName")]
        getter domain_name : String?


        @[JSON::Field(key: "domainNameArn")]
        getter domain_name_arn : String?


        @[JSON::Field(key: "domainNameConfigurations")]
        getter domain_name_configurations : Array(Types::DomainNameConfiguration)?


        @[JSON::Field(key: "mutualTlsAuthentication")]
        getter mutual_tls_authentication : Types::MutualTlsAuthentication?


        @[JSON::Field(key: "routingMode")]
        getter routing_mode : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @api_mapping_selection_expression : String? = nil,
          @domain_name : String? = nil,
          @domain_name_arn : String? = nil,
          @domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
          @mutual_tls_authentication : Types::MutualTlsAuthentication? = nil,
          @routing_mode : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateIntegration request.

      struct UpdateIntegrationInput
        include JSON::Serializable

        # The ID of the VPC link for a private integration. Supported only for HTTP APIs.

        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?

        # The type of the network connection to the integration endpoint. Specify INTERNET for connections
        # through the public routable internet or VPC_LINK for private connections between API Gateway and
        # resources in a VPC. The default value is INTERNET.

        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?

        # Supported only for WebSocket APIs. Specifies how to handle response payload content type
        # conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following
        # behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the
        # corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
        # Base64-encoded string. If this property is not defined, the response payload will be passed through
        # from the integration response to the route response or method response without modification.

        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?

        # Specifies the credentials required for the integration, if any. For Amazon Web Services
        # integrations, three options are available. To specify an IAM Role for API Gateway to assume, use the
        # role's Amazon Resource Name (ARN). To require that the caller's identity be passed through from the
        # request, specify the string arn:aws:iam::*:user/*. To use resource-based permissions on supported
        # Amazon Web Services services, don't specify this parameter.

        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?

        # The description of the integration

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the integration's HTTP method type. For WebSocket APIs, if you use a Lambda integration,
        # you must set the integration method to POST.

        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?

        # Supported only for HTTP API AWS_PROXY integrations. Specifies the Amazon Web Services service action
        # to invoke. To learn more, see Integration subtype reference .

        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?

        # The integration type of an integration. One of the following: AWS: for integrating the route or
        # method request with an Amazon Web Services service action, including the Lambda function-invoking
        # action. With the Lambda function-invoking action, this is referred to as the Lambda custom
        # integration. With any other Amazon Web Services service action, this is known as Amazon Web Services
        # integration. Supported only for WebSocket APIs. AWS_PROXY: for integrating the route or method
        # request with a Lambda function or other Amazon Web Services service action. This integration is also
        # referred to as a Lambda proxy integration. HTTP: for integrating the route or method request with an
        # HTTP endpoint. This integration is also referred to as the HTTP custom integration. Supported only
        # for WebSocket APIs. HTTP_PROXY: for integrating the route or method request with an HTTP endpoint,
        # with the client request passed through as-is. This is also referred to as HTTP proxy integration.
        # For HTTP API private integrations, use an HTTP_PROXY integration. MOCK: for integrating the route or
        # method request with API Gateway as a "loopback" endpoint without invoking any backend. Supported
        # only for WebSocket APIs.

        @[JSON::Field(key: "integrationType")]
        getter integration_type : String?

        # For a Lambda integration, specify the URI of a Lambda function. For an HTTP integration, specify a
        # fully-qualified URL. For an HTTP API private integration, specify the ARN of an Application Load
        # Balancer listener, Network Load Balancer listener, or Amazon Web Services Cloud Map service. If you
        # specify the ARN of an Amazon Web Services Cloud Map service, API Gateway uses DiscoverInstances to
        # identify resources. You can use query parameters to target specific resources. To learn more, see
        # DiscoverInstances . For private integrations, all resources must be owned by the same Amazon Web
        # Services account.

        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?

        # Specifies the pass-through behavior for incoming requests based on the Content-Type header in the
        # request, and the available mapping templates specified as the requestTemplates property on the
        # Integration resource. There are three valid values: WHEN_NO_MATCH, WHEN_NO_TEMPLATES, and NEVER.
        # Supported only for WebSocket APIs. WHEN_NO_MATCH passes the request body for unmapped content types
        # through to the integration backend without transformation. NEVER rejects unmapped content types with
        # an HTTP 415 Unsupported Media Type response. WHEN_NO_TEMPLATES allows pass-through when the
        # integration has no content types mapped to templates. However, if there is at least one content type
        # defined, unmapped content types will be rejected with the same HTTP 415 Unsupported Media Type
        # response.

        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?

        # Specifies the format of the payload sent to an integration. Required for HTTP APIs. For HTTP APIs,
        # supported values for Lambda proxy integrations are 1.0 and 2.0. For all other integrations, 1.0 is
        # the only supported value. To learn more, see Working with Amazon Web Services Lambda proxy
        # integrations for HTTP APIs .

        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?

        # For WebSocket APIs, a key-value map specifying request parameters that are passed from the method
        # request to the backend. The key is an integration request parameter name and the associated value is
        # a method request parameter value or static value that must be enclosed within single quotes and
        # pre-encoded as required by the backend. The method request parameter value must match the pattern of
        # method.request. {location} . {name} , where {location} is querystring, path, or header; and {name}
        # must be a valid and unique method request parameter name. For HTTP API integrations with a specified
        # integrationSubtype, request parameters are a key-value map specifying parameters that are passed to
        # AWS_PROXY integrations. You can provide static values, or map request data, stage variables, or
        # context variables that are evaluated at runtime. To learn more, see Working with Amazon Web Services
        # service integrations for HTTP APIs . For HTTP API integrations without a specified
        # integrationSubtype request parameters are a key-value map specifying how to transform HTTP requests
        # before sending them to the backend. The key should follow the pattern
        # &lt;action>:&lt;header|querystring|path>.&lt;location> where action can be append, overwrite or
        # remove. For values, you can provide static values, or map request data, stage variables, or context
        # variables that are evaluated at runtime. To learn more, see Transforming API requests and responses
        # .

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?

        # Represents a map of Velocity templates that are applied on the request payload based on the value of
        # the Content-Type header sent by the client. The content type value is the key in this map, and the
        # template (as a String) is the value. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?

        # Supported only for HTTP APIs. You use response parameters to transform the HTTP response from a
        # backend integration before returning the response to clients. Specify a key-value map from a
        # selection key to response parameters. The selection key must be a valid HTTP status code within the
        # range of 200-599. Response parameters are a key-value map. The key must match the pattern
        # &lt;action>:&lt;header>.&lt;location> or overwrite.statuscode. The action can be append, overwrite
        # or remove. The value can be a static value, or map to response data, stage variables, or context
        # variables that are evaluated at runtime. To learn more, see Transforming API requests and responses
        # .

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?

        # The template selection expression for the integration.

        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        # Custom timeout between 50 and 29,000 milliseconds for WebSocket APIs and between 50 and 30,000
        # milliseconds for HTTP APIs. The default timeout is 29 seconds for WebSocket APIs and 30 seconds for
        # HTTP APIs.

        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?

        # The TLS configuration for a private integration. If you specify a TLS configuration, private
        # integration traffic uses the HTTPS protocol. Supported only for HTTP APIs.

        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfigInput?

        def initialize(
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_method : String? = nil,
          @integration_subtype : String? = nil,
          @integration_type : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfigInput? = nil
        )
        end
      end


      struct UpdateIntegrationRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?


        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?


        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?


        @[JSON::Field(key: "integrationType")]
        getter integration_type : String?


        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?


        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?


        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?


        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?


        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?


        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfigInput?

        def initialize(
          @api_id : String,
          @integration_id : String,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_method : String? = nil,
          @integration_subtype : String? = nil,
          @integration_type : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfigInput? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateIntegrationResponse request.

      struct UpdateIntegrationResponseInput
        include JSON::Serializable

        # Supported only for WebSocket APIs. Specifies how to handle response payload content type
        # conversions. Supported values are CONVERT_TO_BINARY and CONVERT_TO_TEXT, with the following
        # behaviors: CONVERT_TO_BINARY: Converts a response payload from a Base64-encoded string to the
        # corresponding binary blob. CONVERT_TO_TEXT: Converts a response payload from a binary blob to a
        # Base64-encoded string. If this property is not defined, the response payload will be passed through
        # from the integration response to the route response or method response without modification.

        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?

        # The integration response key.

        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String?

        # A key-value map specifying response parameters that are passed to the method response from the
        # backend. The key is a method response header parameter name and the mapped value is an integration
        # response header value, a static value enclosed within a pair of single quotes, or a JSON expression
        # from the integration response body. The mapping key must match the pattern of
        # method.response.header. {name} , where name is a valid and unique header name. The mapped non-static
        # value must match the pattern of integration.response.header. {name} or integration.response.body.
        # {JSON-expression} , where {name} is a valid and unique response header name and {JSON-expression} is
        # a valid JSON expression without the $ prefix.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?

        # The collection of response templates for the integration response as a string-to-string map of
        # key-value pairs. Response templates are represented as a key/value map, with a content-type as the
        # key and a template as the value.

        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?

        # The template selection expression for the integration response. Supported only for WebSocket APIs.

        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @content_handling_strategy : String? = nil,
          @integration_response_key : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct UpdateIntegrationResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String


        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?


        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @api_id : String,
          @integration_id : String,
          @integration_response_id : String,
          @content_handling_strategy : String? = nil,
          @integration_response_key : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct UpdateIntegrationResponseResponse
        include JSON::Serializable


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "integrationResponseId")]
        getter integration_response_id : String?


        @[JSON::Field(key: "integrationResponseKey")]
        getter integration_response_key : String?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, String)?


        @[JSON::Field(key: "responseTemplates")]
        getter response_templates : Hash(String, String)?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?

        def initialize(
          @content_handling_strategy : String? = nil,
          @integration_response_id : String? = nil,
          @integration_response_key : String? = nil,
          @response_parameters : Hash(String, String)? = nil,
          @response_templates : Hash(String, String)? = nil,
          @template_selection_expression : String? = nil
        )
        end
      end


      struct UpdateIntegrationResult
        include JSON::Serializable


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String?


        @[JSON::Field(key: "connectionType")]
        getter connection_type : String?


        @[JSON::Field(key: "contentHandlingStrategy")]
        getter content_handling_strategy : String?


        @[JSON::Field(key: "credentialsArn")]
        getter credentials_arn : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "integrationId")]
        getter integration_id : String?


        @[JSON::Field(key: "integrationMethod")]
        getter integration_method : String?


        @[JSON::Field(key: "integrationResponseSelectionExpression")]
        getter integration_response_selection_expression : String?


        @[JSON::Field(key: "integrationSubtype")]
        getter integration_subtype : String?


        @[JSON::Field(key: "integrationType")]
        getter integration_type : String?


        @[JSON::Field(key: "integrationUri")]
        getter integration_uri : String?


        @[JSON::Field(key: "passthroughBehavior")]
        getter passthrough_behavior : String?


        @[JSON::Field(key: "payloadFormatVersion")]
        getter payload_format_version : String?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, String)?


        @[JSON::Field(key: "requestTemplates")]
        getter request_templates : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Hash(String, String))?


        @[JSON::Field(key: "templateSelectionExpression")]
        getter template_selection_expression : String?


        @[JSON::Field(key: "timeoutInMillis")]
        getter timeout_in_millis : Int32?


        @[JSON::Field(key: "tlsConfig")]
        getter tls_config : Types::TlsConfig?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @connection_id : String? = nil,
          @connection_type : String? = nil,
          @content_handling_strategy : String? = nil,
          @credentials_arn : String? = nil,
          @description : String? = nil,
          @integration_id : String? = nil,
          @integration_method : String? = nil,
          @integration_response_selection_expression : String? = nil,
          @integration_subtype : String? = nil,
          @integration_type : String? = nil,
          @integration_uri : String? = nil,
          @passthrough_behavior : String? = nil,
          @payload_format_version : String? = nil,
          @request_parameters : Hash(String, String)? = nil,
          @request_templates : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Hash(String, String))? = nil,
          @template_selection_expression : String? = nil,
          @timeout_in_millis : Int32? = nil,
          @tls_config : Types::TlsConfig? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateModel request. Supported only for WebSocket APIs.

      struct UpdateModelInput
        include JSON::Serializable

        # The content-type for the model, for example, "application/json".

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The description of the model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the model.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The schema for the model. For application/json models, this should be JSON schema draft 4 model.

        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @content_type : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @schema : String? = nil
        )
        end
      end


      struct UpdateModelRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "modelId")]
        getter model_id : String


        @[JSON::Field(key: "contentType")]
        getter content_type : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @api_id : String,
          @model_id : String,
          @content_type : String? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @schema : String? = nil
        )
        end
      end


      struct UpdateModelResponse
        include JSON::Serializable


        @[JSON::Field(key: "contentType")]
        getter content_type : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "modelId")]
        getter model_id : String?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "schema")]
        getter schema : String?

        def initialize(
          @content_type : String? = nil,
          @description : String? = nil,
          @model_id : String? = nil,
          @name : String? = nil,
          @schema : String? = nil
        )
        end
      end


      struct UpdatePortalProductRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?

        def initialize(
          @portal_product_id : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @display_order : Types::DisplayOrder? = nil
        )
        end
      end

      # Updates a portal product.

      struct UpdatePortalProductRequestContent
        include JSON::Serializable

        # The description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The displayName.

        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The display order.

        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @display_order : Types::DisplayOrder? = nil
        )
        end
      end


      struct UpdatePortalProductResponse
        include JSON::Serializable


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "displayName")]
        getter display_name : String?


        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String?


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @description : String? = nil,
          @display_name : String? = nil,
          @display_order : Types::DisplayOrder? = nil,
          @last_modified : Time? = nil,
          @portal_product_arn : String? = nil,
          @portal_product_id : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Updates a portal product.

      struct UpdatePortalProductResponseContent
        include JSON::Serializable

        # The display name of a portal product.

        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The timestamp when the portal product was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal product.

        @[JSON::Field(key: "portalProductArn")]
        getter portal_product_arn : String

        # The portal product identifier.

        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String

        # The description of the portal product.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The display order that the portal products will appear in a portal.

        @[JSON::Field(key: "displayOrder")]
        getter display_order : Types::DisplayOrder?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @last_modified : Time,
          @portal_product_arn : String,
          @portal_product_id : String,
          @description : String? = nil,
          @display_order : Types::DisplayOrder? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdatePortalRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalId")]
        getter portal_id : String


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationRequest?


        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?


        @[JSON::Field(key: "logoUri")]
        getter logo_uri : String?


        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent?


        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        def initialize(
          @portal_id : String,
          @authorization : Types::Authorization? = nil,
          @endpoint_configuration : Types::EndpointConfigurationRequest? = nil,
          @included_portal_product_arns : Array(String)? = nil,
          @logo_uri : String? = nil,
          @portal_content : Types::PortalContent? = nil,
          @rum_app_monitor_name : String? = nil
        )
        end
      end

      # Updates a portal.

      struct UpdatePortalRequestContent
        include JSON::Serializable

        # The authorization of the portal.

        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?

        # Represents an endpoint configuration.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationRequest?

        # The ARNs of the portal products included in the portal.

        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?

        # The logo URI.

        @[JSON::Field(key: "logoUri")]
        getter logo_uri : String?

        # Contains the content that is visible to portal consumers including the themes, display names, and
        # description.

        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent?

        # The CloudWatch RUM app monitor name.

        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        def initialize(
          @authorization : Types::Authorization? = nil,
          @endpoint_configuration : Types::EndpointConfigurationRequest? = nil,
          @included_portal_product_arns : Array(String)? = nil,
          @logo_uri : String? = nil,
          @portal_content : Types::PortalContent? = nil,
          @rum_app_monitor_name : String? = nil
        )
        end
      end


      struct UpdatePortalResponse
        include JSON::Serializable


        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization?


        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse?


        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?


        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?


        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String?


        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent?


        @[JSON::Field(key: "portalId")]
        getter portal_id : String?


        @[JSON::Field(key: "preview")]
        getter preview : Types::Preview?


        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?


        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?


        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization? = nil,
          @endpoint_configuration : Types::EndpointConfigurationResponse? = nil,
          @included_portal_product_arns : Array(String)? = nil,
          @last_modified : Time? = nil,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @portal_arn : String? = nil,
          @portal_content : Types::PortalContent? = nil,
          @portal_id : String? = nil,
          @preview : Types::Preview? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Updates a portal.

      struct UpdatePortalResponseContent
        include JSON::Serializable

        # The authorization for the portal.

        @[JSON::Field(key: "authorization")]
        getter authorization : Types::Authorization

        # The endpoint configuration.

        @[JSON::Field(key: "endpointConfiguration")]
        getter endpoint_configuration : Types::EndpointConfigurationResponse

        # The ARNs of the portal products included in the portal.

        @[JSON::Field(key: "includedPortalProductArns")]
        getter included_portal_product_arns : Array(String)

        # The timestamp when the portal was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the portal.

        @[JSON::Field(key: "portalArn")]
        getter portal_arn : String

        # Contains the content that is visible to portal consumers including the themes, display names, and
        # description.

        @[JSON::Field(key: "portalContent")]
        getter portal_content : Types::PortalContent

        # The portal identifier.

        @[JSON::Field(key: "portalId")]
        getter portal_id : String

        # The timestamp when the portal was last published.

        @[JSON::Field(key: "lastPublished")]
        getter last_published : Time?

        # The description associated with the last time the portal was published.

        @[JSON::Field(key: "lastPublishedDescription")]
        getter last_published_description : String?

        # Represents the preview endpoint and the any possible error messages during preview generation.

        @[JSON::Field(key: "preview")]
        getter preview : Types::Preview?

        # The publishStatus.

        @[JSON::Field(key: "publishStatus")]
        getter publish_status : String?

        # The CloudWatch RUM app monitor name.

        @[JSON::Field(key: "rumAppMonitorName")]
        getter rum_app_monitor_name : String?

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        # The collection of tags. Each tag element is associated with a given resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @authorization : Types::Authorization,
          @endpoint_configuration : Types::EndpointConfigurationResponse,
          @included_portal_product_arns : Array(String),
          @last_modified : Time,
          @portal_arn : String,
          @portal_content : Types::PortalContent,
          @portal_id : String,
          @last_published : Time? = nil,
          @last_published_description : String? = nil,
          @preview : Types::Preview? = nil,
          @publish_status : String? = nil,
          @rum_app_monitor_name : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateProductPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?

        def initialize(
          @portal_product_id : String,
          @product_page_id : String,
          @display_content : Types::DisplayContent? = nil
        )
        end
      end

      # Update a product page.

      struct UpdateProductPageRequestContent
        include JSON::Serializable

        # The content of the product page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?

        def initialize(
          @display_content : Types::DisplayContent? = nil
        )
        end
      end


      struct UpdateProductPageResponse
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String?


        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String?

        def initialize(
          @display_content : Types::DisplayContent? = nil,
          @last_modified : Time? = nil,
          @product_page_arn : String? = nil,
          @product_page_id : String? = nil
        )
        end
      end

      # Updates a product page.

      struct UpdateProductPageResponseContent
        include JSON::Serializable

        # The timestamp when the product page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product page.

        @[JSON::Field(key: "productPageArn")]
        getter product_page_arn : String

        # The product page identifier.

        @[JSON::Field(key: "productPageId")]
        getter product_page_id : String

        # The content of the product page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::DisplayContent?

        def initialize(
          @last_modified : Time,
          @product_page_arn : String,
          @product_page_id : String,
          @display_content : Types::DisplayContent? = nil
        )
        end
      end


      struct UpdateProductRestEndpointPageRequest
        include JSON::Serializable


        @[JSON::Field(key: "portalProductId")]
        getter portal_product_id : String


        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContent?


        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @portal_product_id : String,
          @product_rest_endpoint_page_id : String,
          @display_content : Types::EndpointDisplayContent? = nil,
          @try_it_state : String? = nil
        )
        end
      end

      # Updates a product REST endpoint page.

      struct UpdateProductRestEndpointPageRequestContent
        include JSON::Serializable

        # The display content.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContent?

        # The try it state of a product REST endpoint page.

        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @display_content : Types::EndpointDisplayContent? = nil,
          @try_it_state : String? = nil
        )
        end
      end


      struct UpdateProductRestEndpointPageResponse
        include JSON::Serializable


        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContentResponse?


        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time?


        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String?


        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String?


        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier?


        @[JSON::Field(key: "status")]
        getter status : String?


        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?


        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String?

        def initialize(
          @display_content : Types::EndpointDisplayContentResponse? = nil,
          @last_modified : Time? = nil,
          @product_rest_endpoint_page_arn : String? = nil,
          @product_rest_endpoint_page_id : String? = nil,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier? = nil,
          @status : String? = nil,
          @status_exception : Types::StatusException? = nil,
          @try_it_state : String? = nil
        )
        end
      end

      # Update a product REST endpoint page.

      struct UpdateProductRestEndpointPageResponseContent
        include JSON::Serializable

        # The content of the product REST endpoint page.

        @[JSON::Field(key: "displayContent")]
        getter display_content : Types::EndpointDisplayContentResponse

        # The timestamp when the product REST endpoint page was last modified.

        @[JSON::Field(key: "lastModified")]
        getter last_modified : Time

        # The ARN of the product REST endpoint page.

        @[JSON::Field(key: "productRestEndpointPageArn")]
        getter product_rest_endpoint_page_arn : String

        # The product REST endpoint page identifier.

        @[JSON::Field(key: "productRestEndpointPageId")]
        getter product_rest_endpoint_page_id : String

        # The REST endpoint identifier.

        @[JSON::Field(key: "restEndpointIdentifier")]
        getter rest_endpoint_identifier : Types::RestEndpointIdentifier

        # The status.

        @[JSON::Field(key: "status")]
        getter status : String

        # The try it state of a product REST endpoint page.

        @[JSON::Field(key: "tryItState")]
        getter try_it_state : String

        # The status exception information.

        @[JSON::Field(key: "statusException")]
        getter status_exception : Types::StatusException?

        def initialize(
          @display_content : Types::EndpointDisplayContentResponse,
          @last_modified : Time,
          @product_rest_endpoint_page_arn : String,
          @product_rest_endpoint_page_id : String,
          @rest_endpoint_identifier : Types::RestEndpointIdentifier,
          @status : String,
          @try_it_state : String,
          @status_exception : Types::StatusException? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateRoute request.

      struct UpdateRouteInput
        include JSON::Serializable

        # Specifies whether an API key is required for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?

        # The authorization scopes supported by this route.

        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?

        # The authorization type for the route. For WebSocket APIs, valid values are NONE for open access,
        # AWS_IAM for using Amazon Web Services IAM permissions, and CUSTOM for using a Lambda authorizer. For
        # HTTP APIs, valid values are NONE for open access, JWT for using JSON Web Tokens, AWS_IAM for using
        # Amazon Web Services IAM permissions, and CUSTOM for using a Lambda authorizer.

        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?

        # The identifier of the Authorizer resource to be associated with this route. The authorizer
        # identifier is generated by API Gateway when you created the authorizer.

        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?

        # The model selection expression for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?

        # The operation name for the route.

        @[JSON::Field(key: "operationName")]
        getter operation_name : String?

        # The request models for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?

        # The request parameters for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?

        # The route key for the route. For HTTP APIs, the route key can be either $default, or a combination
        # of an HTTP method and resource path, for example, GET /pets.

        @[JSON::Field(key: "routeKey")]
        getter route_key : String?

        # The route response selection expression for the route. Supported only for WebSocket APIs.

        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?

        # The target for the route.

        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_key : String? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end


      struct UpdateRouteRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String


        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?


        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?


        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "operationName")]
        getter operation_name : String?


        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeKey")]
        getter route_key : String?


        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?


        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_id : String,
          @route_id : String,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_key : String? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateRouteResponse request.

      struct UpdateRouteResponseInput
        include JSON::Serializable

        # The model selection expression for the route response. Supported only for WebSocket APIs.

        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?

        # The response models for the route response.

        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?

        # The route response parameters.

        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?

        # The route response key.

        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String?

        def initialize(
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_key : String? = nil
        )
        end
      end


      struct UpdateRouteResponseRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "routeId")]
        getter route_id : String


        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String?

        def initialize(
          @api_id : String,
          @route_id : String,
          @route_response_id : String,
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_key : String? = nil
        )
        end
      end


      struct UpdateRouteResponseResponse
        include JSON::Serializable


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "responseModels")]
        getter response_models : Hash(String, String)?


        @[JSON::Field(key: "responseParameters")]
        getter response_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeResponseId")]
        getter route_response_id : String?


        @[JSON::Field(key: "routeResponseKey")]
        getter route_response_key : String?

        def initialize(
          @model_selection_expression : String? = nil,
          @response_models : Hash(String, String)? = nil,
          @response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_response_id : String? = nil,
          @route_response_key : String? = nil
        )
        end
      end


      struct UpdateRouteResult
        include JSON::Serializable


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "apiKeyRequired")]
        getter api_key_required : Bool?


        @[JSON::Field(key: "authorizationScopes")]
        getter authorization_scopes : Array(String)?


        @[JSON::Field(key: "authorizationType")]
        getter authorization_type : String?


        @[JSON::Field(key: "authorizerId")]
        getter authorizer_id : String?


        @[JSON::Field(key: "modelSelectionExpression")]
        getter model_selection_expression : String?


        @[JSON::Field(key: "operationName")]
        getter operation_name : String?


        @[JSON::Field(key: "requestModels")]
        getter request_models : Hash(String, String)?


        @[JSON::Field(key: "requestParameters")]
        getter request_parameters : Hash(String, Types::ParameterConstraints)?


        @[JSON::Field(key: "routeId")]
        getter route_id : String?


        @[JSON::Field(key: "routeKey")]
        getter route_key : String?


        @[JSON::Field(key: "routeResponseSelectionExpression")]
        getter route_response_selection_expression : String?


        @[JSON::Field(key: "target")]
        getter target : String?

        def initialize(
          @api_gateway_managed : Bool? = nil,
          @api_key_required : Bool? = nil,
          @authorization_scopes : Array(String)? = nil,
          @authorization_type : String? = nil,
          @authorizer_id : String? = nil,
          @model_selection_expression : String? = nil,
          @operation_name : String? = nil,
          @request_models : Hash(String, String)? = nil,
          @request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
          @route_id : String? = nil,
          @route_key : String? = nil,
          @route_response_selection_expression : String? = nil,
          @target : String? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateStage request.

      struct UpdateStageInput
        include JSON::Serializable

        # Settings for logging access in this stage.

        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?

        # Specifies whether updates to an API automatically trigger a new deployment. The default value is
        # false.

        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?

        # The identifier of a client certificate for a Stage.

        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?

        # The default route settings for the stage.

        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?

        # The deployment identifier for the API stage. Can't be updated if autoDeploy is enabled.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The description for the API stage.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Route settings for the stage.

        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?

        # A map that defines the stage variables for a Stage. Variable names can have alphanumeric and
        # underscore characters, and the values must match [A-Za-z0-9-._~:/?#&amp;=,]+.

        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?

        def initialize(
          @access_log_settings : Types::AccessLogSettings? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_variables : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateStageRequest
        include JSON::Serializable


        @[JSON::Field(key: "apiId")]
        getter api_id : String


        @[JSON::Field(key: "stageName")]
        getter stage_name : String


        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?


        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?


        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?


        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?


        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?

        def initialize(
          @api_id : String,
          @stage_name : String,
          @access_log_settings : Types::AccessLogSettings? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_variables : Hash(String, String)? = nil
        )
        end
      end


      struct UpdateStageResponse
        include JSON::Serializable


        @[JSON::Field(key: "accessLogSettings")]
        getter access_log_settings : Types::AccessLogSettings?


        @[JSON::Field(key: "apiGatewayManaged")]
        getter api_gateway_managed : Bool?


        @[JSON::Field(key: "autoDeploy")]
        getter auto_deploy : Bool?


        @[JSON::Field(key: "clientCertificateId")]
        getter client_certificate_id : String?


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "defaultRouteSettings")]
        getter default_route_settings : Types::RouteSettings?


        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?


        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "lastDeploymentStatusMessage")]
        getter last_deployment_status_message : String?


        @[JSON::Field(key: "lastUpdatedDate")]
        getter last_updated_date : Time?


        @[JSON::Field(key: "routeSettings")]
        getter route_settings : Hash(String, Types::RouteSettings)?


        @[JSON::Field(key: "stageName")]
        getter stage_name : String?


        @[JSON::Field(key: "stageVariables")]
        getter stage_variables : Hash(String, String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @access_log_settings : Types::AccessLogSettings? = nil,
          @api_gateway_managed : Bool? = nil,
          @auto_deploy : Bool? = nil,
          @client_certificate_id : String? = nil,
          @created_date : Time? = nil,
          @default_route_settings : Types::RouteSettings? = nil,
          @deployment_id : String? = nil,
          @description : String? = nil,
          @last_deployment_status_message : String? = nil,
          @last_updated_date : Time? = nil,
          @route_settings : Hash(String, Types::RouteSettings)? = nil,
          @stage_name : String? = nil,
          @stage_variables : Hash(String, String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input parameters for an UpdateVpcLink request.

      struct UpdateVpcLinkInput
        include JSON::Serializable

        # The name of the VPC link.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct UpdateVpcLinkRequest
        include JSON::Serializable


        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String


        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @vpc_link_id : String,
          @name : String? = nil
        )
        end
      end


      struct UpdateVpcLinkResponse
        include JSON::Serializable


        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?


        @[JSON::Field(key: "name")]
        getter name : String?


        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?


        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?


        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?


        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String?


        @[JSON::Field(key: "vpcLinkStatus")]
        getter vpc_link_status : String?


        @[JSON::Field(key: "vpcLinkStatusMessage")]
        getter vpc_link_status_message : String?


        @[JSON::Field(key: "vpcLinkVersion")]
        getter vpc_link_version : String?

        def initialize(
          @created_date : Time? = nil,
          @name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_link_id : String? = nil,
          @vpc_link_status : String? = nil,
          @vpc_link_status_message : String? = nil,
          @vpc_link_version : String? = nil
        )
        end
      end

      # Represents a VPC link.

      struct VpcLink
        include JSON::Serializable

        # The name of the VPC link.

        @[JSON::Field(key: "name")]
        getter name : String

        # A list of security group IDs for the VPC link.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # A list of subnet IDs to include in the VPC link.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The ID of the VPC link.

        @[JSON::Field(key: "vpcLinkId")]
        getter vpc_link_id : String

        # The timestamp when the VPC link was created.

        @[JSON::Field(key: "createdDate")]
        getter created_date : Time?

        # Tags for the VPC link.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The status of the VPC link.

        @[JSON::Field(key: "vpcLinkStatus")]
        getter vpc_link_status : String?

        # A message summarizing the cause of the status of the VPC link.

        @[JSON::Field(key: "vpcLinkStatusMessage")]
        getter vpc_link_status_message : String?

        # The version of the VPC link.

        @[JSON::Field(key: "vpcLinkVersion")]
        getter vpc_link_version : String?

        def initialize(
          @name : String,
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_link_id : String,
          @created_date : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_link_status : String? = nil,
          @vpc_link_status_message : String? = nil,
          @vpc_link_version : String? = nil
        )
        end
      end

      # Represents a collection of VPCLinks.

      struct VpcLinks
        include JSON::Serializable

        # A collection of VPC links.

        @[JSON::Field(key: "items")]
        getter items : Array(Types::VpcLink)?

        # The next page of elements from this collection. Not valid for the last element of the collection.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @items : Array(Types::VpcLink)? = nil,
          @next_token : String? = nil
        )
        end
      end
    end
  end
end
