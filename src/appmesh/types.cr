require "json"
require "time"

module Aws
  module AppMesh
    module Types

      # An object that represents the access logging information for a virtual node.

      struct AccessLog
        include JSON::Serializable

        # The file object to send virtual node access logs to.

        @[JSON::Field(key: "file")]
        getter file : Types::FileAccessLog?

        def initialize(
          @file : Types::FileAccessLog? = nil
        )
        end
      end

      # An object that represents the Cloud Map attribute information for your virtual node. Cloud Map is
      # not available in the eu-south-1 Region.

      struct AwsCloudMapInstanceAttribute
        include JSON::Serializable

        # The name of an Cloud Map service instance attribute key. Any Cloud Map service instance that
        # contains the specified key and value is returned.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of an Cloud Map service instance attribute key. Any Cloud Map service instance that
        # contains the specified key and value is returned.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # An object that represents the Cloud Map service discovery information for your virtual node. Cloud
      # Map is not available in the eu-south-1 Region.

      struct AwsCloudMapServiceDiscovery
        include JSON::Serializable

        # The name of the Cloud Map namespace to use.

        @[JSON::Field(key: "namespaceName")]
        getter namespace_name : String

        # The name of the Cloud Map service to use.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # A string map that contains attributes with values that you can use to filter instances by any custom
        # attribute that you specified when you registered the instance. Only instances that match all of the
        # specified key/value pairs will be returned.

        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::AwsCloudMapInstanceAttribute)?

        # The preferred IP version that this virtual node uses. Setting the IP preference on the virtual node
        # only overrides the IP preference set for the mesh on this specific node.

        @[JSON::Field(key: "ipPreference")]
        getter ip_preference : String?

        def initialize(
          @namespace_name : String,
          @service_name : String,
          @attributes : Array(Types::AwsCloudMapInstanceAttribute)? = nil,
          @ip_preference : String? = nil
        )
        end
      end

      # An object that represents the backends that a virtual node is expected to send outbound traffic to.

      struct Backend
        include JSON::Serializable

        # Specifies a virtual service to use as a backend.

        @[JSON::Field(key: "virtualService")]
        getter virtual_service : Types::VirtualServiceBackend?

        def initialize(
          @virtual_service : Types::VirtualServiceBackend? = nil
        )
        end
      end

      # An object that represents the default properties for a backend.

      struct BackendDefaults
        include JSON::Serializable

        # A reference to an object that represents a client policy.

        @[JSON::Field(key: "clientPolicy")]
        getter client_policy : Types::ClientPolicy?

        def initialize(
          @client_policy : Types::ClientPolicy? = nil
        )
        end
      end

      # The request syntax was malformed. Check your request syntax and try again.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents a client policy.

      struct ClientPolicy
        include JSON::Serializable

        # A reference to an object that represents a Transport Layer Security (TLS) client policy.

        @[JSON::Field(key: "tls")]
        getter tls : Types::ClientPolicyTls?

        def initialize(
          @tls : Types::ClientPolicyTls? = nil
        )
        end
      end

      # A reference to an object that represents a Transport Layer Security (TLS) client policy.

      struct ClientPolicyTls
        include JSON::Serializable

        # A reference to an object that represents a TLS validation context.

        @[JSON::Field(key: "validation")]
        getter validation : Types::TlsValidationContext

        # A reference to an object that represents a client's TLS certificate.

        @[JSON::Field(key: "certificate")]
        getter certificate : Types::ClientTlsCertificate?

        # Whether the policy is enforced. The default is True , if a value isn't specified.

        @[JSON::Field(key: "enforce")]
        getter enforce : Bool?

        # One or more ports that the policy is enforced for.

        @[JSON::Field(key: "ports")]
        getter ports : Array(Int32)?

        def initialize(
          @validation : Types::TlsValidationContext,
          @certificate : Types::ClientTlsCertificate? = nil,
          @enforce : Bool? = nil,
          @ports : Array(Int32)? = nil
        )
        end
      end

      # An object that represents the client's certificate.

      struct ClientTlsCertificate
        include JSON::Serializable

        # An object that represents a local file certificate. The certificate must meet specific requirements
        # and you must have proxy authorization enabled. For more information, see Transport Layer Security
        # (TLS) .

        @[JSON::Field(key: "file")]
        getter file : Types::ListenerTlsFileCertificate?

        # A reference to an object that represents a client's TLS Secret Discovery Service certificate.

        @[JSON::Field(key: "sds")]
        getter sds : Types::ListenerTlsSdsCertificate?

        def initialize(
          @file : Types::ListenerTlsFileCertificate? = nil,
          @sds : Types::ListenerTlsSdsCertificate? = nil
        )
        end
      end

      # The request contains a client token that was used for a previous update resource call with different
      # specifications. Try the request again with a new client token.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateGatewayRouteInput
        include JSON::Serializable

        # The name to use for the gateway route.

        @[JSON::Field(key: "gatewayRouteName")]
        getter gateway_route_name : String

        # The name of the service mesh to create the gateway route in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The gateway route specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::GatewayRouteSpec

        # The name of the virtual gateway to associate the gateway route with. If the virtual gateway is in a
        # shared mesh, then you must be the owner of the virtual gateway resource.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then the account that you specify must share the mesh with your account before you can create the
        # resource in the service mesh. For more information about mesh sharing, see Working with shared
        # meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # Optional metadata that you can apply to the gateway route to assist with categorization and
        # organization. Each tag consists of a key and an optional value, both of which you define. Tag keys
        # can have a maximum character length of 128 characters, and tag values can have a maximum length of
        # 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @gateway_route_name : String,
          @mesh_name : String,
          @spec : Types::GatewayRouteSpec,
          @virtual_gateway_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateGatewayRouteOutput
        include JSON::Serializable

        # The full description of your gateway route following the create call.

        @[JSON::Field(key: "gatewayRoute")]
        getter gateway_route : Types::GatewayRouteData

        def initialize(
          @gateway_route : Types::GatewayRouteData
        )
        end
      end


      struct CreateMeshInput
        include JSON::Serializable

        # The name to use for the service mesh.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The service mesh specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::MeshSpec?

        # Optional metadata that you can apply to the service mesh to assist with categorization and
        # organization. Each tag consists of a key and an optional value, both of which you define. Tag keys
        # can have a maximum character length of 128 characters, and tag values can have a maximum length of
        # 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @mesh_name : String,
          @client_token : String? = nil,
          @spec : Types::MeshSpec? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateMeshOutput
        include JSON::Serializable

        # The full description of your service mesh following the create call.

        @[JSON::Field(key: "mesh")]
        getter mesh : Types::MeshData

        def initialize(
          @mesh : Types::MeshData
        )
        end
      end


      struct CreateRouteInput
        include JSON::Serializable

        # The name of the service mesh to create the route in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name to use for the route.

        @[JSON::Field(key: "routeName")]
        getter route_name : String

        # The route specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::RouteSpec

        # The name of the virtual router in which to create the route. If the virtual router is in a shared
        # mesh, then you must be the owner of the virtual router resource.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then the account that you specify must share the mesh with your account before you can create the
        # resource in the service mesh. For more information about mesh sharing, see Working with shared
        # meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # Optional metadata that you can apply to the route to assist with categorization and organization.
        # Each tag consists of a key and an optional value, both of which you define. Tag keys can have a
        # maximum character length of 128 characters, and tag values can have a maximum length of 256
        # characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @mesh_name : String,
          @route_name : String,
          @spec : Types::RouteSpec,
          @virtual_router_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateRouteOutput
        include JSON::Serializable

        # The full description of your mesh following the create call.

        @[JSON::Field(key: "route")]
        getter route : Types::RouteData

        def initialize(
          @route : Types::RouteData
        )
        end
      end


      struct CreateVirtualGatewayInput
        include JSON::Serializable

        # The name of the service mesh to create the virtual gateway in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The virtual gateway specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualGatewaySpec

        # The name to use for the virtual gateway.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then the account that you specify must share the mesh with your account before you can create the
        # resource in the service mesh. For more information about mesh sharing, see Working with shared
        # meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # Optional metadata that you can apply to the virtual gateway to assist with categorization and
        # organization. Each tag consists of a key and an optional value, both of which you define. Tag keys
        # can have a maximum character length of 128 characters, and tag values can have a maximum length of
        # 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualGatewaySpec,
          @virtual_gateway_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateVirtualGatewayOutput
        include JSON::Serializable

        # The full description of your virtual gateway following the create call.

        @[JSON::Field(key: "virtualGateway")]
        getter virtual_gateway : Types::VirtualGatewayData

        def initialize(
          @virtual_gateway : Types::VirtualGatewayData
        )
        end
      end


      struct CreateVirtualNodeInput
        include JSON::Serializable

        # The name of the service mesh to create the virtual node in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The virtual node specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualNodeSpec

        # The name to use for the virtual node.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then the account that you specify must share the mesh with your account before you can create the
        # resource in the service mesh. For more information about mesh sharing, see Working with shared
        # meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # Optional metadata that you can apply to the virtual node to assist with categorization and
        # organization. Each tag consists of a key and an optional value, both of which you define. Tag keys
        # can have a maximum character length of 128 characters, and tag values can have a maximum length of
        # 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualNodeSpec,
          @virtual_node_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateVirtualNodeOutput
        include JSON::Serializable

        # The full description of your virtual node following the create call.

        @[JSON::Field(key: "virtualNode")]
        getter virtual_node : Types::VirtualNodeData

        def initialize(
          @virtual_node : Types::VirtualNodeData
        )
        end
      end


      struct CreateVirtualRouterInput
        include JSON::Serializable

        # The name of the service mesh to create the virtual router in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The virtual router specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualRouterSpec

        # The name to use for the virtual router.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then the account that you specify must share the mesh with your account before you can create the
        # resource in the service mesh. For more information about mesh sharing, see Working with shared
        # meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # Optional metadata that you can apply to the virtual router to assist with categorization and
        # organization. Each tag consists of a key and an optional value, both of which you define. Tag keys
        # can have a maximum character length of 128 characters, and tag values can have a maximum length of
        # 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualRouterSpec,
          @virtual_router_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateVirtualRouterOutput
        include JSON::Serializable

        # The full description of your virtual router following the create call.

        @[JSON::Field(key: "virtualRouter")]
        getter virtual_router : Types::VirtualRouterData

        def initialize(
          @virtual_router : Types::VirtualRouterData
        )
        end
      end


      struct CreateVirtualServiceInput
        include JSON::Serializable

        # The name of the service mesh to create the virtual service in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The virtual service specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualServiceSpec

        # The name to use for the virtual service.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then the account that you specify must share the mesh with your account before you can create the
        # resource in the service mesh. For more information about mesh sharing, see Working with shared
        # meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # Optional metadata that you can apply to the virtual service to assist with categorization and
        # organization. Each tag consists of a key and an optional value, both of which you define. Tag keys
        # can have a maximum character length of 128 characters, and tag values can have a maximum length of
        # 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualServiceSpec,
          @virtual_service_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil,
          @tags : Array(Types::TagRef)? = nil
        )
        end
      end


      struct CreateVirtualServiceOutput
        include JSON::Serializable

        # The full description of your virtual service following the create call.

        @[JSON::Field(key: "virtualService")]
        getter virtual_service : Types::VirtualServiceData

        def initialize(
          @virtual_service : Types::VirtualServiceData
        )
        end
      end


      struct DeleteGatewayRouteInput
        include JSON::Serializable

        # The name of the gateway route to delete.

        @[JSON::Field(key: "gatewayRouteName")]
        getter gateway_route_name : String

        # The name of the service mesh to delete the gateway route from.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual gateway to delete the route from.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @gateway_route_name : String,
          @mesh_name : String,
          @virtual_gateway_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DeleteGatewayRouteOutput
        include JSON::Serializable

        # The gateway route that was deleted.

        @[JSON::Field(key: "gatewayRoute")]
        getter gateway_route : Types::GatewayRouteData

        def initialize(
          @gateway_route : Types::GatewayRouteData
        )
        end
      end


      struct DeleteMeshInput
        include JSON::Serializable

        # The name of the service mesh to delete.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        def initialize(
          @mesh_name : String
        )
        end
      end


      struct DeleteMeshOutput
        include JSON::Serializable

        # The service mesh that was deleted.

        @[JSON::Field(key: "mesh")]
        getter mesh : Types::MeshData

        def initialize(
          @mesh : Types::MeshData
        )
        end
      end


      struct DeleteRouteInput
        include JSON::Serializable

        # The name of the service mesh to delete the route in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the route to delete.

        @[JSON::Field(key: "routeName")]
        getter route_name : String

        # The name of the virtual router to delete the route in.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @route_name : String,
          @virtual_router_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DeleteRouteOutput
        include JSON::Serializable

        # The route that was deleted.

        @[JSON::Field(key: "route")]
        getter route : Types::RouteData

        def initialize(
          @route : Types::RouteData
        )
        end
      end


      struct DeleteVirtualGatewayInput
        include JSON::Serializable

        # The name of the service mesh to delete the virtual gateway from.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual gateway to delete.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_gateway_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DeleteVirtualGatewayOutput
        include JSON::Serializable

        # The virtual gateway that was deleted.

        @[JSON::Field(key: "virtualGateway")]
        getter virtual_gateway : Types::VirtualGatewayData

        def initialize(
          @virtual_gateway : Types::VirtualGatewayData
        )
        end
      end

      # Deletes a virtual node input.

      struct DeleteVirtualNodeInput
        include JSON::Serializable

        # The name of the service mesh to delete the virtual node in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual node to delete.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_node_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DeleteVirtualNodeOutput
        include JSON::Serializable

        # The virtual node that was deleted.

        @[JSON::Field(key: "virtualNode")]
        getter virtual_node : Types::VirtualNodeData

        def initialize(
          @virtual_node : Types::VirtualNodeData
        )
        end
      end


      struct DeleteVirtualRouterInput
        include JSON::Serializable

        # The name of the service mesh to delete the virtual router in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual router to delete.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_router_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DeleteVirtualRouterOutput
        include JSON::Serializable

        # The virtual router that was deleted.

        @[JSON::Field(key: "virtualRouter")]
        getter virtual_router : Types::VirtualRouterData

        def initialize(
          @virtual_router : Types::VirtualRouterData
        )
        end
      end


      struct DeleteVirtualServiceInput
        include JSON::Serializable

        # The name of the service mesh to delete the virtual service in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual service to delete.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_service_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DeleteVirtualServiceOutput
        include JSON::Serializable

        # The virtual service that was deleted.

        @[JSON::Field(key: "virtualService")]
        getter virtual_service : Types::VirtualServiceData

        def initialize(
          @virtual_service : Types::VirtualServiceData
        )
        end
      end


      struct DescribeGatewayRouteInput
        include JSON::Serializable

        # The name of the gateway route to describe.

        @[JSON::Field(key: "gatewayRouteName")]
        getter gateway_route_name : String

        # The name of the service mesh that the gateway route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual gateway that the gateway route is associated with.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @gateway_route_name : String,
          @mesh_name : String,
          @virtual_gateway_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeGatewayRouteOutput
        include JSON::Serializable

        # The full description of your gateway route.

        @[JSON::Field(key: "gatewayRoute")]
        getter gateway_route : Types::GatewayRouteData

        def initialize(
          @gateway_route : Types::GatewayRouteData
        )
        end
      end


      struct DescribeMeshInput
        include JSON::Serializable

        # The name of the service mesh to describe.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeMeshOutput
        include JSON::Serializable

        # The full description of your service mesh.

        @[JSON::Field(key: "mesh")]
        getter mesh : Types::MeshData

        def initialize(
          @mesh : Types::MeshData
        )
        end
      end


      struct DescribeRouteInput
        include JSON::Serializable

        # The name of the service mesh that the route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the route to describe.

        @[JSON::Field(key: "routeName")]
        getter route_name : String

        # The name of the virtual router that the route is associated with.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @route_name : String,
          @virtual_router_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeRouteOutput
        include JSON::Serializable

        # The full description of your route.

        @[JSON::Field(key: "route")]
        getter route : Types::RouteData

        def initialize(
          @route : Types::RouteData
        )
        end
      end


      struct DescribeVirtualGatewayInput
        include JSON::Serializable

        # The name of the service mesh that the gateway route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual gateway to describe.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_gateway_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeVirtualGatewayOutput
        include JSON::Serializable

        # The full description of your virtual gateway.

        @[JSON::Field(key: "virtualGateway")]
        getter virtual_gateway : Types::VirtualGatewayData

        def initialize(
          @virtual_gateway : Types::VirtualGatewayData
        )
        end
      end


      struct DescribeVirtualNodeInput
        include JSON::Serializable

        # The name of the service mesh that the virtual node resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual node to describe.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_node_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeVirtualNodeOutput
        include JSON::Serializable

        # The full description of your virtual node.

        @[JSON::Field(key: "virtualNode")]
        getter virtual_node : Types::VirtualNodeData

        def initialize(
          @virtual_node : Types::VirtualNodeData
        )
        end
      end


      struct DescribeVirtualRouterInput
        include JSON::Serializable

        # The name of the service mesh that the virtual router resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual router to describe.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_router_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeVirtualRouterOutput
        include JSON::Serializable

        # The full description of your virtual router.

        @[JSON::Field(key: "virtualRouter")]
        getter virtual_router : Types::VirtualRouterData

        def initialize(
          @virtual_router : Types::VirtualRouterData
        )
        end
      end


      struct DescribeVirtualServiceInput
        include JSON::Serializable

        # The name of the service mesh that the virtual service resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual service to describe.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @virtual_service_name : String,
          @mesh_owner : String? = nil
        )
        end
      end


      struct DescribeVirtualServiceOutput
        include JSON::Serializable

        # The full description of your virtual service.

        @[JSON::Field(key: "virtualService")]
        getter virtual_service : Types::VirtualServiceData

        def initialize(
          @virtual_service : Types::VirtualServiceData
        )
        end
      end

      # An object that represents the DNS service discovery information for your virtual node.

      struct DnsServiceDiscovery
        include JSON::Serializable

        # Specifies the DNS service discovery hostname for the virtual node.

        @[JSON::Field(key: "hostname")]
        getter hostname : String

        # The preferred IP version that this virtual node uses. Setting the IP preference on the virtual node
        # only overrides the IP preference set for the mesh on this specific node.

        @[JSON::Field(key: "ipPreference")]
        getter ip_preference : String?

        # Specifies the DNS response type for the virtual node.

        @[JSON::Field(key: "responseType")]
        getter response_type : String?

        def initialize(
          @hostname : String,
          @ip_preference : String? = nil,
          @response_type : String? = nil
        )
        end
      end

      # An object that represents a duration of time.

      struct Duration
        include JSON::Serializable

        # A unit of time.

        @[JSON::Field(key: "unit")]
        getter unit : String?

        # A number of time units.

        @[JSON::Field(key: "value")]
        getter value : Int64?

        def initialize(
          @unit : String? = nil,
          @value : Int64? = nil
        )
        end
      end

      # An object that represents the egress filter rules for a service mesh.

      struct EgressFilter
        include JSON::Serializable

        # The egress filter type. By default, the type is DROP_ALL , which allows egress only from virtual
        # nodes to other defined resources in the service mesh (and any traffic to *.amazonaws.com for Amazon
        # Web Services API calls). You can set the egress filter type to ALLOW_ALL to allow egress to any
        # endpoint inside or outside of the service mesh.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # An object that represents an access log file.

      struct FileAccessLog
        include JSON::Serializable

        # The file path to write access logs to. You can use /dev/stdout to send access logs to standard out
        # and configure your Envoy container to use a log driver, such as awslogs , to export the access logs
        # to a log storage service such as Amazon CloudWatch Logs. You can also specify a path in the Envoy
        # container's file system to write the files to disk. The Envoy process must have write permissions to
        # the path that you specify here. Otherwise, Envoy fails to bootstrap properly.

        @[JSON::Field(key: "path")]
        getter path : String

        # The specified format for the logs. The format is either json_format or text_format .

        @[JSON::Field(key: "format")]
        getter format : Types::LoggingFormat?

        def initialize(
          @path : String,
          @format : Types::LoggingFormat? = nil
        )
        end
      end

      # You don't have permissions to perform this action.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents a gateway route returned by a describe operation.

      struct GatewayRouteData
        include JSON::Serializable

        # The name of the gateway route.

        @[JSON::Field(key: "gatewayRouteName")]
        getter gateway_route_name : String

        # The name of the service mesh that the resource resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String


        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The specifications of the gateway route.

        @[JSON::Field(key: "spec")]
        getter spec : Types::GatewayRouteSpec

        # The status of the gateway route.

        @[JSON::Field(key: "status")]
        getter status : Types::GatewayRouteStatus

        # The virtual gateway that the gateway route is associated with.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        def initialize(
          @gateway_route_name : String,
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @spec : Types::GatewayRouteSpec,
          @status : Types::GatewayRouteStatus,
          @virtual_gateway_name : String
        )
        end
      end

      # An object representing the gateway route host name to match.

      struct GatewayRouteHostnameMatch
        include JSON::Serializable

        # The exact host name to match on.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        # The specified ending characters of the host name to match on.

        @[JSON::Field(key: "suffix")]
        getter suffix : String?

        def initialize(
          @exact : String? = nil,
          @suffix : String? = nil
        )
        end
      end

      # An object representing the gateway route host name to rewrite.

      struct GatewayRouteHostnameRewrite
        include JSON::Serializable

        # The default target host name to write to.

        @[JSON::Field(key: "defaultTargetHostname")]
        getter default_target_hostname : String?

        def initialize(
          @default_target_hostname : String? = nil
        )
        end
      end

      # An object that represents a gateway route returned by a list operation.

      struct GatewayRouteRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the gateway route.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The name of the gateway route.

        @[JSON::Field(key: "gatewayRouteName")]
        getter gateway_route_name : String

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh that the resource resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        # The virtual gateway that the gateway route is associated with.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @gateway_route_name : String,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @version : Int64,
          @virtual_gateway_name : String
        )
        end
      end

      # An object that represents a gateway route specification. Specify one gateway route type.

      struct GatewayRouteSpec
        include JSON::Serializable

        # An object that represents the specification of a gRPC gateway route.

        @[JSON::Field(key: "grpcRoute")]
        getter grpc_route : Types::GrpcGatewayRoute?

        # An object that represents the specification of an HTTP/2 gateway route.

        @[JSON::Field(key: "http2Route")]
        getter http2_route : Types::HttpGatewayRoute?

        # An object that represents the specification of an HTTP gateway route.

        @[JSON::Field(key: "httpRoute")]
        getter http_route : Types::HttpGatewayRoute?

        # The ordering of the gateway routes spec.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        def initialize(
          @grpc_route : Types::GrpcGatewayRoute? = nil,
          @http2_route : Types::HttpGatewayRoute? = nil,
          @http_route : Types::HttpGatewayRoute? = nil,
          @priority : Int32? = nil
        )
        end
      end

      # An object that represents the current status of a gateway route.

      struct GatewayRouteStatus
        include JSON::Serializable

        # The current status for the gateway route.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # An object that represents a gateway route target.

      struct GatewayRouteTarget
        include JSON::Serializable

        # An object that represents a virtual service gateway route target.

        @[JSON::Field(key: "virtualService")]
        getter virtual_service : Types::GatewayRouteVirtualService

        # The port number of the gateway route target.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @virtual_service : Types::GatewayRouteVirtualService,
          @port : Int32? = nil
        )
        end
      end

      # An object that represents the virtual service that traffic is routed to.

      struct GatewayRouteVirtualService
        include JSON::Serializable

        # The name of the virtual service that traffic is routed to.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        def initialize(
          @virtual_service_name : String
        )
        end
      end

      # An object that represents a gRPC gateway route.

      struct GrpcGatewayRoute
        include JSON::Serializable

        # An object that represents the action to take if a match is determined.

        @[JSON::Field(key: "action")]
        getter action : Types::GrpcGatewayRouteAction

        # An object that represents the criteria for determining a request match.

        @[JSON::Field(key: "match")]
        getter match : Types::GrpcGatewayRouteMatch

        def initialize(
          @action : Types::GrpcGatewayRouteAction,
          @match : Types::GrpcGatewayRouteMatch
        )
        end
      end

      # An object that represents the action to take if a match is determined.

      struct GrpcGatewayRouteAction
        include JSON::Serializable

        # An object that represents the target that traffic is routed to when a request matches the gateway
        # route.

        @[JSON::Field(key: "target")]
        getter target : Types::GatewayRouteTarget

        # The gateway route action to rewrite.

        @[JSON::Field(key: "rewrite")]
        getter rewrite : Types::GrpcGatewayRouteRewrite?

        def initialize(
          @target : Types::GatewayRouteTarget,
          @rewrite : Types::GrpcGatewayRouteRewrite? = nil
        )
        end
      end

      # An object that represents the criteria for determining a request match.

      struct GrpcGatewayRouteMatch
        include JSON::Serializable

        # The gateway route host name to be matched on.

        @[JSON::Field(key: "hostname")]
        getter hostname : Types::GatewayRouteHostnameMatch?

        # The gateway route metadata to be matched on.

        @[JSON::Field(key: "metadata")]
        getter metadata : Array(Types::GrpcGatewayRouteMetadata)?

        # The gateway route port to be matched on.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The fully qualified domain name for the service to match from the request.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @hostname : Types::GatewayRouteHostnameMatch? = nil,
          @metadata : Array(Types::GrpcGatewayRouteMetadata)? = nil,
          @port : Int32? = nil,
          @service_name : String? = nil
        )
        end
      end

      # An object representing the metadata of the gateway route.

      struct GrpcGatewayRouteMetadata
        include JSON::Serializable

        # A name for the gateway route metadata.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify True to match anything except the match criteria. The default value is False .

        @[JSON::Field(key: "invert")]
        getter invert : Bool?

        # The criteria for determining a metadata match.

        @[JSON::Field(key: "match")]
        getter match : Types::GrpcMetadataMatchMethod?

        def initialize(
          @name : String,
          @invert : Bool? = nil,
          @match : Types::GrpcMetadataMatchMethod? = nil
        )
        end
      end

      # An object that represents the gateway route to rewrite.

      struct GrpcGatewayRouteRewrite
        include JSON::Serializable

        # The host name of the gateway route to rewrite.

        @[JSON::Field(key: "hostname")]
        getter hostname : Types::GatewayRouteHostnameRewrite?

        def initialize(
          @hostname : Types::GatewayRouteHostnameRewrite? = nil
        )
        end
      end

      # An object representing the method header to be matched.

      struct GrpcMetadataMatchMethod
        include JSON::Serializable

        # The exact method header to be matched on.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        # The specified beginning characters of the method header to be matched on.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?


        @[JSON::Field(key: "range")]
        getter range : Types::MatchRange?

        # The regex used to match the method header.

        @[JSON::Field(key: "regex")]
        getter regex : String?

        # The specified ending characters of the method header to match on.

        @[JSON::Field(key: "suffix")]
        getter suffix : String?

        def initialize(
          @exact : String? = nil,
          @prefix : String? = nil,
          @range : Types::MatchRange? = nil,
          @regex : String? = nil,
          @suffix : String? = nil
        )
        end
      end

      # An object that represents a retry policy. Specify at least one value for at least one of the types
      # of RetryEvents , a value for maxRetries , and a value for perRetryTimeout . Both server-error and
      # gateway-error under httpRetryEvents include the Envoy reset policy. For more information on the
      # reset policy, see the Envoy documentation .

      struct GrpcRetryPolicy
        include JSON::Serializable

        # The maximum number of retry attempts.

        @[JSON::Field(key: "maxRetries")]
        getter max_retries : Int64

        # The timeout for each retry attempt.

        @[JSON::Field(key: "perRetryTimeout")]
        getter per_retry_timeout : Types::Duration

        # Specify at least one of the valid values.

        @[JSON::Field(key: "grpcRetryEvents")]
        getter grpc_retry_events : Array(String)?

        # Specify at least one of the following values. server-error – HTTP status codes 500, 501, 502, 503,
        # 504, 505, 506, 507, 508, 510, and 511 gateway-error – HTTP status codes 502, 503, and 504
        # client-error – HTTP status code 409 stream-error – Retry on refused stream

        @[JSON::Field(key: "httpRetryEvents")]
        getter http_retry_events : Array(String)?

        # Specify a valid value. The event occurs before any processing of a request has started and is
        # encountered when the upstream is temporarily or permanently unavailable.

        @[JSON::Field(key: "tcpRetryEvents")]
        getter tcp_retry_events : Array(String)?

        def initialize(
          @max_retries : Int64,
          @per_retry_timeout : Types::Duration,
          @grpc_retry_events : Array(String)? = nil,
          @http_retry_events : Array(String)? = nil,
          @tcp_retry_events : Array(String)? = nil
        )
        end
      end

      # An object that represents a gRPC route type.

      struct GrpcRoute
        include JSON::Serializable

        # An object that represents the action to take if a match is determined.

        @[JSON::Field(key: "action")]
        getter action : Types::GrpcRouteAction

        # An object that represents the criteria for determining a request match.

        @[JSON::Field(key: "match")]
        getter match : Types::GrpcRouteMatch

        # An object that represents a retry policy.

        @[JSON::Field(key: "retryPolicy")]
        getter retry_policy : Types::GrpcRetryPolicy?

        # An object that represents types of timeouts.

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::GrpcTimeout?

        def initialize(
          @action : Types::GrpcRouteAction,
          @match : Types::GrpcRouteMatch,
          @retry_policy : Types::GrpcRetryPolicy? = nil,
          @timeout : Types::GrpcTimeout? = nil
        )
        end
      end

      # An object that represents the action to take if a match is determined.

      struct GrpcRouteAction
        include JSON::Serializable

        # An object that represents the targets that traffic is routed to when a request matches the route.

        @[JSON::Field(key: "weightedTargets")]
        getter weighted_targets : Array(Types::WeightedTarget)

        def initialize(
          @weighted_targets : Array(Types::WeightedTarget)
        )
        end
      end

      # An object that represents the criteria for determining a request match.

      struct GrpcRouteMatch
        include JSON::Serializable

        # An object that represents the data to match from the request.

        @[JSON::Field(key: "metadata")]
        getter metadata : Array(Types::GrpcRouteMetadata)?

        # The method name to match from the request. If you specify a name, you must also specify a
        # serviceName .

        @[JSON::Field(key: "methodName")]
        getter method_name : String?

        # The port number to match on.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The fully qualified domain name for the service to match from the request.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @metadata : Array(Types::GrpcRouteMetadata)? = nil,
          @method_name : String? = nil,
          @port : Int32? = nil,
          @service_name : String? = nil
        )
        end
      end

      # An object that represents the match metadata for the route.

      struct GrpcRouteMetadata
        include JSON::Serializable

        # The name of the route.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify True to match anything except the match criteria. The default value is False .

        @[JSON::Field(key: "invert")]
        getter invert : Bool?

        # An object that represents the data to match from the request.

        @[JSON::Field(key: "match")]
        getter match : Types::GrpcRouteMetadataMatchMethod?

        def initialize(
          @name : String,
          @invert : Bool? = nil,
          @match : Types::GrpcRouteMetadataMatchMethod? = nil
        )
        end
      end

      # An object that represents the match method. Specify one of the match values.

      struct GrpcRouteMetadataMatchMethod
        include JSON::Serializable

        # The value sent by the client must match the specified value exactly.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        # The value sent by the client must begin with the specified characters.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # An object that represents the range of values to match on.

        @[JSON::Field(key: "range")]
        getter range : Types::MatchRange?

        # The value sent by the client must include the specified characters.

        @[JSON::Field(key: "regex")]
        getter regex : String?

        # The value sent by the client must end with the specified characters.

        @[JSON::Field(key: "suffix")]
        getter suffix : String?

        def initialize(
          @exact : String? = nil,
          @prefix : String? = nil,
          @range : Types::MatchRange? = nil,
          @regex : String? = nil,
          @suffix : String? = nil
        )
        end
      end

      # An object that represents types of timeouts.

      struct GrpcTimeout
        include JSON::Serializable

        # An object that represents an idle timeout. An idle timeout bounds the amount of time that a
        # connection may be idle. The default value is none.

        @[JSON::Field(key: "idle")]
        getter idle : Types::Duration?

        # An object that represents a per request timeout. The default value is 15 seconds. If you set a
        # higher timeout, then make sure that the higher value is set for each App Mesh resource in a
        # conversation. For example, if a virtual node backend uses a virtual router provider to route to
        # another virtual node, then the timeout should be greater than 15 seconds for the source and
        # destination virtual node and the route.

        @[JSON::Field(key: "perRequest")]
        getter per_request : Types::Duration?

        def initialize(
          @idle : Types::Duration? = nil,
          @per_request : Types::Duration? = nil
        )
        end
      end

      # An object that represents the method and value to match with the header value sent in a request.
      # Specify one match method.

      struct HeaderMatchMethod
        include JSON::Serializable

        # The value sent by the client must match the specified value exactly.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        # The value sent by the client must begin with the specified characters.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # An object that represents the range of values to match on.

        @[JSON::Field(key: "range")]
        getter range : Types::MatchRange?

        # The value sent by the client must include the specified characters.

        @[JSON::Field(key: "regex")]
        getter regex : String?

        # The value sent by the client must end with the specified characters.

        @[JSON::Field(key: "suffix")]
        getter suffix : String?

        def initialize(
          @exact : String? = nil,
          @prefix : String? = nil,
          @range : Types::MatchRange? = nil,
          @regex : String? = nil,
          @suffix : String? = nil
        )
        end
      end

      # An object that represents the health check policy for a virtual node's listener.

      struct HealthCheckPolicy
        include JSON::Serializable

        # The number of consecutive successful health checks that must occur before declaring listener
        # healthy.

        @[JSON::Field(key: "healthyThreshold")]
        getter healthy_threshold : Int32

        # The time period in milliseconds between each health check execution.

        @[JSON::Field(key: "intervalMillis")]
        getter interval_millis : Int64

        # The protocol for the health check request. If you specify grpc , then your service must conform to
        # the GRPC Health Checking Protocol .

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The amount of time to wait when receiving a response from the health check, in milliseconds.

        @[JSON::Field(key: "timeoutMillis")]
        getter timeout_millis : Int64

        # The number of consecutive failed health checks that must occur before declaring a virtual node
        # unhealthy.

        @[JSON::Field(key: "unhealthyThreshold")]
        getter unhealthy_threshold : Int32

        # The destination path for the health check request. This value is only used if the specified protocol
        # is HTTP or HTTP/2. For any other protocol, this value is ignored.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The destination port for the health check request. This port must match the port defined in the
        # PortMapping for the listener.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @healthy_threshold : Int32,
          @interval_millis : Int64,
          @protocol : String,
          @timeout_millis : Int64,
          @unhealthy_threshold : Int32,
          @path : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # An object that represents an HTTP gateway route.

      struct HttpGatewayRoute
        include JSON::Serializable

        # An object that represents the action to take if a match is determined.

        @[JSON::Field(key: "action")]
        getter action : Types::HttpGatewayRouteAction

        # An object that represents the criteria for determining a request match.

        @[JSON::Field(key: "match")]
        getter match : Types::HttpGatewayRouteMatch

        def initialize(
          @action : Types::HttpGatewayRouteAction,
          @match : Types::HttpGatewayRouteMatch
        )
        end
      end

      # An object that represents the action to take if a match is determined.

      struct HttpGatewayRouteAction
        include JSON::Serializable

        # An object that represents the target that traffic is routed to when a request matches the gateway
        # route.

        @[JSON::Field(key: "target")]
        getter target : Types::GatewayRouteTarget

        # The gateway route action to rewrite.

        @[JSON::Field(key: "rewrite")]
        getter rewrite : Types::HttpGatewayRouteRewrite?

        def initialize(
          @target : Types::GatewayRouteTarget,
          @rewrite : Types::HttpGatewayRouteRewrite? = nil
        )
        end
      end

      # An object that represents the HTTP header in the gateway route.

      struct HttpGatewayRouteHeader
        include JSON::Serializable

        # A name for the HTTP header in the gateway route that will be matched on.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify True to match anything except the match criteria. The default value is False .

        @[JSON::Field(key: "invert")]
        getter invert : Bool?

        # An object that represents the method and value to match with the header value sent in a request.
        # Specify one match method.

        @[JSON::Field(key: "match")]
        getter match : Types::HeaderMatchMethod?

        def initialize(
          @name : String,
          @invert : Bool? = nil,
          @match : Types::HeaderMatchMethod? = nil
        )
        end
      end

      # An object that represents the criteria for determining a request match.

      struct HttpGatewayRouteMatch
        include JSON::Serializable

        # The client request headers to match on.

        @[JSON::Field(key: "headers")]
        getter headers : Array(Types::HttpGatewayRouteHeader)?

        # The host name to match on.

        @[JSON::Field(key: "hostname")]
        getter hostname : Types::GatewayRouteHostnameMatch?

        # The method to match on.

        @[JSON::Field(key: "method")]
        getter method : String?

        # The path to match on.

        @[JSON::Field(key: "path")]
        getter path : Types::HttpPathMatch?

        # The port number to match on.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Specifies the path to match requests with. This parameter must always start with / , which by itself
        # matches all requests to the virtual service name. You can also match for path-based routing of
        # requests. For example, if your virtual service name is my-service.local and you want the route to
        # match requests to my-service.local/metrics , your prefix should be /metrics .

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # The query parameter to match on.

        @[JSON::Field(key: "queryParameters")]
        getter query_parameters : Array(Types::HttpQueryParameter)?

        def initialize(
          @headers : Array(Types::HttpGatewayRouteHeader)? = nil,
          @hostname : Types::GatewayRouteHostnameMatch? = nil,
          @method : String? = nil,
          @path : Types::HttpPathMatch? = nil,
          @port : Int32? = nil,
          @prefix : String? = nil,
          @query_parameters : Array(Types::HttpQueryParameter)? = nil
        )
        end
      end

      # An object that represents the path to rewrite.

      struct HttpGatewayRoutePathRewrite
        include JSON::Serializable

        # The exact path to rewrite.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        def initialize(
          @exact : String? = nil
        )
        end
      end

      # An object representing the beginning characters of the route to rewrite.

      struct HttpGatewayRoutePrefixRewrite
        include JSON::Serializable

        # The default prefix used to replace the incoming route prefix when rewritten.

        @[JSON::Field(key: "defaultPrefix")]
        getter default_prefix : String?

        # The value used to replace the incoming route prefix when rewritten.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @default_prefix : String? = nil,
          @value : String? = nil
        )
        end
      end

      # An object representing the gateway route to rewrite.

      struct HttpGatewayRouteRewrite
        include JSON::Serializable

        # The host name to rewrite.

        @[JSON::Field(key: "hostname")]
        getter hostname : Types::GatewayRouteHostnameRewrite?

        # The path to rewrite.

        @[JSON::Field(key: "path")]
        getter path : Types::HttpGatewayRoutePathRewrite?

        # The specified beginning characters to rewrite.

        @[JSON::Field(key: "prefix")]
        getter prefix : Types::HttpGatewayRoutePrefixRewrite?

        def initialize(
          @hostname : Types::GatewayRouteHostnameRewrite? = nil,
          @path : Types::HttpGatewayRoutePathRewrite? = nil,
          @prefix : Types::HttpGatewayRoutePrefixRewrite? = nil
        )
        end
      end

      # An object representing the path to match in the request.

      struct HttpPathMatch
        include JSON::Serializable

        # The exact path to match on.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        # The regex used to match the path.

        @[JSON::Field(key: "regex")]
        getter regex : String?

        def initialize(
          @exact : String? = nil,
          @regex : String? = nil
        )
        end
      end

      # An object that represents the query parameter in the request.

      struct HttpQueryParameter
        include JSON::Serializable

        # A name for the query parameter that will be matched on.

        @[JSON::Field(key: "name")]
        getter name : String

        # The query parameter to match on.

        @[JSON::Field(key: "match")]
        getter match : Types::QueryParameterMatch?

        def initialize(
          @name : String,
          @match : Types::QueryParameterMatch? = nil
        )
        end
      end

      # An object that represents a retry policy. Specify at least one value for at least one of the types
      # of RetryEvents , a value for maxRetries , and a value for perRetryTimeout . Both server-error and
      # gateway-error under httpRetryEvents include the Envoy reset policy. For more information on the
      # reset policy, see the Envoy documentation .

      struct HttpRetryPolicy
        include JSON::Serializable

        # The maximum number of retry attempts.

        @[JSON::Field(key: "maxRetries")]
        getter max_retries : Int64

        # The timeout for each retry attempt.

        @[JSON::Field(key: "perRetryTimeout")]
        getter per_retry_timeout : Types::Duration

        # Specify at least one of the following values. server-error – HTTP status codes 500, 501, 502, 503,
        # 504, 505, 506, 507, 508, 510, and 511 gateway-error – HTTP status codes 502, 503, and 504
        # client-error – HTTP status code 409 stream-error – Retry on refused stream

        @[JSON::Field(key: "httpRetryEvents")]
        getter http_retry_events : Array(String)?

        # Specify a valid value. The event occurs before any processing of a request has started and is
        # encountered when the upstream is temporarily or permanently unavailable.

        @[JSON::Field(key: "tcpRetryEvents")]
        getter tcp_retry_events : Array(String)?

        def initialize(
          @max_retries : Int64,
          @per_retry_timeout : Types::Duration,
          @http_retry_events : Array(String)? = nil,
          @tcp_retry_events : Array(String)? = nil
        )
        end
      end

      # An object that represents an HTTP or HTTP/2 route type.

      struct HttpRoute
        include JSON::Serializable

        # An object that represents the action to take if a match is determined.

        @[JSON::Field(key: "action")]
        getter action : Types::HttpRouteAction

        # An object that represents the criteria for determining a request match.

        @[JSON::Field(key: "match")]
        getter match : Types::HttpRouteMatch

        # An object that represents a retry policy.

        @[JSON::Field(key: "retryPolicy")]
        getter retry_policy : Types::HttpRetryPolicy?

        # An object that represents types of timeouts.

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::HttpTimeout?

        def initialize(
          @action : Types::HttpRouteAction,
          @match : Types::HttpRouteMatch,
          @retry_policy : Types::HttpRetryPolicy? = nil,
          @timeout : Types::HttpTimeout? = nil
        )
        end
      end

      # An object that represents the action to take if a match is determined.

      struct HttpRouteAction
        include JSON::Serializable

        # An object that represents the targets that traffic is routed to when a request matches the route.

        @[JSON::Field(key: "weightedTargets")]
        getter weighted_targets : Array(Types::WeightedTarget)

        def initialize(
          @weighted_targets : Array(Types::WeightedTarget)
        )
        end
      end

      # An object that represents the HTTP header in the request.

      struct HttpRouteHeader
        include JSON::Serializable

        # A name for the HTTP header in the client request that will be matched on.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specify True to match anything except the match criteria. The default value is False .

        @[JSON::Field(key: "invert")]
        getter invert : Bool?

        # The HeaderMatchMethod object.

        @[JSON::Field(key: "match")]
        getter match : Types::HeaderMatchMethod?

        def initialize(
          @name : String,
          @invert : Bool? = nil,
          @match : Types::HeaderMatchMethod? = nil
        )
        end
      end

      # An object that represents the requirements for a route to match HTTP requests for a virtual router.

      struct HttpRouteMatch
        include JSON::Serializable

        # The client request headers to match on.

        @[JSON::Field(key: "headers")]
        getter headers : Array(Types::HttpRouteHeader)?

        # The client request method to match on. Specify only one.

        @[JSON::Field(key: "method")]
        getter method : String?

        # The client request path to match on.

        @[JSON::Field(key: "path")]
        getter path : Types::HttpPathMatch?

        # The port number to match on.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        # Specifies the path to match requests with. This parameter must always start with / , which by itself
        # matches all requests to the virtual service name. You can also match for path-based routing of
        # requests. For example, if your virtual service name is my-service.local and you want the route to
        # match requests to my-service.local/metrics , your prefix should be /metrics .

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        # The client request query parameters to match on.

        @[JSON::Field(key: "queryParameters")]
        getter query_parameters : Array(Types::HttpQueryParameter)?

        # The client request scheme to match on. Specify only one. Applicable only for HTTP2 routes.

        @[JSON::Field(key: "scheme")]
        getter scheme : String?

        def initialize(
          @headers : Array(Types::HttpRouteHeader)? = nil,
          @method : String? = nil,
          @path : Types::HttpPathMatch? = nil,
          @port : Int32? = nil,
          @prefix : String? = nil,
          @query_parameters : Array(Types::HttpQueryParameter)? = nil,
          @scheme : String? = nil
        )
        end
      end

      # An object that represents types of timeouts.

      struct HttpTimeout
        include JSON::Serializable

        # An object that represents an idle timeout. An idle timeout bounds the amount of time that a
        # connection may be idle. The default value is none.

        @[JSON::Field(key: "idle")]
        getter idle : Types::Duration?

        # An object that represents a per request timeout. The default value is 15 seconds. If you set a
        # higher timeout, then make sure that the higher value is set for each App Mesh resource in a
        # conversation. For example, if a virtual node backend uses a virtual router provider to route to
        # another virtual node, then the timeout should be greater than 15 seconds for the source and
        # destination virtual node and the route.

        @[JSON::Field(key: "perRequest")]
        getter per_request : Types::Duration?

        def initialize(
          @idle : Types::Duration? = nil,
          @per_request : Types::Duration? = nil
        )
        end
      end

      # The request processing has failed because of an unknown error, exception, or failure.

      struct InternalServerErrorException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents the key value pairs for the JSON.

      struct JsonFormatRef
        include JSON::Serializable

        # The specified key for the JSON.

        @[JSON::Field(key: "key")]
        getter key : String

        # The specified value for the JSON.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      # You have exceeded a service limit for your account. For more information, see Service Limits in the
      # App Mesh User Guide .

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListGatewayRoutesInput
        include JSON::Serializable

        # The name of the service mesh to list gateway routes in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual gateway to list gateway routes in.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # The maximum number of results returned by ListGatewayRoutes in paginated output. When you use this
        # parameter, ListGatewayRoutes returns only limit results in a single page along with a nextToken
        # response element. You can see the remaining results of the initial request by sending another
        # ListGatewayRoutes request with the returned nextToken value. This value can be between 1 and 100. If
        # you don't use this parameter, ListGatewayRoutes returns up to 100 results and a nextToken value if
        # applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # The nextToken value returned from a previous paginated ListGatewayRoutes request where limit was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mesh_name : String,
          @virtual_gateway_name : String,
          @limit : Int32? = nil,
          @mesh_owner : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGatewayRoutesOutput
        include JSON::Serializable

        # The list of existing gateway routes for the specified service mesh and virtual gateway.

        @[JSON::Field(key: "gatewayRoutes")]
        getter gateway_routes : Array(Types::GatewayRouteRef)

        # The nextToken value to include in a future ListGatewayRoutes request. When the results of a
        # ListGatewayRoutes request exceed limit , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateway_routes : Array(Types::GatewayRouteRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListMeshesInput
        include JSON::Serializable

        # The maximum number of results returned by ListMeshes in paginated output. When you use this
        # parameter, ListMeshes returns only limit results in a single page along with a nextToken response
        # element. You can see the remaining results of the initial request by sending another ListMeshes
        # request with the returned nextToken value. This value can be between 1 and 100. If you don't use
        # this parameter, ListMeshes returns up to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The nextToken value returned from a previous paginated ListMeshes request where limit was used and
        # the results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value. This token should be treated as an opaque identifier that
        # is used only to retrieve the next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMeshesOutput
        include JSON::Serializable

        # The list of existing service meshes.

        @[JSON::Field(key: "meshes")]
        getter meshes : Array(Types::MeshRef)

        # The nextToken value to include in a future ListMeshes request. When the results of a ListMeshes
        # request exceed limit , you can use this value to retrieve the next page of results. This value is
        # null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @meshes : Array(Types::MeshRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutesInput
        include JSON::Serializable

        # The name of the service mesh to list routes in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the virtual router to list routes in.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # The maximum number of results returned by ListRoutes in paginated output. When you use this
        # parameter, ListRoutes returns only limit results in a single page along with a nextToken response
        # element. You can see the remaining results of the initial request by sending another ListRoutes
        # request with the returned nextToken value. This value can be between 1 and 100. If you don't use
        # this parameter, ListRoutes returns up to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # The nextToken value returned from a previous paginated ListRoutes request where limit was used and
        # the results exceeded the value of that parameter. Pagination continues from the end of the previous
        # results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mesh_name : String,
          @virtual_router_name : String,
          @limit : Int32? = nil,
          @mesh_owner : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutesOutput
        include JSON::Serializable

        # The list of existing routes for the specified service mesh and virtual router.

        @[JSON::Field(key: "routes")]
        getter routes : Array(Types::RouteRef)

        # The nextToken value to include in a future ListRoutes request. When the results of a ListRoutes
        # request exceed limit , you can use this value to retrieve the next page of results. This value is
        # null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @routes : Array(Types::RouteRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of tag results returned by ListTagsForResource in paginated output. When this
        # parameter is used, ListTagsForResource returns only limit results in a single page along with a
        # nextToken response element. You can see the remaining results of the initial request by sending
        # another ListTagsForResource request with the returned nextToken value. This value can be between 1
        # and 100. If you don't use this parameter, ListTagsForResource returns up to 100 results and a
        # nextToken value if applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The nextToken value returned from a previous paginated ListTagsForResource request where limit was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @limit : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)

        # The nextToken value to include in a future ListTagsForResource request. When the results of a
        # ListTagsForResource request exceed limit , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @tags : Array(Types::TagRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualGatewaysInput
        include JSON::Serializable

        # The name of the service mesh to list virtual gateways in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The maximum number of results returned by ListVirtualGateways in paginated output. When you use this
        # parameter, ListVirtualGateways returns only limit results in a single page along with a nextToken
        # response element. You can see the remaining results of the initial request by sending another
        # ListVirtualGateways request with the returned nextToken value. This value can be between 1 and 100.
        # If you don't use this parameter, ListVirtualGateways returns up to 100 results and a nextToken value
        # if applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # The nextToken value returned from a previous paginated ListVirtualGateways request where limit was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mesh_name : String,
          @limit : Int32? = nil,
          @mesh_owner : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualGatewaysOutput
        include JSON::Serializable

        # The list of existing virtual gateways for the specified service mesh.

        @[JSON::Field(key: "virtualGateways")]
        getter virtual_gateways : Array(Types::VirtualGatewayRef)

        # The nextToken value to include in a future ListVirtualGateways request. When the results of a
        # ListVirtualGateways request exceed limit , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @virtual_gateways : Array(Types::VirtualGatewayRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualNodesInput
        include JSON::Serializable

        # The name of the service mesh to list virtual nodes in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The maximum number of results returned by ListVirtualNodes in paginated output. When you use this
        # parameter, ListVirtualNodes returns only limit results in a single page along with a nextToken
        # response element. You can see the remaining results of the initial request by sending another
        # ListVirtualNodes request with the returned nextToken value. This value can be between 1 and 100. If
        # you don't use this parameter, ListVirtualNodes returns up to 100 results and a nextToken value if
        # applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # The nextToken value returned from a previous paginated ListVirtualNodes request where limit was used
        # and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mesh_name : String,
          @limit : Int32? = nil,
          @mesh_owner : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualNodesOutput
        include JSON::Serializable

        # The list of existing virtual nodes for the specified service mesh.

        @[JSON::Field(key: "virtualNodes")]
        getter virtual_nodes : Array(Types::VirtualNodeRef)

        # The nextToken value to include in a future ListVirtualNodes request. When the results of a
        # ListVirtualNodes request exceed limit , you can use this value to retrieve the next page of results.
        # This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @virtual_nodes : Array(Types::VirtualNodeRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualRoutersInput
        include JSON::Serializable

        # The name of the service mesh to list virtual routers in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The maximum number of results returned by ListVirtualRouters in paginated output. When you use this
        # parameter, ListVirtualRouters returns only limit results in a single page along with a nextToken
        # response element. You can see the remaining results of the initial request by sending another
        # ListVirtualRouters request with the returned nextToken value. This value can be between 1 and 100.
        # If you don't use this parameter, ListVirtualRouters returns up to 100 results and a nextToken value
        # if applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # The nextToken value returned from a previous paginated ListVirtualRouters request where limit was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mesh_name : String,
          @limit : Int32? = nil,
          @mesh_owner : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualRoutersOutput
        include JSON::Serializable

        # The list of existing virtual routers for the specified service mesh.

        @[JSON::Field(key: "virtualRouters")]
        getter virtual_routers : Array(Types::VirtualRouterRef)

        # The nextToken value to include in a future ListVirtualRouters request. When the results of a
        # ListVirtualRouters request exceed limit , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @virtual_routers : Array(Types::VirtualRouterRef),
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualServicesInput
        include JSON::Serializable

        # The name of the service mesh to list virtual services in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The maximum number of results returned by ListVirtualServices in paginated output. When you use this
        # parameter, ListVirtualServices returns only limit results in a single page along with a nextToken
        # response element. You can see the remaining results of the initial request by sending another
        # ListVirtualServices request with the returned nextToken value. This value can be between 1 and 100.
        # If you don't use this parameter, ListVirtualServices returns up to 100 results and a nextToken value
        # if applicable.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        # The nextToken value returned from a previous paginated ListVirtualServices request where limit was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @mesh_name : String,
          @limit : Int32? = nil,
          @mesh_owner : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListVirtualServicesOutput
        include JSON::Serializable

        # The list of existing virtual services for the specified service mesh.

        @[JSON::Field(key: "virtualServices")]
        getter virtual_services : Array(Types::VirtualServiceRef)

        # The nextToken value to include in a future ListVirtualServices request. When the results of a
        # ListVirtualServices request exceed limit , you can use this value to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @virtual_services : Array(Types::VirtualServiceRef),
          @next_token : String? = nil
        )
        end
      end

      # An object that represents a listener for a virtual node.

      struct Listener
        include JSON::Serializable

        # The port mapping information for the listener.

        @[JSON::Field(key: "portMapping")]
        getter port_mapping : Types::PortMapping

        # The connection pool information for the listener.

        @[JSON::Field(key: "connectionPool")]
        getter connection_pool : Types::VirtualNodeConnectionPool?

        # The health check information for the listener.

        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::HealthCheckPolicy?

        # The outlier detection information for the listener.

        @[JSON::Field(key: "outlierDetection")]
        getter outlier_detection : Types::OutlierDetection?

        # An object that represents timeouts for different protocols.

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::ListenerTimeout?

        # A reference to an object that represents the Transport Layer Security (TLS) properties for a
        # listener.

        @[JSON::Field(key: "tls")]
        getter tls : Types::ListenerTls?

        def initialize(
          @port_mapping : Types::PortMapping,
          @connection_pool : Types::VirtualNodeConnectionPool? = nil,
          @health_check : Types::HealthCheckPolicy? = nil,
          @outlier_detection : Types::OutlierDetection? = nil,
          @timeout : Types::ListenerTimeout? = nil,
          @tls : Types::ListenerTls? = nil
        )
        end
      end

      # An object that represents timeouts for different protocols.

      struct ListenerTimeout
        include JSON::Serializable

        # An object that represents types of timeouts.

        @[JSON::Field(key: "grpc")]
        getter grpc : Types::GrpcTimeout?

        # An object that represents types of timeouts.

        @[JSON::Field(key: "http")]
        getter http : Types::HttpTimeout?

        # An object that represents types of timeouts.

        @[JSON::Field(key: "http2")]
        getter http2 : Types::HttpTimeout?

        # An object that represents types of timeouts.

        @[JSON::Field(key: "tcp")]
        getter tcp : Types::TcpTimeout?

        def initialize(
          @grpc : Types::GrpcTimeout? = nil,
          @http : Types::HttpTimeout? = nil,
          @http2 : Types::HttpTimeout? = nil,
          @tcp : Types::TcpTimeout? = nil
        )
        end
      end

      # An object that represents the Transport Layer Security (TLS) properties for a listener.

      struct ListenerTls
        include JSON::Serializable

        # A reference to an object that represents a listener's Transport Layer Security (TLS) certificate.

        @[JSON::Field(key: "certificate")]
        getter certificate : Types::ListenerTlsCertificate

        # Specify one of the following modes. STRICT – Listener only accepts connections with TLS enabled.
        # PERMISSIVE – Listener accepts connections with or without TLS enabled. DISABLED – Listener only
        # accepts connections without TLS.

        @[JSON::Field(key: "mode")]
        getter mode : String

        # A reference to an object that represents a listener's Transport Layer Security (TLS) validation
        # context.

        @[JSON::Field(key: "validation")]
        getter validation : Types::ListenerTlsValidationContext?

        def initialize(
          @certificate : Types::ListenerTlsCertificate,
          @mode : String,
          @validation : Types::ListenerTlsValidationContext? = nil
        )
        end
      end

      # An object that represents an Certificate Manager certificate.

      struct ListenerTlsAcmCertificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the certificate. The certificate must meet specific requirements
        # and you must have proxy authorization enabled. For more information, see Transport Layer Security
        # (TLS) .

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      # An object that represents a listener's Transport Layer Security (TLS) certificate.

      struct ListenerTlsCertificate
        include JSON::Serializable

        # A reference to an object that represents an Certificate Manager certificate.

        @[JSON::Field(key: "acm")]
        getter acm : Types::ListenerTlsAcmCertificate?

        # A reference to an object that represents a local file certificate.

        @[JSON::Field(key: "file")]
        getter file : Types::ListenerTlsFileCertificate?

        # A reference to an object that represents a listener's Secret Discovery Service certificate.

        @[JSON::Field(key: "sds")]
        getter sds : Types::ListenerTlsSdsCertificate?

        def initialize(
          @acm : Types::ListenerTlsAcmCertificate? = nil,
          @file : Types::ListenerTlsFileCertificate? = nil,
          @sds : Types::ListenerTlsSdsCertificate? = nil
        )
        end
      end

      # An object that represents a local file certificate. The certificate must meet specific requirements
      # and you must have proxy authorization enabled. For more information, see Transport Layer Security
      # (TLS) .

      struct ListenerTlsFileCertificate
        include JSON::Serializable

        # The certificate chain for the certificate.

        @[JSON::Field(key: "certificateChain")]
        getter certificate_chain : String

        # The private key for a certificate stored on the file system of the virtual node that the proxy is
        # running on.

        @[JSON::Field(key: "privateKey")]
        getter private_key : String

        def initialize(
          @certificate_chain : String,
          @private_key : String
        )
        end
      end

      # An object that represents the listener's Secret Discovery Service certificate. The proxy must be
      # configured with a local SDS provider via a Unix Domain Socket. See App Mesh TLS documentation for
      # more info.

      struct ListenerTlsSdsCertificate
        include JSON::Serializable

        # A reference to an object that represents the name of the secret requested from the Secret Discovery
        # Service provider representing Transport Layer Security (TLS) materials like a certificate or
        # certificate chain.

        @[JSON::Field(key: "secretName")]
        getter secret_name : String

        def initialize(
          @secret_name : String
        )
        end
      end

      # An object that represents a listener's Transport Layer Security (TLS) validation context.

      struct ListenerTlsValidationContext
        include JSON::Serializable

        # A reference to where to retrieve the trust chain when validating a peer’s Transport Layer Security
        # (TLS) certificate.

        @[JSON::Field(key: "trust")]
        getter trust : Types::ListenerTlsValidationContextTrust

        # A reference to an object that represents the SANs for a listener's Transport Layer Security (TLS)
        # validation context.

        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Types::SubjectAlternativeNames?

        def initialize(
          @trust : Types::ListenerTlsValidationContextTrust,
          @subject_alternative_names : Types::SubjectAlternativeNames? = nil
        )
        end
      end

      # An object that represents a listener's Transport Layer Security (TLS) validation context trust.

      struct ListenerTlsValidationContextTrust
        include JSON::Serializable

        # An object that represents a Transport Layer Security (TLS) validation context trust for a local
        # file.

        @[JSON::Field(key: "file")]
        getter file : Types::TlsValidationContextFileTrust?

        # A reference to an object that represents a listener's Transport Layer Security (TLS) Secret
        # Discovery Service validation context trust.

        @[JSON::Field(key: "sds")]
        getter sds : Types::TlsValidationContextSdsTrust?

        def initialize(
          @file : Types::TlsValidationContextFileTrust? = nil,
          @sds : Types::TlsValidationContextSdsTrust? = nil
        )
        end
      end

      # An object that represents the logging information for a virtual node.

      struct Logging
        include JSON::Serializable

        # The access log configuration for a virtual node.

        @[JSON::Field(key: "accessLog")]
        getter access_log : Types::AccessLog?

        def initialize(
          @access_log : Types::AccessLog? = nil
        )
        end
      end

      # An object that represents the format for the logs.

      struct LoggingFormat
        include JSON::Serializable


        @[JSON::Field(key: "json")]
        getter json : Array(Types::JsonFormatRef)?


        @[JSON::Field(key: "text")]
        getter text : String?

        def initialize(
          @json : Array(Types::JsonFormatRef)? = nil,
          @text : String? = nil
        )
        end
      end

      # An object that represents the range of values to match on. The first character of the range is
      # included in the range, though the last character is not. For example, if the range specified were
      # 1-100, only values 1-99 would be matched.

      struct MatchRange
        include JSON::Serializable

        # The end of the range.

        @[JSON::Field(key: "end")]
        getter end : Int64

        # The start of the range.

        @[JSON::Field(key: "start")]
        getter start : Int64

        def initialize(
          @end : Int64,
          @start : Int64
        )
        end
      end

      # An object that represents a service mesh returned by a describe operation.

      struct MeshData
        include JSON::Serializable

        # The name of the service mesh.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The associated metadata for the service mesh.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The associated specification for the service mesh.

        @[JSON::Field(key: "spec")]
        getter spec : Types::MeshSpec

        # The status of the service mesh.

        @[JSON::Field(key: "status")]
        getter status : Types::MeshStatus

        def initialize(
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @spec : Types::MeshSpec,
          @status : Types::MeshStatus
        )
        end
      end

      # An object that represents a service mesh returned by a list operation.

      struct MeshRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) of the service mesh.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @version : Int64
        )
        end
      end

      # An object that represents the service discovery information for a service mesh.

      struct MeshServiceDiscovery
        include JSON::Serializable

        # The IP version to use to control traffic within the mesh.

        @[JSON::Field(key: "ipPreference")]
        getter ip_preference : String?

        def initialize(
          @ip_preference : String? = nil
        )
        end
      end

      # An object that represents the specification of a service mesh.

      struct MeshSpec
        include JSON::Serializable

        # The egress filter rules for the service mesh.

        @[JSON::Field(key: "egressFilter")]
        getter egress_filter : Types::EgressFilter?


        @[JSON::Field(key: "serviceDiscovery")]
        getter service_discovery : Types::MeshServiceDiscovery?

        def initialize(
          @egress_filter : Types::EgressFilter? = nil,
          @service_discovery : Types::MeshServiceDiscovery? = nil
        )
        end
      end

      # An object that represents the status of a service mesh.

      struct MeshStatus
        include JSON::Serializable

        # The current mesh status.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # The specified resource doesn't exist. Check your request syntax and try again.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents the outlier detection for a virtual node's listener.

      struct OutlierDetection
        include JSON::Serializable

        # The base amount of time for which a host is ejected.

        @[JSON::Field(key: "baseEjectionDuration")]
        getter base_ejection_duration : Types::Duration

        # The time interval between ejection sweep analysis.

        @[JSON::Field(key: "interval")]
        getter interval : Types::Duration

        # Maximum percentage of hosts in load balancing pool for upstream service that can be ejected. Will
        # eject at least one host regardless of the value.

        @[JSON::Field(key: "maxEjectionPercent")]
        getter max_ejection_percent : Int32

        # Number of consecutive 5xx errors required for ejection.

        @[JSON::Field(key: "maxServerErrors")]
        getter max_server_errors : Int64

        def initialize(
          @base_ejection_duration : Types::Duration,
          @interval : Types::Duration,
          @max_ejection_percent : Int32,
          @max_server_errors : Int64
        )
        end
      end

      # An object that represents a port mapping.

      struct PortMapping
        include JSON::Serializable

        # The port used for the port mapping.

        @[JSON::Field(key: "port")]
        getter port : Int32

        # The protocol used for the port mapping. Specify one protocol.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        def initialize(
          @port : Int32,
          @protocol : String
        )
        end
      end

      # An object representing the query parameter to match.

      struct QueryParameterMatch
        include JSON::Serializable

        # The exact query parameter to match on.

        @[JSON::Field(key: "exact")]
        getter exact : String?

        def initialize(
          @exact : String? = nil
        )
        end
      end

      # You can't delete the specified resource because it's in use or required by another resource.

      struct ResourceInUseException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents metadata for a resource.

      struct ResourceMetadata
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The unique identifier for the resource.

        @[JSON::Field(key: "uid")]
        getter uid : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_owner : String,
          @resource_owner : String,
          @uid : String,
          @version : Int64
        )
        end
      end

      # An object that represents a route returned by a describe operation.

      struct RouteData
        include JSON::Serializable

        # The name of the service mesh that the route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The associated metadata for the route.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The name of the route.

        @[JSON::Field(key: "routeName")]
        getter route_name : String

        # The specifications of the route.

        @[JSON::Field(key: "spec")]
        getter spec : Types::RouteSpec

        # The status of the route.

        @[JSON::Field(key: "status")]
        getter status : Types::RouteStatus

        # The virtual router that the route is associated with.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        def initialize(
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @route_name : String,
          @spec : Types::RouteSpec,
          @status : Types::RouteStatus,
          @virtual_router_name : String
        )
        end
      end

      # An object that represents a route returned by a list operation.

      struct RouteRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the route.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh that the route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The name of the route.

        @[JSON::Field(key: "routeName")]
        getter route_name : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        # The virtual router that the route is associated with.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @route_name : String,
          @version : Int64,
          @virtual_router_name : String
        )
        end
      end

      # An object that represents a route specification. Specify one route type.

      struct RouteSpec
        include JSON::Serializable

        # An object that represents the specification of a gRPC route.

        @[JSON::Field(key: "grpcRoute")]
        getter grpc_route : Types::GrpcRoute?

        # An object that represents the specification of an HTTP/2 route.

        @[JSON::Field(key: "http2Route")]
        getter http2_route : Types::HttpRoute?

        # An object that represents the specification of an HTTP route.

        @[JSON::Field(key: "httpRoute")]
        getter http_route : Types::HttpRoute?

        # The priority for the route. Routes are matched based on the specified value, where 0 is the highest
        # priority.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # An object that represents the specification of a TCP route.

        @[JSON::Field(key: "tcpRoute")]
        getter tcp_route : Types::TcpRoute?

        def initialize(
          @grpc_route : Types::GrpcRoute? = nil,
          @http2_route : Types::HttpRoute? = nil,
          @http_route : Types::HttpRoute? = nil,
          @priority : Int32? = nil,
          @tcp_route : Types::TcpRoute? = nil
        )
        end
      end

      # An object that represents the current status of a route.

      struct RouteStatus
        include JSON::Serializable

        # The current status for the route.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # An object that represents the service discovery information for a virtual node.

      struct ServiceDiscovery
        include JSON::Serializable

        # Specifies any Cloud Map information for the virtual node.

        @[JSON::Field(key: "awsCloudMap")]
        getter aws_cloud_map : Types::AwsCloudMapServiceDiscovery?

        # Specifies the DNS information for the virtual node.

        @[JSON::Field(key: "dns")]
        getter dns : Types::DnsServiceDiscovery?

        def initialize(
          @aws_cloud_map : Types::AwsCloudMapServiceDiscovery? = nil,
          @dns : Types::DnsServiceDiscovery? = nil
        )
        end
      end

      # The request has failed due to a temporary failure of the service.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents the methods by which a subject alternative name on a peer Transport Layer
      # Security (TLS) certificate can be matched.

      struct SubjectAlternativeNameMatchers
        include JSON::Serializable

        # The values sent must match the specified values exactly.

        @[JSON::Field(key: "exact")]
        getter exact : Array(String)

        def initialize(
          @exact : Array(String)
        )
        end
      end

      # An object that represents the subject alternative names secured by the certificate.

      struct SubjectAlternativeNames
        include JSON::Serializable

        # An object that represents the criteria for determining a SANs match.

        @[JSON::Field(key: "match")]
        getter match : Types::SubjectAlternativeNameMatchers

        def initialize(
          @match : Types::SubjectAlternativeNameMatchers
        )
        end
      end

      # Optional metadata that you apply to a resource to assist with categorization and organization. Each
      # tag consists of a key and an optional value, both of which you define. Tag keys can have a maximum
      # character length of 128 characters, and tag values can have a maximum length of 256 characters.

      struct TagRef
        include JSON::Serializable

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.

        @[JSON::Field(key: "key")]
        getter key : String

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to add tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource. A tag is an array of key-value pairs. Tag keys can have a maximum
        # character length of 128 characters, and tag values can have a maximum length of 256 characters.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::TagRef)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::TagRef)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # An object that represents a TCP route type.

      struct TcpRoute
        include JSON::Serializable

        # The action to take if a match is determined.

        @[JSON::Field(key: "action")]
        getter action : Types::TcpRouteAction

        # An object that represents the criteria for determining a request match.

        @[JSON::Field(key: "match")]
        getter match : Types::TcpRouteMatch?

        # An object that represents types of timeouts.

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::TcpTimeout?

        def initialize(
          @action : Types::TcpRouteAction,
          @match : Types::TcpRouteMatch? = nil,
          @timeout : Types::TcpTimeout? = nil
        )
        end
      end

      # An object that represents the action to take if a match is determined.

      struct TcpRouteAction
        include JSON::Serializable

        # An object that represents the targets that traffic is routed to when a request matches the route.

        @[JSON::Field(key: "weightedTargets")]
        getter weighted_targets : Array(Types::WeightedTarget)

        def initialize(
          @weighted_targets : Array(Types::WeightedTarget)
        )
        end
      end

      # An object representing the TCP route to match.

      struct TcpRouteMatch
        include JSON::Serializable

        # The port number to match on.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @port : Int32? = nil
        )
        end
      end

      # An object that represents types of timeouts.

      struct TcpTimeout
        include JSON::Serializable

        # An object that represents an idle timeout. An idle timeout bounds the amount of time that a
        # connection may be idle. The default value is none.

        @[JSON::Field(key: "idle")]
        getter idle : Types::Duration?

        def initialize(
          @idle : Types::Duration? = nil
        )
        end
      end

      # An object that represents how the proxy will validate its peer during Transport Layer Security (TLS)
      # negotiation.

      struct TlsValidationContext
        include JSON::Serializable

        # A reference to where to retrieve the trust chain when validating a peer’s Transport Layer Security
        # (TLS) certificate.

        @[JSON::Field(key: "trust")]
        getter trust : Types::TlsValidationContextTrust

        # A reference to an object that represents the SANs for a Transport Layer Security (TLS) validation
        # context. If you don't specify SANs on the terminating mesh endpoint, the Envoy proxy for that node
        # doesn't verify the SAN on a peer client certificate. If you don't specify SANs on the originating
        # mesh endpoint, the SAN on the certificate provided by the terminating endpoint must match the mesh
        # endpoint service discovery configuration. Since SPIRE vended certificates have a SPIFFE ID as a
        # name, you must set the SAN since the name doesn't match the service discovery name.

        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Types::SubjectAlternativeNames?

        def initialize(
          @trust : Types::TlsValidationContextTrust,
          @subject_alternative_names : Types::SubjectAlternativeNames? = nil
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context trust for an
      # Certificate Manager certificate.

      struct TlsValidationContextAcmTrust
        include JSON::Serializable

        # One or more ACM Amazon Resource Name (ARN)s.

        @[JSON::Field(key: "certificateAuthorityArns")]
        getter certificate_authority_arns : Array(String)

        def initialize(
          @certificate_authority_arns : Array(String)
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context trust for a local
      # file.

      struct TlsValidationContextFileTrust
        include JSON::Serializable

        # The certificate trust chain for a certificate stored on the file system of the virtual node that the
        # proxy is running on.

        @[JSON::Field(key: "certificateChain")]
        getter certificate_chain : String

        def initialize(
          @certificate_chain : String
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) Secret Discovery Service validation
      # context trust. The proxy must be configured with a local SDS provider via a Unix Domain Socket. See
      # App Mesh TLS documentation for more info.

      struct TlsValidationContextSdsTrust
        include JSON::Serializable

        # A reference to an object that represents the name of the secret for a Transport Layer Security (TLS)
        # Secret Discovery Service validation context trust.

        @[JSON::Field(key: "secretName")]
        getter secret_name : String

        def initialize(
          @secret_name : String
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context trust.

      struct TlsValidationContextTrust
        include JSON::Serializable

        # A reference to an object that represents a Transport Layer Security (TLS) validation context trust
        # for an Certificate Manager certificate.

        @[JSON::Field(key: "acm")]
        getter acm : Types::TlsValidationContextAcmTrust?

        # An object that represents a Transport Layer Security (TLS) validation context trust for a local
        # file.

        @[JSON::Field(key: "file")]
        getter file : Types::TlsValidationContextFileTrust?

        # A reference to an object that represents a Transport Layer Security (TLS) Secret Discovery Service
        # validation context trust.

        @[JSON::Field(key: "sds")]
        getter sds : Types::TlsValidationContextSdsTrust?

        def initialize(
          @acm : Types::TlsValidationContextAcmTrust? = nil,
          @file : Types::TlsValidationContextFileTrust? = nil,
          @sds : Types::TlsValidationContextSdsTrust? = nil
        )
        end
      end

      # The maximum request rate permitted by the App Mesh APIs has been exceeded for your account. For best
      # results, use an increasing or variable sleep interval between requests.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request exceeds the maximum allowed number of tags allowed per resource. The current limit is 50
      # user tags per resource. You must reduce the number of tags in the request. None of the tags in this
      # request were applied.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to delete tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateGatewayRouteInput
        include JSON::Serializable

        # The name of the gateway route to update.

        @[JSON::Field(key: "gatewayRouteName")]
        getter gateway_route_name : String

        # The name of the service mesh that the gateway route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The new gateway route specification to apply. This overwrites the existing data.

        @[JSON::Field(key: "spec")]
        getter spec : Types::GatewayRouteSpec

        # The name of the virtual gateway that the gateway route is associated with.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @gateway_route_name : String,
          @mesh_name : String,
          @spec : Types::GatewayRouteSpec,
          @virtual_gateway_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil
        )
        end
      end


      struct UpdateGatewayRouteOutput
        include JSON::Serializable

        # A full description of the gateway route that was updated.

        @[JSON::Field(key: "gatewayRoute")]
        getter gateway_route : Types::GatewayRouteData

        def initialize(
          @gateway_route : Types::GatewayRouteData
        )
        end
      end


      struct UpdateMeshInput
        include JSON::Serializable

        # The name of the service mesh to update.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The service mesh specification to apply.

        @[JSON::Field(key: "spec")]
        getter spec : Types::MeshSpec?

        def initialize(
          @mesh_name : String,
          @client_token : String? = nil,
          @spec : Types::MeshSpec? = nil
        )
        end
      end


      struct UpdateMeshOutput
        include JSON::Serializable


        @[JSON::Field(key: "mesh")]
        getter mesh : Types::MeshData

        def initialize(
          @mesh : Types::MeshData
        )
        end
      end


      struct UpdateRouteInput
        include JSON::Serializable

        # The name of the service mesh that the route resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The name of the route to update.

        @[JSON::Field(key: "routeName")]
        getter route_name : String

        # The new route specification to apply. This overwrites the existing data.

        @[JSON::Field(key: "spec")]
        getter spec : Types::RouteSpec

        # The name of the virtual router that the route is associated with.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @route_name : String,
          @spec : Types::RouteSpec,
          @virtual_router_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil
        )
        end
      end


      struct UpdateRouteOutput
        include JSON::Serializable

        # A full description of the route that was updated.

        @[JSON::Field(key: "route")]
        getter route : Types::RouteData

        def initialize(
          @route : Types::RouteData
        )
        end
      end


      struct UpdateVirtualGatewayInput
        include JSON::Serializable

        # The name of the service mesh that the virtual gateway resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The new virtual gateway specification to apply. This overwrites the existing data.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualGatewaySpec

        # The name of the virtual gateway to update.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualGatewaySpec,
          @virtual_gateway_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil
        )
        end
      end


      struct UpdateVirtualGatewayOutput
        include JSON::Serializable

        # A full description of the virtual gateway that was updated.

        @[JSON::Field(key: "virtualGateway")]
        getter virtual_gateway : Types::VirtualGatewayData

        def initialize(
          @virtual_gateway : Types::VirtualGatewayData
        )
        end
      end


      struct UpdateVirtualNodeInput
        include JSON::Serializable

        # The name of the service mesh that the virtual node resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The new virtual node specification to apply. This overwrites the existing data.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualNodeSpec

        # The name of the virtual node to update.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualNodeSpec,
          @virtual_node_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil
        )
        end
      end


      struct UpdateVirtualNodeOutput
        include JSON::Serializable

        # A full description of the virtual node that was updated.

        @[JSON::Field(key: "virtualNode")]
        getter virtual_node : Types::VirtualNodeData

        def initialize(
          @virtual_node : Types::VirtualNodeData
        )
        end
      end


      struct UpdateVirtualRouterInput
        include JSON::Serializable

        # The name of the service mesh that the virtual router resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The new virtual router specification to apply. This overwrites the existing data.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualRouterSpec

        # The name of the virtual router to update.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualRouterSpec,
          @virtual_router_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil
        )
        end
      end


      struct UpdateVirtualRouterOutput
        include JSON::Serializable

        # A full description of the virtual router that was updated.

        @[JSON::Field(key: "virtualRouter")]
        getter virtual_router : Types::VirtualRouterData

        def initialize(
          @virtual_router : Types::VirtualRouterData
        )
        end
      end


      struct UpdateVirtualServiceInput
        include JSON::Serializable

        # The name of the service mesh that the virtual service resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The new virtual service specification to apply. This overwrites the existing data.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualServiceSpec

        # The name of the virtual service to update.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request. Up to
        # 36 letters, numbers, hyphens, and underscores are allowed.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String?

        def initialize(
          @mesh_name : String,
          @spec : Types::VirtualServiceSpec,
          @virtual_service_name : String,
          @client_token : String? = nil,
          @mesh_owner : String? = nil
        )
        end
      end


      struct UpdateVirtualServiceOutput
        include JSON::Serializable

        # A full description of the virtual service that was updated.

        @[JSON::Field(key: "virtualService")]
        getter virtual_service : Types::VirtualServiceData

        def initialize(
          @virtual_service : Types::VirtualServiceData
        )
        end
      end

      # The access log configuration for a virtual gateway.

      struct VirtualGatewayAccessLog
        include JSON::Serializable

        # The file object to send virtual gateway access logs to.

        @[JSON::Field(key: "file")]
        getter file : Types::VirtualGatewayFileAccessLog?

        def initialize(
          @file : Types::VirtualGatewayFileAccessLog? = nil
        )
        end
      end

      # An object that represents the default properties for a backend.

      struct VirtualGatewayBackendDefaults
        include JSON::Serializable

        # A reference to an object that represents a client policy.

        @[JSON::Field(key: "clientPolicy")]
        getter client_policy : Types::VirtualGatewayClientPolicy?

        def initialize(
          @client_policy : Types::VirtualGatewayClientPolicy? = nil
        )
        end
      end

      # An object that represents a client policy.

      struct VirtualGatewayClientPolicy
        include JSON::Serializable

        # A reference to an object that represents a Transport Layer Security (TLS) client policy.

        @[JSON::Field(key: "tls")]
        getter tls : Types::VirtualGatewayClientPolicyTls?

        def initialize(
          @tls : Types::VirtualGatewayClientPolicyTls? = nil
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) client policy.

      struct VirtualGatewayClientPolicyTls
        include JSON::Serializable

        # A reference to an object that represents a Transport Layer Security (TLS) validation context.

        @[JSON::Field(key: "validation")]
        getter validation : Types::VirtualGatewayTlsValidationContext

        # A reference to an object that represents a virtual gateway's client's Transport Layer Security (TLS)
        # certificate.

        @[JSON::Field(key: "certificate")]
        getter certificate : Types::VirtualGatewayClientTlsCertificate?

        # Whether the policy is enforced. The default is True , if a value isn't specified.

        @[JSON::Field(key: "enforce")]
        getter enforce : Bool?

        # One or more ports that the policy is enforced for.

        @[JSON::Field(key: "ports")]
        getter ports : Array(Int32)?

        def initialize(
          @validation : Types::VirtualGatewayTlsValidationContext,
          @certificate : Types::VirtualGatewayClientTlsCertificate? = nil,
          @enforce : Bool? = nil,
          @ports : Array(Int32)? = nil
        )
        end
      end

      # An object that represents the virtual gateway's client's Transport Layer Security (TLS) certificate.

      struct VirtualGatewayClientTlsCertificate
        include JSON::Serializable

        # An object that represents a local file certificate. The certificate must meet specific requirements
        # and you must have proxy authorization enabled. For more information, see Transport Layer Security
        # (TLS) .

        @[JSON::Field(key: "file")]
        getter file : Types::VirtualGatewayListenerTlsFileCertificate?

        # A reference to an object that represents a virtual gateway's client's Secret Discovery Service
        # certificate.

        @[JSON::Field(key: "sds")]
        getter sds : Types::VirtualGatewayListenerTlsSdsCertificate?

        def initialize(
          @file : Types::VirtualGatewayListenerTlsFileCertificate? = nil,
          @sds : Types::VirtualGatewayListenerTlsSdsCertificate? = nil
        )
        end
      end

      # An object that represents the type of virtual gateway connection pool. Only one protocol is used at
      # a time and should be the same protocol as the one chosen under port mapping. If not present the
      # default value for maxPendingRequests is 2147483647 .

      struct VirtualGatewayConnectionPool
        include JSON::Serializable

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "grpc")]
        getter grpc : Types::VirtualGatewayGrpcConnectionPool?

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "http")]
        getter http : Types::VirtualGatewayHttpConnectionPool?

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "http2")]
        getter http2 : Types::VirtualGatewayHttp2ConnectionPool?

        def initialize(
          @grpc : Types::VirtualGatewayGrpcConnectionPool? = nil,
          @http : Types::VirtualGatewayHttpConnectionPool? = nil,
          @http2 : Types::VirtualGatewayHttp2ConnectionPool? = nil
        )
        end
      end

      # An object that represents a virtual gateway returned by a describe operation.

      struct VirtualGatewayData
        include JSON::Serializable

        # The name of the service mesh that the virtual gateway resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String


        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The specifications of the virtual gateway.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualGatewaySpec

        # The current status of the virtual gateway.

        @[JSON::Field(key: "status")]
        getter status : Types::VirtualGatewayStatus

        # The name of the virtual gateway.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        def initialize(
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @spec : Types::VirtualGatewaySpec,
          @status : Types::VirtualGatewayStatus,
          @virtual_gateway_name : String
        )
        end
      end

      # An object that represents an access log file.

      struct VirtualGatewayFileAccessLog
        include JSON::Serializable

        # The file path to write access logs to. You can use /dev/stdout to send access logs to standard out
        # and configure your Envoy container to use a log driver, such as awslogs , to export the access logs
        # to a log storage service such as Amazon CloudWatch Logs. You can also specify a path in the Envoy
        # container's file system to write the files to disk.

        @[JSON::Field(key: "path")]
        getter path : String

        # The specified format for the virtual gateway access logs. It can be either json_format or
        # text_format .

        @[JSON::Field(key: "format")]
        getter format : Types::LoggingFormat?

        def initialize(
          @path : String,
          @format : Types::LoggingFormat? = nil
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualGatewayGrpcConnectionPool
        include JSON::Serializable

        # Maximum number of inflight requests Envoy can concurrently support across hosts in upstream cluster.

        @[JSON::Field(key: "maxRequests")]
        getter max_requests : Int32

        def initialize(
          @max_requests : Int32
        )
        end
      end

      # An object that represents the health check policy for a virtual gateway's listener.

      struct VirtualGatewayHealthCheckPolicy
        include JSON::Serializable

        # The number of consecutive successful health checks that must occur before declaring the listener
        # healthy.

        @[JSON::Field(key: "healthyThreshold")]
        getter healthy_threshold : Int32

        # The time period in milliseconds between each health check execution.

        @[JSON::Field(key: "intervalMillis")]
        getter interval_millis : Int64

        # The protocol for the health check request. If you specify grpc , then your service must conform to
        # the GRPC Health Checking Protocol .

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The amount of time to wait when receiving a response from the health check, in milliseconds.

        @[JSON::Field(key: "timeoutMillis")]
        getter timeout_millis : Int64

        # The number of consecutive failed health checks that must occur before declaring a virtual gateway
        # unhealthy.

        @[JSON::Field(key: "unhealthyThreshold")]
        getter unhealthy_threshold : Int32

        # The destination path for the health check request. This value is only used if the specified protocol
        # is HTTP or HTTP/2. For any other protocol, this value is ignored.

        @[JSON::Field(key: "path")]
        getter path : String?

        # The destination port for the health check request. This port must match the port defined in the
        # PortMapping for the listener.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @healthy_threshold : Int32,
          @interval_millis : Int64,
          @protocol : String,
          @timeout_millis : Int64,
          @unhealthy_threshold : Int32,
          @path : String? = nil,
          @port : Int32? = nil
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualGatewayHttp2ConnectionPool
        include JSON::Serializable

        # Maximum number of inflight requests Envoy can concurrently support across hosts in upstream cluster.

        @[JSON::Field(key: "maxRequests")]
        getter max_requests : Int32

        def initialize(
          @max_requests : Int32
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualGatewayHttpConnectionPool
        include JSON::Serializable

        # Maximum number of outbound TCP connections Envoy can establish concurrently with all hosts in
        # upstream cluster.

        @[JSON::Field(key: "maxConnections")]
        getter max_connections : Int32

        # Number of overflowing requests after max_connections Envoy will queue to upstream cluster.

        @[JSON::Field(key: "maxPendingRequests")]
        getter max_pending_requests : Int32?

        def initialize(
          @max_connections : Int32,
          @max_pending_requests : Int32? = nil
        )
        end
      end

      # An object that represents a listener for a virtual gateway.

      struct VirtualGatewayListener
        include JSON::Serializable

        # The port mapping information for the listener.

        @[JSON::Field(key: "portMapping")]
        getter port_mapping : Types::VirtualGatewayPortMapping

        # The connection pool information for the virtual gateway listener.

        @[JSON::Field(key: "connectionPool")]
        getter connection_pool : Types::VirtualGatewayConnectionPool?

        # The health check information for the listener.

        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::VirtualGatewayHealthCheckPolicy?

        # A reference to an object that represents the Transport Layer Security (TLS) properties for the
        # listener.

        @[JSON::Field(key: "tls")]
        getter tls : Types::VirtualGatewayListenerTls?

        def initialize(
          @port_mapping : Types::VirtualGatewayPortMapping,
          @connection_pool : Types::VirtualGatewayConnectionPool? = nil,
          @health_check : Types::VirtualGatewayHealthCheckPolicy? = nil,
          @tls : Types::VirtualGatewayListenerTls? = nil
        )
        end
      end

      # An object that represents the Transport Layer Security (TLS) properties for a listener.

      struct VirtualGatewayListenerTls
        include JSON::Serializable

        # An object that represents a Transport Layer Security (TLS) certificate.

        @[JSON::Field(key: "certificate")]
        getter certificate : Types::VirtualGatewayListenerTlsCertificate

        # Specify one of the following modes. STRICT – Listener only accepts connections with TLS enabled.
        # PERMISSIVE – Listener accepts connections with or without TLS enabled. DISABLED – Listener only
        # accepts connections without TLS.

        @[JSON::Field(key: "mode")]
        getter mode : String

        # A reference to an object that represents a virtual gateway's listener's Transport Layer Security
        # (TLS) validation context.

        @[JSON::Field(key: "validation")]
        getter validation : Types::VirtualGatewayListenerTlsValidationContext?

        def initialize(
          @certificate : Types::VirtualGatewayListenerTlsCertificate,
          @mode : String,
          @validation : Types::VirtualGatewayListenerTlsValidationContext? = nil
        )
        end
      end

      # An object that represents an Certificate Manager certificate.

      struct VirtualGatewayListenerTlsAcmCertificate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the certificate. The certificate must meet specific requirements
        # and you must have proxy authorization enabled. For more information, see Transport Layer Security
        # (TLS) .

        @[JSON::Field(key: "certificateArn")]
        getter certificate_arn : String

        def initialize(
          @certificate_arn : String
        )
        end
      end

      # An object that represents a listener's Transport Layer Security (TLS) certificate.

      struct VirtualGatewayListenerTlsCertificate
        include JSON::Serializable

        # A reference to an object that represents an Certificate Manager certificate.

        @[JSON::Field(key: "acm")]
        getter acm : Types::VirtualGatewayListenerTlsAcmCertificate?

        # A reference to an object that represents a local file certificate.

        @[JSON::Field(key: "file")]
        getter file : Types::VirtualGatewayListenerTlsFileCertificate?

        # A reference to an object that represents a virtual gateway's listener's Secret Discovery Service
        # certificate.

        @[JSON::Field(key: "sds")]
        getter sds : Types::VirtualGatewayListenerTlsSdsCertificate?

        def initialize(
          @acm : Types::VirtualGatewayListenerTlsAcmCertificate? = nil,
          @file : Types::VirtualGatewayListenerTlsFileCertificate? = nil,
          @sds : Types::VirtualGatewayListenerTlsSdsCertificate? = nil
        )
        end
      end

      # An object that represents a local file certificate. The certificate must meet specific requirements
      # and you must have proxy authorization enabled. For more information, see Transport Layer Security
      # (TLS) .

      struct VirtualGatewayListenerTlsFileCertificate
        include JSON::Serializable

        # The certificate chain for the certificate.

        @[JSON::Field(key: "certificateChain")]
        getter certificate_chain : String

        # The private key for a certificate stored on the file system of the mesh endpoint that the proxy is
        # running on.

        @[JSON::Field(key: "privateKey")]
        getter private_key : String

        def initialize(
          @certificate_chain : String,
          @private_key : String
        )
        end
      end

      # An object that represents the virtual gateway's listener's Secret Discovery Service certificate.The
      # proxy must be configured with a local SDS provider via a Unix Domain Socket. See App Mesh TLS
      # documentation for more info.

      struct VirtualGatewayListenerTlsSdsCertificate
        include JSON::Serializable

        # A reference to an object that represents the name of the secret secret requested from the Secret
        # Discovery Service provider representing Transport Layer Security (TLS) materials like a certificate
        # or certificate chain.

        @[JSON::Field(key: "secretName")]
        getter secret_name : String

        def initialize(
          @secret_name : String
        )
        end
      end

      # An object that represents a virtual gateway's listener's Transport Layer Security (TLS) validation
      # context.

      struct VirtualGatewayListenerTlsValidationContext
        include JSON::Serializable

        # A reference to where to retrieve the trust chain when validating a peer’s Transport Layer Security
        # (TLS) certificate.

        @[JSON::Field(key: "trust")]
        getter trust : Types::VirtualGatewayListenerTlsValidationContextTrust

        # A reference to an object that represents the SANs for a virtual gateway listener's Transport Layer
        # Security (TLS) validation context.

        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Types::SubjectAlternativeNames?

        def initialize(
          @trust : Types::VirtualGatewayListenerTlsValidationContextTrust,
          @subject_alternative_names : Types::SubjectAlternativeNames? = nil
        )
        end
      end

      # An object that represents a virtual gateway's listener's Transport Layer Security (TLS) validation
      # context trust.

      struct VirtualGatewayListenerTlsValidationContextTrust
        include JSON::Serializable

        # An object that represents a Transport Layer Security (TLS) validation context trust for a local
        # file.

        @[JSON::Field(key: "file")]
        getter file : Types::VirtualGatewayTlsValidationContextFileTrust?

        # A reference to an object that represents a virtual gateway's listener's Transport Layer Security
        # (TLS) Secret Discovery Service validation context trust.

        @[JSON::Field(key: "sds")]
        getter sds : Types::VirtualGatewayTlsValidationContextSdsTrust?

        def initialize(
          @file : Types::VirtualGatewayTlsValidationContextFileTrust? = nil,
          @sds : Types::VirtualGatewayTlsValidationContextSdsTrust? = nil
        )
        end
      end

      # An object that represents logging information.

      struct VirtualGatewayLogging
        include JSON::Serializable

        # The access log configuration.

        @[JSON::Field(key: "accessLog")]
        getter access_log : Types::VirtualGatewayAccessLog?

        def initialize(
          @access_log : Types::VirtualGatewayAccessLog? = nil
        )
        end
      end

      # An object that represents a port mapping.

      struct VirtualGatewayPortMapping
        include JSON::Serializable

        # The port used for the port mapping. Specify one protocol.

        @[JSON::Field(key: "port")]
        getter port : Int32

        # The protocol used for the port mapping.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        def initialize(
          @port : Int32,
          @protocol : String
        )
        end
      end

      # An object that represents a virtual gateway returned by a list operation.

      struct VirtualGatewayRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the resource.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh that the resource resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        # The name of the resource.

        @[JSON::Field(key: "virtualGatewayName")]
        getter virtual_gateway_name : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @version : Int64,
          @virtual_gateway_name : String
        )
        end
      end

      # An object that represents the specification of a service mesh resource.

      struct VirtualGatewaySpec
        include JSON::Serializable

        # The listeners that the mesh endpoint is expected to receive inbound traffic from. You can specify
        # one listener.

        @[JSON::Field(key: "listeners")]
        getter listeners : Array(Types::VirtualGatewayListener)

        # A reference to an object that represents the defaults for backends.

        @[JSON::Field(key: "backendDefaults")]
        getter backend_defaults : Types::VirtualGatewayBackendDefaults?


        @[JSON::Field(key: "logging")]
        getter logging : Types::VirtualGatewayLogging?

        def initialize(
          @listeners : Array(Types::VirtualGatewayListener),
          @backend_defaults : Types::VirtualGatewayBackendDefaults? = nil,
          @logging : Types::VirtualGatewayLogging? = nil
        )
        end
      end

      # An object that represents the status of the mesh resource.

      struct VirtualGatewayStatus
        include JSON::Serializable

        # The current status.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context.

      struct VirtualGatewayTlsValidationContext
        include JSON::Serializable

        # A reference to where to retrieve the trust chain when validating a peer’s Transport Layer Security
        # (TLS) certificate.

        @[JSON::Field(key: "trust")]
        getter trust : Types::VirtualGatewayTlsValidationContextTrust

        # A reference to an object that represents the SANs for a virtual gateway's listener's Transport Layer
        # Security (TLS) validation context.

        @[JSON::Field(key: "subjectAlternativeNames")]
        getter subject_alternative_names : Types::SubjectAlternativeNames?

        def initialize(
          @trust : Types::VirtualGatewayTlsValidationContextTrust,
          @subject_alternative_names : Types::SubjectAlternativeNames? = nil
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context trust for an
      # Certificate Manager certificate.

      struct VirtualGatewayTlsValidationContextAcmTrust
        include JSON::Serializable

        # One or more ACM Amazon Resource Name (ARN)s.

        @[JSON::Field(key: "certificateAuthorityArns")]
        getter certificate_authority_arns : Array(String)

        def initialize(
          @certificate_authority_arns : Array(String)
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context trust for a local
      # file.

      struct VirtualGatewayTlsValidationContextFileTrust
        include JSON::Serializable

        # The certificate trust chain for a certificate stored on the file system of the virtual node that the
        # proxy is running on.

        @[JSON::Field(key: "certificateChain")]
        getter certificate_chain : String

        def initialize(
          @certificate_chain : String
        )
        end
      end

      # An object that represents a virtual gateway's listener's Transport Layer Security (TLS) Secret
      # Discovery Service validation context trust. The proxy must be configured with a local SDS provider
      # via a Unix Domain Socket. See App Mesh TLS documentation for more info.

      struct VirtualGatewayTlsValidationContextSdsTrust
        include JSON::Serializable

        # A reference to an object that represents the name of the secret for a virtual gateway's Transport
        # Layer Security (TLS) Secret Discovery Service validation context trust.

        @[JSON::Field(key: "secretName")]
        getter secret_name : String

        def initialize(
          @secret_name : String
        )
        end
      end

      # An object that represents a Transport Layer Security (TLS) validation context trust.

      struct VirtualGatewayTlsValidationContextTrust
        include JSON::Serializable

        # A reference to an object that represents a Transport Layer Security (TLS) validation context trust
        # for an Certificate Manager certificate.

        @[JSON::Field(key: "acm")]
        getter acm : Types::VirtualGatewayTlsValidationContextAcmTrust?

        # An object that represents a Transport Layer Security (TLS) validation context trust for a local
        # file.

        @[JSON::Field(key: "file")]
        getter file : Types::VirtualGatewayTlsValidationContextFileTrust?

        # A reference to an object that represents a virtual gateway's Transport Layer Security (TLS) Secret
        # Discovery Service validation context trust.

        @[JSON::Field(key: "sds")]
        getter sds : Types::VirtualGatewayTlsValidationContextSdsTrust?

        def initialize(
          @acm : Types::VirtualGatewayTlsValidationContextAcmTrust? = nil,
          @file : Types::VirtualGatewayTlsValidationContextFileTrust? = nil,
          @sds : Types::VirtualGatewayTlsValidationContextSdsTrust? = nil
        )
        end
      end

      # An object that represents the type of virtual node connection pool. Only one protocol is used at a
      # time and should be the same protocol as the one chosen under port mapping. If not present the
      # default value for maxPendingRequests is 2147483647 .

      struct VirtualNodeConnectionPool
        include JSON::Serializable

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "grpc")]
        getter grpc : Types::VirtualNodeGrpcConnectionPool?

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "http")]
        getter http : Types::VirtualNodeHttpConnectionPool?

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "http2")]
        getter http2 : Types::VirtualNodeHttp2ConnectionPool?

        # An object that represents a type of connection pool.

        @[JSON::Field(key: "tcp")]
        getter tcp : Types::VirtualNodeTcpConnectionPool?

        def initialize(
          @grpc : Types::VirtualNodeGrpcConnectionPool? = nil,
          @http : Types::VirtualNodeHttpConnectionPool? = nil,
          @http2 : Types::VirtualNodeHttp2ConnectionPool? = nil,
          @tcp : Types::VirtualNodeTcpConnectionPool? = nil
        )
        end
      end

      # An object that represents a virtual node returned by a describe operation.

      struct VirtualNodeData
        include JSON::Serializable

        # The name of the service mesh that the virtual node resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The associated metadata for the virtual node.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The specifications of the virtual node.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualNodeSpec

        # The current status for the virtual node.

        @[JSON::Field(key: "status")]
        getter status : Types::VirtualNodeStatus

        # The name of the virtual node.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        def initialize(
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @spec : Types::VirtualNodeSpec,
          @status : Types::VirtualNodeStatus,
          @virtual_node_name : String
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualNodeGrpcConnectionPool
        include JSON::Serializable

        # Maximum number of inflight requests Envoy can concurrently support across hosts in upstream cluster.

        @[JSON::Field(key: "maxRequests")]
        getter max_requests : Int32

        def initialize(
          @max_requests : Int32
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualNodeHttp2ConnectionPool
        include JSON::Serializable

        # Maximum number of inflight requests Envoy can concurrently support across hosts in upstream cluster.

        @[JSON::Field(key: "maxRequests")]
        getter max_requests : Int32

        def initialize(
          @max_requests : Int32
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualNodeHttpConnectionPool
        include JSON::Serializable

        # Maximum number of outbound TCP connections Envoy can establish concurrently with all hosts in
        # upstream cluster.

        @[JSON::Field(key: "maxConnections")]
        getter max_connections : Int32

        # Number of overflowing requests after max_connections Envoy will queue to upstream cluster.

        @[JSON::Field(key: "maxPendingRequests")]
        getter max_pending_requests : Int32?

        def initialize(
          @max_connections : Int32,
          @max_pending_requests : Int32? = nil
        )
        end
      end

      # An object that represents a virtual node returned by a list operation.

      struct VirtualNodeRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the virtual node.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh that the virtual node resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        # The name of the virtual node.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @version : Int64,
          @virtual_node_name : String
        )
        end
      end

      # An object that represents a virtual node service provider.

      struct VirtualNodeServiceProvider
        include JSON::Serializable

        # The name of the virtual node that is acting as a service provider.

        @[JSON::Field(key: "virtualNodeName")]
        getter virtual_node_name : String

        def initialize(
          @virtual_node_name : String
        )
        end
      end

      # An object that represents the specification of a virtual node.

      struct VirtualNodeSpec
        include JSON::Serializable

        # A reference to an object that represents the defaults for backends.

        @[JSON::Field(key: "backendDefaults")]
        getter backend_defaults : Types::BackendDefaults?

        # The backends that the virtual node is expected to send outbound traffic to.

        @[JSON::Field(key: "backends")]
        getter backends : Array(Types::Backend)?

        # The listener that the virtual node is expected to receive inbound traffic from. You can specify one
        # listener.

        @[JSON::Field(key: "listeners")]
        getter listeners : Array(Types::Listener)?

        # The inbound and outbound access logging information for the virtual node.

        @[JSON::Field(key: "logging")]
        getter logging : Types::Logging?

        # The service discovery information for the virtual node. If your virtual node does not expect ingress
        # traffic, you can omit this parameter. If you specify a listener , then you must specify service
        # discovery information.

        @[JSON::Field(key: "serviceDiscovery")]
        getter service_discovery : Types::ServiceDiscovery?

        def initialize(
          @backend_defaults : Types::BackendDefaults? = nil,
          @backends : Array(Types::Backend)? = nil,
          @listeners : Array(Types::Listener)? = nil,
          @logging : Types::Logging? = nil,
          @service_discovery : Types::ServiceDiscovery? = nil
        )
        end
      end

      # An object that represents the current status of the virtual node.

      struct VirtualNodeStatus
        include JSON::Serializable

        # The current status of the virtual node.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # An object that represents a type of connection pool.

      struct VirtualNodeTcpConnectionPool
        include JSON::Serializable

        # Maximum number of outbound TCP connections Envoy can establish concurrently with all hosts in
        # upstream cluster.

        @[JSON::Field(key: "maxConnections")]
        getter max_connections : Int32

        def initialize(
          @max_connections : Int32
        )
        end
      end

      # An object that represents a virtual router returned by a describe operation.

      struct VirtualRouterData
        include JSON::Serializable

        # The name of the service mesh that the virtual router resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The associated metadata for the virtual router.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The specifications of the virtual router.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualRouterSpec

        # The current status of the virtual router.

        @[JSON::Field(key: "status")]
        getter status : Types::VirtualRouterStatus

        # The name of the virtual router.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        def initialize(
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @spec : Types::VirtualRouterSpec,
          @status : Types::VirtualRouterStatus,
          @virtual_router_name : String
        )
        end
      end

      # An object that represents a virtual router listener.

      struct VirtualRouterListener
        include JSON::Serializable


        @[JSON::Field(key: "portMapping")]
        getter port_mapping : Types::PortMapping

        def initialize(
          @port_mapping : Types::PortMapping
        )
        end
      end

      # An object that represents a virtual router returned by a list operation.

      struct VirtualRouterRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the virtual router.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh that the virtual router resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        # The name of the virtual router.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @version : Int64,
          @virtual_router_name : String
        )
        end
      end

      # An object that represents a virtual node service provider.

      struct VirtualRouterServiceProvider
        include JSON::Serializable

        # The name of the virtual router that is acting as a service provider.

        @[JSON::Field(key: "virtualRouterName")]
        getter virtual_router_name : String

        def initialize(
          @virtual_router_name : String
        )
        end
      end

      # An object that represents the specification of a virtual router.

      struct VirtualRouterSpec
        include JSON::Serializable

        # The listeners that the virtual router is expected to receive inbound traffic from. You can specify
        # one listener.

        @[JSON::Field(key: "listeners")]
        getter listeners : Array(Types::VirtualRouterListener)?

        def initialize(
          @listeners : Array(Types::VirtualRouterListener)? = nil
        )
        end
      end

      # An object that represents the status of a virtual router.

      struct VirtualRouterStatus
        include JSON::Serializable

        # The current status of the virtual router.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # An object that represents a virtual service backend for a virtual node.

      struct VirtualServiceBackend
        include JSON::Serializable

        # The name of the virtual service that is acting as a virtual node backend.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        # A reference to an object that represents the client policy for a backend.

        @[JSON::Field(key: "clientPolicy")]
        getter client_policy : Types::ClientPolicy?

        def initialize(
          @virtual_service_name : String,
          @client_policy : Types::ClientPolicy? = nil
        )
        end
      end

      # An object that represents a virtual service returned by a describe operation.

      struct VirtualServiceData
        include JSON::Serializable

        # The name of the service mesh that the virtual service resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String


        @[JSON::Field(key: "metadata")]
        getter metadata : Types::ResourceMetadata

        # The specifications of the virtual service.

        @[JSON::Field(key: "spec")]
        getter spec : Types::VirtualServiceSpec

        # The current status of the virtual service.

        @[JSON::Field(key: "status")]
        getter status : Types::VirtualServiceStatus

        # The name of the virtual service.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        def initialize(
          @mesh_name : String,
          @metadata : Types::ResourceMetadata,
          @spec : Types::VirtualServiceSpec,
          @status : Types::VirtualServiceStatus,
          @virtual_service_name : String
        )
        end
      end

      # An object that represents the provider for a virtual service.

      struct VirtualServiceProvider
        include JSON::Serializable

        # The virtual node associated with a virtual service.

        @[JSON::Field(key: "virtualNode")]
        getter virtual_node : Types::VirtualNodeServiceProvider?

        # The virtual router associated with a virtual service.

        @[JSON::Field(key: "virtualRouter")]
        getter virtual_router : Types::VirtualRouterServiceProvider?

        def initialize(
          @virtual_node : Types::VirtualNodeServiceProvider? = nil,
          @virtual_router : Types::VirtualRouterServiceProvider? = nil
        )
        end
      end

      # An object that represents a virtual service returned by a list operation.

      struct VirtualServiceRef
        include JSON::Serializable

        # The full Amazon Resource Name (ARN) for the virtual service.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The Unix epoch timestamp in seconds for when the resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Unix epoch timestamp in seconds for when the resource was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Time

        # The name of the service mesh that the virtual service resides in.

        @[JSON::Field(key: "meshName")]
        getter mesh_name : String

        # The Amazon Web Services IAM account ID of the service mesh owner. If the account ID is not your own,
        # then it's the ID of the account that shared the mesh with your account. For more information about
        # mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "meshOwner")]
        getter mesh_owner : String

        # The Amazon Web Services IAM account ID of the resource owner. If the account ID is not your own,
        # then it's the ID of the mesh owner or of another account that the mesh is shared with. For more
        # information about mesh sharing, see Working with shared meshes .

        @[JSON::Field(key: "resourceOwner")]
        getter resource_owner : String

        # The version of the resource. Resources are created at version 1, and this version is incremented
        # each time that they're updated.

        @[JSON::Field(key: "version")]
        getter version : Int64

        # The name of the virtual service.

        @[JSON::Field(key: "virtualServiceName")]
        getter virtual_service_name : String

        def initialize(
          @arn : String,
          @created_at : Time,
          @last_updated_at : Time,
          @mesh_name : String,
          @mesh_owner : String,
          @resource_owner : String,
          @version : Int64,
          @virtual_service_name : String
        )
        end
      end

      # An object that represents the specification of a virtual service.

      struct VirtualServiceSpec
        include JSON::Serializable

        # The App Mesh object that is acting as the provider for a virtual service. You can specify a single
        # virtual node or virtual router.

        @[JSON::Field(key: "provider")]
        getter provider : Types::VirtualServiceProvider?

        def initialize(
          @provider : Types::VirtualServiceProvider? = nil
        )
        end
      end

      # An object that represents the status of a virtual service.

      struct VirtualServiceStatus
        include JSON::Serializable

        # The current status of the virtual service.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # An object that represents a target and its relative weight. Traffic is distributed across targets
      # according to their relative weight. For example, a weighted target with a relative weight of 50
      # receives five times as much traffic as one with a relative weight of 10. The total weight for all
      # targets combined must be less than or equal to 100.

      struct WeightedTarget
        include JSON::Serializable

        # The virtual node to associate with the weighted target.

        @[JSON::Field(key: "virtualNode")]
        getter virtual_node : String

        # The relative weight of the weighted target.

        @[JSON::Field(key: "weight")]
        getter weight : Int32

        # The targeted port of the weighted object.

        @[JSON::Field(key: "port")]
        getter port : Int32?

        def initialize(
          @virtual_node : String,
          @weight : Int32,
          @port : Int32? = nil
        )
        end
      end
    end
  end
end
