require "json"
require "time"

module AwsSdk
  module AmplifyBackend
    module Types

      # The authentication settings for accessing provisioned data models in your Amplify project.
      struct BackendAPIAppSyncAuthSettings
        include JSON::Serializable

        # The Amazon Cognito user pool ID, if Amazon Cognito was used as an authentication setting to access
        # your data models.
        @[JSON::Field(key: "cognitoUserPoolId")]
        getter cognito_user_pool_id : String?

        # The API key description for API_KEY, if it was used as an authentication mechanism to access your
        # data models.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The API key expiration time for API_KEY, if it was used as an authentication mechanism to access
        # your data models.
        @[JSON::Field(key: "expirationTime")]
        getter expiration_time : Float64?

        # The expiry time for the OpenID authentication mechanism.
        @[JSON::Field(key: "openIDAuthTTL")]
        getter open_id_auth_ttl : String?

        # The clientID for openID, if openID was used as an authentication setting to access your data models.
        @[JSON::Field(key: "openIDClientId")]
        getter open_id_client_id : String?

        # The expiry time for the OpenID authentication mechanism.
        @[JSON::Field(key: "openIDIatTTL")]
        getter open_id_iat_ttl : String?

        # The openID issuer URL, if openID was used as an authentication setting to access your data models.
        @[JSON::Field(key: "openIDIssueURL")]
        getter open_id_issue_url : String?

        # The OpenID provider name, if OpenID was used as an authentication mechanism to access your data
        # models.
        @[JSON::Field(key: "openIDProviderName")]
        getter open_id_provider_name : String?

        def initialize(
          @cognito_user_pool_id : String? = nil,
          @description : String? = nil,
          @expiration_time : Float64? = nil,
          @open_id_auth_ttl : String? = nil,
          @open_id_client_id : String? = nil,
          @open_id_iat_ttl : String? = nil,
          @open_id_issue_url : String? = nil,
          @open_id_provider_name : String? = nil
        )
        end
      end

      # Describes the auth types for your configured data models.
      struct BackendAPIAuthType
        include JSON::Serializable

        # Describes the authentication mode.
        @[JSON::Field(key: "mode")]
        getter mode : String?

        # Describes settings for the authentication mode.
        @[JSON::Field(key: "settings")]
        getter settings : Types::BackendAPIAppSyncAuthSettings?

        def initialize(
          @mode : String? = nil,
          @settings : Types::BackendAPIAppSyncAuthSettings? = nil
        )
        end
      end

      # The request object for this operation.
      struct BackendAPICodegenReqObj
        include JSON::Serializable

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      # The response object sent when a backend is created.
      struct BackendAPICodegenRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the conflict resolution configuration for your data model configured in your Amplify
      # project.
      struct BackendAPIConflictResolution
        include JSON::Serializable

        # The strategy for conflict resolution.
        @[JSON::Field(key: "resolutionStrategy")]
        getter resolution_strategy : String?

        def initialize(
          @resolution_strategy : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct BackendAPIReqObj
        include JSON::Serializable

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # Defines the resource configuration for the data model in your Amplify project.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig?

        def initialize(
          @resource_name : String,
          @resource_config : Types::BackendAPIResourceConfig? = nil
        )
        end
      end

      # The resource config for the data model, configured as a part of the Amplify project.
      struct BackendAPIResourceConfig
        include JSON::Serializable

        # Additional authentication methods used to interact with your data models.
        @[JSON::Field(key: "additionalAuthTypes")]
        getter additional_auth_types : Array(Types::BackendAPIAuthType)?

        # The API name used to interact with the data model, configured as a part of your Amplify project.
        @[JSON::Field(key: "apiName")]
        getter api_name : String?

        # The conflict resolution strategy for your data stored in the data models.
        @[JSON::Field(key: "conflictResolution")]
        getter conflict_resolution : Types::BackendAPIConflictResolution?

        # The default authentication type for interacting with the configured data models in your Amplify
        # project.
        @[JSON::Field(key: "defaultAuthType")]
        getter default_auth_type : Types::BackendAPIAuthType?

        # The service used to provision and interact with the data model.
        @[JSON::Field(key: "service")]
        getter service : String?

        # The definition of the data model in the annotated transform of the GraphQL schema.
        @[JSON::Field(key: "transformSchema")]
        getter transform_schema : String?

        def initialize(
          @additional_auth_types : Array(Types::BackendAPIAuthType)? = nil,
          @api_name : String? = nil,
          @conflict_resolution : Types::BackendAPIConflictResolution? = nil,
          @default_auth_type : Types::BackendAPIAuthType? = nil,
          @service : String? = nil,
          @transform_schema : String? = nil
        )
        end
      end

      # The response object sent when a backend is created.
      struct BackendAPIRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes Apple social federation configurations for allowing your app users to sign in using OAuth.
      struct BackendAuthAppleProviderConfig
        include JSON::Serializable

        # Describes the client_id (also called Services ID) that comes from Apple.
        @[JSON::Field(key: "client_id")]
        getter client_id : String?

        # Describes the key_id that comes from Apple.
        @[JSON::Field(key: "key_id")]
        getter key_id : String?

        # Describes the private_key that comes from Apple.
        @[JSON::Field(key: "private_key")]
        getter private_key : String?

        # Describes the team_id that comes from Apple.
        @[JSON::Field(key: "team_id")]
        getter team_id : String?

        def initialize(
          @client_id : String? = nil,
          @key_id : String? = nil,
          @private_key : String? = nil,
          @team_id : String? = nil
        )
        end
      end

      # The response object for this operation.
      struct BackendAuthRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes third-party social federation configurations for allowing your app users to sign in using
      # OAuth.
      struct BackendAuthSocialProviderConfig
        include JSON::Serializable

        # Describes the client_id, which can be obtained from the third-party social federation provider.
        @[JSON::Field(key: "client_id")]
        getter client_id : String?

        # Describes the client_secret, which can be obtained from third-party social federation providers.
        @[JSON::Field(key: "client_secret")]
        getter client_secret : String?

        def initialize(
          @client_id : String? = nil,
          @client_secret : String? = nil
        )
        end
      end

      # The response object for this operation.
      struct BackendConfigRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String?

        # The app ID for the backend manager.
        @[JSON::Field(key: "backendManagerAppId")]
        getter backend_manager_app_id : String?

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # Describes the Amazon Cognito configurations for the Admin UI auth resource to log in with.
        @[JSON::Field(key: "loginAuthConfig")]
        getter login_auth_config : Types::LoginAuthConfigReqObj?

        def initialize(
          @app_id : String? = nil,
          @backend_manager_app_id : String? = nil,
          @error : String? = nil,
          @login_auth_config : Types::LoginAuthConfigReqObj? = nil
        )
        end
      end

      # The request object for this operation.
      struct BackendJobReqObj
        include JSON::Serializable

        # Filters the list of response objects to include only those with the specified operation name.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # Filters the list of response objects to include only those with the specified status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The response object for this operation.
      struct BackendJobRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The time when the job was created.
        @[JSON::Field(key: "createTime")]
        getter create_time : String?

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The time when the job was last updated.
        @[JSON::Field(key: "updateTime")]
        getter update_time : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @create_time : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil,
          @update_time : String? = nil
        )
        end
      end

      # Describes the read, write, and delete permissions users have against your storage S3 bucket.
      struct BackendStoragePermissions
        include JSON::Serializable

        # Lists all authenticated user read, write, and delete permissions for your S3 bucket.
        @[JSON::Field(key: "authenticated")]
        getter authenticated : Array(String)

        # Lists all unauthenticated user read, write, and delete permissions for your S3 bucket.
        @[JSON::Field(key: "unAuthenticated")]
        getter un_authenticated : Array(String)?

        def initialize(
          @authenticated : Array(String),
          @un_authenticated : Array(String)? = nil
        )
        end
      end

      # The response object for this operation.
      struct BackendStorageRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @job_id : String,
          @status : String
        )
        end
      end

      # An error returned if a request is not formed properly.
      struct BadRequestException
        include JSON::Serializable

        # An error message to inform that the request failed.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct CloneBackendReqObj
        include JSON::Serializable

        # The name of the destination backend environment to be created.
        @[JSON::Field(key: "targetEnvironmentName")]
        getter target_environment_name : String

        def initialize(
          @target_environment_name : String
        )
        end
      end

      struct CloneBackendRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "targetEnvironmentName")]
        getter target_environment_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @target_environment_name : String
        )
        end
      end

      # The response object sent when a backend is created.
      struct CloneBackendRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CloneBackendResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct CreateBackendAPIReqObj
        include JSON::Serializable

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The resource configuration for this request.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @backend_environment_name : String,
          @resource_config : Types::BackendAPIResourceConfig,
          @resource_name : String
        )
        end
      end

      struct CreateBackendAPIRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_config : Types::BackendAPIResourceConfig,
          @resource_name : String
        )
        end
      end

      struct CreateBackendAPIResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # (DEPRECATED) Describes the forgot password policy for authenticating into the Amplify app.
      struct CreateBackendAuthForgotPasswordConfig
        include JSON::Serializable

        # (DEPRECATED) Describes which mode to use (either SMS or email) to deliver messages to app users who
        # want to recover their password.
        @[JSON::Field(key: "deliveryMethod")]
        getter delivery_method : String

        # (DEPRECATED) The configuration for the email sent when an app user forgets their password.
        @[JSON::Field(key: "emailSettings")]
        getter email_settings : Types::EmailSettings?

        # (DEPRECATED) The configuration for the SMS message sent when an app user forgets their password.
        @[JSON::Field(key: "smsSettings")]
        getter sms_settings : Types::SmsSettings?

        def initialize(
          @delivery_method : String,
          @email_settings : Types::EmailSettings? = nil,
          @sms_settings : Types::SmsSettings? = nil
        )
        end
      end

      # Describes authorization configurations for the auth resources, configured as a part of your Amplify
      # project.
      struct CreateBackendAuthIdentityPoolConfig
        include JSON::Serializable

        # Name of the Amazon Cognito identity pool used for authorization.
        @[JSON::Field(key: "identityPoolName")]
        getter identity_pool_name : String

        # Set to true or false based on whether you want to enable guest authorization to your Amplify app.
        @[JSON::Field(key: "unauthenticatedLogin")]
        getter unauthenticated_login : Bool

        def initialize(
          @identity_pool_name : String,
          @unauthenticated_login : Bool
        )
        end
      end

      # Describes whether to apply multi-factor authentication policies for your Amazon Cognito user pool
      # configured as a part of your Amplify project.
      struct CreateBackendAuthMFAConfig
        include JSON::Serializable

        # Describes whether MFA should be [ON, OFF, or OPTIONAL] for authentication in your Amplify project.
        @[JSON::Field(key: "MFAMode")]
        getter mfa_mode : String

        # Describes the configuration settings and methods for your Amplify app users to use MFA.
        @[JSON::Field(key: "settings")]
        getter settings : Types::Settings?

        def initialize(
          @mfa_mode : String,
          @settings : Types::Settings? = nil
        )
        end
      end

      # Creates the OAuth configuration for your Amplify project.
      struct CreateBackendAuthOAuthConfig
        include JSON::Serializable

        # The OAuth grant type that you use to allow app users to authenticate from your Amplify app.
        @[JSON::Field(key: "oAuthGrantType")]
        getter o_auth_grant_type : String

        # List of OAuth-related flows used to allow your app users to authenticate from your Amplify app.
        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)

        # The redirected URI for signing in to your Amplify app.
        @[JSON::Field(key: "redirectSignInURIs")]
        getter redirect_sign_in_ur_is : Array(String)

        # Redirect URLs that OAuth uses when a user signs out of an Amplify app.
        @[JSON::Field(key: "redirectSignOutURIs")]
        getter redirect_sign_out_ur_is : Array(String)

        # The domain prefix for your Amplify app.
        @[JSON::Field(key: "domainPrefix")]
        getter domain_prefix : String?

        # The settings for using social providers to access your Amplify app.
        @[JSON::Field(key: "socialProviderSettings")]
        getter social_provider_settings : Types::SocialProviderSettings?

        def initialize(
          @o_auth_grant_type : String,
          @o_auth_scopes : Array(String),
          @redirect_sign_in_ur_is : Array(String),
          @redirect_sign_out_ur_is : Array(String),
          @domain_prefix : String? = nil,
          @social_provider_settings : Types::SocialProviderSettings? = nil
        )
        end
      end

      # The password policy configuration for the backend to your Amplify project.
      struct CreateBackendAuthPasswordPolicyConfig
        include JSON::Serializable

        # The minimum length of the password used to access the backend of your Amplify project.
        @[JSON::Field(key: "minimumLength")]
        getter minimum_length : Float64

        # Additional constraints for the password used to access the backend of your Amplify project.
        @[JSON::Field(key: "additionalConstraints")]
        getter additional_constraints : Array(String)?

        def initialize(
          @minimum_length : Float64,
          @additional_constraints : Array(String)? = nil
        )
        end
      end

      # The request object for this operation.
      struct CreateBackendAuthReqObj
        include JSON::Serializable

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The resource configuration for this request object.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::CreateBackendAuthResourceConfig

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @backend_environment_name : String,
          @resource_config : Types::CreateBackendAuthResourceConfig,
          @resource_name : String
        )
        end
      end

      struct CreateBackendAuthRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::CreateBackendAuthResourceConfig

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_config : Types::CreateBackendAuthResourceConfig,
          @resource_name : String
        )
        end
      end

      # Defines the resource configuration when creating an auth resource in your Amplify project.
      struct CreateBackendAuthResourceConfig
        include JSON::Serializable

        # Defines whether you want to configure only authentication or both authentication and authorization
        # settings.
        @[JSON::Field(key: "authResources")]
        getter auth_resources : String

        # Defines the service name to use when configuring an authentication resource in your Amplify project.
        @[JSON::Field(key: "service")]
        getter service : String

        # Describes authentication configuration for the Amazon Cognito user pool, provisioned as a part of
        # your auth resource in the Amplify project.
        @[JSON::Field(key: "userPoolConfigs")]
        getter user_pool_configs : Types::CreateBackendAuthUserPoolConfig

        # Describes the authorization configuration for the Amazon Cognito identity pool, provisioned as a
        # part of your auth resource in the Amplify project.
        @[JSON::Field(key: "identityPoolConfigs")]
        getter identity_pool_configs : Types::CreateBackendAuthIdentityPoolConfig?

        def initialize(
          @auth_resources : String,
          @service : String,
          @user_pool_configs : Types::CreateBackendAuthUserPoolConfig,
          @identity_pool_configs : Types::CreateBackendAuthIdentityPoolConfig? = nil
        )
        end
      end

      struct CreateBackendAuthResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the Amazon Cognito user pool configuration for the auth resource to be configured for your
      # Amplify project.
      struct CreateBackendAuthUserPoolConfig
        include JSON::Serializable

        # The required attributes to sign up new users in the user pool.
        @[JSON::Field(key: "requiredSignUpAttributes")]
        getter required_sign_up_attributes : Array(String)

        # Describes the sign-in methods that your Amplify app users use to log in using the Amazon Cognito
        # user pool, configured as a part of your Amplify project.
        @[JSON::Field(key: "signInMethod")]
        getter sign_in_method : String

        # The Amazon Cognito user pool name.
        @[JSON::Field(key: "userPoolName")]
        getter user_pool_name : String

        # (DEPRECATED) Describes the forgotten password policy for your Amazon Cognito user pool, configured
        # as a part of your Amplify project.
        @[JSON::Field(key: "forgotPassword")]
        getter forgot_password : Types::CreateBackendAuthForgotPasswordConfig?

        # Describes whether to apply multi-factor authentication policies for your Amazon Cognito user pool
        # configured as a part of your Amplify project.
        @[JSON::Field(key: "mfa")]
        getter mfa : Types::CreateBackendAuthMFAConfig?

        # Describes the OAuth policy and rules for your Amazon Cognito user pool, configured as a part of your
        # Amplify project.
        @[JSON::Field(key: "oAuth")]
        getter o_auth : Types::CreateBackendAuthOAuthConfig?

        # Describes the password policy for your Amazon Cognito user pool, configured as a part of your
        # Amplify project.
        @[JSON::Field(key: "passwordPolicy")]
        getter password_policy : Types::CreateBackendAuthPasswordPolicyConfig?

        # Describes the email or SMS verification message for your Amazon Cognito user pool, configured as a
        # part of your Amplify project.
        @[JSON::Field(key: "verificationMessage")]
        getter verification_message : Types::CreateBackendAuthVerificationMessageConfig?

        def initialize(
          @required_sign_up_attributes : Array(String),
          @sign_in_method : String,
          @user_pool_name : String,
          @forgot_password : Types::CreateBackendAuthForgotPasswordConfig? = nil,
          @mfa : Types::CreateBackendAuthMFAConfig? = nil,
          @o_auth : Types::CreateBackendAuthOAuthConfig? = nil,
          @password_policy : Types::CreateBackendAuthPasswordPolicyConfig? = nil,
          @verification_message : Types::CreateBackendAuthVerificationMessageConfig? = nil
        )
        end
      end

      # Creates an email or SMS verification message for the auth resource configured for your Amplify
      # project.
      struct CreateBackendAuthVerificationMessageConfig
        include JSON::Serializable

        # The type of verification message to send.
        @[JSON::Field(key: "deliveryMethod")]
        getter delivery_method : String

        # The settings for the email message.
        @[JSON::Field(key: "emailSettings")]
        getter email_settings : Types::EmailSettings?

        # The settings for the SMS message.
        @[JSON::Field(key: "smsSettings")]
        getter sms_settings : Types::SmsSettings?

        def initialize(
          @delivery_method : String,
          @email_settings : Types::EmailSettings? = nil,
          @sms_settings : Types::SmsSettings? = nil
        )
        end
      end

      # The request object for this operation.
      struct CreateBackendConfigReqObj
        include JSON::Serializable

        # The app ID for the backend manager.
        @[JSON::Field(key: "backendManagerAppId")]
        getter backend_manager_app_id : String?

        def initialize(
          @backend_manager_app_id : String? = nil
        )
        end
      end

      struct CreateBackendConfigRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendManagerAppId")]
        getter backend_manager_app_id : String?

        def initialize(
          @app_id : String,
          @backend_manager_app_id : String? = nil
        )
        end
      end

      # The response object for this operation.
      struct CreateBackendConfigRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateBackendConfigResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct CreateBackendReqObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the app.
        @[JSON::Field(key: "appName")]
        getter app_name : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The resource configuration for creating a backend.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::ResourceConfig?

        # The name of the resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String,
          @app_name : String,
          @backend_environment_name : String,
          @resource_config : Types::ResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct CreateBackendRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "appName")]
        getter app_name : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::ResourceConfig?

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String,
          @app_name : String,
          @backend_environment_name : String,
          @resource_config : Types::ResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The response object sent when a backend is created.
      struct CreateBackendRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateBackendResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct CreateBackendStorageReqObj
        include JSON::Serializable

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The resource configuration for creating backend storage.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::CreateBackendStorageResourceConfig

        # The name of the storage resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @backend_environment_name : String,
          @resource_config : Types::CreateBackendStorageResourceConfig,
          @resource_name : String
        )
        end
      end

      struct CreateBackendStorageRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::CreateBackendStorageResourceConfig

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_config : Types::CreateBackendStorageResourceConfig,
          @resource_name : String
        )
        end
      end

      # The resource configuration for creating backend storage.
      struct CreateBackendStorageResourceConfig
        include JSON::Serializable

        # The authorization configuration for the storage S3 bucket.
        @[JSON::Field(key: "permissions")]
        getter permissions : Types::BackendStoragePermissions

        # The name of the storage service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The name of the S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        def initialize(
          @permissions : Types::BackendStoragePermissions,
          @service_name : String,
          @bucket_name : String? = nil
        )
        end
      end

      struct CreateBackendStorageResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateTokenRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        def initialize(
          @app_id : String
        )
        end
      end

      # The response object for this operation.
      struct CreateTokenRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # One-time challenge code for authenticating into the Amplify Admin UI.
        @[JSON::Field(key: "challengeCode")]
        getter challenge_code : String

        # A unique ID provided when creating a new challenge token.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The expiry time for the one-time generated token code.
        @[JSON::Field(key: "ttl")]
        getter ttl : String

        def initialize(
          @app_id : String,
          @challenge_code : String,
          @session_id : String,
          @ttl : String
        )
        end
      end

      struct CreateTokenResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "challengeCode")]
        getter challenge_code : String?

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        @[JSON::Field(key: "ttl")]
        getter ttl : String?

        def initialize(
          @app_id : String? = nil,
          @challenge_code : String? = nil,
          @session_id : String? = nil,
          @ttl : String? = nil
        )
        end
      end

      struct DeleteBackendAPIRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String,
          @resource_config : Types::BackendAPIResourceConfig? = nil
        )
        end
      end

      struct DeleteBackendAPIResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteBackendAuthRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String
        )
        end
      end

      struct DeleteBackendAuthResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteBackendRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String
        )
        end
      end

      # The returned object for a request to delete a backend.
      struct DeleteBackendRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteBackendResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteBackendStorageRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String,
          @service_name : String
        )
        end
      end

      struct DeleteBackendStorageResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct DeleteTokenRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @app_id : String,
          @session_id : String
        )
        end
      end

      # The response object for this operation.
      struct DeleteTokenRespObj
        include JSON::Serializable

        # Indicates whether the request succeeded or failed.
        @[JSON::Field(key: "isSuccess")]
        getter is_success : Bool

        def initialize(
          @is_success : Bool
        )
        end
      end

      struct DeleteTokenResponse
        include JSON::Serializable

        @[JSON::Field(key: "isSuccess")]
        getter is_success : Bool?

        def initialize(
          @is_success : Bool? = nil
        )
        end
      end

      # The settings for the email message.
      struct EmailSettings
        include JSON::Serializable

        # The contents of the email message.
        @[JSON::Field(key: "emailMessage")]
        getter email_message : String?

        # The contents of the subject line of the email message.
        @[JSON::Field(key: "emailSubject")]
        getter email_subject : String?

        def initialize(
          @email_message : String? = nil,
          @email_subject : String? = nil
        )
        end
      end

      # An error returned if there's a temporary issue with the service.
      struct GatewayTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct GenerateBackendAPIModelsRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String
        )
        end
      end

      struct GenerateBackendAPIModelsResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetBackendAPIModelsRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String
        )
        end
      end

      # The response object for this operation.
      struct GetBackendAPIModelsResponse
        include JSON::Serializable

        # Stringified JSON of the model introspection schema for an existing backend API resource.
        @[JSON::Field(key: "modelIntrospectionSchema")]
        getter model_introspection_schema : String?

        # Stringified JSON of the datastore model.
        @[JSON::Field(key: "models")]
        getter models : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @model_introspection_schema : String? = nil,
          @models : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct GetBackendAPIRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String,
          @resource_config : Types::BackendAPIResourceConfig? = nil
        )
        end
      end

      # The response object for this operation.
      struct GetBackendAPIRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The resource configuration for this response object.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig?

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @resource_config : Types::BackendAPIResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct GetBackendAPIResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig?

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @resource_config : Types::BackendAPIResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct GetBackendAuthReqObj
        include JSON::Serializable

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct GetBackendAuthRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String
        )
        end
      end

      # The response object for this operation.
      struct GetBackendAuthRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The resource configuration for authorization requests to the backend of your Amplify project.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::CreateBackendAuthResourceConfig?

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @error : String? = nil,
          @resource_config : Types::CreateBackendAuthResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct GetBackendAuthResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::CreateBackendAuthResourceConfig?

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @resource_config : Types::CreateBackendAuthResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct GetBackendJobRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @job_id : String
        )
        end
      end

      struct GetBackendJobResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "createTime")]
        getter create_time : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        @[JSON::Field(key: "updateTime")]
        getter update_time : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @create_time : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil,
          @update_time : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct GetBackendReqObj
        include JSON::Serializable

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        def initialize(
          @backend_environment_name : String? = nil
        )
        end
      end

      struct GetBackendRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String? = nil
        )
        end
      end

      # The response object for this operation.
      struct GetBackendRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # A stringified version of the cli.json file for your Amplify project.
        @[JSON::Field(key: "amplifyFeatureFlags")]
        getter amplify_feature_flags : String?

        # A stringified version of the current configs for your Amplify project.
        @[JSON::Field(key: "amplifyMetaConfig")]
        getter amplify_meta_config : String?

        # The name of the app.
        @[JSON::Field(key: "appName")]
        getter app_name : String?

        # A list of backend environments in an array.
        @[JSON::Field(key: "backendEnvironmentList")]
        getter backend_environment_list : Array(String)?

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        # If the request failed, this is the returned error.
        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @app_id : String,
          @amplify_feature_flags : String? = nil,
          @amplify_meta_config : String? = nil,
          @app_name : String? = nil,
          @backend_environment_list : Array(String)? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil
        )
        end
      end

      struct GetBackendResponse
        include JSON::Serializable

        @[JSON::Field(key: "amplifyFeatureFlags")]
        getter amplify_feature_flags : String?

        @[JSON::Field(key: "amplifyMetaConfig")]
        getter amplify_meta_config : String?

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "appName")]
        getter app_name : String?

        @[JSON::Field(key: "backendEnvironmentList")]
        getter backend_environment_list : Array(String)?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @amplify_feature_flags : String? = nil,
          @amplify_meta_config : String? = nil,
          @app_id : String? = nil,
          @app_name : String? = nil,
          @backend_environment_list : Array(String)? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct GetBackendStorageReqObj
        include JSON::Serializable

        # The name of the storage resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct GetBackendStorageRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String
        )
        end
      end

      # The details for a backend storage resource.
      struct GetBackendStorageResourceConfig
        include JSON::Serializable

        # Returns True if the storage resource has been imported.
        @[JSON::Field(key: "imported")]
        getter imported : Bool

        # The name of the storage service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The name of the S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The authorization configuration for the storage S3 bucket.
        @[JSON::Field(key: "permissions")]
        getter permissions : Types::BackendStoragePermissions?

        def initialize(
          @imported : Bool,
          @service_name : String,
          @bucket_name : String? = nil,
          @permissions : Types::BackendStoragePermissions? = nil
        )
        end
      end

      # The response object for this operation.
      struct GetBackendStorageRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The name of the backend environment.
        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        # The resource configuration for the backend storage resource.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::GetBackendStorageResourceConfig?

        # The name of the storage resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_config : Types::GetBackendStorageResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct GetBackendStorageResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::GetBackendStorageResourceConfig?

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @resource_config : Types::GetBackendStorageResourceConfig? = nil,
          @resource_name : String? = nil
        )
        end
      end

      struct GetTokenRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @app_id : String,
          @session_id : String
        )
        end
      end

      # The response object for this operation.
      struct GetTokenRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # The one-time challenge code for authenticating into the Amplify Admin UI.
        @[JSON::Field(key: "challengeCode")]
        getter challenge_code : String

        # A unique ID provided when creating a new challenge token.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The expiry time for the one-time generated token code.
        @[JSON::Field(key: "ttl")]
        getter ttl : String

        def initialize(
          @app_id : String,
          @challenge_code : String,
          @session_id : String,
          @ttl : String
        )
        end
      end

      struct GetTokenResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "challengeCode")]
        getter challenge_code : String?

        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        @[JSON::Field(key: "ttl")]
        getter ttl : String?

        def initialize(
          @app_id : String? = nil,
          @challenge_code : String? = nil,
          @session_id : String? = nil,
          @ttl : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct ImportBackendAuthReqObj
        include JSON::Serializable

        # The ID of the Amazon Cognito native client.
        @[JSON::Field(key: "nativeClientId")]
        getter native_client_id : String

        # The ID of the Amazon Cognito user pool.
        @[JSON::Field(key: "userPoolId")]
        getter user_pool_id : String

        # The ID of the Amazon Cognito web client.
        @[JSON::Field(key: "webClientId")]
        getter web_client_id : String

        # The ID of the Amazon Cognito identity pool.
        @[JSON::Field(key: "identityPoolId")]
        getter identity_pool_id : String?

        def initialize(
          @native_client_id : String,
          @user_pool_id : String,
          @web_client_id : String,
          @identity_pool_id : String? = nil
        )
        end
      end

      struct ImportBackendAuthRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "nativeClientId")]
        getter native_client_id : String

        @[JSON::Field(key: "userPoolId")]
        getter user_pool_id : String

        @[JSON::Field(key: "webClientId")]
        getter web_client_id : String

        @[JSON::Field(key: "identityPoolId")]
        getter identity_pool_id : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @native_client_id : String,
          @user_pool_id : String,
          @web_client_id : String,
          @identity_pool_id : String? = nil
        )
        end
      end

      struct ImportBackendAuthResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct ImportBackendStorageReqObj
        include JSON::Serializable

        # The name of the storage service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # The name of the S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        def initialize(
          @service_name : String,
          @bucket_name : String? = nil
        )
        end
      end

      struct ImportBackendStorageRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @service_name : String,
          @bucket_name : String? = nil
        )
        end
      end

      struct ImportBackendStorageResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      # An error returned if there's a temporary issue with the service.
      struct InternalServiceException
        include JSON::Serializable

        # An error message to inform that the request failed.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An error that is returned when a limit of a specific type has been exceeded.
      struct LimitExceededException
        include JSON::Serializable

        # The type of limit that was exceeded.
        @[JSON::Field(key: "limitType")]
        getter limit_type : String?

        # An error message to inform that the request has failed.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @limit_type : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct ListBackendJobReqObj
        include JSON::Serializable

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The maximum number of results that you want in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filters the list of response objects to include only those with the specified operation name.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # Filters the list of response objects to include only those with the specified status.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @job_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The returned list of backend jobs.
      struct ListBackendJobRespObj
        include JSON::Serializable

        # An array of jobs and their properties.
        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::BackendJobRespObj)?

        # The token for the next set of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::BackendJobRespObj)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListBackendJobsRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @job_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListBackendJobsResponse
        include JSON::Serializable

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::BackendJobRespObj)?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::BackendJobRespObj)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct ListS3BucketsReqObj
        include JSON::Serializable

        # Reserved for future use.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      struct ListS3BucketsRequest
        include JSON::Serializable

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # The response object for this operation.
      struct ListS3BucketsRespObj
        include JSON::Serializable

        # The list of S3 buckets.
        @[JSON::Field(key: "buckets")]
        getter buckets : Array(Types::S3BucketInfo)

        # Reserved for future use.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @buckets : Array(Types::S3BucketInfo),
          @next_token : String? = nil
        )
        end
      end

      struct ListS3BucketsResponse
        include JSON::Serializable

        @[JSON::Field(key: "buckets")]
        getter buckets : Array(Types::S3BucketInfo)?

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @buckets : Array(Types::S3BucketInfo)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct LoginAuthConfigReqObj
        include JSON::Serializable

        # The Amazon Cognito identity pool ID used for the Amplify Admin UI login authorization.
        @[JSON::Field(key: "aws_cognito_identity_pool_id")]
        getter aws_cognito_identity_pool_id : String?

        # The AWS Region for the Amplify Admin UI login.
        @[JSON::Field(key: "aws_cognito_region")]
        getter aws_cognito_region : String?

        # The Amazon Cognito user pool ID used for Amplify Admin UI login authentication.
        @[JSON::Field(key: "aws_user_pools_id")]
        getter aws_user_pools_id : String?

        # The web client ID for the Amazon Cognito user pools.
        @[JSON::Field(key: "aws_user_pools_web_client_id")]
        getter aws_user_pools_web_client_id : String?

        def initialize(
          @aws_cognito_identity_pool_id : String? = nil,
          @aws_cognito_region : String? = nil,
          @aws_user_pools_id : String? = nil,
          @aws_user_pools_web_client_id : String? = nil
        )
        end
      end

      # An error returned when a specific resource type is not found.
      struct NotFoundException
        include JSON::Serializable

        # An error message to inform that the request has failed.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The type of resource that is not found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct RemoveAllBackendsReqObj
        include JSON::Serializable

        # Cleans up the Amplify Console app if this value is set to true.
        @[JSON::Field(key: "cleanAmplifyApp")]
        getter clean_amplify_app : Bool?

        def initialize(
          @clean_amplify_app : Bool? = nil
        )
        end
      end

      struct RemoveAllBackendsRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "cleanAmplifyApp")]
        getter clean_amplify_app : Bool?

        def initialize(
          @app_id : String,
          @clean_amplify_app : Bool? = nil
        )
        end
      end

      # The response object for this operation.
      struct RemoveAllBackendsRespObj
        include JSON::Serializable

        # The app ID.
        @[JSON::Field(key: "appId")]
        getter app_id : String

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The ID for the job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of the operation.
        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The current status of the request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct RemoveAllBackendsResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct RemoveBackendAuthReqObj
        include JSON::Serializable

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_name : String
        )
        end
      end

      struct RemoveBackendConfigRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        def initialize(
          @app_id : String
        )
        end
      end

      # The response object for this operation.
      struct RemoveBackendConfigRespObj
        include JSON::Serializable

        # If the request fails, this error is returned.
        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @error : String? = nil
        )
        end
      end

      struct RemoveBackendConfigResponse
        include JSON::Serializable

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @error : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct RemoveBackendStorageReqObj
        include JSON::Serializable

        # The name of the storage resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        # The name of the storage service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @resource_name : String,
          @service_name : String
        )
        end
      end

      struct ResourceConfig
        include JSON::Serializable

        def initialize
        end
      end

      # Describes the metadata of the S3 bucket.
      struct S3BucketInfo
        include JSON::Serializable

        # The creation date of the S3 bucket.
        @[JSON::Field(key: "creationDate")]
        getter creation_date : String?

        # The name of the S3 bucket.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @creation_date : String? = nil,
          @name : String? = nil
        )
        end
      end

      struct Settings
        include JSON::Serializable

        @[JSON::Field(key: "mfaTypes")]
        getter mfa_types : Array(String)?

        # The body of the SMS message.
        @[JSON::Field(key: "smsMessage")]
        getter sms_message : String?

        def initialize(
          @mfa_types : Array(String)? = nil,
          @sms_message : String? = nil
        )
        end
      end

      # The settings for the SMS message.
      struct SmsSettings
        include JSON::Serializable

        # The contents of the SMS message.
        @[JSON::Field(key: "smsMessage")]
        getter sms_message : String?

        def initialize(
          @sms_message : String? = nil
        )
        end
      end

      struct SocialProviderSettings
        include JSON::Serializable

        @[JSON::Field(key: "Facebook")]
        getter facebook : Types::BackendAuthSocialProviderConfig?

        @[JSON::Field(key: "Google")]
        getter google : Types::BackendAuthSocialProviderConfig?

        @[JSON::Field(key: "LoginWithAmazon")]
        getter login_with_amazon : Types::BackendAuthSocialProviderConfig?

        @[JSON::Field(key: "SignInWithApple")]
        getter sign_in_with_apple : Types::BackendAuthAppleProviderConfig?

        def initialize(
          @facebook : Types::BackendAuthSocialProviderConfig? = nil,
          @google : Types::BackendAuthSocialProviderConfig? = nil,
          @login_with_amazon : Types::BackendAuthSocialProviderConfig? = nil,
          @sign_in_with_apple : Types::BackendAuthAppleProviderConfig? = nil
        )
        end
      end

      # An error that is returned when a limit of a specific type has been exceeded.
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

      struct UpdateBackendAPIRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::BackendAPIResourceConfig?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_name : String,
          @resource_config : Types::BackendAPIResourceConfig? = nil
        )
        end
      end

      struct UpdateBackendAPIResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # (DEPRECATED) Describes the forgot password policy for authenticating into the Amplify app.
      struct UpdateBackendAuthForgotPasswordConfig
        include JSON::Serializable

        # (DEPRECATED) Describes which mode to use (either SMS or email) to deliver messages to app users that
        # want to recover their password.
        @[JSON::Field(key: "deliveryMethod")]
        getter delivery_method : String?

        # (DEPRECATED) The configuration for the email sent when an app user forgets their password.
        @[JSON::Field(key: "emailSettings")]
        getter email_settings : Types::EmailSettings?

        # (DEPRECATED) The configuration for the SMS message sent when an Amplify app user forgets their
        # password.
        @[JSON::Field(key: "smsSettings")]
        getter sms_settings : Types::SmsSettings?

        def initialize(
          @delivery_method : String? = nil,
          @email_settings : Types::EmailSettings? = nil,
          @sms_settings : Types::SmsSettings? = nil
        )
        end
      end

      # Describes the authorization configuration for the Amazon Cognito identity pool, provisioned as a
      # part of your auth resource in the Amplify project.
      struct UpdateBackendAuthIdentityPoolConfig
        include JSON::Serializable

        # A boolean value that can be set to allow or disallow guest-level authorization into your Amplify
        # app.
        @[JSON::Field(key: "unauthenticatedLogin")]
        getter unauthenticated_login : Bool?

        def initialize(
          @unauthenticated_login : Bool? = nil
        )
        end
      end

      # Updates the multi-factor authentication (MFA) configuration for the backend of your Amplify project.
      struct UpdateBackendAuthMFAConfig
        include JSON::Serializable

        # The MFA mode for the backend of your Amplify project.
        @[JSON::Field(key: "MFAMode")]
        getter mfa_mode : String?

        # The settings of your MFA configuration for the backend of your Amplify project.
        @[JSON::Field(key: "settings")]
        getter settings : Types::Settings?

        def initialize(
          @mfa_mode : String? = nil,
          @settings : Types::Settings? = nil
        )
        end
      end

      # The OAuth configurations for authenticating users into your Amplify app.
      struct UpdateBackendAuthOAuthConfig
        include JSON::Serializable

        # The Amazon Cognito domain prefix used to create a hosted UI for authentication.
        @[JSON::Field(key: "domainPrefix")]
        getter domain_prefix : String?

        # The OAuth grant type to allow app users to authenticate from your Amplify app.
        @[JSON::Field(key: "oAuthGrantType")]
        getter o_auth_grant_type : String?

        # The list of OAuth-related flows that can allow users to authenticate from your Amplify app.
        @[JSON::Field(key: "oAuthScopes")]
        getter o_auth_scopes : Array(String)?

        # Redirect URLs that OAuth uses when a user signs in to an Amplify app.
        @[JSON::Field(key: "redirectSignInURIs")]
        getter redirect_sign_in_ur_is : Array(String)?

        # Redirect URLs that OAuth uses when a user signs out of an Amplify app.
        @[JSON::Field(key: "redirectSignOutURIs")]
        getter redirect_sign_out_ur_is : Array(String)?

        # Describes third-party social federation configurations for allowing your users to sign in with
        # OAuth.
        @[JSON::Field(key: "socialProviderSettings")]
        getter social_provider_settings : Types::SocialProviderSettings?

        def initialize(
          @domain_prefix : String? = nil,
          @o_auth_grant_type : String? = nil,
          @o_auth_scopes : Array(String)? = nil,
          @redirect_sign_in_ur_is : Array(String)? = nil,
          @redirect_sign_out_ur_is : Array(String)? = nil,
          @social_provider_settings : Types::SocialProviderSettings? = nil
        )
        end
      end

      # Describes the password policy for your Amazon Cognito user pool configured as a part of your Amplify
      # project.
      struct UpdateBackendAuthPasswordPolicyConfig
        include JSON::Serializable

        # Describes additional constraints on password requirements to sign in to the auth resource,
        # configured as a part of your Amplify project.
        @[JSON::Field(key: "additionalConstraints")]
        getter additional_constraints : Array(String)?

        # Describes the minimum length of the password required to sign in to the auth resource, configured as
        # a part of your Amplify project.
        @[JSON::Field(key: "minimumLength")]
        getter minimum_length : Float64?

        def initialize(
          @additional_constraints : Array(String)? = nil,
          @minimum_length : Float64? = nil
        )
        end
      end

      # The request object for this operation.
      struct UpdateBackendAuthReqObj
        include JSON::Serializable

        # The resource configuration for this request object.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::UpdateBackendAuthResourceConfig

        # The name of this resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_config : Types::UpdateBackendAuthResourceConfig,
          @resource_name : String
        )
        end
      end

      struct UpdateBackendAuthRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::UpdateBackendAuthResourceConfig

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_config : Types::UpdateBackendAuthResourceConfig,
          @resource_name : String
        )
        end
      end

      # Defines the resource configuration when updating an authentication resource in your Amplify project.
      struct UpdateBackendAuthResourceConfig
        include JSON::Serializable

        # Defines the service name to use when configuring an authentication resource in your Amplify project.
        @[JSON::Field(key: "authResources")]
        getter auth_resources : String

        # Defines the service name to use when configuring an authentication resource in your Amplify project.
        @[JSON::Field(key: "service")]
        getter service : String

        # Describes the authentication configuration for the Amazon Cognito user pool, provisioned as a part
        # of your auth resource in the Amplify project.
        @[JSON::Field(key: "userPoolConfigs")]
        getter user_pool_configs : Types::UpdateBackendAuthUserPoolConfig

        # Describes the authorization configuration for the Amazon Cognito identity pool, provisioned as a
        # part of your auth resource in the Amplify project.
        @[JSON::Field(key: "identityPoolConfigs")]
        getter identity_pool_configs : Types::UpdateBackendAuthIdentityPoolConfig?

        def initialize(
          @auth_resources : String,
          @service : String,
          @user_pool_configs : Types::UpdateBackendAuthUserPoolConfig,
          @identity_pool_configs : Types::UpdateBackendAuthIdentityPoolConfig? = nil
        )
        end
      end

      struct UpdateBackendAuthResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the Amazon Cognito user pool configuration for the authorization resource to be configured
      # for your Amplify project on an update.
      struct UpdateBackendAuthUserPoolConfig
        include JSON::Serializable

        # (DEPRECATED) Describes the forgot password policy for your Amazon Cognito user pool, configured as a
        # part of your Amplify project.
        @[JSON::Field(key: "forgotPassword")]
        getter forgot_password : Types::UpdateBackendAuthForgotPasswordConfig?

        # Describes whether to apply multi-factor authentication policies for your Amazon Cognito user pool
        # configured as a part of your Amplify project.
        @[JSON::Field(key: "mfa")]
        getter mfa : Types::UpdateBackendAuthMFAConfig?

        # Describes the OAuth policy and rules for your Amazon Cognito user pool, configured as a part of your
        # Amplify project.
        @[JSON::Field(key: "oAuth")]
        getter o_auth : Types::UpdateBackendAuthOAuthConfig?

        # Describes the password policy for your Amazon Cognito user pool, configured as a part of your
        # Amplify project.
        @[JSON::Field(key: "passwordPolicy")]
        getter password_policy : Types::UpdateBackendAuthPasswordPolicyConfig?

        # Describes the email or SMS verification message for your Amazon Cognito user pool, configured as a
        # part of your Amplify project.
        @[JSON::Field(key: "verificationMessage")]
        getter verification_message : Types::UpdateBackendAuthVerificationMessageConfig?

        def initialize(
          @forgot_password : Types::UpdateBackendAuthForgotPasswordConfig? = nil,
          @mfa : Types::UpdateBackendAuthMFAConfig? = nil,
          @o_auth : Types::UpdateBackendAuthOAuthConfig? = nil,
          @password_policy : Types::UpdateBackendAuthPasswordPolicyConfig? = nil,
          @verification_message : Types::UpdateBackendAuthVerificationMessageConfig? = nil
        )
        end
      end

      # Updates the configuration of the email or SMS message for the auth resource configured for your
      # Amplify project.
      struct UpdateBackendAuthVerificationMessageConfig
        include JSON::Serializable

        # The type of verification message to send.
        @[JSON::Field(key: "deliveryMethod")]
        getter delivery_method : String

        # The settings for the email message.
        @[JSON::Field(key: "emailSettings")]
        getter email_settings : Types::EmailSettings?

        # The settings for the SMS message.
        @[JSON::Field(key: "smsSettings")]
        getter sms_settings : Types::SmsSettings?

        def initialize(
          @delivery_method : String,
          @email_settings : Types::EmailSettings? = nil,
          @sms_settings : Types::SmsSettings? = nil
        )
        end
      end

      # The request object for this operation.
      struct UpdateBackendConfigReqObj
        include JSON::Serializable

        # Describes the Amazon Cognito configuration for Admin UI access.
        @[JSON::Field(key: "loginAuthConfig")]
        getter login_auth_config : Types::LoginAuthConfigReqObj?

        def initialize(
          @login_auth_config : Types::LoginAuthConfigReqObj? = nil
        )
        end
      end

      struct UpdateBackendConfigRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "loginAuthConfig")]
        getter login_auth_config : Types::LoginAuthConfigReqObj?

        def initialize(
          @app_id : String,
          @login_auth_config : Types::LoginAuthConfigReqObj? = nil
        )
        end
      end

      struct UpdateBackendConfigResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendManagerAppId")]
        getter backend_manager_app_id : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "loginAuthConfig")]
        getter login_auth_config : Types::LoginAuthConfigReqObj?

        def initialize(
          @app_id : String? = nil,
          @backend_manager_app_id : String? = nil,
          @error : String? = nil,
          @login_auth_config : Types::LoginAuthConfigReqObj? = nil
        )
        end
      end

      struct UpdateBackendJobRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @job_id : String,
          @operation : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateBackendJobResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "createTime")]
        getter create_time : String?

        @[JSON::Field(key: "error")]
        getter error : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "operation")]
        getter operation : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        @[JSON::Field(key: "updateTime")]
        getter update_time : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @create_time : String? = nil,
          @error : String? = nil,
          @job_id : String? = nil,
          @operation : String? = nil,
          @status : String? = nil,
          @update_time : String? = nil
        )
        end
      end

      # The request object for this operation.
      struct UpdateBackendStorageReqObj
        include JSON::Serializable

        # The resource configuration for updating backend storage.
        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::UpdateBackendStorageResourceConfig

        # The name of the storage resource.
        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @resource_config : Types::UpdateBackendStorageResourceConfig,
          @resource_name : String
        )
        end
      end

      struct UpdateBackendStorageRequest
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::UpdateBackendStorageResourceConfig

        @[JSON::Field(key: "resourceName")]
        getter resource_name : String

        def initialize(
          @app_id : String,
          @backend_environment_name : String,
          @resource_config : Types::UpdateBackendStorageResourceConfig,
          @resource_name : String
        )
        end
      end

      # The resource configuration for updating backend storage.
      struct UpdateBackendStorageResourceConfig
        include JSON::Serializable

        # The authorization configuration for the storage S3 bucket.
        @[JSON::Field(key: "permissions")]
        getter permissions : Types::BackendStoragePermissions

        # The name of the storage service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        def initialize(
          @permissions : Types::BackendStoragePermissions,
          @service_name : String
        )
        end
      end

      struct UpdateBackendStorageResponse
        include JSON::Serializable

        @[JSON::Field(key: "appId")]
        getter app_id : String?

        @[JSON::Field(key: "backendEnvironmentName")]
        getter backend_environment_name : String?

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @app_id : String? = nil,
          @backend_environment_name : String? = nil,
          @job_id : String? = nil,
          @status : String? = nil
        )
        end
      end
    end
  end
end
