module AwsSdk
  module ElastiCache
    module Model
      API_VERSION = "2015-02-02"
      TARGET_PREFIX = ""
      SIGNING_NAME = "elasticache"
      ENDPOINT_PREFIX = "elasticache"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticache-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://elasticache.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://elasticache-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://elasticache.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://elasticache.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddTagsToResource",
        http_method: "POST",
        request_uri: "/"
      )

      AUTHORIZE_CACHE_SECURITY_GROUP_INGRESS = OperationModel.new(
        name: "AuthorizeCacheSecurityGroupIngress",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_APPLY_UPDATE_ACTION = OperationModel.new(
        name: "BatchApplyUpdateAction",
        http_method: "POST",
        request_uri: "/"
      )

      BATCH_STOP_UPDATE_ACTION = OperationModel.new(
        name: "BatchStopUpdateAction",
        http_method: "POST",
        request_uri: "/"
      )

      COMPLETE_MIGRATION = OperationModel.new(
        name: "CompleteMigration",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_SERVERLESS_CACHE_SNAPSHOT = OperationModel.new(
        name: "CopyServerlessCacheSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_SNAPSHOT = OperationModel.new(
        name: "CopySnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CACHE_CLUSTER = OperationModel.new(
        name: "CreateCacheCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CACHE_PARAMETER_GROUP = OperationModel.new(
        name: "CreateCacheParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CACHE_SECURITY_GROUP = OperationModel.new(
        name: "CreateCacheSecurityGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_CACHE_SUBNET_GROUP = OperationModel.new(
        name: "CreateCacheSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "CreateGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPLICATION_GROUP = OperationModel.new(
        name: "CreateReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVERLESS_CACHE = OperationModel.new(
        name: "CreateServerlessCache",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SERVERLESS_CACHE_SNAPSHOT = OperationModel.new(
        name: "CreateServerlessCacheSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SNAPSHOT = OperationModel.new(
        name: "CreateSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER = OperationModel.new(
        name: "CreateUser",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_USER_GROUP = OperationModel.new(
        name: "CreateUserGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DECREASE_NODE_GROUPS_IN_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "DecreaseNodeGroupsInGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DECREASE_REPLICA_COUNT = OperationModel.new(
        name: "DecreaseReplicaCount",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CACHE_CLUSTER = OperationModel.new(
        name: "DeleteCacheCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CACHE_PARAMETER_GROUP = OperationModel.new(
        name: "DeleteCacheParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CACHE_SECURITY_GROUP = OperationModel.new(
        name: "DeleteCacheSecurityGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CACHE_SUBNET_GROUP = OperationModel.new(
        name: "DeleteCacheSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "DeleteGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPLICATION_GROUP = OperationModel.new(
        name: "DeleteReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVERLESS_CACHE = OperationModel.new(
        name: "DeleteServerlessCache",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SERVERLESS_CACHE_SNAPSHOT = OperationModel.new(
        name: "DeleteServerlessCacheSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SNAPSHOT = OperationModel.new(
        name: "DeleteSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER = OperationModel.new(
        name: "DeleteUser",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_USER_GROUP = OperationModel.new(
        name: "DeleteUserGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_CLUSTERS = OperationModel.new(
        name: "DescribeCacheClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_ENGINE_VERSIONS = OperationModel.new(
        name: "DescribeCacheEngineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_PARAMETER_GROUPS = OperationModel.new(
        name: "DescribeCacheParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_PARAMETERS = OperationModel.new(
        name: "DescribeCacheParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_SECURITY_GROUPS = OperationModel.new(
        name: "DescribeCacheSecurityGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_CACHE_SUBNET_GROUPS = OperationModel.new(
        name: "DescribeCacheSubnetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENGINE_DEFAULT_PARAMETERS = OperationModel.new(
        name: "DescribeEngineDefaultParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GLOBAL_REPLICATION_GROUPS = OperationModel.new(
        name: "DescribeGlobalReplicationGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_REPLICATION_GROUPS = OperationModel.new(
        name: "DescribeReplicationGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_CACHE_NODES = OperationModel.new(
        name: "DescribeReservedCacheNodes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_RESERVED_CACHE_NODES_OFFERINGS = OperationModel.new(
        name: "DescribeReservedCacheNodesOfferings",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVERLESS_CACHE_SNAPSHOTS = OperationModel.new(
        name: "DescribeServerlessCacheSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_SERVERLESS_CACHES = OperationModel.new(
        name: "DescribeServerlessCaches",
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

      DESCRIBE_UPDATE_ACTIONS = OperationModel.new(
        name: "DescribeUpdateActions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USER_GROUPS = OperationModel.new(
        name: "DescribeUserGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_USERS = OperationModel.new(
        name: "DescribeUsers",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "DisassociateGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      EXPORT_SERVERLESS_CACHE_SNAPSHOT = OperationModel.new(
        name: "ExportServerlessCacheSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      FAILOVER_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "FailoverGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      INCREASE_NODE_GROUPS_IN_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "IncreaseNodeGroupsInGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      INCREASE_REPLICA_COUNT = OperationModel.new(
        name: "IncreaseReplicaCount",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_ALLOWED_NODE_TYPE_MODIFICATIONS = OperationModel.new(
        name: "ListAllowedNodeTypeModifications",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CACHE_CLUSTER = OperationModel.new(
        name: "ModifyCacheCluster",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CACHE_PARAMETER_GROUP = OperationModel.new(
        name: "ModifyCacheParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_CACHE_SUBNET_GROUP = OperationModel.new(
        name: "ModifyCacheSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "ModifyGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REPLICATION_GROUP = OperationModel.new(
        name: "ModifyReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_REPLICATION_GROUP_SHARD_CONFIGURATION = OperationModel.new(
        name: "ModifyReplicationGroupShardConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_SERVERLESS_CACHE = OperationModel.new(
        name: "ModifyServerlessCache",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_USER = OperationModel.new(
        name: "ModifyUser",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_USER_GROUP = OperationModel.new(
        name: "ModifyUserGroup",
        http_method: "POST",
        request_uri: "/"
      )

      PURCHASE_RESERVED_CACHE_NODES_OFFERING = OperationModel.new(
        name: "PurchaseReservedCacheNodesOffering",
        http_method: "POST",
        request_uri: "/"
      )

      REBALANCE_SLOTS_IN_GLOBAL_REPLICATION_GROUP = OperationModel.new(
        name: "RebalanceSlotsInGlobalReplicationGroup",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_CACHE_CLUSTER = OperationModel.new(
        name: "RebootCacheCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_CACHE_PARAMETER_GROUP = OperationModel.new(
        name: "ResetCacheParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      REVOKE_CACHE_SECURITY_GROUP_INGRESS = OperationModel.new(
        name: "RevokeCacheSecurityGroupIngress",
        http_method: "POST",
        request_uri: "/"
      )

      START_MIGRATION = OperationModel.new(
        name: "StartMigration",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_FAILOVER = OperationModel.new(
        name: "TestFailover",
        http_method: "POST",
        request_uri: "/"
      )

      TEST_MIGRATION = OperationModel.new(
        name: "TestMigration",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
