module Aws
  module NeptuneGraph
    module Model
      API_VERSION = "2023-11-29"
      TARGET_PREFIX = ""
      SIGNING_NAME = "neptune-graph"
      ENDPOINT_PREFIX = "neptune-graph"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"ApiType":{"required":true,"documentation":"Parameter to determine whether current API is a control plane or dataplane API","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"ControlPlane"]}],"endpoint":{"url":"https://neptune-graph-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"DataPlane"]}],"error":"Invalid Configuration: fips endpoint is not supported for this API","type":"error"},{"conditions":[],"error":"Invalid Configuration: Unknown ApiType","type":"error"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"ControlPlane"]}],"endpoint":{"url":"https://neptune-graph-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"DataPlane"]}],"error":"Invalid Configuration: fips endpoint is not supported for this API","type":"error"},{"conditions":[],"error":"Invalid Configuration: Unknown ApiType","type":"error"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"ControlPlane"]}],"endpoint":{"url":"https://neptune-graph.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"DataPlane"]}],"endpoint":{"url":"https://neptune-graph.{Region}.on.aws","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"error":"Invalid Configuration: Unknown ApiType","type":"error"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"ControlPlane"]}],"endpoint":{"url":"https://neptune-graph.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[{"fn":"stringEquals","argv":[{"ref":"ApiType"},"DataPlane"]}],"endpoint":{"url":"https://{Region}.neptune-graph.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"error":"Invalid Configuration: Unknown ApiType","type":"error"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_EXPORT_TASK = OperationModel.new(
        name: "CancelExportTask",
        http_method: "DELETE",
        request_uri: "/exporttasks/{taskIdentifier}"
      )

      CANCEL_IMPORT_TASK = OperationModel.new(
        name: "CancelImportTask",
        http_method: "DELETE",
        request_uri: "/importtasks/{taskIdentifier}"
      )

      CANCEL_QUERY = OperationModel.new(
        name: "CancelQuery",
        http_method: "DELETE",
        request_uri: "/queries/{queryId}"
      )

      CREATE_GRAPH = OperationModel.new(
        name: "CreateGraph",
        http_method: "POST",
        request_uri: "/graphs"
      )

      CREATE_GRAPH_SNAPSHOT = OperationModel.new(
        name: "CreateGraphSnapshot",
        http_method: "POST",
        request_uri: "/snapshots"
      )

      CREATE_GRAPH_USING_IMPORT_TASK = OperationModel.new(
        name: "CreateGraphUsingImportTask",
        http_method: "POST",
        request_uri: "/importtasks"
      )

      CREATE_PRIVATE_GRAPH_ENDPOINT = OperationModel.new(
        name: "CreatePrivateGraphEndpoint",
        http_method: "POST",
        request_uri: "/graphs/{graphIdentifier}/endpoints/"
      )

      DELETE_GRAPH = OperationModel.new(
        name: "DeleteGraph",
        http_method: "DELETE",
        request_uri: "/graphs/{graphIdentifier}"
      )

      DELETE_GRAPH_SNAPSHOT = OperationModel.new(
        name: "DeleteGraphSnapshot",
        http_method: "DELETE",
        request_uri: "/snapshots/{snapshotIdentifier}"
      )

      DELETE_PRIVATE_GRAPH_ENDPOINT = OperationModel.new(
        name: "DeletePrivateGraphEndpoint",
        http_method: "DELETE",
        request_uri: "/graphs/{graphIdentifier}/endpoints/{vpcId}"
      )

      EXECUTE_QUERY = OperationModel.new(
        name: "ExecuteQuery",
        http_method: "POST",
        request_uri: "/queries"
      )

      GET_EXPORT_TASK = OperationModel.new(
        name: "GetExportTask",
        http_method: "GET",
        request_uri: "/exporttasks/{taskIdentifier}"
      )

      GET_GRAPH = OperationModel.new(
        name: "GetGraph",
        http_method: "GET",
        request_uri: "/graphs/{graphIdentifier}"
      )

      GET_GRAPH_SNAPSHOT = OperationModel.new(
        name: "GetGraphSnapshot",
        http_method: "GET",
        request_uri: "/snapshots/{snapshotIdentifier}"
      )

      GET_GRAPH_SUMMARY = OperationModel.new(
        name: "GetGraphSummary",
        http_method: "GET",
        request_uri: "/summary"
      )

      GET_IMPORT_TASK = OperationModel.new(
        name: "GetImportTask",
        http_method: "GET",
        request_uri: "/importtasks/{taskIdentifier}"
      )

      GET_PRIVATE_GRAPH_ENDPOINT = OperationModel.new(
        name: "GetPrivateGraphEndpoint",
        http_method: "GET",
        request_uri: "/graphs/{graphIdentifier}/endpoints/{vpcId}"
      )

      GET_QUERY = OperationModel.new(
        name: "GetQuery",
        http_method: "GET",
        request_uri: "/queries/{queryId}"
      )

      LIST_EXPORT_TASKS = OperationModel.new(
        name: "ListExportTasks",
        http_method: "GET",
        request_uri: "/exporttasks"
      )

      LIST_GRAPH_SNAPSHOTS = OperationModel.new(
        name: "ListGraphSnapshots",
        http_method: "GET",
        request_uri: "/snapshots"
      )

      LIST_GRAPHS = OperationModel.new(
        name: "ListGraphs",
        http_method: "GET",
        request_uri: "/graphs"
      )

      LIST_IMPORT_TASKS = OperationModel.new(
        name: "ListImportTasks",
        http_method: "GET",
        request_uri: "/importtasks"
      )

      LIST_PRIVATE_GRAPH_ENDPOINTS = OperationModel.new(
        name: "ListPrivateGraphEndpoints",
        http_method: "GET",
        request_uri: "/graphs/{graphIdentifier}/endpoints/"
      )

      LIST_QUERIES = OperationModel.new(
        name: "ListQueries",
        http_method: "GET",
        request_uri: "/queries"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      RESET_GRAPH = OperationModel.new(
        name: "ResetGraph",
        http_method: "PUT",
        request_uri: "/graphs/{graphIdentifier}"
      )

      RESTORE_GRAPH_FROM_SNAPSHOT = OperationModel.new(
        name: "RestoreGraphFromSnapshot",
        http_method: "POST",
        request_uri: "/snapshots/{snapshotIdentifier}/restore"
      )

      START_EXPORT_TASK = OperationModel.new(
        name: "StartExportTask",
        http_method: "POST",
        request_uri: "/exporttasks"
      )

      START_GRAPH = OperationModel.new(
        name: "StartGraph",
        http_method: "POST",
        request_uri: "/graphs/{graphIdentifier}/start"
      )

      START_IMPORT_TASK = OperationModel.new(
        name: "StartImportTask",
        http_method: "POST",
        request_uri: "/graphs/{graphIdentifier}/importtasks"
      )

      STOP_GRAPH = OperationModel.new(
        name: "StopGraph",
        http_method: "POST",
        request_uri: "/graphs/{graphIdentifier}/stop"
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

      UPDATE_GRAPH = OperationModel.new(
        name: "UpdateGraph",
        http_method: "PATCH",
        request_uri: "/graphs/{graphIdentifier}"
      )
    end
  end
end
