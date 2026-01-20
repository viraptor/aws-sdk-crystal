require "json"
require "time"

module Aws
  module EventBridge
    module Types

      # You do not have the necessary permissions for this action.

      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end


      struct ActivateEventSourceRequest
        include JSON::Serializable

        # The name of the partner event source to activate.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Contains details about an API destination.

      struct ApiDestination
        include JSON::Serializable

        # The ARN of the API destination.

        @[JSON::Field(key: "ApiDestinationArn")]
        getter api_destination_arn : String?

        # The state of the API destination.

        @[JSON::Field(key: "ApiDestinationState")]
        getter api_destination_state : String?

        # The ARN of the connection specified for the API destination.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # A time stamp for the time that the API destination was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The method to use to connect to the HTTP endpoint.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String?

        # The URL to the endpoint for the API destination.

        @[JSON::Field(key: "InvocationEndpoint")]
        getter invocation_endpoint : String?

        # The maximum number of invocations per second to send to the HTTP endpoint.

        @[JSON::Field(key: "InvocationRateLimitPerSecond")]
        getter invocation_rate_limit_per_second : Int32?

        # A time stamp for the time that the API destination was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the API destination.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @api_destination_arn : String? = nil,
          @api_destination_state : String? = nil,
          @connection_arn : String? = nil,
          @creation_time : Time? = nil,
          @http_method : String? = nil,
          @invocation_endpoint : String? = nil,
          @invocation_rate_limit_per_second : Int32? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.

      struct AppSyncParameters
        include JSON::Serializable

        # The GraphQL operation; that is, the query, mutation, or subscription to be parsed and executed by
        # the GraphQL service. For more information, see Operations in the AppSync User Guide .

        @[JSON::Field(key: "GraphQLOperation")]
        getter graph_ql_operation : String?

        def initialize(
          @graph_ql_operation : String? = nil
        )
        end
      end

      # An Archive object that contains details about an archive.

      struct Archive
        include JSON::Serializable

        # The name of the archive.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String?

        # The time stamp for the time that the archive was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The number of events in the archive.

        @[JSON::Field(key: "EventCount")]
        getter event_count : Int64?

        # The ARN of the event bus associated with the archive. Only events from this event bus are sent to
        # the archive.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The number of days to retain events in the archive before they are deleted.

        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        # The size of the archive, in bytes.

        @[JSON::Field(key: "SizeBytes")]
        getter size_bytes : Int64?

        # The current state of the archive.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A description for the reason that the archive is in the current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @archive_name : String? = nil,
          @creation_time : Time? = nil,
          @event_count : Int64? = nil,
          @event_source_arn : String? = nil,
          @retention_days : Int32? = nil,
          @size_bytes : Int64? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # This structure specifies the VPC subnets and security groups for the task, and whether a public IP
      # address is to be used. This structure is relevant only for ECS tasks that use the awsvpc network
      # mode.

      struct AwsVpcConfiguration
        include JSON::Serializable

        # Specifies the subnets associated with the task. These subnets must all be in the same VPC. You can
        # specify as many as 16 subnets.

        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        # Specifies whether the task's elastic network interface receives a public IP address. You can specify
        # ENABLED only when LaunchType in EcsParameters is set to FARGATE .

        @[JSON::Field(key: "AssignPublicIp")]
        getter assign_public_ip : String?

        # Specifies the security groups associated with the task. These security groups must all be in the
        # same VPC. You can specify as many as five security groups. If you do not specify a security group,
        # the default security group for the VPC is used.

        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @subnets : Array(String),
          @assign_public_ip : String? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # The array properties for the submitted job, such as the size of the array. The array size can be
      # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This
      # parameter is used only if the target is an Batch job.

      struct BatchArrayProperties
        include JSON::Serializable

        # The size of the array, if this is an array batch job. Valid values are integers between 2 and
        # 10,000.

        @[JSON::Field(key: "Size")]
        getter size : Int32?

        def initialize(
          @size : Int32? = nil
        )
        end
      end

      # The custom parameters to be used when the target is an Batch job.

      struct BatchParameters
        include JSON::Serializable

        # The ARN or name of the job definition to use if the event target is an Batch job. This job
        # definition must already exist.

        @[JSON::Field(key: "JobDefinition")]
        getter job_definition : String

        # The name to use for this execution of the job, if the target is an Batch job.

        @[JSON::Field(key: "JobName")]
        getter job_name : String

        # The array properties for the submitted job, such as the size of the array. The array size can be
        # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This
        # parameter is used only if the target is an Batch job.

        @[JSON::Field(key: "ArrayProperties")]
        getter array_properties : Types::BatchArrayProperties?

        # The retry strategy to use for failed jobs, if the target is an Batch job. The retry strategy is the
        # number of times to retry the failed job execution. Valid values are 1–10. When you specify a retry
        # strategy here, it overrides the retry strategy defined in the job definition.

        @[JSON::Field(key: "RetryStrategy")]
        getter retry_strategy : Types::BatchRetryStrategy?

        def initialize(
          @job_definition : String,
          @job_name : String,
          @array_properties : Types::BatchArrayProperties? = nil,
          @retry_strategy : Types::BatchRetryStrategy? = nil
        )
        end
      end

      # The retry strategy to use for failed jobs, if the target is an Batch job. If you specify a retry
      # strategy here, it overrides the retry strategy defined in the job definition.

      struct BatchRetryStrategy
        include JSON::Serializable

        # The number of times to attempt to retry, if the job fails. Valid values are 1–10.

        @[JSON::Field(key: "Attempts")]
        getter attempts : Int32?

        def initialize(
          @attempts : Int32? = nil
        )
        end
      end


      struct CancelReplayRequest
        include JSON::Serializable

        # The name of the replay to cancel.

        @[JSON::Field(key: "ReplayName")]
        getter replay_name : String

        def initialize(
          @replay_name : String
        )
        end
      end


      struct CancelReplayResponse
        include JSON::Serializable

        # The ARN of the replay to cancel.

        @[JSON::Field(key: "ReplayArn")]
        getter replay_arn : String?

        # The current state of the replay.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason that the replay is in the current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @replay_arn : String? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # The details of a capacity provider strategy. To learn more, see CapacityProviderStrategyItem in the
      # Amazon ECS API Reference.

      struct CapacityProviderStrategyItem
        include JSON::Serializable

        # The short name of the capacity provider.

        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : String

        # The base value designates how many tasks, at a minimum, to run on the specified capacity provider.
        # Only one capacity provider in a capacity provider strategy can have a base defined. If no value is
        # specified, the default value of 0 is used.

        @[JSON::Field(key: "base")]
        getter base : Int32?

        # The weight value designates the relative percentage of the total number of tasks launched that
        # should use the specified capacity provider. The weight value is taken into consideration after the
        # base value, if defined, is satisfied.

        @[JSON::Field(key: "weight")]
        getter weight : Int32?

        def initialize(
          @capacity_provider : String,
          @base : Int32? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # There is concurrent modification on a rule, target, archive, or replay.

      struct ConcurrentModificationException
        include JSON::Serializable

        def initialize
        end
      end

      # A JSON string which you can use to limit the event bus permissions you are granting to only accounts
      # that fulfill the condition. Currently, the only supported condition is membership in a certain
      # Amazon Web Services organization. The string must contain Type , Key , and Value fields. The Value
      # field specifies the ID of the Amazon Web Services organization. Following is an example value for
      # Condition : '{"Type" : "StringEquals", "Key": "aws:PrincipalOrgID", "Value": "o-1234567890"}'

      struct Condition
        include JSON::Serializable

        # Specifies the key for the condition. Currently the only supported key is aws:PrincipalOrgID .

        @[JSON::Field(key: "Key")]
        getter key : String

        # Specifies the type of condition. Currently the only supported value is StringEquals .

        @[JSON::Field(key: "Type")]
        getter type : String

        # Specifies the value for the key. Currently, this must be the ID of the organization.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @type : String,
          @value : String
        )
        end
      end

      # Contains information about a connection.

      struct Connection
        include JSON::Serializable

        # The authorization type specified for the connection. OAUTH tokens are refreshed when a 401 or 407
        # response is returned.

        @[JSON::Field(key: "AuthorizationType")]
        getter authorization_type : String?

        # The ARN of the connection.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The state of the connection.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # A time stamp for the time that the connection was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp for the time that the connection was last authorized.

        @[JSON::Field(key: "LastAuthorizedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_authorized_time : Time?

        # A time stamp for the time that the connection was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the connection.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The reason that the connection is in the connection state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @authorization_type : String? = nil,
          @connection_arn : String? = nil,
          @connection_state : String? = nil,
          @creation_time : Time? = nil,
          @last_authorized_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # Contains the authorization parameters for the connection if API Key is specified as the
      # authorization type.

      struct ConnectionApiKeyAuthResponseParameters
        include JSON::Serializable

        # The name of the header to use for the APIKeyValue used for authorization.

        @[JSON::Field(key: "ApiKeyName")]
        getter api_key_name : String?

        def initialize(
          @api_key_name : String? = nil
        )
        end
      end

      # Tthe authorization parameters to use for the connection.

      struct ConnectionAuthResponseParameters
        include JSON::Serializable

        # The API Key parameters to use for authorization.

        @[JSON::Field(key: "ApiKeyAuthParameters")]
        getter api_key_auth_parameters : Types::ConnectionApiKeyAuthResponseParameters?

        # The authorization parameters for Basic authorization.

        @[JSON::Field(key: "BasicAuthParameters")]
        getter basic_auth_parameters : Types::ConnectionBasicAuthResponseParameters?

        # For private OAuth authentication endpoints. The parameters EventBridge uses to authenticate against
        # the endpoint. For more information, see Authorization methods for connections in the Amazon
        # EventBridge User Guide .

        @[JSON::Field(key: "ConnectivityParameters")]
        getter connectivity_parameters : Types::DescribeConnectionConnectivityParameters?

        # Additional parameters for the connection that are passed through with every invocation to the HTTP
        # endpoint.

        @[JSON::Field(key: "InvocationHttpParameters")]
        getter invocation_http_parameters : Types::ConnectionHttpParameters?

        # The OAuth parameters to use for authorization.

        @[JSON::Field(key: "OAuthParameters")]
        getter o_auth_parameters : Types::ConnectionOAuthResponseParameters?

        def initialize(
          @api_key_auth_parameters : Types::ConnectionApiKeyAuthResponseParameters? = nil,
          @basic_auth_parameters : Types::ConnectionBasicAuthResponseParameters? = nil,
          @connectivity_parameters : Types::DescribeConnectionConnectivityParameters? = nil,
          @invocation_http_parameters : Types::ConnectionHttpParameters? = nil,
          @o_auth_parameters : Types::ConnectionOAuthResponseParameters? = nil
        )
        end
      end

      # The authorization parameters for the connection if Basic is specified as the authorization type.

      struct ConnectionBasicAuthResponseParameters
        include JSON::Serializable

        # The user name to use for Basic authorization.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @username : String? = nil
        )
        end
      end

      # Additional parameter included in the body. You can include up to 100 additional body parameters per
      # request. An event payload cannot exceed 64 KB.

      struct ConnectionBodyParameter
        include JSON::Serializable

        # Specifies whether the value is secret.

        @[JSON::Field(key: "IsValueSecret")]
        getter is_value_secret : Bool?

        # The key for the parameter.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value associated with the key.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @is_value_secret : Bool? = nil,
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Additional parameter included in the header. You can include up to 100 additional header parameters
      # per request. An event payload cannot exceed 64 KB.

      struct ConnectionHeaderParameter
        include JSON::Serializable

        # Specifies whether the value is a secret.

        @[JSON::Field(key: "IsValueSecret")]
        getter is_value_secret : Bool?

        # The key for the parameter.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value associated with the key.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @is_value_secret : Bool? = nil,
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Any additional parameters for the connection.

      struct ConnectionHttpParameters
        include JSON::Serializable

        # Any additional body string parameters for the connection.

        @[JSON::Field(key: "BodyParameters")]
        getter body_parameters : Array(Types::ConnectionBodyParameter)?

        # Any additional header parameters for the connection.

        @[JSON::Field(key: "HeaderParameters")]
        getter header_parameters : Array(Types::ConnectionHeaderParameter)?

        # Any additional query string parameters for the connection.

        @[JSON::Field(key: "QueryStringParameters")]
        getter query_string_parameters : Array(Types::ConnectionQueryStringParameter)?

        def initialize(
          @body_parameters : Array(Types::ConnectionBodyParameter)? = nil,
          @header_parameters : Array(Types::ConnectionHeaderParameter)? = nil,
          @query_string_parameters : Array(Types::ConnectionQueryStringParameter)? = nil
        )
        end
      end

      # The client response parameters for the connection when OAuth is specified as the authorization type.

      struct ConnectionOAuthClientResponseParameters
        include JSON::Serializable

        # The client ID associated with the response to the connection request.

        @[JSON::Field(key: "ClientID")]
        getter client_id : String?

        def initialize(
          @client_id : String? = nil
        )
        end
      end

      # The response parameters when OAuth is specified as the authorization type.

      struct ConnectionOAuthResponseParameters
        include JSON::Serializable

        # The URL to the HTTP endpoint that authorized the request.

        @[JSON::Field(key: "AuthorizationEndpoint")]
        getter authorization_endpoint : String?

        # Details about the client parameters returned when OAuth is specified as the authorization type.

        @[JSON::Field(key: "ClientParameters")]
        getter client_parameters : Types::ConnectionOAuthClientResponseParameters?

        # The method used to connect to the HTTP endpoint.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String?

        # The additional HTTP parameters used for the OAuth authorization request.

        @[JSON::Field(key: "OAuthHttpParameters")]
        getter o_auth_http_parameters : Types::ConnectionHttpParameters?

        def initialize(
          @authorization_endpoint : String? = nil,
          @client_parameters : Types::ConnectionOAuthClientResponseParameters? = nil,
          @http_method : String? = nil,
          @o_auth_http_parameters : Types::ConnectionHttpParameters? = nil
        )
        end
      end

      # Any additional query string parameter for the connection. You can include up to 100 additional query
      # string parameters per request. Each additional parameter counts towards the event payload size,
      # which cannot exceed 64 KB.

      struct ConnectionQueryStringParameter
        include JSON::Serializable

        # Specifies whether the value is secret.

        @[JSON::Field(key: "IsValueSecret")]
        getter is_value_secret : Bool?

        # The key for a query string parameter.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value associated with the key for the query string parameter.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @is_value_secret : Bool? = nil,
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The Amazon Resource Name (ARN) of the Amazon VPC Lattice resource configuration for the resource
      # endpoint.

      struct ConnectivityResourceConfigurationArn
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon VPC Lattice resource configuration for the resource
        # endpoint.

        @[JSON::Field(key: "ResourceConfigurationArn")]
        getter resource_configuration_arn : String

        def initialize(
          @resource_configuration_arn : String
        )
        end
      end

      # The parameters for EventBridge to use when invoking the resource endpoint.

      struct ConnectivityResourceParameters
        include JSON::Serializable

        # The parameters for EventBridge to use when invoking the resource endpoint.

        @[JSON::Field(key: "ResourceParameters")]
        getter resource_parameters : Types::ConnectivityResourceConfigurationArn

        def initialize(
          @resource_parameters : Types::ConnectivityResourceConfigurationArn
        )
        end
      end


      struct CreateApiDestinationRequest
        include JSON::Serializable

        # The ARN of the connection to use for the API destination. The destination endpoint must support the
        # authorization type specified for the connection.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String

        # The method to use for the request to the HTTP invocation endpoint.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String

        # The URL to the HTTP invocation endpoint for the API destination.

        @[JSON::Field(key: "InvocationEndpoint")]
        getter invocation_endpoint : String

        # The name for the API destination to create.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description for the API destination to create.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The maximum number of requests per second to send to the HTTP invocation endpoint.

        @[JSON::Field(key: "InvocationRateLimitPerSecond")]
        getter invocation_rate_limit_per_second : Int32?

        def initialize(
          @connection_arn : String,
          @http_method : String,
          @invocation_endpoint : String,
          @name : String,
          @description : String? = nil,
          @invocation_rate_limit_per_second : Int32? = nil
        )
        end
      end


      struct CreateApiDestinationResponse
        include JSON::Serializable

        # The ARN of the API destination that was created by the request.

        @[JSON::Field(key: "ApiDestinationArn")]
        getter api_destination_arn : String?

        # The state of the API destination that was created by the request.

        @[JSON::Field(key: "ApiDestinationState")]
        getter api_destination_state : String?

        # A time stamp indicating the time that the API destination was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp indicating the time that the API destination was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @api_destination_arn : String? = nil,
          @api_destination_state : String? = nil,
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct CreateArchiveRequest
        include JSON::Serializable

        # The name for the archive to create.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String

        # The ARN of the event bus that sends events to the archive.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String

        # A description for the archive.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # An event pattern to use to filter events sent to the archive.

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt this archive. The identifier can be the key Amazon Resource Name
        # (ARN), KeyId, key alias, or key alias ARN. If you do not specify a customer managed key identifier,
        # EventBridge uses an Amazon Web Services owned key to encrypt the archive. For more information, see
        # Identify and view keys in the Key Management Service Developer Guide . If you have specified that
        # EventBridge use a customer managed key for encrypting the source event bus, we strongly recommend
        # you also specify a customer managed key for any archives for the event bus as well. For more
        # information, see Encrypting archives in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of days to retain events for. Default value is 0. If set to 0, events are retained
        # indefinitely

        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        def initialize(
          @archive_name : String,
          @event_source_arn : String,
          @description : String? = nil,
          @event_pattern : String? = nil,
          @kms_key_identifier : String? = nil,
          @retention_days : Int32? = nil
        )
        end
      end


      struct CreateArchiveResponse
        include JSON::Serializable

        # The ARN of the archive that was created.

        @[JSON::Field(key: "ArchiveArn")]
        getter archive_arn : String?

        # The time at which the archive was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The state of the archive that was created.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason that the archive is in the state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @archive_arn : String? = nil,
          @creation_time : Time? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # The API key authorization parameters for the connection.

      struct CreateConnectionApiKeyAuthRequestParameters
        include JSON::Serializable

        # The name of the API key to use for authorization.

        @[JSON::Field(key: "ApiKeyName")]
        getter api_key_name : String

        # The value for the API key to use for authorization.

        @[JSON::Field(key: "ApiKeyValue")]
        getter api_key_value : String

        def initialize(
          @api_key_name : String,
          @api_key_value : String
        )
        end
      end

      # The authorization parameters for the connection. You must include only authorization parameters for
      # the AuthorizationType you specify.

      struct CreateConnectionAuthRequestParameters
        include JSON::Serializable

        # The API key authorization parameters to use for the connection.

        @[JSON::Field(key: "ApiKeyAuthParameters")]
        getter api_key_auth_parameters : Types::CreateConnectionApiKeyAuthRequestParameters?

        # The Basic authorization parameters to use for the connection.

        @[JSON::Field(key: "BasicAuthParameters")]
        getter basic_auth_parameters : Types::CreateConnectionBasicAuthRequestParameters?

        # If you specify a private OAuth endpoint, the parameters for EventBridge to use when authenticating
        # against the endpoint. For more information, see Authorization methods for connections in the Amazon
        # EventBridge User Guide .

        @[JSON::Field(key: "ConnectivityParameters")]
        getter connectivity_parameters : Types::ConnectivityResourceParameters?

        # The API key authorization parameters to use for the connection. Note that if you include additional
        # parameters for the target of a rule via HttpParameters , including query strings, the parameters
        # added for the connection take precedence.

        @[JSON::Field(key: "InvocationHttpParameters")]
        getter invocation_http_parameters : Types::ConnectionHttpParameters?

        # The OAuth authorization parameters to use for the connection.

        @[JSON::Field(key: "OAuthParameters")]
        getter o_auth_parameters : Types::CreateConnectionOAuthRequestParameters?

        def initialize(
          @api_key_auth_parameters : Types::CreateConnectionApiKeyAuthRequestParameters? = nil,
          @basic_auth_parameters : Types::CreateConnectionBasicAuthRequestParameters? = nil,
          @connectivity_parameters : Types::ConnectivityResourceParameters? = nil,
          @invocation_http_parameters : Types::ConnectionHttpParameters? = nil,
          @o_auth_parameters : Types::CreateConnectionOAuthRequestParameters? = nil
        )
        end
      end

      # Contains the Basic authorization parameters to use for the connection.

      struct CreateConnectionBasicAuthRequestParameters
        include JSON::Serializable

        # The password associated with the user name to use for Basic authorization.

        @[JSON::Field(key: "Password")]
        getter password : String

        # The user name to use for Basic authorization.

        @[JSON::Field(key: "Username")]
        getter username : String

        def initialize(
          @password : String,
          @username : String
        )
        end
      end

      # The Basic authorization parameters to use for the connection.

      struct CreateConnectionOAuthClientRequestParameters
        include JSON::Serializable

        # The client ID to use for OAuth authorization for the connection.

        @[JSON::Field(key: "ClientID")]
        getter client_id : String

        # The client secret associated with the client ID to use for OAuth authorization for the connection.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # Contains the OAuth authorization parameters to use for the connection.

      struct CreateConnectionOAuthRequestParameters
        include JSON::Serializable

        # The URL to the authorization endpoint when OAuth is specified as the authorization type.

        @[JSON::Field(key: "AuthorizationEndpoint")]
        getter authorization_endpoint : String

        # The client parameters for OAuth authorization.

        @[JSON::Field(key: "ClientParameters")]
        getter client_parameters : Types::CreateConnectionOAuthClientRequestParameters

        # The method to use for the authorization request.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String

        # Details about the additional parameters to use for the connection.

        @[JSON::Field(key: "OAuthHttpParameters")]
        getter o_auth_http_parameters : Types::ConnectionHttpParameters?

        def initialize(
          @authorization_endpoint : String,
          @client_parameters : Types::CreateConnectionOAuthClientRequestParameters,
          @http_method : String,
          @o_auth_http_parameters : Types::ConnectionHttpParameters? = nil
        )
        end
      end


      struct CreateConnectionRequest
        include JSON::Serializable

        # The authorization parameters to use to authorize with the endpoint. You must include only
        # authorization parameters for the AuthorizationType you specify.

        @[JSON::Field(key: "AuthParameters")]
        getter auth_parameters : Types::CreateConnectionAuthRequestParameters

        # The type of authorization to use for the connection. OAUTH tokens are refreshed when a 401 or 407
        # response is returned.

        @[JSON::Field(key: "AuthorizationType")]
        getter authorization_type : String

        # The name for the connection to create.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description for the connection to create.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # For connections to private APIs, the parameters to use for invoking the API. For more information,
        # see Connecting to private APIs in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "InvocationConnectivityParameters")]
        getter invocation_connectivity_parameters : Types::ConnectivityResourceParameters?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt this connection. The identifier can be the key Amazon Resource Name
        # (ARN), KeyId, key alias, or key alias ARN. If you do not specify a customer managed key identifier,
        # EventBridge uses an Amazon Web Services owned key to encrypt the connection. For more information,
        # see Identify and view keys in the Key Management Service Developer Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        def initialize(
          @auth_parameters : Types::CreateConnectionAuthRequestParameters,
          @authorization_type : String,
          @name : String,
          @description : String? = nil,
          @invocation_connectivity_parameters : Types::ConnectivityResourceParameters? = nil,
          @kms_key_identifier : String? = nil
        )
        end
      end


      struct CreateConnectionResponse
        include JSON::Serializable

        # The ARN of the connection that was created by the request.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The state of the connection that was created by the request.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # A time stamp for the time that the connection was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp for the time that the connection was last updated.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @connection_arn : String? = nil,
          @connection_state : String? = nil,
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct CreateEndpointRequest
        include JSON::Serializable

        # Define the event buses used. The names of the event buses must be identical in each Region.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EndpointEventBus)

        # The name of the global endpoint. For example, "Name":"us-east-2-custom_bus_A-endpoint" .

        @[JSON::Field(key: "Name")]
        getter name : String

        # Configure the routing policy, including the health check and secondary Region..

        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::RoutingConfig

        # A description of the global endpoint.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Enable or disable event replication. The default state is ENABLED which means you must supply a
        # RoleArn . If you don't have a RoleArn or you don't want event replication enabled, set the state to
        # DISABLED .

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        # The ARN of the role used for replication.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        def initialize(
          @event_buses : Array(Types::EndpointEventBus),
          @name : String,
          @routing_config : Types::RoutingConfig,
          @description : String? = nil,
          @replication_config : Types::ReplicationConfig? = nil,
          @role_arn : String? = nil
        )
        end
      end


      struct CreateEndpointResponse
        include JSON::Serializable

        # The ARN of the endpoint that was created by this request.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The event buses used by this request.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EndpointEventBus)?

        # The name of the endpoint that was created by this request.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Whether event replication was enabled or disabled by this request.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        # The ARN of the role used by event replication for this request.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The routing configuration defined by this request.

        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::RoutingConfig?

        # The state of the endpoint that was created by this request.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @event_buses : Array(Types::EndpointEventBus)? = nil,
          @name : String? = nil,
          @replication_config : Types::ReplicationConfig? = nil,
          @role_arn : String? = nil,
          @routing_config : Types::RoutingConfig? = nil,
          @state : String? = nil
        )
        end
      end


      struct CreateEventBusRequest
        include JSON::Serializable

        # The name of the new event bus. Custom event bus names can't contain the / character, but you can use
        # the / character in partner event bus names. In addition, for partner event buses, the name must
        # exactly match the name of the partner event source that this event bus is matched to. You can't use
        # the name default for a custom event bus, as this name is already used for your account's default
        # event bus.

        @[JSON::Field(key: "Name")]
        getter name : String


        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The event bus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If you are creating a partner event bus, this specifies the partner event source that the new event
        # bus will be matched with.

        @[JSON::Field(key: "EventSourceName")]
        getter event_source_name : String?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt events on this event bus. The identifier can be the key Amazon
        # Resource Name (ARN), KeyId, key alias, or key alias ARN. If you do not specify a customer managed
        # key identifier, EventBridge uses an Amazon Web Services owned key to encrypt events on the event
        # bus. For more information, see Identify and view keys in the Key Management Service Developer Guide
        # . Schema discovery is not supported for event buses encrypted using a customer managed key.
        # EventBridge returns an error if: You call CreateDiscoverer on an event bus set to use a customer
        # managed key for encryption. You call UpdatedEventBus to set a customer managed key on an event bus
        # with schema discovery enabled. To enable schema discovery on an event bus, choose to use an Amazon
        # Web Services owned key. For more information, see Encrypting events in the Amazon EventBridge User
        # Guide . If you have specified that EventBridge use a customer managed key for encrypting the source
        # event bus, we strongly recommend you also specify a customer managed key for any archives for the
        # event bus as well. For more information, see Encrypting archives in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The logging configuration settings for the event bus. For more information, see Configuring logs for
        # event buses in the EventBridge User Guide .

        @[JSON::Field(key: "LogConfig")]
        getter log_config : Types::LogConfig?

        # Tags to associate with the event bus.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @event_source_name : String? = nil,
          @kms_key_identifier : String? = nil,
          @log_config : Types::LogConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEventBusResponse
        include JSON::Serializable


        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The event bus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ARN of the new event bus.

        @[JSON::Field(key: "EventBusArn")]
        getter event_bus_arn : String?

        # The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this
        # event bus, if one has been specified. For more information, see Data encryption in EventBridge in
        # the Amazon EventBridge User Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The logging configuration settings for the event bus. For more information, see Configuring logs for
        # event buses in the EventBridge User Guide .

        @[JSON::Field(key: "LogConfig")]
        getter log_config : Types::LogConfig?

        def initialize(
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @event_bus_arn : String? = nil,
          @kms_key_identifier : String? = nil,
          @log_config : Types::LogConfig? = nil
        )
        end
      end


      struct CreatePartnerEventSourceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID that is permitted to create a matching partner event bus for this
        # partner event source.

        @[JSON::Field(key: "Account")]
        getter account : String

        # The name of the partner event source. This name must be unique and must be in the format
        # partner_name / event_namespace / event_name . The Amazon Web Services account that wants to use this
        # partner event source must create a partner event bus with a name that matches the name of the
        # partner event source.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @account : String,
          @name : String
        )
        end
      end


      struct CreatePartnerEventSourceResponse
        include JSON::Serializable

        # The ARN of the partner event source.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        def initialize(
          @event_source_arn : String? = nil
        )
        end
      end


      struct DeactivateEventSourceRequest
        include JSON::Serializable

        # The name of the partner event source to deactivate.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Configuration details of the Amazon SQS queue for EventBridge to use as a dead-letter queue (DLQ).
      # For more information, see Using dead-letter queues to process undelivered events in the EventBridge
      # User Guide .

      struct DeadLetterConfig
        include JSON::Serializable

        # The ARN of the SQS queue specified as the target for the dead-letter queue.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct DeauthorizeConnectionRequest
        include JSON::Serializable

        # The name of the connection to remove authorization from.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeauthorizeConnectionResponse
        include JSON::Serializable

        # The ARN of the connection that authorization was removed from.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The state of the connection.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # A time stamp for the time that the connection was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp for the time that the connection was last authorized.

        @[JSON::Field(key: "LastAuthorizedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_authorized_time : Time?

        # A time stamp for the time that the connection was last updated.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @connection_arn : String? = nil,
          @connection_state : String? = nil,
          @creation_time : Time? = nil,
          @last_authorized_time : Time? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct DeleteApiDestinationRequest
        include JSON::Serializable

        # The name of the destination to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteApiDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteArchiveRequest
        include JSON::Serializable

        # The name of the archive to delete.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String

        def initialize(
          @archive_name : String
        )
        end
      end


      struct DeleteArchiveResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConnectionRequest
        include JSON::Serializable

        # The name of the connection to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteConnectionResponse
        include JSON::Serializable

        # The ARN of the connection that was deleted.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The state of the connection before it was deleted.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # A time stamp for the time that the connection was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp for the time that the connection was last authorized before it wa deleted.

        @[JSON::Field(key: "LastAuthorizedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_authorized_time : Time?

        # A time stamp for the time that the connection was last modified before it was deleted.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @connection_arn : String? = nil,
          @connection_state : String? = nil,
          @creation_time : Time? = nil,
          @last_authorized_time : Time? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct DeleteEndpointRequest
        include JSON::Serializable

        # The name of the endpoint you want to delete. For example, "Name":"us-east-2-custom_bus_A-endpoint"
        # ..

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteEventBusRequest
        include JSON::Serializable

        # The name of the event bus to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeletePartnerEventSourceRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the Amazon Web Services customer that the event source was
        # created for.

        @[JSON::Field(key: "Account")]
        getter account : String

        # The name of the event source to delete.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @account : String,
          @name : String
        )
        end
      end


      struct DeleteRuleRequest
        include JSON::Serializable

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # If this is a managed rule, created by an Amazon Web Services service on your behalf, you must
        # specify Force as True to delete the rule. This parameter is ignored for rules that are not managed
        # rules. You can check whether a rule is a managed rule by using DescribeRule or ListRules and
        # checking the ManagedBy field of the response.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @name : String,
          @event_bus_name : String? = nil,
          @force : Bool? = nil
        )
        end
      end


      struct DescribeApiDestinationRequest
        include JSON::Serializable

        # The name of the API destination to retrieve.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DescribeApiDestinationResponse
        include JSON::Serializable

        # The ARN of the API destination retrieved.

        @[JSON::Field(key: "ApiDestinationArn")]
        getter api_destination_arn : String?

        # The state of the API destination retrieved.

        @[JSON::Field(key: "ApiDestinationState")]
        getter api_destination_state : String?

        # The ARN of the connection specified for the API destination retrieved.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # A time stamp for the time that the API destination was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The description for the API destination retrieved.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The method to use to connect to the HTTP endpoint.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String?

        # The URL to use to connect to the HTTP endpoint.

        @[JSON::Field(key: "InvocationEndpoint")]
        getter invocation_endpoint : String?

        # The maximum number of invocations per second to specified for the API destination. Note that if you
        # set the invocation rate maximum to a value lower the rate necessary to send all events received on
        # to the destination HTTP endpoint, some events may not be delivered within the 24-hour retry window.
        # If you plan to set the rate lower than the rate necessary to deliver all events, consider using a
        # dead-letter queue to catch events that are not delivered within 24 hours.

        @[JSON::Field(key: "InvocationRateLimitPerSecond")]
        getter invocation_rate_limit_per_second : Int32?

        # A time stamp for the time that the API destination was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the API destination retrieved.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @api_destination_arn : String? = nil,
          @api_destination_state : String? = nil,
          @connection_arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @http_method : String? = nil,
          @invocation_endpoint : String? = nil,
          @invocation_rate_limit_per_second : Int32? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end


      struct DescribeArchiveRequest
        include JSON::Serializable

        # The name of the archive to retrieve.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String

        def initialize(
          @archive_name : String
        )
        end
      end


      struct DescribeArchiveResponse
        include JSON::Serializable

        # The ARN of the archive.

        @[JSON::Field(key: "ArchiveArn")]
        getter archive_arn : String?

        # The name of the archive.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String?

        # The time at which the archive was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The description of the archive.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The number of events in the archive.

        @[JSON::Field(key: "EventCount")]
        getter event_count : Int64?

        # The event pattern used to filter events sent to the archive.

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # The ARN of the event source associated with the archive.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The identifier of the KMS customer managed key for EventBridge to use to encrypt this archive, if
        # one has been specified. For more information, see Encrypting archives in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of days to retain events for in the archive.

        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        # The size of the archive in bytes.

        @[JSON::Field(key: "SizeBytes")]
        getter size_bytes : Int64?

        # The state of the archive.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason that the archive is in the state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @archive_arn : String? = nil,
          @archive_name : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @event_count : Int64? = nil,
          @event_pattern : String? = nil,
          @event_source_arn : String? = nil,
          @kms_key_identifier : String? = nil,
          @retention_days : Int32? = nil,
          @size_bytes : Int64? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # If the connection uses a private OAuth endpoint, the parameters for EventBridge to use when
      # authenticating against the endpoint. For more information, see Authorization methods for connections
      # in the Amazon EventBridge User Guide .

      struct DescribeConnectionConnectivityParameters
        include JSON::Serializable

        # The parameters for EventBridge to use when invoking the resource endpoint.

        @[JSON::Field(key: "ResourceParameters")]
        getter resource_parameters : Types::DescribeConnectionResourceParameters

        def initialize(
          @resource_parameters : Types::DescribeConnectionResourceParameters
        )
        end
      end


      struct DescribeConnectionRequest
        include JSON::Serializable

        # The name of the connection to retrieve.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The parameters for EventBridge to use when invoking the resource endpoint.

      struct DescribeConnectionResourceParameters
        include JSON::Serializable

        # For connections to private APIs, the Amazon Resource Name (ARN) of the resource association
        # EventBridge created between the connection and the private API's resource configuration. For more
        # information, see Managing service network resource associations for connections in the Amazon
        # EventBridge User Guide .

        @[JSON::Field(key: "ResourceAssociationArn")]
        getter resource_association_arn : String

        # The Amazon Resource Name (ARN) of the resource configuration for the private API.

        @[JSON::Field(key: "ResourceConfigurationArn")]
        getter resource_configuration_arn : String

        def initialize(
          @resource_association_arn : String,
          @resource_configuration_arn : String
        )
        end
      end


      struct DescribeConnectionResponse
        include JSON::Serializable

        # The parameters to use for authorization for the connection.

        @[JSON::Field(key: "AuthParameters")]
        getter auth_parameters : Types::ConnectionAuthResponseParameters?

        # The type of authorization specified for the connection.

        @[JSON::Field(key: "AuthorizationType")]
        getter authorization_type : String?

        # The ARN of the connection retrieved.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The state of the connection retrieved.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # A time stamp for the time that the connection was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The description for the connection retrieved.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # For connections to private APIs The parameters EventBridge uses to invoke the resource endpoint. For
        # more information, see Connecting to private APIs in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "InvocationConnectivityParameters")]
        getter invocation_connectivity_parameters : Types::DescribeConnectionConnectivityParameters?

        # The identifier of the KMS customer managed key for EventBridge to use to encrypt the connection, if
        # one has been specified. For more information, see Encrypting connections in the Amazon EventBridge
        # User Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # A time stamp for the time that the connection was last authorized.

        @[JSON::Field(key: "LastAuthorizedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_authorized_time : Time?

        # A time stamp for the time that the connection was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the connection retrieved.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the secret created from the authorization parameters specified for the connection.

        @[JSON::Field(key: "SecretArn")]
        getter secret_arn : String?

        # The reason that the connection is in the current connection state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @auth_parameters : Types::ConnectionAuthResponseParameters? = nil,
          @authorization_type : String? = nil,
          @connection_arn : String? = nil,
          @connection_state : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @invocation_connectivity_parameters : Types::DescribeConnectionConnectivityParameters? = nil,
          @kms_key_identifier : String? = nil,
          @last_authorized_time : Time? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @secret_arn : String? = nil,
          @state_reason : String? = nil
        )
        end
      end


      struct DescribeEndpointRequest
        include JSON::Serializable

        # The name of the endpoint you want to get information about. For example,
        # "Name":"us-east-2-custom_bus_A-endpoint" .

        @[JSON::Field(key: "Name")]
        getter name : String

        # The primary Region of the endpoint you want to get information about. For example "HomeRegion":
        # "us-east-1" .

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        def initialize(
          @name : String,
          @home_region : String? = nil
        )
        end
      end


      struct DescribeEndpointResponse
        include JSON::Serializable

        # The ARN of the endpoint you asked for information about.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the endpoint you asked for information about was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The description of the endpoint you asked for information about.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the endpoint you asked for information about.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The URL of the endpoint you asked for information about.

        @[JSON::Field(key: "EndpointUrl")]
        getter endpoint_url : String?

        # The event buses being used by the endpoint you asked for information about.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EndpointEventBus)?

        # The last time the endpoint you asked for information about was modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the endpoint you asked for information about.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Whether replication is enabled or disabled for the endpoint you asked for information about.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        # The ARN of the role used by the endpoint you asked for information about.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The routing configuration of the endpoint you asked for information about.

        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::RoutingConfig?

        # The current state of the endpoint you asked for information about.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason the endpoint you asked for information about is in its current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @endpoint_id : String? = nil,
          @endpoint_url : String? = nil,
          @event_buses : Array(Types::EndpointEventBus)? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @replication_config : Types::ReplicationConfig? = nil,
          @role_arn : String? = nil,
          @routing_config : Types::RoutingConfig? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end


      struct DescribeEventBusRequest
        include JSON::Serializable

        # The name or ARN of the event bus to show details for. If you omit this, the default event bus is
        # displayed.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end


      struct DescribeEventBusResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the account permitted to write events to the current account.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the event bus was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?


        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The event bus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this
        # event bus, if one has been specified. For more information, see Data encryption in EventBridge in
        # the Amazon EventBridge User Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The time the event bus was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The logging configuration settings for the event bus. For more information, see Configuring logs for
        # event buses in the EventBridge User Guide .

        @[JSON::Field(key: "LogConfig")]
        getter log_config : Types::LogConfig?

        # The name of the event bus. Currently, this is always default .

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The policy that enables the external account to send events to your account.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @kms_key_identifier : String? = nil,
          @last_modified_time : Time? = nil,
          @log_config : Types::LogConfig? = nil,
          @name : String? = nil,
          @policy : String? = nil
        )
        end
      end


      struct DescribeEventSourceRequest
        include JSON::Serializable

        # The name of the partner event source to display the details of.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DescribeEventSourceResponse
        include JSON::Serializable

        # The ARN of the partner event source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the SaaS partner that created the event source.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The date and time that the event source was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The date and time that the event source will expire if you do not create a matching event bus.

        @[JSON::Field(key: "ExpirationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The name of the partner event source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the event source. If it is ACTIVE, you have already created a matching event bus for
        # this event source, and that event bus is active. If it is PENDING, either you haven't yet created a
        # matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching
        # event bus, but the event source has since been deleted.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @creation_time : Time? = nil,
          @expiration_time : Time? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DescribePartnerEventSourceRequest
        include JSON::Serializable

        # The name of the event source to display.

        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DescribePartnerEventSourceResponse
        include JSON::Serializable

        # The ARN of the event source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the event source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end


      struct DescribeReplayRequest
        include JSON::Serializable

        # The name of the replay to retrieve.

        @[JSON::Field(key: "ReplayName")]
        getter replay_name : String

        def initialize(
          @replay_name : String
        )
        end
      end


      struct DescribeReplayResponse
        include JSON::Serializable

        # The description of the replay.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A ReplayDestination object that contains details about the replay.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::ReplayDestination?

        # The time stamp for the last event that was replayed from the archive.

        @[JSON::Field(key: "EventEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_end_time : Time?

        # The time that the event was last replayed.

        @[JSON::Field(key: "EventLastReplayedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_last_replayed_time : Time?

        # The ARN of the archive events were replayed from.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The time stamp of the first event that was last replayed from the archive.

        @[JSON::Field(key: "EventStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_start_time : Time?

        # The ARN of the replay.

        @[JSON::Field(key: "ReplayArn")]
        getter replay_arn : String?

        # A time stamp for the time that the replay stopped.

        @[JSON::Field(key: "ReplayEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter replay_end_time : Time?

        # The name of the replay.

        @[JSON::Field(key: "ReplayName")]
        getter replay_name : String?

        # A time stamp for the time that the replay started.

        @[JSON::Field(key: "ReplayStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter replay_start_time : Time?

        # The current state of the replay.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason that the replay is in the current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @description : String? = nil,
          @destination : Types::ReplayDestination? = nil,
          @event_end_time : Time? = nil,
          @event_last_replayed_time : Time? = nil,
          @event_source_arn : String? = nil,
          @event_start_time : Time? = nil,
          @replay_arn : String? = nil,
          @replay_end_time : Time? = nil,
          @replay_name : String? = nil,
          @replay_start_time : Time? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end


      struct DescribeRuleRequest
        include JSON::Serializable

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        def initialize(
          @name : String,
          @event_bus_name : String? = nil
        )
        end
      end


      struct DescribeRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The account ID of the user that created the rule. If you use PutRule to put a rule on an event bus
        # in another account, the other account is the owner of the rule, and the rule ARN includes the
        # account ID for that account. However, the value for CreatedBy is the account ID as the account that
        # created the rule in the other account.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The description of the rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name of the event bus associated with the rule.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # The event pattern. For more information, see Events and Event Patterns in the Amazon EventBridge
        # User Guide .

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # If this is a managed rule, created by an Amazon Web Services service on your behalf, this field
        # displays the principal name of the Amazon Web Services service that created the rule.

        @[JSON::Field(key: "ManagedBy")]
        getter managed_by : String?

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the IAM role associated with the rule.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5 minutes)".

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # Specifies whether the rule is enabled or disabled.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @description : String? = nil,
          @event_bus_name : String? = nil,
          @event_pattern : String? = nil,
          @managed_by : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @schedule_expression : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DisableRuleRequest
        include JSON::Serializable

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        def initialize(
          @name : String,
          @event_bus_name : String? = nil
        )
        end
      end

      # The custom parameters to be used when the target is an Amazon ECS task.

      struct EcsParameters
        include JSON::Serializable

        # The ARN of the task definition to use if the event target is an Amazon ECS task.

        @[JSON::Field(key: "TaskDefinitionArn")]
        getter task_definition_arn : String

        # The capacity provider strategy to use for the task. If a capacityProviderStrategy is specified, the
        # launchType parameter must be omitted. If no capacityProviderStrategy or launchType is specified, the
        # defaultCapacityProviderStrategy for the cluster is used.

        @[JSON::Field(key: "CapacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # Specifies whether to enable Amazon ECS managed tags for the task. For more information, see Tagging
        # Your Amazon ECS Resources in the Amazon Elastic Container Service Developer Guide.

        @[JSON::Field(key: "EnableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Whether or not to enable the execute command functionality for the containers in this task. If true,
        # this enables execute command functionality on all containers in the task.

        @[JSON::Field(key: "EnableExecuteCommand")]
        getter enable_execute_command : Bool?

        # Specifies an ECS task group for the task. The maximum length is 255 characters.

        @[JSON::Field(key: "Group")]
        getter group : String?

        # Specifies the launch type on which your task is running. The launch type that you specify here must
        # match one of the launch type (compatibilities) of the target task. The FARGATE value is supported
        # only in the Regions where Fargate with Amazon ECS is supported. For more information, see Fargate on
        # Amazon ECS in the Amazon Elastic Container Service Developer Guide .

        @[JSON::Field(key: "LaunchType")]
        getter launch_type : String?

        # Use this structure if the Amazon ECS task uses the awsvpc network mode. This structure specifies the
        # VPC subnets and security groups associated with the task, and whether a public IP address is to be
        # used. This structure is required if LaunchType is FARGATE because the awsvpc mode is required for
        # Fargate tasks. If you specify NetworkConfiguration when the target ECS task does not use the awsvpc
        # network mode, the task fails.

        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # An array of placement constraint objects to use for the task. You can specify up to 10 constraints
        # per task (including constraints in the task definition and those specified at runtime).

        @[JSON::Field(key: "PlacementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The placement strategy objects to use for the task. You can specify a maximum of five strategy rules
        # per task.

        @[JSON::Field(key: "PlacementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # Specifies the platform version for the task. Specify only the numeric portion of the platform
        # version, such as 1.1.0 . This structure is used only if LaunchType is FARGATE . For more information
        # about valid platform versions, see Fargate Platform Versions in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # Specifies whether to propagate the tags from the task definition to the task. If no value is
        # specified, the tags are not propagated. Tags can only be propagated to the task during task
        # creation. To add tags to a task after task creation, use the TagResource API action.

        @[JSON::Field(key: "PropagateTags")]
        getter propagate_tags : String?

        # The reference ID to use for the task.

        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String?

        # The metadata that you apply to the task to help you categorize and organize them. Each tag consists
        # of a key and an optional value, both of which you define. To learn more, see RunTask in the Amazon
        # ECS API Reference.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The number of tasks to create based on TaskDefinition . The default is 1.

        @[JSON::Field(key: "TaskCount")]
        getter task_count : Int32?

        def initialize(
          @task_definition_arn : String,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @group : String? = nil,
          @launch_type : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @reference_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_count : Int32? = nil
        )
        end
      end


      struct EnableRuleRequest
        include JSON::Serializable

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        def initialize(
          @name : String,
          @event_bus_name : String? = nil
        )
        end
      end

      # A global endpoint used to improve your application's availability by making it regional-fault
      # tolerant. For more information about global endpoints, see Making applications Regional-fault
      # tolerant with global endpoints and event replication in the Amazon EventBridge User Guide .

      struct Endpoint
        include JSON::Serializable

        # The ARN of the endpoint.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the endpoint was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A description for the endpoint.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The URL subdomain of the endpoint. For example, if the URL for Endpoint is
        # https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is abcde.veo .

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The URL of the endpoint.

        @[JSON::Field(key: "EndpointUrl")]
        getter endpoint_url : String?

        # The event buses being used by the endpoint.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EndpointEventBus)?

        # The last time the endpoint was modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the endpoint.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Whether event replication was enabled or disabled for this endpoint. The default state is ENABLED
        # which means you must supply a RoleArn . If you don't have a RoleArn or you don't want event
        # replication enabled, set the state to DISABLED .

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        # The ARN of the role used by event replication for the endpoint.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The routing configuration of the endpoint.

        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::RoutingConfig?

        # The current state of the endpoint.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason the endpoint is in its current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @endpoint_id : String? = nil,
          @endpoint_url : String? = nil,
          @event_buses : Array(Types::EndpointEventBus)? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @replication_config : Types::ReplicationConfig? = nil,
          @role_arn : String? = nil,
          @routing_config : Types::RoutingConfig? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # The event buses the endpoint is associated with.

      struct EndpointEventBus
        include JSON::Serializable

        # The ARN of the event bus the endpoint is associated with.

        @[JSON::Field(key: "EventBusArn")]
        getter event_bus_arn : String

        def initialize(
          @event_bus_arn : String
        )
        end
      end

      # An event bus receives events from a source, uses rules to evaluate them, applies any configured
      # input transformation, and routes them to the appropriate target(s). Your account's default event bus
      # receives events from Amazon Web Services services. A custom event bus can receive events from your
      # custom applications and services. A partner event bus receives events from an event source created
      # by an SaaS partner. These events come from the partners services or applications.

      struct EventBus
        include JSON::Serializable

        # The ARN of the event bus.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the event bus was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The event bus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The time the event bus was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        # The name of the event bus.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The permissions policy of the event bus, describing which other Amazon Web Services accounts can
        # write events to this event bus.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @policy : String? = nil
        )
        end
      end

      # A partner event source is created by an SaaS partner. If a customer creates a partner event bus that
      # matches this event source, that Amazon Web Services account can receive events from the partner's
      # applications or services.

      struct EventSource
        include JSON::Serializable

        # The ARN of the event source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the partner that created the event source.

        @[JSON::Field(key: "CreatedBy")]
        getter created_by : String?

        # The date and time the event source was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The date and time that the event source will expire, if the Amazon Web Services account doesn't
        # create a matching event bus for it.

        @[JSON::Field(key: "ExpirationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The name of the event source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The state of the event source. If it is ACTIVE, you have already created a matching event bus for
        # this event source, and that event bus is active. If it is PENDING, either you haven't yet created a
        # matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching
        # event bus, but the event source has since been deleted.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @created_by : String? = nil,
          @creation_time : Time? = nil,
          @expiration_time : Time? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The failover configuration for an endpoint. This includes what triggers failover and what happens
      # when it's triggered.

      struct FailoverConfig
        include JSON::Serializable

        # The main Region of the endpoint.

        @[JSON::Field(key: "Primary")]
        getter primary : Types::Primary

        # The Region that events are routed to when failover is triggered or event replication is enabled.

        @[JSON::Field(key: "Secondary")]
        getter secondary : Types::Secondary

        def initialize(
          @primary : Types::Primary,
          @secondary : Types::Secondary
        )
        end
      end

      # These are custom parameter to be used when the target is an API Gateway APIs or EventBridge
      # ApiDestinations. In the latter case, these are merged with any InvocationParameters specified on the
      # Connection, with any values from the Connection taking precedence.

      struct HttpParameters
        include JSON::Serializable

        # The headers that need to be sent as part of request invoking the API Gateway API or EventBridge
        # ApiDestination.

        @[JSON::Field(key: "HeaderParameters")]
        getter header_parameters : Hash(String, String)?

        # The path parameter values to be used to populate API Gateway API or EventBridge ApiDestination path
        # wildcards ("*").

        @[JSON::Field(key: "PathParameterValues")]
        getter path_parameter_values : Array(String)?

        # The query string keys/values that need to be sent as part of request invoking the API Gateway API or
        # EventBridge ApiDestination.

        @[JSON::Field(key: "QueryStringParameters")]
        getter query_string_parameters : Hash(String, String)?

        def initialize(
          @header_parameters : Hash(String, String)? = nil,
          @path_parameter_values : Array(String)? = nil,
          @query_string_parameters : Hash(String, String)? = nil
        )
        end
      end

      # An error occurred because a replay can be canceled only when the state is Running or Starting.

      struct IllegalStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters needed for you to provide custom input to a target based on one or more
      # pieces of data extracted from the event.

      struct InputTransformer
        include JSON::Serializable

        # Input template where you specify placeholders that will be filled with the values of the keys from
        # InputPathsMap to customize the data sent to the target. Enclose each InputPathsMaps value in
        # brackets: &lt; value &gt; If InputTemplate is a JSON object (surrounded by curly braces), the
        # following restrictions apply: The placeholder cannot be used as an object key. The following example
        # shows the syntax for using InputPathsMap and InputTemplate . "InputTransformer": { "InputPathsMap":
        # {"instance": "$.detail.instance","status": "$.detail.status"}, "InputTemplate": "&lt;instance&gt; is
        # in state &lt;status&gt;" } To have the InputTemplate include quote marks within a JSON string,
        # escape each quote marks with a slash, as in the following example: "InputTransformer": {
        # "InputPathsMap": {"instance": "$.detail.instance","status": "$.detail.status"}, "InputTemplate":
        # "&lt;instance&gt; is in state \"&lt;status&gt;\"" } The InputTemplate can also be valid JSON with
        # varibles in quotes or out, as in the following example: "InputTransformer": { "InputPathsMap":
        # {"instance": "$.detail.instance","status": "$.detail.status"}, "InputTemplate": '{"myInstance":
        # &lt;instance&gt;,"myStatus": "&lt;instance&gt; is in state \"&lt;status&gt;\""}' }

        @[JSON::Field(key: "InputTemplate")]
        getter input_template : String

        # Map of JSON paths to be extracted from the event. You can then insert these in the template in
        # InputTemplate to produce the output you want to be sent to the target. InputPathsMap is an array
        # key-value pairs, where each value is a valid JSON path. You can have as many as 100 key-value pairs.
        # You must use JSON dot notation, not bracket notation. The keys cannot start with "Amazon Web
        # Services."

        @[JSON::Field(key: "InputPathsMap")]
        getter input_paths_map : Hash(String, String)?

        def initialize(
          @input_template : String,
          @input_paths_map : Hash(String, String)? = nil
        )
        end
      end

      # This exception occurs due to unexpected causes.

      struct InternalException
        include JSON::Serializable

        def initialize
        end
      end

      # The event pattern is not valid.

      struct InvalidEventPatternException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified state is not a valid state for an event source.

      struct InvalidStateException
        include JSON::Serializable

        def initialize
        end
      end

      # This object enables you to specify a JSON path to extract from the event and use as the partition
      # key for the Amazon Kinesis data stream, so that you can control the shard to which the event goes.
      # If you do not include this parameter, the default is to use the eventId as the partition key.

      struct KinesisParameters
        include JSON::Serializable

        # The JSON path to be extracted from the event and used as the partition key. For more information,
        # see Amazon Kinesis Streams Key Concepts in the Amazon Kinesis Streams Developer Guide .

        @[JSON::Field(key: "PartitionKeyPath")]
        getter partition_key_path : String

        def initialize(
          @partition_key_path : String
        )
        end
      end

      # The request failed because it attempted to create resource beyond the allowed service quota.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end


      struct ListApiDestinationsRequest
        include JSON::Serializable

        # The ARN of the connection specified for the API destination.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The maximum number of API destinations to include in the response.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A name prefix to filter results returned. Only API destinations with a name that starts with the
        # prefix are returned.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_arn : String? = nil,
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApiDestinationsResponse
        include JSON::Serializable

        # An array that includes information about each API destination.

        @[JSON::Field(key: "ApiDestinations")]
        getter api_destinations : Array(Types::ApiDestination)?

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @api_destinations : Array(Types::ApiDestination)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListArchivesRequest
        include JSON::Serializable

        # The ARN of the event source associated with the archive.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A name prefix to filter the archives returned. Only archives with name that match the prefix are
        # returned.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The state of the archive.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @event_source_arn : String? = nil,
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListArchivesResponse
        include JSON::Serializable

        # An array of Archive objects that include details about an archive.

        @[JSON::Field(key: "Archives")]
        getter archives : Array(Types::Archive)?

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @archives : Array(Types::Archive)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectionsRequest
        include JSON::Serializable

        # The state of the connection.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # The maximum number of connections to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A name prefix to filter results returned. Only connections with a name that starts with the prefix
        # are returned.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connection_state : String? = nil,
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConnectionsResponse
        include JSON::Serializable

        # An array of connections objects that include details about the connections.

        @[JSON::Field(key: "Connections")]
        getter connections : Array(Types::Connection)?

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @connections : Array(Types::Connection)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEndpointsRequest
        include JSON::Serializable

        # The primary Region of the endpoints associated with this account. For example "HomeRegion":
        # "us-east-1" .

        @[JSON::Field(key: "HomeRegion")]
        getter home_region : String?

        # The maximum number of results returned by the call.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A value that will return a subset of the endpoints associated with this account. For example,
        # "NamePrefix": "ABC" will return all endpoints with "ABC" in the name.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @home_region : String? = nil,
          @max_results : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEndpointsResponse
        include JSON::Serializable

        # The endpoints returned by the call.

        @[JSON::Field(key: "Endpoints")]
        getter endpoints : Array(Types::Endpoint)?

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @endpoints : Array(Types::Endpoint)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventBusesRequest
        include JSON::Serializable

        # Specifying this limits the number of results returned by this operation. The operation also returns
        # a NextToken which you can use in a subsequent operation to retrieve the next set of results.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Specifying this limits the results to only those event buses with names that start with the
        # specified prefix.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventBusesResponse
        include JSON::Serializable

        # This list of event buses.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EventBus)?

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_buses : Array(Types::EventBus)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventSourcesRequest
        include JSON::Serializable

        # Specifying this limits the number of results returned by this operation. The operation also returns
        # a NextToken which you can use in a subsequent operation to retrieve the next set of results.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # Specifying this limits the results to only those partner event sources with names that start with
        # the specified prefix.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEventSourcesResponse
        include JSON::Serializable

        # The list of event sources.

        @[JSON::Field(key: "EventSources")]
        getter event_sources : Array(Types::EventSource)?

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_sources : Array(Types::EventSource)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnerEventSourceAccountsRequest
        include JSON::Serializable

        # The name of the partner event source to display account information about.

        @[JSON::Field(key: "EventSourceName")]
        getter event_source_name : String

        # Specifying this limits the number of results returned by this operation. The operation also returns
        # a NextToken which you can use in a subsequent operation to retrieve the next set of results.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_source_name : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnerEventSourceAccountsResponse
        include JSON::Serializable

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of partner event sources returned by the operation.

        @[JSON::Field(key: "PartnerEventSourceAccounts")]
        getter partner_event_source_accounts : Array(Types::PartnerEventSourceAccount)?

        def initialize(
          @next_token : String? = nil,
          @partner_event_source_accounts : Array(Types::PartnerEventSourceAccount)? = nil
        )
        end
      end


      struct ListPartnerEventSourcesRequest
        include JSON::Serializable

        # If you specify this, the results are limited to only those partner event sources that start with the
        # string you specify.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String

        # pecifying this limits the number of results returned by this operation. The operation also returns a
        # NextToken which you can use in a subsequent operation to retrieve the next set of results.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @name_prefix : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPartnerEventSourcesResponse
        include JSON::Serializable

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of partner event sources returned by the operation.

        @[JSON::Field(key: "PartnerEventSources")]
        getter partner_event_sources : Array(Types::PartnerEventSource)?

        def initialize(
          @next_token : String? = nil,
          @partner_event_sources : Array(Types::PartnerEventSource)? = nil
        )
        end
      end


      struct ListReplaysRequest
        include JSON::Serializable

        # The ARN of the archive from which the events are replayed.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # The maximum number of replays to retrieve.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A name prefix to filter the replays returned. Only replays with name that match the prefix are
        # returned.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The state of the replay.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @event_source_arn : String? = nil,
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct ListReplaysResponse
        include JSON::Serializable

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of Replay objects that contain information about the replay.

        @[JSON::Field(key: "Replays")]
        getter replays : Array(Types::Replay)?

        def initialize(
          @next_token : String? = nil,
          @replays : Array(Types::Replay)? = nil
        )
        end
      end


      struct ListRuleNamesByTargetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target resource.

        @[JSON::Field(key: "TargetArn")]
        getter target_arn : String

        # The name or ARN of the event bus to list rules for. If you omit this, the default event bus is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @target_arn : String,
          @event_bus_name : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRuleNamesByTargetResponse
        include JSON::Serializable

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The names of the rules that can invoke the given target.

        @[JSON::Field(key: "RuleNames")]
        getter rule_names : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @rule_names : Array(String)? = nil
        )
        end
      end


      struct ListRulesRequest
        include JSON::Serializable

        # The name or ARN of the event bus to list the rules for. If you omit this, the default event bus is
        # used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The prefix matching the rule name.

        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @event_bus_name : String? = nil,
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRulesResponse
        include JSON::Serializable

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The rules that match the specified criteria.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::Rule)?

        def initialize(
          @next_token : String? = nil,
          @rules : Array(Types::Rule)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the EventBridge resource for which you want to view tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tag keys and values associated with the resource you specified

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTargetsByRuleRequest
        include JSON::Serializable

        # The name of the rule.

        @[JSON::Field(key: "Rule")]
        getter rule : String

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # The maximum number of results to return.

        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # The token returned by a previous call, which you can use to retrieve the next set of results. The
        # value of nextToken is a unique pagination token for each page. To retrieve the next page of results,
        # make the call again using the returned token. Keep all other arguments unchanged. Using an expired
        # pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @rule : String,
          @event_bus_name : String? = nil,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTargetsByRuleResponse
        include JSON::Serializable

        # A token indicating there are more results available. If there are no more results, no token is
        # included in the response. The value of nextToken is a unique pagination token for each page. To
        # retrieve the next page of results, make the call again using the returned token. Keep all other
        # arguments unchanged. Using an expired pagination token results in an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The targets assigned to the rule.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)?

        def initialize(
          @next_token : String? = nil,
          @targets : Array(Types::Target)? = nil
        )
        end
      end

      # The logging configuration settings for the event bus. For more information, see Configuring logs for
      # event buses in the EventBridge User Guide .

      struct LogConfig
        include JSON::Serializable

        # Whether EventBridge include detailed event information in the records it generates. Detailed data
        # can be useful for troubleshooting and debugging. This information includes details of the event
        # itself, as well as target details. For more information, see Including detail data in event bus logs
        # in the EventBridge User Guide .

        @[JSON::Field(key: "IncludeDetail")]
        getter include_detail : String?

        # The level of logging detail to include. This applies to all log destinations for the event bus. For
        # more information, see Specifying event bus log level in the EventBridge User Guide .

        @[JSON::Field(key: "Level")]
        getter level : String?

        def initialize(
          @include_detail : String? = nil,
          @level : String? = nil
        )
        end
      end

      # This rule was created by an Amazon Web Services service on behalf of your account. It is managed by
      # that service. If you see this error in response to DeleteRule or RemoveTargets , you can use the
      # Force parameter in those calls to delete the rule or remove targets from the rule. You cannot modify
      # these managed rules by using DisableRule , EnableRule , PutTargets , PutRule , TagResource , or
      # UntagResource .

      struct ManagedRuleException
        include JSON::Serializable

        def initialize
        end
      end

      # This structure specifies the network configuration for an ECS task.

      struct NetworkConfiguration
        include JSON::Serializable

        # Use this structure to specify the VPC subnets and security groups for the task, and whether a public
        # IP address is to be used. This structure is relevant only for ECS tasks that use the awsvpc network
        # mode.

        @[JSON::Field(key: "awsvpcConfiguration")]
        getter awsvpc_configuration : Types::AwsVpcConfiguration?

        def initialize(
          @awsvpc_configuration : Types::AwsVpcConfiguration? = nil
        )
        end
      end

      # The operation you are attempting is not available in this region.

      struct OperationDisabledException
        include JSON::Serializable

        def initialize
        end
      end

      # A partner event source is created by an SaaS partner. If a customer creates a partner event bus that
      # matches this event source, that Amazon Web Services account can receive events from the partner's
      # applications or services.

      struct PartnerEventSource
        include JSON::Serializable

        # The ARN of the partner event source.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The name of the partner event source.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @name : String? = nil
        )
        end
      end

      # The Amazon Web Services account that a partner event source has been offered to.

      struct PartnerEventSourceAccount
        include JSON::Serializable

        # The Amazon Web Services account ID that the partner event source was offered to.

        @[JSON::Field(key: "Account")]
        getter account : String?

        # The date and time the event source was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The date and time that the event source will expire, if the Amazon Web Services account doesn't
        # create a matching event bus for it.

        @[JSON::Field(key: "ExpirationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter expiration_time : Time?

        # The state of the event source. If it is ACTIVE, you have already created a matching event bus for
        # this event source, and that event bus is active. If it is PENDING, either you haven't yet created a
        # matching event bus, or that event bus is deactivated. If it is DELETED, you have created a matching
        # event bus, but the event source has since been deleted.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @account : String? = nil,
          @creation_time : Time? = nil,
          @expiration_time : Time? = nil,
          @state : String? = nil
        )
        end
      end

      # An object representing a constraint on task placement. To learn more, see Task Placement Constraints
      # in the Amazon Elastic Container Service Developer Guide.

      struct PlacementConstraint
        include JSON::Serializable

        # A cluster query language expression to apply to the constraint. You cannot specify an expression if
        # the constraint type is distinctInstance . To learn more, see Cluster Query Language in the Amazon
        # Elastic Container Service Developer Guide.

        @[JSON::Field(key: "expression")]
        getter expression : String?

        # The type of constraint. Use distinctInstance to ensure that each task in a particular group is
        # running on a different container instance. Use memberOf to restrict the selection to a group of
        # valid candidates.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @expression : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The task placement strategy for a task or service. To learn more, see Task Placement Strategies in
      # the Amazon Elastic Container Service Service Developer Guide.

      struct PlacementStrategy
        include JSON::Serializable

        # The field to apply the placement strategy against. For the spread placement strategy, valid values
        # are instanceId (or host, which has the same effect), or any platform or custom attribute that is
        # applied to a container instance, such as attribute:ecs.availability-zone. For the binpack placement
        # strategy, valid values are cpu and memory. For the random placement strategy, this field is not
        # used.

        @[JSON::Field(key: "field")]
        getter field : String?

        # The type of placement strategy. The random placement strategy randomly places tasks on available
        # candidates. The spread placement strategy spreads placement across available candidates evenly based
        # on the field parameter. The binpack strategy places tasks on available candidates that have the
        # least available amount of the resource that is specified with the field parameter. For example, if
        # you binpack on memory, a task is placed on the instance with the least amount of remaining memory
        # (but still enough to run the task).

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @field : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The event bus policy is too long. For more information, see the limits.

      struct PolicyLengthExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The primary Region of the endpoint.

      struct Primary
        include JSON::Serializable

        # The ARN of the health check used by the endpoint to determine whether failover is triggered.

        @[JSON::Field(key: "HealthCheck")]
        getter health_check : String

        def initialize(
          @health_check : String
        )
        end
      end


      struct PutEventsRequest
        include JSON::Serializable

        # The entry that defines an event in your system. You can specify several parameters for the entry
        # such as the source and type of the event, resources associated with the event, and so on.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::PutEventsRequestEntry)

        # The URL subdomain of the endpoint. For example, if the URL for Endpoint is
        # https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is abcde.veo . When using Java,
        # you must include auth-crt on the class path.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        def initialize(
          @entries : Array(Types::PutEventsRequestEntry),
          @endpoint_id : String? = nil
        )
        end
      end

      # Represents an event to be submitted.

      struct PutEventsRequestEntry
        include JSON::Serializable

        # A valid JSON object. There is no other schema imposed. The JSON object may contain fields and nested
        # sub-objects. Detail , DetailType , and Source are required for EventBridge to successfully send an
        # event to an event bus. If you include event entries in a request that do not include each of those
        # properties, EventBridge fails that entry. If you submit a request in which none of the entries have
        # each of these properties, EventBridge fails the entire request.

        @[JSON::Field(key: "Detail")]
        getter detail : String?

        # Free-form string, with a maximum of 128 characters, used to decide what fields to expect in the
        # event detail. Detail , DetailType , and Source are required for EventBridge to successfully send an
        # event to an event bus. If you include event entries in a request that do not include each of those
        # properties, EventBridge fails that entry. If you submit a request in which none of the entries have
        # each of these properties, EventBridge fails the entire request.

        @[JSON::Field(key: "DetailType")]
        getter detail_type : String?

        # The name or ARN of the event bus to receive the event. Only the rules that are associated with this
        # event bus are used to match the event. If you omit this, the default event bus is used. If you're
        # using a global endpoint with a custom bus, you can enter either the name or Amazon Resource Name
        # (ARN) of the event bus in either the primary or secondary Region here. EventBridge then determines
        # the corresponding event bus in the other Region based on the endpoint referenced by the EndpointId .
        # Specifying the event bus ARN is preferred.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily
        # concerns. Any number, including zero, may be present.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        # The source of the event. Detail , DetailType , and Source are required for EventBridge to
        # successfully send an event to an event bus. If you include event entries in a request that do not
        # include each of those properties, EventBridge fails that entry. If you submit a request in which
        # none of the entries have each of these properties, EventBridge fails the entire request.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The time stamp of the event, per RFC3339 . If no time stamp is provided, the time stamp of the
        # PutEvents call is used.

        @[JSON::Field(key: "Time", converter: Aws::Runtime::UnixTimestampConverter)]
        getter time : Time?

        # An X-Ray trace header, which is an http header (X-Amzn-Trace-Id) that contains the trace-id
        # associated with the event. To learn more about X-Ray trace headers, see Tracing header in the X-Ray
        # Developer Guide.

        @[JSON::Field(key: "TraceHeader")]
        getter trace_header : String?

        def initialize(
          @detail : String? = nil,
          @detail_type : String? = nil,
          @event_bus_name : String? = nil,
          @resources : Array(String)? = nil,
          @source : String? = nil,
          @time : Time? = nil,
          @trace_header : String? = nil
        )
        end
      end


      struct PutEventsResponse
        include JSON::Serializable

        # The successfully and unsuccessfully ingested events results. If the ingestion was successful, the
        # entry has the event ID in it. Otherwise, you can use the error code and error message to identify
        # the problem with the entry. For each record, the index of the response element is the same as the
        # index in the request array.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::PutEventsResultEntry)?

        # The number of failed entries.

        @[JSON::Field(key: "FailedEntryCount")]
        getter failed_entry_count : Int32?

        def initialize(
          @entries : Array(Types::PutEventsResultEntry)? = nil,
          @failed_entry_count : Int32? = nil
        )
        end
      end

      # Represents the results of an event submitted to an event bus. If the submission was successful, the
      # entry has the event ID in it. Otherwise, you can use the error code and error message to identify
      # the problem with the entry. For information about the errors that are common to all actions, see
      # Common Errors .

      struct PutEventsResultEntry
        include JSON::Serializable

        # The error code that indicates why the event submission failed. Retryable errors include:
        # InternalFailure The request processing has failed because of an unknown error, exception or failure.
        # ThrottlingException The request was denied due to request throttling. Non-retryable errors include:
        # AccessDeniedException You do not have sufficient access to perform this action.
        # InvalidAccountIdException The account ID provided is not valid. InvalidArgument A specified
        # parameter is not valid. MalformedDetail The JSON provided is not valid. RedactionFailure Redacting
        # the CloudTrail event failed. NotAuthorizedForSourceException You do not have permissions to publish
        # events with this source onto this event bus. NotAuthorizedForDetailTypeException You do not have
        # permissions to publish events with this detail type onto this event bus.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message that explains why the event submission failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @event_id : String? = nil
        )
        end
      end


      struct PutPartnerEventsRequest
        include JSON::Serializable

        # The list of events to write to the event bus.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::PutPartnerEventsRequestEntry)

        def initialize(
          @entries : Array(Types::PutPartnerEventsRequestEntry)
        )
        end
      end

      # The details about an event generated by an SaaS partner.

      struct PutPartnerEventsRequestEntry
        include JSON::Serializable

        # A valid JSON string. There is no other schema imposed. The JSON string may contain fields and nested
        # sub-objects. Detail , DetailType , and Source are required for EventBridge to successfully send an
        # event to an event bus. If you include event entries in a request that do not include each of those
        # properties, EventBridge fails that entry. If you submit a request in which none of the entries have
        # each of these properties, EventBridge fails the entire request.

        @[JSON::Field(key: "Detail")]
        getter detail : String?

        # A free-form string, with a maximum of 128 characters, used to decide what fields to expect in the
        # event detail. Detail , DetailType , and Source are required for EventBridge to successfully send an
        # event to an event bus. If you include event entries in a request that do not include each of those
        # properties, EventBridge fails that entry. If you submit a request in which none of the entries have
        # each of these properties, EventBridge fails the entire request.

        @[JSON::Field(key: "DetailType")]
        getter detail_type : String?

        # Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily
        # concerns. Any number, including zero, may be present.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        # The event source that is generating the entry. Detail , DetailType , and Source are required for
        # EventBridge to successfully send an event to an event bus. If you include event entries in a request
        # that do not include each of those properties, EventBridge fails that entry. If you submit a request
        # in which none of the entries have each of these properties, EventBridge fails the entire request.

        @[JSON::Field(key: "Source")]
        getter source : String?

        # The date and time of the event.

        @[JSON::Field(key: "Time", converter: Aws::Runtime::UnixTimestampConverter)]
        getter time : Time?

        def initialize(
          @detail : String? = nil,
          @detail_type : String? = nil,
          @resources : Array(String)? = nil,
          @source : String? = nil,
          @time : Time? = nil
        )
        end
      end


      struct PutPartnerEventsResponse
        include JSON::Serializable

        # The results for each event entry the partner submitted in this request. If the event was
        # successfully submitted, the entry has the event ID in it. Otherwise, you can use the error code and
        # error message to identify the problem with the entry. For each record, the index of the response
        # element is the same as the index in the request array.

        @[JSON::Field(key: "Entries")]
        getter entries : Array(Types::PutPartnerEventsResultEntry)?

        # The number of events from this operation that could not be written to the partner event bus.

        @[JSON::Field(key: "FailedEntryCount")]
        getter failed_entry_count : Int32?

        def initialize(
          @entries : Array(Types::PutPartnerEventsResultEntry)? = nil,
          @failed_entry_count : Int32? = nil
        )
        end
      end

      # The result of an event entry the partner submitted in this request. If the event was successfully
      # submitted, the entry has the event ID in it. Otherwise, you can use the error code and error message
      # to identify the problem with the entry.

      struct PutPartnerEventsResultEntry
        include JSON::Serializable

        # The error code that indicates why the event submission failed.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message that explains why the event submission failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the event.

        @[JSON::Field(key: "EventId")]
        getter event_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @event_id : String? = nil
        )
        end
      end


      struct PutPermissionRequest
        include JSON::Serializable

        # The action that you are enabling the other account to perform.

        @[JSON::Field(key: "Action")]
        getter action : String?

        # This parameter enables you to limit the permission to accounts that fulfill a certain condition,
        # such as being a member of a certain Amazon Web Services organization. For more information about
        # Amazon Web Services Organizations, see What Is Amazon Web Services Organizations in the Amazon Web
        # Services Organizations User Guide . If you specify Condition with an Amazon Web Services
        # organization ID, and specify "*" as the value for Principal , you grant permission to all the
        # accounts in the named organization. The Condition is a JSON string which must contain Type , Key ,
        # and Value fields.

        @[JSON::Field(key: "Condition")]
        getter condition : Types::Condition?

        # The name of the event bus associated with the rule. If you omit this, the default event bus is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # A JSON string that describes the permission policy statement. You can include a Policy parameter in
        # the request instead of using the StatementId , Action , Principal , or Condition parameters.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        # The 12-digit Amazon Web Services account ID that you are permitting to put events to your default
        # event bus. Specify "*" to permit any account to put events to your default event bus. If you specify
        # "*" without specifying Condition , avoid creating rules that may match undesirable events. To create
        # more secure rules, make sure that the event pattern for each rule contains an account field with a
        # specific account ID from which to receive events. Rules with an account field do not match any
        # events sent from other accounts.

        @[JSON::Field(key: "Principal")]
        getter principal : String?

        # An identifier string for the external account that you are granting permissions to. If you later
        # want to revoke the permission for this external account, specify this StatementId when you run
        # RemovePermission . Each StatementId must be unique.

        @[JSON::Field(key: "StatementId")]
        getter statement_id : String?

        def initialize(
          @action : String? = nil,
          @condition : Types::Condition? = nil,
          @event_bus_name : String? = nil,
          @policy : String? = nil,
          @principal : String? = nil,
          @statement_id : String? = nil
        )
        end
      end


      struct PutRuleRequest
        include JSON::Serializable

        # The name of the rule that you are creating or updating.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description of the rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name or ARN of the event bus to associate with this rule. If you omit this, the default event
        # bus is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # The event pattern. For more information, see Amazon EventBridge event patterns in the Amazon
        # EventBridge User Guide .

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # The Amazon Resource Name (ARN) of the IAM role associated with the rule. If you're setting an event
        # bus in another account as the target and that account granted permission to your account through an
        # organization instead of directly by the account ID, you must specify a RoleArn with proper
        # permissions in the Target structure, instead of here in this parameter.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The scheduling expression. For example, "cron(0 20 * * ? *)" or "rate(5 minutes)".

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # The state of the rule. Valid values include: DISABLED : The rule is disabled. EventBridge does not
        # match any events against the rule. ENABLED : The rule is enabled. EventBridge matches events against
        # the rule, except for Amazon Web Services management events delivered through CloudTrail.
        # ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS : The rule is enabled for all events, including Amazon
        # Web Services management events delivered through CloudTrail. Management events provide visibility
        # into management operations that are performed on resources in your Amazon Web Services account.
        # These are also known as control plane operations. For more information, see Logging management
        # events in the CloudTrail User Guide , and Filtering management events from Amazon Web Services
        # services in the Amazon EventBridge User Guide . This value is only valid for rules on the default
        # event bus or custom event buses . It does not apply to partner event buses .

        @[JSON::Field(key: "State")]
        getter state : String?

        # The list of key-value pairs to associate with the rule.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @event_bus_name : String? = nil,
          @event_pattern : String? = nil,
          @role_arn : String? = nil,
          @schedule_expression : String? = nil,
          @state : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutRuleResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "RuleArn")]
        getter rule_arn : String?

        def initialize(
          @rule_arn : String? = nil
        )
        end
      end


      struct PutTargetsRequest
        include JSON::Serializable

        # The name of the rule.

        @[JSON::Field(key: "Rule")]
        getter rule : String

        # The targets to update or add to the rule.

        @[JSON::Field(key: "Targets")]
        getter targets : Array(Types::Target)

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        def initialize(
          @rule : String,
          @targets : Array(Types::Target),
          @event_bus_name : String? = nil
        )
        end
      end


      struct PutTargetsResponse
        include JSON::Serializable

        # The failed target entries.

        @[JSON::Field(key: "FailedEntries")]
        getter failed_entries : Array(Types::PutTargetsResultEntry)?

        # The number of failed entries.

        @[JSON::Field(key: "FailedEntryCount")]
        getter failed_entry_count : Int32?

        def initialize(
          @failed_entries : Array(Types::PutTargetsResultEntry)? = nil,
          @failed_entry_count : Int32? = nil
        )
        end
      end

      # Represents a target that failed to be added to a rule.

      struct PutTargetsResultEntry
        include JSON::Serializable

        # The error code that indicates why the target addition failed. If the value is
        # ConcurrentModificationException , too many requests were made at the same time.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message that explains why the target addition failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the target.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @target_id : String? = nil
        )
        end
      end

      # These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke the
      # Amazon Redshift Data API ExecuteStatement based on EventBridge events.

      struct RedshiftDataParameters
        include JSON::Serializable

        # The name of the database. Required when authenticating using temporary credentials.

        @[JSON::Field(key: "Database")]
        getter database : String

        # The database user name. Required when authenticating using temporary credentials.

        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The name or ARN of the secret that enables access to the database. Required when authenticating
        # using Amazon Web Services Secrets Manager.

        @[JSON::Field(key: "SecretManagerArn")]
        getter secret_manager_arn : String?

        # The SQL statement text to run.

        @[JSON::Field(key: "Sql")]
        getter sql : String?

        # One or more SQL statements to run. The SQL statements are run as a single transaction. They run
        # serially in the order of the array. Subsequent SQL statements don't start until the previous
        # statement in the array completes. If any SQL statement fails, then because they are run as one
        # transaction, all work is rolled back.

        @[JSON::Field(key: "Sqls")]
        getter sqls : Array(String)?

        # The name of the SQL statement. You can name the SQL statement when you create it to identify the
        # query.

        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # Indicates whether to send an event back to EventBridge after the SQL statement runs.

        @[JSON::Field(key: "WithEvent")]
        getter with_event : Bool?

        def initialize(
          @database : String,
          @db_user : String? = nil,
          @secret_manager_arn : String? = nil,
          @sql : String? = nil,
          @sqls : Array(String)? = nil,
          @statement_name : String? = nil,
          @with_event : Bool? = nil
        )
        end
      end


      struct RemovePermissionRequest
        include JSON::Serializable

        # The name of the event bus to revoke permissions for. If you omit this, the default event bus is
        # used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # Specifies whether to remove all permissions.

        @[JSON::Field(key: "RemoveAllPermissions")]
        getter remove_all_permissions : Bool?

        # The statement ID corresponding to the account that is no longer allowed to put events to the default
        # event bus.

        @[JSON::Field(key: "StatementId")]
        getter statement_id : String?

        def initialize(
          @event_bus_name : String? = nil,
          @remove_all_permissions : Bool? = nil,
          @statement_id : String? = nil
        )
        end
      end


      struct RemoveTargetsRequest
        include JSON::Serializable

        # The IDs of the targets to remove from the rule.

        @[JSON::Field(key: "Ids")]
        getter ids : Array(String)

        # The name of the rule.

        @[JSON::Field(key: "Rule")]
        getter rule : String

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # If this is a managed rule, created by an Amazon Web Services service on your behalf, you must
        # specify Force as True to remove targets. This parameter is ignored for rules that are not managed
        # rules. You can check whether a rule is a managed rule by using DescribeRule or ListRules and
        # checking the ManagedBy field of the response.

        @[JSON::Field(key: "Force")]
        getter force : Bool?

        def initialize(
          @ids : Array(String),
          @rule : String,
          @event_bus_name : String? = nil,
          @force : Bool? = nil
        )
        end
      end


      struct RemoveTargetsResponse
        include JSON::Serializable

        # The failed target entries.

        @[JSON::Field(key: "FailedEntries")]
        getter failed_entries : Array(Types::RemoveTargetsResultEntry)?

        # The number of failed entries.

        @[JSON::Field(key: "FailedEntryCount")]
        getter failed_entry_count : Int32?

        def initialize(
          @failed_entries : Array(Types::RemoveTargetsResultEntry)? = nil,
          @failed_entry_count : Int32? = nil
        )
        end
      end

      # Represents a target that failed to be removed from a rule.

      struct RemoveTargetsResultEntry
        include JSON::Serializable

        # The error code that indicates why the target removal failed. If the value is
        # ConcurrentModificationException , too many requests were made at the same time.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message that explains why the target removal failed.

        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The ID of the target.

        @[JSON::Field(key: "TargetId")]
        getter target_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @target_id : String? = nil
        )
        end
      end

      # A Replay object that contains details about a replay.

      struct Replay
        include JSON::Serializable

        # A time stamp for the time to start replaying events. Any event with a creation time prior to the
        # EventEndTime specified is replayed.

        @[JSON::Field(key: "EventEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_end_time : Time?

        # A time stamp for the time that the last event was replayed.

        @[JSON::Field(key: "EventLastReplayedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_last_replayed_time : Time?

        # The ARN of the archive to replay event from.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String?

        # A time stamp for the time to start replaying events. This is determined by the time in the event as
        # described in Time .

        @[JSON::Field(key: "EventStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_start_time : Time?

        # A time stamp for the time that the replay completed.

        @[JSON::Field(key: "ReplayEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter replay_end_time : Time?

        # The name of the replay.

        @[JSON::Field(key: "ReplayName")]
        getter replay_name : String?

        # A time stamp for the time that the replay started.

        @[JSON::Field(key: "ReplayStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter replay_start_time : Time?

        # The current state of the replay.

        @[JSON::Field(key: "State")]
        getter state : String?

        # A description of why the replay is in the current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @event_end_time : Time? = nil,
          @event_last_replayed_time : Time? = nil,
          @event_source_arn : String? = nil,
          @event_start_time : Time? = nil,
          @replay_end_time : Time? = nil,
          @replay_name : String? = nil,
          @replay_start_time : Time? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # A ReplayDestination object that contains details about a replay.

      struct ReplayDestination
        include JSON::Serializable

        # The ARN of the event bus to replay event to. You can replay events only to the event bus specified
        # to create the archive.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # A list of ARNs for rules to replay events to.

        @[JSON::Field(key: "FilterArns")]
        getter filter_arns : Array(String)?

        def initialize(
          @arn : String,
          @filter_arns : Array(String)? = nil
        )
        end
      end

      # Endpoints can replicate all events to the secondary Region.

      struct ReplicationConfig
        include JSON::Serializable

        # The state of event replication.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @state : String? = nil
        )
        end
      end

      # The resource you are trying to create already exists.

      struct ResourceAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # An entity that you specified does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # A RetryPolicy object that includes information about the retry policy settings.

      struct RetryPolicy
        include JSON::Serializable

        # The maximum amount of time, in seconds, to continue to make retry attempts.

        @[JSON::Field(key: "MaximumEventAgeInSeconds")]
        getter maximum_event_age_in_seconds : Int32?

        # The maximum number of retry attempts to make before the request fails. Retry attempts continue until
        # either the maximum number of attempts is made or until the duration of the MaximumEventAgeInSeconds
        # is met.

        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        def initialize(
          @maximum_event_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil
        )
        end
      end

      # The routing configuration of the endpoint.

      struct RoutingConfig
        include JSON::Serializable

        # The failover configuration for an endpoint. This includes what triggers failover and what happens
        # when it's triggered.

        @[JSON::Field(key: "FailoverConfig")]
        getter failover_config : Types::FailoverConfig

        def initialize(
          @failover_config : Types::FailoverConfig
        )
        end
      end

      # Contains information about a rule in Amazon EventBridge.

      struct Rule
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the rule.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The description of the rule.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The name or ARN of the event bus associated with the rule. If you omit this, the default event bus
        # is used.

        @[JSON::Field(key: "EventBusName")]
        getter event_bus_name : String?

        # The event pattern of the rule. For more information, see Events and Event Patterns in the Amazon
        # EventBridge User Guide .

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # If the rule was created on behalf of your account by an Amazon Web Services service, this field
        # displays the principal name of the service that created the rule.

        @[JSON::Field(key: "ManagedBy")]
        getter managed_by : String?

        # The name of the rule.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Resource Name (ARN) of the role that is used for target invocation. If you're setting an
        # event bus in another account as the target and that account granted permission to your account
        # through an organization instead of directly by the account ID, you must specify a RoleArn with
        # proper permissions in the Target structure, instead of here in this parameter.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The scheduling expression. For example, "cron(0 20 * * ? *)", "rate(5 minutes)". For more
        # information, see Creating an Amazon EventBridge rule that runs on a schedule .

        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # The state of the rule. Valid values include: DISABLED : The rule is disabled. EventBridge does not
        # match any events against the rule. ENABLED : The rule is enabled. EventBridge matches events against
        # the rule, except for Amazon Web Services management events delivered through CloudTrail.
        # ENABLED_WITH_ALL_CLOUDTRAIL_MANAGEMENT_EVENTS : The rule is enabled for all events, including Amazon
        # Web Services management events delivered through CloudTrail. Management events provide visibility
        # into management operations that are performed on resources in your Amazon Web Services account.
        # These are also known as control plane operations. For more information, see Logging management
        # events in the CloudTrail User Guide , and Filtering management events from Amazon Web Services
        # services in the Amazon EventBridge User Guide . This value is only valid for rules on the default
        # event bus or custom event buses . It does not apply to partner event buses .

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @event_bus_name : String? = nil,
          @event_pattern : String? = nil,
          @managed_by : String? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @schedule_expression : String? = nil,
          @state : String? = nil
        )
        end
      end

      # This parameter contains the criteria (either InstanceIds or a tag) used to specify which EC2
      # instances are to be sent the command.

      struct RunCommandParameters
        include JSON::Serializable

        # Currently, we support including only one RunCommandTarget block, which specifies either an array of
        # InstanceIds or a tag.

        @[JSON::Field(key: "RunCommandTargets")]
        getter run_command_targets : Array(Types::RunCommandTarget)

        def initialize(
          @run_command_targets : Array(Types::RunCommandTarget)
        )
        end
      end

      # Information about the EC2 instances that are to be sent the command, specified as key-value pairs.
      # Each RunCommandTarget block can include only one key, but this key may specify multiple values.

      struct RunCommandTarget
        include JSON::Serializable

        # Can be either tag: tag-key or InstanceIds .

        @[JSON::Field(key: "Key")]
        getter key : String

        # If Key is tag: tag-key , Values is a list of tag values. If Key is InstanceIds , Values is a list of
        # Amazon EC2 instance IDs.

        @[JSON::Field(key: "Values")]
        getter values : Array(String)

        def initialize(
          @key : String,
          @values : Array(String)
        )
        end
      end

      # Name/Value pair of a parameter to start execution of a SageMaker AI Model Building Pipeline.

      struct SageMakerPipelineParameter
        include JSON::Serializable

        # Name of parameter to start execution of a SageMaker AI Model Building Pipeline.

        @[JSON::Field(key: "Name")]
        getter name : String

        # Value of parameter to start execution of a SageMaker AI Model Building Pipeline.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # These are custom parameters to use when the target is a SageMaker AI Model Building Pipeline that
      # starts based on EventBridge events.

      struct SageMakerPipelineParameters
        include JSON::Serializable

        # List of Parameter names and values for SageMaker AI Model Building Pipeline execution.

        @[JSON::Field(key: "PipelineParameterList")]
        getter pipeline_parameter_list : Array(Types::SageMakerPipelineParameter)?

        def initialize(
          @pipeline_parameter_list : Array(Types::SageMakerPipelineParameter)? = nil
        )
        end
      end

      # The secondary Region that processes events when failover is triggered or replication is enabled.

      struct Secondary
        include JSON::Serializable

        # Defines the secondary Region.

        @[JSON::Field(key: "Route")]
        getter route : String

        def initialize(
          @route : String
        )
        end
      end

      # This structure includes the custom parameter to be used when the target is an SQS FIFO queue.

      struct SqsParameters
        include JSON::Serializable

        # The FIFO message group ID to use as the target.

        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        def initialize(
          @message_group_id : String? = nil
        )
        end
      end


      struct StartReplayRequest
        include JSON::Serializable

        # A ReplayDestination object that includes details about the destination for the replay.

        @[JSON::Field(key: "Destination")]
        getter destination : Types::ReplayDestination

        # A time stamp for the time to stop replaying events. Only events that occurred between the
        # EventStartTime and EventEndTime are replayed.

        @[JSON::Field(key: "EventEndTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_end_time : Time

        # The ARN of the archive to replay events from.

        @[JSON::Field(key: "EventSourceArn")]
        getter event_source_arn : String

        # A time stamp for the time to start replaying events. Only events that occurred between the
        # EventStartTime and EventEndTime are replayed.

        @[JSON::Field(key: "EventStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter event_start_time : Time

        # The name of the replay to start.

        @[JSON::Field(key: "ReplayName")]
        getter replay_name : String

        # A description for the replay to start.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @destination : Types::ReplayDestination,
          @event_end_time : Time,
          @event_source_arn : String,
          @event_start_time : Time,
          @replay_name : String,
          @description : String? = nil
        )
        end
      end


      struct StartReplayResponse
        include JSON::Serializable

        # The ARN of the replay.

        @[JSON::Field(key: "ReplayArn")]
        getter replay_arn : String?

        # The time at which the replay started.

        @[JSON::Field(key: "ReplayStartTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter replay_start_time : Time?

        # The state of the replay.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason that the replay is in the state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @replay_arn : String? = nil,
          @replay_start_time : Time? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # A key-value pair associated with an Amazon Web Services resource. In EventBridge, rules and event
      # buses support tagging.

      struct Tag
        include JSON::Serializable

        # A string you can use to assign a value. The combination of tag keys and values can help you organize
        # and categorize your resources.

        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the specified tag key.

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the EventBridge resource that you're adding tags to.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.

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

      # Targets are the resources to be invoked when a rule is triggered. For a complete list of services
      # and resources that can be set as a target, see PutTargets . If you are setting the event bus of
      # another account as the target, and that account granted permission to your account through an
      # organization instead of directly by the account ID, then you must specify a RoleArn with proper
      # permissions in the Target structure. For more information, see Sending and Receiving Events Between
      # Amazon Web Services Accounts in the Amazon EventBridge User Guide .

      struct Target
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The ID of the target within the specified rule. Use this ID to reference the target when updating
        # the rule. We recommend using a memorable and unique string.

        @[JSON::Field(key: "Id")]
        getter id : String

        # Contains the GraphQL operation to be parsed and executed, if the event target is an AppSync API.

        @[JSON::Field(key: "AppSyncParameters")]
        getter app_sync_parameters : Types::AppSyncParameters?

        # If the event target is an Batch job, this contains the job definition, job name, and other
        # parameters. For more information, see Jobs in the Batch User Guide .

        @[JSON::Field(key: "BatchParameters")]
        getter batch_parameters : Types::BatchParameters?

        # The DeadLetterConfig that defines the target queue to send dead-letter queue events to.

        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # Contains the Amazon ECS task definition and task count to be used, if the event target is an Amazon
        # ECS task. For more information about Amazon ECS tasks, see Task Definitions in the Amazon EC2
        # Container Service Developer Guide .

        @[JSON::Field(key: "EcsParameters")]
        getter ecs_parameters : Types::EcsParameters?

        # Contains the HTTP parameters to use when the target is a API Gateway endpoint or EventBridge
        # ApiDestination. If you specify an API Gateway API or EventBridge ApiDestination as a target, you can
        # use this parameter to specify headers, path parameters, and query string keys/values as part of your
        # target invoking request. If you're using ApiDestinations, the corresponding Connection can also have
        # these values configured. In case of any conflicting keys, values from the Connection take
        # precedence.

        @[JSON::Field(key: "HttpParameters")]
        getter http_parameters : Types::HttpParameters?

        # Valid JSON text passed to the target. In this case, nothing from the event itself is passed to the
        # target. For more information, see The JavaScript Object Notation (JSON) Data Interchange Format .

        @[JSON::Field(key: "Input")]
        getter input : String?

        # The value of the JSONPath that is used for extracting part of the matched event when passing it to
        # the target. You may use JSON dot notation or bracket notation. For more information about JSON
        # paths, see JSONPath .

        @[JSON::Field(key: "InputPath")]
        getter input_path : String?

        # Settings to enable you to provide custom input to a target based on certain event data. You can
        # extract one or more key-value pairs from the event and then use that data to send customized input
        # to the target.

        @[JSON::Field(key: "InputTransformer")]
        getter input_transformer : Types::InputTransformer?

        # The custom parameter you can use to control the shard assignment, when the target is a Kinesis data
        # stream. If you do not include this parameter, the default is to use the eventId as the partition
        # key.

        @[JSON::Field(key: "KinesisParameters")]
        getter kinesis_parameters : Types::KinesisParameters?

        # Contains the Amazon Redshift Data API parameters to use when the target is a Amazon Redshift
        # cluster. If you specify a Amazon Redshift Cluster as a Target, you can use this to specify
        # parameters to invoke the Amazon Redshift Data API ExecuteStatement based on EventBridge events.

        @[JSON::Field(key: "RedshiftDataParameters")]
        getter redshift_data_parameters : Types::RedshiftDataParameters?

        # The retry policy configuration to use for the dead-letter queue.

        @[JSON::Field(key: "RetryPolicy")]
        getter retry_policy : Types::RetryPolicy?

        # The Amazon Resource Name (ARN) of the IAM role to be used for this target when the rule is
        # triggered. If one rule triggers multiple targets, you can use a different IAM role for each target.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Parameters used when you are using the rule to invoke Amazon EC2 Run Command.

        @[JSON::Field(key: "RunCommandParameters")]
        getter run_command_parameters : Types::RunCommandParameters?

        # Contains the SageMaker AI Model Building Pipeline parameters to start execution of a SageMaker AI
        # Model Building Pipeline. If you specify a SageMaker AI Model Building Pipeline as a target, you can
        # use this to specify parameters to start a pipeline execution based on EventBridge events.

        @[JSON::Field(key: "SageMakerPipelineParameters")]
        getter sage_maker_pipeline_parameters : Types::SageMakerPipelineParameters?

        # Contains the message group ID to use when the target is a FIFO queue. If you specify an SQS FIFO
        # queue as a target, the queue must have content-based deduplication enabled.

        @[JSON::Field(key: "SqsParameters")]
        getter sqs_parameters : Types::SqsParameters?

        def initialize(
          @arn : String,
          @id : String,
          @app_sync_parameters : Types::AppSyncParameters? = nil,
          @batch_parameters : Types::BatchParameters? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @ecs_parameters : Types::EcsParameters? = nil,
          @http_parameters : Types::HttpParameters? = nil,
          @input : String? = nil,
          @input_path : String? = nil,
          @input_transformer : Types::InputTransformer? = nil,
          @kinesis_parameters : Types::KinesisParameters? = nil,
          @redshift_data_parameters : Types::RedshiftDataParameters? = nil,
          @retry_policy : Types::RetryPolicy? = nil,
          @role_arn : String? = nil,
          @run_command_parameters : Types::RunCommandParameters? = nil,
          @sage_maker_pipeline_parameters : Types::SageMakerPipelineParameters? = nil,
          @sqs_parameters : Types::SqsParameters? = nil
        )
        end
      end


      struct TestEventPatternRequest
        include JSON::Serializable

        # The event, in JSON format, to test against the event pattern. The JSON must follow the format
        # specified in Amazon Web Services Events , and the following fields are mandatory: id account source
        # time region resources detail-type

        @[JSON::Field(key: "Event")]
        getter event : String

        # The event pattern. For more information, see Events and Event Patterns in the Amazon EventBridge
        # User Guide .

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String

        def initialize(
          @event : String,
          @event_pattern : String
        )
        end
      end


      struct TestEventPatternResponse
        include JSON::Serializable

        # Indicates whether the event matches the event pattern.

        @[JSON::Field(key: "Result")]
        getter result : Bool?

        def initialize(
          @result : Bool? = nil
        )
        end
      end

      # This request cannot be completed due to throttling issues.

      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the EventBridge resource from which you are removing tags.

        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.

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


      struct UpdateApiDestinationRequest
        include JSON::Serializable

        # The name of the API destination to update.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN of the connection to use for the API destination.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The name of the API destination to update.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The method to use for the API destination.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String?

        # The URL to the endpoint to use for the API destination.

        @[JSON::Field(key: "InvocationEndpoint")]
        getter invocation_endpoint : String?

        # The maximum number of invocations per second to send to the API destination.

        @[JSON::Field(key: "InvocationRateLimitPerSecond")]
        getter invocation_rate_limit_per_second : Int32?

        def initialize(
          @name : String,
          @connection_arn : String? = nil,
          @description : String? = nil,
          @http_method : String? = nil,
          @invocation_endpoint : String? = nil,
          @invocation_rate_limit_per_second : Int32? = nil
        )
        end
      end


      struct UpdateApiDestinationResponse
        include JSON::Serializable

        # The ARN of the API destination that was updated.

        @[JSON::Field(key: "ApiDestinationArn")]
        getter api_destination_arn : String?

        # The state of the API destination that was updated.

        @[JSON::Field(key: "ApiDestinationState")]
        getter api_destination_state : String?

        # A time stamp for the time that the API destination was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp for the time that the API destination was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @api_destination_arn : String? = nil,
          @api_destination_state : String? = nil,
          @creation_time : Time? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct UpdateArchiveRequest
        include JSON::Serializable

        # The name of the archive to update.

        @[JSON::Field(key: "ArchiveName")]
        getter archive_name : String

        # The description for the archive.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The event pattern to use to filter events sent to the archive.

        @[JSON::Field(key: "EventPattern")]
        getter event_pattern : String?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt this archive. The identifier can be the key Amazon Resource Name
        # (ARN), KeyId, key alias, or key alias ARN. If you do not specify a customer managed key identifier,
        # EventBridge uses an Amazon Web Services owned key to encrypt the archive. For more information, see
        # Identify and view keys in the Key Management Service Developer Guide . If you have specified that
        # EventBridge use a customer managed key for encrypting the source event bus, we strongly recommend
        # you also specify a customer managed key for any archives for the event bus as well. For more
        # information, see Encrypting archives in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The number of days to retain events in the archive.

        @[JSON::Field(key: "RetentionDays")]
        getter retention_days : Int32?

        def initialize(
          @archive_name : String,
          @description : String? = nil,
          @event_pattern : String? = nil,
          @kms_key_identifier : String? = nil,
          @retention_days : Int32? = nil
        )
        end
      end


      struct UpdateArchiveResponse
        include JSON::Serializable

        # The ARN of the archive.

        @[JSON::Field(key: "ArchiveArn")]
        getter archive_arn : String?

        # The time at which the archive was updated.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # The state of the archive.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The reason that the archive is in the current state.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        def initialize(
          @archive_arn : String? = nil,
          @creation_time : Time? = nil,
          @state : String? = nil,
          @state_reason : String? = nil
        )
        end
      end

      # Contains the API key authorization parameters to use to update the connection.

      struct UpdateConnectionApiKeyAuthRequestParameters
        include JSON::Serializable

        # The name of the API key to use for authorization.

        @[JSON::Field(key: "ApiKeyName")]
        getter api_key_name : String?

        # The value associated with the API key to use for authorization.

        @[JSON::Field(key: "ApiKeyValue")]
        getter api_key_value : String?

        def initialize(
          @api_key_name : String? = nil,
          @api_key_value : String? = nil
        )
        end
      end

      # Contains the additional parameters to use for the connection.

      struct UpdateConnectionAuthRequestParameters
        include JSON::Serializable

        # The authorization parameters for API key authorization.

        @[JSON::Field(key: "ApiKeyAuthParameters")]
        getter api_key_auth_parameters : Types::UpdateConnectionApiKeyAuthRequestParameters?

        # The authorization parameters for Basic authorization.

        @[JSON::Field(key: "BasicAuthParameters")]
        getter basic_auth_parameters : Types::UpdateConnectionBasicAuthRequestParameters?

        # If you specify a private OAuth endpoint, the parameters for EventBridge to use when authenticating
        # against the endpoint. For more information, see Authorization methods for connections in the Amazon
        # EventBridge User Guide .

        @[JSON::Field(key: "ConnectivityParameters")]
        getter connectivity_parameters : Types::ConnectivityResourceParameters?

        # The additional parameters to use for the connection.

        @[JSON::Field(key: "InvocationHttpParameters")]
        getter invocation_http_parameters : Types::ConnectionHttpParameters?

        # The authorization parameters for OAuth authorization.

        @[JSON::Field(key: "OAuthParameters")]
        getter o_auth_parameters : Types::UpdateConnectionOAuthRequestParameters?

        def initialize(
          @api_key_auth_parameters : Types::UpdateConnectionApiKeyAuthRequestParameters? = nil,
          @basic_auth_parameters : Types::UpdateConnectionBasicAuthRequestParameters? = nil,
          @connectivity_parameters : Types::ConnectivityResourceParameters? = nil,
          @invocation_http_parameters : Types::ConnectionHttpParameters? = nil,
          @o_auth_parameters : Types::UpdateConnectionOAuthRequestParameters? = nil
        )
        end
      end

      # The Basic authorization parameters for the connection.

      struct UpdateConnectionBasicAuthRequestParameters
        include JSON::Serializable

        # The password associated with the user name to use for Basic authorization.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The user name to use for Basic authorization.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @password : String? = nil,
          @username : String? = nil
        )
        end
      end

      # The OAuth authorization parameters to use for the connection.

      struct UpdateConnectionOAuthClientRequestParameters
        include JSON::Serializable

        # The client ID to use for OAuth authorization.

        @[JSON::Field(key: "ClientID")]
        getter client_id : String?

        # The client secret assciated with the client ID to use for OAuth authorization.

        @[JSON::Field(key: "ClientSecret")]
        getter client_secret : String?

        def initialize(
          @client_id : String? = nil,
          @client_secret : String? = nil
        )
        end
      end

      # The OAuth request parameters to use for the connection.

      struct UpdateConnectionOAuthRequestParameters
        include JSON::Serializable

        # The URL to the authorization endpoint when OAuth is specified as the authorization type.

        @[JSON::Field(key: "AuthorizationEndpoint")]
        getter authorization_endpoint : String?

        # The client parameters to use for the connection when OAuth is specified as the authorization type.

        @[JSON::Field(key: "ClientParameters")]
        getter client_parameters : Types::UpdateConnectionOAuthClientRequestParameters?

        # The method used to connect to the HTTP endpoint.

        @[JSON::Field(key: "HttpMethod")]
        getter http_method : String?

        # The additional HTTP parameters used for the OAuth authorization request.

        @[JSON::Field(key: "OAuthHttpParameters")]
        getter o_auth_http_parameters : Types::ConnectionHttpParameters?

        def initialize(
          @authorization_endpoint : String? = nil,
          @client_parameters : Types::UpdateConnectionOAuthClientRequestParameters? = nil,
          @http_method : String? = nil,
          @o_auth_http_parameters : Types::ConnectionHttpParameters? = nil
        )
        end
      end


      struct UpdateConnectionRequest
        include JSON::Serializable

        # The name of the connection to update.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The authorization parameters to use for the connection.

        @[JSON::Field(key: "AuthParameters")]
        getter auth_parameters : Types::UpdateConnectionAuthRequestParameters?

        # The type of authorization to use for the connection.

        @[JSON::Field(key: "AuthorizationType")]
        getter authorization_type : String?

        # A description for the connection.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # For connections to private APIs, the parameters to use for invoking the API. For more information,
        # see Connecting to private APIs in the Amazon EventBridge User Guide .

        @[JSON::Field(key: "InvocationConnectivityParameters")]
        getter invocation_connectivity_parameters : Types::ConnectivityResourceParameters?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt this connection. The identifier can be the key Amazon Resource Name
        # (ARN), KeyId, key alias, or key alias ARN. If you do not specify a customer managed key identifier,
        # EventBridge uses an Amazon Web Services owned key to encrypt the connection. For more information,
        # see Identify and view keys in the Key Management Service Developer Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        def initialize(
          @name : String,
          @auth_parameters : Types::UpdateConnectionAuthRequestParameters? = nil,
          @authorization_type : String? = nil,
          @description : String? = nil,
          @invocation_connectivity_parameters : Types::ConnectivityResourceParameters? = nil,
          @kms_key_identifier : String? = nil
        )
        end
      end


      struct UpdateConnectionResponse
        include JSON::Serializable

        # The ARN of the connection that was updated.

        @[JSON::Field(key: "ConnectionArn")]
        getter connection_arn : String?

        # The state of the connection that was updated.

        @[JSON::Field(key: "ConnectionState")]
        getter connection_state : String?

        # A time stamp for the time that the connection was created.

        @[JSON::Field(key: "CreationTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter creation_time : Time?

        # A time stamp for the time that the connection was last authorized.

        @[JSON::Field(key: "LastAuthorizedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_authorized_time : Time?

        # A time stamp for the time that the connection was last modified.

        @[JSON::Field(key: "LastModifiedTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_modified_time : Time?

        def initialize(
          @connection_arn : String? = nil,
          @connection_state : String? = nil,
          @creation_time : Time? = nil,
          @last_authorized_time : Time? = nil,
          @last_modified_time : Time? = nil
        )
        end
      end


      struct UpdateEndpointRequest
        include JSON::Serializable

        # The name of the endpoint you want to update.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A description for the endpoint.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Define event buses used for replication.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EndpointEventBus)?

        # Whether event replication was enabled or disabled by this request.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        # The ARN of the role used by event replication for this request.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # Configure the routing policy, including the health check and secondary Region.

        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::RoutingConfig?

        def initialize(
          @name : String,
          @description : String? = nil,
          @event_buses : Array(Types::EndpointEventBus)? = nil,
          @replication_config : Types::ReplicationConfig? = nil,
          @role_arn : String? = nil,
          @routing_config : Types::RoutingConfig? = nil
        )
        end
      end


      struct UpdateEndpointResponse
        include JSON::Serializable

        # The ARN of the endpoint you updated in this request.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The ID of the endpoint you updated in this request.

        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # The URL of the endpoint you updated in this request.

        @[JSON::Field(key: "EndpointUrl")]
        getter endpoint_url : String?

        # The event buses used for replication for the endpoint you updated in this request.

        @[JSON::Field(key: "EventBuses")]
        getter event_buses : Array(Types::EndpointEventBus)?

        # The name of the endpoint you updated in this request.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Whether event replication was enabled or disabled for the endpoint you updated in this request.

        @[JSON::Field(key: "ReplicationConfig")]
        getter replication_config : Types::ReplicationConfig?

        # The ARN of the role used by event replication for the endpoint you updated in this request.

        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The routing configuration you updated in this request.

        @[JSON::Field(key: "RoutingConfig")]
        getter routing_config : Types::RoutingConfig?

        # The state of the endpoint you updated in this request.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @endpoint_id : String? = nil,
          @endpoint_url : String? = nil,
          @event_buses : Array(Types::EndpointEventBus)? = nil,
          @name : String? = nil,
          @replication_config : Types::ReplicationConfig? = nil,
          @role_arn : String? = nil,
          @routing_config : Types::RoutingConfig? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateEventBusRequest
        include JSON::Serializable


        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The event bus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt events on this event bus. The identifier can be the key Amazon
        # Resource Name (ARN), KeyId, key alias, or key alias ARN. If you do not specify a customer managed
        # key identifier, EventBridge uses an Amazon Web Services owned key to encrypt events on the event
        # bus. For more information, see Identify and view keys in the Key Management Service Developer Guide
        # . Schema discovery is not supported for event buses encrypted using a customer managed key.
        # EventBridge returns an error if: You call CreateDiscoverer on an event bus set to use a customer
        # managed key for encryption. You call UpdatedEventBus to set a customer managed key on an event bus
        # with schema discovery enabled. To enable schema discovery on an event bus, choose to use an Amazon
        # Web Services owned key. For more information, see Encrypting events in the Amazon EventBridge User
        # Guide . If you have specified that EventBridge use a customer managed key for encrypting the source
        # event bus, we strongly recommend you also specify a customer managed key for any archives for the
        # event bus as well. For more information, see Encrypting archives in the Amazon EventBridge User
        # Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The logging configuration settings for the event bus. For more information, see Configuring logs for
        # event buses in the EventBridge User Guide .

        @[JSON::Field(key: "LogConfig")]
        getter log_config : Types::LogConfig?

        # The name of the event bus.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @kms_key_identifier : String? = nil,
          @log_config : Types::LogConfig? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateEventBusResponse
        include JSON::Serializable

        # The event bus Amazon Resource Name (ARN).

        @[JSON::Field(key: "Arn")]
        getter arn : String?


        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The event bus description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The identifier of the KMS customer managed key for EventBridge to use to encrypt events on this
        # event bus, if one has been specified. For more information, see Data encryption in EventBridge in
        # the Amazon EventBridge User Guide .

        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The logging configuration settings for the event bus. For more information, see Configuring logs for
        # event buses in the EventBridge User Guide .

        @[JSON::Field(key: "LogConfig")]
        getter log_config : Types::LogConfig?

        # The event bus name.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @description : String? = nil,
          @kms_key_identifier : String? = nil,
          @log_config : Types::LogConfig? = nil,
          @name : String? = nil
        )
        end
      end
    end
  end
end
