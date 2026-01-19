module AwsSdk
  module IoTThingsGraph
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

      # Associates a device with a concrete thing that is in the user's registry. A thing can be associated
      # with only one device at a time. If you associate a thing with a new device id, its previous
      # association will be removed.
      def associate_entity_to_thing(
        entity_id : String,
        thing_name : String,
        namespace_version : Int64? = nil
      ) : Types::AssociateEntityToThingResponse
        input = Types::AssociateEntityToThingRequest.new(entity_id: entity_id, thing_name: thing_name, namespace_version: namespace_version)
        associate_entity_to_thing(input)
      end
      def associate_entity_to_thing(input : Types::AssociateEntityToThingRequest) : Types::AssociateEntityToThingResponse
        request = Protocol::JsonRpc.build_request(Model::ASSOCIATE_ENTITY_TO_THING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::AssociateEntityToThingResponse, "AssociateEntityToThing")
      end

      # Creates a workflow template. Workflows can be created only in the user's namespace. (The public
      # namespace contains only entities.) The workflow can contain only entities in the specified
      # namespace. The workflow is validated against the entities in the latest version of the user's
      # namespace unless another namespace version is specified in the request.
      def create_flow_template(
        definition : Types::DefinitionDocument,
        compatible_namespace_version : Int64? = nil
      ) : Types::CreateFlowTemplateResponse
        input = Types::CreateFlowTemplateRequest.new(definition: definition, compatible_namespace_version: compatible_namespace_version)
        create_flow_template(input)
      end
      def create_flow_template(input : Types::CreateFlowTemplateRequest) : Types::CreateFlowTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_FLOW_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateFlowTemplateResponse, "CreateFlowTemplate")
      end

      # Creates a system instance. This action validates the system instance, prepares the
      # deployment-related resources. For Greengrass deployments, it updates the Greengrass group that is
      # specified by the greengrassGroupName parameter. It also adds a file to the S3 bucket specified by
      # the s3BucketName parameter. You need to call DeploySystemInstance after running this action. For
      # Greengrass deployments, since this action modifies and adds resources to a Greengrass group and an
      # S3 bucket on the caller's behalf, the calling identity must have write permissions to both the
      # specified Greengrass group and S3 bucket. Otherwise, the call will fail with an authorization error.
      # For cloud deployments, this action requires a flowActionsRoleArn value. This is an IAM role that has
      # permissions to access AWS services, such as AWS Lambda and AWS IoT, that the flow uses when it
      # executes. If the definition document doesn't specify a version of the user's namespace, the latest
      # version will be used by default.
      def create_system_instance(
        definition : Types::DefinitionDocument,
        target : String,
        flow_actions_role_arn : String? = nil,
        greengrass_group_name : String? = nil,
        metrics_configuration : Types::MetricsConfiguration? = nil,
        s3_bucket_name : String? = nil,
        tags : Array(Types::Tag)? = nil
      ) : Types::CreateSystemInstanceResponse
        input = Types::CreateSystemInstanceRequest.new(definition: definition, target: target, flow_actions_role_arn: flow_actions_role_arn, greengrass_group_name: greengrass_group_name, metrics_configuration: metrics_configuration, s3_bucket_name: s3_bucket_name, tags: tags)
        create_system_instance(input)
      end
      def create_system_instance(input : Types::CreateSystemInstanceRequest) : Types::CreateSystemInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SYSTEM_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSystemInstanceResponse, "CreateSystemInstance")
      end

      # Creates a system. The system is validated against the entities in the latest version of the user's
      # namespace unless another namespace version is specified in the request.
      def create_system_template(
        definition : Types::DefinitionDocument,
        compatible_namespace_version : Int64? = nil
      ) : Types::CreateSystemTemplateResponse
        input = Types::CreateSystemTemplateRequest.new(definition: definition, compatible_namespace_version: compatible_namespace_version)
        create_system_template(input)
      end
      def create_system_template(input : Types::CreateSystemTemplateRequest) : Types::CreateSystemTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::CREATE_SYSTEM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::CreateSystemTemplateResponse, "CreateSystemTemplate")
      end

      # Deletes a workflow. Any new system or deployment that contains this workflow will fail to update or
      # deploy. Existing deployments that contain the workflow will continue to run (since they use a
      # snapshot of the workflow taken at the time of deployment).
      def delete_flow_template(
        id : String
      ) : Types::DeleteFlowTemplateResponse
        input = Types::DeleteFlowTemplateRequest.new(id: id)
        delete_flow_template(input)
      end
      def delete_flow_template(input : Types::DeleteFlowTemplateRequest) : Types::DeleteFlowTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_FLOW_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteFlowTemplateResponse, "DeleteFlowTemplate")
      end

      # Deletes the specified namespace. This action deletes all of the entities in the namespace. Delete
      # the systems and flows that use entities in the namespace before performing this action. This action
      # takes no request parameters.
      def delete_namespace : Types::DeleteNamespaceResponse
        input = Types::DeleteNamespaceRequest.new
        delete_namespace(input)
      end
      def delete_namespace(input : Types::DeleteNamespaceRequest) : Types::DeleteNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteNamespaceResponse, "DeleteNamespace")
      end

      # Deletes a system instance. Only system instances that have never been deployed, or that have been
      # undeployed can be deleted. Users can create a new system instance that has the same ID as a deleted
      # system instance.
      def delete_system_instance(
        id : String? = nil
      ) : Types::DeleteSystemInstanceResponse
        input = Types::DeleteSystemInstanceRequest.new(id: id)
        delete_system_instance(input)
      end
      def delete_system_instance(input : Types::DeleteSystemInstanceRequest) : Types::DeleteSystemInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SYSTEM_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSystemInstanceResponse, "DeleteSystemInstance")
      end

      # Deletes a system. New deployments can't contain the system after its deletion. Existing deployments
      # that contain the system will continue to work because they use a snapshot of the system that is
      # taken when it is deployed.
      def delete_system_template(
        id : String
      ) : Types::DeleteSystemTemplateResponse
        input = Types::DeleteSystemTemplateRequest.new(id: id)
        delete_system_template(input)
      end
      def delete_system_template(input : Types::DeleteSystemTemplateRequest) : Types::DeleteSystemTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DELETE_SYSTEM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeleteSystemTemplateResponse, "DeleteSystemTemplate")
      end

      # Greengrass and Cloud Deployments Deploys the system instance to the target specified in
      # CreateSystemInstance . Greengrass Deployments If the system or any workflows and entities have been
      # updated before this action is called, then the deployment will create a new Amazon Simple Storage
      # Service resource file and then deploy it. Since this action creates a Greengrass deployment on the
      # caller's behalf, the calling identity must have write permissions to the specified Greengrass group.
      # Otherwise, the call will fail with an authorization error. For information about the artifacts that
      # get added to your Greengrass core device when you use this API, see AWS IoT Things Graph and AWS IoT
      # Greengrass .
      def deploy_system_instance(
        id : String? = nil
      ) : Types::DeploySystemInstanceResponse
        input = Types::DeploySystemInstanceRequest.new(id: id)
        deploy_system_instance(input)
      end
      def deploy_system_instance(input : Types::DeploySystemInstanceRequest) : Types::DeploySystemInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::DEPLOY_SYSTEM_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeploySystemInstanceResponse, "DeploySystemInstance")
      end

      # Deprecates the specified workflow. This action marks the workflow for deletion. Deprecated flows
      # can't be deployed, but existing deployments will continue to run.
      def deprecate_flow_template(
        id : String
      ) : Types::DeprecateFlowTemplateResponse
        input = Types::DeprecateFlowTemplateRequest.new(id: id)
        deprecate_flow_template(input)
      end
      def deprecate_flow_template(input : Types::DeprecateFlowTemplateRequest) : Types::DeprecateFlowTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DEPRECATE_FLOW_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeprecateFlowTemplateResponse, "DeprecateFlowTemplate")
      end

      # Deprecates the specified system.
      def deprecate_system_template(
        id : String
      ) : Types::DeprecateSystemTemplateResponse
        input = Types::DeprecateSystemTemplateRequest.new(id: id)
        deprecate_system_template(input)
      end
      def deprecate_system_template(input : Types::DeprecateSystemTemplateRequest) : Types::DeprecateSystemTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::DEPRECATE_SYSTEM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DeprecateSystemTemplateResponse, "DeprecateSystemTemplate")
      end

      # Gets the latest version of the user's namespace and the public version that it is tracking.
      def describe_namespace(
        namespace_name : String? = nil
      ) : Types::DescribeNamespaceResponse
        input = Types::DescribeNamespaceRequest.new(namespace_name: namespace_name)
        describe_namespace(input)
      end
      def describe_namespace(input : Types::DescribeNamespaceRequest) : Types::DescribeNamespaceResponse
        request = Protocol::JsonRpc.build_request(Model::DESCRIBE_NAMESPACE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DescribeNamespaceResponse, "DescribeNamespace")
      end

      # Dissociates a device entity from a concrete thing. The action takes only the type of the entity that
      # you need to dissociate because only one entity of a particular type can be associated with a thing.
      def dissociate_entity_from_thing(
        entity_type : String,
        thing_name : String
      ) : Types::DissociateEntityFromThingResponse
        input = Types::DissociateEntityFromThingRequest.new(entity_type: entity_type, thing_name: thing_name)
        dissociate_entity_from_thing(input)
      end
      def dissociate_entity_from_thing(input : Types::DissociateEntityFromThingRequest) : Types::DissociateEntityFromThingResponse
        request = Protocol::JsonRpc.build_request(Model::DISSOCIATE_ENTITY_FROM_THING, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::DissociateEntityFromThingResponse, "DissociateEntityFromThing")
      end

      # Gets definitions of the specified entities. Uses the latest version of the user's namespace by
      # default. This API returns the following TDM entities. Properties States Events Actions Capabilities
      # Mappings Devices Device Models Services This action doesn't return definitions for systems, flows,
      # and deployments.
      def get_entities(
        ids : Array(String),
        namespace_version : Int64? = nil
      ) : Types::GetEntitiesResponse
        input = Types::GetEntitiesRequest.new(ids: ids, namespace_version: namespace_version)
        get_entities(input)
      end
      def get_entities(input : Types::GetEntitiesRequest) : Types::GetEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::GET_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetEntitiesResponse, "GetEntities")
      end

      # Gets the latest version of the DefinitionDocument and FlowTemplateSummary for the specified
      # workflow.
      def get_flow_template(
        id : String,
        revision_number : Int64? = nil
      ) : Types::GetFlowTemplateResponse
        input = Types::GetFlowTemplateRequest.new(id: id, revision_number: revision_number)
        get_flow_template(input)
      end
      def get_flow_template(input : Types::GetFlowTemplateRequest) : Types::GetFlowTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FLOW_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFlowTemplateResponse, "GetFlowTemplate")
      end

      # Gets revisions of the specified workflow. Only the last 100 revisions are stored. If the workflow
      # has been deprecated, this action will return revisions that occurred before the deprecation. This
      # action won't work for workflows that have been deleted.
      def get_flow_template_revisions(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetFlowTemplateRevisionsResponse
        input = Types::GetFlowTemplateRevisionsRequest.new(id: id, max_results: max_results, next_token: next_token)
        get_flow_template_revisions(input)
      end
      def get_flow_template_revisions(input : Types::GetFlowTemplateRevisionsRequest) : Types::GetFlowTemplateRevisionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_FLOW_TEMPLATE_REVISIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetFlowTemplateRevisionsResponse, "GetFlowTemplateRevisions")
      end

      # Gets the status of a namespace deletion task.
      def get_namespace_deletion_status : Types::GetNamespaceDeletionStatusResponse
        input = Types::GetNamespaceDeletionStatusRequest.new
        get_namespace_deletion_status(input)
      end
      def get_namespace_deletion_status(input : Types::GetNamespaceDeletionStatusRequest) : Types::GetNamespaceDeletionStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_NAMESPACE_DELETION_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetNamespaceDeletionStatusResponse, "GetNamespaceDeletionStatus")
      end

      # Gets a system instance.
      def get_system_instance(
        id : String
      ) : Types::GetSystemInstanceResponse
        input = Types::GetSystemInstanceRequest.new(id: id)
        get_system_instance(input)
      end
      def get_system_instance(input : Types::GetSystemInstanceRequest) : Types::GetSystemInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SYSTEM_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSystemInstanceResponse, "GetSystemInstance")
      end

      # Gets a system.
      def get_system_template(
        id : String,
        revision_number : Int64? = nil
      ) : Types::GetSystemTemplateResponse
        input = Types::GetSystemTemplateRequest.new(id: id, revision_number: revision_number)
        get_system_template(input)
      end
      def get_system_template(input : Types::GetSystemTemplateRequest) : Types::GetSystemTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SYSTEM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSystemTemplateResponse, "GetSystemTemplate")
      end

      # Gets revisions made to the specified system template. Only the previous 100 revisions are stored. If
      # the system has been deprecated, this action will return the revisions that occurred before its
      # deprecation. This action won't work with systems that have been deleted.
      def get_system_template_revisions(
        id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::GetSystemTemplateRevisionsResponse
        input = Types::GetSystemTemplateRevisionsRequest.new(id: id, max_results: max_results, next_token: next_token)
        get_system_template_revisions(input)
      end
      def get_system_template_revisions(input : Types::GetSystemTemplateRevisionsRequest) : Types::GetSystemTemplateRevisionsResponse
        request = Protocol::JsonRpc.build_request(Model::GET_SYSTEM_TEMPLATE_REVISIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetSystemTemplateRevisionsResponse, "GetSystemTemplateRevisions")
      end

      # Gets the status of the specified upload.
      def get_upload_status(
        upload_id : String
      ) : Types::GetUploadStatusResponse
        input = Types::GetUploadStatusRequest.new(upload_id: upload_id)
        get_upload_status(input)
      end
      def get_upload_status(input : Types::GetUploadStatusRequest) : Types::GetUploadStatusResponse
        request = Protocol::JsonRpc.build_request(Model::GET_UPLOAD_STATUS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::GetUploadStatusResponse, "GetUploadStatus")
      end

      # Returns a list of objects that contain information about events in a flow execution.
      def list_flow_execution_messages(
        flow_execution_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListFlowExecutionMessagesResponse
        input = Types::ListFlowExecutionMessagesRequest.new(flow_execution_id: flow_execution_id, max_results: max_results, next_token: next_token)
        list_flow_execution_messages(input)
      end
      def list_flow_execution_messages(input : Types::ListFlowExecutionMessagesRequest) : Types::ListFlowExecutionMessagesResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_FLOW_EXECUTION_MESSAGES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListFlowExecutionMessagesResponse, "ListFlowExecutionMessages")
      end

      # Lists all tags on an AWS IoT Things Graph resource.
      def list_tags_for_resource(
        resource_arn : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::ListTagsForResourceResponse
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn, max_results: max_results, next_token: next_token)
        list_tags_for_resource(input)
      end
      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Types::ListTagsForResourceResponse
        request = Protocol::JsonRpc.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::ListTagsForResourceResponse, "ListTagsForResource")
      end

      # Searches for entities of the specified type. You can search for entities in your namespace and the
      # public namespace that you're tracking.
      def search_entities(
        entity_types : Array(String),
        filters : Array(Types::EntityFilter)? = nil,
        max_results : Int32? = nil,
        namespace_version : Int64? = nil,
        next_token : String? = nil
      ) : Types::SearchEntitiesResponse
        input = Types::SearchEntitiesRequest.new(entity_types: entity_types, filters: filters, max_results: max_results, namespace_version: namespace_version, next_token: next_token)
        search_entities(input)
      end
      def search_entities(input : Types::SearchEntitiesRequest) : Types::SearchEntitiesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_ENTITIES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchEntitiesResponse, "SearchEntities")
      end

      # Searches for AWS IoT Things Graph workflow execution instances.
      def search_flow_executions(
        system_instance_id : String,
        end_time : Time? = nil,
        flow_execution_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        start_time : Time? = nil
      ) : Types::SearchFlowExecutionsResponse
        input = Types::SearchFlowExecutionsRequest.new(system_instance_id: system_instance_id, end_time: end_time, flow_execution_id: flow_execution_id, max_results: max_results, next_token: next_token, start_time: start_time)
        search_flow_executions(input)
      end
      def search_flow_executions(input : Types::SearchFlowExecutionsRequest) : Types::SearchFlowExecutionsResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_FLOW_EXECUTIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchFlowExecutionsResponse, "SearchFlowExecutions")
      end

      # Searches for summary information about workflows.
      def search_flow_templates(
        filters : Array(Types::FlowTemplateFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::SearchFlowTemplatesResponse
        input = Types::SearchFlowTemplatesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_flow_templates(input)
      end
      def search_flow_templates(input : Types::SearchFlowTemplatesRequest) : Types::SearchFlowTemplatesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_FLOW_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchFlowTemplatesResponse, "SearchFlowTemplates")
      end

      # Searches for system instances in the user's account.
      def search_system_instances(
        filters : Array(Types::SystemInstanceFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::SearchSystemInstancesResponse
        input = Types::SearchSystemInstancesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_system_instances(input)
      end
      def search_system_instances(input : Types::SearchSystemInstancesRequest) : Types::SearchSystemInstancesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_SYSTEM_INSTANCES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchSystemInstancesResponse, "SearchSystemInstances")
      end

      # Searches for summary information about systems in the user's account. You can filter by the ID of a
      # workflow to return only systems that use the specified workflow.
      def search_system_templates(
        filters : Array(Types::SystemTemplateFilter)? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Types::SearchSystemTemplatesResponse
        input = Types::SearchSystemTemplatesRequest.new(filters: filters, max_results: max_results, next_token: next_token)
        search_system_templates(input)
      end
      def search_system_templates(input : Types::SearchSystemTemplatesRequest) : Types::SearchSystemTemplatesResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_SYSTEM_TEMPLATES, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchSystemTemplatesResponse, "SearchSystemTemplates")
      end

      # Searches for things associated with the specified entity. You can search by both device and device
      # model. For example, if two different devices, camera1 and camera2, implement the camera device
      # model, the user can associate thing1 to camera1 and thing2 to camera2. SearchThings(camera2) will
      # return only thing2, but SearchThings(camera) will return both thing1 and thing2. This action
      # searches for exact matches and doesn't perform partial text matching.
      def search_things(
        entity_id : String,
        max_results : Int32? = nil,
        namespace_version : Int64? = nil,
        next_token : String? = nil
      ) : Types::SearchThingsResponse
        input = Types::SearchThingsRequest.new(entity_id: entity_id, max_results: max_results, namespace_version: namespace_version, next_token: next_token)
        search_things(input)
      end
      def search_things(input : Types::SearchThingsRequest) : Types::SearchThingsResponse
        request = Protocol::JsonRpc.build_request(Model::SEARCH_THINGS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::SearchThingsResponse, "SearchThings")
      end

      # Creates a tag for the specified resource.
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

      # Removes a system instance from its target (Cloud or Greengrass).
      def undeploy_system_instance(
        id : String? = nil
      ) : Types::UndeploySystemInstanceResponse
        input = Types::UndeploySystemInstanceRequest.new(id: id)
        undeploy_system_instance(input)
      end
      def undeploy_system_instance(input : Types::UndeploySystemInstanceRequest) : Types::UndeploySystemInstanceResponse
        request = Protocol::JsonRpc.build_request(Model::UNDEPLOY_SYSTEM_INSTANCE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UndeploySystemInstanceResponse, "UndeploySystemInstance")
      end

      # Removes a tag from the specified resource.
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

      # Updates the specified workflow. All deployed systems and system instances that use the workflow will
      # see the changes in the flow when it is redeployed. If you don't want this behavior, copy the
      # workflow (creating a new workflow with a different ID), and update the copy. The workflow can
      # contain only entities in the specified namespace.
      def update_flow_template(
        definition : Types::DefinitionDocument,
        id : String,
        compatible_namespace_version : Int64? = nil
      ) : Types::UpdateFlowTemplateResponse
        input = Types::UpdateFlowTemplateRequest.new(definition: definition, id: id, compatible_namespace_version: compatible_namespace_version)
        update_flow_template(input)
      end
      def update_flow_template(input : Types::UpdateFlowTemplateRequest) : Types::UpdateFlowTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_FLOW_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateFlowTemplateResponse, "UpdateFlowTemplate")
      end

      # Updates the specified system. You don't need to run this action after updating a workflow. Any
      # deployment that uses the system will see the changes in the system when it is redeployed.
      def update_system_template(
        definition : Types::DefinitionDocument,
        id : String,
        compatible_namespace_version : Int64? = nil
      ) : Types::UpdateSystemTemplateResponse
        input = Types::UpdateSystemTemplateRequest.new(definition: definition, id: id, compatible_namespace_version: compatible_namespace_version)
        update_system_template(input)
      end
      def update_system_template(input : Types::UpdateSystemTemplateRequest) : Types::UpdateSystemTemplateResponse
        request = Protocol::JsonRpc.build_request(Model::UPDATE_SYSTEM_TEMPLATE, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UpdateSystemTemplateResponse, "UpdateSystemTemplate")
      end

      # Asynchronously uploads one or more entity definitions to the user's namespace. The document
      # parameter is required if syncWithPublicNamespace and deleteExistingEntites are false. If the
      # syncWithPublicNamespace parameter is set to true , the user's namespace will synchronize with the
      # latest version of the public namespace. If deprecateExistingEntities is set to true, all entities in
      # the latest version will be deleted before the new DefinitionDocument is uploaded. When a user
      # uploads entity definitions for the first time, the service creates a new namespace for the user. The
      # new namespace tracks the public namespace. Currently users can have only one namespace. The
      # namespace version increments whenever a user uploads entity definitions that are
      # backwards-incompatible and whenever a user sets the syncWithPublicNamespace parameter or the
      # deprecateExistingEntities parameter to true . The IDs for all of the entities should be in URN
      # format. Each entity must be in the user's namespace. Users can't create entities in the public
      # namespace, but entity definitions can refer to entities in the public namespace. Valid entities are
      # Device , DeviceModel , Service , Capability , State , Action , Event , Property , Mapping , Enum .
      def upload_entity_definitions(
        deprecate_existing_entities : Bool? = nil,
        document : Types::DefinitionDocument? = nil,
        sync_with_public_namespace : Bool? = nil
      ) : Types::UploadEntityDefinitionsResponse
        input = Types::UploadEntityDefinitionsRequest.new(deprecate_existing_entities: deprecate_existing_entities, document: document, sync_with_public_namespace: sync_with_public_namespace)
        upload_entity_definitions(input)
      end
      def upload_entity_definitions(input : Types::UploadEntityDefinitionsRequest) : Types::UploadEntityDefinitionsResponse
        request = Protocol::JsonRpc.build_request(Model::UPLOAD_ENTITY_DEFINITIONS, input, endpoint)
        request = request.with_headers(endpoint_headers)
        response = runtime.execute(request)
        raise Protocol::JsonRpc.parse_error(response) if response.status >= 300
        Protocol::JsonRpc.parse_response(response, Types::UploadEntityDefinitionsResponse, "UploadEntityDefinitions")
      end
    end
  end
end
