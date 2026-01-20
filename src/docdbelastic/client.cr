module Aws
  module DocDBElastic
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

      # The type of pending maintenance action to be applied to the resource.

      def apply_pending_maintenance_action(
        apply_action : String,
        opt_in_type : String,
        resource_arn : String,
        apply_on : String? = nil
      ) : Protocol::Request
        input = Types::ApplyPendingMaintenanceActionInput.new(apply_action: apply_action, opt_in_type: opt_in_type, resource_arn: resource_arn, apply_on: apply_on)
        apply_pending_maintenance_action(input)
      end

      def apply_pending_maintenance_action(input : Types::ApplyPendingMaintenanceActionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::APPLY_PENDING_MAINTENANCE_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Copies a snapshot of an elastic cluster.

      def copy_cluster_snapshot(
        snapshot_arn : String,
        target_snapshot_name : String,
        copy_tags : Bool? = nil,
        kms_key_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CopyClusterSnapshotInput.new(snapshot_arn: snapshot_arn, target_snapshot_name: target_snapshot_name, copy_tags: copy_tags, kms_key_id: kms_key_id, tags: tags)
        copy_cluster_snapshot(input)
      end

      def copy_cluster_snapshot(input : Types::CopyClusterSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COPY_CLUSTER_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon DocumentDB elastic cluster and returns its cluster structure.

      def create_cluster(
        admin_user_name : String,
        admin_user_password : String,
        auth_type : String,
        cluster_name : String,
        shard_capacity : Int32,
        shard_count : Int32,
        backup_retention_period : Int32? = nil,
        client_token : String? = nil,
        kms_key_id : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        shard_instance_count : Int32? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterInput.new(admin_user_name: admin_user_name, admin_user_password: admin_user_password, auth_type: auth_type, cluster_name: cluster_name, shard_capacity: shard_capacity, shard_count: shard_count, backup_retention_period: backup_retention_period, client_token: client_token, kms_key_id: kms_key_id, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, shard_instance_count: shard_instance_count, subnet_ids: subnet_ids, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        create_cluster(input)
      end

      def create_cluster(input : Types::CreateClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a snapshot of an elastic cluster.

      def create_cluster_snapshot(
        cluster_arn : String,
        snapshot_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateClusterSnapshotInput.new(cluster_arn: cluster_arn, snapshot_name: snapshot_name, tags: tags)
        create_cluster_snapshot(input)
      end

      def create_cluster_snapshot(input : Types::CreateClusterSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CLUSTER_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an elastic cluster.

      def delete_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::DeleteClusterInput.new(cluster_arn: cluster_arn)
        delete_cluster(input)
      end

      def delete_cluster(input : Types::DeleteClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete an elastic cluster snapshot.

      def delete_cluster_snapshot(
        snapshot_arn : String
      ) : Protocol::Request
        input = Types::DeleteClusterSnapshotInput.new(snapshot_arn: snapshot_arn)
        delete_cluster_snapshot(input)
      end

      def delete_cluster_snapshot(input : Types::DeleteClusterSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLUSTER_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific elastic cluster.

      def get_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::GetClusterInput.new(cluster_arn: cluster_arn)
        get_cluster(input)
      end

      def get_cluster(input : Types::GetClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about a specific elastic cluster snapshot

      def get_cluster_snapshot(
        snapshot_arn : String
      ) : Protocol::Request
        input = Types::GetClusterSnapshotInput.new(snapshot_arn: snapshot_arn)
        get_cluster_snapshot(input)
      end

      def get_cluster_snapshot(input : Types::GetClusterSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLUSTER_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves all maintenance actions that are pending.

      def get_pending_maintenance_action(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetPendingMaintenanceActionInput.new(resource_arn: resource_arn)
        get_pending_maintenance_action(input)
      end

      def get_pending_maintenance_action(input : Types::GetPendingMaintenanceActionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PENDING_MAINTENANCE_ACTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about snapshots for a specified elastic cluster.

      def list_cluster_snapshots(
        cluster_arn : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        snapshot_type : String? = nil
      ) : Protocol::Request
        input = Types::ListClusterSnapshotsInput.new(cluster_arn: cluster_arn, max_results: max_results, next_token: next_token, snapshot_type: snapshot_type)
        list_cluster_snapshots(input)
      end

      def list_cluster_snapshots(input : Types::ListClusterSnapshotsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CLUSTER_SNAPSHOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about provisioned Amazon DocumentDB elastic clusters.

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

      # Retrieves a list of all maintenance actions that are pending.

      def list_pending_maintenance_actions(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPendingMaintenanceActionsInput.new(max_results: max_results, next_token: next_token)
        list_pending_maintenance_actions(input)
      end

      def list_pending_maintenance_actions(input : Types::ListPendingMaintenanceActionsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PENDING_MAINTENANCE_ACTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags on a elastic cluster resource

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

      # Restores an elastic cluster from a snapshot.

      def restore_cluster_from_snapshot(
        cluster_name : String,
        snapshot_arn : String,
        kms_key_id : String? = nil,
        shard_capacity : Int32? = nil,
        shard_instance_count : Int32? = nil,
        subnet_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::RestoreClusterFromSnapshotInput.new(cluster_name: cluster_name, snapshot_arn: snapshot_arn, kms_key_id: kms_key_id, shard_capacity: shard_capacity, shard_instance_count: shard_instance_count, subnet_ids: subnet_ids, tags: tags, vpc_security_group_ids: vpc_security_group_ids)
        restore_cluster_from_snapshot(input)
      end

      def restore_cluster_from_snapshot(input : Types::RestoreClusterFromSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_CLUSTER_FROM_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restarts the stopped elastic cluster that is specified by clusterARN .

      def start_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::StartClusterInput.new(cluster_arn: cluster_arn)
        start_cluster(input)
      end

      def start_cluster(input : Types::StartClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the running elastic cluster that is specified by clusterArn . The elastic cluster must be in
      # the available state.

      def stop_cluster(
        cluster_arn : String
      ) : Protocol::Request
        input = Types::StopClusterInput.new(cluster_arn: cluster_arn)
        stop_cluster(input)
      end

      def stop_cluster(input : Types::StopClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds metadata tags to an elastic cluster resource

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

      # Removes metadata tags from an elastic cluster resource

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

      # Modifies an elastic cluster. This includes updating admin-username/password, upgrading the API
      # version, and setting up a backup window and maintenance window

      def update_cluster(
        cluster_arn : String,
        admin_user_password : String? = nil,
        auth_type : String? = nil,
        backup_retention_period : Int32? = nil,
        client_token : String? = nil,
        preferred_backup_window : String? = nil,
        preferred_maintenance_window : String? = nil,
        shard_capacity : Int32? = nil,
        shard_count : Int32? = nil,
        shard_instance_count : Int32? = nil,
        subnet_ids : Array(String)? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdateClusterInput.new(cluster_arn: cluster_arn, admin_user_password: admin_user_password, auth_type: auth_type, backup_retention_period: backup_retention_period, client_token: client_token, preferred_backup_window: preferred_backup_window, preferred_maintenance_window: preferred_maintenance_window, shard_capacity: shard_capacity, shard_count: shard_count, shard_instance_count: shard_instance_count, subnet_ids: subnet_ids, vpc_security_group_ids: vpc_security_group_ids)
        update_cluster(input)
      end

      def update_cluster(input : Types::UpdateClusterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLUSTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
