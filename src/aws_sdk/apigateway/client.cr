module AwsSdk
  module APIGateway
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

      # Create an ApiKey resource.

      def create_api_key(
        customer_id : String? = nil,
        description : String? = nil,
        enabled : Bool? = nil,
        generate_distinct_id : Bool? = nil,
        name : String? = nil,
        stage_keys : Array(Types::StageKey)? = nil,
        tags : Hash(String, String)? = nil,
        value : String? = nil
      ) : Protocol::Request
        input = Types::CreateApiKeyRequest.new(customer_id: customer_id, description: description, enabled: enabled, generate_distinct_id: generate_distinct_id, name: name, stage_keys: stage_keys, tags: tags, value: value)
        create_api_key(input)
      end

      def create_api_key(input : Types::CreateApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new Authorizer resource to an existing RestApi resource.

      def create_authorizer(
        name : String,
        rest_api_id : String,
        type : String,
        auth_type : String? = nil,
        authorizer_credentials : String? = nil,
        authorizer_result_ttl_in_seconds : Int32? = nil,
        authorizer_uri : String? = nil,
        identity_source : String? = nil,
        identity_validation_expression : String? = nil,
        provider_ar_ns : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateAuthorizerRequest.new(name: name, rest_api_id: rest_api_id, type: type, auth_type: auth_type, authorizer_credentials: authorizer_credentials, authorizer_result_ttl_in_seconds: authorizer_result_ttl_in_seconds, authorizer_uri: authorizer_uri, identity_source: identity_source, identity_validation_expression: identity_validation_expression, provider_ar_ns: provider_ar_ns)
        create_authorizer(input)
      end

      def create_authorizer(input : Types::CreateAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new BasePathMapping resource.

      def create_base_path_mapping(
        domain_name : String,
        rest_api_id : String,
        base_path : String? = nil,
        domain_name_id : String? = nil,
        stage : String? = nil
      ) : Protocol::Request
        input = Types::CreateBasePathMappingRequest.new(domain_name: domain_name, rest_api_id: rest_api_id, base_path: base_path, domain_name_id: domain_name_id, stage: stage)
        create_base_path_mapping(input)
      end

      def create_base_path_mapping(input : Types::CreateBasePathMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_BASE_PATH_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Deployment resource, which makes a specified RestApi callable over the internet.

      def create_deployment(
        rest_api_id : String,
        cache_cluster_enabled : Bool? = nil,
        cache_cluster_size : String? = nil,
        canary_settings : Types::DeploymentCanarySettings? = nil,
        description : String? = nil,
        stage_description : String? = nil,
        stage_name : String? = nil,
        tracing_enabled : Bool? = nil,
        variables : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDeploymentRequest.new(rest_api_id: rest_api_id, cache_cluster_enabled: cache_cluster_enabled, cache_cluster_size: cache_cluster_size, canary_settings: canary_settings, description: description, stage_description: stage_description, stage_name: stage_name, tracing_enabled: tracing_enabled, variables: variables)
        create_deployment(input)
      end

      def create_deployment(input : Types::CreateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a documentation part.

      def create_documentation_part(
        location : Types::DocumentationPartLocation,
        properties : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::CreateDocumentationPartRequest.new(location: location, properties: properties, rest_api_id: rest_api_id)
        create_documentation_part(input)
      end

      def create_documentation_part(input : Types::CreateDocumentationPartRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOCUMENTATION_PART, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a documentation version

      def create_documentation_version(
        documentation_version : String,
        rest_api_id : String,
        description : String? = nil,
        stage_name : String? = nil
      ) : Protocol::Request
        input = Types::CreateDocumentationVersionRequest.new(documentation_version: documentation_version, rest_api_id: rest_api_id, description: description, stage_name: stage_name)
        create_documentation_version(input)
      end

      def create_documentation_version(input : Types::CreateDocumentationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOCUMENTATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new domain name.

      def create_domain_name(
        domain_name : String,
        certificate_arn : String? = nil,
        certificate_body : String? = nil,
        certificate_chain : String? = nil,
        certificate_name : String? = nil,
        certificate_private_key : String? = nil,
        endpoint_access_mode : String? = nil,
        endpoint_configuration : Types::EndpointConfiguration? = nil,
        mutual_tls_authentication : Types::MutualTlsAuthenticationInput? = nil,
        ownership_verification_certificate_arn : String? = nil,
        policy : String? = nil,
        regional_certificate_arn : String? = nil,
        regional_certificate_name : String? = nil,
        routing_mode : String? = nil,
        security_policy : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainNameRequest.new(domain_name: domain_name, certificate_arn: certificate_arn, certificate_body: certificate_body, certificate_chain: certificate_chain, certificate_name: certificate_name, certificate_private_key: certificate_private_key, endpoint_access_mode: endpoint_access_mode, endpoint_configuration: endpoint_configuration, mutual_tls_authentication: mutual_tls_authentication, ownership_verification_certificate_arn: ownership_verification_certificate_arn, policy: policy, regional_certificate_arn: regional_certificate_arn, regional_certificate_name: regional_certificate_name, routing_mode: routing_mode, security_policy: security_policy, tags: tags)
        create_domain_name(input)
      end

      def create_domain_name(input : Types::CreateDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a domain name access association resource between an access association source and a private
      # custom domain name.

      def create_domain_name_access_association(
        access_association_source : String,
        access_association_source_type : String,
        domain_name_arn : String,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateDomainNameAccessAssociationRequest.new(access_association_source: access_association_source, access_association_source_type: access_association_source_type, domain_name_arn: domain_name_arn, tags: tags)
        create_domain_name_access_association(input)
      end

      def create_domain_name_access_association(input : Types::CreateDomainNameAccessAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_DOMAIN_NAME_ACCESS_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a new Model resource to an existing RestApi resource.

      def create_model(
        content_type : String,
        name : String,
        rest_api_id : String,
        description : String? = nil,
        schema : String? = nil
      ) : Protocol::Request
        input = Types::CreateModelRequest.new(content_type: content_type, name: name, rest_api_id: rest_api_id, description: description, schema: schema)
        create_model(input)
      end

      def create_model(input : Types::CreateModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a RequestValidator of a given RestApi.

      def create_request_validator(
        rest_api_id : String,
        name : String? = nil,
        validate_request_body : Bool? = nil,
        validate_request_parameters : Bool? = nil
      ) : Protocol::Request
        input = Types::CreateRequestValidatorRequest.new(rest_api_id: rest_api_id, name: name, validate_request_body: validate_request_body, validate_request_parameters: validate_request_parameters)
        create_request_validator(input)
      end

      def create_request_validator(input : Types::CreateRequestValidatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REQUEST_VALIDATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a Resource resource.

      def create_resource(
        parent_id : String,
        path_part : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::CreateResourceRequest.new(parent_id: parent_id, path_part: path_part, rest_api_id: rest_api_id)
        create_resource(input)
      end

      def create_resource(input : Types::CreateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new RestApi resource.

      def create_rest_api(
        name : String,
        api_key_source : String? = nil,
        binary_media_types : Array(String)? = nil,
        clone_from : String? = nil,
        description : String? = nil,
        disable_execute_api_endpoint : Bool? = nil,
        endpoint_access_mode : String? = nil,
        endpoint_configuration : Types::EndpointConfiguration? = nil,
        minimum_compression_size : Int32? = nil,
        policy : String? = nil,
        security_policy : String? = nil,
        tags : Hash(String, String)? = nil,
        version : String? = nil
      ) : Protocol::Request
        input = Types::CreateRestApiRequest.new(name: name, api_key_source: api_key_source, binary_media_types: binary_media_types, clone_from: clone_from, description: description, disable_execute_api_endpoint: disable_execute_api_endpoint, endpoint_access_mode: endpoint_access_mode, endpoint_configuration: endpoint_configuration, minimum_compression_size: minimum_compression_size, policy: policy, security_policy: security_policy, tags: tags, version: version)
        create_rest_api(input)
      end

      def create_rest_api(input : Types::CreateRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Stage resource that references a pre-existing Deployment for the API.

      def create_stage(
        deployment_id : String,
        rest_api_id : String,
        stage_name : String,
        cache_cluster_enabled : Bool? = nil,
        cache_cluster_size : String? = nil,
        canary_settings : Types::CanarySettings? = nil,
        description : String? = nil,
        documentation_version : String? = nil,
        tags : Hash(String, String)? = nil,
        tracing_enabled : Bool? = nil,
        variables : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateStageRequest.new(deployment_id: deployment_id, rest_api_id: rest_api_id, stage_name: stage_name, cache_cluster_enabled: cache_cluster_enabled, cache_cluster_size: cache_cluster_size, canary_settings: canary_settings, description: description, documentation_version: documentation_version, tags: tags, tracing_enabled: tracing_enabled, variables: variables)
        create_stage(input)
      end

      def create_stage(input : Types::CreateStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a usage plan with the throttle and quota limits, as well as the associated API stages,
      # specified in the payload.

      def create_usage_plan(
        name : String,
        api_stages : Array(Types::ApiStage)? = nil,
        description : String? = nil,
        quota : Types::QuotaSettings? = nil,
        tags : Hash(String, String)? = nil,
        throttle : Types::ThrottleSettings? = nil
      ) : Protocol::Request
        input = Types::CreateUsagePlanRequest.new(name: name, api_stages: api_stages, description: description, quota: quota, tags: tags, throttle: throttle)
        create_usage_plan(input)
      end

      def create_usage_plan(input : Types::CreateUsagePlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USAGE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a usage plan key for adding an existing API key to a usage plan.

      def create_usage_plan_key(
        key_id : String,
        key_type : String,
        usage_plan_id : String
      ) : Protocol::Request
        input = Types::CreateUsagePlanKeyRequest.new(key_id: key_id, key_type: key_type, usage_plan_id: usage_plan_id)
        create_usage_plan_key(input)
      end

      def create_usage_plan_key(input : Types::CreateUsagePlanKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_USAGE_PLAN_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a VPC link, under the caller's account in a selected region, in an asynchronous operation
      # that typically takes 2-4 minutes to complete and become operational. The caller must have
      # permissions to create and update VPC Endpoint services.

      def create_vpc_link(
        name : String,
        target_arns : Array(String),
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateVpcLinkRequest.new(name: name, target_arns: target_arns, description: description, tags: tags)
        create_vpc_link(input)
      end

      def create_vpc_link(input : Types::CreateVpcLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VPC_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the ApiKey resource.

      def delete_api_key(
        api_key : String
      ) : Protocol::Request
        input = Types::DeleteApiKeyRequest.new(api_key: api_key)
        delete_api_key(input)
      end

      def delete_api_key(input : Types::DeleteApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing Authorizer resource.

      def delete_authorizer(
        authorizer_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteAuthorizerRequest.new(authorizer_id: authorizer_id, rest_api_id: rest_api_id)
        delete_authorizer(input)
      end

      def delete_authorizer(input : Types::DeleteAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the BasePathMapping resource.

      def delete_base_path_mapping(
        base_path : String,
        domain_name : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteBasePathMappingRequest.new(base_path: base_path, domain_name: domain_name, domain_name_id: domain_name_id)
        delete_base_path_mapping(input)
      end

      def delete_base_path_mapping(input : Types::DeleteBasePathMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_BASE_PATH_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the ClientCertificate resource.

      def delete_client_certificate(
        client_certificate_id : String
      ) : Protocol::Request
        input = Types::DeleteClientCertificateRequest.new(client_certificate_id: client_certificate_id)
        delete_client_certificate(input)
      end

      def delete_client_certificate(input : Types::DeleteClientCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_CLIENT_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Deployment resource. Deleting a deployment will only succeed if there are no Stage
      # resources associated with it.

      def delete_deployment(
        deployment_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteDeploymentRequest.new(deployment_id: deployment_id, rest_api_id: rest_api_id)
        delete_deployment(input)
      end

      def delete_deployment(input : Types::DeleteDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a documentation part

      def delete_documentation_part(
        documentation_part_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteDocumentationPartRequest.new(documentation_part_id: documentation_part_id, rest_api_id: rest_api_id)
        delete_documentation_part(input)
      end

      def delete_documentation_part(input : Types::DeleteDocumentationPartRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOCUMENTATION_PART, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a documentation version.

      def delete_documentation_version(
        documentation_version : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteDocumentationVersionRequest.new(documentation_version: documentation_version, rest_api_id: rest_api_id)
        delete_documentation_version(input)
      end

      def delete_documentation_version(input : Types::DeleteDocumentationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOCUMENTATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the DomainName resource.

      def delete_domain_name(
        domain_name : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::DeleteDomainNameRequest.new(domain_name: domain_name, domain_name_id: domain_name_id)
        delete_domain_name(input)
      end

      def delete_domain_name(input : Types::DeleteDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the DomainNameAccessAssociation resource. Only the AWS account that created the
      # DomainNameAccessAssociation resource can delete it. To stop an access association source in another
      # AWS account from accessing your private custom domain name, use the
      # RejectDomainNameAccessAssociation operation.

      def delete_domain_name_access_association(
        domain_name_access_association_arn : String
      ) : Protocol::Request
        input = Types::DeleteDomainNameAccessAssociationRequest.new(domain_name_access_association_arn: domain_name_access_association_arn)
        delete_domain_name_access_association(input)
      end

      def delete_domain_name_access_association(input : Types::DeleteDomainNameAccessAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_DOMAIN_NAME_ACCESS_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Clears any customization of a GatewayResponse of a specified response type on the given RestApi and
      # resets it with the default settings.

      def delete_gateway_response(
        response_type : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteGatewayResponseRequest.new(response_type: response_type, rest_api_id: rest_api_id)
        delete_gateway_response(input)
      end

      def delete_gateway_response(input : Types::DeleteGatewayResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GATEWAY_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a delete integration.

      def delete_integration(
        http_method : String,
        resource_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteIntegrationRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id)
        delete_integration(input)
      end

      def delete_integration(input : Types::DeleteIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a delete integration response.

      def delete_integration_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String
      ) : Protocol::Request
        input = Types::DeleteIntegrationResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code)
        delete_integration_response(input)
      end

      def delete_integration_response(input : Types::DeleteIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing Method resource.

      def delete_method(
        http_method : String,
        resource_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteMethodRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id)
        delete_method(input)
      end

      def delete_method(input : Types::DeleteMethodRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_METHOD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing MethodResponse resource.

      def delete_method_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String
      ) : Protocol::Request
        input = Types::DeleteMethodResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code)
        delete_method_response(input)
      end

      def delete_method_response(input : Types::DeleteMethodResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_METHOD_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a model.

      def delete_model(
        model_name : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteModelRequest.new(model_name: model_name, rest_api_id: rest_api_id)
        delete_model(input)
      end

      def delete_model(input : Types::DeleteModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a RequestValidator of a given RestApi.

      def delete_request_validator(
        request_validator_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteRequestValidatorRequest.new(request_validator_id: request_validator_id, rest_api_id: rest_api_id)
        delete_request_validator(input)
      end

      def delete_request_validator(input : Types::DeleteRequestValidatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REQUEST_VALIDATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Resource resource.

      def delete_resource(
        resource_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteResourceRequest.new(resource_id: resource_id, rest_api_id: rest_api_id)
        delete_resource(input)
      end

      def delete_resource(input : Types::DeleteResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified API.

      def delete_rest_api(
        rest_api_id : String
      ) : Protocol::Request
        input = Types::DeleteRestApiRequest.new(rest_api_id: rest_api_id)
        delete_rest_api(input)
      end

      def delete_rest_api(input : Types::DeleteRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a Stage resource.

      def delete_stage(
        rest_api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::DeleteStageRequest.new(rest_api_id: rest_api_id, stage_name: stage_name)
        delete_stage(input)
      end

      def delete_stage(input : Types::DeleteStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a usage plan of a given plan Id.

      def delete_usage_plan(
        usage_plan_id : String
      ) : Protocol::Request
        input = Types::DeleteUsagePlanRequest.new(usage_plan_id: usage_plan_id)
        delete_usage_plan(input)
      end

      def delete_usage_plan(input : Types::DeleteUsagePlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USAGE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes a usage plan key and remove the underlying API key from the associated usage plan.

      def delete_usage_plan_key(
        key_id : String,
        usage_plan_id : String
      ) : Protocol::Request
        input = Types::DeleteUsagePlanKeyRequest.new(key_id: key_id, usage_plan_id: usage_plan_id)
        delete_usage_plan_key(input)
      end

      def delete_usage_plan_key(input : Types::DeleteUsagePlanKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_USAGE_PLAN_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing VpcLink of a specified identifier.

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

      # Flushes all authorizer cache entries on a stage.

      def flush_stage_authorizers_cache(
        rest_api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::FlushStageAuthorizersCacheRequest.new(rest_api_id: rest_api_id, stage_name: stage_name)
        flush_stage_authorizers_cache(input)
      end

      def flush_stage_authorizers_cache(input : Types::FlushStageAuthorizersCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::FLUSH_STAGE_AUTHORIZERS_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Flushes a stage's cache.

      def flush_stage_cache(
        rest_api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::FlushStageCacheRequest.new(rest_api_id: rest_api_id, stage_name: stage_name)
        flush_stage_cache(input)
      end

      def flush_stage_cache(input : Types::FlushStageCacheRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::FLUSH_STAGE_CACHE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a ClientCertificate resource.

      def generate_client_certificate(
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::GenerateClientCertificateRequest.new(description: description, tags: tags)
        generate_client_certificate(input)
      end

      def generate_client_certificate(input : Types::GenerateClientCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GENERATE_CLIENT_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the current Account resource.

      def get_account : Protocol::Request
        input = Types::GetAccountRequest.new
        get_account(input)
      end

      def get_account(input : Types::GetAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the current ApiKey resource.

      def get_api_key(
        api_key : String,
        include_value : Bool? = nil
      ) : Protocol::Request
        input = Types::GetApiKeyRequest.new(api_key: api_key, include_value: include_value)
        get_api_key(input)
      end

      def get_api_key(input : Types::GetApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the current ApiKeys resource.

      def get_api_keys(
        customer_id : String? = nil,
        include_values : Bool? = nil,
        limit : Int32? = nil,
        name_query : String? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetApiKeysRequest.new(customer_id: customer_id, include_values: include_values, limit: limit, name_query: name_query, position: position)
        get_api_keys(input)
      end

      def get_api_keys(input : Types::GetApiKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_API_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe an existing Authorizer resource.

      def get_authorizer(
        authorizer_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetAuthorizerRequest.new(authorizer_id: authorizer_id, rest_api_id: rest_api_id)
        get_authorizer(input)
      end

      def get_authorizer(input : Types::GetAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe an existing Authorizers resource.

      def get_authorizers(
        rest_api_id : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetAuthorizersRequest.new(rest_api_id: rest_api_id, limit: limit, position: position)
        get_authorizers(input)
      end

      def get_authorizers(input : Types::GetAuthorizersRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTHORIZERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe a BasePathMapping resource.

      def get_base_path_mapping(
        base_path : String,
        domain_name : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::GetBasePathMappingRequest.new(base_path: base_path, domain_name: domain_name, domain_name_id: domain_name_id)
        get_base_path_mapping(input)
      end

      def get_base_path_mapping(input : Types::GetBasePathMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BASE_PATH_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a collection of BasePathMapping resources.

      def get_base_path_mappings(
        domain_name : String,
        domain_name_id : String? = nil,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetBasePathMappingsRequest.new(domain_name: domain_name, domain_name_id: domain_name_id, limit: limit, position: position)
        get_base_path_mappings(input)
      end

      def get_base_path_mappings(input : Types::GetBasePathMappingsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_BASE_PATH_MAPPINGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about the current ClientCertificate resource.

      def get_client_certificate(
        client_certificate_id : String
      ) : Protocol::Request
        input = Types::GetClientCertificateRequest.new(client_certificate_id: client_certificate_id)
        get_client_certificate(input)
      end

      def get_client_certificate(input : Types::GetClientCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLIENT_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a collection of ClientCertificate resources.

      def get_client_certificates(
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetClientCertificatesRequest.new(limit: limit, position: position)
        get_client_certificates(input)
      end

      def get_client_certificates(input : Types::GetClientCertificatesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_CLIENT_CERTIFICATES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Deployment resource.

      def get_deployment(
        deployment_id : String,
        rest_api_id : String,
        embed : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetDeploymentRequest.new(deployment_id: deployment_id, rest_api_id: rest_api_id, embed: embed)
        get_deployment(input)
      end

      def get_deployment(input : Types::GetDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Deployments collection.

      def get_deployments(
        rest_api_id : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetDeploymentsRequest.new(rest_api_id: rest_api_id, limit: limit, position: position)
        get_deployments(input)
      end

      def get_deployments(input : Types::GetDeploymentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DEPLOYMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a documentation part.

      def get_documentation_part(
        documentation_part_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetDocumentationPartRequest.new(documentation_part_id: documentation_part_id, rest_api_id: rest_api_id)
        get_documentation_part(input)
      end

      def get_documentation_part(input : Types::GetDocumentationPartRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENTATION_PART, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets documentation parts.

      def get_documentation_parts(
        rest_api_id : String,
        limit : Int32? = nil,
        location_status : String? = nil,
        name_query : String? = nil,
        path : String? = nil,
        position : String? = nil,
        type : String? = nil
      ) : Protocol::Request
        input = Types::GetDocumentationPartsRequest.new(rest_api_id: rest_api_id, limit: limit, location_status: location_status, name_query: name_query, path: path, position: position, type: type)
        get_documentation_parts(input)
      end

      def get_documentation_parts(input : Types::GetDocumentationPartsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENTATION_PARTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a documentation version.

      def get_documentation_version(
        documentation_version : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetDocumentationVersionRequest.new(documentation_version: documentation_version, rest_api_id: rest_api_id)
        get_documentation_version(input)
      end

      def get_documentation_version(input : Types::GetDocumentationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENTATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets documentation versions.

      def get_documentation_versions(
        rest_api_id : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetDocumentationVersionsRequest.new(rest_api_id: rest_api_id, limit: limit, position: position)
        get_documentation_versions(input)
      end

      def get_documentation_versions(input : Types::GetDocumentationVersionsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOCUMENTATION_VERSIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a domain name that is contained in a simpler, more intuitive URL that can be called.

      def get_domain_name(
        domain_name : String,
        domain_name_id : String? = nil
      ) : Protocol::Request
        input = Types::GetDomainNameRequest.new(domain_name: domain_name, domain_name_id: domain_name_id)
        get_domain_name(input)
      end

      def get_domain_name(input : Types::GetDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a collection on DomainNameAccessAssociations resources.

      def get_domain_name_access_associations(
        limit : Int32? = nil,
        position : String? = nil,
        resource_owner : String? = nil
      ) : Protocol::Request
        input = Types::GetDomainNameAccessAssociationsRequest.new(limit: limit, position: position, resource_owner: resource_owner)
        get_domain_name_access_associations(input)
      end

      def get_domain_name_access_associations(input : Types::GetDomainNameAccessAssociationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_NAME_ACCESS_ASSOCIATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a collection of DomainName resources.

      def get_domain_names(
        limit : Int32? = nil,
        position : String? = nil,
        resource_owner : String? = nil
      ) : Protocol::Request
        input = Types::GetDomainNamesRequest.new(limit: limit, position: position, resource_owner: resource_owner)
        get_domain_names(input)
      end

      def get_domain_names(input : Types::GetDomainNamesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_DOMAIN_NAMES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Exports a deployed version of a RestApi in a specified format.

      def get_export(
        export_type : String,
        rest_api_id : String,
        stage_name : String,
        accepts : String? = nil,
        parameters : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::GetExportRequest.new(export_type: export_type, rest_api_id: rest_api_id, stage_name: stage_name, accepts: accepts, parameters: parameters)
        get_export(input)
      end

      def get_export(input : Types::GetExportRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_EXPORT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a GatewayResponse of a specified response type on the given RestApi.

      def get_gateway_response(
        response_type : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetGatewayResponseRequest.new(response_type: response_type, rest_api_id: rest_api_id)
        get_gateway_response(input)
      end

      def get_gateway_response(input : Types::GetGatewayResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GATEWAY_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the GatewayResponses collection on the given RestApi. If an API developer has not added any
      # definitions for gateway responses, the result will be the API Gateway-generated default
      # GatewayResponses collection for the supported response types.

      def get_gateway_responses(
        rest_api_id : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetGatewayResponsesRequest.new(rest_api_id: rest_api_id, limit: limit, position: position)
        get_gateway_responses(input)
      end

      def get_gateway_responses(input : Types::GetGatewayResponsesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_GATEWAY_RESPONSES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Get the integration settings.

      def get_integration(
        http_method : String,
        resource_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetIntegrationRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id)
        get_integration(input)
      end

      def get_integration(input : Types::GetIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a get integration response.

      def get_integration_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String
      ) : Protocol::Request
        input = Types::GetIntegrationResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code)
        get_integration_response(input)
      end

      def get_integration_response(input : Types::GetIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describe an existing Method resource.

      def get_method(
        http_method : String,
        resource_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetMethodRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id)
        get_method(input)
      end

      def get_method(input : Types::GetMethodRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METHOD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes a MethodResponse resource.

      def get_method_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String
      ) : Protocol::Request
        input = Types::GetMethodResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code)
        get_method_response(input)
      end

      def get_method_response(input : Types::GetMethodResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_METHOD_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing model defined for a RestApi resource.

      def get_model(
        model_name : String,
        rest_api_id : String,
        flatten : Bool? = nil
      ) : Protocol::Request
        input = Types::GetModelRequest.new(model_name: model_name, rest_api_id: rest_api_id, flatten: flatten)
        get_model(input)
      end

      def get_model(input : Types::GetModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a sample mapping template that can be used to transform a payload into the structure of a
      # model.

      def get_model_template(
        model_name : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetModelTemplateRequest.new(model_name: model_name, rest_api_id: rest_api_id)
        get_model_template(input)
      end

      def get_model_template(input : Types::GetModelTemplateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODEL_TEMPLATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes existing Models defined for a RestApi resource.

      def get_models(
        rest_api_id : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetModelsRequest.new(rest_api_id: rest_api_id, limit: limit, position: position)
        get_models(input)
      end

      def get_models(input : Types::GetModelsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MODELS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a RequestValidator of a given RestApi.

      def get_request_validator(
        request_validator_id : String,
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetRequestValidatorRequest.new(request_validator_id: request_validator_id, rest_api_id: rest_api_id)
        get_request_validator(input)
      end

      def get_request_validator(input : Types::GetRequestValidatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REQUEST_VALIDATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the RequestValidators collection of a given RestApi.

      def get_request_validators(
        rest_api_id : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetRequestValidatorsRequest.new(rest_api_id: rest_api_id, limit: limit, position: position)
        get_request_validators(input)
      end

      def get_request_validators(input : Types::GetRequestValidatorsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REQUEST_VALIDATORS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about a resource.

      def get_resource(
        resource_id : String,
        rest_api_id : String,
        embed : Array(String)? = nil
      ) : Protocol::Request
        input = Types::GetResourceRequest.new(resource_id: resource_id, rest_api_id: rest_api_id, embed: embed)
        get_resource(input)
      end

      def get_resource(input : Types::GetResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists information about a collection of Resource resources.

      def get_resources(
        rest_api_id : String,
        embed : Array(String)? = nil,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetResourcesRequest.new(rest_api_id: rest_api_id, embed: embed, limit: limit, position: position)
        get_resources(input)
      end

      def get_resources(input : Types::GetResourcesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the RestApi resource in the collection.

      def get_rest_api(
        rest_api_id : String
      ) : Protocol::Request
        input = Types::GetRestApiRequest.new(rest_api_id: rest_api_id)
        get_rest_api(input)
      end

      def get_rest_api(input : Types::GetRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the RestApis resources for your collection.

      def get_rest_apis(
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetRestApisRequest.new(limit: limit, position: position)
        get_rest_apis(input)
      end

      def get_rest_apis(input : Types::GetRestApisRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_REST_APIS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Generates a client SDK for a RestApi and Stage.

      def get_sdk(
        rest_api_id : String,
        sdk_type : String,
        stage_name : String,
        parameters : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::GetSdkRequest.new(rest_api_id: rest_api_id, sdk_type: sdk_type, stage_name: stage_name, parameters: parameters)
        get_sdk(input)
      end

      def get_sdk(input : Types::GetSdkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SDK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an SDK type.

      def get_sdk_type(
        id : String
      ) : Protocol::Request
        input = Types::GetSdkTypeRequest.new(id: id)
        get_sdk_type(input)
      end

      def get_sdk_type(input : Types::GetSdkTypeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SDK_TYPE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets SDK types

      def get_sdk_types(
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetSdkTypesRequest.new(limit: limit, position: position)
        get_sdk_types(input)
      end

      def get_sdk_types(input : Types::GetSdkTypesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SDK_TYPES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about a Stage resource.

      def get_stage(
        rest_api_id : String,
        stage_name : String
      ) : Protocol::Request
        input = Types::GetStageRequest.new(rest_api_id: rest_api_id, stage_name: stage_name)
        get_stage(input)
      end

      def get_stage(input : Types::GetStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets information about one or more Stage resources.

      def get_stages(
        rest_api_id : String,
        deployment_id : String? = nil
      ) : Protocol::Request
        input = Types::GetStagesRequest.new(rest_api_id: rest_api_id, deployment_id: deployment_id)
        get_stages(input)
      end

      def get_stages(input : Types::GetStagesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_STAGES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Tags collection for a given resource.

      def get_tags(
        resource_arn : String,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetTagsRequest.new(resource_arn: resource_arn, limit: limit, position: position)
        get_tags(input)
      end

      def get_tags(input : Types::GetTagsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TAGS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the usage data of a usage plan in a specified time interval.

      def get_usage(
        end_date : String,
        start_date : String,
        usage_plan_id : String,
        key_id : String? = nil,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetUsageRequest.new(end_date: end_date, start_date: start_date, usage_plan_id: usage_plan_id, key_id: key_id, limit: limit, position: position)
        get_usage(input)
      end

      def get_usage(input : Types::GetUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a usage plan of a given plan identifier.

      def get_usage_plan(
        usage_plan_id : String
      ) : Protocol::Request
        input = Types::GetUsagePlanRequest.new(usage_plan_id: usage_plan_id)
        get_usage_plan(input)
      end

      def get_usage_plan(input : Types::GetUsagePlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a usage plan key of a given key identifier.

      def get_usage_plan_key(
        key_id : String,
        usage_plan_id : String
      ) : Protocol::Request
        input = Types::GetUsagePlanKeyRequest.new(key_id: key_id, usage_plan_id: usage_plan_id)
        get_usage_plan_key(input)
      end

      def get_usage_plan_key(input : Types::GetUsagePlanKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_PLAN_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets all the usage plan keys representing the API keys added to a specified usage plan.

      def get_usage_plan_keys(
        usage_plan_id : String,
        limit : Int32? = nil,
        name_query : String? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetUsagePlanKeysRequest.new(usage_plan_id: usage_plan_id, limit: limit, name_query: name_query, position: position)
        get_usage_plan_keys(input)
      end

      def get_usage_plan_keys(input : Types::GetUsagePlanKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_PLAN_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets all the usage plans of the caller's account.

      def get_usage_plans(
        key_id : String? = nil,
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetUsagePlansRequest.new(key_id: key_id, limit: limit, position: position)
        get_usage_plans(input)
      end

      def get_usage_plans(input : Types::GetUsagePlansRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_USAGE_PLANS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets a specified VPC link under the caller's account in a region.

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

      # Gets the VpcLinks collection under the caller's account in a selected region.

      def get_vpc_links(
        limit : Int32? = nil,
        position : String? = nil
      ) : Protocol::Request
        input = Types::GetVpcLinksRequest.new(limit: limit, position: position)
        get_vpc_links(input)
      end

      def get_vpc_links(input : Types::GetVpcLinksRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_VPC_LINKS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Import API keys from an external source, such as a CSV-formatted file.

      def import_api_keys(
        body : Bytes,
        format : String,
        fail_on_warnings : Bool? = nil
      ) : Protocol::Request
        input = Types::ImportApiKeysRequest.new(body: body, format: format, fail_on_warnings: fail_on_warnings)
        import_api_keys(input)
      end

      def import_api_keys(input : Types::ImportApiKeysRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_API_KEYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Imports documentation parts

      def import_documentation_parts(
        body : Bytes,
        rest_api_id : String,
        fail_on_warnings : Bool? = nil,
        mode : String? = nil
      ) : Protocol::Request
        input = Types::ImportDocumentationPartsRequest.new(body: body, rest_api_id: rest_api_id, fail_on_warnings: fail_on_warnings, mode: mode)
        import_documentation_parts(input)
      end

      def import_documentation_parts(input : Types::ImportDocumentationPartsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_DOCUMENTATION_PARTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A feature of the API Gateway control service for creating a new API from an external API definition
      # file.

      def import_rest_api(
        body : Bytes,
        fail_on_warnings : Bool? = nil,
        parameters : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::ImportRestApiRequest.new(body: body, fail_on_warnings: fail_on_warnings, parameters: parameters)
        import_rest_api(input)
      end

      def import_rest_api(input : Types::ImportRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::IMPORT_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a customization of a GatewayResponse of a specified response type and status code on the
      # given RestApi.

      def put_gateway_response(
        response_type : String,
        rest_api_id : String,
        response_parameters : Hash(String, String)? = nil,
        response_templates : Hash(String, String)? = nil,
        status_code : String? = nil
      ) : Protocol::Request
        input = Types::PutGatewayResponseRequest.new(response_type: response_type, rest_api_id: rest_api_id, response_parameters: response_parameters, response_templates: response_templates, status_code: status_code)
        put_gateway_response(input)
      end

      def put_gateway_response(input : Types::PutGatewayResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_GATEWAY_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sets up a method's integration.

      def put_integration(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        type : String,
        cache_key_parameters : Array(String)? = nil,
        cache_namespace : String? = nil,
        connection_id : String? = nil,
        connection_type : String? = nil,
        content_handling : String? = nil,
        credentials : String? = nil,
        integration_http_method : String? = nil,
        integration_target : String? = nil,
        passthrough_behavior : String? = nil,
        request_parameters : Hash(String, String)? = nil,
        request_templates : Hash(String, String)? = nil,
        response_transfer_mode : String? = nil,
        timeout_in_millis : Int32? = nil,
        tls_config : Types::TlsConfig? = nil,
        uri : String? = nil
      ) : Protocol::Request
        input = Types::PutIntegrationRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, type: type, cache_key_parameters: cache_key_parameters, cache_namespace: cache_namespace, connection_id: connection_id, connection_type: connection_type, content_handling: content_handling, credentials: credentials, integration_http_method: integration_http_method, integration_target: integration_target, passthrough_behavior: passthrough_behavior, request_parameters: request_parameters, request_templates: request_templates, response_transfer_mode: response_transfer_mode, timeout_in_millis: timeout_in_millis, tls_config: tls_config, uri: uri)
        put_integration(input)
      end

      def put_integration(input : Types::PutIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents a put integration.

      def put_integration_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String,
        content_handling : String? = nil,
        response_parameters : Hash(String, String)? = nil,
        response_templates : Hash(String, String)? = nil,
        selection_pattern : String? = nil
      ) : Protocol::Request
        input = Types::PutIntegrationResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code, content_handling: content_handling, response_parameters: response_parameters, response_templates: response_templates, selection_pattern: selection_pattern)
        put_integration_response(input)
      end

      def put_integration_response(input : Types::PutIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Add a method to an existing Resource resource.

      def put_method(
        authorization_type : String,
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        api_key_required : Bool? = nil,
        authorization_scopes : Array(String)? = nil,
        authorizer_id : String? = nil,
        operation_name : String? = nil,
        request_models : Hash(String, String)? = nil,
        request_parameters : Hash(String, Bool)? = nil,
        request_validator_id : String? = nil
      ) : Protocol::Request
        input = Types::PutMethodRequest.new(authorization_type: authorization_type, http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, api_key_required: api_key_required, authorization_scopes: authorization_scopes, authorizer_id: authorizer_id, operation_name: operation_name, request_models: request_models, request_parameters: request_parameters, request_validator_id: request_validator_id)
        put_method(input)
      end

      def put_method(input : Types::PutMethodRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_METHOD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds a MethodResponse to an existing Method resource.

      def put_method_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String,
        response_models : Hash(String, String)? = nil,
        response_parameters : Hash(String, Bool)? = nil
      ) : Protocol::Request
        input = Types::PutMethodResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code, response_models: response_models, response_parameters: response_parameters)
        put_method_response(input)
      end

      def put_method_response(input : Types::PutMethodResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_METHOD_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # A feature of the API Gateway control service for updating an existing API with an input of external
      # API definitions. The update can take the form of merging the supplied definition into the existing
      # API or overwriting the existing API.

      def put_rest_api(
        body : Bytes,
        rest_api_id : String,
        fail_on_warnings : Bool? = nil,
        mode : String? = nil,
        parameters : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::PutRestApiRequest.new(body: body, rest_api_id: rest_api_id, fail_on_warnings: fail_on_warnings, mode: mode, parameters: parameters)
        put_rest_api(input)
      end

      def put_rest_api(input : Types::PutRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Rejects a domain name access association with a private custom domain name. To reject a domain name
      # access association with an access association source in another AWS account, use this operation. To
      # remove a domain name access association with an access association source in your own account, use
      # the DeleteDomainNameAccessAssociation operation.

      def reject_domain_name_access_association(
        domain_name_access_association_arn : String,
        domain_name_arn : String
      ) : Protocol::Request
        input = Types::RejectDomainNameAccessAssociationRequest.new(domain_name_access_association_arn: domain_name_access_association_arn, domain_name_arn: domain_name_arn)
        reject_domain_name_access_association(input)
      end

      def reject_domain_name_access_association(input : Types::RejectDomainNameAccessAssociationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::REJECT_DOMAIN_NAME_ACCESS_ASSOCIATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Adds or updates a tag on a given resource.

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

      # Simulate the execution of an Authorizer in your RestApi with headers, parameters, and an incoming
      # request body.

      def test_invoke_authorizer(
        authorizer_id : String,
        rest_api_id : String,
        additional_context : Hash(String, String)? = nil,
        body : String? = nil,
        headers : Hash(String, String)? = nil,
        multi_value_headers : Hash(String, Array(String))? = nil,
        path_with_query_string : String? = nil,
        stage_variables : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TestInvokeAuthorizerRequest.new(authorizer_id: authorizer_id, rest_api_id: rest_api_id, additional_context: additional_context, body: body, headers: headers, multi_value_headers: multi_value_headers, path_with_query_string: path_with_query_string, stage_variables: stage_variables)
        test_invoke_authorizer(input)
      end

      def test_invoke_authorizer(input : Types::TestInvokeAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_INVOKE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Simulate the invocation of a Method in your RestApi with headers, parameters, and an incoming
      # request body.

      def test_invoke_method(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        body : String? = nil,
        client_certificate_id : String? = nil,
        headers : Hash(String, String)? = nil,
        multi_value_headers : Hash(String, Array(String))? = nil,
        path_with_query_string : String? = nil,
        stage_variables : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::TestInvokeMethodRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, body: body, client_certificate_id: client_certificate_id, headers: headers, multi_value_headers: multi_value_headers, path_with_query_string: path_with_query_string, stage_variables: stage_variables)
        test_invoke_method(input)
      end

      def test_invoke_method(input : Types::TestInvokeMethodRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TEST_INVOKE_METHOD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes a tag from a given resource.

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

      # Changes information about the current Account resource.

      def update_account(
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateAccountRequest.new(patch_operations: patch_operations)
        update_account(input)
      end

      def update_account(input : Types::UpdateAccountRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ACCOUNT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about an ApiKey resource.

      def update_api_key(
        api_key : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateApiKeyRequest.new(api_key: api_key, patch_operations: patch_operations)
        update_api_key(input)
      end

      def update_api_key(input : Types::UpdateApiKeyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_API_KEY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Authorizer resource.

      def update_authorizer(
        authorizer_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateAuthorizerRequest.new(authorizer_id: authorizer_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_authorizer(input)
      end

      def update_authorizer(input : Types::UpdateAuthorizerRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_AUTHORIZER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about the BasePathMapping resource.

      def update_base_path_mapping(
        base_path : String,
        domain_name : String,
        domain_name_id : String? = nil,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateBasePathMappingRequest.new(base_path: base_path, domain_name: domain_name, domain_name_id: domain_name_id, patch_operations: patch_operations)
        update_base_path_mapping(input)
      end

      def update_base_path_mapping(input : Types::UpdateBasePathMappingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_BASE_PATH_MAPPING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about an ClientCertificate resource.

      def update_client_certificate(
        client_certificate_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateClientCertificateRequest.new(client_certificate_id: client_certificate_id, patch_operations: patch_operations)
        update_client_certificate(input)
      end

      def update_client_certificate(input : Types::UpdateClientCertificateRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_CLIENT_CERTIFICATE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about a Deployment resource.

      def update_deployment(
        deployment_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateDeploymentRequest.new(deployment_id: deployment_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_deployment(input)
      end

      def update_deployment(input : Types::UpdateDeploymentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DEPLOYMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a documentation part.

      def update_documentation_part(
        documentation_part_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateDocumentationPartRequest.new(documentation_part_id: documentation_part_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_documentation_part(input)
      end

      def update_documentation_part(input : Types::UpdateDocumentationPartRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOCUMENTATION_PART, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a documentation version.

      def update_documentation_version(
        documentation_version : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateDocumentationVersionRequest.new(documentation_version: documentation_version, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_documentation_version(input)
      end

      def update_documentation_version(input : Types::UpdateDocumentationVersionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOCUMENTATION_VERSION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about the DomainName resource.

      def update_domain_name(
        domain_name : String,
        domain_name_id : String? = nil,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateDomainNameRequest.new(domain_name: domain_name, domain_name_id: domain_name_id, patch_operations: patch_operations)
        update_domain_name(input)
      end

      def update_domain_name(input : Types::UpdateDomainNameRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_DOMAIN_NAME, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a GatewayResponse of a specified response type on the given RestApi.

      def update_gateway_response(
        response_type : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateGatewayResponseRequest.new(response_type: response_type, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_gateway_response(input)
      end

      def update_gateway_response(input : Types::UpdateGatewayResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents an update integration.

      def update_integration(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateIntegrationRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_integration(input)
      end

      def update_integration(input : Types::UpdateIntegrationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INTEGRATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Represents an update integration response.

      def update_integration_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateIntegrationResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code, patch_operations: patch_operations)
        update_integration_response(input)
      end

      def update_integration_response(input : Types::UpdateIntegrationResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_INTEGRATION_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing Method resource.

      def update_method(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateMethodRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_method(input)
      end

      def update_method(input : Types::UpdateMethodRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_METHOD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing MethodResponse resource.

      def update_method_response(
        http_method : String,
        resource_id : String,
        rest_api_id : String,
        status_code : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateMethodResponseRequest.new(http_method: http_method, resource_id: resource_id, rest_api_id: rest_api_id, status_code: status_code, patch_operations: patch_operations)
        update_method_response(input)
      end

      def update_method_response(input : Types::UpdateMethodResponseRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_METHOD_RESPONSE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about a model. The maximum size of the model is 400 KB.

      def update_model(
        model_name : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateModelRequest.new(model_name: model_name, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_model(input)
      end

      def update_model(input : Types::UpdateModelRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MODEL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a RequestValidator of a given RestApi.

      def update_request_validator(
        request_validator_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateRequestValidatorRequest.new(request_validator_id: request_validator_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_request_validator(input)
      end

      def update_request_validator(input : Types::UpdateRequestValidatorRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REQUEST_VALIDATOR, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about a Resource resource.

      def update_resource(
        resource_id : String,
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateResourceRequest.new(resource_id: resource_id, rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_resource(input)
      end

      def update_resource(input : Types::UpdateResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about the specified API.

      def update_rest_api(
        rest_api_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateRestApiRequest.new(rest_api_id: rest_api_id, patch_operations: patch_operations)
        update_rest_api(input)
      end

      def update_rest_api(input : Types::UpdateRestApiRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_REST_API, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Changes information about a Stage resource.

      def update_stage(
        rest_api_id : String,
        stage_name : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateStageRequest.new(rest_api_id: rest_api_id, stage_name: stage_name, patch_operations: patch_operations)
        update_stage(input)
      end

      def update_stage(input : Types::UpdateStageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_STAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Grants a temporary extension to the remaining quota of a usage plan associated with a specified API
      # key.

      def update_usage(
        key_id : String,
        usage_plan_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateUsageRequest.new(key_id: key_id, usage_plan_id: usage_plan_id, patch_operations: patch_operations)
        update_usage(input)
      end

      def update_usage(input : Types::UpdateUsageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates a usage plan of a given plan Id.

      def update_usage_plan(
        usage_plan_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateUsagePlanRequest.new(usage_plan_id: usage_plan_id, patch_operations: patch_operations)
        update_usage_plan(input)
      end

      def update_usage_plan(input : Types::UpdateUsagePlanRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_USAGE_PLAN, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing VpcLink of a specified identifier.

      def update_vpc_link(
        vpc_link_id : String,
        patch_operations : Array(Types::PatchOperation)? = nil
      ) : Protocol::Request
        input = Types::UpdateVpcLinkRequest.new(vpc_link_id: vpc_link_id, patch_operations: patch_operations)
        update_vpc_link(input)
      end

      def update_vpc_link(input : Types::UpdateVpcLinkRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VPC_LINK, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
