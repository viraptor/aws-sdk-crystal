module AwsSdk
  module VerifiedPermissions
    class Client

      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String
      getter credentials : AwsSdk::Runtime::Credentials
      getter transport : AwsSdk::Runtime::Transport
      getter runtime : AwsSdk::Runtime::Client

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        credentials : AwsSdk::Runtime::Credentials? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil,
        transport : AwsSdk::Runtime::Transport = AwsSdk::Runtime::HttpTransport.new
      )
        @transport = transport
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile, @transport)
        @credentials = credentials || AwsSdk::Runtime::Defaults.resolve_credentials(profile, @transport)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
        @runtime = AwsSdk::Runtime::Client.new(@endpoint, @region, Model::SIGNING_NAME, @credentials, @transport, @endpoint_headers)
      end

      # Retrieves information about a group (batch) of policies. The BatchGetPolicy operation doesn't have
      # its own IAM permission. To authorize this operation for Amazon Web Services principals, include the
      # permission verifiedpermissions:GetPolicy in their IAM policies.

      def batch_get_policy(
        requests : Array(Types::BatchGetPolicyInputItem)
      ) : Types::BatchGetPolicyOutput

        input = Types::BatchGetPolicyInput.new(requests: requests)
        batch_get_policy(input)
      end

      def batch_get_policy(input : Types::BatchGetPolicyInput) : Types::BatchGetPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetPolicyOutput, "BatchGetPolicy")
      end

      # Makes a series of decisions about multiple authorization requests for one principal or resource.
      # Each request contains the equivalent content of an IsAuthorized request: principal, action,
      # resource, and context. Either the principal or the resource parameter must be identical across all
      # requests. For example, Verified Permissions won't evaluate a pair of requests where bob views photo1
      # and alice views photo2 . Authorization of bob to view photo1 and photo2 , or bob and alice to view
      # photo1 , are valid batches. The request is evaluated against all policies in the specified policy
      # store that match the entities that you declare. The result of the decisions is a series of Allow or
      # Deny responses, along with the IDs of the policies that produced each decision. The entities of a
      # BatchIsAuthorized API request can contain up to 100 principals and up to 100 resources. The requests
      # of a BatchIsAuthorized API request can contain up to 30 requests. The BatchIsAuthorized operation
      # doesn't have its own IAM permission. To authorize this operation for Amazon Web Services principals,
      # include the permission verifiedpermissions:IsAuthorized in their IAM policies.

      def batch_is_authorized(
        policy_store_id : String,
        requests : Array(Types::BatchIsAuthorizedInputItem),
        entities : Types::EntitiesDefinition? = nil
      ) : Types::BatchIsAuthorizedOutput

        input = Types::BatchIsAuthorizedInput.new(policy_store_id: policy_store_id, requests: requests, entities: entities)
        batch_is_authorized(input)
      end

      def batch_is_authorized(input : Types::BatchIsAuthorizedInput) : Types::BatchIsAuthorizedOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_IS_AUTHORIZED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchIsAuthorizedOutput, "BatchIsAuthorized")
      end

      # Makes a series of decisions about multiple authorization requests for one token. The principal in
      # this request comes from an external identity source in the form of an identity or access token,
      # formatted as a JSON web token (JWT) . The information in the parameters can also define additional
      # context that Verified Permissions can include in the evaluations. The request is evaluated against
      # all policies in the specified policy store that match the entities that you provide in the entities
      # declaration and in the token. The result of the decisions is a series of Allow or Deny responses,
      # along with the IDs of the policies that produced each decision. The entities of a
      # BatchIsAuthorizedWithToken API request can contain up to 100 resources and up to 99 user groups. The
      # requests of a BatchIsAuthorizedWithToken API request can contain up to 30 requests. The
      # BatchIsAuthorizedWithToken operation doesn't have its own IAM permission. To authorize this
      # operation for Amazon Web Services principals, include the permission
      # verifiedpermissions:IsAuthorizedWithToken in their IAM policies.

      def batch_is_authorized_with_token(
        policy_store_id : String,
        requests : Array(Types::BatchIsAuthorizedWithTokenInputItem),
        access_token : String? = nil,
        entities : Types::EntitiesDefinition? = nil,
        identity_token : String? = nil
      ) : Types::BatchIsAuthorizedWithTokenOutput

        input = Types::BatchIsAuthorizedWithTokenInput.new(policy_store_id: policy_store_id, requests: requests, access_token: access_token, entities: entities, identity_token: identity_token)
        batch_is_authorized_with_token(input)
      end

      def batch_is_authorized_with_token(input : Types::BatchIsAuthorizedWithTokenInput) : Types::BatchIsAuthorizedWithTokenOutput
        request = Protocol::JsonRpc.build_request(Model::BATCH_IS_AUTHORIZED_WITH_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchIsAuthorizedWithTokenOutput, "BatchIsAuthorizedWithToken")
      end

      # Adds an identity source to a policy store–an Amazon Cognito user pool or OpenID Connect (OIDC)
      # identity provider (IdP). After you create an identity source, you can use the identities provided by
      # the IdP as proxies for the principal in authorization queries that use the IsAuthorizedWithToken or
      # BatchIsAuthorizedWithToken API operations. These identities take the form of tokens that contain
      # claims about the user, such as IDs, attributes and group memberships. Identity sources provide
      # identity (ID) tokens and access tokens. Verified Permissions derives information about your user and
      # session from token claims. Access tokens provide action context to your policies, and ID tokens
      # provide principal Attributes . Tokens from an identity source user continue to be usable until they
      # expire. Token revocation and resource deletion have no effect on the validity of a token in your
      # policy store To reference a user from this identity source in your Cedar policies, refer to the
      # following syntax examples. Amazon Cognito user pool: Namespace::[Entity type]::[User pool ID]|[user
      # principal attribute] , for example
      # MyCorp::User::us-east-1_EXAMPLE|a1b2c3d4-5678-90ab-cdef-EXAMPLE11111 . OpenID Connect (OIDC)
      # provider: Namespace::[Entity type]::[entityIdPrefix]|[user principal attribute] , for example
      # MyCorp::User::MyOIDCProvider|a1b2c3d4-5678-90ab-cdef-EXAMPLE22222 . Verified Permissions is
      # eventually consistent . It can take a few seconds for a new or changed element to propagate through
      # the service and be visible in the results of other Verified Permissions operations.

      def create_identity_source(
        configuration : Types::Configuration,
        policy_store_id : String,
        client_token : String? = nil,
        principal_entity_type : String? = nil
      ) : Types::CreateIdentitySourceOutput

        input = Types::CreateIdentitySourceInput.new(configuration: configuration, policy_store_id: policy_store_id, client_token: client_token, principal_entity_type: principal_entity_type)
        create_identity_source(input)
      end

      def create_identity_source(input : Types::CreateIdentitySourceInput) : Types::CreateIdentitySourceOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_IDENTITY_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIdentitySourceOutput, "CreateIdentitySource")
      end

      # Creates a Cedar policy and saves it in the specified policy store. You can create either a static
      # policy or a policy linked to a policy template. To create a static policy, provide the Cedar policy
      # text in the StaticPolicy section of the PolicyDefinition . To create a policy that is dynamically
      # linked to a policy template, specify the policy template ID and the principal and resource to
      # associate with this policy in the templateLinked section of the PolicyDefinition . If the policy
      # template is ever updated, any policies linked to the policy template automatically use the updated
      # template. Creating a policy causes it to be validated against the schema in the policy store. If the
      # policy doesn't pass validation, the operation fails and the policy isn't stored. Verified
      # Permissions is eventually consistent . It can take a few seconds for a new or changed element to
      # propagate through the service and be visible in the results of other Verified Permissions
      # operations.

      def create_policy(
        definition : Types::PolicyDefinition,
        policy_store_id : String,
        client_token : String? = nil
      ) : Types::CreatePolicyOutput

        input = Types::CreatePolicyInput.new(definition: definition, policy_store_id: policy_store_id, client_token: client_token)
        create_policy(input)
      end

      def create_policy(input : Types::CreatePolicyInput) : Types::CreatePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePolicyOutput, "CreatePolicy")
      end

      # Creates a policy store. A policy store is a container for policy resources. Although Cedar supports
      # multiple namespaces , Verified Permissions currently supports only one namespace per policy store.
      # Verified Permissions is eventually consistent . It can take a few seconds for a new or changed
      # element to propagate through the service and be visible in the results of other Verified Permissions
      # operations.

      def create_policy_store(
        validation_settings : Types::ValidationSettings,
        client_token : String? = nil,
        deletion_protection : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreatePolicyStoreOutput

        input = Types::CreatePolicyStoreInput.new(validation_settings: validation_settings, client_token: client_token, deletion_protection: deletion_protection, description: description, tags: tags)
        create_policy_store(input)
      end

      def create_policy_store(input : Types::CreatePolicyStoreInput) : Types::CreatePolicyStoreOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_POLICY_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePolicyStoreOutput, "CreatePolicyStore")
      end

      # Creates a policy template. A template can use placeholders for the principal and resource. A
      # template must be instantiated into a policy by associating it with specific principals and resources
      # to use for the placeholders. That instantiated policy can then be considered in authorization
      # decisions. The instantiated policy works identically to any other policy, except that it is
      # dynamically linked to the template. If the template changes, then any policies that are linked to
      # that template are immediately updated as well. Verified Permissions is eventually consistent . It
      # can take a few seconds for a new or changed element to propagate through the service and be visible
      # in the results of other Verified Permissions operations.

      def create_policy_template(
        policy_store_id : String,
        statement : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::CreatePolicyTemplateOutput

        input = Types::CreatePolicyTemplateInput.new(policy_store_id: policy_store_id, statement: statement, client_token: client_token, description: description)
        create_policy_template(input)
      end

      def create_policy_template(input : Types::CreatePolicyTemplateInput) : Types::CreatePolicyTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_POLICY_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreatePolicyTemplateOutput, "CreatePolicyTemplate")
      end

      # Deletes an identity source that references an identity provider (IdP) such as Amazon Cognito. After
      # you delete the identity source, you can no longer use tokens for identities from that identity
      # source to represent principals in authorization queries made using IsAuthorizedWithToken .
      # operations.

      def delete_identity_source(
        identity_source_id : String,
        policy_store_id : String
      ) : Types::DeleteIdentitySourceOutput

        input = Types::DeleteIdentitySourceInput.new(identity_source_id: identity_source_id, policy_store_id: policy_store_id)
        delete_identity_source(input)
      end

      def delete_identity_source(input : Types::DeleteIdentitySourceInput) : Types::DeleteIdentitySourceOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_IDENTITY_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIdentitySourceOutput, "DeleteIdentitySource")
      end

      # Deletes the specified policy from the policy store. This operation is idempotent; if you specify a
      # policy that doesn't exist, the request response returns a successful HTTP 200 status code.

      def delete_policy(
        policy_id : String,
        policy_store_id : String
      ) : Types::DeletePolicyOutput

        input = Types::DeletePolicyInput.new(policy_id: policy_id, policy_store_id: policy_store_id)
        delete_policy(input)
      end

      def delete_policy(input : Types::DeletePolicyInput) : Types::DeletePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePolicyOutput, "DeletePolicy")
      end

      # Deletes the specified policy store. This operation is idempotent. If you specify a policy store that
      # does not exist, the request response will still return a successful HTTP 200 status code.

      def delete_policy_store(
        policy_store_id : String
      ) : Types::DeletePolicyStoreOutput

        input = Types::DeletePolicyStoreInput.new(policy_store_id: policy_store_id)
        delete_policy_store(input)
      end

      def delete_policy_store(input : Types::DeletePolicyStoreInput) : Types::DeletePolicyStoreOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_POLICY_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePolicyStoreOutput, "DeletePolicyStore")
      end

      # Deletes the specified policy template from the policy store. This operation also deletes any
      # policies that were created from the specified policy template. Those policies are immediately
      # removed from all future API responses, and are asynchronously deleted from the policy store.

      def delete_policy_template(
        policy_store_id : String,
        policy_template_id : String
      ) : Types::DeletePolicyTemplateOutput

        input = Types::DeletePolicyTemplateInput.new(policy_store_id: policy_store_id, policy_template_id: policy_template_id)
        delete_policy_template(input)
      end

      def delete_policy_template(input : Types::DeletePolicyTemplateInput) : Types::DeletePolicyTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_POLICY_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeletePolicyTemplateOutput, "DeletePolicyTemplate")
      end

      # Retrieves the details about the specified identity source.

      def get_identity_source(
        identity_source_id : String,
        policy_store_id : String
      ) : Types::GetIdentitySourceOutput

        input = Types::GetIdentitySourceInput.new(identity_source_id: identity_source_id, policy_store_id: policy_store_id)
        get_identity_source(input)
      end

      def get_identity_source(input : Types::GetIdentitySourceInput) : Types::GetIdentitySourceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_IDENTITY_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIdentitySourceOutput, "GetIdentitySource")
      end

      # Retrieves information about the specified policy.

      def get_policy(
        policy_id : String,
        policy_store_id : String
      ) : Types::GetPolicyOutput

        input = Types::GetPolicyInput.new(policy_id: policy_id, policy_store_id: policy_store_id)
        get_policy(input)
      end

      def get_policy(input : Types::GetPolicyInput) : Types::GetPolicyOutput
        request = Protocol::JsonRpc.build_request(Model::GET_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPolicyOutput, "GetPolicy")
      end

      # Retrieves details about a policy store.

      def get_policy_store(
        policy_store_id : String,
        tags : Bool? = nil
      ) : Types::GetPolicyStoreOutput

        input = Types::GetPolicyStoreInput.new(policy_store_id: policy_store_id, tags: tags)
        get_policy_store(input)
      end

      def get_policy_store(input : Types::GetPolicyStoreInput) : Types::GetPolicyStoreOutput
        request = Protocol::JsonRpc.build_request(Model::GET_POLICY_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPolicyStoreOutput, "GetPolicyStore")
      end

      # Retrieve the details for the specified policy template in the specified policy store.

      def get_policy_template(
        policy_store_id : String,
        policy_template_id : String
      ) : Types::GetPolicyTemplateOutput

        input = Types::GetPolicyTemplateInput.new(policy_store_id: policy_store_id, policy_template_id: policy_template_id)
        get_policy_template(input)
      end

      def get_policy_template(input : Types::GetPolicyTemplateInput) : Types::GetPolicyTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::GET_POLICY_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPolicyTemplateOutput, "GetPolicyTemplate")
      end

      # Retrieve the details for the specified schema in the specified policy store.

      def get_schema(
        policy_store_id : String
      ) : Types::GetSchemaOutput

        input = Types::GetSchemaInput.new(policy_store_id: policy_store_id)
        get_schema(input)
      end

      def get_schema(input : Types::GetSchemaInput) : Types::GetSchemaOutput
        request = Protocol::JsonRpc.build_request(Model::GET_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSchemaOutput, "GetSchema")
      end

      # Makes an authorization decision about a service request described in the parameters. The information
      # in the parameters can also define additional context that Verified Permissions can include in the
      # evaluation. The request is evaluated against all matching policies in the specified policy store.
      # The result of the decision is either Allow or Deny , along with a list of the policies that resulted
      # in the decision.

      def is_authorized(
        policy_store_id : String,
        action : Types::ActionIdentifier? = nil,
        context : Types::ContextDefinition? = nil,
        entities : Types::EntitiesDefinition? = nil,
        principal : Types::EntityIdentifier? = nil,
        resource : Types::EntityIdentifier? = nil
      ) : Types::IsAuthorizedOutput

        input = Types::IsAuthorizedInput.new(policy_store_id: policy_store_id, action: action, context: context, entities: entities, principal: principal, resource: resource)
        is_authorized(input)
      end

      def is_authorized(input : Types::IsAuthorizedInput) : Types::IsAuthorizedOutput
        request = Protocol::JsonRpc.build_request(Model::IS_AUTHORIZED, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IsAuthorizedOutput, "IsAuthorized")
      end

      # Makes an authorization decision about a service request described in the parameters. The principal
      # in this request comes from an external identity source in the form of an identity token formatted as
      # a JSON web token (JWT) . The information in the parameters can also define additional context that
      # Verified Permissions can include in the evaluation. The request is evaluated against all matching
      # policies in the specified policy store. The result of the decision is either Allow or Deny , along
      # with a list of the policies that resulted in the decision. Verified Permissions validates each token
      # that is specified in a request by checking its expiration date and its signature. Tokens from an
      # identity source user continue to be usable until they expire. Token revocation and resource deletion
      # have no effect on the validity of a token in your policy store

      def is_authorized_with_token(
        policy_store_id : String,
        access_token : String? = nil,
        action : Types::ActionIdentifier? = nil,
        context : Types::ContextDefinition? = nil,
        entities : Types::EntitiesDefinition? = nil,
        identity_token : String? = nil,
        resource : Types::EntityIdentifier? = nil
      ) : Types::IsAuthorizedWithTokenOutput

        input = Types::IsAuthorizedWithTokenInput.new(policy_store_id: policy_store_id, access_token: access_token, action: action, context: context, entities: entities, identity_token: identity_token, resource: resource)
        is_authorized_with_token(input)
      end

      def is_authorized_with_token(input : Types::IsAuthorizedWithTokenInput) : Types::IsAuthorizedWithTokenOutput
        request = Protocol::JsonRpc.build_request(Model::IS_AUTHORIZED_WITH_TOKEN, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IsAuthorizedWithTokenOutput, "IsAuthorizedWithToken")
      end

      # Returns a paginated list of all of the identity sources defined in the specified policy store.

      def list_identity_sources(
        policy_store_id : String,
        filters : Array(Types::IdentitySourceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListIdentitySourcesOutput

        input = Types::ListIdentitySourcesInput.new(policy_store_id: policy_store_id, filters: filters, max_results: max_results, next_token: next_token)
        list_identity_sources(input)
      end

      def list_identity_sources(input : Types::ListIdentitySourcesInput) : Types::ListIdentitySourcesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_IDENTITY_SOURCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListIdentitySourcesOutput, "ListIdentitySources")
      end

      # Returns a paginated list of all policies stored in the specified policy store.

      def list_policies(
        policy_store_id : String,
        filter : Types::PolicyFilter? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPoliciesOutput

        input = Types::ListPoliciesInput.new(policy_store_id: policy_store_id, filter: filter, max_results: max_results, next_token: next_token)
        list_policies(input)
      end

      def list_policies(input : Types::ListPoliciesInput) : Types::ListPoliciesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPoliciesOutput, "ListPolicies")
      end

      # Returns a paginated list of all policy stores in the calling Amazon Web Services account.

      def list_policy_stores(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPolicyStoresOutput

        input = Types::ListPolicyStoresInput.new(max_results: max_results, next_token: next_token)
        list_policy_stores(input)
      end

      def list_policy_stores(input : Types::ListPolicyStoresInput) : Types::ListPolicyStoresOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_POLICY_STORES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPolicyStoresOutput, "ListPolicyStores")
      end

      # Returns a paginated list of all policy templates in the specified policy store.

      def list_policy_templates(
        policy_store_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListPolicyTemplatesOutput

        input = Types::ListPolicyTemplatesInput.new(policy_store_id: policy_store_id, max_results: max_results, next_token: next_token)
        list_policy_templates(input)
      end

      def list_policy_templates(input : Types::ListPolicyTemplatesInput) : Types::ListPolicyTemplatesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_POLICY_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListPolicyTemplatesOutput, "ListPolicyTemplates")
      end

      # Returns the tags associated with the specified Amazon Verified Permissions resource. In Verified
      # Permissions, policy stores can be tagged.

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceOutput

        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Types::ListTagsForResourceOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceOutput, "ListTagsForResource")
      end

      # Creates or updates the policy schema in the specified policy store. The schema is used to validate
      # any Cedar policies and policy templates submitted to the policy store. Any changes to the schema
      # validate only policies and templates submitted after the schema change. Existing policies and
      # templates are not re-evaluated against the changed schema. If you later update a policy, then it is
      # evaluated against the new schema at that time. Verified Permissions is eventually consistent . It
      # can take a few seconds for a new or changed element to propagate through the service and be visible
      # in the results of other Verified Permissions operations.

      def put_schema(
        definition : Types::SchemaDefinition,
        policy_store_id : String
      ) : Types::PutSchemaOutput

        input = Types::PutSchemaInput.new(definition: definition, policy_store_id: policy_store_id)
        put_schema(input)
      end

      def put_schema(input : Types::PutSchemaInput) : Types::PutSchemaOutput
        request = Protocol::JsonRpc.build_request(Model::PUT_SCHEMA, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PutSchemaOutput, "PutSchema")
      end

      # Assigns one or more tags (key-value pairs) to the specified Amazon Verified Permissions resource.
      # Tags can help you organize and categorize your resources. You can also use them to scope user
      # permissions by granting a user permission to access or change only resources with certain tag
      # values. In Verified Permissions, policy stores can be tagged. Tags don't have any semantic meaning
      # to Amazon Web Services and are interpreted strictly as strings of characters. You can use the
      # TagResource action with a resource that already has tags. If you specify a new tag key, this tag is
      # appended to the list of tags associated with the resource. If you specify a tag key that is already
      # associated with the resource, the new tag value that you specify replaces the previous value for
      # that tag. You can associate as many as 50 tags with a resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Types::TagResourceOutput

        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Types::TagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceOutput, "TagResource")
      end

      # Removes one or more tags from the specified Amazon Verified Permissions resource. In Verified
      # Permissions, policy stores can be tagged.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceOutput

        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Types::UntagResourceOutput
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceOutput, "UntagResource")
      end

      # Updates the specified identity source to use a new identity provider (IdP), or to change the mapping
      # of identities from the IdP to a different principal entity type. Verified Permissions is eventually
      # consistent . It can take a few seconds for a new or changed element to propagate through the service
      # and be visible in the results of other Verified Permissions operations.

      def update_identity_source(
        identity_source_id : String,
        policy_store_id : String,
        update_configuration : Types::UpdateConfiguration,
        principal_entity_type : String? = nil
      ) : Types::UpdateIdentitySourceOutput

        input = Types::UpdateIdentitySourceInput.new(identity_source_id: identity_source_id, policy_store_id: policy_store_id, update_configuration: update_configuration, principal_entity_type: principal_entity_type)
        update_identity_source(input)
      end

      def update_identity_source(input : Types::UpdateIdentitySourceInput) : Types::UpdateIdentitySourceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_IDENTITY_SOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIdentitySourceOutput, "UpdateIdentitySource")
      end

      # Modifies a Cedar static policy in the specified policy store. You can change only certain elements
      # of the UpdatePolicyDefinition parameter. You can directly update only static policies. To change a
      # template-linked policy, you must update the template instead, using UpdatePolicyTemplate . If policy
      # validation is enabled in the policy store, then updating a static policy causes Verified Permissions
      # to validate the policy against the schema in the policy store. If the updated static policy doesn't
      # pass validation, the operation fails and the update isn't stored. When you edit a static policy, you
      # can change only certain elements of a static policy: The action referenced by the policy. A
      # condition clause, such as when and unless. You can't change these elements of a static policy:
      # Changing a policy from a static policy to a template-linked policy. Changing the effect of a static
      # policy from permit or forbid. The principal referenced by a static policy. The resource referenced
      # by a static policy. To update a template-linked policy, you must update the template instead.
      # Verified Permissions is eventually consistent . It can take a few seconds for a new or changed
      # element to propagate through the service and be visible in the results of other Verified Permissions
      # operations.

      def update_policy(
        definition : Types::UpdatePolicyDefinition,
        policy_id : String,
        policy_store_id : String
      ) : Types::UpdatePolicyOutput

        input = Types::UpdatePolicyInput.new(definition: definition, policy_id: policy_id, policy_store_id: policy_store_id)
        update_policy(input)
      end

      def update_policy(input : Types::UpdatePolicyInput) : Types::UpdatePolicyOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePolicyOutput, "UpdatePolicy")
      end

      # Modifies the validation setting for a policy store. Verified Permissions is eventually consistent .
      # It can take a few seconds for a new or changed element to propagate through the service and be
      # visible in the results of other Verified Permissions operations.

      def update_policy_store(
        policy_store_id : String,
        validation_settings : Types::ValidationSettings,
        deletion_protection : String? = nil,
        description : String? = nil
      ) : Types::UpdatePolicyStoreOutput

        input = Types::UpdatePolicyStoreInput.new(policy_store_id: policy_store_id, validation_settings: validation_settings, deletion_protection: deletion_protection, description: description)
        update_policy_store(input)
      end

      def update_policy_store(input : Types::UpdatePolicyStoreInput) : Types::UpdatePolicyStoreOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_POLICY_STORE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePolicyStoreOutput, "UpdatePolicyStore")
      end

      # Updates the specified policy template. You can update only the description and the some elements of
      # the policyBody . Changes you make to the policy template content are immediately (within the
      # constraints of eventual consistency) reflected in authorization decisions that involve all
      # template-linked policies instantiated from this template. Verified Permissions is eventually
      # consistent . It can take a few seconds for a new or changed element to propagate through the service
      # and be visible in the results of other Verified Permissions operations.

      def update_policy_template(
        policy_store_id : String,
        policy_template_id : String,
        statement : String,
        description : String? = nil
      ) : Types::UpdatePolicyTemplateOutput

        input = Types::UpdatePolicyTemplateInput.new(policy_store_id: policy_store_id, policy_template_id: policy_template_id, statement: statement, description: description)
        update_policy_template(input)
      end

      def update_policy_template(input : Types::UpdatePolicyTemplateInput) : Types::UpdatePolicyTemplateOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_POLICY_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdatePolicyTemplateOutput, "UpdatePolicyTemplate")
      end
    end
  end
end
