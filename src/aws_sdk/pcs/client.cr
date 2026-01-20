module AwsSdk
  module PCS
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

      # Creates a cluster in your account. PCS creates the cluster controller in a service-owned account.
      # The cluster controller communicates with the cluster resources in your account. The subnets and
      # security groups for the cluster must already exist before you use this API action. It takes time for
      # PCS to create the cluster. The cluster is in a Creating state until it is ready to use. There can
      # only be 1 cluster in a Creating state per Amazon Web Services Region per Amazon Web Services
      # account. CreateCluster fails with a ServiceQuotaExceededException if there is already a cluster in a
      # Creating state.

      def create_cluster(
        cluster_name : String,
        networking : Types::NetworkingRequest,
        scheduler : Types::SchedulerRequest,
        size : String,
        client_token : String? = nil,
        slurm_configuration : Types::ClusterSlurmConfigurationRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateClusterResponse

        input = Types::CreateClusterRequest.new(cluster_name: cluster_name, networking: networking, scheduler: scheduler, size: size, client_token: client_token, slurm_configuration: slurm_configuration, tags: tags)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterRequest) : Types::CreateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateClusterResponse, "CreateCluster")
      end

      # Creates a managed set of compute nodes. You associate a compute node group with a cluster through 1
      # or more PCS queues or as part of the login fleet. A compute node group includes the definition of
      # the compute properties and lifecycle management. PCS uses the information you provide to this API
      # action to launch compute nodes in your account. You can only specify subnets in the same Amazon VPC
      # as your cluster. You receive billing charges for the compute nodes that PCS launches in your
      # account. You must already have a launch template before you call this API. For more information, see
      # Launch an instance from a launch template in the Amazon Elastic Compute Cloud User Guide for Linux
      # Instances .

      def create_compute_node_group(
        cluster_identifier : String,
        compute_node_group_name : String,
        custom_launch_template : Types::CustomLaunchTemplate,
        iam_instance_profile_arn : String,
        instance_configs : Array(Types::InstanceConfig),
        scaling_configuration : Types::ScalingConfigurationRequest,
        subnet_ids : Array(String),
        ami_id : String? = nil,
        client_token : String? = nil,
        purchase_option : String? = nil,
        slurm_configuration : Types::ComputeNodeGroupSlurmConfigurationRequest? = nil,
        spot_options : Types::SpotOptions? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateComputeNodeGroupResponse

        input = Types::CreateComputeNodeGroupRequest.new(cluster_identifier: cluster_identifier, compute_node_group_name: compute_node_group_name, custom_launch_template: custom_launch_template, iam_instance_profile_arn: iam_instance_profile_arn, instance_configs: instance_configs, scaling_configuration: scaling_configuration, subnet_ids: subnet_ids, ami_id: ami_id, client_token: client_token, purchase_option: purchase_option, slurm_configuration: slurm_configuration, spot_options: spot_options, tags: tags)
        create_compute_node_group(input)
      end

      def create_compute_node_group(input : Types::CreateComputeNodeGroupRequest) : Types::CreateComputeNodeGroupResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_COMPUTE_NODE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateComputeNodeGroupResponse, "CreateComputeNodeGroup")
      end

      # Creates a job queue. You must associate 1 or more compute node groups with the queue. You can
      # associate 1 compute node group with multiple queues.

      def create_queue(
        cluster_identifier : String,
        queue_name : String,
        client_token : String? = nil,
        compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)? = nil,
        slurm_configuration : Types::QueueSlurmConfigurationRequest? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateQueueResponse

        input = Types::CreateQueueRequest.new(cluster_identifier: cluster_identifier, queue_name: queue_name, client_token: client_token, compute_node_group_configurations: compute_node_group_configurations, slurm_configuration: slurm_configuration, tags: tags)
        create_queue(input)
      end

      def create_queue(input : Types::CreateQueueRequest) : Types::CreateQueueResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateQueueResponse, "CreateQueue")
      end

      # Deletes a cluster and all its linked resources. You must delete all queues and compute node groups
      # associated with the cluster before you can delete the cluster.

      def delete_cluster(
        cluster_identifier : String,
        client_token : String? = nil
      ) : Types::DeleteClusterResponse

        input = Types::DeleteClusterRequest.new(cluster_identifier: cluster_identifier, client_token: client_token)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterRequest) : Types::DeleteClusterResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteClusterResponse, "DeleteCluster")
      end

      # Deletes a compute node group. You must delete all queues associated with the compute node group
      # first.

      def delete_compute_node_group(
        cluster_identifier : String,
        compute_node_group_identifier : String,
        client_token : String? = nil
      ) : Types::DeleteComputeNodeGroupResponse

        input = Types::DeleteComputeNodeGroupRequest.new(cluster_identifier: cluster_identifier, compute_node_group_identifier: compute_node_group_identifier, client_token: client_token)
        delete_compute_node_group(input)
      end

      def delete_compute_node_group(input : Types::DeleteComputeNodeGroupRequest) : Types::DeleteComputeNodeGroupResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_COMPUTE_NODE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteComputeNodeGroupResponse, "DeleteComputeNodeGroup")
      end

      # Deletes a job queue. If the compute node group associated with this queue isn't associated with any
      # other queues, PCS terminates all the compute nodes for this queue.

      def delete_queue(
        cluster_identifier : String,
        queue_identifier : String,
        client_token : String? = nil
      ) : Types::DeleteQueueResponse

        input = Types::DeleteQueueRequest.new(cluster_identifier: cluster_identifier, queue_identifier: queue_identifier, client_token: client_token)
        delete_queue(input)
      end

      def delete_queue(input : Types::DeleteQueueRequest) : Types::DeleteQueueResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteQueueResponse, "DeleteQueue")
      end

      # Returns detailed information about a running cluster in your account. This API action provides
      # networking information, endpoint information for communication with the scheduler, and provisioning
      # status.

      def get_cluster(
        cluster_identifier : String
      ) : Types::GetClusterResponse

        input = Types::GetClusterRequest.new(cluster_identifier: cluster_identifier)
        get_cluster(input)
      end

      def get_cluster(input : Types::GetClusterRequest) : Types::GetClusterResponse
        request = Protocol::JsonRpc.build_request(Model::GET_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetClusterResponse, "GetCluster")
      end

      # Returns detailed information about a compute node group. This API action provides networking
      # information, EC2 instance type, compute node group status, and scheduler (such as Slurm)
      # configuration.

      def get_compute_node_group(
        cluster_identifier : String,
        compute_node_group_identifier : String
      ) : Types::GetComputeNodeGroupResponse

        input = Types::GetComputeNodeGroupRequest.new(cluster_identifier: cluster_identifier, compute_node_group_identifier: compute_node_group_identifier)
        get_compute_node_group(input)
      end

      def get_compute_node_group(input : Types::GetComputeNodeGroupRequest) : Types::GetComputeNodeGroupResponse
        request = Protocol::JsonRpc.build_request(Model::GET_COMPUTE_NODE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetComputeNodeGroupResponse, "GetComputeNodeGroup")
      end

      # Returns detailed information about a queue. The information includes the compute node groups that
      # the queue uses to schedule jobs.

      def get_queue(
        cluster_identifier : String,
        queue_identifier : String
      ) : Types::GetQueueResponse

        input = Types::GetQueueRequest.new(cluster_identifier: cluster_identifier, queue_identifier: queue_identifier)
        get_queue(input)
      end

      def get_queue(input : Types::GetQueueRequest) : Types::GetQueueResponse
        request = Protocol::JsonRpc.build_request(Model::GET_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetQueueResponse, "GetQueue")
      end

      # Returns a list of running clusters in your account.

      def list_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListClustersResponse

        input = Types::ListClustersRequest.new(max_results: max_results, next_token: next_token)
        list_clusters(input)
      end

      def list_clusters(input : Types::ListClustersRequest) : Types::ListClustersResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListClustersResponse, "ListClusters")
      end

      # Returns a list of all compute node groups associated with a cluster.

      def list_compute_node_groups(
        cluster_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListComputeNodeGroupsResponse

        input = Types::ListComputeNodeGroupsRequest.new(cluster_identifier: cluster_identifier, max_results: max_results, next_token: next_token)
        list_compute_node_groups(input)
      end

      def list_compute_node_groups(input : Types::ListComputeNodeGroupsRequest) : Types::ListComputeNodeGroupsResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_COMPUTE_NODE_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListComputeNodeGroupsResponse, "ListComputeNodeGroups")
      end

      # Returns a list of all queues associated with a cluster.

      def list_queues(
        cluster_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListQueuesResponse

        input = Types::ListQueuesRequest.new(cluster_identifier: cluster_identifier, max_results: max_results, next_token: next_token)
        list_queues(input)
      end

      def list_queues(input : Types::ListQueuesRequest) : Types::ListQueuesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_QUEUES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListQueuesResponse, "ListQueues")
      end

      # Returns a list of all tags on an PCS resource.

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

      # This API action isn't intended for you to use. PCS uses this API action to register the compute
      # nodes it launches in your account.

      def register_compute_node_group_instance(
        bootstrap_id : String,
        cluster_identifier : String
      ) : Types::RegisterComputeNodeGroupInstanceResponse

        input = Types::RegisterComputeNodeGroupInstanceRequest.new(bootstrap_id: bootstrap_id, cluster_identifier: cluster_identifier)
        register_compute_node_group_instance(input)
      end

      def register_compute_node_group_instance(input : Types::RegisterComputeNodeGroupInstanceRequest) : Types::RegisterComputeNodeGroupInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::REGISTER_COMPUTE_NODE_GROUP_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RegisterComputeNodeGroupInstanceResponse, "RegisterComputeNodeGroupInstance")
      end

      # Adds or edits tags on an PCS resource. Each tag consists of a tag key and a tag value. The tag key
      # and tag value are case-sensitive strings. The tag value can be an empty (null) string. To add a tag,
      # specify a new tag key and a tag value. To edit a tag, specify an existing tag key and a new tag
      # value.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
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

      # Deletes tags from an PCS resource. To delete a tag, specify the tag key and the Amazon Resource Name
      # (ARN) of the PCS resource.

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

      # Updates a cluster configuration. You can modify Slurm scheduler settings, accounting configuration,
      # and security groups for an existing cluster. You can only update clusters that are in ACTIVE ,
      # UPDATE_FAILED , or SUSPENDED state. All associated resources (queues and compute node groups) must
      # be in ACTIVE state before you can update the cluster.

      def update_cluster(
        cluster_identifier : String,
        client_token : String? = nil,
        slurm_configuration : Types::UpdateClusterSlurmConfigurationRequest? = nil
      ) : Types::UpdateClusterResponse

        input = Types::UpdateClusterRequest.new(cluster_identifier: cluster_identifier, client_token: client_token, slurm_configuration: slurm_configuration)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterRequest) : Types::UpdateClusterResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateClusterResponse, "UpdateCluster")
      end

      # Updates a compute node group. You can update many of the fields related to your compute node group
      # including the configurations for networking, compute nodes, and settings specific to your scheduler
      # (such as Slurm).

      def update_compute_node_group(
        cluster_identifier : String,
        compute_node_group_identifier : String,
        ami_id : String? = nil,
        client_token : String? = nil,
        custom_launch_template : Types::CustomLaunchTemplate? = nil,
        iam_instance_profile_arn : String? = nil,
        purchase_option : String? = nil,
        scaling_configuration : Types::ScalingConfigurationRequest? = nil,
        slurm_configuration : Types::UpdateComputeNodeGroupSlurmConfigurationRequest? = nil,
        spot_options : Types::SpotOptions? = nil,
        subnet_ids : Array(String)? = nil
      ) : Types::UpdateComputeNodeGroupResponse

        input = Types::UpdateComputeNodeGroupRequest.new(cluster_identifier: cluster_identifier, compute_node_group_identifier: compute_node_group_identifier, ami_id: ami_id, client_token: client_token, custom_launch_template: custom_launch_template, iam_instance_profile_arn: iam_instance_profile_arn, purchase_option: purchase_option, scaling_configuration: scaling_configuration, slurm_configuration: slurm_configuration, spot_options: spot_options, subnet_ids: subnet_ids)
        update_compute_node_group(input)
      end

      def update_compute_node_group(input : Types::UpdateComputeNodeGroupRequest) : Types::UpdateComputeNodeGroupResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_COMPUTE_NODE_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateComputeNodeGroupResponse, "UpdateComputeNodeGroup")
      end

      # Updates the compute node group configuration of a queue. Use this API to change the compute node
      # groups that the queue can send jobs to.

      def update_queue(
        cluster_identifier : String,
        queue_identifier : String,
        client_token : String? = nil,
        compute_node_group_configurations : Array(Types::ComputeNodeGroupConfiguration)? = nil,
        slurm_configuration : Types::UpdateQueueSlurmConfigurationRequest? = nil
      ) : Types::UpdateQueueResponse

        input = Types::UpdateQueueRequest.new(cluster_identifier: cluster_identifier, queue_identifier: queue_identifier, client_token: client_token, compute_node_group_configurations: compute_node_group_configurations, slurm_configuration: slurm_configuration)
        update_queue(input)
      end

      def update_queue(input : Types::UpdateQueueRequest) : Types::UpdateQueueResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_QUEUE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateQueueResponse, "UpdateQueue")
      end
    end
  end
end
