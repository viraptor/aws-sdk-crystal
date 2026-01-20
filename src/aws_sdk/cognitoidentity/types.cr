require "json"
require "time"

module AwsSdk
  module CognitoIdentity
    module Types

      # A provider representing an Amazon Cognito user pool and its client ID.

      struct CognitoIdentityProvider
        include JSON::Serializable

        # The client ID for the Amazon Cognito user pool.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # The provider name for an Amazon Cognito user pool. For example,
        # cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789 .

        @[JSON::Field(key: "ProviderName")]
        getter provider_name : String?

        # TRUE if server-side token validation is enabled for the identity provider’s token. Once you set
        # ServerSideTokenCheck to TRUE for an identity pool, that identity pool will check with the integrated
        # user pools to make sure that the user has not been globally signed out or deleted before the
        # identity pool provides an OIDC token or Amazon Web Services credentials for the user. If the user is
        # signed out or deleted, the identity pool will return a 400 Not Authorized error.

        @[JSON::Field(key: "ServerSideTokenCheck")]
        getter server_side_token_check : Bool?

        def initialize(
          @client_id : String? = nil,
          @provider_name : String? = nil,
          @server_side_token_check : Bool? = nil
        )
        end
      end

      # Thrown if there are parallel requests to modify a resource.

      struct ConcurrentModificationException
        include JSON::Serializable

        # The message returned by a ConcurrentModificationException.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input to the CreateIdentityPool action.

      struct CreateIdentityPoolInput
        include JSON::Serializable

        # TRUE if the identity pool supports unauthenticated logins.

        @[JSON::Field(key: "AllowUnauthenticatedIdentities")]
        getter allow_unauthenticated_identities : Bool

        # A string that you provide.

        @[JSON::Field(key: "IdentityPoolName")]
        getter identity_pool_name : String

        # Enables or disables the Basic (Classic) authentication flow. For more information, see Identity
        # Pools (Federated Identities) Authentication Flow in the Amazon Cognito Developer Guide .

        @[JSON::Field(key: "AllowClassicFlow")]
        getter allow_classic_flow : Bool?

        # An array of Amazon Cognito user pools and their client IDs.

        @[JSON::Field(key: "CognitoIdentityProviders")]
        getter cognito_identity_providers : Array(Types::CognitoIdentityProvider)?

        # The "domain" by which Cognito will refer to your users. This name acts as a placeholder that allows
        # your backend and the Cognito service to communicate about the developer provider. For the
        # DeveloperProviderName , you can use letters as well as period ( . ), underscore ( _ ), and dash ( -
        # ). Once you have set a developer provider name, you cannot change it. Please take care in setting
        # this parameter.

        @[JSON::Field(key: "DeveloperProviderName")]
        getter developer_provider_name : String?

        # Tags to assign to the identity pool. A tag is a label that you can apply to identity pools to
        # categorize and manage them in different ways, such as by purpose, owner, environment, or other
        # criteria.

        @[JSON::Field(key: "IdentityPoolTags")]
        getter identity_pool_tags : Hash(String, String)?

        # The Amazon Resource Names (ARN) of the OpenID Connect providers.

        @[JSON::Field(key: "OpenIdConnectProviderARNs")]
        getter open_id_connect_provider_ar_ns : Array(String)?

        # An array of Amazon Resource Names (ARNs) of the SAML provider for your identity pool.

        @[JSON::Field(key: "SamlProviderARNs")]
        getter saml_provider_ar_ns : Array(String)?

        # Optional key:value pairs mapping provider names to provider app IDs.

        @[JSON::Field(key: "SupportedLoginProviders")]
        getter supported_login_providers : Hash(String, String)?

        def initialize(
          @allow_unauthenticated_identities : Bool,
          @identity_pool_name : String,
          @allow_classic_flow : Bool? = nil,
          @cognito_identity_providers : Array(Types::CognitoIdentityProvider)? = nil,
          @developer_provider_name : String? = nil,
          @identity_pool_tags : Hash(String, String)? = nil,
          @open_id_connect_provider_ar_ns : Array(String)? = nil,
          @saml_provider_ar_ns : Array(String)? = nil,
          @supported_login_providers : Hash(String, String)? = nil
        )
        end
      end

      # Credentials for the provided identity ID.

      struct Credentials
        include JSON::Serializable

        # The Access Key portion of the credentials.

        @[JSON::Field(key: "AccessKeyId")]
        getter access_key_id : String?

        # The date at which these credentials will expire.

        @[JSON::Field(key: "Expiration", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration : Time?

        # The Secret Access Key portion of the credentials

        @[JSON::Field(key: "SecretKey")]
        getter secret_key : String?

        # The Session Token portion of the credentials

        @[JSON::Field(key: "SessionToken")]
        getter session_token : String?

        def initialize(
          @access_key_id : String? = nil,
          @expiration : Time? = nil,
          @secret_key : String? = nil,
          @session_token : String? = nil
        )
        end
      end

      # Input to the DeleteIdentities action.

      struct DeleteIdentitiesInput
        include JSON::Serializable

        # A list of 1-60 identities that you want to delete.

        @[JSON::Field(key: "IdentityIdsToDelete")]
        getter identity_ids_to_delete : Array(String)

        def initialize(
          @identity_ids_to_delete : Array(String)
        )
        end
      end

      # Returned in response to a successful DeleteIdentities operation.

      struct DeleteIdentitiesResponse
        include JSON::Serializable

        # An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.

        @[JSON::Field(key: "UnprocessedIdentityIds")]
        getter unprocessed_identity_ids : Array(Types::UnprocessedIdentityId)?

        def initialize(
          @unprocessed_identity_ids : Array(Types::UnprocessedIdentityId)? = nil
        )
        end
      end

      # Input to the DeleteIdentityPool action.

      struct DeleteIdentityPoolInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # Input to the DescribeIdentity action.

      struct DescribeIdentityInput
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        def initialize(
          @identity_id : String
        )
        end
      end

      # Input to the DescribeIdentityPool action.

      struct DescribeIdentityPoolInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # The provided developer user identifier is already registered with Cognito under a different identity
      # ID.

      struct DeveloperUserAlreadyRegisteredException
        include JSON::Serializable

        # This developer user identifier is already registered with Cognito.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An exception thrown when a dependent service such as Facebook or Twitter is not responding

      struct ExternalServiceException
        include JSON::Serializable

        # The message returned by an ExternalServiceException

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input to the GetCredentialsForIdentity action.

      struct GetCredentialsForIdentityInput
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # The Amazon Resource Name (ARN) of the role to be assumed when multiple roles were received in the
        # token from the identity provider. For example, a SAML-based identity provider. This parameter is
        # optional for identity providers that do not support role customization.

        @[JSON::Field(key: "CustomRoleArn")]
        getter custom_role_arn : String?

        # A set of optional name-value pairs that map provider names to provider tokens. The name-value pair
        # will follow the syntax "provider_name": "provider_user_identifier". Logins should not be specified
        # when trying to get credentials for an unauthenticated identity. The Logins parameter is required
        # when using identities associated with external identity providers such as Facebook. For examples of
        # Logins maps, see the code examples in the External Identity Providers section of the Amazon Cognito
        # Developer Guide.

        @[JSON::Field(key: "Logins")]
        getter logins : Hash(String, String)?

        def initialize(
          @identity_id : String,
          @custom_role_arn : String? = nil,
          @logins : Hash(String, String)? = nil
        )
        end
      end

      # Returned in response to a successful GetCredentialsForIdentity operation.

      struct GetCredentialsForIdentityResponse
        include JSON::Serializable

        # Credentials for the provided identity ID.

        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::Credentials?

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        def initialize(
          @credentials : Types::Credentials? = nil,
          @identity_id : String? = nil
        )
        end
      end

      # Input to the GetId action.

      struct GetIdInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # A standard Amazon Web Services account ID (9+ digits).

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # A set of optional name-value pairs that map provider names to provider tokens. The available
        # provider names for Logins are as follows: Facebook: graph.facebook.com Amazon Cognito user pool:
        # cognito-idp.&lt;region&gt;.amazonaws.com/&lt;YOUR_USER_POOL_ID&gt; , for example,
        # cognito-idp.us-east-1.amazonaws.com/us-east-1_123456789 . Google: accounts.google.com Amazon:
        # www.amazon.com Twitter: api.twitter.com Digits: www.digits.com

        @[JSON::Field(key: "Logins")]
        getter logins : Hash(String, String)?

        def initialize(
          @identity_pool_id : String,
          @account_id : String? = nil,
          @logins : Hash(String, String)? = nil
        )
        end
      end

      # Returned in response to a GetId request.

      struct GetIdResponse
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        def initialize(
          @identity_id : String? = nil
        )
        end
      end

      # Input to the GetIdentityPoolRoles action.

      struct GetIdentityPoolRolesInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @identity_pool_id : String
        )
        end
      end

      # Returned in response to a successful GetIdentityPoolRoles operation.

      struct GetIdentityPoolRolesResponse
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # How users for a specific identity provider are to mapped to roles. This is a String-to- RoleMapping
        # object map. The string identifies the identity provider, for example, graph.facebook.com or
        # cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id .

        @[JSON::Field(key: "RoleMappings")]
        getter role_mappings : Hash(String, Types::RoleMapping)?

        # The map of roles associated with this pool. Currently only authenticated and unauthenticated roles
        # are supported.

        @[JSON::Field(key: "Roles")]
        getter roles : Hash(String, String)?

        def initialize(
          @identity_pool_id : String? = nil,
          @role_mappings : Hash(String, Types::RoleMapping)? = nil,
          @roles : Hash(String, String)? = nil
        )
        end
      end

      # Input to the GetOpenIdTokenForDeveloperIdentity action.

      struct GetOpenIdTokenForDeveloperIdentityInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # A set of optional name-value pairs that map provider names to provider tokens. Each name-value pair
        # represents a user from a public provider or developer provider. If the user is from a developer
        # provider, the name-value pair will follow the syntax "developer_provider_name":
        # "developer_user_identifier" . The developer provider is the "domain" by which Cognito will refer to
        # your users; you provided this domain while creating/updating the identity pool. The developer user
        # identifier is an identifier from your backend that uniquely identifies a user. When you create an
        # identity pool, you can specify the supported logins.

        @[JSON::Field(key: "Logins")]
        getter logins : Hash(String, String)

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # Use this operation to configure attribute mappings for custom providers.

        @[JSON::Field(key: "PrincipalTags")]
        getter principal_tags : Hash(String, String)?

        # The expiration time of the token, in seconds. You can specify a custom expiration time for the token
        # so that you can cache it. If you don't provide an expiration time, the token is valid for 15
        # minutes. You can exchange the token with Amazon STS for temporary Amazon Web Services credentials,
        # which are valid for a maximum of one hour. The maximum token duration you can set is 24 hours. You
        # should take care in setting the expiration time for a token, as there are significant security
        # implications: an attacker could use a leaked token to access your Amazon Web Services resources for
        # the token's duration. Please provide for a small grace period, usually no more than 5 minutes, to
        # account for clock skew.

        @[JSON::Field(key: "TokenDuration")]
        getter token_duration : Int64?

        def initialize(
          @identity_pool_id : String,
          @logins : Hash(String, String),
          @identity_id : String? = nil,
          @principal_tags : Hash(String, String)? = nil,
          @token_duration : Int64? = nil
        )
        end
      end

      # Returned in response to a successful GetOpenIdTokenForDeveloperIdentity request.

      struct GetOpenIdTokenForDeveloperIdentityResponse
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # An OpenID token.

        @[JSON::Field(key: "Token")]
        getter token : String?

        def initialize(
          @identity_id : String? = nil,
          @token : String? = nil
        )
        end
      end

      # Input to the GetOpenIdToken action.

      struct GetOpenIdTokenInput
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A set of optional name-value pairs that map provider names to provider tokens. When using
        # graph.facebook.com and www.amazon.com, supply the access_token returned from the provider's
        # authflow. For accounts.google.com, an Amazon Cognito user pool provider, or any other OpenID Connect
        # provider, always include the id_token .

        @[JSON::Field(key: "Logins")]
        getter logins : Hash(String, String)?

        def initialize(
          @identity_id : String,
          @logins : Hash(String, String)? = nil
        )
        end
      end

      # Returned in response to a successful GetOpenIdToken request.

      struct GetOpenIdTokenResponse
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID. Note that the IdentityId returned may not match the
        # one passed on input.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # An OpenID token, valid for 10 minutes.

        @[JSON::Field(key: "Token")]
        getter token : String?

        def initialize(
          @identity_id : String? = nil,
          @token : String? = nil
        )
        end
      end


      struct GetPrincipalTagAttributeMapInput
        include JSON::Serializable

        # You can use this operation to get the ID of the Identity Pool you setup attribute mappings for.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # You can use this operation to get the provider name.

        @[JSON::Field(key: "IdentityProviderName")]
        getter identity_provider_name : String

        def initialize(
          @identity_pool_id : String,
          @identity_provider_name : String
        )
        end
      end


      struct GetPrincipalTagAttributeMapResponse
        include JSON::Serializable

        # You can use this operation to get the ID of the Identity Pool you setup attribute mappings for.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # You can use this operation to get the provider name.

        @[JSON::Field(key: "IdentityProviderName")]
        getter identity_provider_name : String?

        # You can use this operation to add principal tags. The PrincipalTags operation enables you to
        # reference user attributes in your IAM permissions policy.

        @[JSON::Field(key: "PrincipalTags")]
        getter principal_tags : Hash(String, String)?

        # You can use this operation to list

        @[JSON::Field(key: "UseDefaults")]
        getter use_defaults : Bool?

        def initialize(
          @identity_pool_id : String? = nil,
          @identity_provider_name : String? = nil,
          @principal_tags : Hash(String, String)? = nil,
          @use_defaults : Bool? = nil
        )
        end
      end

      # A description of the identity.

      struct IdentityDescription
        include JSON::Serializable

        # Date on which the identity was created.

        @[JSON::Field(key: "CreationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # Date on which the identity was last modified.

        @[JSON::Field(key: "LastModifiedDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_modified_date : Time?

        # The provider names.

        @[JSON::Field(key: "Logins")]
        getter logins : Array(String)?

        def initialize(
          @creation_date : Time? = nil,
          @identity_id : String? = nil,
          @last_modified_date : Time? = nil,
          @logins : Array(String)? = nil
        )
        end
      end

      # An object representing an Amazon Cognito identity pool.

      struct IdentityPool
        include JSON::Serializable

        # TRUE if the identity pool supports unauthenticated logins.

        @[JSON::Field(key: "AllowUnauthenticatedIdentities")]
        getter allow_unauthenticated_identities : Bool

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # A string that you provide.

        @[JSON::Field(key: "IdentityPoolName")]
        getter identity_pool_name : String

        # Enables or disables the Basic (Classic) authentication flow. For more information, see Identity
        # Pools (Federated Identities) Authentication Flow in the Amazon Cognito Developer Guide .

        @[JSON::Field(key: "AllowClassicFlow")]
        getter allow_classic_flow : Bool?

        # A list representing an Amazon Cognito user pool and its client ID.

        @[JSON::Field(key: "CognitoIdentityProviders")]
        getter cognito_identity_providers : Array(Types::CognitoIdentityProvider)?

        # The "domain" by which Cognito will refer to your users.

        @[JSON::Field(key: "DeveloperProviderName")]
        getter developer_provider_name : String?

        # The tags that are assigned to the identity pool. A tag is a label that you can apply to identity
        # pools to categorize and manage them in different ways, such as by purpose, owner, environment, or
        # other criteria.

        @[JSON::Field(key: "IdentityPoolTags")]
        getter identity_pool_tags : Hash(String, String)?

        # The ARNs of the OpenID Connect providers.

        @[JSON::Field(key: "OpenIdConnectProviderARNs")]
        getter open_id_connect_provider_ar_ns : Array(String)?

        # An array of Amazon Resource Names (ARNs) of the SAML provider for your identity pool.

        @[JSON::Field(key: "SamlProviderARNs")]
        getter saml_provider_ar_ns : Array(String)?

        # Optional key:value pairs mapping provider names to provider app IDs.

        @[JSON::Field(key: "SupportedLoginProviders")]
        getter supported_login_providers : Hash(String, String)?

        def initialize(
          @allow_unauthenticated_identities : Bool,
          @identity_pool_id : String,
          @identity_pool_name : String,
          @allow_classic_flow : Bool? = nil,
          @cognito_identity_providers : Array(Types::CognitoIdentityProvider)? = nil,
          @developer_provider_name : String? = nil,
          @identity_pool_tags : Hash(String, String)? = nil,
          @open_id_connect_provider_ar_ns : Array(String)? = nil,
          @saml_provider_ar_ns : Array(String)? = nil,
          @supported_login_providers : Hash(String, String)? = nil
        )
        end
      end

      # A description of the identity pool.

      struct IdentityPoolShortDescription
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # A string that you provide.

        @[JSON::Field(key: "IdentityPoolName")]
        getter identity_pool_name : String?

        def initialize(
          @identity_pool_id : String? = nil,
          @identity_pool_name : String? = nil
        )
        end
      end

      # Thrown when the service encounters an error during processing the request.

      struct InternalErrorException
        include JSON::Serializable

        # The message returned by an InternalErrorException.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # If you provided authentication information in the request, the identity pool has no authenticated
      # role configured, or STS returned an error response to the request to assume the authenticated role
      # from the identity pool. If you provided no authentication information in the request, the identity
      # pool has no unauthenticated role configured, or STS returned an error response to the request to
      # assume the unauthenticated role from the identity pool. Your role trust policy must grant
      # AssumeRoleWithWebIdentity permissions to cognito-identity.amazonaws.com .

      struct InvalidIdentityPoolConfigurationException
        include JSON::Serializable

        # The message returned for an InvalidIdentityPoolConfigurationException

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Thrown for missing or bad input parameter(s).

      struct InvalidParameterException
        include JSON::Serializable

        # The message returned by an InvalidParameterException.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Thrown when the total number of user pools has exceeded a preset limit.

      struct LimitExceededException
        include JSON::Serializable

        # The message returned by a LimitExceededException.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input to the ListIdentities action.

      struct ListIdentitiesInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The maximum number of identities to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # An optional boolean parameter that allows you to hide disabled identities. If omitted, the
        # ListIdentities API will include disabled identities in the response.

        @[JSON::Field(key: "HideDisabled")]
        getter hide_disabled : Bool?

        # A pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_pool_id : String,
          @max_results : Int32,
          @hide_disabled : Bool? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The response to a ListIdentities request.

      struct ListIdentitiesResponse
        include JSON::Serializable

        # An object containing a set of identities and associated mappings.

        @[JSON::Field(key: "Identities")]
        getter identities : Array(Types::IdentityDescription)?

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # A pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identities : Array(Types::IdentityDescription)? = nil,
          @identity_pool_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Input to the ListIdentityPools action.

      struct ListIdentityPoolsInput
        include JSON::Serializable

        # The maximum number of identities to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32

        # A pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32,
          @next_token : String? = nil
        )
        end
      end

      # The result of a successful ListIdentityPools action.

      struct ListIdentityPoolsResponse
        include JSON::Serializable

        # The identity pools returned by the ListIdentityPools action.

        @[JSON::Field(key: "IdentityPools")]
        getter identity_pools : Array(Types::IdentityPoolShortDescription)?

        # A pagination token.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_pools : Array(Types::IdentityPoolShortDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the identity pool that the tags are assigned to.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags that are assigned to the identity pool.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Input to the LookupDeveloperIdentityInput action.

      struct LookupDeveloperIdentityInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # A unique ID used by your backend authentication process to identify a user. Typically, a developer
        # identity provider would issue many developer user identifiers, in keeping with the number of users.

        @[JSON::Field(key: "DeveloperUserIdentifier")]
        getter developer_user_identifier : String?

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # The maximum number of identities to return.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A pagination token. The first call you make will have NextToken set to null. After that the service
        # will return NextToken values as needed. For example, let's say you make a request with MaxResults
        # set to 10, and there are 20 matches in the database. The service will return a pagination token as a
        # part of the response. This token can be used to call the API again and get results starting from the
        # 11th match.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @identity_pool_id : String,
          @developer_user_identifier : String? = nil,
          @identity_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Returned in response to a successful LookupDeveloperIdentity action.

      struct LookupDeveloperIdentityResponse
        include JSON::Serializable

        # This is the list of developer user identifiers associated with an identity ID. Cognito supports the
        # association of multiple developer user identifiers with an identity ID.

        @[JSON::Field(key: "DeveloperUserIdentifierList")]
        getter developer_user_identifier_list : Array(String)?

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        # A pagination token. The first call you make will have NextToken set to null. After that the service
        # will return NextToken values as needed. For example, let's say you make a request with MaxResults
        # set to 10, and there are 20 matches in the database. The service will return a pagination token as a
        # part of the response. This token can be used to call the API again and get results starting from the
        # 11th match.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @developer_user_identifier_list : Array(String)? = nil,
          @identity_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A rule that maps a claim name, a claim value, and a match type to a role ARN.

      struct MappingRule
        include JSON::Serializable

        # The claim name that must be present in the token, for example, "isAdmin" or "paid".

        @[JSON::Field(key: "Claim")]
        getter claim : String

        # The match condition that specifies how closely the claim value in the IdP token must match Value .

        @[JSON::Field(key: "MatchType")]
        getter match_type : String

        # The role ARN.

        @[JSON::Field(key: "RoleARN")]
        getter role_arn : String

        # A brief string that the claim must match, for example, "paid" or "yes".

        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @claim : String,
          @match_type : String,
          @role_arn : String,
          @value : String
        )
        end
      end

      # Input to the MergeDeveloperIdentities action.

      struct MergeDeveloperIdentitiesInput
        include JSON::Serializable

        # User identifier for the destination user. The value should be a DeveloperUserIdentifier .

        @[JSON::Field(key: "DestinationUserIdentifier")]
        getter destination_user_identifier : String

        # The "domain" by which Cognito will refer to your users. This is a (pseudo) domain name that you
        # provide while creating an identity pool. This name acts as a placeholder that allows your backend
        # and the Cognito service to communicate about the developer provider. For the DeveloperProviderName ,
        # you can use letters as well as period (.), underscore (_), and dash (-).

        @[JSON::Field(key: "DeveloperProviderName")]
        getter developer_provider_name : String

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # User identifier for the source user. The value should be a DeveloperUserIdentifier .

        @[JSON::Field(key: "SourceUserIdentifier")]
        getter source_user_identifier : String

        def initialize(
          @destination_user_identifier : String,
          @developer_provider_name : String,
          @identity_pool_id : String,
          @source_user_identifier : String
        )
        end
      end

      # Returned in response to a successful MergeDeveloperIdentities action.

      struct MergeDeveloperIdentitiesResponse
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        def initialize(
          @identity_id : String? = nil
        )
        end
      end

      # Thrown when a user is not authorized to access the requested resource.

      struct NotAuthorizedException
        include JSON::Serializable

        # The message returned by a NotAuthorizedException

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Thrown when a user tries to use a login which is already linked to another account.

      struct ResourceConflictException
        include JSON::Serializable

        # The message returned by a ResourceConflictException.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Thrown when the requested resource (for example, a dataset or record) does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The message returned by a ResourceNotFoundException.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A role mapping.

      struct RoleMapping
        include JSON::Serializable

        # The role mapping type. Token will use cognito:roles and cognito:preferred_role claims from the
        # Cognito identity provider token to map groups to roles. Rules will attempt to match claims from the
        # token to map to a role.

        @[JSON::Field(key: "Type")]
        getter type : String

        # If you specify Token or Rules as the Type , AmbiguousRoleResolution is required. Specifies the
        # action to be taken if either no rules match the claim value for the Rules type, or there is no
        # cognito:preferred_role claim and there are multiple cognito:roles matches for the Token type.

        @[JSON::Field(key: "AmbiguousRoleResolution")]
        getter ambiguous_role_resolution : String?

        # The rules to be used for mapping users to roles. If you specify Rules as the role mapping type,
        # RulesConfiguration is required.

        @[JSON::Field(key: "RulesConfiguration")]
        getter rules_configuration : Types::RulesConfigurationType?

        def initialize(
          @type : String,
          @ambiguous_role_resolution : String? = nil,
          @rules_configuration : Types::RulesConfigurationType? = nil
        )
        end
      end

      # A container for rules.

      struct RulesConfigurationType
        include JSON::Serializable

        # An array of rules. You can specify up to 25 rules per identity provider. Rules are evaluated in
        # order. The first one to match specifies the role.

        @[JSON::Field(key: "Rules")]
        getter rules : Array(Types::MappingRule)

        def initialize(
          @rules : Array(Types::MappingRule)
        )
        end
      end

      # Input to the SetIdentityPoolRoles action.

      struct SetIdentityPoolRolesInput
        include JSON::Serializable

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The map of roles associated with this pool. For a given role, the key will be either "authenticated"
        # or "unauthenticated" and the value will be the Role ARN.

        @[JSON::Field(key: "Roles")]
        getter roles : Hash(String, String)

        # How users for a specific identity provider are to mapped to roles. This is a string to RoleMapping
        # object map. The string identifies the identity provider, for example, graph.facebook.com or
        # cognito-idp.us-east-1.amazonaws.com/us-east-1_abcdefghi:app_client_id . Up to 25 rules can be
        # specified per identity provider.

        @[JSON::Field(key: "RoleMappings")]
        getter role_mappings : Hash(String, Types::RoleMapping)?

        def initialize(
          @identity_pool_id : String,
          @roles : Hash(String, String),
          @role_mappings : Hash(String, Types::RoleMapping)? = nil
        )
        end
      end


      struct SetPrincipalTagAttributeMapInput
        include JSON::Serializable

        # The ID of the Identity Pool you want to set attribute mappings for.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        # The provider name you want to use for attribute mappings.

        @[JSON::Field(key: "IdentityProviderName")]
        getter identity_provider_name : String

        # You can use this operation to add principal tags.

        @[JSON::Field(key: "PrincipalTags")]
        getter principal_tags : Hash(String, String)?

        # You can use this operation to use default (username and clientID) attribute mappings.

        @[JSON::Field(key: "UseDefaults")]
        getter use_defaults : Bool?

        def initialize(
          @identity_pool_id : String,
          @identity_provider_name : String,
          @principal_tags : Hash(String, String)? = nil,
          @use_defaults : Bool? = nil
        )
        end
      end


      struct SetPrincipalTagAttributeMapResponse
        include JSON::Serializable

        # The ID of the Identity Pool you want to set attribute mappings for.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String?

        # The provider name you want to use for attribute mappings.

        @[JSON::Field(key: "IdentityProviderName")]
        getter identity_provider_name : String?

        # You can use this operation to add principal tags. The PrincipalTags operation enables you to
        # reference user attributes in your IAM permissions policy.

        @[JSON::Field(key: "PrincipalTags")]
        getter principal_tags : Hash(String, String)?

        # You can use this operation to select default (username and clientID) attribute mappings.

        @[JSON::Field(key: "UseDefaults")]
        getter use_defaults : Bool?

        def initialize(
          @identity_pool_id : String? = nil,
          @identity_provider_name : String? = nil,
          @principal_tags : Hash(String, String)? = nil,
          @use_defaults : Bool? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the identity pool.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The tags to assign to the identity pool.

        @[JSON::Field(key: "Tags")]
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

      # Thrown when a request is throttled.

      struct TooManyRequestsException
        include JSON::Serializable

        # Message returned by a TooManyRequestsException

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Input to the UnlinkDeveloperIdentity action.

      struct UnlinkDeveloperIdentityInput
        include JSON::Serializable

        # The "domain" by which Cognito will refer to your users.

        @[JSON::Field(key: "DeveloperProviderName")]
        getter developer_provider_name : String

        # A unique ID used by your backend authentication process to identify a user.

        @[JSON::Field(key: "DeveloperUserIdentifier")]
        getter developer_user_identifier : String

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # An identity pool ID in the format REGION:GUID.

        @[JSON::Field(key: "IdentityPoolId")]
        getter identity_pool_id : String

        def initialize(
          @developer_provider_name : String,
          @developer_user_identifier : String,
          @identity_id : String,
          @identity_pool_id : String
        )
        end
      end

      # Input to the UnlinkIdentity action.

      struct UnlinkIdentityInput
        include JSON::Serializable

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String

        # A set of optional name-value pairs that map provider names to provider tokens.

        @[JSON::Field(key: "Logins")]
        getter logins : Hash(String, String)

        # Provider names to unlink from this identity.

        @[JSON::Field(key: "LoginsToRemove")]
        getter logins_to_remove : Array(String)

        def initialize(
          @identity_id : String,
          @logins : Hash(String, String),
          @logins_to_remove : Array(String)
        )
        end
      end

      # An array of UnprocessedIdentityId objects, each of which contains an ErrorCode and IdentityId.

      struct UnprocessedIdentityId
        include JSON::Serializable

        # The error code indicating the type of error that occurred.

        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # A unique identifier in the format REGION:GUID.

        @[JSON::Field(key: "IdentityId")]
        getter identity_id : String?

        def initialize(
          @error_code : String? = nil,
          @identity_id : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the identity pool.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove from the user pool.

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
    end
  end
end
