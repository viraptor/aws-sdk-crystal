module AwsSdk
  module AppIntegrations
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

      # Creates and persists an Application resource.
      def create_application(
        application_source_config : Types::ApplicationSourceConfig,
        name : String,
        namespace : String,
        application_config : Types::ApplicationConfig? = nil,
        application_type : String? = nil,
        client_token : String? = nil,
        description : String? = nil,
        iframe_config : Types::IframeConfig? = nil,
        initialization_timeout : Int32? = nil,
        is_service : Bool? = nil,
        permissions : Array(String)? = nil,
        publications : Array(Types::Publication)? = nil,
        subscriptions : Array(Types::Subscription)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(application_source_config: application_source_config, name: name, namespace: namespace, application_config: application_config, application_type: application_type, client_token: client_token, description: description, iframe_config: iframe_config, initialization_timeout: initialization_timeout, is_service: is_service, permissions: permissions, publications: publications, subscriptions: subscriptions, tags: tags)
        create_application(input)
      end
      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and persists a DataIntegration resource. You cannot create a DataIntegration association for
      # a DataIntegration that has been previously associated. Use a different DataIntegration, or recreate
      # the DataIntegration using the CreateDataIntegration API.
      def create_data_integration(
        kms_key : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        file_configuration : Types::FileConfiguration? = nil,
        object_configuration : Hash(String, Hash(String, Array(String)))? = nil,
        schedule_config : Types::ScheduleConfiguration? = nil,
        source_uri : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDataIntegrationRequest.new(kms_key: kms_key, name: name, client_token: client_token, description: description, file_configuration: file_configuration, object_configuration: object_configuration, schedule_config: schedule_config, source_uri: source_uri, tags: tags)
        create_data_integration(input)
      end
      def create_data_integration(input : Types::CreateDataIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates and persists a DataIntegrationAssociation resource.
      def create_data_integration_association(
        data_integration_identifier : String,
        client_association_metadata : Hash(String, String)? = nil,
        client_id : String? = nil,
        client_token : String? = nil,
        destination_uri : String? = nil,
        execution_configuration : Types::ExecutionConfiguration? = nil,
        object_configuration : Hash(String, Hash(String, Array(String)))? = nil
      ) : Protocol::Request
        input = Types::CreateDataIntegrationAssociationRequest.new(data_integration_identifier: data_integration_identifier, client_association_metadata: client_association_metadata, client_id: client_id, client_token: client_token, destination_uri: destination_uri, execution_configuration: execution_configuration, object_configuration: object_configuration)
        create_data_integration_association(input)
      end
      def create_data_integration_association(input : Types::CreateDataIntegrationAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_INTEGRATION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an EventIntegration, given a specified name, description, and a reference to an Amazon
      # EventBridge bus in your account and a partner event source that pushes events to that bus. No
      # objects are created in the your account, only metadata that is persisted on the EventIntegration
      # control plane.
      def create_event_integration(
        event_bridge_bus : String,
        event_filter : Types::EventFilter,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEventIntegrationRequest.new(event_bridge_bus: event_bridge_bus, event_filter: event_filter, name: name, client_token: client_token, description: description, tags: tags)
        create_event_integration(input)
      end
      def create_event_integration(input : Types::CreateEventIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_EVENT_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the Application. Only Applications that don't have any Application Associations can be
      # deleted.
      def delete_application(
        arn : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(arn: arn)
        delete_application(input)
      end
      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the DataIntegration. Only DataIntegrations that don't have any DataIntegrationAssociations
      # can be deleted. Deleting a DataIntegration also deletes the underlying Amazon AppFlow flow and
      # service linked role. You cannot create a DataIntegration association for a DataIntegration that has
      # been previously associated. Use a different DataIntegration, or recreate the DataIntegration using
      # the CreateDataIntegration API.
      def delete_data_integration(
        data_integration_identifier : String
      ) : Protocol::Request
        input = Types::DeleteDataIntegrationRequest.new(data_integration_identifier: data_integration_identifier)
        delete_data_integration(input)
      end
      def delete_data_integration(input : Types::DeleteDataIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified existing event integration. If the event integration is associated with
      # clients, the request is rejected.
      def delete_event_integration(
        name : String
      ) : Protocol::Request
        input = Types::DeleteEventIntegrationRequest.new(name: name)
        delete_event_integration(input)
      end
      def delete_event_integration(input : Types::DeleteEventIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_EVENT_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get an Application resource.
      def get_application(
        arn : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(arn: arn)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the DataIntegration. You cannot create a DataIntegration association for a
      # DataIntegration that has been previously associated. Use a different DataIntegration, or recreate
      # the DataIntegration using the CreateDataIntegration API.
      def get_data_integration(
        identifier : String
      ) : Protocol::Request
        input = Types::GetDataIntegrationRequest.new(identifier: identifier)
        get_data_integration(input)
      end
      def get_data_integration(input : Types::GetDataIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns information about the event integration.
      def get_event_integration(
        name : String
      ) : Protocol::Request
        input = Types::GetEventIntegrationRequest.new(name: name)
        get_event_integration(input)
      end
      def get_event_integration(input : Types::GetEventIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EVENT_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of application associations for an application.
      def list_application_associations(
        application_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationAssociationsRequest.new(application_id: application_id, max_results: max_results, next_token: next_token)
        list_application_associations(input)
      end
      def list_application_associations(input : Types::ListApplicationAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists applications in the account.
      def list_applications(
        application_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(application_type: application_type, max_results: max_results, next_token: next_token)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of DataIntegration associations in the account. You cannot create a
      # DataIntegration association for a DataIntegration that has been previously associated. Use a
      # different DataIntegration, or recreate the DataIntegration using the CreateDataIntegration API.
      def list_data_integration_associations(
        data_integration_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataIntegrationAssociationsRequest.new(data_integration_identifier: data_integration_identifier, max_results: max_results, next_token: next_token)
        list_data_integration_associations(input)
      end
      def list_data_integration_associations(input : Types::ListDataIntegrationAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_INTEGRATION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of DataIntegrations in the account. You cannot create a DataIntegration
      # association for a DataIntegration that has been previously associated. Use a different
      # DataIntegration, or recreate the DataIntegration using the CreateDataIntegration API.
      def list_data_integrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataIntegrationsRequest.new(max_results: max_results, next_token: next_token)
        list_data_integrations(input)
      end
      def list_data_integrations(input : Types::ListDataIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of event integration associations in the account.
      def list_event_integration_associations(
        event_integration_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventIntegrationAssociationsRequest.new(event_integration_name: event_integration_name, max_results: max_results, next_token: next_token)
        list_event_integration_associations(input)
      end
      def list_event_integration_associations(input : Types::ListEventIntegrationAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_INTEGRATION_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a paginated list of event integrations in the account.
      def list_event_integrations(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEventIntegrationsRequest.new(max_results: max_results, next_token: next_token)
        list_event_integrations(input)
      end
      def list_event_integrations(input : Types::ListEventIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_EVENT_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for the specified resource.
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

      # Adds the specified tags to the specified resource.
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

      # Removes the specified tags from the specified resource.
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

      # Updates and persists an Application resource.
      def update_application(
        arn : String,
        application_config : Types::ApplicationConfig? = nil,
        application_source_config : Types::ApplicationSourceConfig? = nil,
        application_type : String? = nil,
        description : String? = nil,
        iframe_config : Types::IframeConfig? = nil,
        initialization_timeout : Int32? = nil,
        is_service : Bool? = nil,
        name : String? = nil,
        permissions : Array(String)? = nil,
        publications : Array(Types::Publication)? = nil,
        subscriptions : Array(Types::Subscription)? = nil
      ) : Protocol::Request
        input = Types::UpdateApplicationRequest.new(arn: arn, application_config: application_config, application_source_config: application_source_config, application_type: application_type, description: description, iframe_config: iframe_config, initialization_timeout: initialization_timeout, is_service: is_service, name: name, permissions: permissions, publications: publications, subscriptions: subscriptions)
        update_application(input)
      end
      def update_application(input : Types::UpdateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the description of a DataIntegration. You cannot create a DataIntegration association for a
      # DataIntegration that has been previously associated. Use a different DataIntegration, or recreate
      # the DataIntegration using the CreateDataIntegration API.
      def update_data_integration(
        identifier : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataIntegrationRequest.new(identifier: identifier, description: description, name: name)
        update_data_integration(input)
      end
      def update_data_integration(input : Types::UpdateDataIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates and persists a DataIntegrationAssociation resource. Updating a DataIntegrationAssociation
      # with ExecutionConfiguration will rerun the on-demand job.
      def update_data_integration_association(
        data_integration_association_identifier : String,
        data_integration_identifier : String,
        execution_configuration : Types::ExecutionConfiguration
      ) : Protocol::Request
        input = Types::UpdateDataIntegrationAssociationRequest.new(data_integration_association_identifier: data_integration_association_identifier, data_integration_identifier: data_integration_identifier, execution_configuration: execution_configuration)
        update_data_integration_association(input)
      end
      def update_data_integration_association(input : Types::UpdateDataIntegrationAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_INTEGRATION_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the description of an event integration.
      def update_event_integration(
        name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateEventIntegrationRequest.new(name: name, description: description)
        update_event_integration(input)
      end
      def update_event_integration(input : Types::UpdateEventIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_EVENT_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
