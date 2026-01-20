module AwsSdk
  module NeptuneGraph
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

      # Cancel the specified export task.

      def cancel_export_task(
        task_identifier : String
      ) : Protocol::Request
        input = Types::CancelExportTaskInput.new(task_identifier: task_identifier)
        cancel_export_task(input)
      end

      def cancel_export_task(input : Types::CancelExportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_EXPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified import task.

      def cancel_import_task(
        task_identifier : String
      ) : Protocol::Request
        input = Types::CancelImportTaskInput.new(task_identifier: task_identifier)
        cancel_import_task(input)
      end

      def cancel_import_task(input : Types::CancelImportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels a specified query.

      def cancel_query(
        graph_identifier : String,
        query_id : String
      ) : Protocol::Request
        input = Types::CancelQueryInput.new(graph_identifier: graph_identifier, query_id: query_id)
        cancel_query(input)
      end

      def cancel_query(input : Types::CancelQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Neptune Analytics graph.

      def create_graph(
        graph_name : String,
        provisioned_memory : Int32,
        deletion_protection : Bool? = nil,
        kms_key_identifier : String? = nil,
        public_connectivity : Bool? = nil,
        replica_count : Int32? = nil,
        tags : Hash(String, String)? = nil,
        vector_search_configuration : Types::VectorSearchConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateGraphInput.new(graph_name: graph_name, provisioned_memory: provisioned_memory, deletion_protection: deletion_protection, kms_key_identifier: kms_key_identifier, public_connectivity: public_connectivity, replica_count: replica_count, tags: tags, vector_search_configuration: vector_search_configuration)
        create_graph(input)
      end

      def create_graph(input : Types::CreateGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a snapshot of the specific graph.

      def create_graph_snapshot(
        graph_identifier : String,
        snapshot_name : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateGraphSnapshotInput.new(graph_identifier: graph_identifier, snapshot_name: snapshot_name, tags: tags)
        create_graph_snapshot(input)
      end

      def create_graph_snapshot(input : Types::CreateGraphSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GRAPH_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Neptune Analytics graph and imports data into it, either from Amazon Simple Storage
      # Service (S3) or from a Neptune database or a Neptune database snapshot. The data can be loaded from
      # files in S3 that in either the Gremlin CSV format or the openCypher load format .

      def create_graph_using_import_task(
        graph_name : String,
        role_arn : String,
        source : String,
        blank_node_handling : String? = nil,
        deletion_protection : Bool? = nil,
        fail_on_error : Bool? = nil,
        format : String? = nil,
        import_options : Types::ImportOptions? = nil,
        kms_key_identifier : String? = nil,
        max_provisioned_memory : Int32? = nil,
        min_provisioned_memory : Int32? = nil,
        parquet_type : String? = nil,
        public_connectivity : Bool? = nil,
        replica_count : Int32? = nil,
        tags : Hash(String, String)? = nil,
        vector_search_configuration : Types::VectorSearchConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateGraphUsingImportTaskInput.new(graph_name: graph_name, role_arn: role_arn, source: source, blank_node_handling: blank_node_handling, deletion_protection: deletion_protection, fail_on_error: fail_on_error, format: format, import_options: import_options, kms_key_identifier: kms_key_identifier, max_provisioned_memory: max_provisioned_memory, min_provisioned_memory: min_provisioned_memory, parquet_type: parquet_type, public_connectivity: public_connectivity, replica_count: replica_count, tags: tags, vector_search_configuration: vector_search_configuration)
        create_graph_using_import_task(input)
      end

      def create_graph_using_import_task(input : Types::CreateGraphUsingImportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GRAPH_USING_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a private graph endpoint to allow private access from to the graph from within a VPC. You can
      # attach security groups to the private graph endpoint. VPC endpoint charges apply.

      def create_private_graph_endpoint(
        graph_identifier : String,
        subnet_ids : Array(String)? = nil,
        vpc_id : String? = nil,
        vpc_security_group_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreatePrivateGraphEndpointInput.new(graph_identifier: graph_identifier, subnet_ids: subnet_ids, vpc_id: vpc_id, vpc_security_group_ids: vpc_security_group_ids)
        create_private_graph_endpoint(input)
      end

      def create_private_graph_endpoint(input : Types::CreatePrivateGraphEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRIVATE_GRAPH_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified graph. Graphs cannot be deleted if delete-protection is enabled.

      def delete_graph(
        graph_identifier : String,
        skip_snapshot : Bool
      ) : Protocol::Request
        input = Types::DeleteGraphInput.new(graph_identifier: graph_identifier, skip_snapshot: skip_snapshot)
        delete_graph(input)
      end

      def delete_graph(input : Types::DeleteGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specifed graph snapshot.

      def delete_graph_snapshot(
        snapshot_identifier : String
      ) : Protocol::Request
        input = Types::DeleteGraphSnapshotInput.new(snapshot_identifier: snapshot_identifier)
        delete_graph_snapshot(input)
      end

      def delete_graph_snapshot(input : Types::DeleteGraphSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GRAPH_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a private graph endpoint.

      def delete_private_graph_endpoint(
        graph_identifier : String,
        vpc_id : String
      ) : Protocol::Request
        input = Types::DeletePrivateGraphEndpointInput.new(graph_identifier: graph_identifier, vpc_id: vpc_id)
        delete_private_graph_endpoint(input)
      end

      def delete_private_graph_endpoint(input : Types::DeletePrivateGraphEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRIVATE_GRAPH_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Execute an openCypher query. When invoking this operation in a Neptune Analytics cluster, the IAM
      # user or role making the request must have a policy attached that allows one of the following IAM
      # actions in that cluster, depending on the query: neptune-graph:ReadDataViaQuery
      # neptune-graph:WriteDataViaQuery neptune-graph:DeleteDataViaQuery

      def execute_query(
        graph_identifier : String,
        language : String,
        query_string : String,
        explain_mode : String? = nil,
        parameters : Hash(String, Types::Document)? = nil,
        plan_cache : String? = nil,
        query_timeout_milliseconds : Int32? = nil
      ) : Protocol::Request
        input = Types::ExecuteQueryInput.new(graph_identifier: graph_identifier, language: language, query_string: query_string, explain_mode: explain_mode, parameters: parameters, plan_cache: plan_cache, query_timeout_milliseconds: query_timeout_milliseconds)
        execute_query(input)
      end

      def execute_query(input : Types::ExecuteQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specified export task.

      def get_export_task(
        task_identifier : String
      ) : Protocol::Request
        input = Types::GetExportTaskInput.new(task_identifier: task_identifier)
        get_export_task(input)
      end

      def get_export_task(input : Types::GetExportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a specified graph.

      def get_graph(
        graph_identifier : String
      ) : Protocol::Request
        input = Types::GetGraphInput.new(graph_identifier: graph_identifier)
        get_graph(input)
      end

      def get_graph(input : Types::GetGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specified graph snapshot.

      def get_graph_snapshot(
        snapshot_identifier : String
      ) : Protocol::Request
        input = Types::GetGraphSnapshotInput.new(snapshot_identifier: snapshot_identifier)
        get_graph_snapshot(input)
      end

      def get_graph_snapshot(input : Types::GetGraphSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GRAPH_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a graph summary for a property graph.

      def get_graph_summary(
        graph_identifier : String,
        mode : String? = nil
      ) : Protocol::Request
        input = Types::GetGraphSummaryInput.new(graph_identifier: graph_identifier, mode: mode)
        get_graph_summary(input)
      end

      def get_graph_summary(input : Types::GetGraphSummaryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GRAPH_SUMMARY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a specified import task.

      def get_import_task(
        task_identifier : String
      ) : Protocol::Request
        input = Types::GetImportTaskInput.new(task_identifier: task_identifier)
        get_import_task(input)
      end

      def get_import_task(input : Types::GetImportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a specified private endpoint.

      def get_private_graph_endpoint(
        graph_identifier : String,
        vpc_id : String
      ) : Protocol::Request
        input = Types::GetPrivateGraphEndpointInput.new(graph_identifier: graph_identifier, vpc_id: vpc_id)
        get_private_graph_endpoint(input)
      end

      def get_private_graph_endpoint(input : Types::GetPrivateGraphEndpointInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRIVATE_GRAPH_ENDPOINT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the status of a specified query. When invoking this operation in a Neptune Analytics
      # cluster, the IAM user or role making the request must have the neptune-graph:GetQueryStatus IAM
      # action attached.

      def get_query(
        graph_identifier : String,
        query_id : String
      ) : Protocol::Request
        input = Types::GetQueryInput.new(graph_identifier: graph_identifier, query_id: query_id)
        get_query(input)
      end

      def get_query(input : Types::GetQueryInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a list of export tasks.

      def list_export_tasks(
        graph_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListExportTasksInput.new(graph_identifier: graph_identifier, max_results: max_results, next_token: next_token)
        list_export_tasks(input)
      end

      def list_export_tasks(input : Types::ListExportTasksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EXPORT_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists available snapshots of a specified Neptune Analytics graph.

      def list_graph_snapshots(
        graph_identifier : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGraphSnapshotsInput.new(graph_identifier: graph_identifier, max_results: max_results, next_token: next_token)
        list_graph_snapshots(input)
      end

      def list_graph_snapshots(input : Types::ListGraphSnapshotsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GRAPH_SNAPSHOTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists available Neptune Analytics graphs.

      def list_graphs(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGraphsInput.new(max_results: max_results, next_token: next_token)
        list_graphs(input)
      end

      def list_graphs(input : Types::ListGraphsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GRAPHS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists import tasks.

      def list_import_tasks(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListImportTasksInput.new(max_results: max_results, next_token: next_token)
        list_import_tasks(input)
      end

      def list_import_tasks(input : Types::ListImportTasksInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_IMPORT_TASKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists private endpoints for a specified Neptune Analytics graph.

      def list_private_graph_endpoints(
        graph_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPrivateGraphEndpointsInput.new(graph_identifier: graph_identifier, max_results: max_results, next_token: next_token)
        list_private_graph_endpoints(input)
      end

      def list_private_graph_endpoints(input : Types::ListPrivateGraphEndpointsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRIVATE_GRAPH_ENDPOINTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists active openCypher queries.

      def list_queries(
        graph_identifier : String,
        max_results : Int32,
        state : String? = nil
      ) : Protocol::Request
        input = Types::ListQueriesInput.new(graph_identifier: graph_identifier, max_results: max_results, state: state)
        list_queries(input)
      end

      def list_queries(input : Types::ListQueriesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUERIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists tags associated with a specified resource.

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

      # Empties the data from a specified Neptune Analytics graph.

      def reset_graph(
        graph_identifier : String,
        skip_snapshot : Bool
      ) : Protocol::Request
        input = Types::ResetGraphInput.new(graph_identifier: graph_identifier, skip_snapshot: skip_snapshot)
        reset_graph(input)
      end

      def reset_graph(input : Types::ResetGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Restores a graph from a snapshot.

      def restore_graph_from_snapshot(
        graph_name : String,
        snapshot_identifier : String,
        deletion_protection : Bool? = nil,
        provisioned_memory : Int32? = nil,
        public_connectivity : Bool? = nil,
        replica_count : Int32? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::RestoreGraphFromSnapshotInput.new(graph_name: graph_name, snapshot_identifier: snapshot_identifier, deletion_protection: deletion_protection, provisioned_memory: provisioned_memory, public_connectivity: public_connectivity, replica_count: replica_count, tags: tags)
        restore_graph_from_snapshot(input)
      end

      def restore_graph_from_snapshot(input : Types::RestoreGraphFromSnapshotInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESTORE_GRAPH_FROM_SNAPSHOT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Export data from an existing Neptune Analytics graph to Amazon S3. The graph state should be
      # AVAILABLE .

      def start_export_task(
        destination : String,
        format : String,
        graph_identifier : String,
        kms_key_identifier : String,
        role_arn : String,
        export_filter : Types::ExportFilter? = nil,
        parquet_type : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::StartExportTaskInput.new(destination: destination, format: format, graph_identifier: graph_identifier, kms_key_identifier: kms_key_identifier, role_arn: role_arn, export_filter: export_filter, parquet_type: parquet_type, tags: tags)
        start_export_task(input)
      end

      def start_export_task(input : Types::StartExportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_EXPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the specific graph.

      def start_graph(
        graph_identifier : String
      ) : Protocol::Request
        input = Types::StartGraphInput.new(graph_identifier: graph_identifier)
        start_graph(input)
      end

      def start_graph(input : Types::StartGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Import data into existing Neptune Analytics graph from Amazon Simple Storage Service (S3). The graph
      # needs to be empty and in the AVAILABLE state.

      def start_import_task(
        graph_identifier : String,
        role_arn : String,
        source : String,
        blank_node_handling : String? = nil,
        fail_on_error : Bool? = nil,
        format : String? = nil,
        import_options : Types::ImportOptions? = nil,
        parquet_type : String? = nil
      ) : Protocol::Request
        input = Types::StartImportTaskInput.new(graph_identifier: graph_identifier, role_arn: role_arn, source: source, blank_node_handling: blank_node_handling, fail_on_error: fail_on_error, format: format, import_options: import_options, parquet_type: parquet_type)
        start_import_task(input)
      end

      def start_import_task(input : Types::StartImportTaskInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_IMPORT_TASK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the specific graph.

      def stop_graph(
        graph_identifier : String
      ) : Protocol::Request
        input = Types::StopGraphInput.new(graph_identifier: graph_identifier)
        stop_graph(input)
      end

      def stop_graph(input : Types::StopGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to the specified resource.

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

      # Removes the specified tags from the specified resource.

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

      # Updates the configuration of a specified Neptune Analytics graph

      def update_graph(
        graph_identifier : String,
        deletion_protection : Bool? = nil,
        provisioned_memory : Int32? = nil,
        public_connectivity : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateGraphInput.new(graph_identifier: graph_identifier, deletion_protection: deletion_protection, provisioned_memory: provisioned_memory, public_connectivity: public_connectivity)
        update_graph(input)
      end

      def update_graph(input : Types::UpdateGraphInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GRAPH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
