module Aws
  module Finspace
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
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Create a new FinSpace environment.

      def create_environment(
        name : String,
        data_bundles : Array(String)? = nil,
        description : String? = nil,
        federation_mode : String? = nil,
        federation_parameters : Types::FederationParameters? = nil,
        kms_key_id : String? = nil,
        superuser_parameters : Types::SuperuserParameters? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentRequest.new(name: name, data_bundles: data_bundles, description: description, federation_mode: federation_mode, federation_parameters: federation_parameters, kms_key_id: kms_key_id, superuser_parameters: superuser_parameters, tags: tags)
        create_environment(input)
      end

      def create_environment(input : Types::CreateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a changeset for a kdb database. A changeset allows you to add and delete existing files by
      # using an ordered list of change requests.

      def create_kx_changeset(
        change_requests : Array(Types::ChangeRequest),
        client_token : String,
        database_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::CreateKxChangesetRequest.new(change_requests: change_requests, client_token: client_token, database_name: database_name, environment_id: environment_id)
        create_kx_changeset(input)
      end

      def create_kx_changeset(input : Types::CreateKxChangesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_CHANGESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new kdb cluster.

      def create_kx_cluster(
        az_mode : String,
        cluster_name : String,
        cluster_type : String,
        environment_id : String,
        release_label : String,
        vpc_configuration : Types::VpcConfiguration,
        auto_scaling_configuration : Types::AutoScalingConfiguration? = nil,
        availability_zone_id : String? = nil,
        cache_storage_configurations : Array(Types::KxCacheStorageConfiguration)? = nil,
        capacity_configuration : Types::CapacityConfiguration? = nil,
        client_token : String? = nil,
        cluster_description : String? = nil,
        code : Types::CodeConfiguration? = nil,
        command_line_arguments : Array(Types::KxCommandLineArgument)? = nil,
        databases : Array(Types::KxDatabaseConfiguration)? = nil,
        execution_role : String? = nil,
        initialization_script : String? = nil,
        savedown_storage_configuration : Types::KxSavedownStorageConfiguration? = nil,
        scaling_group_configuration : Types::KxScalingGroupConfiguration? = nil,
        tags : Hash(String, String)? = nil,
        tickerplant_log_configuration : Types::TickerplantLogConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateKxClusterRequest.new(az_mode: az_mode, cluster_name: cluster_name, cluster_type: cluster_type, environment_id: environment_id, release_label: release_label, vpc_configuration: vpc_configuration, auto_scaling_configuration: auto_scaling_configuration, availability_zone_id: availability_zone_id, cache_storage_configurations: cache_storage_configurations, capacity_configuration: capacity_configuration, client_token: client_token, cluster_description: cluster_description, code: code, command_line_arguments: command_line_arguments, databases: databases, execution_role: execution_role, initialization_script: initialization_script, savedown_storage_configuration: savedown_storage_configuration, scaling_group_configuration: scaling_group_configuration, tags: tags, tickerplant_log_configuration: tickerplant_log_configuration)
        create_kx_cluster(input)
      end

      def create_kx_cluster(input : Types::CreateKxClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new kdb database in the environment.

      def create_kx_database(
        client_token : String,
        database_name : String,
        environment_id : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKxDatabaseRequest.new(client_token: client_token, database_name: database_name, environment_id: environment_id, description: description, tags: tags)
        create_kx_database(input)
      end

      def create_kx_database(input : Types::CreateKxDatabaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_DATABASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a snapshot of kdb database with tiered storage capabilities and a pre-warmed cache, ready
      # for mounting on kdb clusters. Dataviews are only available for clusters running on a scaling group.
      # They are not supported on dedicated clusters.

      def create_kx_dataview(
        az_mode : String,
        client_token : String,
        database_name : String,
        dataview_name : String,
        environment_id : String,
        auto_update : Bool? = nil,
        availability_zone_id : String? = nil,
        changeset_id : String? = nil,
        description : String? = nil,
        read_write : Bool? = nil,
        segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKxDataviewRequest.new(az_mode: az_mode, client_token: client_token, database_name: database_name, dataview_name: dataview_name, environment_id: environment_id, auto_update: auto_update, availability_zone_id: availability_zone_id, changeset_id: changeset_id, description: description, read_write: read_write, segment_configurations: segment_configurations, tags: tags)
        create_kx_dataview(input)
      end

      def create_kx_dataview(input : Types::CreateKxDataviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_DATAVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a managed kdb environment for the account.

      def create_kx_environment(
        kms_key_id : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKxEnvironmentRequest.new(kms_key_id: kms_key_id, name: name, client_token: client_token, description: description, tags: tags)
        create_kx_environment(input)
      end

      def create_kx_environment(input : Types::CreateKxEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new scaling group.

      def create_kx_scaling_group(
        availability_zone_id : String,
        client_token : String,
        environment_id : String,
        host_type : String,
        scaling_group_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKxScalingGroupRequest.new(availability_zone_id: availability_zone_id, client_token: client_token, environment_id: environment_id, host_type: host_type, scaling_group_name: scaling_group_name, tags: tags)
        create_kx_scaling_group(input)
      end

      def create_kx_scaling_group(input : Types::CreateKxScalingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_SCALING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a user in FinSpace kdb environment with an associated IAM role.

      def create_kx_user(
        environment_id : String,
        iam_role : String,
        user_name : String,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKxUserRequest.new(environment_id: environment_id, iam_role: iam_role, user_name: user_name, client_token: client_token, tags: tags)
        create_kx_user(input)
      end

      def create_kx_user(input : Types::CreateKxUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new volume with a specific amount of throughput and storage capacity.

      def create_kx_volume(
        availability_zone_ids : Array(String),
        az_mode : String,
        environment_id : String,
        volume_name : String,
        volume_type : String,
        client_token : String? = nil,
        description : String? = nil,
        nas1_configuration : Types::KxNAS1Configuration? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateKxVolumeRequest.new(availability_zone_ids: availability_zone_ids, az_mode: az_mode, environment_id: environment_id, volume_name: volume_name, volume_type: volume_type, client_token: client_token, description: description, nas1_configuration: nas1_configuration, tags: tags)
        create_kx_volume(input)
      end

      def create_kx_volume(input : Types::CreateKxVolumeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_KX_VOLUME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an FinSpace environment.

      def delete_environment(
        environment_id : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentRequest.new(environment_id: environment_id)
        delete_environment(input)
      end

      def delete_environment(input : Types::DeleteEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a kdb cluster.

      def delete_kx_cluster(
        cluster_name : String,
        environment_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteKxClusterRequest.new(cluster_name: cluster_name, environment_id: environment_id, client_token: client_token)
        delete_kx_cluster(input)
      end

      def delete_kx_cluster(input : Types::DeleteKxClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified nodes from a cluster.

      def delete_kx_cluster_node(
        cluster_name : String,
        environment_id : String,
        node_id : String
      ) : Protocol::Request
        input = Types::DeleteKxClusterNodeRequest.new(cluster_name: cluster_name, environment_id: environment_id, node_id: node_id)
        delete_kx_cluster_node(input)
      end

      def delete_kx_cluster_node(input : Types::DeleteKxClusterNodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_CLUSTER_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified database and all of its associated data. This action is irreversible. You must
      # copy any data out of the database before deleting it if the data is to be retained.

      def delete_kx_database(
        client_token : String,
        database_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::DeleteKxDatabaseRequest.new(client_token: client_token, database_name: database_name, environment_id: environment_id)
        delete_kx_database(input)
      end

      def delete_kx_database(input : Types::DeleteKxDatabaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_DATABASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified dataview. Before deleting a dataview, make sure that it is not in use by any
      # cluster.

      def delete_kx_dataview(
        client_token : String,
        database_name : String,
        dataview_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::DeleteKxDataviewRequest.new(client_token: client_token, database_name: database_name, dataview_name: dataview_name, environment_id: environment_id)
        delete_kx_dataview(input)
      end

      def delete_kx_dataview(input : Types::DeleteKxDataviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_DATAVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the kdb environment. This action is irreversible. Deleting a kdb environment will remove all
      # the associated data and any services running in it.

      def delete_kx_environment(
        environment_id : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteKxEnvironmentRequest.new(environment_id: environment_id, client_token: client_token)
        delete_kx_environment(input)
      end

      def delete_kx_environment(input : Types::DeleteKxEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified scaling group. This action is irreversible. You cannot delete a scaling group
      # until all the clusters running on it have been deleted.

      def delete_kx_scaling_group(
        environment_id : String,
        scaling_group_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteKxScalingGroupRequest.new(environment_id: environment_id, scaling_group_name: scaling_group_name, client_token: client_token)
        delete_kx_scaling_group(input)
      end

      def delete_kx_scaling_group(input : Types::DeleteKxScalingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_SCALING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a user in the specified kdb environment.

      def delete_kx_user(
        environment_id : String,
        user_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteKxUserRequest.new(environment_id: environment_id, user_name: user_name, client_token: client_token)
        delete_kx_user(input)
      end

      def delete_kx_user(input : Types::DeleteKxUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a volume. You can only delete a volume if it's not attached to a cluster or a dataview. When
      # a volume is deleted, any data on the volume is lost. This action is irreversible.

      def delete_kx_volume(
        environment_id : String,
        volume_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DeleteKxVolumeRequest.new(environment_id: environment_id, volume_name: volume_name, client_token: client_token)
        delete_kx_volume(input)
      end

      def delete_kx_volume(input : Types::DeleteKxVolumeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_KX_VOLUME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the FinSpace environment object.

      def get_environment(
        environment_id : String
      ) : Protocol::Request
        input = Types::GetEnvironmentRequest.new(environment_id: environment_id)
        get_environment(input)
      end

      def get_environment(input : Types::GetEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a kdb changeset.

      def get_kx_changeset(
        changeset_id : String,
        database_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::GetKxChangesetRequest.new(changeset_id: changeset_id, database_name: database_name, environment_id: environment_id)
        get_kx_changeset(input)
      end

      def get_kx_changeset(input : Types::GetKxChangesetRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_CHANGESET, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a kdb cluster.

      def get_kx_cluster(
        cluster_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::GetKxClusterRequest.new(cluster_name: cluster_name, environment_id: environment_id)
        get_kx_cluster(input)
      end

      def get_kx_cluster(input : Types::GetKxClusterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a connection string for a user to connect to a kdb cluster. You must call this API using
      # the same role that you have defined while creating a user.

      def get_kx_connection_string(
        cluster_name : String,
        environment_id : String,
        user_arn : String
      ) : Protocol::Request
        input = Types::GetKxConnectionStringRequest.new(cluster_name: cluster_name, environment_id: environment_id, user_arn: user_arn)
        get_kx_connection_string(input)
      end

      def get_kx_connection_string(input : Types::GetKxConnectionStringRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_CONNECTION_STRING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns database information for the specified environment ID.

      def get_kx_database(
        database_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::GetKxDatabaseRequest.new(database_name: database_name, environment_id: environment_id)
        get_kx_database(input)
      end

      def get_kx_database(input : Types::GetKxDatabaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_DATABASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of the dataview.

      def get_kx_dataview(
        database_name : String,
        dataview_name : String,
        environment_id : String
      ) : Protocol::Request
        input = Types::GetKxDataviewRequest.new(database_name: database_name, dataview_name: dataview_name, environment_id: environment_id)
        get_kx_dataview(input)
      end

      def get_kx_dataview(input : Types::GetKxDataviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_DATAVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all the information for the specified kdb environment.

      def get_kx_environment(
        environment_id : String
      ) : Protocol::Request
        input = Types::GetKxEnvironmentRequest.new(environment_id: environment_id)
        get_kx_environment(input)
      end

      def get_kx_environment(input : Types::GetKxEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves details of a scaling group.

      def get_kx_scaling_group(
        environment_id : String,
        scaling_group_name : String
      ) : Protocol::Request
        input = Types::GetKxScalingGroupRequest.new(environment_id: environment_id, scaling_group_name: scaling_group_name)
        get_kx_scaling_group(input)
      end

      def get_kx_scaling_group(input : Types::GetKxScalingGroupRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_SCALING_GROUP, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the specified kdb user.

      def get_kx_user(
        environment_id : String,
        user_name : String
      ) : Protocol::Request
        input = Types::GetKxUserRequest.new(environment_id: environment_id, user_name: user_name)
        get_kx_user(input)
      end

      def get_kx_user(input : Types::GetKxUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the information about the volume.

      def get_kx_volume(
        environment_id : String,
        volume_name : String
      ) : Protocol::Request
        input = Types::GetKxVolumeRequest.new(environment_id: environment_id, volume_name: volume_name)
        get_kx_volume(input)
      end

      def get_kx_volume(input : Types::GetKxVolumeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_KX_VOLUME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of all of your FinSpace environments.

      def list_environments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsRequest.new(max_results: max_results, next_token: next_token)
        list_environments(input)
      end

      def list_environments(input : Types::ListEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the changesets for a database.

      def list_kx_changesets(
        database_name : String,
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxChangesetsRequest.new(database_name: database_name, environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_kx_changesets(input)
      end

      def list_kx_changesets(input : Types::ListKxChangesetsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_CHANGESETS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the nodes in a kdb cluster.

      def list_kx_cluster_nodes(
        cluster_name : String,
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxClusterNodesRequest.new(cluster_name: cluster_name, environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_kx_cluster_nodes(input)
      end

      def list_kx_cluster_nodes(input : Types::ListKxClusterNodesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_CLUSTER_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of clusters.

      def list_kx_clusters(
        environment_id : String,
        cluster_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxClustersRequest.new(environment_id: environment_id, cluster_type: cluster_type, max_results: max_results, next_token: next_token)
        list_kx_clusters(input)
      end

      def list_kx_clusters(input : Types::ListKxClustersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_CLUSTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the databases in the kdb environment.

      def list_kx_databases(
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxDatabasesRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_kx_databases(input)
      end

      def list_kx_databases(input : Types::ListKxDatabasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_DATABASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of all the dataviews in the database.

      def list_kx_dataviews(
        database_name : String,
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxDataviewsRequest.new(database_name: database_name, environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_kx_dataviews(input)
      end

      def list_kx_dataviews(input : Types::ListKxDataviewsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_DATAVIEWS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of kdb environments created in an account.

      def list_kx_environments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxEnvironmentsRequest.new(max_results: max_results, next_token: next_token)
        list_kx_environments(input)
      end

      def list_kx_environments(input : Types::ListKxEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of scaling groups in a kdb environment.

      def list_kx_scaling_groups(
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxScalingGroupsRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_kx_scaling_groups(input)
      end

      def list_kx_scaling_groups(input : Types::ListKxScalingGroupsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_SCALING_GROUPS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the users in a kdb environment.

      def list_kx_users(
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListKxUsersRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token)
        list_kx_users(input)
      end

      def list_kx_users(input : Types::ListKxUsersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_USERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the volumes in a kdb environment.

      def list_kx_volumes(
        environment_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil,
        volume_type : String? = nil
      ) : Protocol::Request
        input = Types::ListKxVolumesRequest.new(environment_id: environment_id, max_results: max_results, next_token: next_token, volume_type: volume_type)
        list_kx_volumes(input)
      end

      def list_kx_volumes(input : Types::ListKxVolumesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_KX_VOLUMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A list of all tags for a resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds metadata tags to a FinSpace resource.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes metadata tags from a FinSpace resource.

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update your FinSpace environment.

      def update_environment(
        environment_id : String,
        description : String? = nil,
        federation_mode : String? = nil,
        federation_parameters : Types::FederationParameters? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEnvironmentRequest.new(environment_id: environment_id, description: description, federation_mode: federation_mode, federation_parameters: federation_parameters, name: name)
        update_environment(input)
      end

      def update_environment(input : Types::UpdateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to update code configuration on a running cluster. By using this API you can update the
      # code, the initialization script path, and the command line arguments for a specific cluster. The
      # configuration that you want to update will override any existing configurations on the cluster.

      def update_kx_cluster_code_configuration(
        cluster_name : String,
        code : Types::CodeConfiguration,
        environment_id : String,
        client_token : String? = nil,
        command_line_arguments : Array(Types::KxCommandLineArgument)? = nil,
        deployment_configuration : Types::KxClusterCodeDeploymentConfiguration? = nil,
        initialization_script : String? = nil
      ) : Protocol::Request
        input = Types::UpdateKxClusterCodeConfigurationRequest.new(cluster_name: cluster_name, code: code, environment_id: environment_id, client_token: client_token, command_line_arguments: command_line_arguments, deployment_configuration: deployment_configuration, initialization_script: initialization_script)
        update_kx_cluster_code_configuration(input)
      end

      def update_kx_cluster_code_configuration(input : Types::UpdateKxClusterCodeConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_CLUSTER_CODE_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the databases mounted on a kdb cluster, which includes the changesetId and all the dbPaths
      # to be cached. This API does not allow you to change a database name or add a database if you created
      # a cluster without one. Using this API you can point a cluster to a different changeset and modify a
      # list of partitions being cached.

      def update_kx_cluster_databases(
        cluster_name : String,
        databases : Array(Types::KxDatabaseConfiguration),
        environment_id : String,
        client_token : String? = nil,
        deployment_configuration : Types::KxDeploymentConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateKxClusterDatabasesRequest.new(cluster_name: cluster_name, databases: databases, environment_id: environment_id, client_token: client_token, deployment_configuration: deployment_configuration)
        update_kx_cluster_databases(input)
      end

      def update_kx_cluster_databases(input : Types::UpdateKxClusterDatabasesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_CLUSTER_DATABASES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information for the given kdb database.

      def update_kx_database(
        client_token : String,
        database_name : String,
        environment_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateKxDatabaseRequest.new(client_token: client_token, database_name: database_name, environment_id: environment_id, description: description)
        update_kx_database(input)
      end

      def update_kx_database(input : Types::UpdateKxDatabaseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_DATABASE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the specified dataview. The dataviews get automatically updated when any new changesets are
      # ingested. Each update of the dataview creates a new version, including changeset details and cache
      # configurations

      def update_kx_dataview(
        client_token : String,
        database_name : String,
        dataview_name : String,
        environment_id : String,
        changeset_id : String? = nil,
        description : String? = nil,
        segment_configurations : Array(Types::KxDataviewSegmentConfiguration)? = nil
      ) : Protocol::Request
        input = Types::UpdateKxDataviewRequest.new(client_token: client_token, database_name: database_name, dataview_name: dataview_name, environment_id: environment_id, changeset_id: changeset_id, description: description, segment_configurations: segment_configurations)
        update_kx_dataview(input)
      end

      def update_kx_dataview(input : Types::UpdateKxDataviewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_DATAVIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates information for the given kdb environment.

      def update_kx_environment(
        environment_id : String,
        client_token : String? = nil,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateKxEnvironmentRequest.new(environment_id: environment_id, client_token: client_token, description: description, name: name)
        update_kx_environment(input)
      end

      def update_kx_environment(input : Types::UpdateKxEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates environment network to connect to your internal network by using a transit gateway. This API
      # supports request to create a transit gateway attachment from FinSpace VPC to your transit gateway ID
      # and create a custom Route-53 outbound resolvers. Once you send a request to update a network, you
      # cannot change it again. Network update might require termination of any clusters that are running in
      # the existing network.

      def update_kx_environment_network(
        environment_id : String,
        client_token : String? = nil,
        custom_dns_configuration : Array(Types::CustomDNSServer)? = nil,
        transit_gateway_configuration : Types::TransitGatewayConfiguration? = nil
      ) : Protocol::Request
        input = Types::UpdateKxEnvironmentNetworkRequest.new(environment_id: environment_id, client_token: client_token, custom_dns_configuration: custom_dns_configuration, transit_gateway_configuration: transit_gateway_configuration)
        update_kx_environment_network(input)
      end

      def update_kx_environment_network(input : Types::UpdateKxEnvironmentNetworkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_ENVIRONMENT_NETWORK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the user details. You can only update the IAM role associated with a user.

      def update_kx_user(
        environment_id : String,
        iam_role : String,
        user_name : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::UpdateKxUserRequest.new(environment_id: environment_id, iam_role: iam_role, user_name: user_name, client_token: client_token)
        update_kx_user(input)
      end

      def update_kx_user(input : Types::UpdateKxUserRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_USER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the throughput or capacity of a volume. During the update process, the filesystem might be
      # unavailable for a few minutes. You can retry any operations after the update is complete.

      def update_kx_volume(
        environment_id : String,
        volume_name : String,
        client_token : String? = nil,
        description : String? = nil,
        nas1_configuration : Types::KxNAS1Configuration? = nil
      ) : Protocol::Request
        input = Types::UpdateKxVolumeRequest.new(environment_id: environment_id, volume_name: volume_name, client_token: client_token, description: description, nas1_configuration: nas1_configuration)
        update_kx_volume(input)
      end

      def update_kx_volume(input : Types::UpdateKxVolumeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_KX_VOLUME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
