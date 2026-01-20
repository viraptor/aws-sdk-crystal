module Aws
  module CognitoIdentity
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

      # Creates a new identity pool. The identity pool is a store of user identity information that is
      # specific to your Amazon Web Services account. The keys for SupportedLoginProviders are as follows:
      # Facebook: graph.facebook.com Google: accounts.google.com Sign in With Apple: appleid.apple.com
      # Amazon: www.amazon.com Twitter: api.twitter.com Digits: www.digits.com If you don't provide a value
      # for a parameter, Amazon Cognito sets it to its default value. You must use Amazon Web Services
      # developer credentials to call this operation.

      def create_identity_pool(
        allow_unauthenticated_identities : Bool,
        identity_pool_name : String,
        allow_classic_flow : Bool? = nil,
        cognito_identity_providers : Array(Types::CognitoIdentityProvider)? = nil,
        developer_provider_name : String? = nil,
        identity_pool_tags : Hash(String, String)? = nil,
        open_id_connect_provider_ar_ns : Array(String)? = nil,
        saml_provider_ar_ns : Array(String)? = nil,
        supported_login_providers : Hash(String, String)? = nil
      ) : Types::IdentityPool

        input = Types::CreateIdentityPoolInput.new(allow_unauthenticated_identities: allow_unauthenticated_identities, identity_pool_name: identity_pool_name, allow_classic_flow: allow_classic_flow, cognito_identity_providers: cognito_identity_providers, developer_provider_name: developer_provider_name, identity_pool_tags: identity_pool_tags, open_id_connect_provider_ar_ns: open_id_connect_provider_ar_ns, saml_provider_ar_ns: saml_provider_ar_ns, supported_login_providers: supported_login_providers)
        create_identity_pool(input)
      end

      def create_identity_pool(input : Types::CreateIdentityPoolInput) : Types::IdentityPool
        request = Protocol::JsonRpc.build_request(Model::CREATE_IDENTITY_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IdentityPool, "CreateIdentityPool")
      end

      # Deletes identities from an identity pool. You can specify a list of 1-60 identities that you want to
      # delete. You must use Amazon Web Services developer credentials to call this operation.

      def delete_identities(
        identity_ids_to_delete : Array(String)
      ) : Types::DeleteIdentitiesResponse

        input = Types::DeleteIdentitiesInput.new(identity_ids_to_delete: identity_ids_to_delete)
        delete_identities(input)
      end

      def delete_identities(input : Types::DeleteIdentitiesInput) : Types::DeleteIdentitiesResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_IDENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIdentitiesResponse, "DeleteIdentities")
      end

      # Deletes an identity pool. Once a pool is deleted, users will not be able to authenticate with the
      # pool. You must use Amazon Web Services developer credentials to call this operation.

      def delete_identity_pool(
        identity_pool_id : String
      ) : Nil

        input = Types::DeleteIdentityPoolInput.new(identity_pool_id: identity_pool_id)
        delete_identity_pool(input)
      end

      def delete_identity_pool(input : Types::DeleteIdentityPoolInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::DELETE_IDENTITY_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Returns metadata related to the given identity, including when the identity was created and any
      # associated linked logins. You must use Amazon Web Services developer credentials to call this
      # operation.

      def describe_identity(
        identity_id : String
      ) : Types::IdentityDescription

        input = Types::DescribeIdentityInput.new(identity_id: identity_id)
        describe_identity(input)
      end

      def describe_identity(input : Types::DescribeIdentityInput) : Types::IdentityDescription
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IdentityDescription, "DescribeIdentity")
      end

      # Gets details about a particular identity pool, including the pool name, ID description, creation
      # date, and current number of users. You must use Amazon Web Services developer credentials to call
      # this operation.

      def describe_identity_pool(
        identity_pool_id : String
      ) : Types::IdentityPool

        input = Types::DescribeIdentityPoolInput.new(identity_pool_id: identity_pool_id)
        describe_identity_pool(input)
      end

      def describe_identity_pool(input : Types::DescribeIdentityPoolInput) : Types::IdentityPool
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_IDENTITY_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IdentityPool, "DescribeIdentityPool")
      end

      # Returns credentials for the provided identity ID. Any provided logins will be validated against
      # supported login providers. If the token is for cognito-identity.amazonaws.com , it will be passed
      # through to Security Token Service with the appropriate role for the token. This is a public API. You
      # do not need any credentials to call this API.

      def get_credentials_for_identity(
        identity_id : String,
        custom_role_arn : String? = nil,
        logins : Hash(String, String)? = nil
      ) : Types::GetCredentialsForIdentityResponse

        input = Types::GetCredentialsForIdentityInput.new(identity_id: identity_id, custom_role_arn: custom_role_arn, logins: logins)
        get_credentials_for_identity(input)
      end

      def get_credentials_for_identity(input : Types::GetCredentialsForIdentityInput) : Types::GetCredentialsForIdentityResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CREDENTIALS_FOR_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetCredentialsForIdentityResponse, "GetCredentialsForIdentity")
      end

      # Generates (or retrieves) IdentityID. Supplying multiple logins will create an implicit linked
      # account. This is a public API. You do not need any credentials to call this API.

      def get_id(
        identity_pool_id : String,
        account_id : String? = nil,
        logins : Hash(String, String)? = nil
      ) : Types::GetIdResponse

        input = Types::GetIdInput.new(identity_pool_id: identity_pool_id, account_id: account_id, logins: logins)
        get_id(input)
      end

      def get_id(input : Types::GetIdInput) : Types::GetIdResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ID, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIdResponse, "GetId")
      end

      # Gets the roles for an identity pool. You must use Amazon Web Services developer credentials to call
      # this operation.

      def get_identity_pool_roles(
        identity_pool_id : String
      ) : Types::GetIdentityPoolRolesResponse

        input = Types::GetIdentityPoolRolesInput.new(identity_pool_id: identity_pool_id)
        get_identity_pool_roles(input)
      end

      def get_identity_pool_roles(input : Types::GetIdentityPoolRolesInput) : Types::GetIdentityPoolRolesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_IDENTITY_POOL_ROLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIdentityPoolRolesResponse, "GetIdentityPoolRoles")
      end

      # Gets an OpenID token, using a known Cognito ID. This known Cognito ID is returned by GetId . You can
      # optionally add additional logins for the identity. Supplying multiple logins creates an implicit
      # link. The OpenID token is valid for 10 minutes. This is a public API. You do not need any
      # credentials to call this API.

      def get_open_id_token(
        identity_id : String,
        logins : Hash(String, String)? = nil
      ) : Types::GetOpenIdTokenResponse

        input = Types::GetOpenIdTokenInput.new(identity_id: identity_id, logins: logins)
        get_open_id_token(input)
      end

      def get_open_id_token(input : Types::GetOpenIdTokenInput) : Types::GetOpenIdTokenResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OPEN_ID_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOpenIdTokenResponse, "GetOpenIdToken")
      end

      # Registers (or retrieves) a Cognito IdentityId and an OpenID Connect token for a user authenticated
      # by your backend authentication process. Supplying multiple logins will create an implicit linked
      # account. You can only specify one developer provider as part of the Logins map, which is linked to
      # the identity pool. The developer provider is the "domain" by which Cognito will refer to your users.
      # You can use GetOpenIdTokenForDeveloperIdentity to create a new identity and to link new logins (that
      # is, user credentials issued by a public provider or developer provider) to an existing identity.
      # When you want to create a new identity, the IdentityId should be null. When you want to associate a
      # new login with an existing authenticated/unauthenticated identity, you can do so by providing the
      # existing IdentityId . This API will create the identity in the specified IdentityPoolId . You must
      # use Amazon Web Services developer credentials to call this operation.

      def get_open_id_token_for_developer_identity(
        identity_pool_id : String,
        logins : Hash(String, String),
        identity_id : String? = nil,
        principal_tags : Hash(String, String)? = nil,
        token_duration : Int64? = nil
      ) : Types::GetOpenIdTokenForDeveloperIdentityResponse

        input = Types::GetOpenIdTokenForDeveloperIdentityInput.new(identity_pool_id: identity_pool_id, logins: logins, identity_id: identity_id, principal_tags: principal_tags, token_duration: token_duration)
        get_open_id_token_for_developer_identity(input)
      end

      def get_open_id_token_for_developer_identity(input : Types::GetOpenIdTokenForDeveloperIdentityInput) : Types::GetOpenIdTokenForDeveloperIdentityResponse
        request = Protocol::JsonRpc.build_request(Model::GET_OPEN_ID_TOKEN_FOR_DEVELOPER_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetOpenIdTokenForDeveloperIdentityResponse, "GetOpenIdTokenForDeveloperIdentity")
      end

      # Use GetPrincipalTagAttributeMap to list all mappings between PrincipalTags and user attributes.

      def get_principal_tag_attribute_map(
        identity_pool_id : String,
        identity_provider_name : String
      ) : Types::GetPrincipalTagAttributeMapResponse

        input = Types::GetPrincipalTagAttributeMapInput.new(identity_pool_id: identity_pool_id, identity_provider_name: identity_provider_name)
        get_principal_tag_attribute_map(input)
      end

      def get_principal_tag_attribute_map(input : Types::GetPrincipalTagAttributeMapInput) : Types::GetPrincipalTagAttributeMapResponse
        request = Protocol::JsonRpc.build_request(Model::GET_PRINCIPAL_TAG_ATTRIBUTE_MAP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPrincipalTagAttributeMapResponse, "GetPrincipalTagAttributeMap")
      end

      # Lists the identities in an identity pool. You must use Amazon Web Services developer credentials to
      # call this operation.

      def list_identities(
        identity_pool_id : String,
        max_results : Int32,
        hide_disabled : Bool? = nil,
        next_token : String? = nil
      ) : Types::ListIdentitiesResponse

        input = Types::ListIdentitiesInput.new(identity_pool_id: identity_pool_id, max_results: max_results, hide_disabled: hide_disabled, next_token: next_token)
        list_identities(input)
      end

      def list_identities(input : Types::ListIdentitiesInput) : Types::ListIdentitiesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IDENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIdentitiesResponse, "ListIdentities")
      end

      # Lists all of the Cognito identity pools registered for your account. You must use Amazon Web
      # Services developer credentials to call this operation.

      def list_identity_pools(
        max_results : Int32,
        next_token : String? = nil
      ) : Types::ListIdentityPoolsResponse

        input = Types::ListIdentityPoolsInput.new(max_results: max_results, next_token: next_token)
        list_identity_pools(input)
      end

      def list_identity_pools(input : Types::ListIdentityPoolsInput) : Types::ListIdentityPoolsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_IDENTITY_POOLS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIdentityPoolsResponse, "ListIdentityPools")
      end

      # Lists the tags that are assigned to an Amazon Cognito identity pool. A tag is a label that you can
      # apply to identity pools to categorize and manage them in different ways, such as by purpose, owner,
      # environment, or other criteria. You can use this action up to 10 times per second, per account.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Retrieves the IdentityID associated with a DeveloperUserIdentifier or the list of
      # DeveloperUserIdentifier values associated with an IdentityId for an existing identity. Either
      # IdentityID or DeveloperUserIdentifier must not be null. If you supply only one of these values, the
      # other value will be searched in the database and returned as a part of the response. If you supply
      # both, DeveloperUserIdentifier will be matched against IdentityID . If the values are verified
      # against the database, the response returns both values and is the same as the request. Otherwise, a
      # ResourceConflictException is thrown. LookupDeveloperIdentity is intended for low-throughput control
      # plane operations: for example, to enable customer service to locate an identity ID by username. If
      # you are using it for higher-volume operations such as user authentication, your requests are likely
      # to be throttled. GetOpenIdTokenForDeveloperIdentity is a better option for higher-volume operations
      # for user authentication. You must use Amazon Web Services developer credentials to call this
      # operation.

      def lookup_developer_identity(
        identity_pool_id : String,
        developer_user_identifier : String? = nil,
        identity_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::LookupDeveloperIdentityResponse

        input = Types::LookupDeveloperIdentityInput.new(identity_pool_id: identity_pool_id, developer_user_identifier: developer_user_identifier, identity_id: identity_id, max_results: max_results, next_token: next_token)
        lookup_developer_identity(input)
      end

      def lookup_developer_identity(input : Types::LookupDeveloperIdentityInput) : Types::LookupDeveloperIdentityResponse
        request = Protocol::JsonRpc.build_request(Model::LOOKUP_DEVELOPER_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::LookupDeveloperIdentityResponse, "LookupDeveloperIdentity")
      end

      # Merges two users having different IdentityId s, existing in the same identity pool, and identified
      # by the same developer provider. You can use this action to request that discrete users be merged and
      # identified as a single user in the Cognito environment. Cognito associates the given source user (
      # SourceUserIdentifier ) with the IdentityId of the DestinationUserIdentifier . Only
      # developer-authenticated users can be merged. If the users to be merged are associated with the same
      # public provider, but as two different users, an exception will be thrown. The number of linked
      # logins is limited to 20. So, the number of linked logins for the source user, SourceUserIdentifier ,
      # and the destination user, DestinationUserIdentifier , together should not be larger than 20.
      # Otherwise, an exception will be thrown. You must use Amazon Web Services developer credentials to
      # call this operation.

      def merge_developer_identities(
        destination_user_identifier : String,
        developer_provider_name : String,
        identity_pool_id : String,
        source_user_identifier : String
      ) : Types::MergeDeveloperIdentitiesResponse

        input = Types::MergeDeveloperIdentitiesInput.new(destination_user_identifier: destination_user_identifier, developer_provider_name: developer_provider_name, identity_pool_id: identity_pool_id, source_user_identifier: source_user_identifier)
        merge_developer_identities(input)
      end

      def merge_developer_identities(input : Types::MergeDeveloperIdentitiesInput) : Types::MergeDeveloperIdentitiesResponse
        request = Protocol::JsonRpc.build_request(Model::MERGE_DEVELOPER_IDENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::MergeDeveloperIdentitiesResponse, "MergeDeveloperIdentities")
      end

      # Sets the roles for an identity pool. These roles are used when making calls to
      # GetCredentialsForIdentity action. You must use Amazon Web Services developer credentials to call
      # this operation.

      def set_identity_pool_roles(
        identity_pool_id : String,
        roles : Hash(String, String),
        role_mappings : Hash(String, Types::RoleMapping)? = nil
      ) : Nil

        input = Types::SetIdentityPoolRolesInput.new(identity_pool_id: identity_pool_id, roles: roles, role_mappings: role_mappings)
        set_identity_pool_roles(input)
      end

      def set_identity_pool_roles(input : Types::SetIdentityPoolRolesInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::SET_IDENTITY_POOL_ROLES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # You can use this operation to use default (username and clientID) attribute or custom attribute
      # mappings.

      def set_principal_tag_attribute_map(
        identity_pool_id : String,
        identity_provider_name : String,
        principal_tags : Hash(String, String)? = nil,
        use_defaults : Bool? = nil
      ) : Types::SetPrincipalTagAttributeMapResponse

        input = Types::SetPrincipalTagAttributeMapInput.new(identity_pool_id: identity_pool_id, identity_provider_name: identity_provider_name, principal_tags: principal_tags, use_defaults: use_defaults)
        set_principal_tag_attribute_map(input)
      end

      def set_principal_tag_attribute_map(input : Types::SetPrincipalTagAttributeMapInput) : Types::SetPrincipalTagAttributeMapResponse
        request = Protocol::JsonRpc.build_request(Model::SET_PRINCIPAL_TAG_ATTRIBUTE_MAP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SetPrincipalTagAttributeMapResponse, "SetPrincipalTagAttributeMap")
      end

      # Assigns a set of tags to the specified Amazon Cognito identity pool. A tag is a label that you can
      # use to categorize and manage identity pools in different ways, such as by purpose, owner,
      # environment, or other criteria. Each tag consists of a key and value, both of which you define. A
      # key is a general category for more specific values. For example, if you have two versions of an
      # identity pool, one for testing and another for production, you might assign an Environment tag key
      # to both identity pools. The value of this key might be Test for one identity pool and Production for
      # the other. Tags are useful for cost tracking and access control. You can activate your tags so that
      # they appear on the Billing and Cost Management console, where you can track the costs associated
      # with your identity pools. In an IAM policy, you can constrain permissions for identity pools based
      # on specific tags or tag values. You can use this action up to 5 times per second, per account. An
      # identity pool can have as many as 50 tags.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceResponse

        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Unlinks a DeveloperUserIdentifier from an existing identity. Unlinked developer users will be
      # considered new identities next time they are seen. If, for a given Cognito identity, you remove all
      # federated identities as well as the developer user identifier, the Cognito identity becomes
      # inaccessible. You must use Amazon Web Services developer credentials to call this operation.

      def unlink_developer_identity(
        developer_provider_name : String,
        developer_user_identifier : String,
        identity_id : String,
        identity_pool_id : String
      ) : Nil

        input = Types::UnlinkDeveloperIdentityInput.new(developer_provider_name: developer_provider_name, developer_user_identifier: developer_user_identifier, identity_id: identity_id, identity_pool_id: identity_pool_id)
        unlink_developer_identity(input)
      end

      def unlink_developer_identity(input : Types::UnlinkDeveloperIdentityInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNLINK_DEVELOPER_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Unlinks a federated identity from an existing account. Unlinked logins will be considered new
      # identities next time they are seen. Removing the last linked login will make this identity
      # inaccessible. This is a public API. You do not need any credentials to call this API.

      def unlink_identity(
        identity_id : String,
        logins : Hash(String, String),
        logins_to_remove : Array(String)
      ) : Nil

        input = Types::UnlinkIdentityInput.new(identity_id: identity_id, logins: logins, logins_to_remove: logins_to_remove)
        unlink_identity(input)
      end

      def unlink_identity(input : Types::UnlinkIdentityInput) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNLINK_IDENTITY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the specified tags from the specified Amazon Cognito identity pool. You can use this action
      # up to 5 times per second, per account

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates the configuration of an identity pool. If you don't provide a value for a parameter, Amazon
      # Cognito sets it to its default value. You must use Amazon Web Services developer credentials to call
      # this operation.

      def update_identity_pool(
        allow_unauthenticated_identities : Bool,
        identity_pool_id : String,
        identity_pool_name : String,
        allow_classic_flow : Bool? = nil,
        cognito_identity_providers : Array(Types::CognitoIdentityProvider)? = nil,
        developer_provider_name : String? = nil,
        identity_pool_tags : Hash(String, String)? = nil,
        open_id_connect_provider_ar_ns : Array(String)? = nil,
        saml_provider_ar_ns : Array(String)? = nil,
        supported_login_providers : Hash(String, String)? = nil
      ) : Types::IdentityPool

        input = Types::IdentityPool.new(allow_unauthenticated_identities: allow_unauthenticated_identities, identity_pool_id: identity_pool_id, identity_pool_name: identity_pool_name, allow_classic_flow: allow_classic_flow, cognito_identity_providers: cognito_identity_providers, developer_provider_name: developer_provider_name, identity_pool_tags: identity_pool_tags, open_id_connect_provider_ar_ns: open_id_connect_provider_ar_ns, saml_provider_ar_ns: saml_provider_ar_ns, supported_login_providers: supported_login_providers)
        update_identity_pool(input)
      end

      def update_identity_pool(input : Types::IdentityPool) : Types::IdentityPool
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IDENTITY_POOL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IdentityPool, "UpdateIdentityPool")
      end
    end
  end
end
