require "json"
require "time"

module AwsSdk
  module AppFabric
    module Types

      # You are not authorized to perform this operation.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Contains API key credential information.
      struct ApiKeyCredential
        include JSON::Serializable

        # An API key for an application.
        @[JSON::Field(key: "apiKey")]
        getter api_key : String

        def initialize(
          @api_key : String
        )
        end
      end

      # Contains information about an app authorization.
      struct AppAuthorization
        include JSON::Serializable

        # The name of the application.
        @[JSON::Field(key: "app")]
        getter app : String

        # The Amazon Resource Name (ARN) of the app authorization.
        @[JSON::Field(key: "appAuthorizationArn")]
        getter app_authorization_arn : String

        # The Amazon Resource Name (ARN) of the app bundle for the app authorization.
        @[JSON::Field(key: "appBundleArn")]
        getter app_bundle_arn : String

        # The authorization type.
        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # The timestamp of when the app authorization was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The state of the app authorization. The following states are possible: PendingConnect : The initial
        # state of the app authorization. The app authorization is created but not yet connected. Connected :
        # The app authorization is connected to the application, and is ready to be used.
        # ConnectionValidationFailed : The app authorization received a validation exception when trying to
        # connect to the application. If the app authorization is in this state, you should verify the
        # configured credentials and try to connect the app authorization again. TokenAutoRotationFailed :
        # AppFabric failed to refresh the access token. If the app authorization is in this state, you should
        # try to reconnect the app authorization.
        @[JSON::Field(key: "status")]
        getter status : String

        # Contains information about an application tenant, such as the application display name and
        # identifier.
        @[JSON::Field(key: "tenant")]
        getter tenant : Types::Tenant

        # The timestamp of when the app authorization was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The application URL for the OAuth flow.
        @[JSON::Field(key: "authUrl")]
        getter auth_url : String?

        # The user persona of the app authorization. This field should always be admin .
        @[JSON::Field(key: "persona")]
        getter persona : String?

        def initialize(
          @app : String,
          @app_authorization_arn : String,
          @app_bundle_arn : String,
          @auth_type : String,
          @created_at : Time,
          @status : String,
          @tenant : Types::Tenant,
          @updated_at : Time,
          @auth_url : String? = nil,
          @persona : String? = nil
        )
        end
      end

      # Contains a summary of an app authorization.
      struct AppAuthorizationSummary
        include JSON::Serializable

        # The name of the application.
        @[JSON::Field(key: "app")]
        getter app : String

        # The Amazon Resource Name (ARN) of the app authorization.
        @[JSON::Field(key: "appAuthorizationArn")]
        getter app_authorization_arn : String

        # The Amazon Resource Name (ARN) of the app bundle for the app authorization.
        @[JSON::Field(key: "appBundleArn")]
        getter app_bundle_arn : String

        # The state of the app authorization. The following states are possible: PendingConnect : The initial
        # state of the app authorization. The app authorization is created but not yet connected. Connected :
        # The app authorization is connected to the application, and is ready to be used.
        # ConnectionValidationFailed : The app authorization received a validation exception when trying to
        # connect to the application. If the app authorization is in this state, you should verify the
        # configured credentials and try to connect the app authorization again. TokenAutoRotationFailed :
        # AppFabric failed to refresh the access token. If the app authorization is in this state, you should
        # try to reconnect the app authorization.
        @[JSON::Field(key: "status")]
        getter status : String

        # Contains information about an application tenant, such as the application display name and
        # identifier.
        @[JSON::Field(key: "tenant")]
        getter tenant : Types::Tenant

        # Timestamp for when the app authorization was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @app : String,
          @app_authorization_arn : String,
          @app_bundle_arn : String,
          @status : String,
          @tenant : Types::Tenant,
          @updated_at : Time
        )
        end
      end

      # Contains information about an app bundle.
      struct AppBundle
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the app bundle.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS) key used to encrypt the
        # application data.
        @[JSON::Field(key: "customerManagedKeyArn")]
        getter customer_managed_key_arn : String?

        def initialize(
          @arn : String,
          @customer_managed_key_arn : String? = nil
        )
        end
      end

      # Contains a summary of an app bundle.
      struct AppBundleSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the app bundle.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Contains information about an audit log destination configuration.
      struct AuditLogDestinationConfiguration
        include JSON::Serializable

        # Contains information about an audit log destination.
        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination

        def initialize(
          @destination : Types::Destination
        )
        end
      end

      # Contains information about an audit log processing configuration.
      struct AuditLogProcessingConfiguration
        include JSON::Serializable

        # The format in which the audit logs need to be formatted.
        @[JSON::Field(key: "format")]
        getter format : String

        # The event schema in which the audit logs need to be formatted.
        @[JSON::Field(key: "schema")]
        getter schema : String

        def initialize(
          @format : String,
          @schema : String
        )
        end
      end

      # Contains authorization request information, which is required for Amazon Web Services AppFabric to
      # get the OAuth2 access token for an application.
      struct AuthRequest
        include JSON::Serializable

        # The authorization code returned by the application after permission is granted in the application
        # OAuth page (after clicking on the AuthURL).
        @[JSON::Field(key: "code")]
        getter code : String

        # The redirect URL that is specified in the AuthURL and the application client.
        @[JSON::Field(key: "redirectUri")]
        getter redirect_uri : String

        def initialize(
          @code : String,
          @redirect_uri : String
        )
        end
      end

      struct BatchGetUserAccessTasksRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The tasks IDs to use for the request.
        @[JSON::Field(key: "taskIdList")]
        getter task_id_list : Array(String)

        def initialize(
          @app_bundle_identifier : String,
          @task_id_list : Array(String)
        )
        end
      end

      struct BatchGetUserAccessTasksResponse
        include JSON::Serializable

        # Contains a list of user access results.
        @[JSON::Field(key: "userAccessResultsList")]
        getter user_access_results_list : Array(Types::UserAccessResultItem)?

        def initialize(
          @user_access_results_list : Array(Types::UserAccessResultItem)? = nil
        )
        end
      end

      # The request has created a conflict. Check the request parameters and try again.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct ConnectAppAuthorizationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app authorization to use
        # for the request.
        @[JSON::Field(key: "appAuthorizationIdentifier")]
        getter app_authorization_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle that contains
        # the app authorization to use for the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # Contains OAuth2 authorization information. This is required if the app authorization for the request
        # is configured with an OAuth2 ( oauth2 ) authorization type.
        @[JSON::Field(key: "authRequest")]
        getter auth_request : Types::AuthRequest?

        def initialize(
          @app_authorization_identifier : String,
          @app_bundle_identifier : String,
          @auth_request : Types::AuthRequest? = nil
        )
        end
      end

      struct ConnectAppAuthorizationResponse
        include JSON::Serializable

        # Contains a summary of the app authorization.
        @[JSON::Field(key: "appAuthorizationSummary")]
        getter app_authorization_summary : Types::AppAuthorizationSummary

        def initialize(
          @app_authorization_summary : Types::AppAuthorizationSummary
        )
        end
      end

      struct CreateAppAuthorizationRequest
        include JSON::Serializable

        # The name of the application. Valid values are: SLACK ASANA JIRA M365 M365AUDITLOGS ZOOM ZENDESK OKTA
        # GOOGLE DROPBOX SMARTSHEET CISCO
        @[JSON::Field(key: "app")]
        getter app : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The authorization type for the app authorization.
        @[JSON::Field(key: "authType")]
        getter auth_type : String

        # Contains credentials for the application, such as an API key or OAuth2 client ID and secret. Specify
        # credentials that match the authorization type for your request. For example, if the authorization
        # type for your request is OAuth2 ( oauth2 ), then you should provide only the OAuth2 credentials.
        @[JSON::Field(key: "credential")]
        getter credential : Types::Credential

        # Contains information about an application tenant, such as the application display name and
        # identifier.
        @[JSON::Field(key: "tenant")]
        getter tenant : Types::Tenant

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A map of the key-value pairs of the tag or tags to assign to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app : String,
          @app_bundle_identifier : String,
          @auth_type : String,
          @credential : Types::Credential,
          @tenant : Types::Tenant,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAppAuthorizationResponse
        include JSON::Serializable

        # Contains information about an app authorization.
        @[JSON::Field(key: "appAuthorization")]
        getter app_authorization : Types::AppAuthorization

        def initialize(
          @app_authorization : Types::AppAuthorization
        )
        end
      end

      struct CreateAppBundleRequest
        include JSON::Serializable

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Resource Name (ARN) of the Key Management Service (KMS) key to use to encrypt the
        # application data. If this is not specified, an Amazon Web Services owned key is used for encryption.
        @[JSON::Field(key: "customerManagedKeyIdentifier")]
        getter customer_managed_key_identifier : String?

        # A map of the key-value pairs of the tag or tags to assign to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @client_token : String? = nil,
          @customer_managed_key_identifier : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateAppBundleResponse
        include JSON::Serializable

        # Contains information about an app bundle.
        @[JSON::Field(key: "appBundle")]
        getter app_bundle : Types::AppBundle

        def initialize(
          @app_bundle : Types::AppBundle
        )
        end
      end

      struct CreateIngestionDestinationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # Contains information about the destination of ingested data.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        # Contains information about how ingested data is processed.
        @[JSON::Field(key: "processingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A map of the key-value pairs of the tag or tags to assign to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app_bundle_identifier : String,
          @destination_configuration : Types::DestinationConfiguration,
          @ingestion_identifier : String,
          @processing_configuration : Types::ProcessingConfiguration,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateIngestionDestinationResponse
        include JSON::Serializable

        # Contains information about an ingestion destination.
        @[JSON::Field(key: "ingestionDestination")]
        getter ingestion_destination : Types::IngestionDestination

        def initialize(
          @ingestion_destination : Types::IngestionDestination
        )
        end
      end

      struct CreateIngestionRequest
        include JSON::Serializable

        # The name of the application. Valid values are: SLACK ASANA JIRA M365 M365AUDITLOGS ZOOM ZENDESK OKTA
        # GOOGLE DROPBOX SMARTSHEET CISCO
        @[JSON::Field(key: "app")]
        getter app : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The ingestion type.
        @[JSON::Field(key: "ingestionType")]
        getter ingestion_type : String

        # The ID of the application tenant.
        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String

        # Specifies a unique, case-sensitive identifier that you provide to ensure the idempotency of the
        # request. This lets you safely retry the request without accidentally performing the same operation a
        # second time. Passing the same value to a later call to an operation requires that you also pass the
        # same value for all other parameters. We recommend that you use a UUID type of value . If you don't
        # provide this value, then Amazon Web Services generates a random one for you. If you retry the
        # operation with the same ClientToken , but with different parameters, the retry fails with an
        # IdempotentParameterMismatch error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # A map of the key-value pairs of the tag or tags to assign to the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @app : String,
          @app_bundle_identifier : String,
          @ingestion_type : String,
          @tenant_id : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateIngestionResponse
        include JSON::Serializable

        # Contains information about an ingestion.
        @[JSON::Field(key: "ingestion")]
        getter ingestion : Types::Ingestion

        def initialize(
          @ingestion : Types::Ingestion
        )
        end
      end

      # Contains credential information for an application.
      struct Credential
        include JSON::Serializable

        # Contains API key credential information.
        @[JSON::Field(key: "apiKeyCredential")]
        getter api_key_credential : Types::ApiKeyCredential?

        # Contains OAuth2 client credential information.
        @[JSON::Field(key: "oauth2Credential")]
        getter oauth2_credential : Types::Oauth2Credential?

        def initialize(
          @api_key_credential : Types::ApiKeyCredential? = nil,
          @oauth2_credential : Types::Oauth2Credential? = nil
        )
        end
      end

      struct DeleteAppAuthorizationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app authorization to use
        # for the request.
        @[JSON::Field(key: "appAuthorizationIdentifier")]
        getter app_authorization_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        def initialize(
          @app_authorization_identifier : String,
          @app_bundle_identifier : String
        )
        end
      end

      struct DeleteAppAuthorizationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteAppBundleRequest
        include JSON::Serializable

        # The ID or Amazon Resource Name (ARN) of the app bundle that needs to be deleted.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        def initialize(
          @app_bundle_identifier : String
        )
        end
      end

      struct DeleteAppBundleResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteIngestionDestinationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion destination to
        # use for the request.
        @[JSON::Field(key: "ingestionDestinationIdentifier")]
        getter ingestion_destination_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_destination_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct DeleteIngestionDestinationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteIngestionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct DeleteIngestionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains information about an audit log destination.
      struct Destination
        include JSON::Serializable

        # Contains information about an Amazon Kinesis Data Firehose delivery stream.
        @[JSON::Field(key: "firehoseStream")]
        getter firehose_stream : Types::FirehoseStream?

        # Contains information about an Amazon S3 bucket.
        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : Types::S3Bucket?

        def initialize(
          @firehose_stream : Types::FirehoseStream? = nil,
          @s3_bucket : Types::S3Bucket? = nil
        )
        end
      end

      # Contains information about the destination of ingested data.
      struct DestinationConfiguration
        include JSON::Serializable

        # Contains information about an audit log destination configuration.
        @[JSON::Field(key: "auditLog")]
        getter audit_log : Types::AuditLogDestinationConfiguration?

        def initialize(
          @audit_log : Types::AuditLogDestinationConfiguration? = nil
        )
        end
      end

      # Contains information about an Amazon Kinesis Data Firehose delivery stream.
      struct FirehoseStream
        include JSON::Serializable

        # The name of the Amazon Kinesis Data Firehose delivery stream.
        @[JSON::Field(key: "streamName")]
        getter stream_name : String

        def initialize(
          @stream_name : String
        )
        end
      end

      struct GetAppAuthorizationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app authorization to use
        # for the request.
        @[JSON::Field(key: "appAuthorizationIdentifier")]
        getter app_authorization_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        def initialize(
          @app_authorization_identifier : String,
          @app_bundle_identifier : String
        )
        end
      end

      struct GetAppAuthorizationResponse
        include JSON::Serializable

        # Contains information about an app authorization.
        @[JSON::Field(key: "appAuthorization")]
        getter app_authorization : Types::AppAuthorization

        def initialize(
          @app_authorization : Types::AppAuthorization
        )
        end
      end

      struct GetAppBundleRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        def initialize(
          @app_bundle_identifier : String
        )
        end
      end

      struct GetAppBundleResponse
        include JSON::Serializable

        # Contains information about an app bundle.
        @[JSON::Field(key: "appBundle")]
        getter app_bundle : Types::AppBundle

        def initialize(
          @app_bundle : Types::AppBundle
        )
        end
      end

      struct GetIngestionDestinationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion destination to
        # use for the request.
        @[JSON::Field(key: "ingestionDestinationIdentifier")]
        getter ingestion_destination_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_destination_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct GetIngestionDestinationResponse
        include JSON::Serializable

        # Contains information about an ingestion destination.
        @[JSON::Field(key: "ingestionDestination")]
        getter ingestion_destination : Types::IngestionDestination

        def initialize(
          @ingestion_destination : Types::IngestionDestination
        )
        end
      end

      struct GetIngestionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct GetIngestionResponse
        include JSON::Serializable

        # Contains information about an ingestion.
        @[JSON::Field(key: "ingestion")]
        getter ingestion : Types::Ingestion

        def initialize(
          @ingestion : Types::Ingestion
        )
        end
      end

      # Contains information about an ingestion.
      struct Ingestion
        include JSON::Serializable

        # The name of the application.
        @[JSON::Field(key: "app")]
        getter app : String

        # The Amazon Resource Name (ARN) of the app bundle for the ingestion.
        @[JSON::Field(key: "appBundleArn")]
        getter app_bundle_arn : String

        # The Amazon Resource Name (ARN) of the ingestion.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The timestamp of when the ingestion was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The type of the ingestion.
        @[JSON::Field(key: "ingestionType")]
        getter ingestion_type : String

        # The status of the ingestion.
        @[JSON::Field(key: "state")]
        getter state : String

        # The ID of the application tenant.
        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String

        # The timestamp of when the ingestion was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        def initialize(
          @app : String,
          @app_bundle_arn : String,
          @arn : String,
          @created_at : Time,
          @ingestion_type : String,
          @state : String,
          @tenant_id : String,
          @updated_at : Time
        )
        end
      end

      # Contains information about an ingestion destination.
      struct IngestionDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ingestion destination.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # Contains information about the destination of ingested data.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # The Amazon Resource Name (ARN) of the ingestion.
        @[JSON::Field(key: "ingestionArn")]
        getter ingestion_arn : String

        # Contains information about how ingested data is processed.
        @[JSON::Field(key: "processingConfiguration")]
        getter processing_configuration : Types::ProcessingConfiguration

        # The timestamp of when the ingestion destination was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The state of the ingestion destination. The following states are possible: Active : The ingestion
        # destination is active and is ready to be used. Failed : The ingestion destination has failed. If the
        # ingestion destination is in this state, you should verify the ingestion destination configuration
        # and try again.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason for the current status of the ingestion destination. Only present when the status of
        # ingestion destination is Failed .
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The timestamp of when the ingestion destination was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @arn : String,
          @destination_configuration : Types::DestinationConfiguration,
          @ingestion_arn : String,
          @processing_configuration : Types::ProcessingConfiguration,
          @created_at : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Contains a summary of an ingestion destination.
      struct IngestionDestinationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ingestion destination.
        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # Contains a summary of an ingestion.
      struct IngestionSummary
        include JSON::Serializable

        # The name of the application.
        @[JSON::Field(key: "app")]
        getter app : String

        # The Amazon Resource Name (ARN) of the ingestion.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The status of the ingestion.
        @[JSON::Field(key: "state")]
        getter state : String

        # The ID of the application tenant.
        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String

        def initialize(
          @app : String,
          @arn : String,
          @state : String,
          @tenant_id : String
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure with an
      # internal server.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The period of time after which you should retry your request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListAppAuthorizationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_bundle_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppAuthorizationsResponse
        include JSON::Serializable

        # Contains a list of app authorization summaries.
        @[JSON::Field(key: "appAuthorizationSummaryList")]
        getter app_authorization_summary_list : Array(Types::AppAuthorizationSummary)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_authorization_summary_list : Array(Types::AppAuthorizationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListAppBundlesRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAppBundlesResponse
        include JSON::Serializable

        # Contains a list of app bundle summaries.
        @[JSON::Field(key: "appBundleSummaryList")]
        getter app_bundle_summary_list : Array(Types::AppBundleSummary)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_bundle_summary_list : Array(Types::AppBundleSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListIngestionDestinationsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIngestionDestinationsResponse
        include JSON::Serializable

        # Contains a list of ingestion destination summaries.
        @[JSON::Field(key: "ingestionDestinations")]
        getter ingestion_destinations : Array(Types::IngestionDestinationSummary)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ingestion_destinations : Array(Types::IngestionDestinationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListIngestionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @app_bundle_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListIngestionsResponse
        include JSON::Serializable

        # Contains a list of ingestion summaries.
        @[JSON::Field(key: "ingestions")]
        getter ingestions : Array(Types::IngestionSummary)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ingestions : Array(Types::IngestionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to retrieve tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Contains OAuth2 client credential information.
      struct Oauth2Credential
        include JSON::Serializable

        # The client ID of the client application.
        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # The client secret of the client application.
        @[JSON::Field(key: "clientSecret")]
        getter client_secret : String

        def initialize(
          @client_id : String,
          @client_secret : String
        )
        end
      end

      # Contains information about how ingested data is processed.
      struct ProcessingConfiguration
        include JSON::Serializable

        # Contains information about an audit log processing configuration.
        @[JSON::Field(key: "auditLog")]
        getter audit_log : Types::AuditLogProcessingConfiguration?

        def initialize(
          @audit_log : Types::AuditLogProcessingConfiguration? = nil
        )
        end
      end

      # The specified resource does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Contains information about an Amazon S3 bucket.
      struct S3Bucket
        include JSON::Serializable

        # The name of the Amazon S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The object key to use.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String,
          @prefix : String? = nil
        )
        end
      end

      # The request exceeds a service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The code for the quota exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The resource ID.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The code of the service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      struct StartIngestionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct StartIngestionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct StartUserAccessTasksRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The email address of the target user.
        @[JSON::Field(key: "email")]
        getter email : String

        def initialize(
          @app_bundle_identifier : String,
          @email : String
        )
        end
      end

      struct StartUserAccessTasksResponse
        include JSON::Serializable

        # Contains a list of user access task information.
        @[JSON::Field(key: "userAccessTasksList")]
        getter user_access_tasks_list : Array(Types::UserAccessTaskItem)?

        def initialize(
          @user_access_tasks_list : Array(Types::UserAccessTaskItem)? = nil
        )
        end
      end

      struct StopIngestionRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct StopIngestionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The key or keys of the key-value pairs for the tag or tags assigned to a resource.
      struct Tag
        include JSON::Serializable

        # Tag key.
        @[JSON::Field(key: "key")]
        getter key : String

        # Tag value.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of the key-value pairs of the tag or tags to assign to the resource.
        @[JSON::Field(key: "tags")]
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

      # Contains information about an error returned from a user access task.
      struct TaskError
        include JSON::Serializable

        # The code of the error.
        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The message of the error.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Contains information about an application tenant.
      struct Tenant
        include JSON::Serializable

        # The display name of the tenant.
        @[JSON::Field(key: "tenantDisplayName")]
        getter tenant_display_name : String

        # The ID of the application tenant.
        @[JSON::Field(key: "tenantIdentifier")]
        getter tenant_identifier : String

        def initialize(
          @tenant_display_name : String,
          @tenant_identifier : String
        )
        end
      end

      # The request rate exceeds the limit.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The code for the quota exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The period of time after which you should retry your request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The code of the service.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the key-value pairs for the tag or tags you want to remove from the specified resource.
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

      struct UpdateAppAuthorizationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app authorization to use
        # for the request.
        @[JSON::Field(key: "appAuthorizationIdentifier")]
        getter app_authorization_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # Contains credentials for the application, such as an API key or OAuth2 client ID and secret. Specify
        # credentials that match the authorization type of the app authorization to update. For example, if
        # the authorization type of the app authorization is OAuth2 ( oauth2 ), then you should provide only
        # the OAuth2 credentials.
        @[JSON::Field(key: "credential")]
        getter credential : Types::Credential?

        # Contains information about an application tenant, such as the application display name and
        # identifier.
        @[JSON::Field(key: "tenant")]
        getter tenant : Types::Tenant?

        def initialize(
          @app_authorization_identifier : String,
          @app_bundle_identifier : String,
          @credential : Types::Credential? = nil,
          @tenant : Types::Tenant? = nil
        )
        end
      end

      struct UpdateAppAuthorizationResponse
        include JSON::Serializable

        # Contains information about an app authorization.
        @[JSON::Field(key: "appAuthorization")]
        getter app_authorization : Types::AppAuthorization

        def initialize(
          @app_authorization : Types::AppAuthorization
        )
        end
      end

      struct UpdateIngestionDestinationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the app bundle to use for
        # the request.
        @[JSON::Field(key: "appBundleIdentifier")]
        getter app_bundle_identifier : String

        # Contains information about the destination of ingested data.
        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion destination to
        # use for the request.
        @[JSON::Field(key: "ingestionDestinationIdentifier")]
        getter ingestion_destination_identifier : String

        # The Amazon Resource Name (ARN) or Universal Unique Identifier (UUID) of the ingestion to use for the
        # request.
        @[JSON::Field(key: "ingestionIdentifier")]
        getter ingestion_identifier : String

        def initialize(
          @app_bundle_identifier : String,
          @destination_configuration : Types::DestinationConfiguration,
          @ingestion_destination_identifier : String,
          @ingestion_identifier : String
        )
        end
      end

      struct UpdateIngestionDestinationResponse
        include JSON::Serializable

        # Contains information about an ingestion destination.
        @[JSON::Field(key: "ingestionDestination")]
        getter ingestion_destination : Types::IngestionDestination

        def initialize(
          @ingestion_destination : Types::IngestionDestination
        )
        end
      end

      # Contains information about a user's access to an application.
      struct UserAccessResultItem
        include JSON::Serializable

        # The name of the application.
        @[JSON::Field(key: "app")]
        getter app : String?

        # The email address of the target user.
        @[JSON::Field(key: "email")]
        getter email : String?

        # The status of the user access result item. The following states are possible: IN_PROGRESS : The user
        # access task is in progress. COMPLETED : The user access task completed successfully. FAILED : The
        # user access task failed. EXPIRED : The user access task expired.
        @[JSON::Field(key: "resultStatus")]
        getter result_status : String?

        # Contains information about an error returned from a user access task.
        @[JSON::Field(key: "taskError")]
        getter task_error : Types::TaskError?

        # The unique ID of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The display name of the tenant.
        @[JSON::Field(key: "tenantDisplayName")]
        getter tenant_display_name : String?

        # The ID of the application tenant.
        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String?

        # The first name of the user.
        @[JSON::Field(key: "userFirstName")]
        getter user_first_name : String?

        # The full name of the user.
        @[JSON::Field(key: "userFullName")]
        getter user_full_name : String?

        # The unique ID of user.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        # The last name of the user.
        @[JSON::Field(key: "userLastName")]
        getter user_last_name : String?

        # The status of the user returned by the application.
        @[JSON::Field(key: "userStatus")]
        getter user_status : String?

        def initialize(
          @app : String? = nil,
          @email : String? = nil,
          @result_status : String? = nil,
          @task_error : Types::TaskError? = nil,
          @task_id : String? = nil,
          @tenant_display_name : String? = nil,
          @tenant_id : String? = nil,
          @user_first_name : String? = nil,
          @user_full_name : String? = nil,
          @user_id : String? = nil,
          @user_last_name : String? = nil,
          @user_status : String? = nil
        )
        end
      end

      # Contains information about a user access task.
      struct UserAccessTaskItem
        include JSON::Serializable

        # The name of the application.
        @[JSON::Field(key: "app")]
        getter app : String

        # The ID of the application tenant.
        @[JSON::Field(key: "tenantId")]
        getter tenant_id : String

        # Error from the task, if any.
        @[JSON::Field(key: "error")]
        getter error : Types::TaskError?

        # The unique ID of the task.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @app : String,
          @tenant_id : String,
          @error : Types::TaskError? = nil,
          @task_id : String? = nil
        )
        end
      end

      # The request has invalid or missing parameters.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason for the exception.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The field list.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The input failed to meet the constraints specified by the Amazon Web Services service in a specified
      # field.
      struct ValidationExceptionField
        include JSON::Serializable

        # A message about the validation exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The field name where the invalid entry was detected.
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
