require "json"
require "time"

module Aws
  module MigrationHubRefactorSpaces
    module Types

      # The user does not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A wrapper object holding the Amazon API Gateway proxy configuration.

      struct ApiGatewayProxyConfig
        include JSON::Serializable

        # The resource ID of the API Gateway for the proxy.

        @[JSON::Field(key: "ApiGatewayId")]
        getter api_gateway_id : String?

        # The type of API Gateway endpoint created.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The Amazon Resource Name (ARN) of the Network Load Balancer configured by the API Gateway proxy.

        @[JSON::Field(key: "NlbArn")]
        getter nlb_arn : String?

        # The name of the Network Load Balancer that is configured by the API Gateway proxy.

        @[JSON::Field(key: "NlbName")]
        getter nlb_name : String?

        # The endpoint URL of the API Gateway proxy.

        @[JSON::Field(key: "ProxyUrl")]
        getter proxy_url : String?

        # The name of the API Gateway stage. The name defaults to prod .

        @[JSON::Field(key: "StageName")]
        getter stage_name : String?

        # The VpcLink ID of the API Gateway proxy.

        @[JSON::Field(key: "VpcLinkId")]
        getter vpc_link_id : String?

        def initialize(
          @api_gateway_id : String? = nil,
          @endpoint_type : String? = nil,
          @nlb_arn : String? = nil,
          @nlb_name : String? = nil,
          @proxy_url : String? = nil,
          @stage_name : String? = nil,
          @vpc_link_id : String? = nil
        )
        end
      end

      # A wrapper object holding the Amazon API Gateway endpoint input.

      struct ApiGatewayProxyInput
        include JSON::Serializable

        # The type of endpoint to use for the API Gateway proxy. If no value is specified in the request, the
        # value is set to REGIONAL by default. If the value is set to PRIVATE in the request, this creates a
        # private API endpoint that is isolated from the public internet. The private endpoint can only be
        # accessed by using Amazon Virtual Private Cloud (Amazon VPC) interface endpoints for the Amazon API
        # Gateway that has been granted access. For more information about creating a private connection with
        # Refactor Spaces and interface endpoint (Amazon Web Services PrivateLink) availability, see Access
        # Refactor Spaces using an interface endpoint (Amazon Web Services PrivateLink) .

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The name of the API Gateway stage. The name defaults to prod .

        @[JSON::Field(key: "StageName")]
        getter stage_name : String?

        def initialize(
          @endpoint_type : String? = nil,
          @stage_name : String? = nil
        )
        end
      end

      # A wrapper object holding the Amazon API Gateway proxy summary.

      struct ApiGatewayProxySummary
        include JSON::Serializable

        # The resource ID of the API Gateway for the proxy.

        @[JSON::Field(key: "ApiGatewayId")]
        getter api_gateway_id : String?

        # The type of API Gateway endpoint created.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The Amazon Resource Name (ARN) of the Network Load Balancer configured by the API Gateway proxy.

        @[JSON::Field(key: "NlbArn")]
        getter nlb_arn : String?

        # The name of the Network Load Balancer that is configured by the API Gateway proxy.

        @[JSON::Field(key: "NlbName")]
        getter nlb_name : String?

        # The endpoint URL of the API Gateway proxy.

        @[JSON::Field(key: "ProxyUrl")]
        getter proxy_url : String?

        # The name of the API Gateway stage. The name defaults to prod .

        @[JSON::Field(key: "StageName")]
        getter stage_name : String?

        # The VpcLink ID of the API Gateway proxy.

        @[JSON::Field(key: "VpcLinkId")]
        getter vpc_link_id : String?

        def initialize(
          @api_gateway_id : String? = nil,
          @endpoint_type : String? = nil,
          @nlb_arn : String? = nil,
          @nlb_name : String? = nil,
          @proxy_url : String? = nil,
          @stage_name : String? = nil,
          @vpc_link_id : String? = nil
        )
        end
      end

      # The list of ApplicationSummary objects.

      struct ApplicationSummary
        include JSON::Serializable

        # The endpoint URL of the Amazon API Gateway proxy.

        @[JSON::Field(key: "ApiGatewayProxy")]
        getter api_gateway_proxy : Types::ApiGatewayProxySummary?

        # The unique identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the application creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the application is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the application resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # A timestamp that indicates when the application was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the application owner (which is always the same as the
        # environment owner account ID).

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The proxy type of the proxy created within the application.

        @[JSON::Field(key: "ProxyType")]
        getter proxy_type : String?

        # The current state of the application.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the application.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The ID of the virtual private cloud (VPC).

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @api_gateway_proxy : Types::ApiGatewayProxySummary? = nil,
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @proxy_type : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The name to use for the application.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The proxy type of the proxy created within the application.

        @[JSON::Field(key: "ProxyType")]
        getter proxy_type : String

        # The ID of the virtual private cloud (VPC).

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String

        # A wrapper object holding the API Gateway endpoint type and stage name for the proxy.

        @[JSON::Field(key: "ApiGatewayProxy")]
        getter api_gateway_proxy : Types::ApiGatewayProxyInput?

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The tags to assign to the application. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @environment_identifier : String,
          @name : String,
          @proxy_type : String,
          @vpc_id : String,
          @api_gateway_proxy : Types::ApiGatewayProxyInput? = nil,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # A wrapper object holding the API Gateway endpoint type and stage name for the proxy.

        @[JSON::Field(key: "ApiGatewayProxy")]
        getter api_gateway_proxy : Types::ApiGatewayProxyInput?

        # The unique identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the application. The format for this ARN is
        # arn:aws:refactor-spaces: region : account-id : resource-type/resource-id . For more information
        # about ARNs, see Amazon Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of application creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the application is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The ID of the environment in which the application is created.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A timestamp that indicates when the application was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the application owner (which is always the same as the
        # environment owner account ID).

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The proxy type of the proxy created within the application.

        @[JSON::Field(key: "ProxyType")]
        getter proxy_type : String?

        # The current state of the application.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the application. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The ID of the Amazon VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @api_gateway_proxy : Types::ApiGatewayProxyInput? = nil,
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @environment_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @proxy_type : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct CreateEnvironmentRequest
        include JSON::Serializable

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String

        # The network fabric type of the environment.

        @[JSON::Field(key: "NetworkFabricType")]
        getter network_fabric_type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The tags to assign to the environment. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @network_fabric_type : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A timestamp that indicates when the environment is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # A description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A timestamp that indicates when the environment was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The network fabric type of the environment.

        @[JSON::Field(key: "NetworkFabricType")]
        getter network_fabric_type : String?

        # The Amazon Web Services account ID of environment owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The current state of the environment.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the created environment. A tag is a label that you assign to an Amazon Web
        # Services resource. Each tag consists of a key-value pair..

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @network_fabric_type : String? = nil,
          @owner_account_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRouteRequest
        include JSON::Serializable

        # The ID of the application within which the route is being created.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment in which the route is created.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The route type of the route. DEFAULT indicates that all traffic that does not match another route is
        # forwarded to the default route. Applications must have a default route before any other routes can
        # be created. URI_PATH indicates a route that is based on a URI path.

        @[JSON::Field(key: "RouteType")]
        getter route_type : String

        # The ID of the service in which the route is created. Traffic that matches this route is forwarded to
        # this service.

        @[JSON::Field(key: "ServiceIdentifier")]
        getter service_identifier : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Configuration for the default route type.

        @[JSON::Field(key: "DefaultRoute")]
        getter default_route : Types::DefaultRouteInput?

        # The tags to assign to the route. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair..

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The configuration for the URI path route type.

        @[JSON::Field(key: "UriPathRoute")]
        getter uri_path_route : Types::UriPathRouteInput?

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @route_type : String,
          @service_identifier : String,
          @client_token : String? = nil,
          @default_route : Types::DefaultRouteInput? = nil,
          @tags : Hash(String, String)? = nil,
          @uri_path_route : Types::UriPathRouteInput? = nil
        )
        end
      end


      struct CreateRouteResponse
        include JSON::Serializable

        # The ID of the application in which the route is created.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the route. The format for this ARN is arn:aws:refactor-spaces:
        # region : account-id : resource-type/resource-id . For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the route creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the route is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # A timestamp that indicates when the route was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The Amazon Web Services account ID of the route owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The unique identifier of the route.

        @[JSON::Field(key: "RouteId")]
        getter route_id : String?

        # The route type of the route.

        @[JSON::Field(key: "RouteType")]
        getter route_type : String?

        # The ID of service in which the route is created. Traffic that matches this route is forwarded to
        # this service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the route. Activation state only allows ACTIVE or INACTIVE as user inputs.
        # FAILED is a route state that is system generated.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the created route. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # Configuration for the URI path route type.

        @[JSON::Field(key: "UriPathRoute")]
        getter uri_path_route : Types::UriPathRouteInput?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @owner_account_id : String? = nil,
          @route_id : String? = nil,
          @route_type : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @uri_path_route : Types::UriPathRouteInput? = nil
        )
        end
      end


      struct CreateServiceRequest
        include JSON::Serializable

        # The ID of the application which the service is created.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The type of endpoint to use for the service. The type can be a URL in a VPC or an Lambda function.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String

        # The ID of the environment in which the service is created.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request.

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description of the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration for the Lambda endpoint type.

        @[JSON::Field(key: "LambdaEndpoint")]
        getter lambda_endpoint : Types::LambdaEndpointInput?

        # The tags to assign to the service. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair..

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The configuration for the URL endpoint type. When creating a route to a service, Refactor Spaces
        # automatically resolves the address in the UrlEndpointInput object URL when the Domain Name System
        # (DNS) time-to-live (TTL) expires, or every 60 seconds for TTLs less than 60 seconds.

        @[JSON::Field(key: "UrlEndpoint")]
        getter url_endpoint : Types::UrlEndpointInput?

        # The ID of the VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @application_identifier : String,
          @endpoint_type : String,
          @environment_identifier : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @lambda_endpoint : Types::LambdaEndpointInput? = nil,
          @tags : Hash(String, String)? = nil,
          @url_endpoint : Types::UrlEndpointInput? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct CreateServiceResponse
        include JSON::Serializable

        # The ID of the application that the created service belongs to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the service.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the service creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the service is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The description of the created service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The endpoint type of the service.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The configuration for the Lambda endpoint type.

        @[JSON::Field(key: "LambdaEndpoint")]
        getter lambda_endpoint : Types::LambdaEndpointInput?

        # A timestamp that indicates when the service was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the service owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The unique identifier of the service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the service.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the created service. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair..

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The configuration for the URL endpoint type.

        @[JSON::Field(key: "UrlEndpoint")]
        getter url_endpoint : Types::UrlEndpointInput?

        # The ID of the VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @endpoint_type : String? = nil,
          @environment_id : String? = nil,
          @lambda_endpoint : Types::LambdaEndpointInput? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @url_endpoint : Types::UrlEndpointInput? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # The configuration for the default route type.

      struct DefaultRouteInput
        include JSON::Serializable

        # If set to ACTIVE , traffic is forwarded to this route’s service after the route is created.

        @[JSON::Field(key: "ActivationState")]
        getter activation_state : String?

        def initialize(
          @activation_state : String? = nil
        )
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        def initialize(
          @application_identifier : String,
          @environment_identifier : String
        )
        end
      end


      struct DeleteApplicationResponse
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the application’s environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A timestamp that indicates when the environment was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current state of the application.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @environment_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        def initialize(
          @environment_identifier : String
        )
        end
      end


      struct DeleteEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A timestamp that indicates when the environment was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current state of the environment.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @environment_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteResourcePolicyRequest
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the resource associated with the policy.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteRouteRequest
        include JSON::Serializable

        # The ID of the application to delete the route from.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment to delete the route from.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The ID of the route to delete.

        @[JSON::Field(key: "RouteIdentifier")]
        getter route_identifier : String

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @route_identifier : String
        )
        end
      end


      struct DeleteRouteResponse
        include JSON::Serializable

        # The ID of the application that the route belongs to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the route.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A timestamp that indicates when the route was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The ID of the route to delete.

        @[JSON::Field(key: "RouteId")]
        getter route_id : String?

        # The ID of the service that the route belongs to.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the route.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @last_updated_time : Time? = nil,
          @route_id : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil
        )
        end
      end


      struct DeleteServiceRequest
        include JSON::Serializable

        # Deletes a Refactor Spaces service. The RefactorSpacesSecurityGroup security group must be removed
        # from all Amazon Web Services resources in the virtual private cloud (VPC) prior to deleting a
        # service with a URL endpoint in a VPC.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment that the service is in.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The ID of the service to delete.

        @[JSON::Field(key: "ServiceIdentifier")]
        getter service_identifier : String

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @service_identifier : String
        )
        end
      end


      struct DeleteServiceResponse
        include JSON::Serializable

        # The ID of the application that the service is in.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the service.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A timestamp that indicates when the service was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The unique identifier of the service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the service.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @environment_id : String? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The summary information for environments as a response to ListEnvironments .

      struct EnvironmentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A timestamp that indicates when the environment is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # A description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the environment resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # A timestamp that indicates when the environment was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The network fabric type of the environment.

        @[JSON::Field(key: "NetworkFabricType")]
        getter network_fabric_type : String?

        # The Amazon Web Services account ID of the environment owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The current state of the environment.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the environment.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The ID of the Transit Gateway set up by the environment.

        @[JSON::Field(key: "TransitGatewayId")]
        getter transit_gateway_id : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @network_fabric_type : String? = nil,
          @owner_account_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transit_gateway_id : String? = nil
        )
        end
      end

      # Provides summary information for the EnvironmentVpc resource as a response to ListEnvironmentVpc .

      struct EnvironmentVpc
        include JSON::Serializable

        # The Amazon Web Services account ID of the virtual private cloud (VPC) owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # The list of Amazon Virtual Private Cloud (Amazon VPC) CIDR blocks.

        @[JSON::Field(key: "CidrBlocks")]
        getter cidr_blocks : Array(String)?

        # A timestamp that indicates when the VPC is first added to the environment.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A timestamp that indicates when the VPC was last updated by the environment.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The ID of the VPC.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        # The name of the VPC at the time it is added to the environment.

        @[JSON::Field(key: "VpcName")]
        getter vpc_name : String?

        def initialize(
          @account_id : String? = nil,
          @cidr_blocks : Array(String)? = nil,
          @created_time : Time? = nil,
          @environment_id : String? = nil,
          @last_updated_time : Time? = nil,
          @vpc_id : String? = nil,
          @vpc_name : String? = nil
        )
        end
      end

      # Error associated with a resource returned for a Get or List resource response.

      struct ErrorResponse
        include JSON::Serializable

        # The Amazon Web Services account ID of the resource owner.

        @[JSON::Field(key: "AccountId")]
        getter account_id : String?

        # Additional details about the error.

        @[JSON::Field(key: "AdditionalDetails")]
        getter additional_details : Hash(String, String)?

        # The error code associated with the error.

        @[JSON::Field(key: "Code")]
        getter code : String?

        # The message associated with the error.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the resource.

        @[JSON::Field(key: "ResourceIdentifier")]
        getter resource_identifier : String?

        # The type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @account_id : String? = nil,
          @additional_details : Hash(String, String)? = nil,
          @code : String? = nil,
          @message : String? = nil,
          @resource_identifier : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct GetApplicationRequest
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        def initialize(
          @application_identifier : String,
          @environment_identifier : String
        )
        end
      end


      struct GetApplicationResponse
        include JSON::Serializable

        # The endpoint URL of the API Gateway proxy.

        @[JSON::Field(key: "ApiGatewayProxy")]
        getter api_gateway_proxy : Types::ApiGatewayProxyConfig?

        # The unique identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the application creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the application is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the application resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # A timestamp that indicates when the application was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the application.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the application owner (which is always the same as the
        # environment owner account ID).

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The proxy type of the proxy created within the application.

        @[JSON::Field(key: "ProxyType")]
        getter proxy_type : String?

        # The current state of the application.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the application. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The ID of the virtual private cloud (VPC).

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @api_gateway_proxy : Types::ApiGatewayProxyConfig? = nil,
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @proxy_type : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct GetEnvironmentRequest
        include JSON::Serializable

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        def initialize(
          @environment_identifier : String
        )
        end
      end


      struct GetEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the environment.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A timestamp that indicates when the environment is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The description of the environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the environment resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # A timestamp that indicates when the environment was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the environment.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The network fabric type of the environment.

        @[JSON::Field(key: "NetworkFabricType")]
        getter network_fabric_type : String?

        # The Amazon Web Services account ID of the environment owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The current state of the environment.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags to assign to the environment. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The ID of the Transit Gateway set up by the environment, if applicable.

        @[JSON::Field(key: "TransitGatewayId")]
        getter transit_gateway_id : String?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @network_fabric_type : String? = nil,
          @owner_account_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @transit_gateway_id : String? = nil
        )
        end
      end


      struct GetResourcePolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource associated with the policy.

        @[JSON::Field(key: "Identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetResourcePolicyResponse
        include JSON::Serializable

        # A JSON-formatted string for an Amazon Web Services resource-based policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String?

        def initialize(
          @policy : String? = nil
        )
        end
      end


      struct GetRouteRequest
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The ID of the route.

        @[JSON::Field(key: "RouteIdentifier")]
        getter route_identifier : String

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @route_identifier : String
        )
        end
      end


      struct GetRouteResponse
        include JSON::Serializable

        # If set to true , this option appends the source path to the service URL endpoint.

        @[JSON::Field(key: "AppendSourcePath")]
        getter append_source_path : Bool?

        # The ID of the application that the route belongs to.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the route.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the route creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # The timestamp of when the route is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # Unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the route resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # Indicates whether to match all subpaths of the given source path. If this value is false , requests
        # must match the source path exactly before they are forwarded to this route's service.

        @[JSON::Field(key: "IncludeChildPaths")]
        getter include_child_paths : Bool?

        # A timestamp that indicates when the route was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # A list of HTTP methods to match. An empty list matches all values. If a method is present, only HTTP
        # requests using that method are forwarded to this route’s service.

        @[JSON::Field(key: "Methods")]
        getter methods : Array(String)?

        # The Amazon Web Services account ID of the route owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # A mapping of Amazon API Gateway path resources to resource IDs.

        @[JSON::Field(key: "PathResourceToId")]
        getter path_resource_to_id : Hash(String, String)?

        # The unique identifier of the route. DEFAULT : All traffic that does not match another route is
        # forwarded to the default route. Applications must have a default route before any other routes can
        # be created. URI_PATH : A route that is based on a URI path.

        @[JSON::Field(key: "RouteId")]
        getter route_id : String?

        # The type of route.

        @[JSON::Field(key: "RouteType")]
        getter route_type : String?

        # The unique identifier of the service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # This is the path that Refactor Spaces uses to match traffic. Paths must start with / and are
        # relative to the base of the application. To use path parameters in the source path, add a variable
        # in curly braces. For example, the resource path {user} represents a path parameter called 'user'.

        @[JSON::Field(key: "SourcePath")]
        getter source_path : String?

        # The current state of the route.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the route. A tag is a label that you assign to an Amazon Web Services resource.
        # Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @append_source_path : Bool? = nil,
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @include_child_paths : Bool? = nil,
          @last_updated_time : Time? = nil,
          @methods : Array(String)? = nil,
          @owner_account_id : String? = nil,
          @path_resource_to_id : Hash(String, String)? = nil,
          @route_id : String? = nil,
          @route_type : String? = nil,
          @service_id : String? = nil,
          @source_path : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetServiceRequest
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The ID of the service.

        @[JSON::Field(key: "ServiceIdentifier")]
        getter service_identifier : String

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @service_identifier : String
        )
        end
      end


      struct GetServiceResponse
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the service.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the service creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # The timestamp of when the service is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The description of the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The endpoint type of the service.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the service resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # The configuration for the Lambda endpoint type. The Arn is the Amazon Resource Name (ARN) of the
        # Lambda function associated with this service.

        @[JSON::Field(key: "LambdaEndpoint")]
        getter lambda_endpoint : Types::LambdaEndpointConfig?

        # A timestamp that indicates when the service was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the service owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The unique identifier of the service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the service.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the service. A tag is a label that you assign to an Amazon Web Services
        # resource. Each tag consists of a key-value pair.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The configuration for the URL endpoint type. The Url isthe URL of the endpoint type. The HealthUrl
        # is the health check URL of the endpoint type.

        @[JSON::Field(key: "UrlEndpoint")]
        getter url_endpoint : Types::UrlEndpointConfig?

        # The ID of the virtual private cloud (VPC).

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @endpoint_type : String? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @lambda_endpoint : Types::LambdaEndpointConfig? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @url_endpoint : Types::UrlEndpointConfig? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # An unexpected error occurred while processing the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The resource policy is not valid.

      struct InvalidResourcePolicyException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The configuration for the Lambda endpoint type.

      struct LambdaEndpointConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda endpoint.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # The input for the Lambda endpoint type.

      struct LambdaEndpointInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda function or alias.

        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The summary for the Lambda endpoint type.

      struct LambdaEndpointSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Lambda endpoint.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # The list of ApplicationSummary objects.

        @[JSON::Field(key: "ApplicationSummaryList")]
        getter application_summary_list : Array(Types::ApplicationSummary)?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_summary_list : Array(Types::ApplicationSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentVpcsRequest
        include JSON::Serializable

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentVpcsResponse
        include JSON::Serializable

        # The list of EnvironmentVpc objects.

        @[JSON::Field(key: "EnvironmentVpcList")]
        getter environment_vpc_list : Array(Types::EnvironmentVpc)?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @environment_vpc_list : Array(Types::EnvironmentVpc)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsResponse
        include JSON::Serializable

        # The list of EnvironmentSummary objects.

        @[JSON::Field(key: "EnvironmentSummaryList")]
        getter environment_summary_list : Array(Types::EnvironmentSummary)?

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @environment_summary_list : Array(Types::EnvironmentSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutesRequest
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoutesResponse
        include JSON::Serializable

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of RouteSummary objects.

        @[JSON::Field(key: "RouteSummaryList")]
        getter route_summary_list : Array(Types::RouteSummary)?

        def initialize(
          @next_token : String? = nil,
          @route_summary_list : Array(Types::RouteSummary)? = nil
        )
        end
      end


      struct ListServicesRequest
        include JSON::Serializable

        # The ID of the application.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_identifier : String,
          @environment_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServicesResponse
        include JSON::Serializable

        # The token for the next page of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of ServiceSummary objects.

        @[JSON::Field(key: "ServiceSummaryList")]
        getter service_summary_list : Array(Types::ServiceSummary)?

        def initialize(
          @next_token : String? = nil,
          @service_summary_list : Array(Types::ServiceSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tags assigned to the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutResourcePolicyRequest
        include JSON::Serializable

        # A JSON-formatted string for an Amazon Web Services resource-based policy.

        @[JSON::Field(key: "Policy")]
        getter policy : String

        # The Amazon Resource Name (ARN) of the resource to which the policy is being attached.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @policy : String,
          @resource_arn : String
        )
        end
      end


      struct PutResourcePolicyResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request references a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # The summary information for the routes as a response to ListRoutes .

      struct RouteSummary
        include JSON::Serializable

        # If set to true , this option appends the source path to the service URL endpoint.

        @[JSON::Field(key: "AppendSourcePath")]
        getter append_source_path : Bool?

        # The unique identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the route.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the route creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the route is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the route resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # Indicates whether to match all subpaths of the given source path. If this value is false , requests
        # must match the source path exactly before they are forwarded to this route's service.

        @[JSON::Field(key: "IncludeChildPaths")]
        getter include_child_paths : Bool?

        # A timestamp that indicates when the route was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # A list of HTTP methods to match. An empty list matches all values. If a method is present, only HTTP
        # requests using that method are forwarded to this route’s service.

        @[JSON::Field(key: "Methods")]
        getter methods : Array(String)?

        # The Amazon Web Services account ID of the route owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # A mapping of Amazon API Gateway path resources to resource IDs.

        @[JSON::Field(key: "PathResourceToId")]
        getter path_resource_to_id : Hash(String, String)?

        # The unique identifier of the route.

        @[JSON::Field(key: "RouteId")]
        getter route_id : String?

        # The route type of the route.

        @[JSON::Field(key: "RouteType")]
        getter route_type : String?

        # The unique identifier of the service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # This is the path that Refactor Spaces uses to match traffic. Paths must start with / and are
        # relative to the base of the application. To use path parameters in the source path, add a variable
        # in curly braces. For example, the resource path {user} represents a path parameter called 'user'.

        @[JSON::Field(key: "SourcePath")]
        getter source_path : String?

        # The current state of the route.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the route.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @append_source_path : Bool? = nil,
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @include_child_paths : Bool? = nil,
          @last_updated_time : Time? = nil,
          @methods : Array(String)? = nil,
          @owner_account_id : String? = nil,
          @path_resource_to_id : Hash(String, String)? = nil,
          @route_id : String? = nil,
          @route_type : String? = nil,
          @service_id : String? = nil,
          @source_path : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # The ID of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # Service quota requirement to identify originating service. Reached throttling quota exception
        # service code.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # Service quota requirement to identify originating quota. Reached throttling quota exception.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String,
          @quota_code : String? = nil
        )
        end
      end

      # A summary for the service as a response to ListServices .

      struct ServiceSummary
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the service.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The Amazon Web Services account ID of the service creator.

        @[JSON::Field(key: "CreatedByAccountId")]
        getter created_by_account_id : String?

        # A timestamp that indicates when the service is created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # A description of the service.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The endpoint type of the service.

        @[JSON::Field(key: "EndpointType")]
        getter endpoint_type : String?

        # The unique identifier of the environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Any error associated with the service resource.

        @[JSON::Field(key: "Error")]
        getter error : Types::ErrorResponse?

        # A summary of the configuration for the Lambda endpoint type.

        @[JSON::Field(key: "LambdaEndpoint")]
        getter lambda_endpoint : Types::LambdaEndpointSummary?

        # A timestamp that indicates when the service was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The name of the service.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The Amazon Web Services account ID of the service owner.

        @[JSON::Field(key: "OwnerAccountId")]
        getter owner_account_id : String?

        # The unique identifier of the service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the service.

        @[JSON::Field(key: "State")]
        getter state : String?

        # The tags assigned to the service.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The summary of the configuration for the URL endpoint type.

        @[JSON::Field(key: "UrlEndpoint")]
        getter url_endpoint : Types::UrlEndpointSummary?

        # The ID of the virtual private cloud (VPC).

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @created_by_account_id : String? = nil,
          @created_time : Time? = nil,
          @description : String? = nil,
          @endpoint_type : String? = nil,
          @environment_id : String? = nil,
          @error : Types::ErrorResponse? = nil,
          @lambda_endpoint : Types::LambdaEndpointSummary? = nil,
          @last_updated_time : Time? = nil,
          @name : String? = nil,
          @owner_account_id : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @url_endpoint : Types::UrlEndpointSummary? = nil,
          @vpc_id : String? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The new or modified tags for the resource.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Request was denied because the request was throttled.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        # Service quota requirement to identify originating quota. Reached throttling quota exception.

        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # Service quota requirement to identify originating service. Reached throttling quota exception
        # service code.

        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of keys of the tags to be removed from the resource.

        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateRouteRequest
        include JSON::Serializable

        # If set to ACTIVE , traffic is forwarded to this route’s service after the route is updated.

        @[JSON::Field(key: "ActivationState")]
        getter activation_state : String

        # The ID of the application within which the route is being updated.

        @[JSON::Field(key: "ApplicationIdentifier")]
        getter application_identifier : String

        # The ID of the environment in which the route is being updated.

        @[JSON::Field(key: "EnvironmentIdentifier")]
        getter environment_identifier : String

        # The unique identifier of the route to update.

        @[JSON::Field(key: "RouteIdentifier")]
        getter route_identifier : String

        def initialize(
          @activation_state : String,
          @application_identifier : String,
          @environment_identifier : String,
          @route_identifier : String
        )
        end
      end


      struct UpdateRouteResponse
        include JSON::Serializable

        # The ID of the application in which the route is being updated.

        @[JSON::Field(key: "ApplicationId")]
        getter application_id : String?

        # The Amazon Resource Name (ARN) of the route. The format for this ARN is arn:aws:refactor-spaces:
        # region : account-id : resource-type/resource-id . For more information about ARNs, see Amazon
        # Resource Names (ARNs) in the Amazon Web Services General Reference .

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # A timestamp that indicates when the route was last updated.

        @[JSON::Field(key: "LastUpdatedTime")]
        getter last_updated_time : Time?

        # The unique identifier of the route.

        @[JSON::Field(key: "RouteId")]
        getter route_id : String?

        # The ID of service in which the route was created. Traffic that matches this route is forwarded to
        # this service.

        @[JSON::Field(key: "ServiceId")]
        getter service_id : String?

        # The current state of the route.

        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @application_id : String? = nil,
          @arn : String? = nil,
          @last_updated_time : Time? = nil,
          @route_id : String? = nil,
          @service_id : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The configuration for the URI path route type.

      struct UriPathRouteInput
        include JSON::Serializable

        # If set to ACTIVE , traffic is forwarded to this route’s service after the route is created.

        @[JSON::Field(key: "ActivationState")]
        getter activation_state : String

        # This is the path that Refactor Spaces uses to match traffic. Paths must start with / and are
        # relative to the base of the application. To use path parameters in the source path, add a variable
        # in curly braces. For example, the resource path {user} represents a path parameter called 'user'.

        @[JSON::Field(key: "SourcePath")]
        getter source_path : String

        # If set to true , this option appends the source path to the service URL endpoint.

        @[JSON::Field(key: "AppendSourcePath")]
        getter append_source_path : Bool?

        # Indicates whether to match all subpaths of the given source path. If this value is false , requests
        # must match the source path exactly before they are forwarded to this route's service.

        @[JSON::Field(key: "IncludeChildPaths")]
        getter include_child_paths : Bool?

        # A list of HTTP methods to match. An empty list matches all values. If a method is present, only HTTP
        # requests using that method are forwarded to this route’s service.

        @[JSON::Field(key: "Methods")]
        getter methods : Array(String)?

        def initialize(
          @activation_state : String,
          @source_path : String,
          @append_source_path : Bool? = nil,
          @include_child_paths : Bool? = nil,
          @methods : Array(String)? = nil
        )
        end
      end

      # The configuration for the URL endpoint type.

      struct UrlEndpointConfig
        include JSON::Serializable

        # The health check URL of the URL endpoint type.

        @[JSON::Field(key: "HealthUrl")]
        getter health_url : String?

        # The HTTP URL endpoint.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @health_url : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The configuration for the URL endpoint type.

      struct UrlEndpointInput
        include JSON::Serializable

        # The URL to route traffic to. The URL must be an rfc3986-formatted URL . If the host is a domain
        # name, the name must be resolvable over the public internet. If the scheme is https , the top level
        # domain of the host must be listed in the IANA root zone database .

        @[JSON::Field(key: "Url")]
        getter url : String

        # The health check URL of the URL endpoint type. If the URL is a public endpoint, the HealthUrl must
        # also be a public endpoint. If the URL is a private endpoint inside a virtual private cloud (VPC),
        # the health URL must also be a private endpoint, and the host must be the same as the URL.

        @[JSON::Field(key: "HealthUrl")]
        getter health_url : String?

        def initialize(
          @url : String,
          @health_url : String? = nil
        )
        end
      end

      # The summary of the configuration for the URL endpoint type.

      struct UrlEndpointSummary
        include JSON::Serializable

        # The health check URL of the URL endpoint type. If the URL is a public endpoint, the HealthUrl must
        # also be a public endpoint. If the URL is a private endpoint inside a virtual private cloud (VPC),
        # the health URL must also be a private endpoint, and the host must be the same as the URL.

        @[JSON::Field(key: "HealthUrl")]
        getter health_url : String?

        # The URL to route traffic to. The URL must be an rfc3986-formatted URL . If the host is a domain
        # name, the name must be resolvable over the public internet. If the scheme is https , the top level
        # domain of the host must be listed in the IANA root zone database .

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @health_url : String? = nil,
          @url : String? = nil
        )
        end
      end

      # The input does not satisfy the constraints specified by an Amazon Web Service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
