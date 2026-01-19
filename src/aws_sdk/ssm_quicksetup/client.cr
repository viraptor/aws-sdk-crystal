module AwsSdk
  module SSMQuickSetup
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

      # Creates a Quick Setup configuration manager resource. This object is a collection of desired state
      # configurations for multiple configuration definitions and summaries describing the deployments of
      # those definitions.
      def create_configuration_manager(
        configuration_definitions : Array(Types::ConfigurationDefinitionInput),
        description : String? = nil,
        name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateConfigurationManagerInput.new(configuration_definitions: configuration_definitions, description: description, name: name, tags: tags)
        create_configuration_manager(input)
      end
      def create_configuration_manager(input : Types::CreateConfigurationManagerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CONFIGURATION_MANAGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a configuration manager.
      def delete_configuration_manager(
        manager_arn : String
      ) : Protocol::Request
        input = Types::DeleteConfigurationManagerInput.new(manager_arn: manager_arn)
        delete_configuration_manager(input)
      end
      def delete_configuration_manager(input : Types::DeleteConfigurationManagerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CONFIGURATION_MANAGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns details about the specified configuration.
      def get_configuration(
        configuration_id : String
      ) : Protocol::Request
        input = Types::GetConfigurationInput.new(configuration_id: configuration_id)
        get_configuration(input)
      end
      def get_configuration(input : Types::GetConfigurationInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a configuration manager.
      def get_configuration_manager(
        manager_arn : String
      ) : Protocol::Request
        input = Types::GetConfigurationManagerInput.new(manager_arn: manager_arn)
        get_configuration_manager(input)
      end
      def get_configuration_manager(input : Types::GetConfigurationManagerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CONFIGURATION_MANAGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns settings configured for Quick Setup in the requesting Amazon Web Services account and Amazon
      # Web Services Region.
      def get_service_settings : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE_SETTINGS, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns Quick Setup configuration managers.
      def list_configuration_managers(
        filters : Array(Types::Filter)? = nil,
        max_items : Int32? = nil,
        starting_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationManagersInput.new(filters: filters, max_items: max_items, starting_token: starting_token)
        list_configuration_managers(input)
      end
      def list_configuration_managers(input : Types::ListConfigurationManagersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATION_MANAGERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns configurations deployed by Quick Setup in the requesting Amazon Web Services account and
      # Amazon Web Services Region.
      def list_configurations(
        configuration_definition_id : String? = nil,
        filters : Array(Types::Filter)? = nil,
        manager_arn : String? = nil,
        max_items : Int32? = nil,
        starting_token : String? = nil
      ) : Protocol::Request
        input = Types::ListConfigurationsInput.new(configuration_definition_id: configuration_definition_id, filters: filters, manager_arn: manager_arn, max_items: max_items, starting_token: starting_token)
        list_configurations(input)
      end
      def list_configurations(input : Types::ListConfigurationsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CONFIGURATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns the available Quick Setup types.
      def list_quick_setup_types : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_QUICK_SETUP_TYPES, nil, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns tags assigned to the resource.
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

      # Assigns key-value pairs of metadata to Amazon Web Services resources.
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

      # Removes tags from the specified resource.
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

      # Updates a Quick Setup configuration definition.
      def update_configuration_definition(
        id : String,
        manager_arn : String,
        local_deployment_administration_role_arn : String? = nil,
        local_deployment_execution_role_name : String? = nil,
        parameters : Hash(String, String)? = nil,
        type_version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationDefinitionInput.new(id: id, manager_arn: manager_arn, local_deployment_administration_role_arn: local_deployment_administration_role_arn, local_deployment_execution_role_name: local_deployment_execution_role_name, parameters: parameters, type_version: type_version)
        update_configuration_definition(input)
      end
      def update_configuration_definition(input : Types::UpdateConfigurationDefinitionInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_DEFINITION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Quick Setup configuration manager.
      def update_configuration_manager(
        manager_arn : String,
        description : String? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateConfigurationManagerInput.new(manager_arn: manager_arn, description: description, name: name)
        update_configuration_manager(input)
      end
      def update_configuration_manager(input : Types::UpdateConfigurationManagerInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CONFIGURATION_MANAGER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates settings configured for Quick Setup.
      def update_service_settings(
        explorer_enabling_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateServiceSettingsInput.new(explorer_enabling_role_arn: explorer_enabling_role_arn)
        update_service_settings(input)
      end
      def update_service_settings(input : Types::UpdateServiceSettingsInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SERVICE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
