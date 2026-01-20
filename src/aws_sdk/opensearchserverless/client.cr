module AwsSdk
  module OpenSearchServerless
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

      # Returns attributes for one or more collections, including the collection endpoint, the OpenSearch
      # Dashboards endpoint, and FIPS-compliant endpoints. For more information, see Creating and managing
      # Amazon OpenSearch Serverless collections .

      def batch_get_collection(
        ids : Array(String)? = nil,
        names : Array(String)? = nil
      ) : Types::BatchGetCollectionResponse

        input = Types::BatchGetCollectionRequest.new(ids: ids, names: names)
        batch_get_collection(input)
      end

      def batch_get_collection(input : Types::BatchGetCollectionRequest) : Types::BatchGetCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetCollectionResponse, "BatchGetCollection")
      end

      # Returns attributes for one or more collection groups, including capacity limits and the number of
      # collections in each group. For more information, see Creating and managing Amazon OpenSearch
      # Serverless collections .

      def batch_get_collection_group(
        ids : Array(String)? = nil,
        names : Array(String)? = nil
      ) : Types::BatchGetCollectionGroupResponse

        input = Types::BatchGetCollectionGroupRequest.new(ids: ids, names: names)
        batch_get_collection_group(input)
      end

      def batch_get_collection_group(input : Types::BatchGetCollectionGroupRequest) : Types::BatchGetCollectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_COLLECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetCollectionGroupResponse, "BatchGetCollectionGroup")
      end

      # Returns a list of successful and failed retrievals for the OpenSearch Serverless indexes. For more
      # information, see Viewing data lifecycle policies .

      def batch_get_effective_lifecycle_policy(
        resource_identifiers : Array(Types::LifecyclePolicyResourceIdentifier)
      ) : Types::BatchGetEffectiveLifecyclePolicyResponse

        input = Types::BatchGetEffectiveLifecyclePolicyRequest.new(resource_identifiers: resource_identifiers)
        batch_get_effective_lifecycle_policy(input)
      end

      def batch_get_effective_lifecycle_policy(input : Types::BatchGetEffectiveLifecyclePolicyRequest) : Types::BatchGetEffectiveLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_EFFECTIVE_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetEffectiveLifecyclePolicyResponse, "BatchGetEffectiveLifecyclePolicy")
      end

      # Returns one or more configured OpenSearch Serverless lifecycle policies. For more information, see
      # Viewing data lifecycle policies .

      def batch_get_lifecycle_policy(
        identifiers : Array(Types::LifecyclePolicyIdentifier)
      ) : Types::BatchGetLifecyclePolicyResponse

        input = Types::BatchGetLifecyclePolicyRequest.new(identifiers: identifiers)
        batch_get_lifecycle_policy(input)
      end

      def batch_get_lifecycle_policy(input : Types::BatchGetLifecyclePolicyRequest) : Types::BatchGetLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetLifecyclePolicyResponse, "BatchGetLifecyclePolicy")
      end

      # Returns attributes for one or more VPC endpoints associated with the current account. For more
      # information, see Access Amazon OpenSearch Serverless using an interface endpoint .

      def batch_get_vpc_endpoint(
        ids : Array(String)
      ) : Types::BatchGetVpcEndpointResponse

        input = Types::BatchGetVpcEndpointRequest.new(ids: ids)
        batch_get_vpc_endpoint(input)
      end

      def batch_get_vpc_endpoint(input : Types::BatchGetVpcEndpointRequest) : Types::BatchGetVpcEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_GET_VPC_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchGetVpcEndpointResponse, "BatchGetVpcEndpoint")
      end

      # Creates a data access policy for OpenSearch Serverless. Access policies limit access to collections
      # and the resources within them, and allow a user to access that data irrespective of the access
      # mechanism or network source. For more information, see Data access control for Amazon OpenSearch
      # Serverless .

      def create_access_policy(
        name : String,
        policy : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::CreateAccessPolicyResponse

        input = Types::CreateAccessPolicyRequest.new(name: name, policy: policy, type: type, client_token: client_token, description: description)
        create_access_policy(input)
      end

      def create_access_policy(input : Types::CreateAccessPolicyRequest) : Types::CreateAccessPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACCESS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateAccessPolicyResponse, "CreateAccessPolicy")
      end

      # Creates a new OpenSearch Serverless collection. For more information, see Creating and managing
      # Amazon OpenSearch Serverless collections .

      def create_collection(
        name : String,
        client_token : String? = nil,
        collection_group_name : String? = nil,
        description : String? = nil,
        encryption_config : Types::EncryptionConfig? = nil,
        standby_replicas : String? = nil,
        tags : Array(Types::Tag)? = nil,
        type : String? = nil,
        vector_options : Types::VectorOptions? = nil
      ) : Types::CreateCollectionResponse

        input = Types::CreateCollectionRequest.new(name: name, client_token: client_token, collection_group_name: collection_group_name, description: description, encryption_config: encryption_config, standby_replicas: standby_replicas, tags: tags, type: type, vector_options: vector_options)
        create_collection(input)
      end

      def create_collection(input : Types::CreateCollectionRequest) : Types::CreateCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCollectionResponse, "CreateCollection")
      end

      # Creates a collection group within OpenSearch Serverless. Collection groups let you manage OpenSearch
      # Compute Units (OCUs) at a group level, with multiple collections sharing the group's capacity
      # limits. For more information, see Managing collection groups .

      def create_collection_group(
        name : String,
        standby_replicas : String,
        capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
        client_token : String? = nil,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateCollectionGroupResponse

        input = Types::CreateCollectionGroupRequest.new(name: name, standby_replicas: standby_replicas, capacity_limits: capacity_limits, client_token: client_token, description: description, tags: tags)
        create_collection_group(input)
      end

      def create_collection_group(input : Types::CreateCollectionGroupRequest) : Types::CreateCollectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COLLECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateCollectionGroupResponse, "CreateCollectionGroup")
      end

      # Creates an index within an OpenSearch Serverless collection. Unlike other OpenSearch indexes,
      # indexes created by this API are automatically configured to conduct automatic semantic enrichment
      # ingestion and search. For more information, see About automatic semantic enrichment in the
      # OpenSearch User Guide .

      def create_index(
        id : String,
        index_name : String,
        index_schema : Types::IndexSchema? = nil
      ) : Types::CreateIndexResponse

        input = Types::CreateIndexRequest.new(id: id, index_name: index_name, index_schema: index_schema)
        create_index(input)
      end

      def create_index(input : Types::CreateIndexRequest) : Types::CreateIndexResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateIndexResponse, "CreateIndex")
      end

      # Creates a lifecyle policy to be applied to OpenSearch Serverless indexes. Lifecycle policies define
      # the number of days or hours to retain the data on an OpenSearch Serverless index. For more
      # information, see Creating data lifecycle policies .

      def create_lifecycle_policy(
        name : String,
        policy : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::CreateLifecyclePolicyResponse

        input = Types::CreateLifecyclePolicyRequest.new(name: name, policy: policy, type: type, client_token: client_token, description: description)
        create_lifecycle_policy(input)
      end

      def create_lifecycle_policy(input : Types::CreateLifecyclePolicyRequest) : Types::CreateLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateLifecyclePolicyResponse, "CreateLifecyclePolicy")
      end

      # Specifies a security configuration for OpenSearch Serverless. For more information, see SAML
      # authentication for Amazon OpenSearch Serverless .

      def create_security_config(
        name : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil,
        iam_federation_options : Types::IamFederationConfigOptions? = nil,
        iam_identity_center_options : Types::CreateIamIdentityCenterConfigOptions? = nil,
        saml_options : Types::SamlConfigOptions? = nil
      ) : Types::CreateSecurityConfigResponse

        input = Types::CreateSecurityConfigRequest.new(name: name, type: type, client_token: client_token, description: description, iam_federation_options: iam_federation_options, iam_identity_center_options: iam_identity_center_options, saml_options: saml_options)
        create_security_config(input)
      end

      def create_security_config(input : Types::CreateSecurityConfigRequest) : Types::CreateSecurityConfigResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SECURITY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSecurityConfigResponse, "CreateSecurityConfig")
      end

      # Creates a security policy to be used by one or more OpenSearch Serverless collections. Security
      # policies provide access to a collection and its OpenSearch Dashboards endpoint from public networks
      # or specific VPC endpoints. They also allow you to secure a collection with a KMS encryption key. For
      # more information, see Network access for Amazon OpenSearch Serverless and Encryption at rest for
      # Amazon OpenSearch Serverless .

      def create_security_policy(
        name : String,
        policy : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::CreateSecurityPolicyResponse

        input = Types::CreateSecurityPolicyRequest.new(name: name, policy: policy, type: type, client_token: client_token, description: description)
        create_security_policy(input)
      end

      def create_security_policy(input : Types::CreateSecurityPolicyRequest) : Types::CreateSecurityPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SECURITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSecurityPolicyResponse, "CreateSecurityPolicy")
      end

      # Creates an OpenSearch Serverless-managed interface VPC endpoint. For more information, see Access
      # Amazon OpenSearch Serverless using an interface endpoint .

      def create_vpc_endpoint(
        name : String,
        subnet_ids : Array(String),
        vpc_id : String,
        client_token : String? = nil,
        security_group_ids : Array(String)? = nil
      ) : Types::CreateVpcEndpointResponse

        input = Types::CreateVpcEndpointRequest.new(name: name, subnet_ids: subnet_ids, vpc_id: vpc_id, client_token: client_token, security_group_ids: security_group_ids)
        create_vpc_endpoint(input)
      end

      def create_vpc_endpoint(input : Types::CreateVpcEndpointRequest) : Types::CreateVpcEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_VPC_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateVpcEndpointResponse, "CreateVpcEndpoint")
      end

      # Deletes an OpenSearch Serverless access policy. For more information, see Data access control for
      # Amazon OpenSearch Serverless .

      def delete_access_policy(
        name : String,
        type : String,
        client_token : String? = nil
      ) : Types::DeleteAccessPolicyResponse

        input = Types::DeleteAccessPolicyRequest.new(name: name, type: type, client_token: client_token)
        delete_access_policy(input)
      end

      def delete_access_policy(input : Types::DeleteAccessPolicyRequest) : Types::DeleteAccessPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACCESS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteAccessPolicyResponse, "DeleteAccessPolicy")
      end

      # Deletes an OpenSearch Serverless collection. For more information, see Creating and managing Amazon
      # OpenSearch Serverless collections .

      def delete_collection(
        id : String,
        client_token : String? = nil
      ) : Types::DeleteCollectionResponse

        input = Types::DeleteCollectionRequest.new(id: id, client_token: client_token)
        delete_collection(input)
      end

      def delete_collection(input : Types::DeleteCollectionRequest) : Types::DeleteCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCollectionResponse, "DeleteCollection")
      end

      # Deletes a collection group. You can only delete empty collection groups that contain no collections.
      # For more information, see Creating and managing Amazon OpenSearch Serverless collections .

      def delete_collection_group(
        id : String,
        client_token : String? = nil
      ) : Types::DeleteCollectionGroupResponse

        input = Types::DeleteCollectionGroupRequest.new(id: id, client_token: client_token)
        delete_collection_group(input)
      end

      def delete_collection_group(input : Types::DeleteCollectionGroupRequest) : Types::DeleteCollectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COLLECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteCollectionGroupResponse, "DeleteCollectionGroup")
      end

      # Deletes an index from an OpenSearch Serverless collection. Be aware that the index might be
      # configured to conduct automatic semantic enrichment ingestion and search. For more information, see
      # About automatic semantic enrichment .

      def delete_index(
        id : String,
        index_name : String
      ) : Types::DeleteIndexResponse

        input = Types::DeleteIndexRequest.new(id: id, index_name: index_name)
        delete_index(input)
      end

      def delete_index(input : Types::DeleteIndexRequest) : Types::DeleteIndexResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteIndexResponse, "DeleteIndex")
      end

      # Deletes an OpenSearch Serverless lifecycle policy. For more information, see Deleting data lifecycle
      # policies .

      def delete_lifecycle_policy(
        name : String,
        type : String,
        client_token : String? = nil
      ) : Types::DeleteLifecyclePolicyResponse

        input = Types::DeleteLifecyclePolicyRequest.new(name: name, type: type, client_token: client_token)
        delete_lifecycle_policy(input)
      end

      def delete_lifecycle_policy(input : Types::DeleteLifecyclePolicyRequest) : Types::DeleteLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteLifecyclePolicyResponse, "DeleteLifecyclePolicy")
      end

      # Deletes a security configuration for OpenSearch Serverless. For more information, see SAML
      # authentication for Amazon OpenSearch Serverless .

      def delete_security_config(
        id : String,
        client_token : String? = nil
      ) : Types::DeleteSecurityConfigResponse

        input = Types::DeleteSecurityConfigRequest.new(id: id, client_token: client_token)
        delete_security_config(input)
      end

      def delete_security_config(input : Types::DeleteSecurityConfigRequest) : Types::DeleteSecurityConfigResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SECURITY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSecurityConfigResponse, "DeleteSecurityConfig")
      end

      # Deletes an OpenSearch Serverless security policy.

      def delete_security_policy(
        name : String,
        type : String,
        client_token : String? = nil
      ) : Types::DeleteSecurityPolicyResponse

        input = Types::DeleteSecurityPolicyRequest.new(name: name, type: type, client_token: client_token)
        delete_security_policy(input)
      end

      def delete_security_policy(input : Types::DeleteSecurityPolicyRequest) : Types::DeleteSecurityPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SECURITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSecurityPolicyResponse, "DeleteSecurityPolicy")
      end

      # Deletes an OpenSearch Serverless-managed interface endpoint. For more information, see Access Amazon
      # OpenSearch Serverless using an interface endpoint .

      def delete_vpc_endpoint(
        id : String,
        client_token : String? = nil
      ) : Types::DeleteVpcEndpointResponse

        input = Types::DeleteVpcEndpointRequest.new(id: id, client_token: client_token)
        delete_vpc_endpoint(input)
      end

      def delete_vpc_endpoint(input : Types::DeleteVpcEndpointRequest) : Types::DeleteVpcEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_VPC_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteVpcEndpointResponse, "DeleteVpcEndpoint")
      end

      # Returns an OpenSearch Serverless access policy. For more information, see Data access control for
      # Amazon OpenSearch Serverless .

      def get_access_policy(
        name : String,
        type : String
      ) : Types::GetAccessPolicyResponse

        input = Types::GetAccessPolicyRequest.new(name: name, type: type)
        get_access_policy(input)
      end

      def get_access_policy(input : Types::GetAccessPolicyRequest) : Types::GetAccessPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCESS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccessPolicyResponse, "GetAccessPolicy")
      end

      # Returns account-level settings related to OpenSearch Serverless.

      def get_account_settings : Types::GetAccountSettingsResponse
        input = Types::GetAccountSettingsRequest.new
        get_account_settings(input)
      end

      def get_account_settings(input : Types::GetAccountSettingsRequest) : Types::GetAccountSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetAccountSettingsResponse, "GetAccountSettings")
      end

      # Retrieves information about an index in an OpenSearch Serverless collection, including its schema
      # definition. The index might be configured to conduct automatic semantic enrichment ingestion and
      # search. For more information, see About automatic semantic enrichment .

      def get_index(
        id : String,
        index_name : String
      ) : Types::GetIndexResponse

        input = Types::GetIndexRequest.new(id: id, index_name: index_name)
        get_index(input)
      end

      def get_index(input : Types::GetIndexRequest) : Types::GetIndexResponse
        request = Protocol::JsonRpc.build_request(Model::GET_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetIndexResponse, "GetIndex")
      end

      # Returns statistical information about your OpenSearch Serverless access policies, security
      # configurations, and security policies.

      def get_policies_stats : Types::GetPoliciesStatsResponse
        input = Types::GetPoliciesStatsRequest.new
        get_policies_stats(input)
      end

      def get_policies_stats(input : Types::GetPoliciesStatsRequest) : Types::GetPoliciesStatsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_POLICIES_STATS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetPoliciesStatsResponse, "GetPoliciesStats")
      end

      # Returns information about an OpenSearch Serverless security configuration. For more information, see
      # SAML authentication for Amazon OpenSearch Serverless .

      def get_security_config(
        id : String
      ) : Types::GetSecurityConfigResponse

        input = Types::GetSecurityConfigRequest.new(id: id)
        get_security_config(input)
      end

      def get_security_config(input : Types::GetSecurityConfigRequest) : Types::GetSecurityConfigResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SECURITY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSecurityConfigResponse, "GetSecurityConfig")
      end

      # Returns information about a configured OpenSearch Serverless security policy. For more information,
      # see Network access for Amazon OpenSearch Serverless and Encryption at rest for Amazon OpenSearch
      # Serverless .

      def get_security_policy(
        name : String,
        type : String
      ) : Types::GetSecurityPolicyResponse

        input = Types::GetSecurityPolicyRequest.new(name: name, type: type)
        get_security_policy(input)
      end

      def get_security_policy(input : Types::GetSecurityPolicyRequest) : Types::GetSecurityPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SECURITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSecurityPolicyResponse, "GetSecurityPolicy")
      end

      # Returns information about a list of OpenSearch Serverless access policies.

      def list_access_policies(
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource : Array(String)? = nil
      ) : Types::ListAccessPoliciesResponse

        input = Types::ListAccessPoliciesRequest.new(type: type, max_results: max_results, next_token: next_token, resource: resource)
        list_access_policies(input)
      end

      def list_access_policies(input : Types::ListAccessPoliciesRequest) : Types::ListAccessPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ACCESS_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAccessPoliciesResponse, "ListAccessPolicies")
      end

      # Returns a list of collection groups. For more information, see Creating and managing Amazon
      # OpenSearch Serverless collections .

      def list_collection_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCollectionGroupsResponse

        input = Types::ListCollectionGroupsRequest.new(max_results: max_results, next_token: next_token)
        list_collection_groups(input)
      end

      def list_collection_groups(input : Types::ListCollectionGroupsRequest) : Types::ListCollectionGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COLLECTION_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCollectionGroupsResponse, "ListCollectionGroups")
      end

      # Lists all OpenSearch Serverless collections. For more information, see Creating and managing Amazon
      # OpenSearch Serverless collections . Make sure to include an empty request body {} if you don't
      # include any collection filters in the request.

      def list_collections(
        collection_filters : Types::CollectionFilters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListCollectionsResponse

        input = Types::ListCollectionsRequest.new(collection_filters: collection_filters, max_results: max_results, next_token: next_token)
        list_collections(input)
      end

      def list_collections(input : Types::ListCollectionsRequest) : Types::ListCollectionsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COLLECTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListCollectionsResponse, "ListCollections")
      end

      # Returns a list of OpenSearch Serverless lifecycle policies. For more information, see Viewing data
      # lifecycle policies .

      def list_lifecycle_policies(
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resources : Array(String)? = nil
      ) : Types::ListLifecyclePoliciesResponse

        input = Types::ListLifecyclePoliciesRequest.new(type: type, max_results: max_results, next_token: next_token, resources: resources)
        list_lifecycle_policies(input)
      end

      def list_lifecycle_policies(input : Types::ListLifecyclePoliciesRequest) : Types::ListLifecyclePoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_LIFECYCLE_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListLifecyclePoliciesResponse, "ListLifecyclePolicies")
      end

      # Returns information about configured OpenSearch Serverless security configurations. For more
      # information, see SAML authentication for Amazon OpenSearch Serverless .

      def list_security_configs(
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListSecurityConfigsResponse

        input = Types::ListSecurityConfigsRequest.new(type: type, max_results: max_results, next_token: next_token)
        list_security_configs(input)
      end

      def list_security_configs(input : Types::ListSecurityConfigsRequest) : Types::ListSecurityConfigsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SECURITY_CONFIGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSecurityConfigsResponse, "ListSecurityConfigs")
      end

      # Returns information about configured OpenSearch Serverless security policies.

      def list_security_policies(
        type : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        resource : Array(String)? = nil
      ) : Types::ListSecurityPoliciesResponse

        input = Types::ListSecurityPoliciesRequest.new(type: type, max_results: max_results, next_token: next_token, resource: resource)
        list_security_policies(input)
      end

      def list_security_policies(input : Types::ListSecurityPoliciesRequest) : Types::ListSecurityPoliciesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_SECURITY_POLICIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListSecurityPoliciesResponse, "ListSecurityPolicies")
      end

      # Returns the tags for an OpenSearch Serverless resource. For more information, see Tagging Amazon
      # OpenSearch Serverless collections .

      def list_tags_for_resource(
        resource_arn : String
      ) : Types::ListTagsForResourceResponse

        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Returns the OpenSearch Serverless-managed interface VPC endpoints associated with the current
      # account. For more information, see Access Amazon OpenSearch Serverless using an interface endpoint .

      def list_vpc_endpoints(
        max_results : Int32? = nil,
        next_token : String? = nil,
        vpc_endpoint_filters : Types::VpcEndpointFilters? = nil
      ) : Types::ListVpcEndpointsResponse

        input = Types::ListVpcEndpointsRequest.new(max_results: max_results, next_token: next_token, vpc_endpoint_filters: vpc_endpoint_filters)
        list_vpc_endpoints(input)
      end

      def list_vpc_endpoints(input : Types::ListVpcEndpointsRequest) : Types::ListVpcEndpointsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_VPC_ENDPOINTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListVpcEndpointsResponse, "ListVpcEndpoints")
      end

      # Associates tags with an OpenSearch Serverless resource. For more information, see Tagging Amazon
      # OpenSearch Serverless collections .

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes a tag or set of tags from an OpenSearch Serverless resource. For more information, see
      # Tagging Amazon OpenSearch Serverless collections .

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Updates an OpenSearch Serverless access policy. For more information, see Data access control for
      # Amazon OpenSearch Serverless .

      def update_access_policy(
        name : String,
        policy_version : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil,
        policy : String? = nil
      ) : Types::UpdateAccessPolicyResponse

        input = Types::UpdateAccessPolicyRequest.new(name: name, policy_version: policy_version, type: type, client_token: client_token, description: description, policy: policy)
        update_access_policy(input)
      end

      def update_access_policy(input : Types::UpdateAccessPolicyRequest) : Types::UpdateAccessPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCESS_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccessPolicyResponse, "UpdateAccessPolicy")
      end

      # Update the OpenSearch Serverless settings for the current Amazon Web Services account. For more
      # information, see Managing capacity limits for Amazon OpenSearch Serverless .

      def update_account_settings(
        capacity_limits : Types::CapacityLimits? = nil
      ) : Types::UpdateAccountSettingsResponse

        input = Types::UpdateAccountSettingsRequest.new(capacity_limits: capacity_limits)
        update_account_settings(input)
      end

      def update_account_settings(input : Types::UpdateAccountSettingsRequest) : Types::UpdateAccountSettingsResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACCOUNT_SETTINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateAccountSettingsResponse, "UpdateAccountSettings")
      end

      # Updates an OpenSearch Serverless collection.

      def update_collection(
        id : String,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::UpdateCollectionResponse

        input = Types::UpdateCollectionRequest.new(id: id, client_token: client_token, description: description)
        update_collection(input)
      end

      def update_collection(input : Types::UpdateCollectionRequest) : Types::UpdateCollectionResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COLLECTION, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCollectionResponse, "UpdateCollection")
      end

      # Updates the description and capacity limits of a collection group.

      def update_collection_group(
        id : String,
        capacity_limits : Types::CollectionGroupCapacityLimits? = nil,
        client_token : String? = nil,
        description : String? = nil
      ) : Types::UpdateCollectionGroupResponse

        input = Types::UpdateCollectionGroupRequest.new(id: id, capacity_limits: capacity_limits, client_token: client_token, description: description)
        update_collection_group(input)
      end

      def update_collection_group(input : Types::UpdateCollectionGroupRequest) : Types::UpdateCollectionGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COLLECTION_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateCollectionGroupResponse, "UpdateCollectionGroup")
      end

      # Updates an existing index in an OpenSearch Serverless collection. This operation allows you to
      # modify the index schema, including adding new fields or changing field mappings. You can also enable
      # automatic semantic enrichment ingestion and search. For more information, see About automatic
      # semantic enrichment .

      def update_index(
        id : String,
        index_name : String,
        index_schema : Types::IndexSchema? = nil
      ) : Types::UpdateIndexResponse

        input = Types::UpdateIndexRequest.new(id: id, index_name: index_name, index_schema: index_schema)
        update_index(input)
      end

      def update_index(input : Types::UpdateIndexRequest) : Types::UpdateIndexResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_INDEX, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateIndexResponse, "UpdateIndex")
      end

      # Updates an OpenSearch Serverless access policy. For more information, see Updating data lifecycle
      # policies .

      def update_lifecycle_policy(
        name : String,
        policy_version : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil,
        policy : String? = nil
      ) : Types::UpdateLifecyclePolicyResponse

        input = Types::UpdateLifecyclePolicyRequest.new(name: name, policy_version: policy_version, type: type, client_token: client_token, description: description, policy: policy)
        update_lifecycle_policy(input)
      end

      def update_lifecycle_policy(input : Types::UpdateLifecyclePolicyRequest) : Types::UpdateLifecyclePolicyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_LIFECYCLE_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateLifecyclePolicyResponse, "UpdateLifecyclePolicy")
      end

      # Updates a security configuration for OpenSearch Serverless. For more information, see SAML
      # authentication for Amazon OpenSearch Serverless .

      def update_security_config(
        config_version : String,
        id : String,
        client_token : String? = nil,
        description : String? = nil,
        iam_federation_options : Types::IamFederationConfigOptions? = nil,
        iam_identity_center_options_updates : Types::UpdateIamIdentityCenterConfigOptions? = nil,
        saml_options : Types::SamlConfigOptions? = nil
      ) : Types::UpdateSecurityConfigResponse

        input = Types::UpdateSecurityConfigRequest.new(config_version: config_version, id: id, client_token: client_token, description: description, iam_federation_options: iam_federation_options, iam_identity_center_options_updates: iam_identity_center_options_updates, saml_options: saml_options)
        update_security_config(input)
      end

      def update_security_config(input : Types::UpdateSecurityConfigRequest) : Types::UpdateSecurityConfigResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SECURITY_CONFIG, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSecurityConfigResponse, "UpdateSecurityConfig")
      end

      # Updates an OpenSearch Serverless security policy. For more information, see Network access for
      # Amazon OpenSearch Serverless and Encryption at rest for Amazon OpenSearch Serverless .

      def update_security_policy(
        name : String,
        policy_version : String,
        type : String,
        client_token : String? = nil,
        description : String? = nil,
        policy : String? = nil
      ) : Types::UpdateSecurityPolicyResponse

        input = Types::UpdateSecurityPolicyRequest.new(name: name, policy_version: policy_version, type: type, client_token: client_token, description: description, policy: policy)
        update_security_policy(input)
      end

      def update_security_policy(input : Types::UpdateSecurityPolicyRequest) : Types::UpdateSecurityPolicyResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SECURITY_POLICY, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSecurityPolicyResponse, "UpdateSecurityPolicy")
      end

      # Updates an OpenSearch Serverless-managed interface endpoint. For more information, see Access Amazon
      # OpenSearch Serverless using an interface endpoint .

      def update_vpc_endpoint(
        id : String,
        add_security_group_ids : Array(String)? = nil,
        add_subnet_ids : Array(String)? = nil,
        client_token : String? = nil,
        remove_security_group_ids : Array(String)? = nil,
        remove_subnet_ids : Array(String)? = nil
      ) : Types::UpdateVpcEndpointResponse

        input = Types::UpdateVpcEndpointRequest.new(id: id, add_security_group_ids: add_security_group_ids, add_subnet_ids: add_subnet_ids, client_token: client_token, remove_security_group_ids: remove_security_group_ids, remove_subnet_ids: remove_subnet_ids)
        update_vpc_endpoint(input)
      end

      def update_vpc_endpoint(input : Types::UpdateVpcEndpointRequest) : Types::UpdateVpcEndpointResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_VPC_ENDPOINT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateVpcEndpointResponse, "UpdateVpcEndpoint")
      end
    end
  end
end
