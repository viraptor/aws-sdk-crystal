module Aws
  module Neptune
    module Model
      API_VERSION = "2014-10-31"
      TARGET_PREFIX = ""
      SIGNING_NAME = "rds"
      ENDPOINT_PREFIX = "rds"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rds-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://rds.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://rds-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://rds.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://rds.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_ROLE_TO_DB_CLUSTER = OperationModel.new(
        name: "AddRoleToDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_SOURCE_IDENTIFIER_TO_SUBSCRIPTION = OperationModel.new(
        name: "AddSourceIdentifierToSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      ADD_TAGS_TO_RESOURCE = OperationModel.new(
        name: "AddTagsToResource",
        http_method: "POST",
        request_uri: "/"
      )

      APPLY_PENDING_MAINTENANCE_ACTION = OperationModel.new(
        name: "ApplyPendingMaintenanceAction",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_DB_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "CopyDBClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_DB_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "CopyDBClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      COPY_DB_PARAMETER_GROUP = OperationModel.new(
        name: "CopyDBParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_CLUSTER = OperationModel.new(
        name: "CreateDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_CLUSTER_ENDPOINT = OperationModel.new(
        name: "CreateDBClusterEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "CreateDBClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "CreateDBClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_INSTANCE = OperationModel.new(
        name: "CreateDBInstance",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_PARAMETER_GROUP = OperationModel.new(
        name: "CreateDBParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_DB_SUBNET_GROUP = OperationModel.new(
        name: "CreateDBSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "CreateEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_GLOBAL_CLUSTER = OperationModel.new(
        name: "CreateGlobalCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_CLUSTER = OperationModel.new(
        name: "DeleteDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_CLUSTER_ENDPOINT = OperationModel.new(
        name: "DeleteDBClusterEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "DeleteDBClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "DeleteDBClusterSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_INSTANCE = OperationModel.new(
        name: "DeleteDBInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_PARAMETER_GROUP = OperationModel.new(
        name: "DeleteDBParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_DB_SUBNET_GROUP = OperationModel.new(
        name: "DeleteDBSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "DeleteEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_GLOBAL_CLUSTER = OperationModel.new(
        name: "DeleteGlobalCluster",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_CLUSTER_ENDPOINTS = OperationModel.new(
        name: "DescribeDBClusterEndpoints",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_CLUSTER_PARAMETER_GROUPS = OperationModel.new(
        name: "DescribeDBClusterParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_CLUSTER_PARAMETERS = OperationModel.new(
        name: "DescribeDBClusterParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_CLUSTER_SNAPSHOT_ATTRIBUTES = OperationModel.new(
        name: "DescribeDBClusterSnapshotAttributes",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_CLUSTER_SNAPSHOTS = OperationModel.new(
        name: "DescribeDBClusterSnapshots",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_CLUSTERS = OperationModel.new(
        name: "DescribeDBClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_ENGINE_VERSIONS = OperationModel.new(
        name: "DescribeDBEngineVersions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_INSTANCES = OperationModel.new(
        name: "DescribeDBInstances",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_PARAMETER_GROUPS = OperationModel.new(
        name: "DescribeDBParameterGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_PARAMETERS = OperationModel.new(
        name: "DescribeDBParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_DB_SUBNET_GROUPS = OperationModel.new(
        name: "DescribeDBSubnetGroups",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENGINE_DEFAULT_CLUSTER_PARAMETERS = OperationModel.new(
        name: "DescribeEngineDefaultClusterParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ENGINE_DEFAULT_PARAMETERS = OperationModel.new(
        name: "DescribeEngineDefaultParameters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_CATEGORIES = OperationModel.new(
        name: "DescribeEventCategories",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENT_SUBSCRIPTIONS = OperationModel.new(
        name: "DescribeEventSubscriptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_EVENTS = OperationModel.new(
        name: "DescribeEvents",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_GLOBAL_CLUSTERS = OperationModel.new(
        name: "DescribeGlobalClusters",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_ORDERABLE_DB_INSTANCE_OPTIONS = OperationModel.new(
        name: "DescribeOrderableDBInstanceOptions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_PENDING_MAINTENANCE_ACTIONS = OperationModel.new(
        name: "DescribePendingMaintenanceActions",
        http_method: "POST",
        request_uri: "/"
      )

      DESCRIBE_VALID_DB_INSTANCE_MODIFICATIONS = OperationModel.new(
        name: "DescribeValidDBInstanceModifications",
        http_method: "POST",
        request_uri: "/"
      )

      FAILOVER_DB_CLUSTER = OperationModel.new(
        name: "FailoverDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      FAILOVER_GLOBAL_CLUSTER = OperationModel.new(
        name: "FailoverGlobalCluster",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_CLUSTER = OperationModel.new(
        name: "ModifyDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_CLUSTER_ENDPOINT = OperationModel.new(
        name: "ModifyDBClusterEndpoint",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "ModifyDBClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_CLUSTER_SNAPSHOT_ATTRIBUTE = OperationModel.new(
        name: "ModifyDBClusterSnapshotAttribute",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_INSTANCE = OperationModel.new(
        name: "ModifyDBInstance",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_PARAMETER_GROUP = OperationModel.new(
        name: "ModifyDBParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_DB_SUBNET_GROUP = OperationModel.new(
        name: "ModifyDBSubnetGroup",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_EVENT_SUBSCRIPTION = OperationModel.new(
        name: "ModifyEventSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      MODIFY_GLOBAL_CLUSTER = OperationModel.new(
        name: "ModifyGlobalCluster",
        http_method: "POST",
        request_uri: "/"
      )

      PROMOTE_READ_REPLICA_DB_CLUSTER = OperationModel.new(
        name: "PromoteReadReplicaDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REBOOT_DB_INSTANCE = OperationModel.new(
        name: "RebootDBInstance",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_FROM_GLOBAL_CLUSTER = OperationModel.new(
        name: "RemoveFromGlobalCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_ROLE_FROM_DB_CLUSTER = OperationModel.new(
        name: "RemoveRoleFromDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_SOURCE_IDENTIFIER_FROM_SUBSCRIPTION = OperationModel.new(
        name: "RemoveSourceIdentifierFromSubscription",
        http_method: "POST",
        request_uri: "/"
      )

      REMOVE_TAGS_FROM_RESOURCE = OperationModel.new(
        name: "RemoveTagsFromResource",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_DB_CLUSTER_PARAMETER_GROUP = OperationModel.new(
        name: "ResetDBClusterParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      RESET_DB_PARAMETER_GROUP = OperationModel.new(
        name: "ResetDBParameterGroup",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_DB_CLUSTER_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreDBClusterFromSnapshot",
        http_method: "POST",
        request_uri: "/"
      )

      RESTORE_DB_CLUSTER_TO_POINT_IN_TIME = OperationModel.new(
        name: "RestoreDBClusterToPointInTime",
        http_method: "POST",
        request_uri: "/"
      )

      START_DB_CLUSTER = OperationModel.new(
        name: "StartDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      STOP_DB_CLUSTER = OperationModel.new(
        name: "StopDBCluster",
        http_method: "POST",
        request_uri: "/"
      )

      SWITCHOVER_GLOBAL_CLUSTER = OperationModel.new(
        name: "SwitchoverGlobalCluster",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
