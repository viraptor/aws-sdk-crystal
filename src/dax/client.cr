module Aws
  module DAX
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

      # Creates a DAX cluster. All nodes in the cluster run the same DAX caching software.

      def create_cluster(
        cluster_name : String,
        iam_role_arn : String,
        node_type : String,
        replication_factor : Int32,
        availability_zones : Array(String)? = nil,
        cluster_endpoint_encryption_type : String? = nil,
        description : String? = nil,
        network_type : String? = nil,
        notification_topic_arn : String? = nil,
        parameter_group_name : String? = nil,
        preferred_maintenance_window : String? = nil,
        sse_specification : Types::SSESpecification? = nil,
        security_group_ids : Array(String)? = nil,
        subnet_group_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateClusterResponse

        input = Types::CreateClusterRequest.new(cluster_name: cluster_name, iam_role_arn: iam_role_arn, node_type: node_type, replication_factor: replication_factor, availability_zones: availability_zones, cluster_endpoint_encryption_type: cluster_endpoint_encryption_type, description: description, network_type: network_type, notification_topic_arn: notification_topic_arn, parameter_group_name: parameter_group_name, preferred_maintenance_window: preferred_maintenance_window, sse_specification: sse_specification, security_group_ids: security_group_ids, subnet_group_name: subnet_group_name, tags: tags)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResponse, "CreateCluster")
      end

      # Creates a new parameter group. A parameter group is a collection of parameters that you apply to all
      # of the nodes in a DAX cluster.

      def create_parameter_group(
        parameter_group_name : String,
        description : String? = nil
      ) : Types::CreateParameterGroupResponse

        input = Types::CreateParameterGroupRequest.new(parameter_group_name: parameter_group_name, description: description)
        create_parameter_group(input)
      end

      def create_parameter_group(input : Types::CreateParameterGroupRequest) : Types::CreateParameterGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateParameterGroupResponse, "CreateParameterGroup")
      end

      # Creates a new subnet group.

      def create_subnet_group(
        subnet_group_name : String,
        subnet_ids : Array(String),
        description : String? = nil
      ) : Types::CreateSubnetGroupResponse

        input = Types::CreateSubnetGroupRequest.new(subnet_group_name: subnet_group_name, subnet_ids: subnet_ids, description: description)
        create_subnet_group(input)
      end

      def create_subnet_group(input : Types::CreateSubnetGroupRequest) : Types::CreateSubnetGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SUBNET_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSubnetGroupResponse, "CreateSubnetGroup")
      end

      # Removes one or more nodes from a DAX cluster. You cannot use DecreaseReplicationFactor to remove the
      # last node in a DAX cluster. If you need to do this, use DeleteCluster instead.

      def decrease_replication_factor(
        cluster_name : String,
        new_replication_factor : Int32,
        availability_zones : Array(String)? = nil,
        node_ids_to_remove : Array(String)? = nil
      ) : Types::DecreaseReplicationFactorResponse

        input = Types::DecreaseReplicationFactorRequest.new(cluster_name: cluster_name, new_replication_factor: new_replication_factor, availability_zones: availability_zones, node_ids_to_remove: node_ids_to_remove)
        decrease_replication_factor(input)
      end

      def decrease_replication_factor(input : Types::DecreaseReplicationFactorRequest) : Types::DecreaseReplicationFactorResponse
        request = Protocol::JsonRpc.build_request(Model::DECREASE_REPLICATION_FACTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DecreaseReplicationFactorResponse, "DecreaseReplicationFactor")
      end

      # Deletes a previously provisioned DAX cluster. DeleteCluster deletes all associated nodes, node
      # endpoints and the DAX cluster itself. When you receive a successful response from this action, DAX
      # immediately begins deleting the cluster; you cannot cancel or revert this action.

      def delete_cluster(
        cluster_name : String
      ) : Types::DeleteClusterResponse

        input = Types::DeleteClusterRequest.new(cluster_name: cluster_name)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterRequest) : Types::DeleteClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClusterResponse, "DeleteCluster")
      end

      # Deletes the specified parameter group. You cannot delete a parameter group if it is associated with
      # any DAX clusters.

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

      # Deletes a subnet group. You cannot delete a subnet group if it is associated with any DAX clusters.

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

      # Returns information about all provisioned DAX clusters if no cluster identifier is specified, or
      # about a specific DAX cluster if a cluster identifier is supplied. If the cluster is in the CREATING
      # state, only cluster level information will be displayed until all of the nodes are successfully
      # provisioned. If the cluster is in the DELETING state, only cluster level information will be
      # displayed. If nodes are currently being added to the DAX cluster, node endpoint information and
      # creation time for the additional nodes will not be displayed until they are completely provisioned.
      # When the DAX cluster state is available , the cluster is ready for use. If nodes are currently being
      # removed from the DAX cluster, no endpoint information for the removed nodes is displayed.

      def describe_clusters(
        cluster_names : Array(String)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeClustersResponse

        input = Types::DescribeClustersRequest.new(cluster_names: cluster_names, max_results: max_results, next_token: next_token)
        describe_clusters(input)
      end

      def describe_clusters(input : Types::DescribeClustersRequest) : Types::DescribeClustersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeClustersResponse, "DescribeClusters")
      end

      # Returns the default system parameter information for the DAX caching software.

      def describe_default_parameters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::DescribeDefaultParametersResponse

        input = Types::DescribeDefaultParametersRequest.new(max_results: max_results, next_token: next_token)
        describe_default_parameters(input)
      end

      def describe_default_parameters(input : Types::DescribeDefaultParametersRequest) : Types::DescribeDefaultParametersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_DEFAULT_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeDefaultParametersResponse, "DescribeDefaultParameters")
      end

      # Returns events related to DAX clusters and parameter groups. You can obtain events specific to a
      # particular DAX cluster or parameter group by providing the name as a parameter. By default, only the
      # events occurring within the last 24 hours are returned; however, you can retrieve up to 14 days'
      # worth of events if necessary.

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

      # Returns a list of parameter group descriptions. If a parameter group name is specified, the list
      # will contain only the descriptions for that group.

      def describe_parameter_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        parameter_group_names : Array(String)? = nil
      ) : Types::DescribeParameterGroupsResponse

        input = Types::DescribeParameterGroupsRequest.new(max_results: max_results, next_token: next_token, parameter_group_names: parameter_group_names)
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
        next_token : String? = nil,
        source : String? = nil
      ) : Types::DescribeParametersResponse

        input = Types::DescribeParametersRequest.new(parameter_group_name: parameter_group_name, max_results: max_results, next_token: next_token, source: source)
        describe_parameters(input)
      end

      def describe_parameters(input : Types::DescribeParametersRequest) : Types::DescribeParametersResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_PARAMETERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeParametersResponse, "DescribeParameters")
      end

      # Returns a list of subnet group descriptions. If a subnet group name is specified, the list will
      # contain only the description of that group.

      def describe_subnet_groups(
        max_results : Int32? = nil,
        next_token : String? = nil,
        subnet_group_names : Array(String)? = nil
      ) : Types::DescribeSubnetGroupsResponse

        input = Types::DescribeSubnetGroupsRequest.new(max_results: max_results, next_token: next_token, subnet_group_names: subnet_group_names)
        describe_subnet_groups(input)
      end

      def describe_subnet_groups(input : Types::DescribeSubnetGroupsRequest) : Types::DescribeSubnetGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_SUBNET_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeSubnetGroupsResponse, "DescribeSubnetGroups")
      end

      # Adds one or more nodes to a DAX cluster.

      def increase_replication_factor(
        cluster_name : String,
        new_replication_factor : Int32,
        availability_zones : Array(String)? = nil
      ) : Types::IncreaseReplicationFactorResponse

        input = Types::IncreaseReplicationFactorRequest.new(cluster_name: cluster_name, new_replication_factor: new_replication_factor, availability_zones: availability_zones)
        increase_replication_factor(input)
      end

      def increase_replication_factor(input : Types::IncreaseReplicationFactorRequest) : Types::IncreaseReplicationFactorResponse
        request = Protocol::JsonRpc.build_request(Model::INCREASE_REPLICATION_FACTOR, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::IncreaseReplicationFactorResponse, "IncreaseReplicationFactor")
      end

      # List all of the tags for a DAX cluster. You can call ListTags up to 10 times per second, per
      # account.

      def list_tags(
        resource_name : String,
        next_token : String? = nil
      ) : Types::ListTagsResponse

        input = Types::ListTagsRequest.new(resource_name: resource_name, next_token: next_token)
        list_tags(input)
      end

      def list_tags(input : Types::ListTagsRequest) : Types::ListTagsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsResponse, "ListTags")
      end

      # Reboots a single node of a DAX cluster. The reboot action takes place as soon as possible. During
      # the reboot, the node status is set to REBOOTING. RebootNode restarts the DAX engine process and does
      # not remove the contents of the cache.

      def reboot_node(
        cluster_name : String,
        node_id : String
      ) : Types::RebootNodeResponse

        input = Types::RebootNodeRequest.new(cluster_name: cluster_name, node_id: node_id)
        reboot_node(input)
      end

      def reboot_node(input : Types::RebootNodeRequest) : Types::RebootNodeResponse
        request = Protocol::JsonRpc.build_request(Model::REBOOT_NODE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootNodeResponse, "RebootNode")
      end

      # Associates a set of tags with a DAX resource. You can call TagResource up to 5 times per second, per
      # account.

      def tag_resource(
        resource_name : String,
        tags : Array(Types::Tag)
      ) : Types::TagResourceResponse

        input = Types::TagResourceRequest.new(resource_name: resource_name, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Types::TagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::TagResourceResponse, "TagResource")
      end

      # Removes the association of tags from a DAX resource. You can call UntagResource up to 5 times per
      # second, per account.

      def untag_resource(
        resource_name : String,
        tag_keys : Array(String)
      ) : Types::UntagResourceResponse

        input = Types::UntagResourceRequest.new(resource_name: resource_name, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Types::UntagResourceResponse
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UntagResourceResponse, "UntagResource")
      end

      # Modifies the settings for a DAX cluster. You can use this action to change one or more cluster
      # configuration parameters by specifying the parameters and the new values.

      def update_cluster(
        cluster_name : String,
        description : String? = nil,
        notification_topic_arn : String? = nil,
        notification_topic_status : String? = nil,
        parameter_group_name : String? = nil,
        preferred_maintenance_window : String? = nil,
        security_group_ids : Array(String)? = nil
      ) : Types::UpdateClusterResponse

        input = Types::UpdateClusterRequest.new(cluster_name: cluster_name, description: description, notification_topic_arn: notification_topic_arn, notification_topic_status: notification_topic_status, parameter_group_name: parameter_group_name, preferred_maintenance_window: preferred_maintenance_window, security_group_ids: security_group_ids)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterRequest) : Types::UpdateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterResponse, "UpdateCluster")
      end

      # Modifies the parameters of a parameter group. You can modify up to 20 parameters in a single request
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

      # Modifies an existing subnet group.

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
    end
  end
end
