module AwsSdk
  module TimestreamInfluxDB
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

      # Creates a new Timestream for InfluxDB cluster.
      def create_db_cluster(
        db_instance_type : String,
        name : String,
        vpc_security_group_ids : Array(String),
        vpc_subnet_ids : Array(String),
        allocated_storage : Int32? = nil,
        bucket : String? = nil,
        db_parameter_group_identifier : String? = nil,
        db_storage_type : String? = nil,
        deployment_type : String? = nil,
        failover_mode : String? = nil,
        log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
        network_type : String? = nil,
        organization : String? = nil,
        password : String? = nil,
        port : Int32? = nil,
        publicly_accessible : Bool? = nil,
        tags : Hash(String, String)? = nil,
        username : String? = nil
      ) : Types::CreateDbClusterOutput
        input = Types::CreateDbClusterInput.new(db_instance_type: db_instance_type, name: name, vpc_security_group_ids: vpc_security_group_ids, vpc_subnet_ids: vpc_subnet_ids, allocated_storage: allocated_storage, bucket: bucket, db_parameter_group_identifier: db_parameter_group_identifier, db_storage_type: db_storage_type, deployment_type: deployment_type, failover_mode: failover_mode, log_delivery_configuration: log_delivery_configuration, network_type: network_type, organization: organization, password: password, port: port, publicly_accessible: publicly_accessible, tags: tags, username: username)
        create_db_cluster(input)
      end
      def create_db_cluster(input : Types::CreateDbClusterInput) : Types::CreateDbClusterOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDbClusterOutput, "CreateDbCluster")
      end

      # Creates a new Timestream for InfluxDB DB instance.
      def create_db_instance(
        allocated_storage : Int32,
        db_instance_type : String,
        name : String,
        password : String,
        vpc_security_group_ids : Array(String),
        vpc_subnet_ids : Array(String),
        bucket : String? = nil,
        db_parameter_group_identifier : String? = nil,
        db_storage_type : String? = nil,
        deployment_type : String? = nil,
        log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
        network_type : String? = nil,
        organization : String? = nil,
        port : Int32? = nil,
        publicly_accessible : Bool? = nil,
        tags : Hash(String, String)? = nil,
        username : String? = nil
      ) : Types::CreateDbInstanceOutput
        input = Types::CreateDbInstanceInput.new(allocated_storage: allocated_storage, db_instance_type: db_instance_type, name: name, password: password, vpc_security_group_ids: vpc_security_group_ids, vpc_subnet_ids: vpc_subnet_ids, bucket: bucket, db_parameter_group_identifier: db_parameter_group_identifier, db_storage_type: db_storage_type, deployment_type: deployment_type, log_delivery_configuration: log_delivery_configuration, network_type: network_type, organization: organization, port: port, publicly_accessible: publicly_accessible, tags: tags, username: username)
        create_db_instance(input)
      end
      def create_db_instance(input : Types::CreateDbInstanceInput) : Types::CreateDbInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDbInstanceOutput, "CreateDbInstance")
      end

      # Creates a new Timestream for InfluxDB DB parameter group to associate with DB instances.
      def create_db_parameter_group(
        name : String,
        description : String? = nil,
        parameters : Types::Parameters? = nil,
        tags : Hash(String, String)? = nil
      ) : Types::CreateDbParameterGroupOutput
        input = Types::CreateDbParameterGroupInput.new(name: name, description: description, parameters: parameters, tags: tags)
        create_db_parameter_group(input)
      end
      def create_db_parameter_group(input : Types::CreateDbParameterGroupInput) : Types::CreateDbParameterGroupOutput
        request = Protocol::JsonRpc.build_request(Model::CREATE_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateDbParameterGroupOutput, "CreateDbParameterGroup")
      end

      # Deletes a Timestream for InfluxDB cluster.
      def delete_db_cluster(
        db_cluster_id : String
      ) : Types::DeleteDbClusterOutput
        input = Types::DeleteDbClusterInput.new(db_cluster_id: db_cluster_id)
        delete_db_cluster(input)
      end
      def delete_db_cluster(input : Types::DeleteDbClusterInput) : Types::DeleteDbClusterOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDbClusterOutput, "DeleteDbCluster")
      end

      # Deletes a Timestream for InfluxDB DB instance.
      def delete_db_instance(
        identifier : String
      ) : Types::DeleteDbInstanceOutput
        input = Types::DeleteDbInstanceInput.new(identifier: identifier)
        delete_db_instance(input)
      end
      def delete_db_instance(input : Types::DeleteDbInstanceInput) : Types::DeleteDbInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::DELETE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteDbInstanceOutput, "DeleteDbInstance")
      end

      # Retrieves information about a Timestream for InfluxDB cluster.
      def get_db_cluster(
        db_cluster_id : String
      ) : Types::GetDbClusterOutput
        input = Types::GetDbClusterInput.new(db_cluster_id: db_cluster_id)
        get_db_cluster(input)
      end
      def get_db_cluster(input : Types::GetDbClusterInput) : Types::GetDbClusterOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDbClusterOutput, "GetDbCluster")
      end

      # Returns a Timestream for InfluxDB DB instance.
      def get_db_instance(
        identifier : String
      ) : Types::GetDbInstanceOutput
        input = Types::GetDbInstanceInput.new(identifier: identifier)
        get_db_instance(input)
      end
      def get_db_instance(input : Types::GetDbInstanceInput) : Types::GetDbInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDbInstanceOutput, "GetDbInstance")
      end

      # Returns a Timestream for InfluxDB DB parameter group.
      def get_db_parameter_group(
        identifier : String
      ) : Types::GetDbParameterGroupOutput
        input = Types::GetDbParameterGroupInput.new(identifier: identifier)
        get_db_parameter_group(input)
      end
      def get_db_parameter_group(input : Types::GetDbParameterGroupInput) : Types::GetDbParameterGroupOutput
        request = Protocol::JsonRpc.build_request(Model::GET_DB_PARAMETER_GROUP, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetDbParameterGroupOutput, "GetDbParameterGroup")
      end

      # Returns a list of Timestream for InfluxDB DB clusters.
      def list_db_clusters(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbClustersOutput
        input = Types::ListDbClustersInput.new(max_results: max_results, next_token: next_token)
        list_db_clusters(input)
      end
      def list_db_clusters(input : Types::ListDbClustersInput) : Types::ListDbClustersOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_CLUSTERS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbClustersOutput, "ListDbClusters")
      end

      # Returns a list of Timestream for InfluxDB DB instances.
      def list_db_instances(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbInstancesOutput
        input = Types::ListDbInstancesInput.new(max_results: max_results, next_token: next_token)
        list_db_instances(input)
      end
      def list_db_instances(input : Types::ListDbInstancesInput) : Types::ListDbInstancesOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbInstancesOutput, "ListDbInstances")
      end

      # Returns a list of Timestream for InfluxDB clusters.
      def list_db_instances_for_cluster(
        db_cluster_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbInstancesForClusterOutput
        input = Types::ListDbInstancesForClusterInput.new(db_cluster_id: db_cluster_id, max_results: max_results, next_token: next_token)
        list_db_instances_for_cluster(input)
      end
      def list_db_instances_for_cluster(input : Types::ListDbInstancesForClusterInput) : Types::ListDbInstancesForClusterOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_INSTANCES_FOR_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbInstancesForClusterOutput, "ListDbInstancesForCluster")
      end

      # Returns a list of Timestream for InfluxDB DB parameter groups.
      def list_db_parameter_groups(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListDbParameterGroupsOutput
        input = Types::ListDbParameterGroupsInput.new(max_results: max_results, next_token: next_token)
        list_db_parameter_groups(input)
      end
      def list_db_parameter_groups(input : Types::ListDbParameterGroupsInput) : Types::ListDbParameterGroupsOutput
        request = Protocol::JsonRpc.build_request(Model::LIST_DB_PARAMETER_GROUPS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListDbParameterGroupsOutput, "ListDbParameterGroups")
      end

      # A list of tags applied to the resource.
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

      # Reboots a Timestream for InfluxDB cluster.
      def reboot_db_cluster(
        db_cluster_id : String,
        instance_ids : Array(String)? = nil
      ) : Types::RebootDbClusterOutput
        input = Types::RebootDbClusterInput.new(db_cluster_id: db_cluster_id, instance_ids: instance_ids)
        reboot_db_cluster(input)
      end
      def reboot_db_cluster(input : Types::RebootDbClusterInput) : Types::RebootDbClusterOutput
        request = Protocol::JsonRpc.build_request(Model::REBOOT_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootDbClusterOutput, "RebootDbCluster")
      end

      # Reboots a Timestream for InfluxDB instance.
      def reboot_db_instance(
        identifier : String
      ) : Types::RebootDbInstanceOutput
        input = Types::RebootDbInstanceInput.new(identifier: identifier)
        reboot_db_instance(input)
      end
      def reboot_db_instance(input : Types::RebootDbInstanceInput) : Types::RebootDbInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::REBOOT_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::RebootDbInstanceOutput, "RebootDbInstance")
      end

      # Tags are composed of a Key/Value pairs. You can use tags to categorize and track your Timestream for
      # InfluxDB resources.
      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Nil
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end
      def tag_resource(input : Types::TagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::TAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Removes the tag from the specified resource.
      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Nil
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end
      def untag_resource(input : Types::UntagResourceRequest) : Nil
        request = Protocol::JsonRpc.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        nil
      end

      # Updates a Timestream for InfluxDB cluster.
      def update_db_cluster(
        db_cluster_id : String,
        db_instance_type : String? = nil,
        db_parameter_group_identifier : String? = nil,
        failover_mode : String? = nil,
        log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
        port : Int32? = nil
      ) : Types::UpdateDbClusterOutput
        input = Types::UpdateDbClusterInput.new(db_cluster_id: db_cluster_id, db_instance_type: db_instance_type, db_parameter_group_identifier: db_parameter_group_identifier, failover_mode: failover_mode, log_delivery_configuration: log_delivery_configuration, port: port)
        update_db_cluster(input)
      end
      def update_db_cluster(input : Types::UpdateDbClusterInput) : Types::UpdateDbClusterOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DB_CLUSTER, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDbClusterOutput, "UpdateDbCluster")
      end

      # Updates a Timestream for InfluxDB DB instance.
      def update_db_instance(
        identifier : String,
        allocated_storage : Int32? = nil,
        db_instance_type : String? = nil,
        db_parameter_group_identifier : String? = nil,
        db_storage_type : String? = nil,
        deployment_type : String? = nil,
        log_delivery_configuration : Types::LogDeliveryConfiguration? = nil,
        port : Int32? = nil
      ) : Types::UpdateDbInstanceOutput
        input = Types::UpdateDbInstanceInput.new(identifier: identifier, allocated_storage: allocated_storage, db_instance_type: db_instance_type, db_parameter_group_identifier: db_parameter_group_identifier, db_storage_type: db_storage_type, deployment_type: deployment_type, log_delivery_configuration: log_delivery_configuration, port: port)
        update_db_instance(input)
      end
      def update_db_instance(input : Types::UpdateDbInstanceInput) : Types::UpdateDbInstanceOutput
        request = Protocol::JsonRpc.build_request(Model::UPDATE_DB_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateDbInstanceOutput, "UpdateDbInstance")
      end
    end
  end
end
