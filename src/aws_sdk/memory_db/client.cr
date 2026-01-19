module AwsSdk
  module MemoryDB
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

      # Apply the service update to a list of clusters supplied. For more information on service updates and
      # applying them, see Applying the service updates .
      def batch_update_cluster(
        cluster_names : Array(String),
        service_update : Types::ServiceUpdateRequest? = nil
      ) : Types::BatchUpdateClusterResponse
        input = Types::BatchUpdateClusterRequest.new(cluster_names: cluster_names, service_update: service_update)
        batch_update_cluster(input)
      end
      def batch_update_cluster(input : Types::BatchUpdateClusterRequest) : Types::BatchUpdateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::BATCH_UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::BatchUpdateClusterResponse, "BatchUpdateCluster")
      end

      # Makes a copy of an existing snapshot.
      def copy_snapshot(
        source_snapshot_name : String,
        target_snapshot_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        target_bucket : String? = nil
      ) : Types::CopySnapshotResponse
        input = Types::CopySnapshotRequest.new(source_snapshot_name: source_snapshot_name, target_snapshot_name: target_snapshot_name, kms_key_id: kms_key_id, tags: tags, target_bucket: target_bucket)
        copy_snapshot(input)
      end
      def copy_snapshot(input : Types::CopySnapshotRequest) : Types::CopySnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::COPY_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CopySnapshotResponse, "CopySnapshot")
      end

      # Creates an Access Control List. For more information, see Authenticating users with Access Contol
      # Lists (ACLs) .
      def create_acl(
        acl_name : String,
        tags : Array(Types::Tag)? = nil,
        user_names : Array(String)? = nil
      ) : Types::CreateACLResponse
        input = Types::CreateACLRequest.new(acl_name: acl_name, tags: tags, user_names: user_names)
        create_acl(input)
      end
      def create_acl(input : Types::CreateACLRequest) : Types::CreateACLResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateACLResponse, "CreateACL")
      end

      # Creates a cluster. All nodes in the cluster run the same protocol-compliant engine software.
      def create_cluster(
        acl_name : String,
        cluster_name : String,
        node_type : String,
        auto_minor_version_upgrade : Bool? = nil,
        data_tiering : Bool? = nil,
        description : String? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        ip_discovery : String? = nil,
        kms_key_id : String? = nil,
        maintenance_window : String? = nil,
        multi_region_cluster_name : String? = nil,
        network_type : String? = nil,
        num_replicas_per_shard : Int32? = nil,
        num_shards : Int32? = nil,
        parameter_group_name : String? = nil,
        port : Int32? = nil,
        security_group_ids : Array(String)? = nil,
        snapshot_arns : Array(String)? = nil,
        snapshot_name : String? = nil,
        snapshot_retention_limit : Int32? = nil,
        snapshot_window : String? = nil,
        sns_topic_arn : String? = nil,
        subnet_group_name : String? = nil,
        tls_enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterResponse
        input = Types::CreateClusterRequest.new(acl_name: acl_name, cluster_name: cluster_name, node_type: node_type, auto_minor_version_upgrade: auto_minor_version_upgrade, data_tiering: data_tiering, description: description, engine: engine, engine_version: engine_version, ip_discovery: ip_discovery, kms_key_id: kms_key_id, maintenance_window: maintenance_window, multi_region_cluster_name: multi_region_cluster_name, network_type: network_type, num_replicas_per_shard: num_replicas_per_shard, num_shards: num_shards, parameter_group_name: parameter_group_name, port: port, security_group_ids: security_group_ids, snapshot_arns: snapshot_arns, snapshot_name: snapshot_name, snapshot_retention_limit: snapshot_retention_limit, snapshot_window: snapshot_window, sns_topic_arn: sns_topic_arn, subnet_group_name: subnet_group_name, tls_enabled: tls_enabled, tags: tags)
        create_cluster(input)
      end
      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResponse, "CreateCluster")
      end

      # Creates a new multi-Region cluster.
      def create_multi_region_cluster(
        multi_region_cluster_name_suffix : String,
        node_type : String,
        description : String? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        multi_region_parameter_group_name : String? = nil,
        num_shards : Int32? = nil,
        tls_enabled : Bool? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateMultiRegionClusterResponse
        input = Types::CreateMultiRegionClusterRequest.new(multi_region_cluster_name_suffix: multi_region_cluster_name_suffix, node_type: node_type, description: description, engine: engine, engine_version: engine_version, multi_region_parameter_group_name: multi_region_parameter_group_name, num_shards: num_shards, tls_enabled: tls_enabled, tags: tags)
        create_multi_region_cluster(input)
      end
      def create_multi_region_cluster(input : Types::CreateMultiRegionClusterRequest) : Types::CreateMultiRegionClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_MULTI_REGION_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateMultiRegionClusterResponse, "CreateMultiRegionCluster")
      end

      # Creates a new MemoryDB parameter group. A parameter group is a collection of parameters and their
      # values that are applied to all of the nodes in any cluster. For more information, see Configuring
      # engine parameters using parameter groups .
      def create_parameter_group(
        family : String,
        parameter_group_name : String,
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateParameterGroupResponse
        input = Types::CreateParameterGroupRequest.new(family: family, parameter_group_name: parameter_group_name, description: description, tags: tags)
        create_parameter_group(input)
      end
      def create_parameter_group(input : Types::CreateParameterGroupRequest) : Types::CreateParameterGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateParameterGroupResponse, "CreateParameterGroup")
      end

      # Creates a copy of an entire cluster at a specific moment in time.
      def create_snapshot(
        cluster_name : String,
        snapshot_name : String,
        kms_key_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSnapshotResponse
        input = Types::CreateSnapshotRequest.new(cluster_name: cluster_name, snapshot_name: snapshot_name, kms_key_id: kms_key_id, tags: tags)
        create_snapshot(input)
      end
      def create_snapshot(input : Types::CreateSnapshotRequest) : Types::CreateSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSnapshotResponse, "CreateSnapshot")
      end

      # Creates a subnet group. A subnet group is a collection of subnets (typically private) that you can
      # designate for your clusters running in an Amazon Virtual Private Cloud (VPC) environment. When you
      # create a cluster in an Amazon VPC, you must specify a subnet group. MemoryDB uses that subnet group
      # to choose a subnet and IP addresses within that subnet to associate with your nodes. For more
      # information, see Subnets and subnet groups .
      def create_subnet_group(
        subnet_group_name : String,
        subnet_ids : Array(String),
        description : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSubnetGroupResponse
        input = Types::CreateSubnetGroupRequest.new(subnet_group_name: subnet_group_name, subnet_ids: subnet_ids, description: description, tags: tags)
        create_subnet_group(input)
      end
      def create_subnet_group(input : Types::CreateSubnetGroupRequest) : Types::CreateSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSubnetGroupResponse, "CreateSubnetGroup")
      end

      # Creates a MemoryDB user. For more information, see Authenticating users with Access Contol Lists
      # (ACLs) .
      def create_user(
        access_string : String,
        authentication_mode : Types::AuthenticationMode,
        user_name : String,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateUserResponse
        input = Types::CreateUserRequest.new(access_string: access_string, authentication_mode: authentication_mode, user_name: user_name, tags: tags)
        create_user(input)
      end
      def create_user(input : Types::CreateUserRequest) : Types::CreateUserResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateUserResponse, "CreateUser")
      end

      # Deletes an Access Control List. The ACL must first be disassociated from the cluster before it can
      # be deleted. For more information, see Authenticating users with Access Contol Lists (ACLs) .
      def delete_acl(
        acl_name : String
      ) : Types::DeleteACLResponse
        input = Types::DeleteACLRequest.new(acl_name: acl_name)
        delete_acl(input)
      end
      def delete_acl(input : Types::DeleteACLRequest) : Types::DeleteACLResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteACLResponse, "DeleteACL")
      end

      # Deletes a cluster. It also deletes all associated nodes and node endpoints. CreateSnapshot
      # permission is required to create a final snapshot. Without this permission, the API call will fail
      # with an Access Denied exception.
      def delete_cluster(
        cluster_name : String,
        final_snapshot_name : String? = nil,
        multi_region_cluster_name : String? = nil
      ) : Types::DeleteClusterResponse
        input = Types::DeleteClusterRequest.new(cluster_name: cluster_name, final_snapshot_name: final_snapshot_name, multi_region_cluster_name: multi_region_cluster_name)
        delete_cluster(input)
      end
      def delete_cluster(input : Types::DeleteClusterRequest) : Types::DeleteClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClusterResponse, "DeleteCluster")
      end

      # Deletes an existing multi-Region cluster.
      def delete_multi_region_cluster(
        multi_region_cluster_name : String
      ) : Types::DeleteMultiRegionClusterResponse
        input = Types::DeleteMultiRegionClusterRequest.new(multi_region_cluster_name: multi_region_cluster_name)
        delete_multi_region_cluster(input)
      end
      def delete_multi_region_cluster(input : Types::DeleteMultiRegionClusterRequest) : Types::DeleteMultiRegionClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_MULTI_REGION_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteMultiRegionClusterResponse, "DeleteMultiRegionCluster")
      end

      # Deletes the specified parameter group. You cannot delete a parameter group if it is associated with
      # any clusters. You cannot delete the default parameter groups in your account.
      def delete_parameter_group(
        parameter_group_name : String
      ) : Types::DeleteParameterGroupResponse
        input = Types::DeleteParameterGroupRequest.new(parameter_group_name: parameter_group_name)
        delete_parameter_group(input)
      end
      def delete_parameter_group(input : Types::DeleteParameterGroupRequest) : Types::DeleteParameterGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteParameterGroupResponse, "DeleteParameterGroup")
      end

      # Deletes an existing snapshot. When you receive a successful response from this operation, MemoryDB
      # immediately begins deleting the snapshot; you cannot cancel or revert this operation.
      def delete_snapshot(
        snapshot_name : String
      ) : Types::DeleteSnapshotResponse
        input = Types::DeleteSnapshotRequest.new(snapshot_name: snapshot_name)
        delete_snapshot(input)
      end
      def delete_snapshot(input : Types::DeleteSnapshotRequest) : Types::DeleteSnapshotResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SNAPSHOT, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSnapshotResponse, "DeleteSnapshot")
      end

      # Deletes a subnet group. You cannot delete a default subnet group or one that is associated with any
      # clusters.
      def delete_subnet_group(
        subnet_group_name : String
      ) : Types::DeleteSubnetGroupResponse
        input = Types::DeleteSubnetGroupRequest.new(subnet_group_name: subnet_group_name)
        delete_subnet_group(input)
      end
      def delete_subnet_group(input : Types::DeleteSubnetGroupRequest) : Types::DeleteSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSubnetGroupResponse, "DeleteSubnetGroup")
      end

      # Deletes a user. The user will be removed from all ACLs and in turn removed from all clusters.
      def delete_user(
        user_name : String
      ) : Types::DeleteUserResponse
        input = Types::DeleteUserRequest.new(user_name: user_name)
        delete_user(input)
      end
      def delete_user(input : Types::DeleteUserRequest) : Types::DeleteUserResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteUserResponse, "DeleteUser")
      end

      # Returns a list of ACLs.
      def describe_ac_ls(
        acl_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeACLsResponse
        input = Types::DescribeACLsRequest.new(acl_name: acl_name, max_results: max_results, next_token: next_token)
        describe_ac_ls(input)
      end
      def describe_ac_ls(input : Types::DescribeACLsRequest) : Types::DescribeACLsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_AC_LS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeACLsResponse, "DescribeACLs")
      end

      # Returns information about all provisioned clusters if no cluster identifier is specified, or about a
      # specific cluster if a cluster name is supplied.
      def describe_clusters(
        cluster_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        show_shard_details : Bool? = nil
      ) : Types::DescribeClustersResponse
        input = Types::DescribeClustersRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token, show_shard_details: show_shard_details)
        describe_clusters(input)
      end
      def describe_clusters(input : Types::DescribeClustersRequest) : Types::DescribeClustersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClustersResponse, "DescribeClusters")
      end

      # Returns a list of the available Redis OSS engine versions.
      def describe_engine_versions(
        default_only : Bool? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        parameter_group_family : String? = nil
      ) : Types::DescribeEngineVersionsResponse
        input = Types::DescribeEngineVersionsRequest.new(default_only: default_only, engine: engine, engine_version: engine_version, max_results: max_results, next_token: next_token, parameter_group_family: parameter_group_family)
        describe_engine_versions(input)
      end
      def describe_engine_versions(input : Types::DescribeEngineVersionsRequest) : Types::DescribeEngineVersionsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_ENGINE_VERSIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEngineVersionsResponse, "DescribeEngineVersions")
      end

      # Returns events related to clusters, security groups, and parameter groups. You can obtain events
      # specific to a particular cluster, security group, or parameter group by providing the name as a
      # parameter. By default, only the events occurring within the last hour are returned; however, you can
      # retrieve up to 14 days' worth of events if necessary.
      def describe_events(
        duration : Int32? = nil,
        end_time : Time? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        source_name : String? = nil,
        source_type : String? = nil,
        start_time : Time? = nil
      ) : Types::DescribeEventsResponse
        input = Types::DescribeEventsRequest.new(duration: duration, end_time: end_time, max_results: max_results, next_token: next_token, source_name: source_name, source_type: source_type, start_time: start_time)
        describe_events(input)
      end
      def describe_events(input : Types::DescribeEventsRequest) : Types::DescribeEventsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_EVENTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeEventsResponse, "DescribeEvents")
      end

      # Returns details about one or more multi-Region clusters.
      def describe_multi_region_clusters(
        max_results : Int32? = nil,
        multi_region_cluster_name : String? = nil,
        next_token : String? = nil,
        show_cluster_details : Bool? = nil
      ) : Types::DescribeMultiRegionClustersResponse
        input = Types::DescribeMultiRegionClustersRequest.new(max_results: max_results, multi_region_cluster_name: multi_region_cluster_name, next_token: next_token, show_cluster_details: show_cluster_details)
        describe_multi_region_clusters(input)
      end
      def describe_multi_region_clusters(input : Types::DescribeMultiRegionClustersRequest) : Types::DescribeMultiRegionClustersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MULTI_REGION_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMultiRegionClustersResponse, "DescribeMultiRegionClusters")
      end

      # Returns a list of multi-region parameter groups.
      def describe_multi_region_parameter_groups(
        max_results : Int32? = nil,
        multi_region_parameter_group_name : String? = nil,
        next_token : String? = nil
      ) : Types::DescribeMultiRegionParameterGroupsResponse
        input = Types::DescribeMultiRegionParameterGroupsRequest.new(max_results: max_results, multi_region_parameter_group_name: multi_region_parameter_group_name, next_token: next_token)
        describe_multi_region_parameter_groups(input)
      end
      def describe_multi_region_parameter_groups(input : Types::DescribeMultiRegionParameterGroupsRequest) : Types::DescribeMultiRegionParameterGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MULTI_REGION_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMultiRegionParameterGroupsResponse, "DescribeMultiRegionParameterGroups")
      end

      # Returns the detailed parameter list for a particular multi-region parameter group.
      def describe_multi_region_parameters(
        multi_region_parameter_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        source : String? = nil
      ) : Types::DescribeMultiRegionParametersResponse
        input = Types::DescribeMultiRegionParametersRequest.new(multi_region_parameter_group_name: multi_region_parameter_group_name, max_results: max_results, next_token: next_token, source: source)
        describe_multi_region_parameters(input)
      end
      def describe_multi_region_parameters(input : Types::DescribeMultiRegionParametersRequest) : Types::DescribeMultiRegionParametersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_MULTI_REGION_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeMultiRegionParametersResponse, "DescribeMultiRegionParameters")
      end

      # Returns a list of parameter group descriptions. If a parameter group name is specified, the list
      # contains only the descriptions for that group.
      def describe_parameter_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        parameter_group_name : String? = nil
      ) : Types::DescribeParameterGroupsResponse
        input = Types::DescribeParameterGroupsRequest.new(max_results: max_results, next_token: next_token, parameter_group_name: parameter_group_name)
        describe_parameter_groups(input)
      end
      def describe_parameter_groups(input : Types::DescribeParameterGroupsRequest) : Types::DescribeParameterGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeParameterGroupsResponse, "DescribeParameterGroups")
      end

      # Returns the detailed parameter list for a particular parameter group.
      def describe_parameters(
        parameter_group_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeParametersResponse
        input = Types::DescribeParametersRequest.new(parameter_group_name: parameter_group_name, max_results: max_results, next_token: next_token)
        describe_parameters(input)
      end
      def describe_parameters(input : Types::DescribeParametersRequest) : Types::DescribeParametersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeParametersResponse, "DescribeParameters")
      end

      # Returns information about reserved nodes for this account, or about a specified reserved node.
      def describe_reserved_nodes(
        duration : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        node_type : String? = nil,
        offering_type : String? = nil,
        reservation_id : String? = nil,
        reserved_nodes_offering_id : String? = nil
      ) : Types::DescribeReservedNodesResponse
        input = Types::DescribeReservedNodesRequest.new(duration: duration, max_results: max_results, next_token: next_token, node_type: node_type, offering_type: offering_type, reservation_id: reservation_id, reserved_nodes_offering_id: reserved_nodes_offering_id)
        describe_reserved_nodes(input)
      end
      def describe_reserved_nodes(input : Types::DescribeReservedNodesRequest) : Types::DescribeReservedNodesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESERVED_NODES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReservedNodesResponse, "DescribeReservedNodes")
      end

      # Lists available reserved node offerings.
      def describe_reserved_nodes_offerings(
        duration : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        node_type : String? = nil,
        offering_type : String? = nil,
        reserved_nodes_offering_id : String? = nil
      ) : Types::DescribeReservedNodesOfferingsResponse
        input = Types::DescribeReservedNodesOfferingsRequest.new(duration: duration, max_results: max_results, next_token: next_token, node_type: node_type, offering_type: offering_type, reserved_nodes_offering_id: reserved_nodes_offering_id)
        describe_reserved_nodes_offerings(input)
      end
      def describe_reserved_nodes_offerings(input : Types::DescribeReservedNodesOfferingsRequest) : Types::DescribeReservedNodesOfferingsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_RESERVED_NODES_OFFERINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeReservedNodesOfferingsResponse, "DescribeReservedNodesOfferings")
      end

      # Returns details of the service updates.
      def describe_service_updates(
        cluster_names : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        service_update_name : String? = nil,
        status : Array(String)? = nil
      ) : Types::DescribeServiceUpdatesResponse
        input = Types::DescribeServiceUpdatesRequest.new(cluster_names: cluster_names, max_results: max_results, next_token: next_token, service_update_name: service_update_name, status: status)
        describe_service_updates(input)
      end
      def describe_service_updates(input : Types::DescribeServiceUpdatesRequest) : Types::DescribeServiceUpdatesResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SERVICE_UPDATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeServiceUpdatesResponse, "DescribeServiceUpdates")
      end

      # Returns information about cluster snapshots. By default, DescribeSnapshots lists all of your
      # snapshots; it can optionally describe a single snapshot, or just the snapshots associated with a
      # particular cluster.
      def describe_snapshots(
        cluster_name : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        show_detail : Bool? = nil,
        snapshot_name : String? = nil,
        source : String? = nil
      ) : Types::DescribeSnapshotsResponse
        input = Types::DescribeSnapshotsRequest.new(cluster_name: cluster_name, max_results: max_results, next_token: next_token, show_detail: show_detail, snapshot_name: snapshot_name, source: source)
        describe_snapshots(input)
      end
      def describe_snapshots(input : Types::DescribeSnapshotsRequest) : Types::DescribeSnapshotsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SNAPSHOTS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSnapshotsResponse, "DescribeSnapshots")
      end

      # Returns a list of subnet group descriptions. If a subnet group name is specified, the list contains
      # only the description of that group.
      def describe_subnet_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        subnet_group_name : String? = nil
      ) : Types::DescribeSubnetGroupsResponse
        input = Types::DescribeSubnetGroupsRequest.new(max_results: max_results, next_token: next_token, subnet_group_name: subnet_group_name)
        describe_subnet_groups(input)
      end
      def describe_subnet_groups(input : Types::DescribeSubnetGroupsRequest) : Types::DescribeSubnetGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SUBNET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSubnetGroupsResponse, "DescribeSubnetGroups")
      end

      # Returns a list of users.
      def describe_users(
        filters : Array(Types::Filter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        user_name : String? = nil
      ) : Types::DescribeUsersResponse
        input = Types::DescribeUsersRequest.new(filters: filters, max_results: max_results, next_token: next_token, user_name: user_name)
        describe_users(input)
      end
      def describe_users(input : Types::DescribeUsersRequest) : Types::DescribeUsersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_USERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeUsersResponse, "DescribeUsers")
      end

      # Used to failover a shard. This API is designed for testing the behavior of your application in case
      # of MemoryDB failover. It is not designed to be used as a production-level tool for initiating a
      # failover to overcome a problem you may have with the cluster. Moreover, in certain conditions such
      # as large scale operational events, Amazon may block this API.
      def failover_shard(
        cluster_name : String,
        shard_name : String
      ) : Types::FailoverShardResponse
        input = Types::FailoverShardRequest.new(cluster_name: cluster_name, shard_name: shard_name)
        failover_shard(input)
      end
      def failover_shard(input : Types::FailoverShardRequest) : Types::FailoverShardResponse
        request = Protocol::JsonRpc.build_request(Model::FAILOVER_SHARD, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::FailoverShardResponse, "FailoverShard")
      end

      # Lists the allowed updates for a multi-Region cluster.
      def list_allowed_multi_region_cluster_updates(
        multi_region_cluster_name : String
      ) : Types::ListAllowedMultiRegionClusterUpdatesResponse
        input = Types::ListAllowedMultiRegionClusterUpdatesRequest.new(multi_region_cluster_name: multi_region_cluster_name)
        list_allowed_multi_region_cluster_updates(input)
      end
      def list_allowed_multi_region_cluster_updates(input : Types::ListAllowedMultiRegionClusterUpdatesRequest) : Types::ListAllowedMultiRegionClusterUpdatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ALLOWED_MULTI_REGION_CLUSTER_UPDATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAllowedMultiRegionClusterUpdatesResponse, "ListAllowedMultiRegionClusterUpdates")
      end

      # Lists all available node types that you can scale to from your cluster's current node type. When you
      # use the UpdateCluster operation to scale your cluster, the value of the NodeType parameter must be
      # one of the node types returned by this operation.
      def list_allowed_node_type_updates(
        cluster_name : String
      ) : Types::ListAllowedNodeTypeUpdatesResponse
        input = Types::ListAllowedNodeTypeUpdatesRequest.new(cluster_name: cluster_name)
        list_allowed_node_type_updates(input)
      end
      def list_allowed_node_type_updates(input : Types::ListAllowedNodeTypeUpdatesRequest) : Types::ListAllowedNodeTypeUpdatesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_ALLOWED_NODE_TYPE_UPDATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListAllowedNodeTypeUpdatesResponse, "ListAllowedNodeTypeUpdates")
      end

      # Lists all tags currently on a named resource. A tag is a key-value pair where the key and value are
      # case-sensitive. You can use tags to categorize and track your MemoryDB resources. For more
      # information, see Tagging your MemoryDB resources . When you add or remove tags from multi region
      # clusters, you might not immediately see the latest effective tags in the ListTags API response due
      # to it being eventually consistent specifically for multi region clusters. For more information, see
      # Tagging your MemoryDB resources .
      def list_tags(
        resource_arn : String
      ) : Types::ListTagsResponse
        input = Types::ListTagsRequest.new(resource_arn: resource_arn)
        list_tags(input)
      end
      def list_tags(input : Types::ListTagsRequest) : Types::ListTagsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsResponse, "ListTags")
      end

      # Allows you to purchase a reserved node offering. Reserved nodes are not eligible for cancellation
      # and are non-refundable.
      def purchase_reserved_nodes_offering(
        reserved_nodes_offering_id : String,
        node_count : Int32? = nil,
        reservation_id : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::PurchaseReservedNodesOfferingResponse
        input = Types::PurchaseReservedNodesOfferingRequest.new(reserved_nodes_offering_id: reserved_nodes_offering_id, node_count: node_count, reservation_id: reservation_id, tags: tags)
        purchase_reserved_nodes_offering(input)
      end
      def purchase_reserved_nodes_offering(input : Types::PurchaseReservedNodesOfferingRequest) : Types::PurchaseReservedNodesOfferingResponse
        request = Protocol::JsonRpc.build_request(Model::PURCHASE_RESERVED_NODES_OFFERING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::PurchaseReservedNodesOfferingResponse, "PurchaseReservedNodesOffering")
      end

      # Modifies the parameters of a parameter group to the engine or system default value. You can reset
      # specific parameters by submitting a list of parameter names. To reset the entire parameter group,
      # specify the AllParameters and ParameterGroupName parameters.
      def reset_parameter_group(
        parameter_group_name : String,
        all_parameters : Bool? = nil,
        parameter_names : Array(String)? = nil
      ) : Types::ResetParameterGroupResponse
        input = Types::ResetParameterGroupRequest.new(parameter_group_name: parameter_group_name, all_parameters: all_parameters, parameter_names: parameter_names)
        reset_parameter_group(input)
      end
      def reset_parameter_group(input : Types::ResetParameterGroupRequest) : Types::ResetParameterGroupResponse
        request = Protocol::JsonRpc.build_request(Model::RESET_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ResetParameterGroupResponse, "ResetParameterGroup")
      end

      # Use this operation to add tags to a resource. A tag is a key-value pair where the key and value are
      # case-sensitive. You can use tags to categorize and track all your MemoryDB resources. For more
      # information, see Tagging your MemoryDB resources . When you add tags to multi region clusters, you
      # might not immediately see the latest effective tags in the ListTags API response due to it being
      # eventually consistent specifically for multi region clusters. For more information, see Tagging your
      # MemoryDB resources . You can specify cost-allocation tags for your MemoryDB resources, Amazon
      # generates a cost allocation report as a comma-separated value (CSV) file with your usage and costs
      # aggregated by your tags. You can apply tags that represent business categories (such as cost
      # centers, application names, or owners) to organize your costs across multiple services. For more
      # information, see Using Cost Allocation Tags .
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

      # Use this operation to remove tags on a resource. A tag is a key-value pair where the key and value
      # are case-sensitive. You can use tags to categorize and track all your MemoryDB resources. For more
      # information, see Tagging your MemoryDB resources . When you remove tags from multi region clusters,
      # you might not immediately see the latest effective tags in the ListTags API response due to it being
      # eventually consistent specifically for multi region clusters. For more information, see Tagging your
      # MemoryDB resources . You can specify cost-allocation tags for your MemoryDB resources, Amazon
      # generates a cost allocation report as a comma-separated value (CSV) file with your usage and costs
      # aggregated by your tags. You can apply tags that represent business categories (such as cost
      # centers, application names, or owners) to organize your costs across multiple services. For more
      # information, see Using Cost Allocation Tags .
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

      # Changes the list of users that belong to the Access Control List.
      def update_acl(
        acl_name : String,
        user_names_to_add : Array(String)? = nil,
        user_names_to_remove : Array(String)? = nil
      ) : Types::UpdateACLResponse
        input = Types::UpdateACLRequest.new(acl_name: acl_name, user_names_to_add: user_names_to_add, user_names_to_remove: user_names_to_remove)
        update_acl(input)
      end
      def update_acl(input : Types::UpdateACLRequest) : Types::UpdateACLResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_ACL, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateACLResponse, "UpdateACL")
      end

      # Modifies the settings for a cluster. You can use this operation to change one or more cluster
      # configuration settings by specifying the settings and the new values.
      def update_cluster(
        cluster_name : String,
        acl_name : String? = nil,
        description : String? = nil,
        engine : String? = nil,
        engine_version : String? = nil,
        ip_discovery : String? = nil,
        maintenance_window : String? = nil,
        node_type : String? = nil,
        parameter_group_name : String? = nil,
        replica_configuration : Types::ReplicaConfigurationRequest? = nil,
        security_group_ids : Array(String)? = nil,
        shard_configuration : Types::ShardConfigurationRequest? = nil,
        snapshot_retention_limit : Int32? = nil,
        snapshot_window : String? = nil,
        sns_topic_arn : String? = nil,
        sns_topic_status : String? = nil
      ) : Types::UpdateClusterResponse
        input = Types::UpdateClusterRequest.new(cluster_name: cluster_name, acl_name: acl_name, description: description, engine: engine, engine_version: engine_version, ip_discovery: ip_discovery, maintenance_window: maintenance_window, node_type: node_type, parameter_group_name: parameter_group_name, replica_configuration: replica_configuration, security_group_ids: security_group_ids, shard_configuration: shard_configuration, snapshot_retention_limit: snapshot_retention_limit, snapshot_window: snapshot_window, sns_topic_arn: sns_topic_arn, sns_topic_status: sns_topic_status)
        update_cluster(input)
      end
      def update_cluster(input : Types::UpdateClusterRequest) : Types::UpdateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterResponse, "UpdateCluster")
      end

      # Updates the configuration of an existing multi-Region cluster.
      def update_multi_region_cluster(
        multi_region_cluster_name : String,
        description : String? = nil,
        engine_version : String? = nil,
        multi_region_parameter_group_name : String? = nil,
        node_type : String? = nil,
        shard_configuration : Types::ShardConfigurationRequest? = nil,
        update_strategy : String? = nil
      ) : Types::UpdateMultiRegionClusterResponse
        input = Types::UpdateMultiRegionClusterRequest.new(multi_region_cluster_name: multi_region_cluster_name, description: description, engine_version: engine_version, multi_region_parameter_group_name: multi_region_parameter_group_name, node_type: node_type, shard_configuration: shard_configuration, update_strategy: update_strategy)
        update_multi_region_cluster(input)
      end
      def update_multi_region_cluster(input : Types::UpdateMultiRegionClusterRequest) : Types::UpdateMultiRegionClusterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_MULTI_REGION_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateMultiRegionClusterResponse, "UpdateMultiRegionCluster")
      end

      # Updates the parameters of a parameter group. You can modify up to 20 parameters in a single request
      # by submitting a list parameter name and value pairs.
      def update_parameter_group(
        parameter_group_name : String,
        parameter_name_values : Array(Types::ParameterNameValue)
      ) : Types::UpdateParameterGroupResponse
        input = Types::UpdateParameterGroupRequest.new(parameter_group_name: parameter_group_name, parameter_name_values: parameter_name_values)
        update_parameter_group(input)
      end
      def update_parameter_group(input : Types::UpdateParameterGroupRequest) : Types::UpdateParameterGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateParameterGroupResponse, "UpdateParameterGroup")
      end

      # Updates a subnet group. For more information, see Updating a subnet group
      def update_subnet_group(
        subnet_group_name : String,
        description : String? = nil,
        subnet_ids : Array(String)? = nil
      ) : Types::UpdateSubnetGroupResponse
        input = Types::UpdateSubnetGroupRequest.new(subnet_group_name: subnet_group_name, description: description, subnet_ids: subnet_ids)
        update_subnet_group(input)
      end
      def update_subnet_group(input : Types::UpdateSubnetGroupRequest) : Types::UpdateSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSubnetGroupResponse, "UpdateSubnetGroup")
      end

      # Changes user password(s) and/or access string.
      def update_user(
        user_name : String,
        access_string : String? = nil,
        authentication_mode : Types::AuthenticationMode? = nil
      ) : Types::UpdateUserResponse
        input = Types::UpdateUserRequest.new(user_name: user_name, access_string: access_string, authentication_mode: authentication_mode)
        update_user(input)
      end
      def update_user(input : Types::UpdateUserRequest) : Types::UpdateUserResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_USER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateUserResponse, "UpdateUser")
      end
    end
  end
end
