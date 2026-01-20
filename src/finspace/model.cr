module Aws
  module Finspace
    module Model
      API_VERSION = "2021-03-12"
      TARGET_PREFIX = ""
      SIGNING_NAME = "finspace"
      ENDPOINT_PREFIX = "finspace"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://finspace-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://finspace-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://finspace.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://finspace.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ENVIRONMENT = OperationModel.new(
        name: "CreateEnvironment",
        http_method: "POST",
        request_uri: "/environment"
      )

      CREATE_KX_CHANGESET = OperationModel.new(
        name: "CreateKxChangeset",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/changesets"
      )

      CREATE_KX_CLUSTER = OperationModel.new(
        name: "CreateKxCluster",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/clusters"
      )

      CREATE_KX_DATABASE = OperationModel.new(
        name: "CreateKxDatabase",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/databases"
      )

      CREATE_KX_DATAVIEW = OperationModel.new(
        name: "CreateKxDataview",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/dataviews"
      )

      CREATE_KX_ENVIRONMENT = OperationModel.new(
        name: "CreateKxEnvironment",
        http_method: "POST",
        request_uri: "/kx/environments"
      )

      CREATE_KX_SCALING_GROUP = OperationModel.new(
        name: "CreateKxScalingGroup",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/scalingGroups"
      )

      CREATE_KX_USER = OperationModel.new(
        name: "CreateKxUser",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/users"
      )

      CREATE_KX_VOLUME = OperationModel.new(
        name: "CreateKxVolume",
        http_method: "POST",
        request_uri: "/kx/environments/{environmentId}/kxvolumes"
      )

      DELETE_ENVIRONMENT = OperationModel.new(
        name: "DeleteEnvironment",
        http_method: "DELETE",
        request_uri: "/environment/{environmentId}"
      )

      DELETE_KX_CLUSTER = OperationModel.new(
        name: "DeleteKxCluster",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/clusters/{clusterName}"
      )

      DELETE_KX_CLUSTER_NODE = OperationModel.new(
        name: "DeleteKxClusterNode",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/clusters/{clusterName}/nodes/{nodeId}"
      )

      DELETE_KX_DATABASE = OperationModel.new(
        name: "DeleteKxDatabase",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}"
      )

      DELETE_KX_DATAVIEW = OperationModel.new(
        name: "DeleteKxDataview",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/dataviews/{dataviewName}"
      )

      DELETE_KX_ENVIRONMENT = OperationModel.new(
        name: "DeleteKxEnvironment",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}"
      )

      DELETE_KX_SCALING_GROUP = OperationModel.new(
        name: "DeleteKxScalingGroup",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/scalingGroups/{scalingGroupName}"
      )

      DELETE_KX_USER = OperationModel.new(
        name: "DeleteKxUser",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/users/{userName}"
      )

      DELETE_KX_VOLUME = OperationModel.new(
        name: "DeleteKxVolume",
        http_method: "DELETE",
        request_uri: "/kx/environments/{environmentId}/kxvolumes/{volumeName}"
      )

      GET_ENVIRONMENT = OperationModel.new(
        name: "GetEnvironment",
        http_method: "GET",
        request_uri: "/environment/{environmentId}"
      )

      GET_KX_CHANGESET = OperationModel.new(
        name: "GetKxChangeset",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/changesets/{changesetId}"
      )

      GET_KX_CLUSTER = OperationModel.new(
        name: "GetKxCluster",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/clusters/{clusterName}"
      )

      GET_KX_CONNECTION_STRING = OperationModel.new(
        name: "GetKxConnectionString",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/connectionString"
      )

      GET_KX_DATABASE = OperationModel.new(
        name: "GetKxDatabase",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}"
      )

      GET_KX_DATAVIEW = OperationModel.new(
        name: "GetKxDataview",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/dataviews/{dataviewName}"
      )

      GET_KX_ENVIRONMENT = OperationModel.new(
        name: "GetKxEnvironment",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}"
      )

      GET_KX_SCALING_GROUP = OperationModel.new(
        name: "GetKxScalingGroup",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/scalingGroups/{scalingGroupName}"
      )

      GET_KX_USER = OperationModel.new(
        name: "GetKxUser",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/users/{userName}"
      )

      GET_KX_VOLUME = OperationModel.new(
        name: "GetKxVolume",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/kxvolumes/{volumeName}"
      )

      LIST_ENVIRONMENTS = OperationModel.new(
        name: "ListEnvironments",
        http_method: "GET",
        request_uri: "/environment"
      )

      LIST_KX_CHANGESETS = OperationModel.new(
        name: "ListKxChangesets",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/changesets"
      )

      LIST_KX_CLUSTER_NODES = OperationModel.new(
        name: "ListKxClusterNodes",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/clusters/{clusterName}/nodes"
      )

      LIST_KX_CLUSTERS = OperationModel.new(
        name: "ListKxClusters",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/clusters"
      )

      LIST_KX_DATABASES = OperationModel.new(
        name: "ListKxDatabases",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/databases"
      )

      LIST_KX_DATAVIEWS = OperationModel.new(
        name: "ListKxDataviews",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/dataviews"
      )

      LIST_KX_ENVIRONMENTS = OperationModel.new(
        name: "ListKxEnvironments",
        http_method: "GET",
        request_uri: "/kx/environments"
      )

      LIST_KX_SCALING_GROUPS = OperationModel.new(
        name: "ListKxScalingGroups",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/scalingGroups"
      )

      LIST_KX_USERS = OperationModel.new(
        name: "ListKxUsers",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/users"
      )

      LIST_KX_VOLUMES = OperationModel.new(
        name: "ListKxVolumes",
        http_method: "GET",
        request_uri: "/kx/environments/{environmentId}/kxvolumes"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
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

      UPDATE_ENVIRONMENT = OperationModel.new(
        name: "UpdateEnvironment",
        http_method: "PUT",
        request_uri: "/environment/{environmentId}"
      )

      UPDATE_KX_CLUSTER_CODE_CONFIGURATION = OperationModel.new(
        name: "UpdateKxClusterCodeConfiguration",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}/clusters/{clusterName}/configuration/code"
      )

      UPDATE_KX_CLUSTER_DATABASES = OperationModel.new(
        name: "UpdateKxClusterDatabases",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}/clusters/{clusterName}/configuration/databases"
      )

      UPDATE_KX_DATABASE = OperationModel.new(
        name: "UpdateKxDatabase",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}"
      )

      UPDATE_KX_DATAVIEW = OperationModel.new(
        name: "UpdateKxDataview",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}/databases/{databaseName}/dataviews/{dataviewName}"
      )

      UPDATE_KX_ENVIRONMENT = OperationModel.new(
        name: "UpdateKxEnvironment",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}"
      )

      UPDATE_KX_ENVIRONMENT_NETWORK = OperationModel.new(
        name: "UpdateKxEnvironmentNetwork",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}/network"
      )

      UPDATE_KX_USER = OperationModel.new(
        name: "UpdateKxUser",
        http_method: "PUT",
        request_uri: "/kx/environments/{environmentId}/users/{userName}"
      )

      UPDATE_KX_VOLUME = OperationModel.new(
        name: "UpdateKxVolume",
        http_method: "PATCH",
        request_uri: "/kx/environments/{environmentId}/kxvolumes/{volumeName}"
      )
    end
  end
end
