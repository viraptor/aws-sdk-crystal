module Aws
  module NetworkManager
    module Model
      API_VERSION = "2019-07-05"
      TARGET_PREFIX = ""
      SIGNING_NAME = "networkmanager"
      ENDPOINT_PREFIX = "networkmanager"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://networkmanager.us-west-2.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-west-2"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://networkmanager.us-west-2.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-west-2"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://networkmanager-fips.us-west-2.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-west-2"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://networkmanager-fips.us-west-2.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-west-2"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"endpoint":{"url":"https://networkmanager.us-gov-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]},{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"endpoint":{"url":"https://networkmanager.us-gov-west-1.api.aws","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"us-gov-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://networkmanager-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},false]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://networkmanager-fips.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},false]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://networkmanager.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dualStackDnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://networkmanager.{PartitionResult#implicitGlobalRegion}.{PartitionResult#dnsSuffix}","properties":{"authSchemes":[{"name":"sigv4","signingRegion":"{PartitionResult#implicitGlobalRegion}"}]},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ATTACHMENT = OperationModel.new(
        name: "AcceptAttachment",
        http_method: "POST",
        request_uri: "/attachments/{attachmentId}/accept"
      )

      ASSOCIATE_CONNECT_PEER = OperationModel.new(
        name: "AssociateConnectPeer",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/connect-peer-associations"
      )

      ASSOCIATE_CUSTOMER_GATEWAY = OperationModel.new(
        name: "AssociateCustomerGateway",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/customer-gateway-associations"
      )

      ASSOCIATE_LINK = OperationModel.new(
        name: "AssociateLink",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/link-associations"
      )

      ASSOCIATE_TRANSIT_GATEWAY_CONNECT_PEER = OperationModel.new(
        name: "AssociateTransitGatewayConnectPeer",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/transit-gateway-connect-peer-associations"
      )

      CREATE_CONNECT_ATTACHMENT = OperationModel.new(
        name: "CreateConnectAttachment",
        http_method: "POST",
        request_uri: "/connect-attachments"
      )

      CREATE_CONNECT_PEER = OperationModel.new(
        name: "CreateConnectPeer",
        http_method: "POST",
        request_uri: "/connect-peers"
      )

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/connections"
      )

      CREATE_CORE_NETWORK = OperationModel.new(
        name: "CreateCoreNetwork",
        http_method: "POST",
        request_uri: "/core-networks"
      )

      CREATE_CORE_NETWORK_PREFIX_LIST_ASSOCIATION = OperationModel.new(
        name: "CreateCoreNetworkPrefixListAssociation",
        http_method: "POST",
        request_uri: "/prefix-list"
      )

      CREATE_DEVICE = OperationModel.new(
        name: "CreateDevice",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/devices"
      )

      CREATE_DIRECT_CONNECT_GATEWAY_ATTACHMENT = OperationModel.new(
        name: "CreateDirectConnectGatewayAttachment",
        http_method: "POST",
        request_uri: "/direct-connect-gateway-attachments"
      )

      CREATE_GLOBAL_NETWORK = OperationModel.new(
        name: "CreateGlobalNetwork",
        http_method: "POST",
        request_uri: "/global-networks"
      )

      CREATE_LINK = OperationModel.new(
        name: "CreateLink",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/links"
      )

      CREATE_SITE = OperationModel.new(
        name: "CreateSite",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/sites"
      )

      CREATE_SITE_TO_SITE_VPN_ATTACHMENT = OperationModel.new(
        name: "CreateSiteToSiteVpnAttachment",
        http_method: "POST",
        request_uri: "/site-to-site-vpn-attachments"
      )

      CREATE_TRANSIT_GATEWAY_PEERING = OperationModel.new(
        name: "CreateTransitGatewayPeering",
        http_method: "POST",
        request_uri: "/transit-gateway-peerings"
      )

      CREATE_TRANSIT_GATEWAY_ROUTE_TABLE_ATTACHMENT = OperationModel.new(
        name: "CreateTransitGatewayRouteTableAttachment",
        http_method: "POST",
        request_uri: "/transit-gateway-route-table-attachments"
      )

      CREATE_VPC_ATTACHMENT = OperationModel.new(
        name: "CreateVpcAttachment",
        http_method: "POST",
        request_uri: "/vpc-attachments"
      )

      DELETE_ATTACHMENT = OperationModel.new(
        name: "DeleteAttachment",
        http_method: "DELETE",
        request_uri: "/attachments/{attachmentId}"
      )

      DELETE_CONNECT_PEER = OperationModel.new(
        name: "DeleteConnectPeer",
        http_method: "DELETE",
        request_uri: "/connect-peers/{connectPeerId}"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/connections/{connectionId}"
      )

      DELETE_CORE_NETWORK = OperationModel.new(
        name: "DeleteCoreNetwork",
        http_method: "DELETE",
        request_uri: "/core-networks/{coreNetworkId}"
      )

      DELETE_CORE_NETWORK_POLICY_VERSION = OperationModel.new(
        name: "DeleteCoreNetworkPolicyVersion",
        http_method: "DELETE",
        request_uri: "/core-networks/{coreNetworkId}/core-network-policy-versions/{policyVersionId}"
      )

      DELETE_CORE_NETWORK_PREFIX_LIST_ASSOCIATION = OperationModel.new(
        name: "DeleteCoreNetworkPrefixListAssociation",
        http_method: "DELETE",
        request_uri: "/prefix-list/{prefixListArn}/core-network/{coreNetworkId}"
      )

      DELETE_DEVICE = OperationModel.new(
        name: "DeleteDevice",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/devices/{deviceId}"
      )

      DELETE_GLOBAL_NETWORK = OperationModel.new(
        name: "DeleteGlobalNetwork",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}"
      )

      DELETE_LINK = OperationModel.new(
        name: "DeleteLink",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/links/{linkId}"
      )

      DELETE_PEERING = OperationModel.new(
        name: "DeletePeering",
        http_method: "DELETE",
        request_uri: "/peerings/{peeringId}"
      )

      DELETE_RESOURCE_POLICY = OperationModel.new(
        name: "DeleteResourcePolicy",
        http_method: "DELETE",
        request_uri: "/resource-policy/{resourceArn}"
      )

      DELETE_SITE = OperationModel.new(
        name: "DeleteSite",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/sites/{siteId}"
      )

      DEREGISTER_TRANSIT_GATEWAY = OperationModel.new(
        name: "DeregisterTransitGateway",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/transit-gateway-registrations/{transitGatewayArn}"
      )

      DESCRIBE_GLOBAL_NETWORKS = OperationModel.new(
        name: "DescribeGlobalNetworks",
        http_method: "GET",
        request_uri: "/global-networks"
      )

      DISASSOCIATE_CONNECT_PEER = OperationModel.new(
        name: "DisassociateConnectPeer",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/connect-peer-associations/{connectPeerId}"
      )

      DISASSOCIATE_CUSTOMER_GATEWAY = OperationModel.new(
        name: "DisassociateCustomerGateway",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/customer-gateway-associations/{customerGatewayArn}"
      )

      DISASSOCIATE_LINK = OperationModel.new(
        name: "DisassociateLink",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/link-associations"
      )

      DISASSOCIATE_TRANSIT_GATEWAY_CONNECT_PEER = OperationModel.new(
        name: "DisassociateTransitGatewayConnectPeer",
        http_method: "DELETE",
        request_uri: "/global-networks/{globalNetworkId}/transit-gateway-connect-peer-associations/{transitGatewayConnectPeerArn}"
      )

      EXECUTE_CORE_NETWORK_CHANGE_SET = OperationModel.new(
        name: "ExecuteCoreNetworkChangeSet",
        http_method: "POST",
        request_uri: "/core-networks/{coreNetworkId}/core-network-change-sets/{policyVersionId}/execute"
      )

      GET_CONNECT_ATTACHMENT = OperationModel.new(
        name: "GetConnectAttachment",
        http_method: "GET",
        request_uri: "/connect-attachments/{attachmentId}"
      )

      GET_CONNECT_PEER = OperationModel.new(
        name: "GetConnectPeer",
        http_method: "GET",
        request_uri: "/connect-peers/{connectPeerId}"
      )

      GET_CONNECT_PEER_ASSOCIATIONS = OperationModel.new(
        name: "GetConnectPeerAssociations",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/connect-peer-associations"
      )

      GET_CONNECTIONS = OperationModel.new(
        name: "GetConnections",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/connections"
      )

      GET_CORE_NETWORK = OperationModel.new(
        name: "GetCoreNetwork",
        http_method: "GET",
        request_uri: "/core-networks/{coreNetworkId}"
      )

      GET_CORE_NETWORK_CHANGE_EVENTS = OperationModel.new(
        name: "GetCoreNetworkChangeEvents",
        http_method: "GET",
        request_uri: "/core-networks/{coreNetworkId}/core-network-change-events/{policyVersionId}"
      )

      GET_CORE_NETWORK_CHANGE_SET = OperationModel.new(
        name: "GetCoreNetworkChangeSet",
        http_method: "GET",
        request_uri: "/core-networks/{coreNetworkId}/core-network-change-sets/{policyVersionId}"
      )

      GET_CORE_NETWORK_POLICY = OperationModel.new(
        name: "GetCoreNetworkPolicy",
        http_method: "GET",
        request_uri: "/core-networks/{coreNetworkId}/core-network-policy"
      )

      GET_CUSTOMER_GATEWAY_ASSOCIATIONS = OperationModel.new(
        name: "GetCustomerGatewayAssociations",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/customer-gateway-associations"
      )

      GET_DEVICES = OperationModel.new(
        name: "GetDevices",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/devices"
      )

      GET_DIRECT_CONNECT_GATEWAY_ATTACHMENT = OperationModel.new(
        name: "GetDirectConnectGatewayAttachment",
        http_method: "GET",
        request_uri: "/direct-connect-gateway-attachments/{attachmentId}"
      )

      GET_LINK_ASSOCIATIONS = OperationModel.new(
        name: "GetLinkAssociations",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/link-associations"
      )

      GET_LINKS = OperationModel.new(
        name: "GetLinks",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/links"
      )

      GET_NETWORK_RESOURCE_COUNTS = OperationModel.new(
        name: "GetNetworkResourceCounts",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/network-resource-count"
      )

      GET_NETWORK_RESOURCE_RELATIONSHIPS = OperationModel.new(
        name: "GetNetworkResourceRelationships",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/network-resource-relationships"
      )

      GET_NETWORK_RESOURCES = OperationModel.new(
        name: "GetNetworkResources",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/network-resources"
      )

      GET_NETWORK_ROUTES = OperationModel.new(
        name: "GetNetworkRoutes",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/network-routes"
      )

      GET_NETWORK_TELEMETRY = OperationModel.new(
        name: "GetNetworkTelemetry",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/network-telemetry"
      )

      GET_RESOURCE_POLICY = OperationModel.new(
        name: "GetResourcePolicy",
        http_method: "GET",
        request_uri: "/resource-policy/{resourceArn}"
      )

      GET_ROUTE_ANALYSIS = OperationModel.new(
        name: "GetRouteAnalysis",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/route-analyses/{routeAnalysisId}"
      )

      GET_SITE_TO_SITE_VPN_ATTACHMENT = OperationModel.new(
        name: "GetSiteToSiteVpnAttachment",
        http_method: "GET",
        request_uri: "/site-to-site-vpn-attachments/{attachmentId}"
      )

      GET_SITES = OperationModel.new(
        name: "GetSites",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/sites"
      )

      GET_TRANSIT_GATEWAY_CONNECT_PEER_ASSOCIATIONS = OperationModel.new(
        name: "GetTransitGatewayConnectPeerAssociations",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/transit-gateway-connect-peer-associations"
      )

      GET_TRANSIT_GATEWAY_PEERING = OperationModel.new(
        name: "GetTransitGatewayPeering",
        http_method: "GET",
        request_uri: "/transit-gateway-peerings/{peeringId}"
      )

      GET_TRANSIT_GATEWAY_REGISTRATIONS = OperationModel.new(
        name: "GetTransitGatewayRegistrations",
        http_method: "GET",
        request_uri: "/global-networks/{globalNetworkId}/transit-gateway-registrations"
      )

      GET_TRANSIT_GATEWAY_ROUTE_TABLE_ATTACHMENT = OperationModel.new(
        name: "GetTransitGatewayRouteTableAttachment",
        http_method: "GET",
        request_uri: "/transit-gateway-route-table-attachments/{attachmentId}"
      )

      GET_VPC_ATTACHMENT = OperationModel.new(
        name: "GetVpcAttachment",
        http_method: "GET",
        request_uri: "/vpc-attachments/{attachmentId}"
      )

      LIST_ATTACHMENT_ROUTING_POLICY_ASSOCIATIONS = OperationModel.new(
        name: "ListAttachmentRoutingPolicyAssociations",
        http_method: "GET",
        request_uri: "/routing-policy-label/core-network/{coreNetworkId}"
      )

      LIST_ATTACHMENTS = OperationModel.new(
        name: "ListAttachments",
        http_method: "GET",
        request_uri: "/attachments"
      )

      LIST_CONNECT_PEERS = OperationModel.new(
        name: "ListConnectPeers",
        http_method: "GET",
        request_uri: "/connect-peers"
      )

      LIST_CORE_NETWORK_POLICY_VERSIONS = OperationModel.new(
        name: "ListCoreNetworkPolicyVersions",
        http_method: "GET",
        request_uri: "/core-networks/{coreNetworkId}/core-network-policy-versions"
      )

      LIST_CORE_NETWORK_PREFIX_LIST_ASSOCIATIONS = OperationModel.new(
        name: "ListCoreNetworkPrefixListAssociations",
        http_method: "GET",
        request_uri: "/prefix-list/core-network/{coreNetworkId}"
      )

      LIST_CORE_NETWORK_ROUTING_INFORMATION = OperationModel.new(
        name: "ListCoreNetworkRoutingInformation",
        http_method: "POST",
        request_uri: "/core-networks/{coreNetworkId}/core-network-routing-information"
      )

      LIST_CORE_NETWORKS = OperationModel.new(
        name: "ListCoreNetworks",
        http_method: "GET",
        request_uri: "/core-networks"
      )

      LIST_ORGANIZATION_SERVICE_ACCESS_STATUS = OperationModel.new(
        name: "ListOrganizationServiceAccessStatus",
        http_method: "GET",
        request_uri: "/organizations/service-access"
      )

      LIST_PEERINGS = OperationModel.new(
        name: "ListPeerings",
        http_method: "GET",
        request_uri: "/peerings"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_ATTACHMENT_ROUTING_POLICY_LABEL = OperationModel.new(
        name: "PutAttachmentRoutingPolicyLabel",
        http_method: "POST",
        request_uri: "/routing-policy-label"
      )

      PUT_CORE_NETWORK_POLICY = OperationModel.new(
        name: "PutCoreNetworkPolicy",
        http_method: "POST",
        request_uri: "/core-networks/{coreNetworkId}/core-network-policy"
      )

      PUT_RESOURCE_POLICY = OperationModel.new(
        name: "PutResourcePolicy",
        http_method: "POST",
        request_uri: "/resource-policy/{resourceArn}"
      )

      REGISTER_TRANSIT_GATEWAY = OperationModel.new(
        name: "RegisterTransitGateway",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/transit-gateway-registrations"
      )

      REJECT_ATTACHMENT = OperationModel.new(
        name: "RejectAttachment",
        http_method: "POST",
        request_uri: "/attachments/{attachmentId}/reject"
      )

      REMOVE_ATTACHMENT_ROUTING_POLICY_LABEL = OperationModel.new(
        name: "RemoveAttachmentRoutingPolicyLabel",
        http_method: "DELETE",
        request_uri: "/routing-policy-label/core-network/{coreNetworkId}/attachment/{attachmentId}"
      )

      RESTORE_CORE_NETWORK_POLICY_VERSION = OperationModel.new(
        name: "RestoreCoreNetworkPolicyVersion",
        http_method: "POST",
        request_uri: "/core-networks/{coreNetworkId}/core-network-policy-versions/{policyVersionId}/restore"
      )

      START_ORGANIZATION_SERVICE_ACCESS_UPDATE = OperationModel.new(
        name: "StartOrganizationServiceAccessUpdate",
        http_method: "POST",
        request_uri: "/organizations/service-access"
      )

      START_ROUTE_ANALYSIS = OperationModel.new(
        name: "StartRouteAnalysis",
        http_method: "POST",
        request_uri: "/global-networks/{globalNetworkId}/route-analyses"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{resourceArn}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{resourceArn}"
      )

      UPDATE_CONNECTION = OperationModel.new(
        name: "UpdateConnection",
        http_method: "PATCH",
        request_uri: "/global-networks/{globalNetworkId}/connections/{connectionId}"
      )

      UPDATE_CORE_NETWORK = OperationModel.new(
        name: "UpdateCoreNetwork",
        http_method: "PATCH",
        request_uri: "/core-networks/{coreNetworkId}"
      )

      UPDATE_DEVICE = OperationModel.new(
        name: "UpdateDevice",
        http_method: "PATCH",
        request_uri: "/global-networks/{globalNetworkId}/devices/{deviceId}"
      )

      UPDATE_DIRECT_CONNECT_GATEWAY_ATTACHMENT = OperationModel.new(
        name: "UpdateDirectConnectGatewayAttachment",
        http_method: "PATCH",
        request_uri: "/direct-connect-gateway-attachments/{attachmentId}"
      )

      UPDATE_GLOBAL_NETWORK = OperationModel.new(
        name: "UpdateGlobalNetwork",
        http_method: "PATCH",
        request_uri: "/global-networks/{globalNetworkId}"
      )

      UPDATE_LINK = OperationModel.new(
        name: "UpdateLink",
        http_method: "PATCH",
        request_uri: "/global-networks/{globalNetworkId}/links/{linkId}"
      )

      UPDATE_NETWORK_RESOURCE_METADATA = OperationModel.new(
        name: "UpdateNetworkResourceMetadata",
        http_method: "PATCH",
        request_uri: "/global-networks/{globalNetworkId}/network-resources/{resourceArn}/metadata"
      )

      UPDATE_SITE = OperationModel.new(
        name: "UpdateSite",
        http_method: "PATCH",
        request_uri: "/global-networks/{globalNetworkId}/sites/{siteId}"
      )

      UPDATE_VPC_ATTACHMENT = OperationModel.new(
        name: "UpdateVpcAttachment",
        http_method: "PATCH",
        request_uri: "/vpc-attachments/{attachmentId}"
      )
    end
  end
end
