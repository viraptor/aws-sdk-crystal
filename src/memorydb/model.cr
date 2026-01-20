module Aws
  module MemoryDB
    module Model
      API_VERSION = "2021-01-01"
      TARGET_PREFIX = "AmazonMemoryDB"
      SIGNING_NAME = "memorydb"
      ENDPOINT_PREFIX = "memory-db"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://memory-db-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://memory-db-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://memory-db.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"Region"},"fips"]}],"endpoint":{"url":"https://memory-db-fips.us-west-1.amazonaws.com","properties":{"authSchemes":[{"name":"sigv4","signingName":"memorydb","signingRegion":"us-west-1"}]},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://memory-db.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_UPDATE_CLUSTER = OperationModel.new(
        name: "BatchUpdateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_SNAPSHOT = OperationModel.new(
        name: "CopySnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_ACL = OperationModel.new(
        name: "CreateACL",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_MULTI_REGION_CLUSTER = OperationModel.new(
        name: "CreateMultiRegionCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_PARAMETER_GROUP = OperationModel.new(
        name: "CreateParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SUBNET_GROUP = OperationModel.new(
        name: "CreateSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_ACL = OperationModel.new(
        name: "DeleteACL",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_MULTI_REGION_CLUSTER = OperationModel.new(
        name: "DeleteMultiRegionCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_PARAMETER_GROUP = OperationModel.new(
        name: "DeleteParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT = OperationModel.new(
        name: "DeleteSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SUBNET_GROUP = OperationModel.new(
        name: "DeleteSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_AC_LS = OperationModel.new(
        name: "DescribeACLs",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CLUSTERS = OperationModel.new(
        name: "DescribeClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENGINE_VERSIONS = OperationModel.new(
        name: "DescribeEngineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MULTI_REGION_CLUSTERS = OperationModel.new(
        name: "DescribeMultiRegionClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MULTI_REGION_PARAMETER_GROUPS = OperationModel.new(
        name: "DescribeMultiRegionParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_MULTI_REGION_PARAMETERS = OperationModel.new(
        name: "DescribeMultiRegionParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PARAMETER_GROUPS = OperationModel.new(
        name: "DescribeParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PARAMETERS = OperationModel.new(
        name: "DescribeParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_NODES = OperationModel.new(
        name: "DescribeReservedNodes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_NODES_OFFERINGS = OperationModel.new(
        name: "DescribeReservedNodesOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVICE_UPDATES = OperationModel.new(
        name: "DescribeServiceUpdates",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SNAPSHOTS = OperationModel.new(
        name: "DescribeSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SUBNET_GROUPS = OperationModel.new(
        name: "DescribeSubnetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USERS = OperationModel.new(
        name: "DescribeUsers",
        http_method: "POST",
        request_uri: "/"
      )

      FAILOVER_SHARD = OperationModel.new(
        name: "FailoverShard",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALLOWED_MULTI_REGION_CLUSTER_UPDATES = OperationModel.new(
        name: "ListAllowedMultiRegionClusterUpdates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALLOWED_NODE_TYPE_UPDATES = OperationModel.new(
        name: "ListAllowedNodeTypeUpdates",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS = OperationModel.new(
        name: "ListTags",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_RESERVED_NODES_OFFERING = OperationModel.new(
        name: "PurchaseReservedNodesOffering",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_PARAMETER_GROUP = OperationModel.new(
        name: "ResetParameterGroup",
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

      UPDATE_ACL = OperationModel.new(
        name: "UpdateACL",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_MULTI_REGION_CLUSTER = OperationModel.new(
        name: "UpdateMultiRegionCluster",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_PARAMETER_GROUP = OperationModel.new(
        name: "UpdateParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SUBNET_GROUP = OperationModel.new(
        name: "UpdateSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_USER = OperationModel.new(
        name: "UpdateUser",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
