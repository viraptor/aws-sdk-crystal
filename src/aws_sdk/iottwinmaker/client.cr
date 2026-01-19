module AwsSdk
  module IoTTwinMaker
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

      # Sets values for multiple time series properties.
      def batch_put_property_values(
        entries : Array(Types::PropertyValueEntry),
        workspace_id : String
      ) : Protocol::Request
        input = Types::BatchPutPropertyValuesRequest.new(entries: entries, workspace_id: workspace_id)
        batch_put_property_values(input)
      end
      def batch_put_property_values(input : Types::BatchPutPropertyValuesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_PUT_PROPERTY_VALUES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Cancels the metadata transfer job.
      def cancel_metadata_transfer_job(
        metadata_transfer_job_id : String
      ) : Protocol::Request
        input = Types::CancelMetadataTransferJobRequest.new(metadata_transfer_job_id: metadata_transfer_job_id)
        cancel_metadata_transfer_job(input)
      end
      def cancel_metadata_transfer_job(input : Types::CancelMetadataTransferJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_METADATA_TRANSFER_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a component type.
      def create_component_type(
        component_type_id : String,
        workspace_id : String,
        component_type_name : String? = nil,
        composite_component_types : Hash(String, Types::CompositeComponentTypeRequest)? = nil,
        description : String? = nil,
        extends_from : Array(String)? = nil,
        functions : Hash(String, Types::FunctionRequest)? = nil,
        is_singleton : Bool? = nil,
        property_definitions : Hash(String, Types::PropertyDefinitionRequest)? = nil,
        property_groups : Hash(String, Types::PropertyGroupRequest)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateComponentTypeRequest.new(component_type_id: component_type_id, workspace_id: workspace_id, component_type_name: component_type_name, composite_component_types: composite_component_types, description: description, extends_from: extends_from, functions: functions, is_singleton: is_singleton, property_definitions: property_definitions, property_groups: property_groups, tags: tags)
        create_component_type(input)
      end
      def create_component_type(input : Types::CreateComponentTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_COMPONENT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an entity.
      def create_entity(
        entity_name : String,
        workspace_id : String,
        components : Hash(String, Types::ComponentRequest)? = nil,
        composite_components : Hash(String, Types::CompositeComponentRequest)? = nil,
        description : String? = nil,
        entity_id : String? = nil,
        parent_entity_id : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEntityRequest.new(entity_name: entity_name, workspace_id: workspace_id, components: components, composite_components: composite_components, description: description, entity_id: entity_id, parent_entity_id: parent_entity_id, tags: tags)
        create_entity(input)
      end
      def create_entity(input : Types::CreateEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new metadata transfer job.
      def create_metadata_transfer_job(
        destination : Types::DestinationConfiguration,
        sources : Array(Types::SourceConfiguration),
        description : String? = nil,
        metadata_transfer_job_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateMetadataTransferJobRequest.new(destination: destination, sources: sources, description: description, metadata_transfer_job_id: metadata_transfer_job_id)
        create_metadata_transfer_job(input)
      end
      def create_metadata_transfer_job(input : Types::CreateMetadataTransferJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_METADATA_TRANSFER_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a scene.
      def create_scene(
        content_location : String,
        scene_id : String,
        workspace_id : String,
        capabilities : Array(String)? = nil,
        description : String? = nil,
        scene_metadata : Hash(String, String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSceneRequest.new(content_location: content_location, scene_id: scene_id, workspace_id: workspace_id, capabilities: capabilities, description: description, scene_metadata: scene_metadata, tags: tags)
        create_scene(input)
      end
      def create_scene(input : Types::CreateSceneRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCENE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This action creates a SyncJob.
      def create_sync_job(
        sync_role : String,
        sync_source : String,
        workspace_id : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSyncJobRequest.new(sync_role: sync_role, sync_source: sync_source, workspace_id: workspace_id, tags: tags)
        create_sync_job(input)
      end
      def create_sync_job(input : Types::CreateSyncJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SYNC_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a workplace.
      def create_workspace(
        workspace_id : String,
        description : String? = nil,
        role : String? = nil,
        s3_location : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateWorkspaceRequest.new(workspace_id: workspace_id, description: description, role: role, s3_location: s3_location, tags: tags)
        create_workspace(input)
      end
      def create_workspace(input : Types::CreateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a component type.
      def delete_component_type(
        component_type_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteComponentTypeRequest.new(component_type_id: component_type_id, workspace_id: workspace_id)
        delete_component_type(input)
      end
      def delete_component_type(input : Types::DeleteComponentTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_COMPONENT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an entity.
      def delete_entity(
        entity_id : String,
        workspace_id : String,
        is_recursive : Bool? = nil
      ) : Protocol::Request
        input = Types::DeleteEntityRequest.new(entity_id: entity_id, workspace_id: workspace_id, is_recursive: is_recursive)
        delete_entity(input)
      end
      def delete_entity(input : Types::DeleteEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a scene.
      def delete_scene(
        scene_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteSceneRequest.new(scene_id: scene_id, workspace_id: workspace_id)
        delete_scene(input)
      end
      def delete_scene(input : Types::DeleteSceneRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCENE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the SyncJob.
      def delete_sync_job(
        sync_source : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteSyncJobRequest.new(sync_source: sync_source, workspace_id: workspace_id)
        delete_sync_job(input)
      end
      def delete_sync_job(input : Types::DeleteSyncJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SYNC_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a workspace.
      def delete_workspace(
        workspace_id : String
      ) : Protocol::Request
        input = Types::DeleteWorkspaceRequest.new(workspace_id: workspace_id)
        delete_workspace(input)
      end
      def delete_workspace(input : Types::DeleteWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Run queries to access information from your knowledge graph of entities within individual
      # workspaces. The ExecuteQuery action only works with Amazon Web Services Java SDK2 . ExecuteQuery
      # will not work with any Amazon Web Services Java SDK version &lt; 2.x.
      def execute_query(
        query_statement : String,
        workspace_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ExecuteQueryRequest.new(query_statement: query_statement, workspace_id: workspace_id, max_results: max_results, next_token: next_token)
        execute_query(input)
      end
      def execute_query(input : Types::ExecuteQueryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXECUTE_QUERY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a component type.
      def get_component_type(
        component_type_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::GetComponentTypeRequest.new(component_type_id: component_type_id, workspace_id: workspace_id)
        get_component_type(input)
      end
      def get_component_type(input : Types::GetComponentTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_COMPONENT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about an entity.
      def get_entity(
        entity_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::GetEntityRequest.new(entity_id: entity_id, workspace_id: workspace_id)
        get_entity(input)
      end
      def get_entity(input : Types::GetEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a nmetadata transfer job.
      def get_metadata_transfer_job(
        metadata_transfer_job_id : String
      ) : Protocol::Request
        input = Types::GetMetadataTransferJobRequest.new(metadata_transfer_job_id: metadata_transfer_job_id)
        get_metadata_transfer_job(input)
      end
      def get_metadata_transfer_job(input : Types::GetMetadataTransferJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METADATA_TRANSFER_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the pricing plan.
      def get_pricing_plan : Protocol::Request
        input = Types::GetPricingPlanRequest.new
        get_pricing_plan(input)
      end
      def get_pricing_plan(input : Types::GetPricingPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRICING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the property values for a component, component type, entity, or workspace. You must specify a
      # value for either componentName , componentTypeId , entityId , or workspaceId .
      def get_property_value(
        selected_properties : Array(String),
        workspace_id : String,
        component_name : String? = nil,
        component_path : String? = nil,
        component_type_id : String? = nil,
        entity_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        property_group_name : String? = nil,
        tabular_conditions : Types::TabularConditions? = nil
      ) : Protocol::Request
        input = Types::GetPropertyValueRequest.new(selected_properties: selected_properties, workspace_id: workspace_id, component_name: component_name, component_path: component_path, component_type_id: component_type_id, entity_id: entity_id, max_results: max_results, next_token: next_token, property_group_name: property_group_name, tabular_conditions: tabular_conditions)
        get_property_value(input)
      end
      def get_property_value(input : Types::GetPropertyValueRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROPERTY_VALUE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about the history of a time series property value for a component, component
      # type, entity, or workspace. You must specify a value for workspaceId . For entity-specific queries,
      # specify values for componentName and entityId . For cross-entity quries, specify a value for
      # componentTypeId .
      def get_property_value_history(
        selected_properties : Array(String),
        workspace_id : String,
        component_name : String? = nil,
        component_path : String? = nil,
        component_type_id : String? = nil,
        end_date_time : Time? = nil,
        end_time : String? = nil,
        entity_id : String? = nil,
        interpolation : Types::InterpolationParameters? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        order_by_time : String? = nil,
        property_filters : Array(Types::PropertyFilter)? = nil,
        start_date_time : Time? = nil,
        start_time : String? = nil
      ) : Protocol::Request
        input = Types::GetPropertyValueHistoryRequest.new(selected_properties: selected_properties, workspace_id: workspace_id, component_name: component_name, component_path: component_path, component_type_id: component_type_id, end_date_time: end_date_time, end_time: end_time, entity_id: entity_id, interpolation: interpolation, max_results: max_results, next_token: next_token, order_by_time: order_by_time, property_filters: property_filters, start_date_time: start_date_time, start_time: start_time)
        get_property_value_history(input)
      end
      def get_property_value_history(input : Types::GetPropertyValueHistoryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PROPERTY_VALUE_HISTORY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a scene.
      def get_scene(
        scene_id : String,
        workspace_id : String
      ) : Protocol::Request
        input = Types::GetSceneRequest.new(scene_id: scene_id, workspace_id: workspace_id)
        get_scene(input)
      end
      def get_scene(input : Types::GetSceneRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCENE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the SyncJob.
      def get_sync_job(
        sync_source : String,
        workspace_id : String? = nil
      ) : Protocol::Request
        input = Types::GetSyncJobRequest.new(sync_source: sync_source, workspace_id: workspace_id)
        get_sync_job(input)
      end
      def get_sync_job(input : Types::GetSyncJobRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SYNC_JOB, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about a workspace.
      def get_workspace(
        workspace_id : String
      ) : Protocol::Request
        input = Types::GetWorkspaceRequest.new(workspace_id: workspace_id)
        get_workspace(input)
      end
      def get_workspace(input : Types::GetWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all component types in a workspace.
      def list_component_types(
        workspace_id : String,
        filters : Array(Types::ListComponentTypesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentTypesRequest.new(workspace_id: workspace_id, filters: filters, max_results: max_results, next_token: next_token)
        list_component_types(input)
      end
      def list_component_types(input : Types::ListComponentTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENT_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API lists the components of an entity.
      def list_components(
        entity_id : String,
        workspace_id : String,
        component_path : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListComponentsRequest.new(entity_id: entity_id, workspace_id: workspace_id, component_path: component_path, max_results: max_results, next_token: next_token)
        list_components(input)
      end
      def list_components(input : Types::ListComponentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_COMPONENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all entities in a workspace.
      def list_entities(
        workspace_id : String,
        filters : Array(Types::ListEntitiesFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEntitiesRequest.new(workspace_id: workspace_id, filters: filters, max_results: max_results, next_token: next_token)
        list_entities(input)
      end
      def list_entities(input : Types::ListEntitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENTITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the metadata transfer jobs.
      def list_metadata_transfer_jobs(
        destination_type : String,
        source_type : String,
        filters : Array(Types::ListMetadataTransferJobsFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMetadataTransferJobsRequest.new(destination_type: destination_type, source_type: source_type, filters: filters, max_results: max_results, next_token: next_token)
        list_metadata_transfer_jobs(input)
      end
      def list_metadata_transfer_jobs(input : Types::ListMetadataTransferJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_METADATA_TRANSFER_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # This API lists the properties of a component.
      def list_properties(
        entity_id : String,
        workspace_id : String,
        component_name : String? = nil,
        component_path : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPropertiesRequest.new(entity_id: entity_id, workspace_id: workspace_id, component_name: component_name, component_path: component_path, max_results: max_results, next_token: next_token)
        list_properties(input)
      end
      def list_properties(input : Types::ListPropertiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PROPERTIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all scenes in a workspace.
      def list_scenes(
        workspace_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListScenesRequest.new(workspace_id: workspace_id, max_results: max_results, next_token: next_token)
        list_scenes(input)
      end
      def list_scenes(input : Types::ListScenesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCENES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List all SyncJobs.
      def list_sync_jobs(
        workspace_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSyncJobsRequest.new(workspace_id: workspace_id, max_results: max_results, next_token: next_token)
        list_sync_jobs(input)
      end
      def list_sync_jobs(input : Types::ListSyncJobsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SYNC_JOBS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the sync resources.
      def list_sync_resources(
        sync_source : String,
        workspace_id : String,
        filters : Array(Types::SyncResourceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSyncResourcesRequest.new(sync_source: sync_source, workspace_id: workspace_id, filters: filters, max_results: max_results, next_token: next_token)
        list_sync_resources(input)
      end
      def list_sync_resources(input : Types::ListSyncResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SYNC_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all tags associated with a resource.
      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves information about workspaces in the current account.
      def list_workspaces(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListWorkspacesRequest.new(max_results: max_results, next_token: next_token)
        list_workspaces(input)
      end
      def list_workspaces(input : Types::ListWorkspacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_WORKSPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds tags to a resource.
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

      # Removes tags from a resource.
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

      # Updates information in a component type.
      def update_component_type(
        component_type_id : String,
        workspace_id : String,
        component_type_name : String? = nil,
        composite_component_types : Hash(String, Types::CompositeComponentTypeRequest)? = nil,
        description : String? = nil,
        extends_from : Array(String)? = nil,
        functions : Hash(String, Types::FunctionRequest)? = nil,
        is_singleton : Bool? = nil,
        property_definitions : Hash(String, Types::PropertyDefinitionRequest)? = nil,
        property_groups : Hash(String, Types::PropertyGroupRequest)? = nil
      ) : Protocol::Request
        input = Types::UpdateComponentTypeRequest.new(component_type_id: component_type_id, workspace_id: workspace_id, component_type_name: component_type_name, composite_component_types: composite_component_types, description: description, extends_from: extends_from, functions: functions, is_singleton: is_singleton, property_definitions: property_definitions, property_groups: property_groups)
        update_component_type(input)
      end
      def update_component_type(input : Types::UpdateComponentTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_COMPONENT_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an entity.
      def update_entity(
        entity_id : String,
        workspace_id : String,
        component_updates : Hash(String, Types::ComponentUpdateRequest)? = nil,
        composite_component_updates : Hash(String, Types::CompositeComponentUpdateRequest)? = nil,
        description : String? = nil,
        entity_name : String? = nil,
        parent_entity_update : Types::ParentEntityUpdateRequest? = nil
      ) : Protocol::Request
        input = Types::UpdateEntityRequest.new(entity_id: entity_id, workspace_id: workspace_id, component_updates: component_updates, composite_component_updates: composite_component_updates, description: description, entity_name: entity_name, parent_entity_update: parent_entity_update)
        update_entity(input)
      end
      def update_entity(input : Types::UpdateEntityRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ENTITY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Update the pricing plan.
      def update_pricing_plan(
        pricing_mode : String,
        bundle_names : Array(String)? = nil
      ) : Protocol::Request
        input = Types::UpdatePricingPlanRequest.new(pricing_mode: pricing_mode, bundle_names: bundle_names)
        update_pricing_plan(input)
      end
      def update_pricing_plan(input : Types::UpdatePricingPlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRICING_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a scene.
      def update_scene(
        scene_id : String,
        workspace_id : String,
        capabilities : Array(String)? = nil,
        content_location : String? = nil,
        description : String? = nil,
        scene_metadata : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateSceneRequest.new(scene_id: scene_id, workspace_id: workspace_id, capabilities: capabilities, content_location: content_location, description: description, scene_metadata: scene_metadata)
        update_scene(input)
      end
      def update_scene(input : Types::UpdateSceneRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCENE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a workspace.
      def update_workspace(
        workspace_id : String,
        description : String? = nil,
        role : String? = nil,
        s3_location : String? = nil
      ) : Protocol::Request
        input = Types::UpdateWorkspaceRequest.new(workspace_id: workspace_id, description: description, role: role, s3_location: s3_location)
        update_workspace(input)
      end
      def update_workspace(input : Types::UpdateWorkspaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_WORKSPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
