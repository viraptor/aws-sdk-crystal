module AwsSdk
  module MigrationHubRefactorSpaces
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

      # Creates an Amazon Web Services Migration Hub Refactor Spaces application. The account that owns the
      # environment also owns the applications created inside the environment, regardless of the account
      # that creates the application. Refactor Spaces provisions an Amazon API Gateway, API Gateway VPC
      # link, and Network Load Balancer for the application proxy inside your account. In environments
      # created with a CreateEnvironment:NetworkFabricType of NONE you need to configure VPC to VPC
      # connectivity between your service VPC and the application proxy VPC to route traffic through the
      # application proxy to a service with a private URL endpoint. For more information, see Create an
      # application in the Refactor Spaces User Guide .
      def create_application(
        environment_identifier : String,
        name : String,
        proxy_type : String,
        vpc_id : String,
        api_gateway_proxy : Types::ApiGatewayProxyInput? = nil,
        client_token : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateApplicationRequest.new(environment_identifier: environment_identifier, name: name, proxy_type: proxy_type, vpc_id: vpc_id, api_gateway_proxy: api_gateway_proxy, client_token: client_token, tags: tags)
        create_application(input)
      end
      def create_application(input : Types::CreateApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services Migration Hub Refactor Spaces environment. The caller owns the
      # environment resource, and all Refactor Spaces applications, services, and routes created within the
      # environment. They are referred to as the environment owner . The environment owner has cross-account
      # visibility and control of Refactor Spaces resources that are added to the environment by other
      # accounts that the environment is shared with. When creating an environment with a
      # CreateEnvironment:NetworkFabricType of TRANSIT_GATEWAY , Refactor Spaces provisions a transit
      # gateway to enable services in VPCs to communicate directly across accounts. If
      # CreateEnvironment:NetworkFabricType is NONE , Refactor Spaces does not create a transit gateway and
      # you must use your network infrastructure to route traffic to services with private URL endpoints.
      def create_environment(
        name : String,
        network_fabric_type : String,
        client_token : String? = nil,
        description : String? = nil,
        tags : Hash(String, String)? = nil
      ) : Protocol::Request
        input = Types::CreateEnvironmentRequest.new(name: name, network_fabric_type: network_fabric_type, client_token: client_token, description: description, tags: tags)
        create_environment(input)
      end
      def create_environment(input : Types::CreateEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services Migration Hub Refactor Spaces route. The account owner of the service
      # resource is always the environment owner, regardless of which account creates the route. Routes
      # target a service in the application. If an application does not have any routes, then the first
      # route must be created as a DEFAULT RouteType . When created, the default route defaults to an active
      # state so state is not a required input. However, like all other state values the state of the
      # default route can be updated after creation, but only when all other routes are also inactive.
      # Conversely, no route can be active without the default route also being active. When you create a
      # route, Refactor Spaces configures the Amazon API Gateway to send traffic to the target service as
      # follows: URL Endpoints If the service has a URL endpoint, and the endpoint resolves to a private IP
      # address, Refactor Spaces routes traffic using the API Gateway VPC link. If a service endpoint
      # resolves to a public IP address, Refactor Spaces routes traffic over the public internet. Services
      # can have HTTP or HTTPS URL endpoints. For HTTPS URLs, publicly-signed certificates are supported.
      # Private Certificate Authorities (CAs) are permitted only if the CA's domain is also publicly
      # resolvable. Refactor Spaces automatically resolves the public Domain Name System (DNS) names that
      # are set in CreateService:UrlEndpoint when you create a service. The DNS names resolve when the DNS
      # time-to-live (TTL) expires, or every 60 seconds for TTLs less than 60 seconds. This periodic DNS
      # resolution ensures that the route configuration remains up-to-date. One-time health check A one-time
      # health check is performed on the service when either the route is updated from inactive to active,
      # or when it is created with an active state. If the health check fails, the route transitions the
      # route state to FAILED , an error code of SERVICE_ENDPOINT_HEALTH_CHECK_FAILURE is provided, and no
      # traffic is sent to the service. For private URLs, a target group is created on the Network Load
      # Balancer and the load balancer target group runs default target health checks. By default, the
      # health check is run against the service endpoint URL. Optionally, the health check can be performed
      # against a different protocol, port, and/or path using the CreateService:UrlEndpoint parameter. All
      # other health check settings for the load balancer use the default values described in the Health
      # checks for your target groups in the Elastic Load Balancing guide . The health check is considered
      # successful if at least one target within the target group transitions to a healthy state. Lambda
      # function endpoints If the service has an Lambda function endpoint, then Refactor Spaces configures
      # the Lambda function's resource policy to allow the application's API Gateway to invoke the function.
      # The Lambda function state is checked. If the function is not active, the function configuration is
      # updated so that Lambda resources are provisioned. If the Lambda state is Failed , then the route
      # creation fails. For more information, see the GetFunctionConfiguration's State response parameter in
      # the Lambda Developer Guide . A check is performed to determine that a Lambda function with the
      # specified ARN exists. If it does not exist, the health check fails. For public URLs, a connection is
      # opened to the public endpoint. If the URL is not reachable, the health check fails. Environments
      # without a network bridge When you create environments without a network bridge (
      # CreateEnvironment:NetworkFabricType is NONE) and you use your own networking infrastructure, you
      # need to configure VPC to VPC connectivity between your network and the application proxy VPC. Route
      # creation from the application proxy to service endpoints will fail if your network is not configured
      # to connect to the application proxy VPC. For more information, see Create a route in the Refactor
      # Spaces User Guide .
      def create_route(
        application_identifier : String,
        environment_identifier : String,
        route_type : String,
        service_identifier : String,
        client_token : String? = nil,
        default_route : Types::DefaultRouteInput? = nil,
        tags : Hash(String, String)? = nil,
        uri_path_route : Types::UriPathRouteInput? = nil
      ) : Protocol::Request
        input = Types::CreateRouteRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, route_type: route_type, service_identifier: service_identifier, client_token: client_token, default_route: default_route, tags: tags, uri_path_route: uri_path_route)
        create_route(input)
      end
      def create_route(input : Types::CreateRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates an Amazon Web Services Migration Hub Refactor Spaces service. The account owner of the
      # service is always the environment owner, regardless of which account in the environment creates the
      # service. Services have either a URL endpoint in a virtual private cloud (VPC), or a Lambda function
      # endpoint. If an Amazon Web Services resource is launched in a service VPC, and you want it to be
      # accessible to all of an environment’s services with VPCs and routes, apply the
      # RefactorSpacesSecurityGroup to the resource. Alternatively, to add more cross-account constraints,
      # apply your own security group.
      def create_service(
        application_identifier : String,
        endpoint_type : String,
        environment_identifier : String,
        name : String,
        client_token : String? = nil,
        description : String? = nil,
        lambda_endpoint : Types::LambdaEndpointInput? = nil,
        tags : Hash(String, String)? = nil,
        url_endpoint : Types::UrlEndpointInput? = nil,
        vpc_id : String? = nil
      ) : Protocol::Request
        input = Types::CreateServiceRequest.new(application_identifier: application_identifier, endpoint_type: endpoint_type, environment_identifier: environment_identifier, name: name, client_token: client_token, description: description, lambda_endpoint: lambda_endpoint, tags: tags, url_endpoint: url_endpoint, vpc_id: vpc_id)
        create_service(input)
      end
      def create_service(input : Types::CreateServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Web Services Migration Hub Refactor Spaces application. Before you can delete an
      # application, you must first delete any services or routes within the application.
      def delete_application(
        application_identifier : String,
        environment_identifier : String
      ) : Protocol::Request
        input = Types::DeleteApplicationRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier)
        delete_application(input)
      end
      def delete_application(input : Types::DeleteApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Web Services Migration Hub Refactor Spaces environment. Before you can delete an
      # environment, you must first delete any applications and services within the environment.
      def delete_environment(
        environment_identifier : String
      ) : Protocol::Request
        input = Types::DeleteEnvironmentRequest.new(environment_identifier: environment_identifier)
        delete_environment(input)
      end
      def delete_environment(input : Types::DeleteEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the resource policy set for the environment.
      def delete_resource_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::DeleteResourcePolicyRequest.new(identifier: identifier)
        delete_resource_policy(input)
      end
      def delete_resource_policy(input : Types::DeleteResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Web Services Migration Hub Refactor Spaces route.
      def delete_route(
        application_identifier : String,
        environment_identifier : String,
        route_identifier : String
      ) : Protocol::Request
        input = Types::DeleteRouteRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, route_identifier: route_identifier)
        delete_route(input)
      end
      def delete_route(input : Types::DeleteRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an Amazon Web Services Migration Hub Refactor Spaces service.
      def delete_service(
        application_identifier : String,
        environment_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::DeleteServiceRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, service_identifier: service_identifier)
        delete_service(input)
      end
      def delete_service(input : Types::DeleteServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon Web Services Migration Hub Refactor Spaces application.
      def get_application(
        application_identifier : String,
        environment_identifier : String
      ) : Protocol::Request
        input = Types::GetApplicationRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier)
        get_application(input)
      end
      def get_application(input : Types::GetApplicationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_APPLICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon Web Services Migration Hub Refactor Spaces environment.
      def get_environment(
        environment_identifier : String
      ) : Protocol::Request
        input = Types::GetEnvironmentRequest.new(environment_identifier: environment_identifier)
        get_environment(input)
      end
      def get_environment(input : Types::GetEnvironmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ENVIRONMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the resource-based permission policy that is set for the given environment.
      def get_resource_policy(
        identifier : String
      ) : Protocol::Request
        input = Types::GetResourcePolicyRequest.new(identifier: identifier)
        get_resource_policy(input)
      end
      def get_resource_policy(input : Types::GetResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon Web Services Migration Hub Refactor Spaces route.
      def get_route(
        application_identifier : String,
        environment_identifier : String,
        route_identifier : String
      ) : Protocol::Request
        input = Types::GetRouteRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, route_identifier: route_identifier)
        get_route(input)
      end
      def get_route(input : Types::GetRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets an Amazon Web Services Migration Hub Refactor Spaces service.
      def get_service(
        application_identifier : String,
        environment_identifier : String,
        service_identifier : String
      ) : Protocol::Request
        input = Types::GetServiceRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, service_identifier: service_identifier)
        get_service(input)
      end
      def get_service(input : Types::GetServiceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the Amazon Web Services Migration Hub Refactor Spaces applications within an environment.
      def list_applications(
        environment_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListApplicationsRequest.new(environment_identifier: environment_identifier, max_results: max_results, next_token: next_token)
        list_applications(input)
      end
      def list_applications(input : Types::ListApplicationsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_APPLICATIONS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all Amazon Web Services Migration Hub Refactor Spaces service virtual private clouds (VPCs)
      # that are part of the environment.
      def list_environment_vpcs(
        environment_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentVpcsRequest.new(environment_identifier: environment_identifier, max_results: max_results, next_token: next_token)
        list_environment_vpcs(input)
      end
      def list_environment_vpcs(input : Types::ListEnvironmentVpcsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENT_VPCS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists Amazon Web Services Migration Hub Refactor Spaces environments owned by a caller account or
      # shared with the caller account.
      def list_environments(
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListEnvironmentsRequest.new(max_results: max_results, next_token: next_token)
        list_environments(input)
      end
      def list_environments(input : Types::ListEnvironmentsRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ENVIRONMENTS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the Amazon Web Services Migration Hub Refactor Spaces routes within an application.
      def list_routes(
        application_identifier : String,
        environment_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutesRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, max_results: max_results, next_token: next_token)
        list_routes(input)
      end
      def list_routes(input : Types::ListRoutesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists all the Amazon Web Services Migration Hub Refactor Spaces services within an application.
      def list_services(
        application_identifier : String,
        environment_identifier : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListServicesRequest.new(application_identifier: application_identifier, environment_identifier: environment_identifier, max_results: max_results, next_token: next_token)
        list_services(input)
      end
      def list_services(input : Types::ListServicesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_SERVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the tags of a resource. The caller account must be the same as the resource’s OwnerAccountId .
      # Listing tags in other accounts is not supported.
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

      # Attaches a resource-based permission policy to the Amazon Web Services Migration Hub Refactor Spaces
      # environment. The policy must contain the same actions and condition statements as the
      # arn:aws:ram::aws:permission/AWSRAMDefaultPermissionRefactorSpacesEnvironment permission in Resource
      # Access Manager. The policy must not contain new lines or blank lines.
      def put_resource_policy(
        policy : String,
        resource_arn : String
      ) : Protocol::Request
        input = Types::PutResourcePolicyRequest.new(policy: policy, resource_arn: resource_arn)
        put_resource_policy(input)
      end
      def put_resource_policy(input : Types::PutResourcePolicyRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::PUT_RESOURCE_POLICY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the tags of a given resource. Tags are metadata which can be used to manage a resource. To
      # tag a resource, the caller account must be the same as the resource’s OwnerAccountId . Tagging
      # resources in other accounts is not supported. Amazon Web Services Migration Hub Refactor Spaces does
      # not propagate tags to orchestrated resources, such as an environment’s transit gateway.
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

      # Adds to or modifies the tags of the given resource. Tags are metadata which can be used to manage a
      # resource. To untag a resource, the caller account must be the same as the resource’s OwnerAccountId
      # . Untagging resources across accounts is not supported.
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

      # Updates an Amazon Web Services Migration Hub Refactor Spaces route.
      def update_route(
        activation_state : String,
        application_identifier : String,
        environment_identifier : String,
        route_identifier : String
      ) : Protocol::Request
        input = Types::UpdateRouteRequest.new(activation_state: activation_state, application_identifier: application_identifier, environment_identifier: environment_identifier, route_identifier: route_identifier)
        update_route(input)
      end
      def update_route(input : Types::UpdateRouteRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
