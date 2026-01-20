module AwsSdk
  module AppMesh
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

      # Creates a gateway route. A gateway route is attached to a virtual gateway and routes traffic to an
      # existing virtual service. If a route matches a request, it can distribute traffic to a target
      # virtual service. For more information about gateway routes, see Gateway routes .

      def create_gateway_route(
        gateway_route_name : String,
        mesh_name : String,
        spec : Types::GatewayRouteSpec,
        virtual_gateway_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateGatewayRouteInput.new(gateway_route_name: gateway_route_name, mesh_name: mesh_name, spec: spec, virtual_gateway_name: virtual_gateway_name, client_token: client_token, mesh_owner: mesh_owner, tags: tags)
        create_gateway_route(input)
      end

      def create_gateway_route(input : Types::CreateGatewayRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_GATEWAY_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a service mesh. A service mesh is a logical boundary for network traffic between services
      # that are represented by resources within the mesh. After you create your service mesh, you can
      # create virtual services, virtual nodes, virtual routers, and routes to distribute traffic between
      # the applications in your mesh. For more information about service meshes, see Service meshes .

      def create_mesh(
        mesh_name : String,
        client_token : String? = nil,
        spec : Types::MeshSpec? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateMeshInput.new(mesh_name: mesh_name, client_token: client_token, spec: spec, tags: tags)
        create_mesh(input)
      end

      def create_mesh(input : Types::CreateMeshInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a route that is associated with a virtual router. You can route several different protocols
      # and define a retry policy for a route. Traffic can be routed to one or more virtual nodes. For more
      # information about routes, see Routes .

      def create_route(
        mesh_name : String,
        route_name : String,
        spec : Types::RouteSpec,
        virtual_router_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateRouteInput.new(mesh_name: mesh_name, route_name: route_name, spec: spec, virtual_router_name: virtual_router_name, client_token: client_token, mesh_owner: mesh_owner, tags: tags)
        create_route(input)
      end

      def create_route(input : Types::CreateRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a virtual gateway. A virtual gateway allows resources outside your mesh to communicate to
      # resources that are inside your mesh. The virtual gateway represents an Envoy proxy running in an
      # Amazon ECS task, in a Kubernetes service, or on an Amazon EC2 instance. Unlike a virtual node, which
      # represents an Envoy running with an application, a virtual gateway represents Envoy deployed by
      # itself. For more information about virtual gateways, see Virtual gateways .

      def create_virtual_gateway(
        mesh_name : String,
        spec : Types::VirtualGatewaySpec,
        virtual_gateway_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateVirtualGatewayInput.new(mesh_name: mesh_name, spec: spec, virtual_gateway_name: virtual_gateway_name, client_token: client_token, mesh_owner: mesh_owner, tags: tags)
        create_virtual_gateway(input)
      end

      def create_virtual_gateway(input : Types::CreateVirtualGatewayInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIRTUAL_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a virtual node within a service mesh. A virtual node acts as a logical pointer to a
      # particular task group, such as an Amazon ECS service or a Kubernetes deployment. When you create a
      # virtual node, you can specify the service discovery information for your task group, and whether the
      # proxy running in a task group will communicate with other proxies using Transport Layer Security
      # (TLS). You define a listener for any inbound traffic that your virtual node expects. Any virtual
      # service that your virtual node expects to communicate to is specified as a backend . The response
      # metadata for your new virtual node contains the arn that is associated with the virtual node. Set
      # this value to the full ARN; for example,
      # arn:aws:appmesh:us-west-2:123456789012:myMesh/default/virtualNode/myApp ) as the
      # APPMESH_RESOURCE_ARN environment variable for your task group's Envoy proxy container in your task
      # definition or pod spec. This is then mapped to the node.id and node.cluster Envoy parameters. By
      # default, App Mesh uses the name of the resource you specified in APPMESH_RESOURCE_ARN when Envoy is
      # referring to itself in metrics and traces. You can override this behavior by setting the
      # APPMESH_RESOURCE_CLUSTER environment variable with your own name. For more information about virtual
      # nodes, see Virtual nodes . You must be using 1.15.0 or later of the Envoy image when setting these
      # variables. For more information aboutApp Mesh Envoy variables, see Envoy image in the App Mesh User
      # Guide.

      def create_virtual_node(
        mesh_name : String,
        spec : Types::VirtualNodeSpec,
        virtual_node_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateVirtualNodeInput.new(mesh_name: mesh_name, spec: spec, virtual_node_name: virtual_node_name, client_token: client_token, mesh_owner: mesh_owner, tags: tags)
        create_virtual_node(input)
      end

      def create_virtual_node(input : Types::CreateVirtualNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIRTUAL_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a virtual router within a service mesh. Specify a listener for any inbound traffic that your
      # virtual router receives. Create a virtual router for each protocol and port that you need to route.
      # Virtual routers handle traffic for one or more virtual services within your mesh. After you create
      # your virtual router, create and associate routes for your virtual router that direct incoming
      # requests to different virtual nodes. For more information about virtual routers, see Virtual routers
      # .

      def create_virtual_router(
        mesh_name : String,
        spec : Types::VirtualRouterSpec,
        virtual_router_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateVirtualRouterInput.new(mesh_name: mesh_name, spec: spec, virtual_router_name: virtual_router_name, client_token: client_token, mesh_owner: mesh_owner, tags: tags)
        create_virtual_router(input)
      end

      def create_virtual_router(input : Types::CreateVirtualRouterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIRTUAL_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a virtual service within a service mesh. A virtual service is an abstraction of a real
      # service that is provided by a virtual node directly or indirectly by means of a virtual router.
      # Dependent services call your virtual service by its virtualServiceName , and those requests are
      # routed to the virtual node or virtual router that is specified as the provider for the virtual
      # service. For more information about virtual services, see Virtual services .

      def create_virtual_service(
        mesh_name : String,
        spec : Types::VirtualServiceSpec,
        virtual_service_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil,
        tags : Array(Types::TagRef)? = nil
      ) : Protocol::Request
        input = Types::CreateVirtualServiceInput.new(mesh_name: mesh_name, spec: spec, virtual_service_name: virtual_service_name, client_token: client_token, mesh_owner: mesh_owner, tags: tags)
        create_virtual_service(input)
      end

      def create_virtual_service(input : Types::CreateVirtualServiceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_VIRTUAL_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing gateway route.

      def delete_gateway_route(
        gateway_route_name : String,
        mesh_name : String,
        virtual_gateway_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteGatewayRouteInput.new(gateway_route_name: gateway_route_name, mesh_name: mesh_name, virtual_gateway_name: virtual_gateway_name, mesh_owner: mesh_owner)
        delete_gateway_route(input)
      end

      def delete_gateway_route(input : Types::DeleteGatewayRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_GATEWAY_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing service mesh. You must delete all resources (virtual services, routes, virtual
      # routers, and virtual nodes) in the service mesh before you can delete the mesh itself.

      def delete_mesh(
        mesh_name : String
      ) : Protocol::Request
        input = Types::DeleteMeshInput.new(mesh_name: mesh_name)
        delete_mesh(input)
      end

      def delete_mesh(input : Types::DeleteMeshInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing route.

      def delete_route(
        mesh_name : String,
        route_name : String,
        virtual_router_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteRouteInput.new(mesh_name: mesh_name, route_name: route_name, virtual_router_name: virtual_router_name, mesh_owner: mesh_owner)
        delete_route(input)
      end

      def delete_route(input : Types::DeleteRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing virtual gateway. You cannot delete a virtual gateway if any gateway routes are
      # associated to it.

      def delete_virtual_gateway(
        mesh_name : String,
        virtual_gateway_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVirtualGatewayInput.new(mesh_name: mesh_name, virtual_gateway_name: virtual_gateway_name, mesh_owner: mesh_owner)
        delete_virtual_gateway(input)
      end

      def delete_virtual_gateway(input : Types::DeleteVirtualGatewayInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIRTUAL_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing virtual node. You must delete any virtual services that list a virtual node as a
      # service provider before you can delete the virtual node itself.

      def delete_virtual_node(
        mesh_name : String,
        virtual_node_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVirtualNodeInput.new(mesh_name: mesh_name, virtual_node_name: virtual_node_name, mesh_owner: mesh_owner)
        delete_virtual_node(input)
      end

      def delete_virtual_node(input : Types::DeleteVirtualNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIRTUAL_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing virtual router. You must delete any routes associated with the virtual router
      # before you can delete the router itself.

      def delete_virtual_router(
        mesh_name : String,
        virtual_router_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVirtualRouterInput.new(mesh_name: mesh_name, virtual_router_name: virtual_router_name, mesh_owner: mesh_owner)
        delete_virtual_router(input)
      end

      def delete_virtual_router(input : Types::DeleteVirtualRouterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIRTUAL_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an existing virtual service.

      def delete_virtual_service(
        mesh_name : String,
        virtual_service_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DeleteVirtualServiceInput.new(mesh_name: mesh_name, virtual_service_name: virtual_service_name, mesh_owner: mesh_owner)
        delete_virtual_service(input)
      end

      def delete_virtual_service(input : Types::DeleteVirtualServiceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_VIRTUAL_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing gateway route.

      def describe_gateway_route(
        gateway_route_name : String,
        mesh_name : String,
        virtual_gateway_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeGatewayRouteInput.new(gateway_route_name: gateway_route_name, mesh_name: mesh_name, virtual_gateway_name: virtual_gateway_name, mesh_owner: mesh_owner)
        describe_gateway_route(input)
      end

      def describe_gateway_route(input : Types::DescribeGatewayRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_GATEWAY_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing service mesh.

      def describe_mesh(
        mesh_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeMeshInput.new(mesh_name: mesh_name, mesh_owner: mesh_owner)
        describe_mesh(input)
      end

      def describe_mesh(input : Types::DescribeMeshInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_MESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing route.

      def describe_route(
        mesh_name : String,
        route_name : String,
        virtual_router_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeRouteInput.new(mesh_name: mesh_name, route_name: route_name, virtual_router_name: virtual_router_name, mesh_owner: mesh_owner)
        describe_route(input)
      end

      def describe_route(input : Types::DescribeRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing virtual gateway.

      def describe_virtual_gateway(
        mesh_name : String,
        virtual_gateway_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeVirtualGatewayInput.new(mesh_name: mesh_name, virtual_gateway_name: virtual_gateway_name, mesh_owner: mesh_owner)
        describe_virtual_gateway(input)
      end

      def describe_virtual_gateway(input : Types::DescribeVirtualGatewayInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIRTUAL_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing virtual node.

      def describe_virtual_node(
        mesh_name : String,
        virtual_node_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeVirtualNodeInput.new(mesh_name: mesh_name, virtual_node_name: virtual_node_name, mesh_owner: mesh_owner)
        describe_virtual_node(input)
      end

      def describe_virtual_node(input : Types::DescribeVirtualNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIRTUAL_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing virtual router.

      def describe_virtual_router(
        mesh_name : String,
        virtual_router_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeVirtualRouterInput.new(mesh_name: mesh_name, virtual_router_name: virtual_router_name, mesh_owner: mesh_owner)
        describe_virtual_router(input)
      end

      def describe_virtual_router(input : Types::DescribeVirtualRouterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIRTUAL_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Describes an existing virtual service.

      def describe_virtual_service(
        mesh_name : String,
        virtual_service_name : String,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::DescribeVirtualServiceInput.new(mesh_name: mesh_name, virtual_service_name: virtual_service_name, mesh_owner: mesh_owner)
        describe_virtual_service(input)
      end

      def describe_virtual_service(input : Types::DescribeVirtualServiceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIRTUAL_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing gateway routes that are associated to a virtual gateway.

      def list_gateway_routes(
        mesh_name : String,
        virtual_gateway_name : String,
        limit : Int32? = nil,
        mesh_owner : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListGatewayRoutesInput.new(mesh_name: mesh_name, virtual_gateway_name: virtual_gateway_name, limit: limit, mesh_owner: mesh_owner, next_token: next_token)
        list_gateway_routes(input)
      end

      def list_gateway_routes(input : Types::ListGatewayRoutesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_GATEWAY_ROUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing service meshes.

      def list_meshes(
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListMeshesInput.new(limit: limit, next_token: next_token)
        list_meshes(input)
      end

      def list_meshes(input : Types::ListMeshesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_MESHES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing routes in a service mesh.

      def list_routes(
        mesh_name : String,
        virtual_router_name : String,
        limit : Int32? = nil,
        mesh_owner : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListRoutesInput.new(mesh_name: mesh_name, virtual_router_name: virtual_router_name, limit: limit, mesh_owner: mesh_owner, next_token: next_token)
        list_routes(input)
      end

      def list_routes(input : Types::ListRoutesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ROUTES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # List the tags for an App Mesh resource.

      def list_tags_for_resource(
        resource_arn : String,
        limit : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListTagsForResourceInput.new(resource_arn: resource_arn, limit: limit, next_token: next_token)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing virtual gateways in a service mesh.

      def list_virtual_gateways(
        mesh_name : String,
        limit : Int32? = nil,
        mesh_owner : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVirtualGatewaysInput.new(mesh_name: mesh_name, limit: limit, mesh_owner: mesh_owner, next_token: next_token)
        list_virtual_gateways(input)
      end

      def list_virtual_gateways(input : Types::ListVirtualGatewaysInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIRTUAL_GATEWAYS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing virtual nodes.

      def list_virtual_nodes(
        mesh_name : String,
        limit : Int32? = nil,
        mesh_owner : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVirtualNodesInput.new(mesh_name: mesh_name, limit: limit, mesh_owner: mesh_owner, next_token: next_token)
        list_virtual_nodes(input)
      end

      def list_virtual_nodes(input : Types::ListVirtualNodesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIRTUAL_NODES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing virtual routers in a service mesh.

      def list_virtual_routers(
        mesh_name : String,
        limit : Int32? = nil,
        mesh_owner : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVirtualRoutersInput.new(mesh_name: mesh_name, limit: limit, mesh_owner: mesh_owner, next_token: next_token)
        list_virtual_routers(input)
      end

      def list_virtual_routers(input : Types::ListVirtualRoutersInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIRTUAL_ROUTERS, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of existing virtual services in a service mesh.

      def list_virtual_services(
        mesh_name : String,
        limit : Int32? = nil,
        mesh_owner : String? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListVirtualServicesInput.new(mesh_name: mesh_name, limit: limit, mesh_owner: mesh_owner, next_token: next_token)
        list_virtual_services(input)
      end

      def list_virtual_services(input : Types::ListVirtualServicesInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_VIRTUAL_SERVICES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Associates the specified tags to a resource with the specified resourceArn . If existing tags on a
      # resource aren't specified in the request parameters, they aren't changed. When a resource is
      # deleted, the tags associated with that resource are also deleted.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::TagRef)
      ) : Protocol::Request
        input = Types::TagResourceInput.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes specified tags from a resource.

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

      # Updates an existing gateway route that is associated to a specified virtual gateway in a service
      # mesh.

      def update_gateway_route(
        gateway_route_name : String,
        mesh_name : String,
        spec : Types::GatewayRouteSpec,
        virtual_gateway_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateGatewayRouteInput.new(gateway_route_name: gateway_route_name, mesh_name: mesh_name, spec: spec, virtual_gateway_name: virtual_gateway_name, client_token: client_token, mesh_owner: mesh_owner)
        update_gateway_route(input)
      end

      def update_gateway_route(input : Types::UpdateGatewayRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_GATEWAY_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing service mesh.

      def update_mesh(
        mesh_name : String,
        client_token : String? = nil,
        spec : Types::MeshSpec? = nil
      ) : Protocol::Request
        input = Types::UpdateMeshInput.new(mesh_name: mesh_name, client_token: client_token, spec: spec)
        update_mesh(input)
      end

      def update_mesh(input : Types::UpdateMeshInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_MESH, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing route for a specified service mesh and virtual router.

      def update_route(
        mesh_name : String,
        route_name : String,
        spec : Types::RouteSpec,
        virtual_router_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateRouteInput.new(mesh_name: mesh_name, route_name: route_name, spec: spec, virtual_router_name: virtual_router_name, client_token: client_token, mesh_owner: mesh_owner)
        update_route(input)
      end

      def update_route(input : Types::UpdateRouteInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ROUTE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing virtual gateway in a specified service mesh.

      def update_virtual_gateway(
        mesh_name : String,
        spec : Types::VirtualGatewaySpec,
        virtual_gateway_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVirtualGatewayInput.new(mesh_name: mesh_name, spec: spec, virtual_gateway_name: virtual_gateway_name, client_token: client_token, mesh_owner: mesh_owner)
        update_virtual_gateway(input)
      end

      def update_virtual_gateway(input : Types::UpdateVirtualGatewayInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIRTUAL_GATEWAY, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing virtual node in a specified service mesh.

      def update_virtual_node(
        mesh_name : String,
        spec : Types::VirtualNodeSpec,
        virtual_node_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVirtualNodeInput.new(mesh_name: mesh_name, spec: spec, virtual_node_name: virtual_node_name, client_token: client_token, mesh_owner: mesh_owner)
        update_virtual_node(input)
      end

      def update_virtual_node(input : Types::UpdateVirtualNodeInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIRTUAL_NODE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing virtual router in a specified service mesh.

      def update_virtual_router(
        mesh_name : String,
        spec : Types::VirtualRouterSpec,
        virtual_router_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVirtualRouterInput.new(mesh_name: mesh_name, spec: spec, virtual_router_name: virtual_router_name, client_token: client_token, mesh_owner: mesh_owner)
        update_virtual_router(input)
      end

      def update_virtual_router(input : Types::UpdateVirtualRouterInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIRTUAL_ROUTER, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates an existing virtual service in a specified service mesh.

      def update_virtual_service(
        mesh_name : String,
        spec : Types::VirtualServiceSpec,
        virtual_service_name : String,
        client_token : String? = nil,
        mesh_owner : String? = nil
      ) : Protocol::Request
        input = Types::UpdateVirtualServiceInput.new(mesh_name: mesh_name, spec: spec, virtual_service_name: virtual_service_name, client_token: client_token, mesh_owner: mesh_owner)
        update_virtual_service(input)
      end

      def update_virtual_service(input : Types::UpdateVirtualServiceInput) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_VIRTUAL_SERVICE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
