require "json"
require "time"

module Aws
  module RTBFabric
    module Types


      struct AcceptLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # Settings for the application logs.

        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        def initialize(
          @gateway_id : String,
          @link_id : String,
          @log_settings : Types::LinkLogSettings,
          @attributes : Types::LinkAttributes? = nil
        )
        end
      end


      struct AcceptLinkResponse
        include JSON::Serializable

        # The timestamp of when the link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The unique identifier of the peer gateway.

        @[JSON::Field(key: "peerGatewayId")]
        getter peer_gateway_id : String

        # The status of the link.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # The direction of the link.

        @[JSON::Field(key: "direction")]
        getter direction : String?

        # The configuration of flow modules.

        @[JSON::Field(key: "flowModules")]
        getter flow_modules : Array(Types::ModuleConfiguration)?

        # The configuration of pending flow modules.

        @[JSON::Field(key: "pendingFlowModules")]
        getter pending_flow_modules : Array(Types::ModuleConfiguration)?

        def initialize(
          @created_at : Time,
          @gateway_id : String,
          @link_id : String,
          @peer_gateway_id : String,
          @status : String,
          @updated_at : Time,
          @attributes : Types::LinkAttributes? = nil,
          @direction : String? = nil,
          @flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @pending_flow_modules : Array(Types::ModuleConfiguration)? = nil
        )
        end
      end

      # The request could not be completed because you do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes a bid action.

      struct Action
        include JSON::Serializable

        # Describes the header tag for a bid action.

        @[JSON::Field(key: "headerTag")]
        getter header_tag : Types::HeaderTagAction?

        # Describes a no bid action.

        @[JSON::Field(key: "noBid")]
        getter no_bid : Types::NoBidAction?

        def initialize(
          @header_tag : Types::HeaderTagAction? = nil,
          @no_bid : Types::NoBidAction? = nil
        )
        end
      end

      # Describes the configuration of an auto scaling group.

      struct AutoScalingGroupsConfiguration
        include JSON::Serializable

        # The names of the auto scaling group.

        @[JSON::Field(key: "autoScalingGroupNames")]
        getter auto_scaling_group_names : Array(String)

        # The role ARN of the auto scaling group.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @auto_scaling_group_names : Array(String),
          @role_arn : String
        )
        end
      end

      # The request could not be completed because of a conflict in the current state of the resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct CreateInboundExternalLinkRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String


        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @gateway_id : String,
          @log_settings : Types::LinkLogSettings,
          @attributes : Types::LinkAttributes? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateInboundExternalLinkResponse
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @domain_name : String,
          @gateway_id : String,
          @link_id : String,
          @status : String
        )
        end
      end


      struct CreateLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # Settings for the application logs.

        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings

        # The unique identifier of the peer gateway.

        @[JSON::Field(key: "peerGatewayId")]
        getter peer_gateway_id : String

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # Boolean to specify if an HTTP responder is allowed.

        @[JSON::Field(key: "httpResponderAllowed")]
        getter http_responder_allowed : Bool?

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @gateway_id : String,
          @log_settings : Types::LinkLogSettings,
          @peer_gateway_id : String,
          @attributes : Types::LinkAttributes? = nil,
          @http_responder_allowed : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLinkResponse
        include JSON::Serializable

        # The timestamp of when the link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The unique identifier of the peer gateway.

        @[JSON::Field(key: "peerGatewayId")]
        getter peer_gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # The customer-provided unique identifier of the link.

        @[JSON::Field(key: "customerProvidedId")]
        getter customer_provided_id : String?

        # The direction of the link.

        @[JSON::Field(key: "direction")]
        getter direction : String?

        # The configuration of flow modules.

        @[JSON::Field(key: "flowModules")]
        getter flow_modules : Array(Types::ModuleConfiguration)?

        # The configuration of pending flow modules.

        @[JSON::Field(key: "pendingFlowModules")]
        getter pending_flow_modules : Array(Types::ModuleConfiguration)?

        def initialize(
          @created_at : Time,
          @gateway_id : String,
          @link_id : String,
          @peer_gateway_id : String,
          @status : String,
          @updated_at : Time,
          @attributes : Types::LinkAttributes? = nil,
          @customer_provided_id : String? = nil,
          @direction : String? = nil,
          @flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @pending_flow_modules : Array(Types::ModuleConfiguration)? = nil
        )
        end
      end


      struct CreateOutboundExternalLinkRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String


        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings

        # The public endpoint of the link.

        @[JSON::Field(key: "publicEndpoint")]
        getter public_endpoint : String


        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @gateway_id : String,
          @log_settings : Types::LinkLogSettings,
          @public_endpoint : String,
          @attributes : Types::LinkAttributes? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateOutboundExternalLinkResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @link_id : String,
          @status : String
        )
        end
      end


      struct CreateRequesterGatewayRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique identifiers of the security groups.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The unique identifiers of the subnets.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The unique identifier of the Virtual Private Cloud (VPC).

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # An optional description for the requester gateway.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_id : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRequesterGatewayResponse
        include JSON::Serializable

        # The domain name of the requester gateway.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @domain_name : String,
          @gateway_id : String,
          @status : String
        )
        end
      end


      struct CreateResponderGatewayRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The networking port to use.

        @[JSON::Field(key: "port")]
        getter port : Int32

        # The networking protocol to use.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The unique identifiers of the security groups.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The unique identifiers of the subnets.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The unique identifier of the Virtual Private Cloud (VPC).

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # An optional description for the responder gateway.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain name for the responder gateway.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The configuration for the managed endpoint.

        @[JSON::Field(key: "managedEndpointConfiguration")]
        getter managed_endpoint_configuration : Types::ManagedEndpointConfiguration?

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The configuration of the trust store.

        @[JSON::Field(key: "trustStoreConfiguration")]
        getter trust_store_configuration : Types::TrustStoreConfiguration?

        def initialize(
          @client_token : String,
          @port : Int32,
          @protocol : String,
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_id : String,
          @description : String? = nil,
          @domain_name : String? = nil,
          @managed_endpoint_configuration : Types::ManagedEndpointConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @trust_store_configuration : Types::TrustStoreConfiguration? = nil
        )
        end
      end


      struct CreateResponderGatewayResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @status : String
        )
        end
      end


      struct DeleteInboundExternalLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct DeleteInboundExternalLinkResponse
        include JSON::Serializable

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @link_id : String,
          @status : String
        )
        end
      end


      struct DeleteLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct DeleteLinkResponse
        include JSON::Serializable

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the link.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @link_id : String,
          @status : String
        )
        end
      end


      struct DeleteOutboundExternalLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct DeleteOutboundExternalLinkResponse
        include JSON::Serializable

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @link_id : String,
          @status : String
        )
        end
      end


      struct DeleteRequesterGatewayRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_id : String
        )
        end
      end


      struct DeleteRequesterGatewayResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @status : String
        )
        end
      end


      struct DeleteResponderGatewayRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_id : String
        )
        end
      end


      struct DeleteResponderGatewayResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @status : String
        )
        end
      end

      # Describes the configuration of an Amazon Elastic Kubernetes Service endpoint.

      struct EksEndpointsConfiguration
        include JSON::Serializable

        # The CA certificate chain of the cluster API server.

        @[JSON::Field(key: "clusterApiServerCaCertificateChain")]
        getter cluster_api_server_ca_certificate_chain : String

        # The URI of the cluster API server endpoint.

        @[JSON::Field(key: "clusterApiServerEndpointUri")]
        getter cluster_api_server_endpoint_uri : String

        # The name of the cluster.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String

        # The name of the endpoint resource.

        @[JSON::Field(key: "endpointsResourceName")]
        getter endpoints_resource_name : String

        # The namespace of the endpoint resource.

        @[JSON::Field(key: "endpointsResourceNamespace")]
        getter endpoints_resource_namespace : String

        # The role ARN for the cluster.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @cluster_api_server_ca_certificate_chain : String,
          @cluster_api_server_endpoint_uri : String,
          @cluster_name : String,
          @endpoints_resource_name : String,
          @endpoints_resource_namespace : String,
          @role_arn : String
        )
        end
      end

      # Describes the configuration of a filter.

      struct Filter
        include JSON::Serializable

        # Describes the criteria for a filter.

        @[JSON::Field(key: "criteria")]
        getter criteria : Array(Types::FilterCriterion)

        def initialize(
          @criteria : Array(Types::FilterCriterion)
        )
        end
      end

      # Describes the criteria for a filter.

      struct FilterCriterion
        include JSON::Serializable

        # The path to filter.

        @[JSON::Field(key: "path")]
        getter path : String

        # The value to filter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @path : String,
          @values : Array(String)
        )
        end
      end


      struct GetInboundExternalLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct GetInboundExternalLinkResponse
        include JSON::Serializable

        # The domain name.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # The timestamp of when the inbound external link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The configuration of flow modules.

        @[JSON::Field(key: "flowModules")]
        getter flow_modules : Array(Types::ModuleConfiguration)?


        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings?

        # The configuration of pending flow modules.

        @[JSON::Field(key: "pendingFlowModules")]
        getter pending_flow_modules : Array(Types::ModuleConfiguration)?

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timestamp of when the inbound external link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_name : String,
          @gateway_id : String,
          @link_id : String,
          @status : String,
          @attributes : Types::LinkAttributes? = nil,
          @created_at : Time? = nil,
          @flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @log_settings : Types::LinkLogSettings? = nil,
          @pending_flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct GetLinkResponse
        include JSON::Serializable

        # The timestamp of when the link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The unique identifier of the peer gateway.

        @[JSON::Field(key: "peerGatewayId")]
        getter peer_gateway_id : String

        # The status of the link.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # The direction of the link.

        @[JSON::Field(key: "direction")]
        getter direction : String?

        # The configuration of flow modules.

        @[JSON::Field(key: "flowModules")]
        getter flow_modules : Array(Types::ModuleConfiguration)?

        # Settings for the application logs.

        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings?

        # The configuration of pending flow modules.

        @[JSON::Field(key: "pendingFlowModules")]
        getter pending_flow_modules : Array(Types::ModuleConfiguration)?

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @gateway_id : String,
          @link_id : String,
          @peer_gateway_id : String,
          @status : String,
          @updated_at : Time,
          @attributes : Types::LinkAttributes? = nil,
          @direction : String? = nil,
          @flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @log_settings : Types::LinkLogSettings? = nil,
          @pending_flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetOutboundExternalLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct GetOutboundExternalLinkResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The public endpoint for the link.

        @[JSON::Field(key: "publicEndpoint")]
        getter public_endpoint : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the outbound external link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?


        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings?

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timestamp of when the outbound external link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @gateway_id : String,
          @link_id : String,
          @public_endpoint : String,
          @status : String,
          @created_at : Time? = nil,
          @log_settings : Types::LinkLogSettings? = nil,
          @tags : Hash(String, String)? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetRequesterGatewayRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_id : String
        )
        end
      end


      struct GetRequesterGatewayResponse
        include JSON::Serializable

        # The domain name of the requester gateway.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifiers of the security groups.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifiers of the subnets.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The unique identifier of the Virtual Private Cloud (VPC).

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The count of active links for the requester gateway.

        @[JSON::Field(key: "activeLinksCount")]
        getter active_links_count : Int32?

        # The timestamp of when the requester gateway was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the requester gateway.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The total count of links for the requester gateway.

        @[JSON::Field(key: "totalLinksCount")]
        getter total_links_count : Int32?

        # The timestamp of when the requester gateway was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @domain_name : String,
          @gateway_id : String,
          @security_group_ids : Array(String),
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @active_links_count : Int32? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil,
          @total_links_count : Int32? = nil,
          @updated_at : Time? = nil
        )
        end
      end


      struct GetResponderGatewayRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        def initialize(
          @gateway_id : String
        )
        end
      end


      struct GetResponderGatewayResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The networking port.

        @[JSON::Field(key: "port")]
        getter port : Int32

        # The networking protocol.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # The unique identifiers of the security groups.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifiers of the subnets.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The unique identifier of the Virtual Private Cloud (VPC).

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The count of active links for the responder gateway.

        @[JSON::Field(key: "activeLinksCount")]
        getter active_links_count : Int32?

        # The timestamp of when the responder gateway was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The description of the responder gateway.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain name of the responder gateway.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The count of inbound links for the responder gateway.

        @[JSON::Field(key: "inboundLinksCount")]
        getter inbound_links_count : Int32?

        # The configuration of the managed endpoint.

        @[JSON::Field(key: "managedEndpointConfiguration")]
        getter managed_endpoint_configuration : Types::ManagedEndpointConfiguration?

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The total count of links for the responder gateway.

        @[JSON::Field(key: "totalLinksCount")]
        getter total_links_count : Int32?

        # The configuration of the trust store.

        @[JSON::Field(key: "trustStoreConfiguration")]
        getter trust_store_configuration : Types::TrustStoreConfiguration?

        # The timestamp of when the responder gateway was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @gateway_id : String,
          @port : Int32,
          @protocol : String,
          @security_group_ids : Array(String),
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @active_links_count : Int32? = nil,
          @created_at : Time? = nil,
          @description : String? = nil,
          @domain_name : String? = nil,
          @inbound_links_count : Int32? = nil,
          @managed_endpoint_configuration : Types::ManagedEndpointConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @total_links_count : Int32? = nil,
          @trust_store_configuration : Types::TrustStoreConfiguration? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Describes the header tag for a bid action.

      struct HeaderTagAction
        include JSON::Serializable

        # The name of the bid action.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the bid action.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The request could not be completed because of an internal server error. Try your call again.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes the configuration of a link application log.

      struct LinkApplicationLogConfiguration
        include JSON::Serializable

        # Describes a link application log sample.

        @[JSON::Field(key: "sampling")]
        getter sampling : Types::LinkApplicationLogSampling

        def initialize(
          @sampling : Types::LinkApplicationLogSampling
        )
        end
      end

      # Describes a link application log sample.

      struct LinkApplicationLogSampling
        include JSON::Serializable

        # An error log entry.

        @[JSON::Field(key: "errorLog")]
        getter error_log : Float64

        # A filter log entry.

        @[JSON::Field(key: "filterLog")]
        getter filter_log : Float64

        def initialize(
          @error_log : Float64,
          @filter_log : Float64
        )
        end
      end

      # Describes the attributes of a link.

      struct LinkAttributes
        include JSON::Serializable

        # The customer-provided unique identifier of the link.

        @[JSON::Field(key: "customerProvidedId")]
        getter customer_provided_id : String?

        # Describes the masking for HTTP error codes.

        @[JSON::Field(key: "responderErrorMasking")]
        getter responder_error_masking : Array(Types::ResponderErrorMaskingForHttpCode)?

        def initialize(
          @customer_provided_id : String? = nil,
          @responder_error_masking : Array(Types::ResponderErrorMaskingForHttpCode)? = nil
        )
        end
      end

      # Describes the settings for a link log.

      struct LinkLogSettings
        include JSON::Serializable

        # Describes the configuration of a link application log.

        @[JSON::Field(key: "applicationLogs")]
        getter application_logs : Types::LinkApplicationLogConfiguration

        def initialize(
          @application_logs : Types::LinkApplicationLogConfiguration
        )
        end
      end


      struct ListLinksRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateway_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLinksResponse
        include JSON::Serializable

        # Information about created links.

        @[JSON::Field(key: "links")]
        getter links : Array(Types::ListLinksResponseStructure)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @links : Array(Types::ListLinksResponseStructure)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Describes a link.

      struct ListLinksResponseStructure
        include JSON::Serializable

        # The timestamp of when the link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The unique identifier of the peer gateway.

        @[JSON::Field(key: "peerGatewayId")]
        getter peer_gateway_id : String

        # The status of the link.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Describes attributes of a link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # The direction of the link.

        @[JSON::Field(key: "direction")]
        getter direction : String?

        # Describes the configuration of flow modules.

        @[JSON::Field(key: "flowModules")]
        getter flow_modules : Array(Types::ModuleConfiguration)?

        # Describes the configuration of pending flow modules.

        @[JSON::Field(key: "pendingFlowModules")]
        getter pending_flow_modules : Array(Types::ModuleConfiguration)?

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @gateway_id : String,
          @link_id : String,
          @peer_gateway_id : String,
          @status : String,
          @updated_at : Time,
          @attributes : Types::LinkAttributes? = nil,
          @direction : String? = nil,
          @flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @pending_flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct ListRequesterGatewaysRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRequesterGatewaysResponse
        include JSON::Serializable

        # The unique identifier of the gateways.

        @[JSON::Field(key: "gatewayIds")]
        getter gateway_ids : Array(String)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateway_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResponderGatewaysRequest
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. This is only an upper limit. The actual number of results returned per call might
        # be fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListResponderGatewaysResponse
        include JSON::Serializable

        # The unique identifier of the gateways.

        @[JSON::Field(key: "gatewayIds")]
        getter gateway_ids : Array(String)?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error .

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @gateway_ids : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which you want to retrieve tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of the key-value pairs for the tag or tags assigned to the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes the configuration of a managed endpoint.

      struct ManagedEndpointConfiguration
        include JSON::Serializable

        # Describes the configuration of an auto scaling group.

        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Types::AutoScalingGroupsConfiguration?

        # Describes the configuration of an Amazon Elastic Kubernetes Service endpoint.

        @[JSON::Field(key: "eksEndpoints")]
        getter eks_endpoints : Types::EksEndpointsConfiguration?

        def initialize(
          @auto_scaling_groups : Types::AutoScalingGroupsConfiguration? = nil,
          @eks_endpoints : Types::EksEndpointsConfiguration? = nil
        )
        end
      end

      # Describes the configuration of a module.

      struct ModuleConfiguration
        include JSON::Serializable

        # The name of the module.

        @[JSON::Field(key: "name")]
        getter name : String

        # The dependencies of the module.

        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(String)?

        # Describes the parameters of a module.

        @[JSON::Field(key: "moduleParameters")]
        getter module_parameters : Types::ModuleParameters?

        # The version of the module.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String,
          @depends_on : Array(String)? = nil,
          @module_parameters : Types::ModuleParameters? = nil,
          @version : String? = nil
        )
        end
      end

      # Describes the parameters of a module.

      struct ModuleParameters
        include JSON::Serializable

        # Describes the parameters of a no bid module.

        @[JSON::Field(key: "noBid")]
        getter no_bid : Types::NoBidModuleParameters?

        # Describes the parameters of an open RTB attribute module.

        @[JSON::Field(key: "openRtbAttribute")]
        getter open_rtb_attribute : Types::OpenRtbAttributeModuleParameters?

        # Describes the parameters of a rate limit.

        @[JSON::Field(key: "rateLimiter")]
        getter rate_limiter : Types::RateLimiterModuleParameters?

        def initialize(
          @no_bid : Types::NoBidModuleParameters? = nil,
          @open_rtb_attribute : Types::OpenRtbAttributeModuleParameters? = nil,
          @rate_limiter : Types::RateLimiterModuleParameters? = nil
        )
        end
      end

      # Describes a no bid action.

      struct NoBidAction
        include JSON::Serializable

        # The reason code for the no bid action.

        @[JSON::Field(key: "noBidReasonCode")]
        getter no_bid_reason_code : Int32?

        def initialize(
          @no_bid_reason_code : Int32? = nil
        )
        end
      end

      # Describes the parameters of a no bid module.

      struct NoBidModuleParameters
        include JSON::Serializable

        # The pass through percentage.

        @[JSON::Field(key: "passThroughPercentage")]
        getter pass_through_percentage : Float64?

        # The reason description.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The reason code.

        @[JSON::Field(key: "reasonCode")]
        getter reason_code : Int32?

        def initialize(
          @pass_through_percentage : Float64? = nil,
          @reason : String? = nil,
          @reason_code : Int32? = nil
        )
        end
      end

      # Describes the parameters of an open RTB attribute module.

      struct OpenRtbAttributeModuleParameters
        include JSON::Serializable

        # Describes a bid action.

        @[JSON::Field(key: "action")]
        getter action : Types::Action

        # Describes the configuration of a filter.

        @[JSON::Field(key: "filterConfiguration")]
        getter filter_configuration : Array(Types::Filter)

        # The filter type.

        @[JSON::Field(key: "filterType")]
        getter filter_type : String

        # The hold back percentage.

        @[JSON::Field(key: "holdbackPercentage")]
        getter holdback_percentage : Float64

        def initialize(
          @action : Types::Action,
          @filter_configuration : Array(Types::Filter),
          @filter_type : String,
          @holdback_percentage : Float64
        )
        end
      end

      # Describes the parameters of a rate limit.

      struct RateLimiterModuleParameters
        include JSON::Serializable

        # The transactions per second rate limit.

        @[JSON::Field(key: "tps")]
        getter tps : Float64?

        def initialize(
          @tps : Float64? = nil
        )
        end
      end


      struct RejectLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        def initialize(
          @gateway_id : String,
          @link_id : String
        )
        end
      end


      struct RejectLinkResponse
        include JSON::Serializable

        # The timestamp of when the link was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The unique identifier of the peer gateway.

        @[JSON::Field(key: "peerGatewayId")]
        getter peer_gateway_id : String

        # The status of the link.

        @[JSON::Field(key: "status")]
        getter status : String

        # The timestamp of when the link was updated.

        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # Attributes of the link.

        @[JSON::Field(key: "attributes")]
        getter attributes : Types::LinkAttributes?

        # The direction of the link.

        @[JSON::Field(key: "direction")]
        getter direction : String?

        # The configuration of flow modules.

        @[JSON::Field(key: "flowModules")]
        getter flow_modules : Array(Types::ModuleConfiguration)?

        # The configuration of pending flow modules.

        @[JSON::Field(key: "pendingFlowModules")]
        getter pending_flow_modules : Array(Types::ModuleConfiguration)?

        def initialize(
          @created_at : Time,
          @gateway_id : String,
          @link_id : String,
          @peer_gateway_id : String,
          @status : String,
          @updated_at : Time,
          @attributes : Types::LinkAttributes? = nil,
          @direction : String? = nil,
          @flow_modules : Array(Types::ModuleConfiguration)? = nil,
          @pending_flow_modules : Array(Types::ModuleConfiguration)? = nil
        )
        end
      end

      # The request could not be completed because the resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes the masking for HTTP error codes.

      struct ResponderErrorMaskingForHttpCode
        include JSON::Serializable

        # The action for the error..

        @[JSON::Field(key: "action")]
        getter action : String

        # The HTTP error code.

        @[JSON::Field(key: "httpCode")]
        getter http_code : String

        # The error log type.

        @[JSON::Field(key: "loggingTypes")]
        getter logging_types : Array(String)

        # The percentage of response logging.

        @[JSON::Field(key: "responseLoggingPercentage")]
        getter response_logging_percentage : Float64?

        def initialize(
          @action : String,
          @http_code : String,
          @logging_types : Array(String),
          @response_logging_percentage : Float64? = nil
        )
        end
      end

      # The request could not be completed because you exceeded a service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to tag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # A map of the key-value pairs of the tag or tags to assign to the resource.

        @[JSON::Field(key: "tags")]
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

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Describes the configuration of a trust store.

      struct TrustStoreConfiguration
        include JSON::Serializable

        # The certificate authority certificate.

        @[JSON::Field(key: "certificateAuthorityCertificates")]
        getter certificate_authority_certificates : Array(String)

        def initialize(
          @certificate_authority_certificates : Array(String)
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to untag.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the key-value pairs for the tag or tags you want to remove from the specified resource.

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


      struct UpdateLinkModuleFlowRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The configuration of a module.

        @[JSON::Field(key: "modules")]
        getter modules : Array(Types::ModuleConfiguration)

        def initialize(
          @client_token : String,
          @gateway_id : String,
          @link_id : String,
          @modules : Array(Types::ModuleConfiguration)
        )
        end
      end


      struct UpdateLinkModuleFlowResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @link_id : String,
          @status : String
        )
        end
      end


      struct UpdateLinkRequest
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # Settings for the application logs.

        @[JSON::Field(key: "logSettings")]
        getter log_settings : Types::LinkLogSettings?

        def initialize(
          @gateway_id : String,
          @link_id : String,
          @log_settings : Types::LinkLogSettings? = nil
        )
        end
      end


      struct UpdateLinkResponse
        include JSON::Serializable

        # The unique identifier of the link.

        @[JSON::Field(key: "linkId")]
        getter link_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @link_id : String,
          @status : String
        )
        end
      end


      struct UpdateRequesterGatewayRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # An optional description for the requester gateway.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @client_token : String,
          @gateway_id : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateRequesterGatewayResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @status : String
        )
        end
      end


      struct UpdateResponderGatewayRequest
        include JSON::Serializable

        # The unique client token.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The networking port to use.

        @[JSON::Field(key: "port")]
        getter port : Int32

        # The networking protocol to use.

        @[JSON::Field(key: "protocol")]
        getter protocol : String

        # An optional description for the responder gateway.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The domain name for the responder gateway.

        @[JSON::Field(key: "domainName")]
        getter domain_name : String?

        # The configuration for the managed endpoint.

        @[JSON::Field(key: "managedEndpointConfiguration")]
        getter managed_endpoint_configuration : Types::ManagedEndpointConfiguration?

        # The configuration of the trust store.

        @[JSON::Field(key: "trustStoreConfiguration")]
        getter trust_store_configuration : Types::TrustStoreConfiguration?

        def initialize(
          @client_token : String,
          @gateway_id : String,
          @port : Int32,
          @protocol : String,
          @description : String? = nil,
          @domain_name : String? = nil,
          @managed_endpoint_configuration : Types::ManagedEndpointConfiguration? = nil,
          @trust_store_configuration : Types::TrustStoreConfiguration? = nil
        )
        end
      end


      struct UpdateResponderGatewayResponse
        include JSON::Serializable

        # The unique identifier of the gateway.

        @[JSON::Field(key: "gatewayId")]
        getter gateway_id : String

        # The status of the request.

        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @gateway_id : String,
          @status : String
        )
        end
      end

      # The request could not be completed because it fails satisfy the constraints specified by the
      # service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
