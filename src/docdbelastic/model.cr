module Aws
  module DocDBElastic
    module Model
      API_VERSION = "2022-11-28"
      TARGET_PREFIX = ""
      SIGNING_NAME = "docdb-elastic"
      ENDPOINT_PREFIX = "docdb-elastic"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://docdb-elastic-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://docdb-elastic-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://docdb-elastic.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://docdb-elastic.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      APPLY_PENDING_MAINTENANCE_ACTION = OperationModel.new(
        name: "ApplyPendingMaintenanceAction",
        http_method: "POST",
        request_uri: "/pending-action"
      )

      COPY_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "CopyClusterSnapshot",
        http_method: "POST",
        request_uri: "/cluster-snapshot/{snapshotArn}/copy"
      )

      CREATE_CLUSTER = OperationModel.new(
        name: "CreateCluster",
        http_method: "POST",
        request_uri: "/cluster"
      )

      CREATE_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "CreateClusterSnapshot",
        http_method: "POST",
        request_uri: "/cluster-snapshot"
      )

      DELETE_CLUSTER = OperationModel.new(
        name: "DeleteCluster",
        http_method: "DELETE",
        request_uri: "/cluster/{clusterArn}"
      )

      DELETE_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "DeleteClusterSnapshot",
        http_method: "DELETE",
        request_uri: "/cluster-snapshot/{snapshotArn}"
      )

      GET_CLUSTER = OperationModel.new(
        name: "GetCluster",
        http_method: "GET",
        request_uri: "/cluster/{clusterArn}"
      )

      GET_CLUSTER_SNAPSHOT = OperationModel.new(
        name: "GetClusterSnapshot",
        http_method: "GET",
        request_uri: "/cluster-snapshot/{snapshotArn}"
      )

      GET_PENDING_MAINTENANCE_ACTION = OperationModel.new(
        name: "GetPendingMaintenanceAction",
        http_method: "GET",
        request_uri: "/pending-action/{resourceArn}"
      )

      LIST_CLUSTER_SNAPSHOTS = OperationModel.new(
        name: "ListClusterSnapshots",
        http_method: "GET",
        request_uri: "/cluster-snapshots"
      )

      LIST_CLUSTERS = OperationModel.new(
        name: "ListClusters",
        http_method: "GET",
        request_uri: "/clusters"
      )

      LIST_PENDING_MAINTENANCE_ACTIONS = OperationModel.new(
        name: "ListPendingMaintenanceActions",
        http_method: "GET",
        request_uri: "/pending-actions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      RESTORE_CLUSTER_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreClusterFromSnapshot",
        http_method: "POST",
        request_uri: "/cluster-snapshot/{snapshotArn}/restore"
      )

      START_CLUSTER = OperationModel.new(
        name: "StartCluster",
        http_method: "POST",
        request_uri: "/cluster/{clusterArn}/start"
      )

      STOP_CLUSTER = OperationModel.new(
        name: "StopCluster",
        http_method: "POST",
        request_uri: "/cluster/{clusterArn}/stop"
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

      UPDATE_CLUSTER = OperationModel.new(
        name: "UpdateCluster",
        http_method: "PUT",
        request_uri: "/cluster/{clusterArn}"
      )
    end
  end
end
