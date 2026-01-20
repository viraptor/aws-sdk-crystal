module Aws
  module Odb
    module Model
      API_VERSION = "2024-08-20"
      TARGET_PREFIX = "Odb"
      SIGNING_NAME = "odb"
      ENDPOINT_PREFIX = "odb"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://odb-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://odb-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://odb.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://odb.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ACCEPT_MARKETPLACE_REGISTRATION = OperationModel.new(
        name: "AcceptMarketplaceRegistration",
        http_method: "POST",
        request_uri: "/"
      )

      ASSOCIATE_IAM_ROLE_TO_RESOURCE = OperationModel.new(
        name: "AssociateIamRoleToResource",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLOUD_AUTONOMOUS_VM_CLUSTER = OperationModel.new(
        name: "CreateCloudAutonomousVmCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLOUD_EXADATA_INFRASTRUCTURE = OperationModel.new(
        name: "CreateCloudExadataInfrastructure",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLOUD_VM_CLUSTER = OperationModel.new(
        name: "CreateCloudVmCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ODB_NETWORK = OperationModel.new(
        name: "CreateOdbNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ODB_PEERING_CONNECTION = OperationModel.new(
        name: "CreateOdbPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLOUD_AUTONOMOUS_VM_CLUSTER = OperationModel.new(
        name: "DeleteCloudAutonomousVmCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLOUD_EXADATA_INFRASTRUCTURE = OperationModel.new(
        name: "DeleteCloudExadataInfrastructure",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLOUD_VM_CLUSTER = OperationModel.new(
        name: "DeleteCloudVmCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ODB_NETWORK = OperationModel.new(
        name: "DeleteOdbNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ODB_PEERING_CONNECTION = OperationModel.new(
        name: "DeleteOdbPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_IAM_ROLE_FROM_RESOURCE = OperationModel.new(
        name: "DisassociateIamRoleFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLOUD_AUTONOMOUS_VM_CLUSTER = OperationModel.new(
        name: "GetCloudAutonomousVmCluster",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLOUD_EXADATA_INFRASTRUCTURE = OperationModel.new(
        name: "GetCloudExadataInfrastructure",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLOUD_EXADATA_INFRASTRUCTURE_UNALLOCATED_RESOURCES = OperationModel.new(
        name: "GetCloudExadataInfrastructureUnallocatedResources",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CLOUD_VM_CLUSTER = OperationModel.new(
        name: "GetCloudVmCluster",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DB_NODE = OperationModel.new(
        name: "GetDbNode",
        http_method: "POST",
        request_uri: "/"
      )

      GET_DB_SERVER = OperationModel.new(
        name: "GetDbServer",
        http_method: "POST",
        request_uri: "/"
      )

      GET_OCI_ONBOARDING_STATUS = OperationModel.new(
        name: "GetOciOnboardingStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ODB_NETWORK = OperationModel.new(
        name: "GetOdbNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      GET_ODB_PEERING_CONNECTION = OperationModel.new(
        name: "GetOdbPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )

      INITIALIZE_SERVICE = OperationModel.new(
        name: "InitializeService",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_AUTONOMOUS_VIRTUAL_MACHINES = OperationModel.new(
        name: "ListAutonomousVirtualMachines",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLOUD_AUTONOMOUS_VM_CLUSTERS = OperationModel.new(
        name: "ListCloudAutonomousVmClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLOUD_EXADATA_INFRASTRUCTURES = OperationModel.new(
        name: "ListCloudExadataInfrastructures",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CLOUD_VM_CLUSTERS = OperationModel.new(
        name: "ListCloudVmClusters",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_NODES = OperationModel.new(
        name: "ListDbNodes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_SERVERS = OperationModel.new(
        name: "ListDbServers",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_DB_SYSTEM_SHAPES = OperationModel.new(
        name: "ListDbSystemShapes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_GI_VERSIONS = OperationModel.new(
        name: "ListGiVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ODB_NETWORKS = OperationModel.new(
        name: "ListOdbNetworks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ODB_PEERING_CONNECTIONS = OperationModel.new(
        name: "ListOdbPeeringConnections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SYSTEM_VERSIONS = OperationModel.new(
        name: "ListSystemVersions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_DB_NODE = OperationModel.new(
        name: "RebootDbNode",
        http_method: "POST",
        request_uri: "/"
      )

      START_DB_NODE = OperationModel.new(
        name: "StartDbNode",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DB_NODE = OperationModel.new(
        name: "StopDbNode",
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

      UPDATE_CLOUD_EXADATA_INFRASTRUCTURE = OperationModel.new(
        name: "UpdateCloudExadataInfrastructure",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ODB_NETWORK = OperationModel.new(
        name: "UpdateOdbNetwork",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_ODB_PEERING_CONNECTION = OperationModel.new(
        name: "UpdateOdbPeeringConnection",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
