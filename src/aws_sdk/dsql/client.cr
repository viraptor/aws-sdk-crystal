module AwsSdk
  module DSQL
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # The CreateCluster API allows you to create both single-Region clusters and multi-Region clusters.
      # With the addition of the multiRegionProperties parameter, you can create a cluster with witness
      # Region support and establish peer relationships with clusters in other Regions during creation.
      # Creating multi-Region clusters requires additional IAM permissions beyond those needed for
      # single-Region clusters, as detailed in the Required permissions section below. Required permissions
      # dsql:CreateCluster Required to create a cluster. Resources: arn:aws:dsql:region:account-id:cluster/*
      # dsql:TagResource Permission to add tags to a resource. Resources:
      # arn:aws:dsql:region:account-id:cluster/* dsql:PutMultiRegionProperties Permission to configure
      # multi-Region properties for a cluster. Resources: arn:aws:dsql:region:account-id:cluster/*
      # dsql:AddPeerCluster When specifying multiRegionProperties.clusters , permission to add peer
      # clusters. Resources: Local cluster: arn:aws:dsql:region:account-id:cluster/* Each peer cluster:
      # exact ARN of each specified peer cluster dsql:PutWitnessRegion When specifying
      # multiRegionProperties.witnessRegion , permission to set a witness Region. This permission is checked
      # both in the cluster Region and in the witness Region. Resources:
      # arn:aws:dsql:region:account-id:cluster/* Condition Keys: dsql:WitnessRegion (matching the specified
      # witness region) The witness Region specified in multiRegionProperties.witnessRegion cannot be the
      # same as the cluster's Region.

      def create_cluster(
        bypass_policy_lockout_safety_check : Bool? = nil,
        client_token : String? = nil,
        deletion_protection_enabled : Bool? = nil,
        kms_encryption_key : String? = nil,
        multi_region_properties : Types::MultiRegionProperties? = nil,
        policy : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterInput.new(bypass_policy_lockout_safety_check: bypass_policy_lockout_safety_check, client_token: client_token, deletion_protection_enabled: deletion_protection_enabled, kms_encryption_key: kms_encryption_key, multi_region_properties: multi_region_properties, policy: policy, tags: tags)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a cluster in Amazon Aurora DSQL.

      def delete_cluster(
        identifier : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteClusterInput.new(identifier: identifier, client_token: client_token)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource-based policy attached to a cluster. This removes all access permissions defined
      # by the policy, reverting to default access controls.

      def delete_cluster_policy(
        identifier : String,
        client_token : String? = nil,
        expected_policy_version : String? = nil
      ) : Protocol::Request
        input = Types::DeleteClusterPolicyInput.new(identifier: identifier, client_token: client_token, expected_policy_version: expected_policy_version)
        delete_cluster_policy(input)
      end

      def delete_cluster_policy(input : Types::DeleteClusterPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a cluster.

      def get_cluster(
        identifier : String
      ) : Protocol::Request
        input = Types::GetClusterInput.new(identifier: identifier)
        get_cluster(input)
      end

      def get_cluster(input : Types::GetClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource-based policy document attached to a cluster. This policy defines the access
      # permissions and conditions for the cluster.

      def get_cluster_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::GetClusterPolicyInput.new(identifier: identifier)
        get_cluster_policy(input)
      end

      def get_cluster_policy(input : Types::GetClusterPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLUSTER_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the VPC endpoint service name.

      def get_vpc_endpoint_service_name(
        identifier : String
      ) : Protocol::Request
        input = Types::GetVpcEndpointServiceNameInput.new(identifier: identifier)
        get_vpc_endpoint_service_name(input)
      end

      def get_vpc_endpoint_service_name(input : Types::GetVpcEndpointServiceNameInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VPC_ENDPOINT_SERVICE_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a list of clusters.

      def list_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListClustersInput.new(max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all of the tags for a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Attaches a resource-based policy to a cluster. This policy defines access permissions and conditions
      # for the cluster, allowing you to control which principals can perform actions on the cluster.

      def put_cluster_policy(
        identifier : String,
        policy : String,
        bypass_policy_lockout_safety_check : Bool? = nil,
        client_token : String? = nil,
        expected_policy_version : String? = nil
      ) : Protocol::Request
        input = Types::PutClusterPolicyInput.new(identifier: identifier, policy: policy, bypass_policy_lockout_safety_check: bypass_policy_lockout_safety_check, client_token: client_token, expected_policy_version: expected_policy_version)
        put_cluster_policy(input)
      end

      def put_cluster_policy(input : Types::PutClusterPolicyInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CLUSTER_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource with a map of key and value pairs.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceInput.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The UpdateCluster API allows you to modify both single-Region and multi-Region cluster
      # configurations. With the multiRegionProperties parameter, you can add or modify witness Region
      # support and manage peer relationships with clusters in other Regions. Note that updating
      # multi-Region clusters requires additional IAM permissions beyond those needed for standard cluster
      # updates, as detailed in the Permissions section. Required permissions dsql:UpdateCluster Permission
      # to update a DSQL cluster. Resources: arn:aws:dsql: region : account-id :cluster/ cluster-id
      # dsql:PutMultiRegionProperties Permission to configure multi-Region properties for a cluster.
      # Resources: arn:aws:dsql: region : account-id :cluster/ cluster-id dsql:GetCluster Permission to
      # retrieve cluster information. Resources: arn:aws:dsql: region : account-id :cluster/ cluster-id
      # dsql:AddPeerCluster Permission to add peer clusters. Resources: Local cluster: arn:aws:dsql: region
      # : account-id :cluster/ cluster-id Each peer cluster: exact ARN of each specified peer cluster
      # dsql:RemovePeerCluster Permission to remove peer clusters. The dsql:RemovePeerCluster permission
      # uses a wildcard ARN pattern to simplify permission management during updates. Resources:
      # arn:aws:dsql:*: account-id :cluster/* dsql:PutWitnessRegion Permission to set a witness Region.
      # Resources: arn:aws:dsql: region : account-id :cluster/ cluster-id Condition Keys: dsql:WitnessRegion
      # (matching the specified witness Region) This permission is checked both in the cluster Region and in
      # the witness Region. The witness region specified in multiRegionProperties.witnessRegion cannot be
      # the same as the cluster's Region. When updating clusters with peer relationships, permissions are
      # checked for both adding and removing peers. The dsql:RemovePeerCluster permission uses a wildcard
      # ARN pattern to simplify permission management during updates.

      def update_cluster(
        identifier : String,
        client_token : String? = nil,
        deletion_protection_enabled : Bool? = nil,
        kms_encryption_key : String? = nil,
        multi_region_properties : Types::MultiRegionProperties? = nil
      ) : Protocol::Request
        input = Types::UpdateClusterInput.new(identifier: identifier, client_token: client_token, deletion_protection_enabled: deletion_protection_enabled, kms_encryption_key: kms_encryption_key, multi_region_properties: multi_region_properties)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
