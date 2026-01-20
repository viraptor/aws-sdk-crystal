module Aws
  module AppSync
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

      # Maps an endpoint to your custom domain.

      def associate_api(
        api_id : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::AssociateApiRequest.new(api_id: api_id, domain_name: domain_name)
        associate_api(input)
      end

      def associate_api(input : Types::AssociateApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an association between a Merged API and source API using the source API's identifier.

      def associate_merged_graphql_api(
        merged_api_identifier : String,
        source_api_identifier : String,
        description : String? = nil,
        source_api_association_config : Types::SourceApiAssociationConfig? = nil
      ) : Protocol::Request
        input = Types::AssociateMergedGraphqlApiRequest.new(merged_api_identifier: merged_api_identifier, source_api_identifier: source_api_identifier, description: description, source_api_association_config: source_api_association_config)
        associate_merged_graphql_api(input)
      end

      def associate_merged_graphql_api(input : Types::AssociateMergedGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_MERGED_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an association between a Merged API and source API using the Merged API's identifier.

      def associate_source_graphql_api(
        merged_api_identifier : String,
        source_api_identifier : String,
        description : String? = nil,
        source_api_association_config : Types::SourceApiAssociationConfig? = nil
      ) : Protocol::Request
        input = Types::AssociateSourceGraphqlApiRequest.new(merged_api_identifier: merged_api_identifier, source_api_identifier: source_api_identifier, description: description, source_api_association_config: source_api_association_config)
        associate_source_graphql_api(input)
      end

      def associate_source_graphql_api(input : Types::AssociateSourceGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::ASSOCIATE_SOURCE_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Api object. Use this operation to create an AppSync API with your preferred
      # configuration, such as an Event API that provides real-time message publishing and message
      # subscriptions over WebSockets.

      def create_api(
        event_config : Types::EventConfig,
        name : String,
        owner_contact : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApiRequest.new(event_config: event_config, name: name, owner_contact: owner_contact, tags: tags)
        create_api(input)
      end

      def create_api(input : Types::CreateApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a cache for the GraphQL API.

      def create_api_cache(
        api_caching_behavior : String,
        api_id : String,
        ttl : Int64,
        type : String,
        at_rest_encryption_enabled : Bool? = nil,
        health_metrics_config : String? = nil,
        transit_encryption_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateApiCacheRequest.new(api_caching_behavior: api_caching_behavior, api_id: api_id, ttl: ttl, type: type, at_rest_encryption_enabled: at_rest_encryption_enabled, health_metrics_config: health_metrics_config, transit_encryption_enabled: transit_encryption_enabled)
        create_api_cache(input)
      end

      def create_api_cache(input : Types::CreateApiCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a unique key that you can distribute to clients who invoke your API.

      def create_api_key(
        api_id : String,
        description : String? = nil,
        expires : Int64? = nil
      ) : Protocol::Request
        input = Types::CreateApiKeyRequest.new(api_id: api_id, description: description, expires: expires)
        create_api_key(input)
      end

      def create_api_key(input : Types::CreateApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a ChannelNamespace for an Api .

      def create_channel_namespace(
        api_id : String,
        name : String,
        code_handlers : String? = nil,
        handler_configs : Types::HandlerConfigs? = nil,
        publish_auth_modes : Array(Types::AuthMode)? = nil,
        subscribe_auth_modes : Array(Types::AuthMode)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateChannelNamespaceRequest.new(api_id: api_id, name: name, code_handlers: code_handlers, handler_configs: handler_configs, publish_auth_modes: publish_auth_modes, subscribe_auth_modes: subscribe_auth_modes, tags: tags)
        create_channel_namespace(input)
      end

      def create_channel_namespace(input : Types::CreateChannelNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_CHANNEL_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a DataSource object.

      def create_data_source(
        api_id : String,
        name : String,
        type : String,
        description : String? = nil,
        dynamodb_config : Types::DynamodbDataSourceConfig? = nil,
        elasticsearch_config : Types::ElasticsearchDataSourceConfig? = nil,
        event_bridge_config : Types::EventBridgeDataSourceConfig? = nil,
        http_config : Types::HttpDataSourceConfig? = nil,
        lambda_config : Types::LambdaDataSourceConfig? = nil,
        metrics_config : String? = nil,
        open_search_service_config : Types::OpenSearchServiceDataSourceConfig? = nil,
        relational_database_config : Types::RelationalDatabaseDataSourceConfig? = nil,
        service_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::CreateDataSourceRequest.new(api_id: api_id, name: name, type: type, description: description, dynamodb_config: dynamodb_config, elasticsearch_config: elasticsearch_config, event_bridge_config: event_bridge_config, http_config: http_config, lambda_config: lambda_config, metrics_config: metrics_config, open_search_service_config: open_search_service_config, relational_database_config: relational_database_config, service_role_arn: service_role_arn)
        create_data_source(input)
      end

      def create_data_source(input : Types::CreateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a custom DomainName object.

      def create_domain_name(
        certificate_arn : String,
        domain_name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainNameRequest.new(certificate_arn: certificate_arn, domain_name: domain_name, description: description, tags: tags)
        create_domain_name(input)
      end

      def create_domain_name(input : Types::CreateDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Function object. A function is a reusable entity. You can use multiple functions to
      # compose the resolver logic.

      def create_function(
        api_id : String,
        data_source_name : String,
        name : String,
        code : String? = nil,
        description : String? = nil,
        function_version : String? = nil,
        max_batch_size : Int32? = nil,
        request_mapping_template : String? = nil,
        response_mapping_template : String? = nil,
        runtime : Types::AppSyncRuntime? = nil,
        sync_config : Types::SyncConfig? = nil
      ) : Protocol::Request
        input = Types::CreateFunctionRequest.new(api_id: api_id, data_source_name: data_source_name, name: name, code: code, description: description, function_version: function_version, max_batch_size: max_batch_size, request_mapping_template: request_mapping_template, response_mapping_template: response_mapping_template, runtime: runtime, sync_config: sync_config)
        create_function(input)
      end

      def create_function(input : Types::CreateFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a GraphqlApi object.

      def create_graphql_api(
        authentication_type : String,
        name : String,
        additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)? = nil,
        api_type : String? = nil,
        enhanced_metrics_config : Types::EnhancedMetricsConfig? = nil,
        introspection_config : String? = nil,
        lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
        log_config : Types::LogConfig? = nil,
        merged_api_execution_role_arn : String? = nil,
        open_id_connect_config : Types::OpenIDConnectConfig? = nil,
        owner_contact : String? = nil,
        query_depth_limit : Int32? = nil,
        resolver_count_limit : Int32? = nil,
        tags : Hash(String, String)? = nil,
        user_pool_config : Types::UserPoolConfig? = nil,
        visibility : String? = nil,
        xray_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateGraphqlApiRequest.new(authentication_type: authentication_type, name: name, additional_authentication_providers: additional_authentication_providers, api_type: api_type, enhanced_metrics_config: enhanced_metrics_config, introspection_config: introspection_config, lambda_authorizer_config: lambda_authorizer_config, log_config: log_config, merged_api_execution_role_arn: merged_api_execution_role_arn, open_id_connect_config: open_id_connect_config, owner_contact: owner_contact, query_depth_limit: query_depth_limit, resolver_count_limit: resolver_count_limit, tags: tags, user_pool_config: user_pool_config, visibility: visibility, xray_enabled: xray_enabled)
        create_graphql_api(input)
      end

      def create_graphql_api(input : Types::CreateGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Resolver object. A resolver converts incoming requests into a format that a data source
      # can understand, and converts the data source's responses into GraphQL.

      def create_resolver(
        api_id : String,
        field_name : String,
        type_name : String,
        caching_config : Types::CachingConfig? = nil,
        code : String? = nil,
        data_source_name : String? = nil,
        kind : String? = nil,
        max_batch_size : Int32? = nil,
        metrics_config : String? = nil,
        pipeline_config : Types::PipelineConfig? = nil,
        request_mapping_template : String? = nil,
        response_mapping_template : String? = nil,
        runtime : Types::AppSyncRuntime? = nil,
        sync_config : Types::SyncConfig? = nil
      ) : Protocol::Request
        input = Types::CreateResolverRequest.new(api_id: api_id, field_name: field_name, type_name: type_name, caching_config: caching_config, code: code, data_source_name: data_source_name, kind: kind, max_batch_size: max_batch_size, metrics_config: metrics_config, pipeline_config: pipeline_config, request_mapping_template: request_mapping_template, response_mapping_template: response_mapping_template, runtime: runtime, sync_config: sync_config)
        create_resolver(input)
      end

      def create_resolver(input : Types::CreateResolverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Type object.

      def create_type(
        api_id : String,
        definition : String,
        format : String
      ) : Protocol::Request
        input = Types::CreateTypeRequest.new(api_id: api_id, definition: definition, format: format)
        create_type(input)
      end

      def create_type(input : Types::CreateTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Api object

      def delete_api(
        api_id : String
      ) : Protocol::Request
        input = Types::DeleteApiRequest.new(api_id: api_id)
        delete_api(input)
      end

      def delete_api(input : Types::DeleteApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an ApiCache object.

      def delete_api_cache(
        api_id : String
      ) : Protocol::Request
        input = Types::DeleteApiCacheRequest.new(api_id: api_id)
        delete_api_cache(input)
      end

      def delete_api_cache(input : Types::DeleteApiCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_API_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an API key.

      def delete_api_key(
        api_id : String,
        id : String
      ) : Protocol::Request
        input = Types::DeleteApiKeyRequest.new(api_id: api_id, id: id)
        delete_api_key(input)
      end

      def delete_api_key(input : Types::DeleteApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a ChannelNamespace .

      def delete_channel_namespace(
        api_id : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteChannelNamespaceRequest.new(api_id: api_id, name: name)
        delete_channel_namespace(input)
      end

      def delete_channel_namespace(input : Types::DeleteChannelNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CHANNEL_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a DataSource object.

      def delete_data_source(
        api_id : String,
        name : String
      ) : Protocol::Request
        input = Types::DeleteDataSourceRequest.new(api_id: api_id, name: name)
        delete_data_source(input)
      end

      def delete_data_source(input : Types::DeleteDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a custom DomainName object.

      def delete_domain_name(
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteDomainNameRequest.new(domain_name: domain_name)
        delete_domain_name(input)
      end

      def delete_domain_name(input : Types::DeleteDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Function .

      def delete_function(
        api_id : String,
        function_id : String
      ) : Protocol::Request
        input = Types::DeleteFunctionRequest.new(api_id: api_id, function_id: function_id)
        delete_function(input)
      end

      def delete_function(input : Types::DeleteFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a GraphqlApi object.

      def delete_graphql_api(
        api_id : String
      ) : Protocol::Request
        input = Types::DeleteGraphqlApiRequest.new(api_id: api_id)
        delete_graphql_api(input)
      end

      def delete_graphql_api(input : Types::DeleteGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Resolver object.

      def delete_resolver(
        api_id : String,
        field_name : String,
        type_name : String
      ) : Protocol::Request
        input = Types::DeleteResolverRequest.new(api_id: api_id, field_name: field_name, type_name: type_name)
        delete_resolver(input)
      end

      def delete_resolver(input : Types::DeleteResolverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Type object.

      def delete_type(
        api_id : String,
        type_name : String
      ) : Protocol::Request
        input = Types::DeleteTypeRequest.new(api_id: api_id, type_name: type_name)
        delete_type(input)
      end

      def delete_type(input : Types::DeleteTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes an ApiAssociation object from a custom domain.

      def disassociate_api(
        domain_name : String
      ) : Protocol::Request
        input = Types::DisassociateApiRequest.new(domain_name: domain_name)
        disassociate_api(input)
      end

      def disassociate_api(input : Types::DisassociateApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an association between a Merged API and source API using the source API's identifier and the
      # association ID.

      def disassociate_merged_graphql_api(
        association_id : String,
        source_api_identifier : String
      ) : Protocol::Request
        input = Types::DisassociateMergedGraphqlApiRequest.new(association_id: association_id, source_api_identifier: source_api_identifier)
        disassociate_merged_graphql_api(input)
      end

      def disassociate_merged_graphql_api(input : Types::DisassociateMergedGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_MERGED_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an association between a Merged API and source API using the Merged API's identifier and the
      # association ID.

      def disassociate_source_graphql_api(
        association_id : String,
        merged_api_identifier : String
      ) : Protocol::Request
        input = Types::DisassociateSourceGraphqlApiRequest.new(association_id: association_id, merged_api_identifier: merged_api_identifier)
        disassociate_source_graphql_api(input)
      end

      def disassociate_source_graphql_api(input : Types::DisassociateSourceGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISASSOCIATE_SOURCE_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Evaluates the given code and returns the response. The code definition requirements depend on the
      # specified runtime. For APPSYNC_JS runtimes, the code defines the request and response functions. The
      # request function takes the incoming request after a GraphQL operation is parsed and converts it into
      # a request configuration for the selected data source operation. The response function interprets
      # responses from the data source and maps it to the shape of the GraphQL field output type.

      def evaluate_code(
        code : String,
        context : String,
        runtime : Types::AppSyncRuntime,
        function : String? = nil
      ) : Protocol::Request
        input = Types::EvaluateCodeRequest.new(code: code, context: context, runtime: runtime, function: function)
        evaluate_code(input)
      end

      def evaluate_code(input : Types::EvaluateCodeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EVALUATE_CODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Evaluates a given template and returns the response. The mapping template can be a request or
      # response template. Request templates take the incoming request after a GraphQL operation is parsed
      # and convert it into a request configuration for the selected data source operation. Response
      # templates interpret responses from the data source and map it to the shape of the GraphQL field
      # output type. Mapping templates are written in the Apache Velocity Template Language (VTL).

      def evaluate_mapping_template(
        context : String,
        template : String
      ) : Protocol::Request
        input = Types::EvaluateMappingTemplateRequest.new(context: context, template: template)
        evaluate_mapping_template(input)
      end

      def evaluate_mapping_template(input : Types::EvaluateMappingTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EVALUATE_MAPPING_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Flushes an ApiCache object.

      def flush_api_cache(
        api_id : String
      ) : Protocol::Request
        input = Types::FlushApiCacheRequest.new(api_id: api_id)
        flush_api_cache(input)
      end

      def flush_api_cache(input : Types::FlushApiCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::FLUSH_API_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an Api object.

      def get_api(
        api_id : String
      ) : Protocol::Request
        input = Types::GetApiRequest.new(api_id: api_id)
        get_api(input)
      end

      def get_api(input : Types::GetApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an ApiAssociation object.

      def get_api_association(
        domain_name : String
      ) : Protocol::Request
        input = Types::GetApiAssociationRequest.new(domain_name: domain_name)
        get_api_association(input)
      end

      def get_api_association(input : Types::GetApiAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves an ApiCache object.

      def get_api_cache(
        api_id : String
      ) : Protocol::Request
        input = Types::GetApiCacheRequest.new(api_id: api_id)
        get_api_cache(input)
      end

      def get_api_cache(input : Types::GetApiCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the channel namespace for a specified Api .

      def get_channel_namespace(
        api_id : String,
        name : String
      ) : Protocol::Request
        input = Types::GetChannelNamespaceRequest.new(api_id: api_id, name: name)
        get_channel_namespace(input)
      end

      def get_channel_namespace(input : Types::GetChannelNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CHANNEL_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a DataSource object.

      def get_data_source(
        api_id : String,
        name : String
      ) : Protocol::Request
        input = Types::GetDataSourceRequest.new(api_id: api_id, name: name)
        get_data_source(input)
      end

      def get_data_source(input : Types::GetDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the record of an existing introspection. If the retrieval is successful, the result of the
      # instrospection will also be returned. If the retrieval fails the operation, an error message will be
      # returned instead.

      def get_data_source_introspection(
        introspection_id : String,
        include_models_sdl : Bool? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDataSourceIntrospectionRequest.new(introspection_id: introspection_id, include_models_sdl: include_models_sdl, max_results: max_results, next_token: next_token)
        get_data_source_introspection(input)
      end

      def get_data_source_introspection(input : Types::GetDataSourceIntrospectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DATA_SOURCE_INTROSPECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a custom DomainName object.

      def get_domain_name(
        domain_name : String
      ) : Protocol::Request
        input = Types::GetDomainNameRequest.new(domain_name: domain_name)
        get_domain_name(input)
      end

      def get_domain_name(input : Types::GetDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get a Function .

      def get_function(
        api_id : String,
        function_id : String
      ) : Protocol::Request
        input = Types::GetFunctionRequest.new(api_id: api_id, function_id: function_id)
        get_function(input)
      end

      def get_function(input : Types::GetFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a GraphqlApi object.

      def get_graphql_api(
        api_id : String
      ) : Protocol::Request
        input = Types::GetGraphqlApiRequest.new(api_id: api_id)
        get_graphql_api(input)
      end

      def get_graphql_api(input : Types::GetGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the list of environmental variable key-value pairs associated with an API by its ID value.

      def get_graphql_api_environment_variables(
        api_id : String
      ) : Protocol::Request
        input = Types::GetGraphqlApiEnvironmentVariablesRequest.new(api_id: api_id)
        get_graphql_api_environment_variables(input)
      end

      def get_graphql_api_environment_variables(input : Types::GetGraphqlApiEnvironmentVariablesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GRAPHQL_API_ENVIRONMENT_VARIABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the introspection schema for a GraphQL API.

      def get_introspection_schema(
        api_id : String,
        format : String,
        include_directives : Bool? = nil
      ) : Protocol::Request
        input = Types::GetIntrospectionSchemaRequest.new(api_id: api_id, format: format, include_directives: include_directives)
        get_introspection_schema(input)
      end

      def get_introspection_schema(input : Types::GetIntrospectionSchemaRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTROSPECTION_SCHEMA, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a Resolver object.

      def get_resolver(
        api_id : String,
        field_name : String,
        type_name : String
      ) : Protocol::Request
        input = Types::GetResolverRequest.new(api_id: api_id, field_name: field_name, type_name: type_name)
        get_resolver(input)
      end

      def get_resolver(input : Types::GetResolverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the current status of a schema creation operation.

      def get_schema_creation_status(
        api_id : String
      ) : Protocol::Request
        input = Types::GetSchemaCreationStatusRequest.new(api_id: api_id)
        get_schema_creation_status(input)
      end

      def get_schema_creation_status(input : Types::GetSchemaCreationStatusRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SCHEMA_CREATION_STATUS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a SourceApiAssociation object.

      def get_source_api_association(
        association_id : String,
        merged_api_identifier : String
      ) : Protocol::Request
        input = Types::GetSourceApiAssociationRequest.new(association_id: association_id, merged_api_identifier: merged_api_identifier)
        get_source_api_association(input)
      end

      def get_source_api_association(input : Types::GetSourceApiAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SOURCE_API_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a Type object.

      def get_type(
        api_id : String,
        format : String,
        type_name : String
      ) : Protocol::Request
        input = Types::GetTypeRequest.new(api_id: api_id, format: format, type_name: type_name)
        get_type(input)
      end

      def get_type(input : Types::GetTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the API keys for a given API. API keys are deleted automatically 60 days after they expire.
      # However, they may still be included in the response until they have actually been deleted. You can
      # safely call DeleteApiKey to manually delete a key before it's automatically deleted.

      def list_api_keys(
        api_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApiKeysRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        list_api_keys(input)
      end

      def list_api_keys(input : Types::ListApiKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_API_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the APIs in your AppSync account. ListApis returns only the high level API details. For more
      # detailed information about an API, use GetApi .

      def list_apis(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApisRequest.new(max_results: max_results, next_token: next_token)
        list_apis(input)
      end

      def list_apis(input : Types::ListApisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the channel namespaces for a specified Api . ListChannelNamespaces returns only high level
      # details for the channel namespace. To retrieve code handlers, use GetChannelNamespace .

      def list_channel_namespaces(
        api_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListChannelNamespacesRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        list_channel_namespaces(input)
      end

      def list_channel_namespaces(input : Types::ListChannelNamespacesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_CHANNEL_NAMESPACES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the data sources for a given API.

      def list_data_sources(
        api_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDataSourcesRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        list_data_sources(input)
      end

      def list_data_sources(input : Types::ListDataSourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DATA_SOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists multiple custom domain names.

      def list_domain_names(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListDomainNamesRequest.new(max_results: max_results, next_token: next_token)
        list_domain_names(input)
      end

      def list_domain_names(input : Types::ListDomainNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_DOMAIN_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List multiple functions.

      def list_functions(
        api_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListFunctionsRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        list_functions(input)
      end

      def list_functions(input : Types::ListFunctionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_FUNCTIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists your GraphQL APIs.

      def list_graphql_apis(
        api_type : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        owner : String? = nil
      ) : Protocol::Request
        input = Types::ListGraphqlApisRequest.new(api_type: api_type, max_results: max_results, next_token: next_token, owner: owner)
        list_graphql_apis(input)
      end

      def list_graphql_apis(input : Types::ListGraphqlApisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GRAPHQL_APIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the resolvers for a given API and type.

      def list_resolvers(
        api_id : String,
        type_name : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResolversRequest.new(api_id: api_id, type_name: type_name, max_results: max_results, next_token: next_token)
        list_resolvers(input)
      end

      def list_resolvers(input : Types::ListResolversRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOLVERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the resolvers that are associated with a specific function.

      def list_resolvers_by_function(
        api_id : String,
        function_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListResolversByFunctionRequest.new(api_id: api_id, function_id: function_id, max_results: max_results, next_token: next_token)
        list_resolvers_by_function(input)
      end

      def list_resolvers_by_function(input : Types::ListResolversByFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_RESOLVERS_BY_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the SourceApiAssociationSummary data.

      def list_source_api_associations(
        api_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListSourceApiAssociationsRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        list_source_api_associations(input)
      end

      def list_source_api_associations(input : Types::ListSourceApiAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SOURCE_API_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags for a resource.

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

      # Lists the types for a given API.

      def list_types(
        api_id : String,
        format : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTypesRequest.new(api_id: api_id, format: format, max_results: max_results, next_token: next_token)
        list_types(input)
      end

      def list_types(input : Types::ListTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Type objects by the source API association ID.

      def list_types_by_association(
        association_id : String,
        format : String,
        merged_api_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTypesByAssociationRequest.new(association_id: association_id, format: format, merged_api_identifier: merged_api_identifier, max_results: max_results, next_token: next_token)
        list_types_by_association(input)
      end

      def list_types_by_association(input : Types::ListTypesByAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TYPES_BY_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a list of environmental variables in an API by its ID value. When creating an environmental
      # variable, it must follow the constraints below: Both JavaScript and VTL templates support
      # environmental variables. Environmental variables are not evaluated before function invocation.
      # Environmental variables only support string values. Any defined value in an environmental variable
      # is considered a string literal and not expanded. Variable evaluations should ideally be performed in
      # the function code. When creating an environmental variable key-value pair, it must follow the
      # additional constraints below: Keys must begin with a letter. Keys must be at least two characters
      # long. Keys can only contain letters, numbers, and the underscore character (_). Values can be up to
      # 512 characters long. You can configure up to 50 key-value pairs in a GraphQL API. You can create a
      # list of environmental variables by adding it to the environmentVariables payload as a list in the
      # format {"key1":"value1","key2":"value2", …} . Note that each call of the
      # PutGraphqlApiEnvironmentVariables action will result in the overwriting of the existing
      # environmental variable list of that API. This means the existing environmental variables will be
      # lost. To avoid this, you must include all existing and new environmental variables in the list each
      # time you call this action.

      def put_graphql_api_environment_variables(
        api_id : String,
        environment_variables : Hash(String, String)
      ) : Protocol::Request
        input = Types::PutGraphqlApiEnvironmentVariablesRequest.new(api_id: api_id, environment_variables: environment_variables)
        put_graphql_api_environment_variables(input)
      end

      def put_graphql_api_environment_variables(input : Types::PutGraphqlApiEnvironmentVariablesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_GRAPHQL_API_ENVIRONMENT_VARIABLES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new introspection. Returns the introspectionId of the new introspection after its
      # creation.

      def start_data_source_introspection(
        rds_data_api_config : Types::RdsDataApiConfig? = nil
      ) : Protocol::Request
        input = Types::StartDataSourceIntrospectionRequest.new(rds_data_api_config: rds_data_api_config)
        start_data_source_introspection(input)
      end

      def start_data_source_introspection(input : Types::StartDataSourceIntrospectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_DATA_SOURCE_INTROSPECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new schema to your GraphQL API. This operation is asynchronous. Use to determine when it has
      # completed.

      def start_schema_creation(
        api_id : String,
        definition : Bytes
      ) : Protocol::Request
        input = Types::StartSchemaCreationRequest.new(api_id: api_id, definition: definition)
        start_schema_creation(input)
      end

      def start_schema_creation(input : Types::StartSchemaCreationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SCHEMA_CREATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Initiates a merge operation. Returns a status that shows the result of the merge operation.

      def start_schema_merge(
        association_id : String,
        merged_api_identifier : String
      ) : Protocol::Request
        input = Types::StartSchemaMergeRequest.new(association_id: association_id, merged_api_identifier: merged_api_identifier)
        start_schema_merge(input)
      end

      def start_schema_merge(input : Types::StartSchemaMergeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_SCHEMA_MERGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Tags a resource with user-supplied tags.

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

      # Untags a resource.

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

      # Updates an Api .

      def update_api(
        api_id : String,
        event_config : Types::EventConfig,
        name : String,
        owner_contact : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApiRequest.new(api_id: api_id, event_config: event_config, name: name, owner_contact: owner_contact)
        update_api(input)
      end

      def update_api(input : Types::UpdateApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the cache for the GraphQL API.

      def update_api_cache(
        api_caching_behavior : String,
        api_id : String,
        ttl : Int64,
        type : String,
        health_metrics_config : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApiCacheRequest.new(api_caching_behavior: api_caching_behavior, api_id: api_id, ttl: ttl, type: type, health_metrics_config: health_metrics_config)
        update_api_cache(input)
      end

      def update_api_cache(input : Types::UpdateApiCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an API key. You can update the key as long as it's not deleted.

      def update_api_key(
        api_id : String,
        id : String,
        description : String? = nil,
        expires : Int64? = nil
      ) : Protocol::Request
        input = Types::UpdateApiKeyRequest.new(api_id: api_id, id: id, description: description, expires: expires)
        update_api_key(input)
      end

      def update_api_key(input : Types::UpdateApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a ChannelNamespace associated with an Api .

      def update_channel_namespace(
        api_id : String,
        name : String,
        code_handlers : String? = nil,
        handler_configs : Types::HandlerConfigs? = nil,
        publish_auth_modes : Array(Types::AuthMode)? = nil,
        subscribe_auth_modes : Array(Types::AuthMode)? = nil
      ) : Protocol::Request
        input = Types::UpdateChannelNamespaceRequest.new(api_id: api_id, name: name, code_handlers: code_handlers, handler_configs: handler_configs, publish_auth_modes: publish_auth_modes, subscribe_auth_modes: subscribe_auth_modes)
        update_channel_namespace(input)
      end

      def update_channel_namespace(input : Types::UpdateChannelNamespaceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CHANNEL_NAMESPACE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a DataSource object.

      def update_data_source(
        api_id : String,
        name : String,
        type : String,
        description : String? = nil,
        dynamodb_config : Types::DynamodbDataSourceConfig? = nil,
        elasticsearch_config : Types::ElasticsearchDataSourceConfig? = nil,
        event_bridge_config : Types::EventBridgeDataSourceConfig? = nil,
        http_config : Types::HttpDataSourceConfig? = nil,
        lambda_config : Types::LambdaDataSourceConfig? = nil,
        metrics_config : String? = nil,
        open_search_service_config : Types::OpenSearchServiceDataSourceConfig? = nil,
        relational_database_config : Types::RelationalDatabaseDataSourceConfig? = nil,
        service_role_arn : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDataSourceRequest.new(api_id: api_id, name: name, type: type, description: description, dynamodb_config: dynamodb_config, elasticsearch_config: elasticsearch_config, event_bridge_config: event_bridge_config, http_config: http_config, lambda_config: lambda_config, metrics_config: metrics_config, open_search_service_config: open_search_service_config, relational_database_config: relational_database_config, service_role_arn: service_role_arn)
        update_data_source(input)
      end

      def update_data_source(input : Types::UpdateDataSourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DATA_SOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a custom DomainName object.

      def update_domain_name(
        domain_name : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainNameRequest.new(domain_name: domain_name, description: description)
        update_domain_name(input)
      end

      def update_domain_name(input : Types::UpdateDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Function object.

      def update_function(
        api_id : String,
        data_source_name : String,
        function_id : String,
        name : String,
        code : String? = nil,
        description : String? = nil,
        function_version : String? = nil,
        max_batch_size : Int32? = nil,
        request_mapping_template : String? = nil,
        response_mapping_template : String? = nil,
        runtime : Types::AppSyncRuntime? = nil,
        sync_config : Types::SyncConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateFunctionRequest.new(api_id: api_id, data_source_name: data_source_name, function_id: function_id, name: name, code: code, description: description, function_version: function_version, max_batch_size: max_batch_size, request_mapping_template: request_mapping_template, response_mapping_template: response_mapping_template, runtime: runtime, sync_config: sync_config)
        update_function(input)
      end

      def update_function(input : Types::UpdateFunctionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_FUNCTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a GraphqlApi object.

      def update_graphql_api(
        api_id : String,
        authentication_type : String,
        name : String,
        additional_authentication_providers : Array(Types::AdditionalAuthenticationProvider)? = nil,
        enhanced_metrics_config : Types::EnhancedMetricsConfig? = nil,
        introspection_config : String? = nil,
        lambda_authorizer_config : Types::LambdaAuthorizerConfig? = nil,
        log_config : Types::LogConfig? = nil,
        merged_api_execution_role_arn : String? = nil,
        open_id_connect_config : Types::OpenIDConnectConfig? = nil,
        owner_contact : String? = nil,
        query_depth_limit : Int32? = nil,
        resolver_count_limit : Int32? = nil,
        user_pool_config : Types::UserPoolConfig? = nil,
        xray_enabled : Bool? = nil
      ) : Protocol::Request
        input = Types::UpdateGraphqlApiRequest.new(api_id: api_id, authentication_type: authentication_type, name: name, additional_authentication_providers: additional_authentication_providers, enhanced_metrics_config: enhanced_metrics_config, introspection_config: introspection_config, lambda_authorizer_config: lambda_authorizer_config, log_config: log_config, merged_api_execution_role_arn: merged_api_execution_role_arn, open_id_connect_config: open_id_connect_config, owner_contact: owner_contact, query_depth_limit: query_depth_limit, resolver_count_limit: resolver_count_limit, user_pool_config: user_pool_config, xray_enabled: xray_enabled)
        update_graphql_api(input)
      end

      def update_graphql_api(input : Types::UpdateGraphqlApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GRAPHQL_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Resolver object.

      def update_resolver(
        api_id : String,
        field_name : String,
        type_name : String,
        caching_config : Types::CachingConfig? = nil,
        code : String? = nil,
        data_source_name : String? = nil,
        kind : String? = nil,
        max_batch_size : Int32? = nil,
        metrics_config : String? = nil,
        pipeline_config : Types::PipelineConfig? = nil,
        request_mapping_template : String? = nil,
        response_mapping_template : String? = nil,
        runtime : Types::AppSyncRuntime? = nil,
        sync_config : Types::SyncConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateResolverRequest.new(api_id: api_id, field_name: field_name, type_name: type_name, caching_config: caching_config, code: code, data_source_name: data_source_name, kind: kind, max_batch_size: max_batch_size, metrics_config: metrics_config, pipeline_config: pipeline_config, request_mapping_template: request_mapping_template, response_mapping_template: response_mapping_template, runtime: runtime, sync_config: sync_config)
        update_resolver(input)
      end

      def update_resolver(input : Types::UpdateResolverRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOLVER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates some of the configuration choices of a particular source API association.

      def update_source_api_association(
        association_id : String,
        merged_api_identifier : String,
        description : String? = nil,
        source_api_association_config : Types::SourceApiAssociationConfig? = nil
      ) : Protocol::Request
        input = Types::UpdateSourceApiAssociationRequest.new(association_id: association_id, merged_api_identifier: merged_api_identifier, description: description, source_api_association_config: source_api_association_config)
        update_source_api_association(input)
      end

      def update_source_api_association(input : Types::UpdateSourceApiAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_SOURCE_API_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Type object.

      def update_type(
        api_id : String,
        format : String,
        type_name : String,
        definition : String? = nil
      ) : Protocol::Request
        input = Types::UpdateTypeRequest.new(api_id: api_id, format: format, type_name: type_name, definition: definition)
        update_type(input)
      end

      def update_type(input : Types::UpdateTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
