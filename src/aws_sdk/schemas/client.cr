module AwsSdk
  module Schemas
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

      # Creates a discoverer.

      def create_discoverer(
        source_arn : String,
        cross_account : Bool? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDiscovererRequest.new(source_arn: source_arn, cross_account: cross_account, description: description, tags: tags)
        create_discoverer(input)
      end

      def create_discoverer(input : Types::CreateDiscovererRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DISCOVERER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a registry.

      def create_registry(
        registry_name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateRegistryRequest.new(registry_name: registry_name, description: description, tags: tags)
        create_registry(input)
      end

      def create_registry(input : Types::CreateRegistryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REGISTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a schema definition. Inactive schemas will be deleted after two years.

      def create_schema(
        content : String,
        registry_name : String,
        schema_name : String,
        type : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateSchemaRequest.new(content: content, registry_name: registry_name, schema_name: schema_name, type: type, description: description, tags: tags)
        create_schema(input)
      end

      def create_schema(input : Types::CreateSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a discoverer.

      def delete_discoverer(
        discoverer_id : String
      ) : Protocol::Request
        input = Types::DeleteDiscovererRequest.new(discoverer_id: discoverer_id)
        delete_discoverer(input)
      end

      def delete_discoverer(input : Types::DeleteDiscovererRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DISCOVERER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Registry.

      def delete_registry(
        registry_name : String
      ) : Protocol::Request
        input = Types::DeleteRegistryRequest.new(registry_name: registry_name)
        delete_registry(input)
      end

      def delete_registry(input : Types::DeleteRegistryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REGISTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the resource-based policy attached to the specified registry.

      def delete_resource_policy(
        registry_name : String? = nil
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(registry_name: registry_name)
        delete_resource_policy(input)
      end

      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete a schema definition.

      def delete_schema(
        registry_name : String,
        schema_name : String
      ) : Protocol::Request
        input = Types::DeleteSchemaRequest.new(registry_name: registry_name, schema_name: schema_name)
        delete_schema(input)
      end

      def delete_schema(input : Types::DeleteSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Delete the schema version definition

      def delete_schema_version(
        registry_name : String,
        schema_name : String,
        schema_version : String
      ) : Protocol::Request
        input = Types::DeleteSchemaVersionRequest.new(registry_name: registry_name, schema_name: schema_name, schema_version: schema_version)
        delete_schema_version(input)
      end

      def delete_schema_version(input : Types::DeleteSchemaVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SCHEMA_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe the code binding URI.

      def describe_code_binding(
        language : String,
        registry_name : String,
        schema_name : String,
        schema_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeCodeBindingRequest.new(language: language, registry_name: registry_name, schema_name: schema_name, schema_version: schema_version)
        describe_code_binding(input)
      end

      def describe_code_binding(input : Types::DescribeCodeBindingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_CODE_BINDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the discoverer.

      def describe_discoverer(
        discoverer_id : String
      ) : Protocol::Request
        input = Types::DescribeDiscovererRequest.new(discoverer_id: discoverer_id)
        describe_discoverer(input)
      end

      def describe_discoverer(input : Types::DescribeDiscovererRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_DISCOVERER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes the registry.

      def describe_registry(
        registry_name : String
      ) : Protocol::Request
        input = Types::DescribeRegistryRequest.new(registry_name: registry_name)
        describe_registry(input)
      end

      def describe_registry(input : Types::DescribeRegistryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_REGISTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieve the schema definition.

      def describe_schema(
        registry_name : String,
        schema_name : String,
        schema_version : String? = nil
      ) : Protocol::Request
        input = Types::DescribeSchemaRequest.new(registry_name: registry_name, schema_name: schema_name, schema_version: schema_version)
        describe_schema(input)
      end

      def describe_schema(input : Types::DescribeSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports a schema to a different specification.

      def export_schema(
        registry_name : String,
        schema_name : String,
        type : String,
        schema_version : String? = nil
      ) : Protocol::Request
        input = Types::ExportSchemaRequest.new(registry_name: registry_name, schema_name: schema_name, type: type, schema_version: schema_version)
        export_schema(input)
      end

      def export_schema(input : Types::ExportSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the code binding source URI.

      def get_code_binding_source(
        language : String,
        registry_name : String,
        schema_name : String,
        schema_version : String? = nil
      ) : Protocol::Request
        input = Types::GetCodeBindingSourceRequest.new(language: language, registry_name: registry_name, schema_name: schema_name, schema_version: schema_version)
        get_code_binding_source(input)
      end

      def get_code_binding_source(input : Types::GetCodeBindingSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CODE_BINDING_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the discovered schema that was generated based on sampled events.

      def get_discovered_schema(
        events : Array(String),
        type : String
      ) : Protocol::Request
        input = Types::GetDiscoveredSchemaRequest.new(events: events, type: type)
        get_discovered_schema(input)
      end

      def get_discovered_schema(input : Types::GetDiscoveredSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DISCOVERED_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the resource-based policy attached to a given registry.

      def get_resource_policy(
        registry_name : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(registry_name: registry_name)
        get_resource_policy(input)
      end

      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the discoverers.

      def list_discoverers(
        discoverer_id_prefix : String? = nil,
        limit : Int32? = nil,
        next_token : String? = nil,
        source_arn_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListDiscoverersRequest.new(discoverer_id_prefix: discoverer_id_prefix, limit: limit, next_token: next_token, source_arn_prefix: source_arn_prefix)
        list_discoverers(input)
      end

      def list_discoverers(input : Types::ListDiscoverersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DISCOVERERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the registries.

      def list_registries(
        limit : Int32? = nil,
        next_token : String? = nil,
        registry_name_prefix : String? = nil,
        scope : String? = nil
      ) : Protocol::Request
        input = Types::ListRegistriesRequest.new(limit: limit, next_token: next_token, registry_name_prefix: registry_name_prefix, scope: scope)
        list_registries(input)
      end

      def list_registries(input : Types::ListRegistriesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_REGISTRIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a list of the schema versions and related information.

      def list_schema_versions(
        registry_name : String,
        schema_name : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSchemaVersionsRequest.new(registry_name: registry_name, schema_name: schema_name, limit: limit, next_token: next_token)
        list_schema_versions(input)
      end

      def list_schema_versions(input : Types::ListSchemaVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEMA_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the schemas.

      def list_schemas(
        registry_name : String,
        limit : Int32? = nil,
        next_token : String? = nil,
        schema_name_prefix : String? = nil
      ) : Protocol::Request
        input = Types::ListSchemasRequest.new(registry_name: registry_name, limit: limit, next_token: next_token, schema_name_prefix: schema_name_prefix)
        list_schemas(input)
      end

      def list_schemas(input : Types::ListSchemasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SCHEMAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get tags for resource.

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

      # Put code binding URI

      def put_code_binding(
        language : String,
        registry_name : String,
        schema_name : String,
        schema_version : String? = nil
      ) : Protocol::Request
        input = Types::PutCodeBindingRequest.new(language: language, registry_name: registry_name, schema_name: schema_name, schema_version: schema_version)
        put_code_binding(input)
      end

      def put_code_binding(input : Types::PutCodeBindingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_CODE_BINDING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The name of the policy.

      def put_resource_policy(
        policy : String,
        registry_name : String? = nil,
        revision_id : String? = nil
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy: policy, registry_name: registry_name, revision_id: revision_id)
        put_resource_policy(input)
      end

      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Search the schemas

      def search_schemas(
        keywords : String,
        registry_name : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::SearchSchemasRequest.new(keywords: keywords, registry_name: registry_name, limit: limit, next_token: next_token)
        search_schemas(input)
      end

      def search_schemas(input : Types::SearchSchemasRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEARCH_SCHEMAS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts the discoverer

      def start_discoverer(
        discoverer_id : String
      ) : Protocol::Request
        input = Types::StartDiscovererRequest.new(discoverer_id: discoverer_id)
        start_discoverer(input)
      end

      def start_discoverer(input : Types::StartDiscovererRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DISCOVERER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops the discoverer

      def stop_discoverer(
        discoverer_id : String
      ) : Protocol::Request
        input = Types::StopDiscovererRequest.new(discoverer_id: discoverer_id)
        stop_discoverer(input)
      end

      def stop_discoverer(input : Types::StopDiscovererRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_DISCOVERER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add tags to a resource.

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

      # Updates the discoverer

      def update_discoverer(
        discoverer_id : String,
        cross_account : Bool? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDiscovererRequest.new(discoverer_id: discoverer_id, cross_account: cross_account, description: description)
        update_discoverer(input)
      end

      def update_discoverer(input : Types::UpdateDiscovererRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DISCOVERER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a registry.

      def update_registry(
        registry_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRegistryRequest.new(registry_name: registry_name, description: description)
        update_registry(input)
      end

      def update_registry(input : Types::UpdateRegistryRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REGISTRY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the schema definition Inactive schemas will be deleted after two years.

      def update_schema(
        registry_name : String,
        schema_name : String,
        client_token_id : String? = nil,
        content : String? = nil,
        description : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::UpdateSchemaRequest.new(registry_name: registry_name, schema_name: schema_name, client_token_id: client_token_id, content: content, description: description, type: type)
        update_schema(input)
      end

      def update_schema(input : Types::UpdateSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
