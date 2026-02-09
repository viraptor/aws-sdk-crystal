module Aws
  module EC2
    module Model
      API_VERSION = "2016-11-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ec2"
      ENDPOINT_PREFIX = "ec2"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ec2-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://ec2.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://ec2-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ec2.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ec2.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_ADDRESS_TRANSFER = OperationModel.new(
        name: "AcceptAddressTransfer",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_CAPACITY_RESERVATION_BILLING_OWNERSHIP = OperationModel.new(
        name: "AcceptCapacityReservationBillingOwnership",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_RESERVED_INSTANCES_EXCHANGE_QUOTE = OperationModel.new(
        name: "AcceptReservedInstancesExchangeQuote",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_TRANSIT_GATEWAY_MULTICAST_DOMAIN_ASSOCIATIONS = OperationModel.new(
        name: "AcceptTransitGatewayMulticastDomainAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_TRANSIT_GATEWAY_PEERING_ATTACHMENT = OperationModel.new(
        name: "AcceptTransitGatewayPeeringAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_TRANSIT_GATEWAY_VPC_ATTACHMENT = OperationModel.new(
        name: "AcceptTransitGatewayVpcAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_VPC_ENDPOINT_CONNECTIONS = OperationModel.new(
        name: "AcceptVpcEndpointConnections",
        http_method: "POST",
        request_uri: "/"
      )

      ACCEPT_VPC_PEERING_CONNECTION = OperationModel.new(
        name: "AcceptVpcPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      ADVERTISE_BYOIP_CIDR = OperationModel.new(
        name: "AdvertiseByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_ADDRESS = OperationModel.new(
        name: "AllocateAddress",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_HOSTS = OperationModel.new(
        name: "AllocateHosts",
        http_method: "POST",
        request_uri: "/"
      )

      ALLOCATE_IPAM_POOL_CIDR = OperationModel.new(
        name: "AllocateIpamPoolCidr",
        http_method: "POST",
        request_uri: "/"
      )

      APPLY_SECURITY_GROUPS_TO_CLIENT_VPN_TARGET_NETWORK = OperationModel.new(
        name: "ApplySecurityGroupsToClientVpnTargetNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      ASSIGN_IPV6_ADDRESSES = OperationModel.new(
        name: "AssignIpv6Addresses",
        http_method: "POST",
        request_uri: "/"
      )

      ASSIGN_PRIVATE_IP_ADDRESSES = OperationModel.new(
        name: "AssignPrivateIpAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      ASSIGN_PRIVATE_NAT_GATEWAY_ADDRESS = OperationModel.new(
        name: "AssignPrivateNatGatewayAddress",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_ADDRESS = OperationModel.new(
        name: "AssociateAddress",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_CAPACITY_RESERVATION_BILLING_OWNER = OperationModel.new(
        name: "AssociateCapacityReservationBillingOwner",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_CLIENT_VPN_TARGET_NETWORK = OperationModel.new(
        name: "AssociateClientVpnTargetNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_DHCP_OPTIONS = OperationModel.new(
        name: "AssociateDhcpOptions",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_ENCLAVE_CERTIFICATE_IAM_ROLE = OperationModel.new(
        name: "AssociateEnclaveCertificateIamRole",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_IAM_INSTANCE_PROFILE = OperationModel.new(
        name: "AssociateIamInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_INSTANCE_EVENT_WINDOW = OperationModel.new(
        name: "AssociateInstanceEventWindow",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_IPAM_BYOASN = OperationModel.new(
        name: "AssociateIpamByoasn",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_IPAM_RESOURCE_DISCOVERY = OperationModel.new(
        name: "AssociateIpamResourceDiscovery",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_NAT_GATEWAY_ADDRESS = OperationModel.new(
        name: "AssociateNatGatewayAddress",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_ROUTE_SERVER = OperationModel.new(
        name: "AssociateRouteServer",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_ROUTE_TABLE = OperationModel.new(
        name: "AssociateRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SECURITY_GROUP_VPC = OperationModel.new(
        name: "AssociateSecurityGroupVpc",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_SUBNET_CIDR_BLOCK = OperationModel.new(
        name: "AssociateSubnetCidrBlock",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_TRANSIT_GATEWAY_MULTICAST_DOMAIN = OperationModel.new(
        name: "AssociateTransitGatewayMulticastDomain",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_TRANSIT_GATEWAY_POLICY_TABLE = OperationModel.new(
        name: "AssociateTransitGatewayPolicyTable",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_TRANSIT_GATEWAY_ROUTE_TABLE = OperationModel.new(
        name: "AssociateTransitGatewayRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_TRUNK_INTERFACE = OperationModel.new(
        name: "AssociateTrunkInterface",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_VPC_CIDR_BLOCK = OperationModel.new(
        name: "AssociateVpcCidrBlock",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_CLASSIC_LINK_VPC = OperationModel.new(
        name: "AttachClassicLinkVpc",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_INTERNET_GATEWAY = OperationModel.new(
        name: "AttachInternetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_NETWORK_INTERFACE = OperationModel.new(
        name: "AttachNetworkInterface",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_VERIFIED_ACCESS_TRUST_PROVIDER = OperationModel.new(
        name: "AttachVerifiedAccessTrustProvider",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_VOLUME = OperationModel.new(
        name: "AttachVolume",
        http_method: "POST",
        request_uri: "/"
      )

      ATTACH_VPN_GATEWAY = OperationModel.new(
        name: "AttachVpnGateway",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_CLIENT_VPN_INGRESS = OperationModel.new(
        name: "AuthorizeClientVpnIngress",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_SECURITY_GROUP_EGRESS = OperationModel.new(
        name: "AuthorizeSecurityGroupEgress",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_SECURITY_GROUP_INGRESS = OperationModel.new(
        name: "AuthorizeSecurityGroupIngress",
        http_method: "POST",
        request_uri: "/"
      )

      BUNDLE_INSTANCE = OperationModel.new(
        name: "BundleInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_BUNDLE_TASK = OperationModel.new(
        name: "CancelBundleTask",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CAPACITY_RESERVATION = OperationModel.new(
        name: "CancelCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CAPACITY_RESERVATION_FLEETS = OperationModel.new(
        name: "CancelCapacityReservationFleets",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_CONVERSION_TASK = OperationModel.new(
        name: "CancelConversionTask",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_DECLARATIVE_POLICIES_REPORT = OperationModel.new(
        name: "CancelDeclarativePoliciesReport",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_EXPORT_TASK = OperationModel.new(
        name: "CancelExportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_IMAGE_LAUNCH_PERMISSION = OperationModel.new(
        name: "CancelImageLaunchPermission",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_IMPORT_TASK = OperationModel.new(
        name: "CancelImportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_RESERVED_INSTANCES_LISTING = OperationModel.new(
        name: "CancelReservedInstancesListing",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_SPOT_FLEET_REQUESTS = OperationModel.new(
        name: "CancelSpotFleetRequests",
        http_method: "POST",
        request_uri: "/"
      )

      CANCEL_SPOT_INSTANCE_REQUESTS = OperationModel.new(
        name: "CancelSpotInstanceRequests",
        http_method: "POST",
        request_uri: "/"
      )

      CONFIRM_PRODUCT_INSTANCE = OperationModel.new(
        name: "ConfirmProductInstance",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_FPGA_IMAGE = OperationModel.new(
        name: "CopyFpgaImage",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_IMAGE = OperationModel.new(
        name: "CopyImage",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_SNAPSHOT = OperationModel.new(
        name: "CopySnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_VOLUMES = OperationModel.new(
        name: "CopyVolumes",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAPACITY_MANAGER_DATA_EXPORT = OperationModel.new(
        name: "CreateCapacityManagerDataExport",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAPACITY_RESERVATION = OperationModel.new(
        name: "CreateCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAPACITY_RESERVATION_BY_SPLITTING = OperationModel.new(
        name: "CreateCapacityReservationBySplitting",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CAPACITY_RESERVATION_FLEET = OperationModel.new(
        name: "CreateCapacityReservationFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CARRIER_GATEWAY = OperationModel.new(
        name: "CreateCarrierGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLIENT_VPN_ENDPOINT = OperationModel.new(
        name: "CreateClientVpnEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLIENT_VPN_ROUTE = OperationModel.new(
        name: "CreateClientVpnRoute",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COIP_CIDR = OperationModel.new(
        name: "CreateCoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_COIP_POOL = OperationModel.new(
        name: "CreateCoipPool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CUSTOMER_GATEWAY = OperationModel.new(
        name: "CreateCustomerGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEFAULT_SUBNET = OperationModel.new(
        name: "CreateDefaultSubnet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DEFAULT_VPC = OperationModel.new(
        name: "CreateDefaultVpc",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DELEGATE_MAC_VOLUME_OWNERSHIP_TASK = OperationModel.new(
        name: "CreateDelegateMacVolumeOwnershipTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DHCP_OPTIONS = OperationModel.new(
        name: "CreateDhcpOptions",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EGRESS_ONLY_INTERNET_GATEWAY = OperationModel.new(
        name: "CreateEgressOnlyInternetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLEET = OperationModel.new(
        name: "CreateFleet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FLOW_LOGS = OperationModel.new(
        name: "CreateFlowLogs",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_FPGA_IMAGE = OperationModel.new(
        name: "CreateFpgaImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMAGE = OperationModel.new(
        name: "CreateImage",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IMAGE_USAGE_REPORT = OperationModel.new(
        name: "CreateImageUsageReport",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_CONNECT_ENDPOINT = OperationModel.new(
        name: "CreateInstanceConnectEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_EVENT_WINDOW = OperationModel.new(
        name: "CreateInstanceEventWindow",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INSTANCE_EXPORT_TASK = OperationModel.new(
        name: "CreateInstanceExportTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTERNET_GATEWAY = OperationModel.new(
        name: "CreateInternetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_INTERRUPTIBLE_CAPACITY_RESERVATION_ALLOCATION = OperationModel.new(
        name: "CreateInterruptibleCapacityReservationAllocation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM = OperationModel.new(
        name: "CreateIpam",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_EXTERNAL_RESOURCE_VERIFICATION_TOKEN = OperationModel.new(
        name: "CreateIpamExternalResourceVerificationToken",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_POLICY = OperationModel.new(
        name: "CreateIpamPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_POOL = OperationModel.new(
        name: "CreateIpamPool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_PREFIX_LIST_RESOLVER = OperationModel.new(
        name: "CreateIpamPrefixListResolver",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_PREFIX_LIST_RESOLVER_TARGET = OperationModel.new(
        name: "CreateIpamPrefixListResolverTarget",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_RESOURCE_DISCOVERY = OperationModel.new(
        name: "CreateIpamResourceDiscovery",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_IPAM_SCOPE = OperationModel.new(
        name: "CreateIpamScope",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_KEY_PAIR = OperationModel.new(
        name: "CreateKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LAUNCH_TEMPLATE = OperationModel.new(
        name: "CreateLaunchTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LAUNCH_TEMPLATE_VERSION = OperationModel.new(
        name: "CreateLaunchTemplateVersion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCAL_GATEWAY_ROUTE = OperationModel.new(
        name: "CreateLocalGatewayRoute",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCAL_GATEWAY_ROUTE_TABLE = OperationModel.new(
        name: "CreateLocalGatewayRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCAL_GATEWAY_ROUTE_TABLE_VIRTUAL_INTERFACE_GROUP_ASSOCIATION = OperationModel.new(
        name: "CreateLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCAL_GATEWAY_ROUTE_TABLE_VPC_ASSOCIATION = OperationModel.new(
        name: "CreateLocalGatewayRouteTableVpcAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCAL_GATEWAY_VIRTUAL_INTERFACE = OperationModel.new(
        name: "CreateLocalGatewayVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_LOCAL_GATEWAY_VIRTUAL_INTERFACE_GROUP = OperationModel.new(
        name: "CreateLocalGatewayVirtualInterfaceGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MAC_SYSTEM_INTEGRITY_PROTECTION_MODIFICATION_TASK = OperationModel.new(
        name: "CreateMacSystemIntegrityProtectionModificationTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MANAGED_PREFIX_LIST = OperationModel.new(
        name: "CreateManagedPrefixList",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NAT_GATEWAY = OperationModel.new(
        name: "CreateNatGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_ACL = OperationModel.new(
        name: "CreateNetworkAcl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_ACL_ENTRY = OperationModel.new(
        name: "CreateNetworkAclEntry",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_INSIGHTS_ACCESS_SCOPE = OperationModel.new(
        name: "CreateNetworkInsightsAccessScope",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_INSIGHTS_PATH = OperationModel.new(
        name: "CreateNetworkInsightsPath",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_INTERFACE = OperationModel.new(
        name: "CreateNetworkInterface",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_NETWORK_INTERFACE_PERMISSION = OperationModel.new(
        name: "CreateNetworkInterfacePermission",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PLACEMENT_GROUP = OperationModel.new(
        name: "CreatePlacementGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PUBLIC_IPV4_POOL = OperationModel.new(
        name: "CreatePublicIpv4Pool",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPLACE_ROOT_VOLUME_TASK = OperationModel.new(
        name: "CreateReplaceRootVolumeTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESERVED_INSTANCES_LISTING = OperationModel.new(
        name: "CreateReservedInstancesListing",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_RESTORE_IMAGE_TASK = OperationModel.new(
        name: "CreateRestoreImageTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROUTE = OperationModel.new(
        name: "CreateRoute",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROUTE_SERVER = OperationModel.new(
        name: "CreateRouteServer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROUTE_SERVER_ENDPOINT = OperationModel.new(
        name: "CreateRouteServerEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROUTE_SERVER_PEER = OperationModel.new(
        name: "CreateRouteServerPeer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ROUTE_TABLE = OperationModel.new(
        name: "CreateRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SECURITY_GROUP = OperationModel.new(
        name: "CreateSecurityGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOTS = OperationModel.new(
        name: "CreateSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SPOT_DATAFEED_SUBSCRIPTION = OperationModel.new(
        name: "CreateSpotDatafeedSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_STORE_IMAGE_TASK = OperationModel.new(
        name: "CreateStoreImageTask",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SUBNET = OperationModel.new(
        name: "CreateSubnet",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SUBNET_CIDR_RESERVATION = OperationModel.new(
        name: "CreateSubnetCidrReservation",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TAGS = OperationModel.new(
        name: "CreateTags",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAFFIC_MIRROR_FILTER = OperationModel.new(
        name: "CreateTrafficMirrorFilter",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAFFIC_MIRROR_FILTER_RULE = OperationModel.new(
        name: "CreateTrafficMirrorFilterRule",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAFFIC_MIRROR_SESSION = OperationModel.new(
        name: "CreateTrafficMirrorSession",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRAFFIC_MIRROR_TARGET = OperationModel.new(
        name: "CreateTrafficMirrorTarget",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY = OperationModel.new(
        name: "CreateTransitGateway",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_CONNECT = OperationModel.new(
        name: "CreateTransitGatewayConnect",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_CONNECT_PEER = OperationModel.new(
        name: "CreateTransitGatewayConnectPeer",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_METERING_POLICY = OperationModel.new(
        name: "CreateTransitGatewayMeteringPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_METERING_POLICY_ENTRY = OperationModel.new(
        name: "CreateTransitGatewayMeteringPolicyEntry",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_MULTICAST_DOMAIN = OperationModel.new(
        name: "CreateTransitGatewayMulticastDomain",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_PEERING_ATTACHMENT = OperationModel.new(
        name: "CreateTransitGatewayPeeringAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_POLICY_TABLE = OperationModel.new(
        name: "CreateTransitGatewayPolicyTable",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_PREFIX_LIST_REFERENCE = OperationModel.new(
        name: "CreateTransitGatewayPrefixListReference",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_ROUTE = OperationModel.new(
        name: "CreateTransitGatewayRoute",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_ROUTE_TABLE = OperationModel.new(
        name: "CreateTransitGatewayRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_ROUTE_TABLE_ANNOUNCEMENT = OperationModel.new(
        name: "CreateTransitGatewayRouteTableAnnouncement",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_TRANSIT_GATEWAY_VPC_ATTACHMENT = OperationModel.new(
        name: "CreateTransitGatewayVpcAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VERIFIED_ACCESS_ENDPOINT = OperationModel.new(
        name: "CreateVerifiedAccessEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VERIFIED_ACCESS_GROUP = OperationModel.new(
        name: "CreateVerifiedAccessGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VERIFIED_ACCESS_INSTANCE = OperationModel.new(
        name: "CreateVerifiedAccessInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VERIFIED_ACCESS_TRUST_PROVIDER = OperationModel.new(
        name: "CreateVerifiedAccessTrustProvider",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VOLUME = OperationModel.new(
        name: "CreateVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC = OperationModel.new(
        name: "CreateVpc",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_BLOCK_PUBLIC_ACCESS_EXCLUSION = OperationModel.new(
        name: "CreateVpcBlockPublicAccessExclusion",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_ENCRYPTION_CONTROL = OperationModel.new(
        name: "CreateVpcEncryptionControl",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_ENDPOINT = OperationModel.new(
        name: "CreateVpcEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_ENDPOINT_CONNECTION_NOTIFICATION = OperationModel.new(
        name: "CreateVpcEndpointConnectionNotification",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_ENDPOINT_SERVICE_CONFIGURATION = OperationModel.new(
        name: "CreateVpcEndpointServiceConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPC_PEERING_CONNECTION = OperationModel.new(
        name: "CreateVpcPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPN_CONCENTRATOR = OperationModel.new(
        name: "CreateVpnConcentrator",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPN_CONNECTION = OperationModel.new(
        name: "CreateVpnConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPN_CONNECTION_ROUTE = OperationModel.new(
        name: "CreateVpnConnectionRoute",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VPN_GATEWAY = OperationModel.new(
        name: "CreateVpnGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CAPACITY_MANAGER_DATA_EXPORT = OperationModel.new(
        name: "DeleteCapacityManagerDataExport",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CARRIER_GATEWAY = OperationModel.new(
        name: "DeleteCarrierGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLIENT_VPN_ENDPOINT = OperationModel.new(
        name: "DeleteClientVpnEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLIENT_VPN_ROUTE = OperationModel.new(
        name: "DeleteClientVpnRoute",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COIP_CIDR = OperationModel.new(
        name: "DeleteCoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_COIP_POOL = OperationModel.new(
        name: "DeleteCoipPool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CUSTOMER_GATEWAY = OperationModel.new(
        name: "DeleteCustomerGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DHCP_OPTIONS = OperationModel.new(
        name: "DeleteDhcpOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EGRESS_ONLY_INTERNET_GATEWAY = OperationModel.new(
        name: "DeleteEgressOnlyInternetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLEETS = OperationModel.new(
        name: "DeleteFleets",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FLOW_LOGS = OperationModel.new(
        name: "DeleteFlowLogs",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_FPGA_IMAGE = OperationModel.new(
        name: "DeleteFpgaImage",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IMAGE_USAGE_REPORT = OperationModel.new(
        name: "DeleteImageUsageReport",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_CONNECT_ENDPOINT = OperationModel.new(
        name: "DeleteInstanceConnectEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INSTANCE_EVENT_WINDOW = OperationModel.new(
        name: "DeleteInstanceEventWindow",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_INTERNET_GATEWAY = OperationModel.new(
        name: "DeleteInternetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM = OperationModel.new(
        name: "DeleteIpam",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_EXTERNAL_RESOURCE_VERIFICATION_TOKEN = OperationModel.new(
        name: "DeleteIpamExternalResourceVerificationToken",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_POLICY = OperationModel.new(
        name: "DeleteIpamPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_POOL = OperationModel.new(
        name: "DeleteIpamPool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_PREFIX_LIST_RESOLVER = OperationModel.new(
        name: "DeleteIpamPrefixListResolver",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_PREFIX_LIST_RESOLVER_TARGET = OperationModel.new(
        name: "DeleteIpamPrefixListResolverTarget",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_RESOURCE_DISCOVERY = OperationModel.new(
        name: "DeleteIpamResourceDiscovery",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_IPAM_SCOPE = OperationModel.new(
        name: "DeleteIpamScope",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_KEY_PAIR = OperationModel.new(
        name: "DeleteKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LAUNCH_TEMPLATE = OperationModel.new(
        name: "DeleteLaunchTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LAUNCH_TEMPLATE_VERSIONS = OperationModel.new(
        name: "DeleteLaunchTemplateVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCAL_GATEWAY_ROUTE = OperationModel.new(
        name: "DeleteLocalGatewayRoute",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCAL_GATEWAY_ROUTE_TABLE = OperationModel.new(
        name: "DeleteLocalGatewayRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCAL_GATEWAY_ROUTE_TABLE_VIRTUAL_INTERFACE_GROUP_ASSOCIATION = OperationModel.new(
        name: "DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCAL_GATEWAY_ROUTE_TABLE_VPC_ASSOCIATION = OperationModel.new(
        name: "DeleteLocalGatewayRouteTableVpcAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCAL_GATEWAY_VIRTUAL_INTERFACE = OperationModel.new(
        name: "DeleteLocalGatewayVirtualInterface",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_LOCAL_GATEWAY_VIRTUAL_INTERFACE_GROUP = OperationModel.new(
        name: "DeleteLocalGatewayVirtualInterfaceGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MANAGED_PREFIX_LIST = OperationModel.new(
        name: "DeleteManagedPrefixList",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NAT_GATEWAY = OperationModel.new(
        name: "DeleteNatGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_ACL = OperationModel.new(
        name: "DeleteNetworkAcl",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_ACL_ENTRY = OperationModel.new(
        name: "DeleteNetworkAclEntry",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_INSIGHTS_ACCESS_SCOPE = OperationModel.new(
        name: "DeleteNetworkInsightsAccessScope",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_INSIGHTS_ACCESS_SCOPE_ANALYSIS = OperationModel.new(
        name: "DeleteNetworkInsightsAccessScopeAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_INSIGHTS_ANALYSIS = OperationModel.new(
        name: "DeleteNetworkInsightsAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_INSIGHTS_PATH = OperationModel.new(
        name: "DeleteNetworkInsightsPath",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_INTERFACE = OperationModel.new(
        name: "DeleteNetworkInterface",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_NETWORK_INTERFACE_PERMISSION = OperationModel.new(
        name: "DeleteNetworkInterfacePermission",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PLACEMENT_GROUP = OperationModel.new(
        name: "DeletePlacementGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PUBLIC_IPV4_POOL = OperationModel.new(
        name: "DeletePublicIpv4Pool",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_QUEUED_RESERVED_INSTANCES = OperationModel.new(
        name: "DeleteQueuedReservedInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROUTE = OperationModel.new(
        name: "DeleteRoute",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROUTE_SERVER = OperationModel.new(
        name: "DeleteRouteServer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROUTE_SERVER_ENDPOINT = OperationModel.new(
        name: "DeleteRouteServerEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROUTE_SERVER_PEER = OperationModel.new(
        name: "DeleteRouteServerPeer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ROUTE_TABLE = OperationModel.new(
        name: "DeleteRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SECURITY_GROUP = OperationModel.new(
        name: "DeleteSecurityGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT = OperationModel.new(
        name: "DeleteSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SPOT_DATAFEED_SUBSCRIPTION = OperationModel.new(
        name: "DeleteSpotDatafeedSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUBNET = OperationModel.new(
        name: "DeleteSubnet",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUBNET_CIDR_RESERVATION = OperationModel.new(
        name: "DeleteSubnetCidrReservation",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TAGS = OperationModel.new(
        name: "DeleteTags",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAFFIC_MIRROR_FILTER = OperationModel.new(
        name: "DeleteTrafficMirrorFilter",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAFFIC_MIRROR_FILTER_RULE = OperationModel.new(
        name: "DeleteTrafficMirrorFilterRule",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAFFIC_MIRROR_SESSION = OperationModel.new(
        name: "DeleteTrafficMirrorSession",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRAFFIC_MIRROR_TARGET = OperationModel.new(
        name: "DeleteTrafficMirrorTarget",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY = OperationModel.new(
        name: "DeleteTransitGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_CONNECT = OperationModel.new(
        name: "DeleteTransitGatewayConnect",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_CONNECT_PEER = OperationModel.new(
        name: "DeleteTransitGatewayConnectPeer",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_METERING_POLICY = OperationModel.new(
        name: "DeleteTransitGatewayMeteringPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_METERING_POLICY_ENTRY = OperationModel.new(
        name: "DeleteTransitGatewayMeteringPolicyEntry",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_MULTICAST_DOMAIN = OperationModel.new(
        name: "DeleteTransitGatewayMulticastDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_PEERING_ATTACHMENT = OperationModel.new(
        name: "DeleteTransitGatewayPeeringAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_POLICY_TABLE = OperationModel.new(
        name: "DeleteTransitGatewayPolicyTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_PREFIX_LIST_REFERENCE = OperationModel.new(
        name: "DeleteTransitGatewayPrefixListReference",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_ROUTE = OperationModel.new(
        name: "DeleteTransitGatewayRoute",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_ROUTE_TABLE = OperationModel.new(
        name: "DeleteTransitGatewayRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_ROUTE_TABLE_ANNOUNCEMENT = OperationModel.new(
        name: "DeleteTransitGatewayRouteTableAnnouncement",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_TRANSIT_GATEWAY_VPC_ATTACHMENT = OperationModel.new(
        name: "DeleteTransitGatewayVpcAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VERIFIED_ACCESS_ENDPOINT = OperationModel.new(
        name: "DeleteVerifiedAccessEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VERIFIED_ACCESS_GROUP = OperationModel.new(
        name: "DeleteVerifiedAccessGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VERIFIED_ACCESS_INSTANCE = OperationModel.new(
        name: "DeleteVerifiedAccessInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VERIFIED_ACCESS_TRUST_PROVIDER = OperationModel.new(
        name: "DeleteVerifiedAccessTrustProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOLUME = OperationModel.new(
        name: "DeleteVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC = OperationModel.new(
        name: "DeleteVpc",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_BLOCK_PUBLIC_ACCESS_EXCLUSION = OperationModel.new(
        name: "DeleteVpcBlockPublicAccessExclusion",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_ENCRYPTION_CONTROL = OperationModel.new(
        name: "DeleteVpcEncryptionControl",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_ENDPOINT_CONNECTION_NOTIFICATIONS = OperationModel.new(
        name: "DeleteVpcEndpointConnectionNotifications",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_ENDPOINT_SERVICE_CONFIGURATIONS = OperationModel.new(
        name: "DeleteVpcEndpointServiceConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_ENDPOINTS = OperationModel.new(
        name: "DeleteVpcEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPC_PEERING_CONNECTION = OperationModel.new(
        name: "DeleteVpcPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPN_CONCENTRATOR = OperationModel.new(
        name: "DeleteVpnConcentrator",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPN_CONNECTION = OperationModel.new(
        name: "DeleteVpnConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPN_CONNECTION_ROUTE = OperationModel.new(
        name: "DeleteVpnConnectionRoute",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VPN_GATEWAY = OperationModel.new(
        name: "DeleteVpnGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DEPROVISION_BYOIP_CIDR = OperationModel.new(
        name: "DeprovisionByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      DEPROVISION_IPAM_BYOASN = OperationModel.new(
        name: "DeprovisionIpamByoasn",
        http_method: "POST",
        request_uri: "/"
      )

      DEPROVISION_IPAM_POOL_CIDR = OperationModel.new(
        name: "DeprovisionIpamPoolCidr",
        http_method: "POST",
        request_uri: "/"
      )

      DEPROVISION_PUBLIC_IPV4_POOL_CIDR = OperationModel.new(
        name: "DeprovisionPublicIpv4PoolCidr",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_IMAGE = OperationModel.new(
        name: "DeregisterImage",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_INSTANCE_EVENT_NOTIFICATION_ATTRIBUTES = OperationModel.new(
        name: "DeregisterInstanceEventNotificationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TRANSIT_GATEWAY_MULTICAST_GROUP_MEMBERS = OperationModel.new(
        name: "DeregisterTransitGatewayMulticastGroupMembers",
        http_method: "POST",
        request_uri: "/"
      )

      DEREGISTER_TRANSIT_GATEWAY_MULTICAST_GROUP_SOURCES = OperationModel.new(
        name: "DeregisterTransitGatewayMulticastGroupSources",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ACCOUNT_ATTRIBUTES = OperationModel.new(
        name: "DescribeAccountAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ADDRESS_TRANSFERS = OperationModel.new(
        name: "DescribeAddressTransfers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ADDRESSES = OperationModel.new(
        name: "DescribeAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ADDRESSES_ATTRIBUTE = OperationModel.new(
        name: "DescribeAddressesAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AGGREGATE_ID_FORMAT = OperationModel.new(
        name: "DescribeAggregateIdFormat",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AVAILABILITY_ZONES = OperationModel.new(
        name: "DescribeAvailabilityZones",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AWS_NETWORK_PERFORMANCE_METRIC_SUBSCRIPTIONS = OperationModel.new(
        name: "DescribeAwsNetworkPerformanceMetricSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BUNDLE_TASKS = OperationModel.new(
        name: "DescribeBundleTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_BYOIP_CIDRS = OperationModel.new(
        name: "DescribeByoipCidrs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_BLOCK_EXTENSION_HISTORY = OperationModel.new(
        name: "DescribeCapacityBlockExtensionHistory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_BLOCK_EXTENSION_OFFERINGS = OperationModel.new(
        name: "DescribeCapacityBlockExtensionOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_BLOCK_OFFERINGS = OperationModel.new(
        name: "DescribeCapacityBlockOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_BLOCK_STATUS = OperationModel.new(
        name: "DescribeCapacityBlockStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_BLOCKS = OperationModel.new(
        name: "DescribeCapacityBlocks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_MANAGER_DATA_EXPORTS = OperationModel.new(
        name: "DescribeCapacityManagerDataExports",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_RESERVATION_BILLING_REQUESTS = OperationModel.new(
        name: "DescribeCapacityReservationBillingRequests",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_RESERVATION_FLEETS = OperationModel.new(
        name: "DescribeCapacityReservationFleets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_RESERVATION_TOPOLOGY = OperationModel.new(
        name: "DescribeCapacityReservationTopology",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CAPACITY_RESERVATIONS = OperationModel.new(
        name: "DescribeCapacityReservations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CARRIER_GATEWAYS = OperationModel.new(
        name: "DescribeCarrierGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLASSIC_LINK_INSTANCES = OperationModel.new(
        name: "DescribeClassicLinkInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_VPN_AUTHORIZATION_RULES = OperationModel.new(
        name: "DescribeClientVpnAuthorizationRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_VPN_CONNECTIONS = OperationModel.new(
        name: "DescribeClientVpnConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_VPN_ENDPOINTS = OperationModel.new(
        name: "DescribeClientVpnEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_VPN_ROUTES = OperationModel.new(
        name: "DescribeClientVpnRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLIENT_VPN_TARGET_NETWORKS = OperationModel.new(
        name: "DescribeClientVpnTargetNetworks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_COIP_POOLS = OperationModel.new(
        name: "DescribeCoipPools",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CONVERSION_TASKS = OperationModel.new(
        name: "DescribeConversionTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CUSTOMER_GATEWAYS = OperationModel.new(
        name: "DescribeCustomerGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DECLARATIVE_POLICIES_REPORTS = OperationModel.new(
        name: "DescribeDeclarativePoliciesReports",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DHCP_OPTIONS = OperationModel.new(
        name: "DescribeDhcpOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EGRESS_ONLY_INTERNET_GATEWAYS = OperationModel.new(
        name: "DescribeEgressOnlyInternetGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ELASTIC_GPUS = OperationModel.new(
        name: "DescribeElasticGpus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPORT_IMAGE_TASKS = OperationModel.new(
        name: "DescribeExportImageTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EXPORT_TASKS = OperationModel.new(
        name: "DescribeExportTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FAST_LAUNCH_IMAGES = OperationModel.new(
        name: "DescribeFastLaunchImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FAST_SNAPSHOT_RESTORES = OperationModel.new(
        name: "DescribeFastSnapshotRestores",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_HISTORY = OperationModel.new(
        name: "DescribeFleetHistory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEET_INSTANCES = OperationModel.new(
        name: "DescribeFleetInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLEETS = OperationModel.new(
        name: "DescribeFleets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FLOW_LOGS = OperationModel.new(
        name: "DescribeFlowLogs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FPGA_IMAGE_ATTRIBUTE = OperationModel.new(
        name: "DescribeFpgaImageAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_FPGA_IMAGES = OperationModel.new(
        name: "DescribeFpgaImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HOST_RESERVATION_OFFERINGS = OperationModel.new(
        name: "DescribeHostReservationOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HOST_RESERVATIONS = OperationModel.new(
        name: "DescribeHostReservations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_HOSTS = OperationModel.new(
        name: "DescribeHosts",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IAM_INSTANCE_PROFILE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeIamInstanceProfileAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ID_FORMAT = OperationModel.new(
        name: "DescribeIdFormat",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IDENTITY_ID_FORMAT = OperationModel.new(
        name: "DescribeIdentityIdFormat",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_ATTRIBUTE = OperationModel.new(
        name: "DescribeImageAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_REFERENCES = OperationModel.new(
        name: "DescribeImageReferences",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_USAGE_REPORT_ENTRIES = OperationModel.new(
        name: "DescribeImageUsageReportEntries",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGE_USAGE_REPORTS = OperationModel.new(
        name: "DescribeImageUsageReports",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMAGES = OperationModel.new(
        name: "DescribeImages",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMPORT_IMAGE_TASKS = OperationModel.new(
        name: "DescribeImportImageTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IMPORT_SNAPSHOT_TASKS = OperationModel.new(
        name: "DescribeImportSnapshotTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_ATTRIBUTE = OperationModel.new(
        name: "DescribeInstanceAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_CONNECT_ENDPOINTS = OperationModel.new(
        name: "DescribeInstanceConnectEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_CREDIT_SPECIFICATIONS = OperationModel.new(
        name: "DescribeInstanceCreditSpecifications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_EVENT_NOTIFICATION_ATTRIBUTES = OperationModel.new(
        name: "DescribeInstanceEventNotificationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_EVENT_WINDOWS = OperationModel.new(
        name: "DescribeInstanceEventWindows",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_IMAGE_METADATA = OperationModel.new(
        name: "DescribeInstanceImageMetadata",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_SQL_HA_HISTORY_STATES = OperationModel.new(
        name: "DescribeInstanceSqlHaHistoryStates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_SQL_HA_STATES = OperationModel.new(
        name: "DescribeInstanceSqlHaStates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_STATUS = OperationModel.new(
        name: "DescribeInstanceStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_TOPOLOGY = OperationModel.new(
        name: "DescribeInstanceTopology",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_TYPE_OFFERINGS = OperationModel.new(
        name: "DescribeInstanceTypeOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCE_TYPES = OperationModel.new(
        name: "DescribeInstanceTypes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INSTANCES = OperationModel.new(
        name: "DescribeInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_INTERNET_GATEWAYS = OperationModel.new(
        name: "DescribeInternetGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_BYOASN = OperationModel.new(
        name: "DescribeIpamByoasn",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_EXTERNAL_RESOURCE_VERIFICATION_TOKENS = OperationModel.new(
        name: "DescribeIpamExternalResourceVerificationTokens",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_POLICIES = OperationModel.new(
        name: "DescribeIpamPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_POOLS = OperationModel.new(
        name: "DescribeIpamPools",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_PREFIX_LIST_RESOLVER_TARGETS = OperationModel.new(
        name: "DescribeIpamPrefixListResolverTargets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_PREFIX_LIST_RESOLVERS = OperationModel.new(
        name: "DescribeIpamPrefixListResolvers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_RESOURCE_DISCOVERIES = OperationModel.new(
        name: "DescribeIpamResourceDiscoveries",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_RESOURCE_DISCOVERY_ASSOCIATIONS = OperationModel.new(
        name: "DescribeIpamResourceDiscoveryAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAM_SCOPES = OperationModel.new(
        name: "DescribeIpamScopes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPAMS = OperationModel.new(
        name: "DescribeIpams",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_IPV6_POOLS = OperationModel.new(
        name: "DescribeIpv6Pools",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_KEY_PAIRS = OperationModel.new(
        name: "DescribeKeyPairs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LAUNCH_TEMPLATE_VERSIONS = OperationModel.new(
        name: "DescribeLaunchTemplateVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LAUNCH_TEMPLATES = OperationModel.new(
        name: "DescribeLaunchTemplates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCAL_GATEWAY_ROUTE_TABLE_VIRTUAL_INTERFACE_GROUP_ASSOCIATIONS = OperationModel.new(
        name: "DescribeLocalGatewayRouteTableVirtualInterfaceGroupAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCAL_GATEWAY_ROUTE_TABLE_VPC_ASSOCIATIONS = OperationModel.new(
        name: "DescribeLocalGatewayRouteTableVpcAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCAL_GATEWAY_ROUTE_TABLES = OperationModel.new(
        name: "DescribeLocalGatewayRouteTables",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCAL_GATEWAY_VIRTUAL_INTERFACE_GROUPS = OperationModel.new(
        name: "DescribeLocalGatewayVirtualInterfaceGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCAL_GATEWAY_VIRTUAL_INTERFACES = OperationModel.new(
        name: "DescribeLocalGatewayVirtualInterfaces",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCAL_GATEWAYS = OperationModel.new(
        name: "DescribeLocalGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_LOCKED_SNAPSHOTS = OperationModel.new(
        name: "DescribeLockedSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAC_HOSTS = OperationModel.new(
        name: "DescribeMacHosts",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MAC_MODIFICATION_TASKS = OperationModel.new(
        name: "DescribeMacModificationTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MANAGED_PREFIX_LISTS = OperationModel.new(
        name: "DescribeManagedPrefixLists",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MOVING_ADDRESSES = OperationModel.new(
        name: "DescribeMovingAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NAT_GATEWAYS = OperationModel.new(
        name: "DescribeNatGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_ACLS = OperationModel.new(
        name: "DescribeNetworkAcls",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INSIGHTS_ACCESS_SCOPE_ANALYSES = OperationModel.new(
        name: "DescribeNetworkInsightsAccessScopeAnalyses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INSIGHTS_ACCESS_SCOPES = OperationModel.new(
        name: "DescribeNetworkInsightsAccessScopes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INSIGHTS_ANALYSES = OperationModel.new(
        name: "DescribeNetworkInsightsAnalyses",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INSIGHTS_PATHS = OperationModel.new(
        name: "DescribeNetworkInsightsPaths",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INTERFACE_ATTRIBUTE = OperationModel.new(
        name: "DescribeNetworkInterfaceAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INTERFACE_PERMISSIONS = OperationModel.new(
        name: "DescribeNetworkInterfacePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_NETWORK_INTERFACES = OperationModel.new(
        name: "DescribeNetworkInterfaces",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_OUTPOST_LAGS = OperationModel.new(
        name: "DescribeOutpostLags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PLACEMENT_GROUPS = OperationModel.new(
        name: "DescribePlacementGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PREFIX_LISTS = OperationModel.new(
        name: "DescribePrefixLists",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PRINCIPAL_ID_FORMAT = OperationModel.new(
        name: "DescribePrincipalIdFormat",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PUBLIC_IPV4_POOLS = OperationModel.new(
        name: "DescribePublicIpv4Pools",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REGIONS = OperationModel.new(
        name: "DescribeRegions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLACE_ROOT_VOLUME_TASKS = OperationModel.new(
        name: "DescribeReplaceRootVolumeTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_INSTANCES = OperationModel.new(
        name: "DescribeReservedInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_INSTANCES_LISTINGS = OperationModel.new(
        name: "DescribeReservedInstancesListings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_INSTANCES_MODIFICATIONS = OperationModel.new(
        name: "DescribeReservedInstancesModifications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_INSTANCES_OFFERINGS = OperationModel.new(
        name: "DescribeReservedInstancesOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ROUTE_SERVER_ENDPOINTS = OperationModel.new(
        name: "DescribeRouteServerEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ROUTE_SERVER_PEERS = OperationModel.new(
        name: "DescribeRouteServerPeers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ROUTE_SERVERS = OperationModel.new(
        name: "DescribeRouteServers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ROUTE_TABLES = OperationModel.new(
        name: "DescribeRouteTables",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEDULED_INSTANCE_AVAILABILITY = OperationModel.new(
        name: "DescribeScheduledInstanceAvailability",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SCHEDULED_INSTANCES = OperationModel.new(
        name: "DescribeScheduledInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECURITY_GROUP_REFERENCES = OperationModel.new(
        name: "DescribeSecurityGroupReferences",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECURITY_GROUP_RULES = OperationModel.new(
        name: "DescribeSecurityGroupRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECURITY_GROUP_VPC_ASSOCIATIONS = OperationModel.new(
        name: "DescribeSecurityGroupVpcAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SECURITY_GROUPS = OperationModel.new(
        name: "DescribeSecurityGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_LINK_VIRTUAL_INTERFACES = OperationModel.new(
        name: "DescribeServiceLinkVirtualInterfaces",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOT_ATTRIBUTE = OperationModel.new(
        name: "DescribeSnapshotAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOT_TIER_STATUS = OperationModel.new(
        name: "DescribeSnapshotTierStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOTS = OperationModel.new(
        name: "DescribeSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPOT_DATAFEED_SUBSCRIPTION = OperationModel.new(
        name: "DescribeSpotDatafeedSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPOT_FLEET_INSTANCES = OperationModel.new(
        name: "DescribeSpotFleetInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPOT_FLEET_REQUEST_HISTORY = OperationModel.new(
        name: "DescribeSpotFleetRequestHistory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPOT_FLEET_REQUESTS = OperationModel.new(
        name: "DescribeSpotFleetRequests",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPOT_INSTANCE_REQUESTS = OperationModel.new(
        name: "DescribeSpotInstanceRequests",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SPOT_PRICE_HISTORY = OperationModel.new(
        name: "DescribeSpotPriceHistory",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STALE_SECURITY_GROUPS = OperationModel.new(
        name: "DescribeStaleSecurityGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_STORE_IMAGE_TASKS = OperationModel.new(
        name: "DescribeStoreImageTasks",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUBNETS = OperationModel.new(
        name: "DescribeSubnets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TAGS = OperationModel.new(
        name: "DescribeTags",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAFFIC_MIRROR_FILTER_RULES = OperationModel.new(
        name: "DescribeTrafficMirrorFilterRules",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAFFIC_MIRROR_FILTERS = OperationModel.new(
        name: "DescribeTrafficMirrorFilters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAFFIC_MIRROR_SESSIONS = OperationModel.new(
        name: "DescribeTrafficMirrorSessions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRAFFIC_MIRROR_TARGETS = OperationModel.new(
        name: "DescribeTrafficMirrorTargets",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_ATTACHMENTS = OperationModel.new(
        name: "DescribeTransitGatewayAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_CONNECT_PEERS = OperationModel.new(
        name: "DescribeTransitGatewayConnectPeers",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_CONNECTS = OperationModel.new(
        name: "DescribeTransitGatewayConnects",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_METERING_POLICIES = OperationModel.new(
        name: "DescribeTransitGatewayMeteringPolicies",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_MULTICAST_DOMAINS = OperationModel.new(
        name: "DescribeTransitGatewayMulticastDomains",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_PEERING_ATTACHMENTS = OperationModel.new(
        name: "DescribeTransitGatewayPeeringAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_POLICY_TABLES = OperationModel.new(
        name: "DescribeTransitGatewayPolicyTables",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_ROUTE_TABLE_ANNOUNCEMENTS = OperationModel.new(
        name: "DescribeTransitGatewayRouteTableAnnouncements",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_ROUTE_TABLES = OperationModel.new(
        name: "DescribeTransitGatewayRouteTables",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAY_VPC_ATTACHMENTS = OperationModel.new(
        name: "DescribeTransitGatewayVpcAttachments",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRANSIT_GATEWAYS = OperationModel.new(
        name: "DescribeTransitGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_TRUNK_INTERFACE_ASSOCIATIONS = OperationModel.new(
        name: "DescribeTrunkInterfaceAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VERIFIED_ACCESS_ENDPOINTS = OperationModel.new(
        name: "DescribeVerifiedAccessEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VERIFIED_ACCESS_GROUPS = OperationModel.new(
        name: "DescribeVerifiedAccessGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VERIFIED_ACCESS_INSTANCE_LOGGING_CONFIGURATIONS = OperationModel.new(
        name: "DescribeVerifiedAccessInstanceLoggingConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VERIFIED_ACCESS_INSTANCES = OperationModel.new(
        name: "DescribeVerifiedAccessInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VERIFIED_ACCESS_TRUST_PROVIDERS = OperationModel.new(
        name: "DescribeVerifiedAccessTrustProviders",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VOLUME_ATTRIBUTE = OperationModel.new(
        name: "DescribeVolumeAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VOLUME_STATUS = OperationModel.new(
        name: "DescribeVolumeStatus",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VOLUMES = OperationModel.new(
        name: "DescribeVolumes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VOLUMES_MODIFICATIONS = OperationModel.new(
        name: "DescribeVolumesModifications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ATTRIBUTE = OperationModel.new(
        name: "DescribeVpcAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_BLOCK_PUBLIC_ACCESS_EXCLUSIONS = OperationModel.new(
        name: "DescribeVpcBlockPublicAccessExclusions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_BLOCK_PUBLIC_ACCESS_OPTIONS = OperationModel.new(
        name: "DescribeVpcBlockPublicAccessOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_CLASSIC_LINK = OperationModel.new(
        name: "DescribeVpcClassicLink",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_CLASSIC_LINK_DNS_SUPPORT = OperationModel.new(
        name: "DescribeVpcClassicLinkDnsSupport",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENCRYPTION_CONTROLS = OperationModel.new(
        name: "DescribeVpcEncryptionControls",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_ASSOCIATIONS = OperationModel.new(
        name: "DescribeVpcEndpointAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_CONNECTION_NOTIFICATIONS = OperationModel.new(
        name: "DescribeVpcEndpointConnectionNotifications",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_CONNECTIONS = OperationModel.new(
        name: "DescribeVpcEndpointConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_SERVICE_CONFIGURATIONS = OperationModel.new(
        name: "DescribeVpcEndpointServiceConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_SERVICE_PERMISSIONS = OperationModel.new(
        name: "DescribeVpcEndpointServicePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINT_SERVICES = OperationModel.new(
        name: "DescribeVpcEndpointServices",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_ENDPOINTS = OperationModel.new(
        name: "DescribeVpcEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPC_PEERING_CONNECTIONS = OperationModel.new(
        name: "DescribeVpcPeeringConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPCS = OperationModel.new(
        name: "DescribeVpcs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPN_CONCENTRATORS = OperationModel.new(
        name: "DescribeVpnConcentrators",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPN_CONNECTIONS = OperationModel.new(
        name: "DescribeVpnConnections",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VPN_GATEWAYS = OperationModel.new(
        name: "DescribeVpnGateways",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_CLASSIC_LINK_VPC = OperationModel.new(
        name: "DetachClassicLinkVpc",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_INTERNET_GATEWAY = OperationModel.new(
        name: "DetachInternetGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_NETWORK_INTERFACE = OperationModel.new(
        name: "DetachNetworkInterface",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_VERIFIED_ACCESS_TRUST_PROVIDER = OperationModel.new(
        name: "DetachVerifiedAccessTrustProvider",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_VOLUME = OperationModel.new(
        name: "DetachVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DETACH_VPN_GATEWAY = OperationModel.new(
        name: "DetachVpnGateway",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ADDRESS_TRANSFER = OperationModel.new(
        name: "DisableAddressTransfer",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ALLOWED_IMAGES_SETTINGS = OperationModel.new(
        name: "DisableAllowedImagesSettings",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_AWS_NETWORK_PERFORMANCE_METRIC_SUBSCRIPTION = OperationModel.new(
        name: "DisableAwsNetworkPerformanceMetricSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_CAPACITY_MANAGER = OperationModel.new(
        name: "DisableCapacityManager",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_EBS_ENCRYPTION_BY_DEFAULT = OperationModel.new(
        name: "DisableEbsEncryptionByDefault",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_FAST_LAUNCH = OperationModel.new(
        name: "DisableFastLaunch",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_FAST_SNAPSHOT_RESTORES = OperationModel.new(
        name: "DisableFastSnapshotRestores",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_IMAGE = OperationModel.new(
        name: "DisableImage",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_IMAGE_BLOCK_PUBLIC_ACCESS = OperationModel.new(
        name: "DisableImageBlockPublicAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_IMAGE_DEPRECATION = OperationModel.new(
        name: "DisableImageDeprecation",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_IMAGE_DEREGISTRATION_PROTECTION = OperationModel.new(
        name: "DisableImageDeregistrationProtection",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_INSTANCE_SQL_HA_STANDBY_DETECTIONS = OperationModel.new(
        name: "DisableInstanceSqlHaStandbyDetections",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_IPAM_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "DisableIpamOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_IPAM_POLICY = OperationModel.new(
        name: "DisableIpamPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_ROUTE_SERVER_PROPAGATION = OperationModel.new(
        name: "DisableRouteServerPropagation",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_SERIAL_CONSOLE_ACCESS = OperationModel.new(
        name: "DisableSerialConsoleAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_SNAPSHOT_BLOCK_PUBLIC_ACCESS = OperationModel.new(
        name: "DisableSnapshotBlockPublicAccess",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_TRANSIT_GATEWAY_ROUTE_TABLE_PROPAGATION = OperationModel.new(
        name: "DisableTransitGatewayRouteTablePropagation",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_VGW_ROUTE_PROPAGATION = OperationModel.new(
        name: "DisableVgwRoutePropagation",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_VPC_CLASSIC_LINK = OperationModel.new(
        name: "DisableVpcClassicLink",
        http_method: "POST",
        request_uri: "/"
      )

      DISABLE_VPC_CLASSIC_LINK_DNS_SUPPORT = OperationModel.new(
        name: "DisableVpcClassicLinkDnsSupport",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ADDRESS = OperationModel.new(
        name: "DisassociateAddress",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CAPACITY_RESERVATION_BILLING_OWNER = OperationModel.new(
        name: "DisassociateCapacityReservationBillingOwner",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_CLIENT_VPN_TARGET_NETWORK = OperationModel.new(
        name: "DisassociateClientVpnTargetNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ENCLAVE_CERTIFICATE_IAM_ROLE = OperationModel.new(
        name: "DisassociateEnclaveCertificateIamRole",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_IAM_INSTANCE_PROFILE = OperationModel.new(
        name: "DisassociateIamInstanceProfile",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_INSTANCE_EVENT_WINDOW = OperationModel.new(
        name: "DisassociateInstanceEventWindow",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_IPAM_BYOASN = OperationModel.new(
        name: "DisassociateIpamByoasn",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_IPAM_RESOURCE_DISCOVERY = OperationModel.new(
        name: "DisassociateIpamResourceDiscovery",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_NAT_GATEWAY_ADDRESS = OperationModel.new(
        name: "DisassociateNatGatewayAddress",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ROUTE_SERVER = OperationModel.new(
        name: "DisassociateRouteServer",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_ROUTE_TABLE = OperationModel.new(
        name: "DisassociateRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SECURITY_GROUP_VPC = OperationModel.new(
        name: "DisassociateSecurityGroupVpc",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_SUBNET_CIDR_BLOCK = OperationModel.new(
        name: "DisassociateSubnetCidrBlock",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_TRANSIT_GATEWAY_MULTICAST_DOMAIN = OperationModel.new(
        name: "DisassociateTransitGatewayMulticastDomain",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_TRANSIT_GATEWAY_POLICY_TABLE = OperationModel.new(
        name: "DisassociateTransitGatewayPolicyTable",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_TRANSIT_GATEWAY_ROUTE_TABLE = OperationModel.new(
        name: "DisassociateTransitGatewayRouteTable",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_TRUNK_INTERFACE = OperationModel.new(
        name: "DisassociateTrunkInterface",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_VPC_CIDR_BLOCK = OperationModel.new(
        name: "DisassociateVpcCidrBlock",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ADDRESS_TRANSFER = OperationModel.new(
        name: "EnableAddressTransfer",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ALLOWED_IMAGES_SETTINGS = OperationModel.new(
        name: "EnableAllowedImagesSettings",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_AWS_NETWORK_PERFORMANCE_METRIC_SUBSCRIPTION = OperationModel.new(
        name: "EnableAwsNetworkPerformanceMetricSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_CAPACITY_MANAGER = OperationModel.new(
        name: "EnableCapacityManager",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_EBS_ENCRYPTION_BY_DEFAULT = OperationModel.new(
        name: "EnableEbsEncryptionByDefault",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_FAST_LAUNCH = OperationModel.new(
        name: "EnableFastLaunch",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_FAST_SNAPSHOT_RESTORES = OperationModel.new(
        name: "EnableFastSnapshotRestores",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_IMAGE = OperationModel.new(
        name: "EnableImage",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_IMAGE_BLOCK_PUBLIC_ACCESS = OperationModel.new(
        name: "EnableImageBlockPublicAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_IMAGE_DEPRECATION = OperationModel.new(
        name: "EnableImageDeprecation",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_IMAGE_DEREGISTRATION_PROTECTION = OperationModel.new(
        name: "EnableImageDeregistrationProtection",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_INSTANCE_SQL_HA_STANDBY_DETECTIONS = OperationModel.new(
        name: "EnableInstanceSqlHaStandbyDetections",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_IPAM_ORGANIZATION_ADMIN_ACCOUNT = OperationModel.new(
        name: "EnableIpamOrganizationAdminAccount",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_IPAM_POLICY = OperationModel.new(
        name: "EnableIpamPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_REACHABILITY_ANALYZER_ORGANIZATION_SHARING = OperationModel.new(
        name: "EnableReachabilityAnalyzerOrganizationSharing",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_ROUTE_SERVER_PROPAGATION = OperationModel.new(
        name: "EnableRouteServerPropagation",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_SERIAL_CONSOLE_ACCESS = OperationModel.new(
        name: "EnableSerialConsoleAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_SNAPSHOT_BLOCK_PUBLIC_ACCESS = OperationModel.new(
        name: "EnableSnapshotBlockPublicAccess",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_TRANSIT_GATEWAY_ROUTE_TABLE_PROPAGATION = OperationModel.new(
        name: "EnableTransitGatewayRouteTablePropagation",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_VGW_ROUTE_PROPAGATION = OperationModel.new(
        name: "EnableVgwRoutePropagation",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_VOLUME_IO = OperationModel.new(
        name: "EnableVolumeIO",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_VPC_CLASSIC_LINK = OperationModel.new(
        name: "EnableVpcClassicLink",
        http_method: "POST",
        request_uri: "/"
      )

      ENABLE_VPC_CLASSIC_LINK_DNS_SUPPORT = OperationModel.new(
        name: "EnableVpcClassicLinkDnsSupport",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_CLIENT_VPN_CLIENT_CERTIFICATE_REVOCATION_LIST = OperationModel.new(
        name: "ExportClientVpnClientCertificateRevocationList",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_CLIENT_VPN_CLIENT_CONFIGURATION = OperationModel.new(
        name: "ExportClientVpnClientConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_IMAGE = OperationModel.new(
        name: "ExportImage",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_TRANSIT_GATEWAY_ROUTES = OperationModel.new(
        name: "ExportTransitGatewayRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_VERIFIED_ACCESS_INSTANCE_CLIENT_CONFIGURATION = OperationModel.new(
        name: "ExportVerifiedAccessInstanceClientConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ACTIVE_VPN_TUNNEL_STATUS = OperationModel.new(
        name: "GetActiveVpnTunnelStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ALLOWED_IMAGES_SETTINGS = OperationModel.new(
        name: "GetAllowedImagesSettings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ASSOCIATED_ENCLAVE_CERTIFICATE_IAM_ROLES = OperationModel.new(
        name: "GetAssociatedEnclaveCertificateIamRoles",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ASSOCIATED_IPV6_POOL_CIDRS = OperationModel.new(
        name: "GetAssociatedIpv6PoolCidrs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_AWS_NETWORK_PERFORMANCE_DATA = OperationModel.new(
        name: "GetAwsNetworkPerformanceData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPACITY_MANAGER_ATTRIBUTES = OperationModel.new(
        name: "GetCapacityManagerAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPACITY_MANAGER_METRIC_DATA = OperationModel.new(
        name: "GetCapacityManagerMetricData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPACITY_MANAGER_METRIC_DIMENSIONS = OperationModel.new(
        name: "GetCapacityManagerMetricDimensions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CAPACITY_RESERVATION_USAGE = OperationModel.new(
        name: "GetCapacityReservationUsage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_COIP_POOL_USAGE = OperationModel.new(
        name: "GetCoipPoolUsage",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONSOLE_OUTPUT = OperationModel.new(
        name: "GetConsoleOutput",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONSOLE_SCREENSHOT = OperationModel.new(
        name: "GetConsoleScreenshot",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DECLARATIVE_POLICIES_REPORT_SUMMARY = OperationModel.new(
        name: "GetDeclarativePoliciesReportSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DEFAULT_CREDIT_SPECIFICATION = OperationModel.new(
        name: "GetDefaultCreditSpecification",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EBS_DEFAULT_KMS_KEY_ID = OperationModel.new(
        name: "GetEbsDefaultKmsKeyId",
        http_method: "POST",
        request_uri: "/"
      )

      GET_EBS_ENCRYPTION_BY_DEFAULT = OperationModel.new(
        name: "GetEbsEncryptionByDefault",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ENABLED_IPAM_POLICY = OperationModel.new(
        name: "GetEnabledIpamPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_FLOW_LOGS_INTEGRATION_TEMPLATE = OperationModel.new(
        name: "GetFlowLogsIntegrationTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      GET_GROUPS_FOR_CAPACITY_RESERVATION = OperationModel.new(
        name: "GetGroupsForCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HOST_RESERVATION_PURCHASE_PREVIEW = OperationModel.new(
        name: "GetHostReservationPurchasePreview",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IMAGE_ANCESTRY = OperationModel.new(
        name: "GetImageAncestry",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IMAGE_BLOCK_PUBLIC_ACCESS_STATE = OperationModel.new(
        name: "GetImageBlockPublicAccessState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_METADATA_DEFAULTS = OperationModel.new(
        name: "GetInstanceMetadataDefaults",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_TPM_EK_PUB = OperationModel.new(
        name: "GetInstanceTpmEkPub",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_TYPES_FROM_INSTANCE_REQUIREMENTS = OperationModel.new(
        name: "GetInstanceTypesFromInstanceRequirements",
        http_method: "POST",
        request_uri: "/"
      )

      GET_INSTANCE_UEFI_DATA = OperationModel.new(
        name: "GetInstanceUefiData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_ADDRESS_HISTORY = OperationModel.new(
        name: "GetIpamAddressHistory",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_DISCOVERED_ACCOUNTS = OperationModel.new(
        name: "GetIpamDiscoveredAccounts",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_DISCOVERED_PUBLIC_ADDRESSES = OperationModel.new(
        name: "GetIpamDiscoveredPublicAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_DISCOVERED_RESOURCE_CIDRS = OperationModel.new(
        name: "GetIpamDiscoveredResourceCidrs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_POLICY_ALLOCATION_RULES = OperationModel.new(
        name: "GetIpamPolicyAllocationRules",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_POLICY_ORGANIZATION_TARGETS = OperationModel.new(
        name: "GetIpamPolicyOrganizationTargets",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_POOL_ALLOCATIONS = OperationModel.new(
        name: "GetIpamPoolAllocations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_POOL_CIDRS = OperationModel.new(
        name: "GetIpamPoolCidrs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_PREFIX_LIST_RESOLVER_RULES = OperationModel.new(
        name: "GetIpamPrefixListResolverRules",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_PREFIX_LIST_RESOLVER_VERSION_ENTRIES = OperationModel.new(
        name: "GetIpamPrefixListResolverVersionEntries",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_PREFIX_LIST_RESOLVER_VERSIONS = OperationModel.new(
        name: "GetIpamPrefixListResolverVersions",
        http_method: "POST",
        request_uri: "/"
      )

      GET_IPAM_RESOURCE_CIDRS = OperationModel.new(
        name: "GetIpamResourceCidrs",
        http_method: "POST",
        request_uri: "/"
      )

      GET_LAUNCH_TEMPLATE_DATA = OperationModel.new(
        name: "GetLaunchTemplateData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MANAGED_PREFIX_LIST_ASSOCIATIONS = OperationModel.new(
        name: "GetManagedPrefixListAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_MANAGED_PREFIX_LIST_ENTRIES = OperationModel.new(
        name: "GetManagedPrefixListEntries",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NETWORK_INSIGHTS_ACCESS_SCOPE_ANALYSIS_FINDINGS = OperationModel.new(
        name: "GetNetworkInsightsAccessScopeAnalysisFindings",
        http_method: "POST",
        request_uri: "/"
      )

      GET_NETWORK_INSIGHTS_ACCESS_SCOPE_CONTENT = OperationModel.new(
        name: "GetNetworkInsightsAccessScopeContent",
        http_method: "POST",
        request_uri: "/"
      )

      GET_PASSWORD_DATA = OperationModel.new(
        name: "GetPasswordData",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESERVED_INSTANCES_EXCHANGE_QUOTE = OperationModel.new(
        name: "GetReservedInstancesExchangeQuote",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROUTE_SERVER_ASSOCIATIONS = OperationModel.new(
        name: "GetRouteServerAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROUTE_SERVER_PROPAGATIONS = OperationModel.new(
        name: "GetRouteServerPropagations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ROUTE_SERVER_ROUTING_DATABASE = OperationModel.new(
        name: "GetRouteServerRoutingDatabase",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SECURITY_GROUPS_FOR_VPC = OperationModel.new(
        name: "GetSecurityGroupsForVpc",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SERIAL_CONSOLE_ACCESS_STATUS = OperationModel.new(
        name: "GetSerialConsoleAccessStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SNAPSHOT_BLOCK_PUBLIC_ACCESS_STATE = OperationModel.new(
        name: "GetSnapshotBlockPublicAccessState",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SPOT_PLACEMENT_SCORES = OperationModel.new(
        name: "GetSpotPlacementScores",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SUBNET_CIDR_RESERVATIONS = OperationModel.new(
        name: "GetSubnetCidrReservations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_ATTACHMENT_PROPAGATIONS = OperationModel.new(
        name: "GetTransitGatewayAttachmentPropagations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_METERING_POLICY_ENTRIES = OperationModel.new(
        name: "GetTransitGatewayMeteringPolicyEntries",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_MULTICAST_DOMAIN_ASSOCIATIONS = OperationModel.new(
        name: "GetTransitGatewayMulticastDomainAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_POLICY_TABLE_ASSOCIATIONS = OperationModel.new(
        name: "GetTransitGatewayPolicyTableAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_POLICY_TABLE_ENTRIES = OperationModel.new(
        name: "GetTransitGatewayPolicyTableEntries",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_PREFIX_LIST_REFERENCES = OperationModel.new(
        name: "GetTransitGatewayPrefixListReferences",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_ROUTE_TABLE_ASSOCIATIONS = OperationModel.new(
        name: "GetTransitGatewayRouteTableAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_TRANSIT_GATEWAY_ROUTE_TABLE_PROPAGATIONS = OperationModel.new(
        name: "GetTransitGatewayRouteTablePropagations",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VERIFIED_ACCESS_ENDPOINT_POLICY = OperationModel.new(
        name: "GetVerifiedAccessEndpointPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VERIFIED_ACCESS_ENDPOINT_TARGETS = OperationModel.new(
        name: "GetVerifiedAccessEndpointTargets",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VERIFIED_ACCESS_GROUP_POLICY = OperationModel.new(
        name: "GetVerifiedAccessGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VPC_RESOURCES_BLOCKING_ENCRYPTION_ENFORCEMENT = OperationModel.new(
        name: "GetVpcResourcesBlockingEncryptionEnforcement",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VPN_CONNECTION_DEVICE_SAMPLE_CONFIGURATION = OperationModel.new(
        name: "GetVpnConnectionDeviceSampleConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VPN_CONNECTION_DEVICE_TYPES = OperationModel.new(
        name: "GetVpnConnectionDeviceTypes",
        http_method: "POST",
        request_uri: "/"
      )

      GET_VPN_TUNNEL_REPLACEMENT_STATUS = OperationModel.new(
        name: "GetVpnTunnelReplacementStatus",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_CLIENT_VPN_CLIENT_CERTIFICATE_REVOCATION_LIST = OperationModel.new(
        name: "ImportClientVpnClientCertificateRevocationList",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_IMAGE = OperationModel.new(
        name: "ImportImage",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_INSTANCE = OperationModel.new(
        name: "ImportInstance",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_KEY_PAIR = OperationModel.new(
        name: "ImportKeyPair",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_SNAPSHOT = OperationModel.new(
        name: "ImportSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      IMPORT_VOLUME = OperationModel.new(
        name: "ImportVolume",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_IMAGES_IN_RECYCLE_BIN = OperationModel.new(
        name: "ListImagesInRecycleBin",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SNAPSHOTS_IN_RECYCLE_BIN = OperationModel.new(
        name: "ListSnapshotsInRecycleBin",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_VOLUMES_IN_RECYCLE_BIN = OperationModel.new(
        name: "ListVolumesInRecycleBin",
        http_method: "POST",
        request_uri: "/"
      )

      LOCK_SNAPSHOT = OperationModel.new(
        name: "LockSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ADDRESS_ATTRIBUTE = OperationModel.new(
        name: "ModifyAddressAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_AVAILABILITY_ZONE_GROUP = OperationModel.new(
        name: "ModifyAvailabilityZoneGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CAPACITY_RESERVATION = OperationModel.new(
        name: "ModifyCapacityReservation",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CAPACITY_RESERVATION_FLEET = OperationModel.new(
        name: "ModifyCapacityReservationFleet",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CLIENT_VPN_ENDPOINT = OperationModel.new(
        name: "ModifyClientVpnEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DEFAULT_CREDIT_SPECIFICATION = OperationModel.new(
        name: "ModifyDefaultCreditSpecification",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_EBS_DEFAULT_KMS_KEY_ID = OperationModel.new(
        name: "ModifyEbsDefaultKmsKeyId",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_FLEET = OperationModel.new(
        name: "ModifyFleet",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_FPGA_IMAGE_ATTRIBUTE = OperationModel.new(
        name: "ModifyFpgaImageAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_HOSTS = OperationModel.new(
        name: "ModifyHosts",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ID_FORMAT = OperationModel.new(
        name: "ModifyIdFormat",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IDENTITY_ID_FORMAT = OperationModel.new(
        name: "ModifyIdentityIdFormat",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IMAGE_ATTRIBUTE = OperationModel.new(
        name: "ModifyImageAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_ATTRIBUTE = OperationModel.new(
        name: "ModifyInstanceAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_CAPACITY_RESERVATION_ATTRIBUTES = OperationModel.new(
        name: "ModifyInstanceCapacityReservationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_CONNECT_ENDPOINT = OperationModel.new(
        name: "ModifyInstanceConnectEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_CPU_OPTIONS = OperationModel.new(
        name: "ModifyInstanceCpuOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_CREDIT_SPECIFICATION = OperationModel.new(
        name: "ModifyInstanceCreditSpecification",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_EVENT_START_TIME = OperationModel.new(
        name: "ModifyInstanceEventStartTime",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_EVENT_WINDOW = OperationModel.new(
        name: "ModifyInstanceEventWindow",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_MAINTENANCE_OPTIONS = OperationModel.new(
        name: "ModifyInstanceMaintenanceOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_METADATA_DEFAULTS = OperationModel.new(
        name: "ModifyInstanceMetadataDefaults",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_METADATA_OPTIONS = OperationModel.new(
        name: "ModifyInstanceMetadataOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_NETWORK_PERFORMANCE_OPTIONS = OperationModel.new(
        name: "ModifyInstanceNetworkPerformanceOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_INSTANCE_PLACEMENT = OperationModel.new(
        name: "ModifyInstancePlacement",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM = OperationModel.new(
        name: "ModifyIpam",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_POLICY_ALLOCATION_RULES = OperationModel.new(
        name: "ModifyIpamPolicyAllocationRules",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_POOL = OperationModel.new(
        name: "ModifyIpamPool",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_PREFIX_LIST_RESOLVER = OperationModel.new(
        name: "ModifyIpamPrefixListResolver",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_PREFIX_LIST_RESOLVER_TARGET = OperationModel.new(
        name: "ModifyIpamPrefixListResolverTarget",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_RESOURCE_CIDR = OperationModel.new(
        name: "ModifyIpamResourceCidr",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_RESOURCE_DISCOVERY = OperationModel.new(
        name: "ModifyIpamResourceDiscovery",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_IPAM_SCOPE = OperationModel.new(
        name: "ModifyIpamScope",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LAUNCH_TEMPLATE = OperationModel.new(
        name: "ModifyLaunchTemplate",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_LOCAL_GATEWAY_ROUTE = OperationModel.new(
        name: "ModifyLocalGatewayRoute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_MANAGED_PREFIX_LIST = OperationModel.new(
        name: "ModifyManagedPrefixList",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_NETWORK_INTERFACE_ATTRIBUTE = OperationModel.new(
        name: "ModifyNetworkInterfaceAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_PRIVATE_DNS_NAME_OPTIONS = OperationModel.new(
        name: "ModifyPrivateDnsNameOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_PUBLIC_IP_DNS_NAME_OPTIONS = OperationModel.new(
        name: "ModifyPublicIpDnsNameOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_RESERVED_INSTANCES = OperationModel.new(
        name: "ModifyReservedInstances",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_ROUTE_SERVER = OperationModel.new(
        name: "ModifyRouteServer",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SECURITY_GROUP_RULES = OperationModel.new(
        name: "ModifySecurityGroupRules",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SNAPSHOT_ATTRIBUTE = OperationModel.new(
        name: "ModifySnapshotAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SNAPSHOT_TIER = OperationModel.new(
        name: "ModifySnapshotTier",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SPOT_FLEET_REQUEST = OperationModel.new(
        name: "ModifySpotFleetRequest",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SUBNET_ATTRIBUTE = OperationModel.new(
        name: "ModifySubnetAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRAFFIC_MIRROR_FILTER_NETWORK_SERVICES = OperationModel.new(
        name: "ModifyTrafficMirrorFilterNetworkServices",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRAFFIC_MIRROR_FILTER_RULE = OperationModel.new(
        name: "ModifyTrafficMirrorFilterRule",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRAFFIC_MIRROR_SESSION = OperationModel.new(
        name: "ModifyTrafficMirrorSession",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRANSIT_GATEWAY = OperationModel.new(
        name: "ModifyTransitGateway",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRANSIT_GATEWAY_METERING_POLICY = OperationModel.new(
        name: "ModifyTransitGatewayMeteringPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRANSIT_GATEWAY_PREFIX_LIST_REFERENCE = OperationModel.new(
        name: "ModifyTransitGatewayPrefixListReference",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_TRANSIT_GATEWAY_VPC_ATTACHMENT = OperationModel.new(
        name: "ModifyTransitGatewayVpcAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_ENDPOINT = OperationModel.new(
        name: "ModifyVerifiedAccessEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_ENDPOINT_POLICY = OperationModel.new(
        name: "ModifyVerifiedAccessEndpointPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_GROUP = OperationModel.new(
        name: "ModifyVerifiedAccessGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_GROUP_POLICY = OperationModel.new(
        name: "ModifyVerifiedAccessGroupPolicy",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_INSTANCE = OperationModel.new(
        name: "ModifyVerifiedAccessInstance",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_INSTANCE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "ModifyVerifiedAccessInstanceLoggingConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VERIFIED_ACCESS_TRUST_PROVIDER = OperationModel.new(
        name: "ModifyVerifiedAccessTrustProvider",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VOLUME = OperationModel.new(
        name: "ModifyVolume",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VOLUME_ATTRIBUTE = OperationModel.new(
        name: "ModifyVolumeAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ATTRIBUTE = OperationModel.new(
        name: "ModifyVpcAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_BLOCK_PUBLIC_ACCESS_EXCLUSION = OperationModel.new(
        name: "ModifyVpcBlockPublicAccessExclusion",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_BLOCK_PUBLIC_ACCESS_OPTIONS = OperationModel.new(
        name: "ModifyVpcBlockPublicAccessOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ENCRYPTION_CONTROL = OperationModel.new(
        name: "ModifyVpcEncryptionControl",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ENDPOINT = OperationModel.new(
        name: "ModifyVpcEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ENDPOINT_CONNECTION_NOTIFICATION = OperationModel.new(
        name: "ModifyVpcEndpointConnectionNotification",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ENDPOINT_SERVICE_CONFIGURATION = OperationModel.new(
        name: "ModifyVpcEndpointServiceConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ENDPOINT_SERVICE_PAYER_RESPONSIBILITY = OperationModel.new(
        name: "ModifyVpcEndpointServicePayerResponsibility",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_ENDPOINT_SERVICE_PERMISSIONS = OperationModel.new(
        name: "ModifyVpcEndpointServicePermissions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_PEERING_CONNECTION_OPTIONS = OperationModel.new(
        name: "ModifyVpcPeeringConnectionOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPC_TENANCY = OperationModel.new(
        name: "ModifyVpcTenancy",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPN_CONNECTION = OperationModel.new(
        name: "ModifyVpnConnection",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPN_CONNECTION_OPTIONS = OperationModel.new(
        name: "ModifyVpnConnectionOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPN_TUNNEL_CERTIFICATE = OperationModel.new(
        name: "ModifyVpnTunnelCertificate",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_VPN_TUNNEL_OPTIONS = OperationModel.new(
        name: "ModifyVpnTunnelOptions",
        http_method: "POST",
        request_uri: "/"
      )

      MONITOR_INSTANCES = OperationModel.new(
        name: "MonitorInstances",
        http_method: "POST",
        request_uri: "/"
      )

      MOVE_ADDRESS_TO_VPC = OperationModel.new(
        name: "MoveAddressToVpc",
        http_method: "POST",
        request_uri: "/"
      )

      MOVE_BYOIP_CIDR_TO_IPAM = OperationModel.new(
        name: "MoveByoipCidrToIpam",
        http_method: "POST",
        request_uri: "/"
      )

      MOVE_CAPACITY_RESERVATION_INSTANCES = OperationModel.new(
        name: "MoveCapacityReservationInstances",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_BYOIP_CIDR = OperationModel.new(
        name: "ProvisionByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_IPAM_BYOASN = OperationModel.new(
        name: "ProvisionIpamByoasn",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_IPAM_POOL_CIDR = OperationModel.new(
        name: "ProvisionIpamPoolCidr",
        http_method: "POST",
        request_uri: "/"
      )

      PROVISION_PUBLIC_IPV4_POOL_CIDR = OperationModel.new(
        name: "ProvisionPublicIpv4PoolCidr",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_CAPACITY_BLOCK = OperationModel.new(
        name: "PurchaseCapacityBlock",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_CAPACITY_BLOCK_EXTENSION = OperationModel.new(
        name: "PurchaseCapacityBlockExtension",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_HOST_RESERVATION = OperationModel.new(
        name: "PurchaseHostReservation",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_RESERVED_INSTANCES_OFFERING = OperationModel.new(
        name: "PurchaseReservedInstancesOffering",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_SCHEDULED_INSTANCES = OperationModel.new(
        name: "PurchaseScheduledInstances",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_INSTANCES = OperationModel.new(
        name: "RebootInstances",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_IMAGE = OperationModel.new(
        name: "RegisterImage",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_INSTANCE_EVENT_NOTIFICATION_ATTRIBUTES = OperationModel.new(
        name: "RegisterInstanceEventNotificationAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TRANSIT_GATEWAY_MULTICAST_GROUP_MEMBERS = OperationModel.new(
        name: "RegisterTransitGatewayMulticastGroupMembers",
        http_method: "POST",
        request_uri: "/"
      )

      REGISTER_TRANSIT_GATEWAY_MULTICAST_GROUP_SOURCES = OperationModel.new(
        name: "RegisterTransitGatewayMulticastGroupSources",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_CAPACITY_RESERVATION_BILLING_OWNERSHIP = OperationModel.new(
        name: "RejectCapacityReservationBillingOwnership",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_TRANSIT_GATEWAY_MULTICAST_DOMAIN_ASSOCIATIONS = OperationModel.new(
        name: "RejectTransitGatewayMulticastDomainAssociations",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_TRANSIT_GATEWAY_PEERING_ATTACHMENT = OperationModel.new(
        name: "RejectTransitGatewayPeeringAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_TRANSIT_GATEWAY_VPC_ATTACHMENT = OperationModel.new(
        name: "RejectTransitGatewayVpcAttachment",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_VPC_ENDPOINT_CONNECTIONS = OperationModel.new(
        name: "RejectVpcEndpointConnections",
        http_method: "POST",
        request_uri: "/"
      )

      REJECT_VPC_PEERING_CONNECTION = OperationModel.new(
        name: "RejectVpcPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_ADDRESS = OperationModel.new(
        name: "ReleaseAddress",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_HOSTS = OperationModel.new(
        name: "ReleaseHosts",
        http_method: "POST",
        request_uri: "/"
      )

      RELEASE_IPAM_POOL_ALLOCATION = OperationModel.new(
        name: "ReleaseIpamPoolAllocation",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_IAM_INSTANCE_PROFILE_ASSOCIATION = OperationModel.new(
        name: "ReplaceIamInstanceProfileAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_IMAGE_CRITERIA_IN_ALLOWED_IMAGES_SETTINGS = OperationModel.new(
        name: "ReplaceImageCriteriaInAllowedImagesSettings",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_NETWORK_ACL_ASSOCIATION = OperationModel.new(
        name: "ReplaceNetworkAclAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_NETWORK_ACL_ENTRY = OperationModel.new(
        name: "ReplaceNetworkAclEntry",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_ROUTE = OperationModel.new(
        name: "ReplaceRoute",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_ROUTE_TABLE_ASSOCIATION = OperationModel.new(
        name: "ReplaceRouteTableAssociation",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_TRANSIT_GATEWAY_ROUTE = OperationModel.new(
        name: "ReplaceTransitGatewayRoute",
        http_method: "POST",
        request_uri: "/"
      )

      REPLACE_VPN_TUNNEL = OperationModel.new(
        name: "ReplaceVpnTunnel",
        http_method: "POST",
        request_uri: "/"
      )

      REPORT_INSTANCE_STATUS = OperationModel.new(
        name: "ReportInstanceStatus",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_SPOT_FLEET = OperationModel.new(
        name: "RequestSpotFleet",
        http_method: "POST",
        request_uri: "/"
      )

      REQUEST_SPOT_INSTANCES = OperationModel.new(
        name: "RequestSpotInstances",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_ADDRESS_ATTRIBUTE = OperationModel.new(
        name: "ResetAddressAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_EBS_DEFAULT_KMS_KEY_ID = OperationModel.new(
        name: "ResetEbsDefaultKmsKeyId",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_FPGA_IMAGE_ATTRIBUTE = OperationModel.new(
        name: "ResetFpgaImageAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_IMAGE_ATTRIBUTE = OperationModel.new(
        name: "ResetImageAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_INSTANCE_ATTRIBUTE = OperationModel.new(
        name: "ResetInstanceAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_NETWORK_INTERFACE_ATTRIBUTE = OperationModel.new(
        name: "ResetNetworkInterfaceAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_SNAPSHOT_ATTRIBUTE = OperationModel.new(
        name: "ResetSnapshotAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_ADDRESS_TO_CLASSIC = OperationModel.new(
        name: "RestoreAddressToClassic",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_IMAGE_FROM_RECYCLE_BIN = OperationModel.new(
        name: "RestoreImageFromRecycleBin",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_MANAGED_PREFIX_LIST_VERSION = OperationModel.new(
        name: "RestoreManagedPrefixListVersion",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_SNAPSHOT_FROM_RECYCLE_BIN = OperationModel.new(
        name: "RestoreSnapshotFromRecycleBin",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_SNAPSHOT_TIER = OperationModel.new(
        name: "RestoreSnapshotTier",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_VOLUME_FROM_RECYCLE_BIN = OperationModel.new(
        name: "RestoreVolumeFromRecycleBin",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_CLIENT_VPN_INGRESS = OperationModel.new(
        name: "RevokeClientVpnIngress",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_SECURITY_GROUP_EGRESS = OperationModel.new(
        name: "RevokeSecurityGroupEgress",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_SECURITY_GROUP_INGRESS = OperationModel.new(
        name: "RevokeSecurityGroupIngress",
        http_method: "POST",
        request_uri: "/"
      )

      RUN_INSTANCES = OperationModel.new(
        name: "RunInstances",
        http_method: "POST",
        request_uri: "/"
      )

      RUN_SCHEDULED_INSTANCES = OperationModel.new(
        name: "RunScheduledInstances",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_LOCAL_GATEWAY_ROUTES = OperationModel.new(
        name: "SearchLocalGatewayRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_TRANSIT_GATEWAY_MULTICAST_GROUPS = OperationModel.new(
        name: "SearchTransitGatewayMulticastGroups",
        http_method: "POST",
        request_uri: "/"
      )

      SEARCH_TRANSIT_GATEWAY_ROUTES = OperationModel.new(
        name: "SearchTransitGatewayRoutes",
        http_method: "POST",
        request_uri: "/"
      )

      SEND_DIAGNOSTIC_INTERRUPT = OperationModel.new(
        name: "SendDiagnosticInterrupt",
        http_method: "POST",
        request_uri: "/"
      )

      START_DECLARATIVE_POLICIES_REPORT = OperationModel.new(
        name: "StartDeclarativePoliciesReport",
        http_method: "POST",
        request_uri: "/"
      )

      START_INSTANCES = OperationModel.new(
        name: "StartInstances",
        http_method: "POST",
        request_uri: "/"
      )

      START_NETWORK_INSIGHTS_ACCESS_SCOPE_ANALYSIS = OperationModel.new(
        name: "StartNetworkInsightsAccessScopeAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      START_NETWORK_INSIGHTS_ANALYSIS = OperationModel.new(
        name: "StartNetworkInsightsAnalysis",
        http_method: "POST",
        request_uri: "/"
      )

      START_VPC_ENDPOINT_SERVICE_PRIVATE_DNS_VERIFICATION = OperationModel.new(
        name: "StartVpcEndpointServicePrivateDnsVerification",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_INSTANCES = OperationModel.new(
        name: "StopInstances",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_CLIENT_VPN_CONNECTIONS = OperationModel.new(
        name: "TerminateClientVpnConnections",
        http_method: "POST",
        request_uri: "/"
      )

      TERMINATE_INSTANCES = OperationModel.new(
        name: "TerminateInstances",
        http_method: "POST",
        request_uri: "/"
      )

      UNASSIGN_IPV6_ADDRESSES = OperationModel.new(
        name: "UnassignIpv6Addresses",
        http_method: "POST",
        request_uri: "/"
      )

      UNASSIGN_PRIVATE_IP_ADDRESSES = OperationModel.new(
        name: "UnassignPrivateIpAddresses",
        http_method: "POST",
        request_uri: "/"
      )

      UNASSIGN_PRIVATE_NAT_GATEWAY_ADDRESS = OperationModel.new(
        name: "UnassignPrivateNatGatewayAddress",
        http_method: "POST",
        request_uri: "/"
      )

      UNLOCK_SNAPSHOT = OperationModel.new(
        name: "UnlockSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      UNMONITOR_INSTANCES = OperationModel.new(
        name: "UnmonitorInstances",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CAPACITY_MANAGER_ORGANIZATIONS_ACCESS = OperationModel.new(
        name: "UpdateCapacityManagerOrganizationsAccess",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_INTERRUPTIBLE_CAPACITY_RESERVATION_ALLOCATION = OperationModel.new(
        name: "UpdateInterruptibleCapacityReservationAllocation",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SECURITY_GROUP_RULE_DESCRIPTIONS_EGRESS = OperationModel.new(
        name: "UpdateSecurityGroupRuleDescriptionsEgress",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SECURITY_GROUP_RULE_DESCRIPTIONS_INGRESS = OperationModel.new(
        name: "UpdateSecurityGroupRuleDescriptionsIngress",
        http_method: "POST",
        request_uri: "/"
      )

      WITHDRAW_BYOIP_CIDR = OperationModel.new(
        name: "WithdrawByoipCidr",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
