module Aws
  module DirectConnect
    module Model
      API_VERSION = "2012-10-25"
      TARGET_PREFIX = "OvertureService"
      SIGNING_NAME = "directconnect"
      ENDPOINT_PREFIX = "directconnect"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://directconnect-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://directconnect-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://directconnect.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://directconnect.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSAL = OperationModel.new(
        name: "AcceptDirectConnectGatewayAssociationProposal",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_CONNECTION_ON_INTERCONNECT = OperationModel.new(
        name: "AllocateConnectionOnInterconnect",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_HOSTED_CONNECTION = OperationModel.new(
        name: "AllocateHostedConnection",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_PRIVATE_VIRTUAL_INTERFACE = OperationModel.new(
        name: "AllocatePrivateVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_PUBLIC_VIRTUAL_INTERFACE = OperationModel.new(
        name: "AllocatePublicVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_TRANSIT_VIRTUAL_INTERFACE = OperationModel.new(
        name: "AllocateTransitVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_CONNECTION_WITH_LAG = OperationModel.new(
        name: "AssociateConnectionWithLag",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_HOSTED_CONNECTION = OperationModel.new(
        name: "AssociateHostedConnection",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_MAC_SEC_KEY = OperationModel.new(
        name: "AssociateMacSecKey",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_VIRTUAL_INTERFACE = OperationModel.new(
        name: "AssociateVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_CONNECTION = OperationModel.new(
        name: "ConfirmConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_CUSTOMER_AGREEMENT = OperationModel.new(
        name: "ConfirmCustomerAgreement",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_PRIVATE_VIRTUAL_INTERFACE = OperationModel.new(
        name: "ConfirmPrivateVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_PUBLIC_VIRTUAL_INTERFACE = OperationModel.new(
        name: "ConfirmPublicVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_TRANSIT_VIRTUAL_INTERFACE = OperationModel.new(
        name: "ConfirmTransitVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_BGP_PEER = OperationModel.new(
        name: "CreateBGPPeer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DIRECT_CONNECT_GATEWAY = OperationModel.new(
        name: "CreateDirectConnectGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DIRECT_CONNECT_GATEWAY_ASSOCIATION = OperationModel.new(
        name: "CreateDirectConnectGatewayAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSAL = OperationModel.new(
        name: "CreateDirectConnectGatewayAssociationProposal",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTERCONNECT = OperationModel.new(
        name: "CreateInterconnect",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LAG = OperationModel.new(
        name: "CreateLag",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PRIVATE_VIRTUAL_INTERFACE = OperationModel.new(
        name: "CreatePrivateVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PUBLIC_VIRTUAL_INTERFACE = OperationModel.new(
        name: "CreatePublicVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_VIRTUAL_INTERFACE = OperationModel.new(
        name: "CreateTransitVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_BGP_PEER = OperationModel.new(
        name: "DeleteBGPPeer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DIRECT_CONNECT_GATEWAY = OperationModel.new(
        name: "DeleteDirectConnectGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DIRECT_CONNECT_GATEWAY_ASSOCIATION = OperationModel.new(
        name: "DeleteDirectConnectGatewayAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSAL = OperationModel.new(
        name: "DeleteDirectConnectGatewayAssociationProposal",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTERCONNECT = OperationModel.new(
        name: "DeleteInterconnect",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LAG = OperationModel.new(
        name: "DeleteLag",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VIRTUAL_INTERFACE = OperationModel.new(
        name: "DeleteVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTION_LOA = OperationModel.new(
        name: "DescribeConnectionLoa",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTIONS = OperationModel.new(
        name: "DescribeConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONNECTIONS_ON_INTERCONNECT = OperationModel.new(
        name: "DescribeConnectionsOnInterconnect",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOMER_METADATA = OperationModel.new(
        name: "DescribeCustomerMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECT_CONNECT_GATEWAY_ASSOCIATION_PROPOSALS = OperationModel.new(
        name: "DescribeDirectConnectGatewayAssociationProposals",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECT_CONNECT_GATEWAY_ASSOCIATIONS = OperationModel.new(
        name: "DescribeDirectConnectGatewayAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECT_CONNECT_GATEWAY_ATTACHMENTS = OperationModel.new(
        name: "DescribeDirectConnectGatewayAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DIRECT_CONNECT_GATEWAYS = OperationModel.new(
        name: "DescribeDirectConnectGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HOSTED_CONNECTIONS = OperationModel.new(
        name: "DescribeHostedConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INTERCONNECT_LOA = OperationModel.new(
        name: "DescribeInterconnectLoa",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INTERCONNECTS = OperationModel.new(
        name: "DescribeInterconnects",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LAGS = OperationModel.new(
        name: "DescribeLags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOA = OperationModel.new(
        name: "DescribeLoa",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCATIONS = OperationModel.new(
        name: "DescribeLocations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ROUTER_CONFIGURATION = OperationModel.new(
        name: "DescribeRouterConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VIRTUAL_GATEWAYS = OperationModel.new(
        name: "DescribeVirtualGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VIRTUAL_INTERFACES = OperationModel.new(
        name: "DescribeVirtualInterfaces",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CONNECTION_FROM_LAG = OperationModel.new(
        name: "DisassociateConnectionFromLag",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_MAC_SEC_KEY = OperationModel.new(
        name: "DisassociateMacSecKey",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VIRTUAL_INTERFACE_TEST_HISTORY = OperationModel.new(
        name: "ListVirtualInterfaceTestHistory",
        http_method: "POST",
        request_uri: "/"
      )

      START_BGP_FAILOVER_TEST = OperationModel.new(
        name: "StartBgpFailoverTest",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_BGP_FAILOVER_TEST = OperationModel.new(
        name: "StopBgpFailoverTest",
        http_method: "POST",
        request_uri: "/"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CONNECTION = OperationModel.new(
        name: "UpdateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DIRECT_CONNECT_GATEWAY = OperationModel.new(
        name: "UpdateDirectConnectGateway",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_DIRECT_CONNECT_GATEWAY_ASSOCIATION = OperationModel.new(
        name: "UpdateDirectConnectGatewayAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_LAG = OperationModel.new(
        name: "UpdateLag",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_VIRTUAL_INTERFACE_ATTRIBUTES = OperationModel.new(
        name: "UpdateVirtualInterfaceAttributes",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
