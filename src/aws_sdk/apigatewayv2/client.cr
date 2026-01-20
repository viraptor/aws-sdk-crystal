module AwsSdk
  module ApiGatewayV2
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

      # Creates an Api resource.

      def create_api(
        name : String,
        protocol_type : String,
        api_key_selection_expression : String? = nil,
        cors_configuration : Types::Cors? = nil,
        credentials_arn : String? = nil,
        description : String? = nil,
        disable_execute_api_endpoint : Bool? = nil,
        disable_schema_validation : Bool? = nil,
        ip_address_type : String? = nil,
        route_key : String? = nil,
        route_selection_expression : String? = nil,
        tags : Hash(String, String)? = nil,
        target : String? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::CreateApiRequest.new(name: name, protocol_type: protocol_type, api_key_selection_expression: api_key_selection_expression, cors_configuration: cors_configuration, credentials_arn: credentials_arn, description: description, disable_execute_api_endpoint: disable_execute_api_endpoint, disable_schema_validation: disable_schema_validation, ip_address_type: ip_address_type, route_key: route_key, route_selection_expression: route_selection_expression, tags: tags, target: target, version: version)
        create_api(input)
      end

      def create_api(input : Types::CreateApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an API mapping.

      def create_api_mapping(
        api_id : String,
        domain_name : String,
        stage : String,
        api_mapping_key : String? = nil
      ) : Protocol::Request
        input = Types::CreateApiMappingRequest.new(api_id: api_id, domain_name: domain_name, stage: stage, api_mapping_key: api_mapping_key)
        create_api_mapping(input)
      end

      def create_api_mapping(input : Types::CreateApiMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Authorizer for an API.

      def create_authorizer(
        api_id : String,
        authorizer_type : String,
        identity_source : Array(String),
        name : String,
        authorizer_credentials_arn : String? = nil,
        authorizer_payload_format_version : String? = nil,
        authorizer_result_ttl_in_seconds : Int32? = nil,
        authorizer_uri : String? = nil,
        enable_simple_responses : Bool? = nil,
        identity_validation_expression : String? = nil,
        jwt_configuration : Types::JWTConfiguration? = nil
      ) : Protocol::Request
        input = Types::CreateAuthorizerRequest.new(api_id: api_id, authorizer_type: authorizer_type, identity_source: identity_source, name: name, authorizer_credentials_arn: authorizer_credentials_arn, authorizer_payload_format_version: authorizer_payload_format_version, authorizer_result_ttl_in_seconds: authorizer_result_ttl_in_seconds, authorizer_uri: authorizer_uri, enable_simple_responses: enable_simple_responses, identity_validation_expression: identity_validation_expression, jwt_configuration: jwt_configuration)
        create_authorizer(input)
      end

      def create_authorizer(input : Types::CreateAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Deployment for an API.

      def create_deployment(
        api_id : String,
        description : String? = nil,
        stage_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentRequest.new(api_id: api_id, description: description, stage_name: stage_name)
        create_deployment(input)
      end

      def create_deployment(input : Types::CreateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain name.

      def create_domain_name(
        domain_name : String,
        domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
        mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
        routing_mode : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainNameRequest.new(domain_name: domain_name, domain_name_configurations: domain_name_configurations, mutual_tls_authentication: mutual_tls_authentication, routing_mode: routing_mode, tags: tags)
        create_domain_name(input)
      end

      def create_domain_name(input : Types::CreateDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Integration.

      def create_integration(
        api_id : String,
        integration_type : String,
        connection_id : String? = nil,
        connection_type : String? = nil,
        content_handling_strategy : String? = nil,
        credentials_arn : String? = nil,
        description : String? = nil,
        integration_method : String? = nil,
        integration_subtype : String? = nil,
        integration_uri : String? = nil,
        passthrough_behavior : String? = nil,
        payload_format_version : String? = nil,
        request_parameters : Hash(String, String)? = nil,
        request_templates : Hash(String, String)? = nil,
        response_parameters : Hash(String, Hash(String, String))? = nil,
        template_selection_expression : String? = nil,
        timeout_in_millis : Int32? = nil,
        tls_config : Types::TlsConfigInput? = nil
      ) : Protocol::Request
        input = Types::CreateIntegrationRequest.new(api_id: api_id, integration_type: integration_type, connection_id: connection_id, connection_type: connection_type, content_handling_strategy: content_handling_strategy, credentials_arn: credentials_arn, description: description, integration_method: integration_method, integration_subtype: integration_subtype, integration_uri: integration_uri, passthrough_behavior: passthrough_behavior, payload_format_version: payload_format_version, request_parameters: request_parameters, request_templates: request_templates, response_parameters: response_parameters, template_selection_expression: template_selection_expression, timeout_in_millis: timeout_in_millis, tls_config: tls_config)
        create_integration(input)
      end

      def create_integration(input : Types::CreateIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an IntegrationResponses.

      def create_integration_response(
        api_id : String,
        integration_id : String,
        integration_response_key : String,
        content_handling_strategy : String? = nil,
        response_parameters : Hash(String, String)? = nil,
        response_templates : Hash(String, String)? = nil,
        template_selection_expression : String? = nil
      ) : Protocol::Request
        input = Types::CreateIntegrationResponseRequest.new(api_id: api_id, integration_id: integration_id, integration_response_key: integration_response_key, content_handling_strategy: content_handling_strategy, response_parameters: response_parameters, response_templates: response_templates, template_selection_expression: template_selection_expression)
        create_integration_response(input)
      end

      def create_integration_response(input : Types::CreateIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Model for an API.

      def create_model(
        api_id : String,
        name : String,
        schema : String,
        content_type : String? = nil,
        description : String? = nil
      ) : Protocol::Request
        input = Types::CreateModelRequest.new(api_id: api_id, name: name, schema: schema, content_type: content_type, description: description)
        create_model(input)
      end

      def create_model(input : Types::CreateModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a portal.

      def create_portal(
        authorization : Types::Authorization,
        endpoint_configuration : Types::EndpointConfigurationRequest,
        portal_content : Types::PortalContent,
        included_portal_product_arns : Array(String)? = nil,
        logo_uri : String? = nil,
        rum_app_monitor_name : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePortalRequest.new(authorization: authorization, endpoint_configuration: endpoint_configuration, portal_content: portal_content, included_portal_product_arns: included_portal_product_arns, logo_uri: logo_uri, rum_app_monitor_name: rum_app_monitor_name, tags: tags)
        create_portal(input)
      end

      def create_portal(input : Types::CreatePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new portal product.

      def create_portal_product(
        display_name : String,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreatePortalProductRequest.new(display_name: display_name, description: description, tags: tags)
        create_portal_product(input)
      end

      def create_portal_product(input : Types::CreatePortalProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PORTAL_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new product page for a portal product.

      def create_product_page(
        display_content : Types::DisplayContent,
        portal_product_id : String
      ) : Protocol::Request
        input = Types::CreateProductPageRequest.new(display_content: display_content, portal_product_id: portal_product_id)
        create_product_page(input)
      end

      def create_product_page(input : Types::CreateProductPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRODUCT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a product REST endpoint page for a portal product.

      def create_product_rest_endpoint_page(
        portal_product_id : String,
        rest_endpoint_identifier : Types::RestEndpointIdentifier,
        display_content : Types::EndpointDisplayContent? = nil,
        try_it_state : String? = nil
      ) : Protocol::Request
        input = Types::CreateProductRestEndpointPageRequest.new(portal_product_id: portal_product_id, rest_endpoint_identifier: rest_endpoint_identifier, display_content: display_content, try_it_state: try_it_state)
        create_product_rest_endpoint_page(input)
      end

      def create_product_rest_endpoint_page(input : Types::CreateProductRestEndpointPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PRODUCT_REST_ENDPOINT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Route for an API.

      def create_route(
        api_id : String,
        route_key : String,
        api_key_required : Bool? = nil,
        authorization_scopes : Array(String)? = nil,
        authorization_type : String? = nil,
        authorizer_id : String? = nil,
        model_selection_expression : String? = nil,
        operation_name : String? = nil,
        request_models : Hash(String, String)? = nil,
        request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
        route_response_selection_expression : String? = nil,
        target : String? = nil
      ) : Protocol::Request
        input = Types::CreateRouteRequest.new(api_id: api_id, route_key: route_key, api_key_required: api_key_required, authorization_scopes: authorization_scopes, authorization_type: authorization_type, authorizer_id: authorizer_id, model_selection_expression: model_selection_expression, operation_name: operation_name, request_models: request_models, request_parameters: request_parameters, route_response_selection_expression: route_response_selection_expression, target: target)
        create_route(input)
      end

      def create_route(input : Types::CreateRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a RouteResponse for a Route.

      def create_route_response(
        api_id : String,
        route_id : String,
        route_response_key : String,
        model_selection_expression : String? = nil,
        response_models : Hash(String, String)? = nil,
        response_parameters : Hash(String, Types::ParameterConstraints)? = nil
      ) : Protocol::Request
        input = Types::CreateRouteResponseRequest.new(api_id: api_id, route_id: route_id, route_response_key: route_response_key, model_selection_expression: model_selection_expression, response_models: response_models, response_parameters: response_parameters)
        create_route_response(input)
      end

      def create_route_response(input : Types::CreateRouteResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTE_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Create a routing rule.

      def create_routing_rule(
        actions : Array(Types::RoutingRuleAction),
        conditions : Array(Types::RoutingRuleCondition),
        domain_name : String,
        priority : Int32,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateRoutingRuleRequest.new(actions: actions, conditions: conditions, domain_name: domain_name, priority: priority, domain_name_id: domain_name_id)
        create_routing_rule(input)
      end

      def create_routing_rule(input : Types::CreateRoutingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Stage for an API.

      def create_stage(
        api_id : String,
        stage_name : String,
        access_log_settings : Types::AccessLogSettings? = nil,
        auto_deploy : Bool? = nil,
        client_certificate_id : String? = nil,
        default_route_settings : Types::RouteSettings? = nil,
        deployment_id : String? = nil,
        description : String? = nil,
        route_settings : Hash(String, Types::RouteSettings)? = nil,
        stage_variables : Hash(String, String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStageRequest.new(api_id: api_id, stage_name: stage_name, access_log_settings: access_log_settings, auto_deploy: auto_deploy, client_certificate_id: client_certificate_id, default_route_settings: default_route_settings, deployment_id: deployment_id, description: description, route_settings: route_settings, stage_variables: stage_variables, tags: tags)
        create_stage(input)
      end

      def create_stage(input : Types::CreateStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a VPC link.

      def create_vpc_link(
        name : String,
        subnet_ids : Array(String),
        security_group_ids : Array(String)? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVpcLinkRequest.new(name: name, subnet_ids: subnet_ids, security_group_ids: security_group_ids, tags: tags)
        create_vpc_link(input)
      end

      def create_vpc_link(input : Types::CreateVpcLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VPC_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the AccessLogSettings for a Stage. To disable access logging for a Stage, delete its
      # AccessLogSettings.

      def delete_access_log_settings(
        api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::DeleteAccessLogSettingsRequest.new(api_id: api_id, stage_name: stage_name)
        delete_access_log_settings(input)
      end

      def delete_access_log_settings(input : Types::DeleteAccessLogSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ACCESS_LOG_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Api resource.

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

      # Deletes an API mapping.

      def delete_api_mapping(
        api_mapping_id : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::DeleteApiMappingRequest.new(api_mapping_id: api_mapping_id, domain_name: domain_name)
        delete_api_mapping(input)
      end

      def delete_api_mapping(input : Types::DeleteApiMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_API_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Authorizer.

      def delete_authorizer(
        api_id : String,
        authorizer_id : String
      ) : Protocol::Request
        input = Types::DeleteAuthorizerRequest.new(api_id: api_id, authorizer_id: authorizer_id)
        delete_authorizer(input)
      end

      def delete_authorizer(input : Types::DeleteAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a CORS configuration.

      def delete_cors_configuration(
        api_id : String
      ) : Protocol::Request
        input = Types::DeleteCorsConfigurationRequest.new(api_id: api_id)
        delete_cors_configuration(input)
      end

      def delete_cors_configuration(input : Types::DeleteCorsConfigurationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CORS_CONFIGURATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Deployment.

      def delete_deployment(
        api_id : String,
        deployment_id : String
      ) : Protocol::Request
        input = Types::DeleteDeploymentRequest.new(api_id: api_id, deployment_id: deployment_id)
        delete_deployment(input)
      end

      def delete_deployment(input : Types::DeleteDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a domain name.

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

      # Deletes an Integration.

      def delete_integration(
        api_id : String,
        integration_id : String
      ) : Protocol::Request
        input = Types::DeleteIntegrationRequest.new(api_id: api_id, integration_id: integration_id)
        delete_integration(input)
      end

      def delete_integration(input : Types::DeleteIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an IntegrationResponses.

      def delete_integration_response(
        api_id : String,
        integration_id : String,
        integration_response_id : String
      ) : Protocol::Request
        input = Types::DeleteIntegrationResponseRequest.new(api_id: api_id, integration_id: integration_id, integration_response_id: integration_response_id)
        delete_integration_response(input)
      end

      def delete_integration_response(input : Types::DeleteIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Model.

      def delete_model(
        api_id : String,
        model_id : String
      ) : Protocol::Request
        input = Types::DeleteModelRequest.new(api_id: api_id, model_id: model_id)
        delete_model(input)
      end

      def delete_model(input : Types::DeleteModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a portal.

      def delete_portal(
        portal_id : String
      ) : Protocol::Request
        input = Types::DeletePortalRequest.new(portal_id: portal_id)
        delete_portal(input)
      end

      def delete_portal(input : Types::DeletePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a portal product.

      def delete_portal_product(
        portal_product_id : String
      ) : Protocol::Request
        input = Types::DeletePortalProductRequest.new(portal_product_id: portal_product_id)
        delete_portal_product(input)
      end

      def delete_portal_product(input : Types::DeletePortalProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PORTAL_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the sharing policy for a portal product.

      def delete_portal_product_sharing_policy(
        portal_product_id : String
      ) : Protocol::Request
        input = Types::DeletePortalProductSharingPolicyRequest.new(portal_product_id: portal_product_id)
        delete_portal_product_sharing_policy(input)
      end

      def delete_portal_product_sharing_policy(input : Types::DeletePortalProductSharingPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PORTAL_PRODUCT_SHARING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a product page of a portal product.

      def delete_product_page(
        portal_product_id : String,
        product_page_id : String
      ) : Protocol::Request
        input = Types::DeleteProductPageRequest.new(portal_product_id: portal_product_id, product_page_id: product_page_id)
        delete_product_page(input)
      end

      def delete_product_page(input : Types::DeleteProductPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRODUCT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a product REST endpoint page.

      def delete_product_rest_endpoint_page(
        portal_product_id : String,
        product_rest_endpoint_page_id : String
      ) : Protocol::Request
        input = Types::DeleteProductRestEndpointPageRequest.new(portal_product_id: portal_product_id, product_rest_endpoint_page_id: product_rest_endpoint_page_id)
        delete_product_rest_endpoint_page(input)
      end

      def delete_product_rest_endpoint_page(input : Types::DeleteProductRestEndpointPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_PRODUCT_REST_ENDPOINT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Route.

      def delete_route(
        api_id : String,
        route_id : String
      ) : Protocol::Request
        input = Types::DeleteRouteRequest.new(api_id: api_id, route_id: route_id)
        delete_route(input)
      end

      def delete_route(input : Types::DeleteRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a route request parameter. Supported only for WebSocket APIs.

      def delete_route_request_parameter(
        api_id : String,
        request_parameter_key : String,
        route_id : String
      ) : Protocol::Request
        input = Types::DeleteRouteRequestParameterRequest.new(api_id: api_id, request_parameter_key: request_parameter_key, route_id: route_id)
        delete_route_request_parameter(input)
      end

      def delete_route_request_parameter(input : Types::DeleteRouteRequestParameterRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE_REQUEST_PARAMETER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a RouteResponse.

      def delete_route_response(
        api_id : String,
        route_id : String,
        route_response_id : String
      ) : Protocol::Request
        input = Types::DeleteRouteResponseRequest.new(api_id: api_id, route_id: route_id, route_response_id: route_response_id)
        delete_route_response(input)
      end

      def delete_route_response(input : Types::DeleteRouteResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the RouteSettings for a stage.

      def delete_route_settings(
        api_id : String,
        route_key : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::DeleteRouteSettingsRequest.new(api_id: api_id, route_key: route_key, stage_name: stage_name)
        delete_route_settings(input)
      end

      def delete_route_settings(input : Types::DeleteRouteSettingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE_SETTINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a routing rule.

      def delete_routing_rule(
        domain_name : String,
        routing_rule_id : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRoutingRuleRequest.new(domain_name: domain_name, routing_rule_id: routing_rule_id, domain_name_id: domain_name_id)
        delete_routing_rule(input)
      end

      def delete_routing_rule(input : Types::DeleteRoutingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Stage.

      def delete_stage(
        api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::DeleteStageRequest.new(api_id: api_id, stage_name: stage_name)
        delete_stage(input)
      end

      def delete_stage(input : Types::DeleteStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a VPC link.

      def delete_vpc_link(
        vpc_link_id : String
      ) : Protocol::Request
        input = Types::DeleteVpcLinkRequest.new(vpc_link_id: vpc_link_id)
        delete_vpc_link(input)
      end

      def delete_vpc_link(input : Types::DeleteVpcLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VPC_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the publication of a portal portal.

      def disable_portal(
        portal_id : String
      ) : Protocol::Request
        input = Types::DisablePortalRequest.new(portal_id: portal_id)
        disable_portal(input)
      end

      def disable_portal(input : Types::DisablePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISABLE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports a definition of an API in a particular output format and specification.

      def export_api(
        api_id : String,
        output_type : String,
        specification : String,
        export_version : String? = nil,
        include_extensions : Bool? = nil,
        stage_name : String? = nil
      ) : Protocol::Request
        input = Types::ExportApiRequest.new(api_id: api_id, output_type: output_type, specification: specification, export_version: export_version, include_extensions: include_extensions, stage_name: stage_name)
        export_api(input)
      end

      def export_api(input : Types::ExportApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::EXPORT_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Api resource.

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

      # Gets an API mapping.

      def get_api_mapping(
        api_mapping_id : String,
        domain_name : String
      ) : Protocol::Request
        input = Types::GetApiMappingRequest.new(api_mapping_id: api_mapping_id, domain_name: domain_name)
        get_api_mapping(input)
      end

      def get_api_mapping(input : Types::GetApiMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets API mappings.

      def get_api_mappings(
        domain_name : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetApiMappingsRequest.new(domain_name: domain_name, max_results: max_results, next_token: next_token)
        get_api_mappings(input)
      end

      def get_api_mappings(input : Types::GetApiMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a collection of Api resources.

      def get_apis(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetApisRequest.new(max_results: max_results, next_token: next_token)
        get_apis(input)
      end

      def get_apis(input : Types::GetApisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Authorizer.

      def get_authorizer(
        api_id : String,
        authorizer_id : String
      ) : Protocol::Request
        input = Types::GetAuthorizerRequest.new(api_id: api_id, authorizer_id: authorizer_id)
        get_authorizer(input)
      end

      def get_authorizer(input : Types::GetAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Authorizers for an API.

      def get_authorizers(
        api_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetAuthorizersRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        get_authorizers(input)
      end

      def get_authorizers(input : Types::GetAuthorizersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTHORIZERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a Deployment.

      def get_deployment(
        api_id : String,
        deployment_id : String
      ) : Protocol::Request
        input = Types::GetDeploymentRequest.new(api_id: api_id, deployment_id: deployment_id)
        get_deployment(input)
      end

      def get_deployment(input : Types::GetDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Deployments for an API.

      def get_deployments(
        api_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDeploymentsRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        get_deployments(input)
      end

      def get_deployments(input : Types::GetDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a domain name.

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

      # Gets the domain names for an Amazon Web Services account.

      def get_domain_names(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetDomainNamesRequest.new(max_results: max_results, next_token: next_token)
        get_domain_names(input)
      end

      def get_domain_names(input : Types::GetDomainNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Integration.

      def get_integration(
        api_id : String,
        integration_id : String
      ) : Protocol::Request
        input = Types::GetIntegrationRequest.new(api_id: api_id, integration_id: integration_id)
        get_integration(input)
      end

      def get_integration(input : Types::GetIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an IntegrationResponses.

      def get_integration_response(
        api_id : String,
        integration_id : String,
        integration_response_id : String
      ) : Protocol::Request
        input = Types::GetIntegrationResponseRequest.new(api_id: api_id, integration_id: integration_id, integration_response_id: integration_response_id)
        get_integration_response(input)
      end

      def get_integration_response(input : Types::GetIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the IntegrationResponses for an Integration.

      def get_integration_responses(
        api_id : String,
        integration_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetIntegrationResponsesRequest.new(api_id: api_id, integration_id: integration_id, max_results: max_results, next_token: next_token)
        get_integration_responses(input)
      end

      def get_integration_responses(input : Types::GetIntegrationResponsesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATION_RESPONSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Integrations for an API.

      def get_integrations(
        api_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetIntegrationsRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        get_integrations(input)
      end

      def get_integrations(input : Types::GetIntegrationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a Model.

      def get_model(
        api_id : String,
        model_id : String
      ) : Protocol::Request
        input = Types::GetModelRequest.new(api_id: api_id, model_id: model_id)
        get_model(input)
      end

      def get_model(input : Types::GetModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a model template.

      def get_model_template(
        api_id : String,
        model_id : String
      ) : Protocol::Request
        input = Types::GetModelTemplateRequest.new(api_id: api_id, model_id: model_id)
        get_model_template(input)
      end

      def get_model_template(input : Types::GetModelTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Models for an API.

      def get_models(
        api_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetModelsRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        get_models(input)
      end

      def get_models(input : Types::GetModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a portal.

      def get_portal(
        portal_id : String
      ) : Protocol::Request
        input = Types::GetPortalRequest.new(portal_id: portal_id)
        get_portal(input)
      end

      def get_portal(input : Types::GetPortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a portal product.

      def get_portal_product(
        portal_product_id : String,
        resource_owner_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetPortalProductRequest.new(portal_product_id: portal_product_id, resource_owner_account_id: resource_owner_account_id)
        get_portal_product(input)
      end

      def get_portal_product(input : Types::GetPortalProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTAL_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the sharing policy for a portal product.

      def get_portal_product_sharing_policy(
        portal_product_id : String
      ) : Protocol::Request
        input = Types::GetPortalProductSharingPolicyRequest.new(portal_product_id: portal_product_id)
        get_portal_product_sharing_policy(input)
      end

      def get_portal_product_sharing_policy(input : Types::GetPortalProductSharingPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PORTAL_PRODUCT_SHARING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a product page of a portal product.

      def get_product_page(
        portal_product_id : String,
        product_page_id : String,
        resource_owner_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetProductPageRequest.new(portal_product_id: portal_product_id, product_page_id: product_page_id, resource_owner_account_id: resource_owner_account_id)
        get_product_page(input)
      end

      def get_product_page(input : Types::GetProductPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRODUCT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a product REST endpoint page.

      def get_product_rest_endpoint_page(
        portal_product_id : String,
        product_rest_endpoint_page_id : String,
        include_raw_display_content : String? = nil,
        resource_owner_account_id : String? = nil
      ) : Protocol::Request
        input = Types::GetProductRestEndpointPageRequest.new(portal_product_id: portal_product_id, product_rest_endpoint_page_id: product_rest_endpoint_page_id, include_raw_display_content: include_raw_display_content, resource_owner_account_id: resource_owner_account_id)
        get_product_rest_endpoint_page(input)
      end

      def get_product_rest_endpoint_page(input : Types::GetProductRestEndpointPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_PRODUCT_REST_ENDPOINT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a Route.

      def get_route(
        api_id : String,
        route_id : String
      ) : Protocol::Request
        input = Types::GetRouteRequest.new(api_id: api_id, route_id: route_id)
        get_route(input)
      end

      def get_route(input : Types::GetRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a RouteResponse.

      def get_route_response(
        api_id : String,
        route_id : String,
        route_response_id : String
      ) : Protocol::Request
        input = Types::GetRouteResponseRequest.new(api_id: api_id, route_id: route_id, route_response_id: route_response_id)
        get_route_response(input)
      end

      def get_route_response(input : Types::GetRouteResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTE_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the RouteResponses for a Route.

      def get_route_responses(
        api_id : String,
        route_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetRouteResponsesRequest.new(api_id: api_id, route_id: route_id, max_results: max_results, next_token: next_token)
        get_route_responses(input)
      end

      def get_route_responses(input : Types::GetRouteResponsesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTE_RESPONSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Routes for an API.

      def get_routes(
        api_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetRoutesRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        get_routes(input)
      end

      def get_routes(input : Types::GetRoutesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a routing rule.

      def get_routing_rule(
        domain_name : String,
        routing_rule_id : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::GetRoutingRuleRequest.new(domain_name: domain_name, routing_rule_id: routing_rule_id, domain_name_id: domain_name_id)
        get_routing_rule(input)
      end

      def get_routing_rule(input : Types::GetRoutingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a Stage.

      def get_stage(
        api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::GetStageRequest.new(api_id: api_id, stage_name: stage_name)
        get_stage(input)
      end

      def get_stage(input : Types::GetStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Stages for an API.

      def get_stages(
        api_id : String,
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetStagesRequest.new(api_id: api_id, max_results: max_results, next_token: next_token)
        get_stages(input)
      end

      def get_stages(input : Types::GetStagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a collection of Tag resources.

      def get_tags(
        resource_arn : String
      ) : Protocol::Request
        input = Types::GetTagsRequest.new(resource_arn: resource_arn)
        get_tags(input)
      end

      def get_tags(input : Types::GetTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a VPC link.

      def get_vpc_link(
        vpc_link_id : String
      ) : Protocol::Request
        input = Types::GetVpcLinkRequest.new(vpc_link_id: vpc_link_id)
        get_vpc_link(input)
      end

      def get_vpc_link(input : Types::GetVpcLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VPC_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a collection of VPC links.

      def get_vpc_links(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::GetVpcLinksRequest.new(max_results: max_results, next_token: next_token)
        get_vpc_links(input)
      end

      def get_vpc_links(input : Types::GetVpcLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VPC_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports an API.

      def import_api(
        body : String,
        basepath : String? = nil,
        fail_on_warnings : Bool? = nil
      ) : Protocol::Request
        input = Types::ImportApiRequest.new(body: body, basepath: basepath, fail_on_warnings: fail_on_warnings)
        import_api(input)
      end

      def import_api(input : Types::ImportApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists portal products.

      def list_portal_products(
        max_results : String? = nil,
        next_token : String? = nil,
        resource_owner : String? = nil
      ) : Protocol::Request
        input = Types::ListPortalProductsRequest.new(max_results: max_results, next_token: next_token, resource_owner: resource_owner)
        list_portal_products(input)
      end

      def list_portal_products(input : Types::ListPortalProductsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PORTAL_PRODUCTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists portals.

      def list_portals(
        max_results : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListPortalsRequest.new(max_results: max_results, next_token: next_token)
        list_portals(input)
      end

      def list_portals(input : Types::ListPortalsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PORTALS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the product pages for a portal product.

      def list_product_pages(
        portal_product_id : String,
        max_results : String? = nil,
        next_token : String? = nil,
        resource_owner_account_id : String? = nil
      ) : Protocol::Request
        input = Types::ListProductPagesRequest.new(portal_product_id: portal_product_id, max_results: max_results, next_token: next_token, resource_owner_account_id: resource_owner_account_id)
        list_product_pages(input)
      end

      def list_product_pages(input : Types::ListProductPagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRODUCT_PAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the product REST endpoint pages of a portal product.

      def list_product_rest_endpoint_pages(
        portal_product_id : String,
        max_results : String? = nil,
        next_token : String? = nil,
        resource_owner_account_id : String? = nil
      ) : Protocol::Request
        input = Types::ListProductRestEndpointPagesRequest.new(portal_product_id: portal_product_id, max_results: max_results, next_token: next_token, resource_owner_account_id: resource_owner_account_id)
        list_product_rest_endpoint_pages(input)
      end

      def list_product_rest_endpoint_pages(input : Types::ListProductRestEndpointPagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_PRODUCT_REST_ENDPOINT_PAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists routing rules.

      def list_routing_rules(
        domain_name : String,
        domain_name_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutingRulesRequest.new(domain_name: domain_name, domain_name_id: domain_name_id, max_results: max_results, next_token: next_token)
        list_routing_rules(input)
      end

      def list_routing_rules(input : Types::ListRoutingRulesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTING_RULES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a portal preview.

      def preview_portal(
        portal_id : String
      ) : Protocol::Request
        input = Types::PreviewPortalRequest.new(portal_id: portal_id)
        preview_portal(input)
      end

      def preview_portal(input : Types::PreviewPortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PREVIEW_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Publishes a portal.

      def publish_portal(
        portal_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::PublishPortalRequest.new(portal_id: portal_id, description: description)
        publish_portal(input)
      end

      def publish_portal(input : Types::PublishPortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUBLISH_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the sharing policy for a portal product.

      def put_portal_product_sharing_policy(
        policy_document : String,
        portal_product_id : String
      ) : Protocol::Request
        input = Types::PutPortalProductSharingPolicyRequest.new(policy_document: policy_document, portal_product_id: portal_product_id)
        put_portal_product_sharing_policy(input)
      end

      def put_portal_product_sharing_policy(input : Types::PutPortalProductSharingPolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_PORTAL_PRODUCT_SHARING_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Replaces an existing routing rule. When you replace an existing routing rule, the RoutingRuleId
      # isn't changed.

      def put_routing_rule(
        actions : Array(Types::RoutingRuleAction),
        conditions : Array(Types::RoutingRuleCondition),
        domain_name : String,
        priority : Int32,
        routing_rule_id : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::PutRoutingRuleRequest.new(actions: actions, conditions: conditions, domain_name: domain_name, priority: priority, routing_rule_id: routing_rule_id, domain_name_id: domain_name_id)
        put_routing_rule(input)
      end

      def put_routing_rule(input : Types::PutRoutingRuleRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_ROUTING_RULE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Puts an Api resource.

      def reimport_api(
        api_id : String,
        body : String,
        basepath : String? = nil,
        fail_on_warnings : Bool? = nil
      ) : Protocol::Request
        input = Types::ReimportApiRequest.new(api_id: api_id, body: body, basepath: basepath, fail_on_warnings: fail_on_warnings)
        reimport_api(input)
      end

      def reimport_api(input : Types::ReimportApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REIMPORT_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Resets all authorizer cache entries for the specified stage. Supported only for HTTP API Lambda
      # authorizers.

      def reset_authorizers_cache(
        api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::ResetAuthorizersCacheRequest.new(api_id: api_id, stage_name: stage_name)
        reset_authorizers_cache(input)
      end

      def reset_authorizers_cache(input : Types::ResetAuthorizersCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::RESET_AUTHORIZERS_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Tag resource to represent a tag.

      def tag_resource(
        resource_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Tag.

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

      # Updates an Api resource.

      def update_api(
        api_id : String,
        api_key_selection_expression : String? = nil,
        cors_configuration : Types::Cors? = nil,
        credentials_arn : String? = nil,
        description : String? = nil,
        disable_execute_api_endpoint : Bool? = nil,
        disable_schema_validation : Bool? = nil,
        ip_address_type : String? = nil,
        name : String? = nil,
        route_key : String? = nil,
        route_selection_expression : String? = nil,
        target : String? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApiRequest.new(api_id: api_id, api_key_selection_expression: api_key_selection_expression, cors_configuration: cors_configuration, credentials_arn: credentials_arn, description: description, disable_execute_api_endpoint: disable_execute_api_endpoint, disable_schema_validation: disable_schema_validation, ip_address_type: ip_address_type, name: name, route_key: route_key, route_selection_expression: route_selection_expression, target: target, version: version)
        update_api(input)
      end

      def update_api(input : Types::UpdateApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The API mapping.

      def update_api_mapping(
        api_id : String,
        api_mapping_id : String,
        domain_name : String,
        api_mapping_key : String? = nil,
        stage : String? = nil
      ) : Protocol::Request
        input = Types::UpdateApiMappingRequest.new(api_id: api_id, api_mapping_id: api_mapping_id, domain_name: domain_name, api_mapping_key: api_mapping_key, stage: stage)
        update_api_mapping(input)
      end

      def update_api_mapping(input : Types::UpdateApiMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Authorizer.

      def update_authorizer(
        api_id : String,
        authorizer_id : String,
        authorizer_credentials_arn : String? = nil,
        authorizer_payload_format_version : String? = nil,
        authorizer_result_ttl_in_seconds : Int32? = nil,
        authorizer_type : String? = nil,
        authorizer_uri : String? = nil,
        enable_simple_responses : Bool? = nil,
        identity_source : Array(String)? = nil,
        identity_validation_expression : String? = nil,
        jwt_configuration : Types::JWTConfiguration? = nil,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateAuthorizerRequest.new(api_id: api_id, authorizer_id: authorizer_id, authorizer_credentials_arn: authorizer_credentials_arn, authorizer_payload_format_version: authorizer_payload_format_version, authorizer_result_ttl_in_seconds: authorizer_result_ttl_in_seconds, authorizer_type: authorizer_type, authorizer_uri: authorizer_uri, enable_simple_responses: enable_simple_responses, identity_source: identity_source, identity_validation_expression: identity_validation_expression, jwt_configuration: jwt_configuration, name: name)
        update_authorizer(input)
      end

      def update_authorizer(input : Types::UpdateAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Deployment.

      def update_deployment(
        api_id : String,
        deployment_id : String,
        description : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDeploymentRequest.new(api_id: api_id, deployment_id: deployment_id, description: description)
        update_deployment(input)
      end

      def update_deployment(input : Types::UpdateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a domain name.

      def update_domain_name(
        domain_name : String,
        domain_name_configurations : Array(Types::DomainNameConfiguration)? = nil,
        mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
        routing_mode : String? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainNameRequest.new(domain_name: domain_name, domain_name_configurations: domain_name_configurations, mutual_tls_authentication: mutual_tls_authentication, routing_mode: routing_mode)
        update_domain_name(input)
      end

      def update_domain_name(input : Types::UpdateDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an Integration.

      def update_integration(
        api_id : String,
        integration_id : String,
        connection_id : String? = nil,
        connection_type : String? = nil,
        content_handling_strategy : String? = nil,
        credentials_arn : String? = nil,
        description : String? = nil,
        integration_method : String? = nil,
        integration_subtype : String? = nil,
        integration_type : String? = nil,
        integration_uri : String? = nil,
        passthrough_behavior : String? = nil,
        payload_format_version : String? = nil,
        request_parameters : Hash(String, String)? = nil,
        request_templates : Hash(String, String)? = nil,
        response_parameters : Hash(String, Hash(String, String))? = nil,
        template_selection_expression : String? = nil,
        timeout_in_millis : Int32? = nil,
        tls_config : Types::TlsConfigInput? = nil
      ) : Protocol::Request
        input = Types::UpdateIntegrationRequest.new(api_id: api_id, integration_id: integration_id, connection_id: connection_id, connection_type: connection_type, content_handling_strategy: content_handling_strategy, credentials_arn: credentials_arn, description: description, integration_method: integration_method, integration_subtype: integration_subtype, integration_type: integration_type, integration_uri: integration_uri, passthrough_behavior: passthrough_behavior, payload_format_version: payload_format_version, request_parameters: request_parameters, request_templates: request_templates, response_parameters: response_parameters, template_selection_expression: template_selection_expression, timeout_in_millis: timeout_in_millis, tls_config: tls_config)
        update_integration(input)
      end

      def update_integration(input : Types::UpdateIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an IntegrationResponses.

      def update_integration_response(
        api_id : String,
        integration_id : String,
        integration_response_id : String,
        content_handling_strategy : String? = nil,
        integration_response_key : String? = nil,
        response_parameters : Hash(String, String)? = nil,
        response_templates : Hash(String, String)? = nil,
        template_selection_expression : String? = nil
      ) : Protocol::Request
        input = Types::UpdateIntegrationResponseRequest.new(api_id: api_id, integration_id: integration_id, integration_response_id: integration_response_id, content_handling_strategy: content_handling_strategy, integration_response_key: integration_response_key, response_parameters: response_parameters, response_templates: response_templates, template_selection_expression: template_selection_expression)
        update_integration_response(input)
      end

      def update_integration_response(input : Types::UpdateIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Model.

      def update_model(
        api_id : String,
        model_id : String,
        content_type : String? = nil,
        description : String? = nil,
        name : String? = nil,
        schema : String? = nil
      ) : Protocol::Request
        input = Types::UpdateModelRequest.new(api_id: api_id, model_id: model_id, content_type: content_type, description: description, name: name, schema: schema)
        update_model(input)
      end

      def update_model(input : Types::UpdateModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a portal.

      def update_portal(
        portal_id : String,
        authorization : Types::Authorization? = nil,
        endpoint_configuration : Types::EndpointConfigurationRequest? = nil,
        included_portal_product_arns : Array(String)? = nil,
        logo_uri : String? = nil,
        portal_content : Types::PortalContent? = nil,
        rum_app_monitor_name : String? = nil
      ) : Protocol::Request
        input = Types::UpdatePortalRequest.new(portal_id: portal_id, authorization: authorization, endpoint_configuration: endpoint_configuration, included_portal_product_arns: included_portal_product_arns, logo_uri: logo_uri, portal_content: portal_content, rum_app_monitor_name: rum_app_monitor_name)
        update_portal(input)
      end

      def update_portal(input : Types::UpdatePortalRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PORTAL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates the portal product.

      def update_portal_product(
        portal_product_id : String,
        description : String? = nil,
        display_name : String? = nil,
        display_order : Types::DisplayOrder? = nil
      ) : Protocol::Request
        input = Types::UpdatePortalProductRequest.new(portal_product_id: portal_product_id, description: description, display_name: display_name, display_order: display_order)
        update_portal_product(input)
      end

      def update_portal_product(input : Types::UpdatePortalProductRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PORTAL_PRODUCT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a product page of a portal product.

      def update_product_page(
        portal_product_id : String,
        product_page_id : String,
        display_content : Types::DisplayContent? = nil
      ) : Protocol::Request
        input = Types::UpdateProductPageRequest.new(portal_product_id: portal_product_id, product_page_id: product_page_id, display_content: display_content)
        update_product_page(input)
      end

      def update_product_page(input : Types::UpdateProductPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRODUCT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a product REST endpoint page.

      def update_product_rest_endpoint_page(
        portal_product_id : String,
        product_rest_endpoint_page_id : String,
        display_content : Types::EndpointDisplayContent? = nil,
        try_it_state : String? = nil
      ) : Protocol::Request
        input = Types::UpdateProductRestEndpointPageRequest.new(portal_product_id: portal_product_id, product_rest_endpoint_page_id: product_rest_endpoint_page_id, display_content: display_content, try_it_state: try_it_state)
        update_product_rest_endpoint_page(input)
      end

      def update_product_rest_endpoint_page(input : Types::UpdateProductRestEndpointPageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_PRODUCT_REST_ENDPOINT_PAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Route.

      def update_route(
        api_id : String,
        route_id : String,
        api_key_required : Bool? = nil,
        authorization_scopes : Array(String)? = nil,
        authorization_type : String? = nil,
        authorizer_id : String? = nil,
        model_selection_expression : String? = nil,
        operation_name : String? = nil,
        request_models : Hash(String, String)? = nil,
        request_parameters : Hash(String, Types::ParameterConstraints)? = nil,
        route_key : String? = nil,
        route_response_selection_expression : String? = nil,
        target : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRouteRequest.new(api_id: api_id, route_id: route_id, api_key_required: api_key_required, authorization_scopes: authorization_scopes, authorization_type: authorization_type, authorizer_id: authorizer_id, model_selection_expression: model_selection_expression, operation_name: operation_name, request_models: request_models, request_parameters: request_parameters, route_key: route_key, route_response_selection_expression: route_response_selection_expression, target: target)
        update_route(input)
      end

      def update_route(input : Types::UpdateRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a RouteResponse.

      def update_route_response(
        api_id : String,
        route_id : String,
        route_response_id : String,
        model_selection_expression : String? = nil,
        response_models : Hash(String, String)? = nil,
        response_parameters : Hash(String, Types::ParameterConstraints)? = nil,
        route_response_key : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRouteResponseRequest.new(api_id: api_id, route_id: route_id, route_response_id: route_response_id, model_selection_expression: model_selection_expression, response_models: response_models, response_parameters: response_parameters, route_response_key: route_response_key)
        update_route_response(input)
      end

      def update_route_response(input : Types::UpdateRouteResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTE_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a Stage.

      def update_stage(
        api_id : String,
        stage_name : String,
        access_log_settings : Types::AccessLogSettings? = nil,
        auto_deploy : Bool? = nil,
        client_certificate_id : String? = nil,
        default_route_settings : Types::RouteSettings? = nil,
        deployment_id : String? = nil,
        description : String? = nil,
        route_settings : Hash(String, Types::RouteSettings)? = nil,
        stage_variables : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::UpdateStageRequest.new(api_id: api_id, stage_name: stage_name, access_log_settings: access_log_settings, auto_deploy: auto_deploy, client_certificate_id: client_certificate_id, default_route_settings: default_route_settings, deployment_id: deployment_id, description: description, route_settings: route_settings, stage_variables: stage_variables)
        update_stage(input)
      end

      def update_stage(input : Types::UpdateStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a VPC link.

      def update_vpc_link(
        vpc_link_id : String,
        name : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVpcLinkRequest.new(vpc_link_id: vpc_link_id, name: name)
        update_vpc_link(input)
      end

      def update_vpc_link(input : Types::UpdateVpcLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VPC_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
