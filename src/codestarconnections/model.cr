module Aws
  module CodeStarConnections
    module Model
      API_VERSION = "2019-12-01"
      TARGET_PREFIX = "com.amazonaws.codestar.connections.CodeStar_connections_20191201"
      SIGNING_NAME = "codestar-connections"
      ENDPOINT_PREFIX = "codestar-connections"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codestar-connections-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codestar-connections-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://codestar-connections.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://codestar-connections.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CONNECTION = OperationModel.new(
        name: "CreateConnection",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_HOST = OperationModel.new(
        name: "CreateHost",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_REPOSITORY_LINK = OperationModel.new(
        name: "CreateRepositoryLink",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_SYNC_CONFIGURATION = OperationModel.new(
        name: "CreateSyncConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_CONNECTION = OperationModel.new(
        name: "DeleteConnection",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_HOST = OperationModel.new(
        name: "DeleteHost",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_REPOSITORY_LINK = OperationModel.new(
        name: "DeleteRepositoryLink",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_SYNC_CONFIGURATION = OperationModel.new(
        name: "DeleteSyncConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      GET_CONNECTION = OperationModel.new(
        name: "GetConnection",
        http_method: "POST",
        request_uri: "/"
      )

      GET_HOST = OperationModel.new(
        name: "GetHost",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_LINK = OperationModel.new(
        name: "GetRepositoryLink",
        http_method: "POST",
        request_uri: "/"
      )

      GET_REPOSITORY_SYNC_STATUS = OperationModel.new(
        name: "GetRepositorySyncStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_RESOURCE_SYNC_STATUS = OperationModel.new(
        name: "GetResourceSyncStatus",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SYNC_BLOCKER_SUMMARY = OperationModel.new(
        name: "GetSyncBlockerSummary",
        http_method: "POST",
        request_uri: "/"
      )

      GET_SYNC_CONFIGURATION = OperationModel.new(
        name: "GetSyncConfiguration",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_CONNECTIONS = OperationModel.new(
        name: "ListConnections",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_HOSTS = OperationModel.new(
        name: "ListHosts",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPOSITORY_LINKS = OperationModel.new(
        name: "ListRepositoryLinks",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REPOSITORY_SYNC_DEFINITIONS = OperationModel.new(
        name: "ListRepositorySyncDefinitions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_SYNC_CONFIGURATIONS = OperationModel.new(
        name: "ListSyncConfigurations",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
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

      UPDATE_HOST = OperationModel.new(
        name: "UpdateHost",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_REPOSITORY_LINK = OperationModel.new(
        name: "UpdateRepositoryLink",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SYNC_BLOCKER = OperationModel.new(
        name: "UpdateSyncBlocker",
        http_method: "POST",
        request_uri: "/"
      )

      UPDATE_SYNC_CONFIGURATION = OperationModel.new(
        name: "UpdateSyncConfiguration",
        http_method: "POST",
        request_uri: "/"
      )
    end
  end
end
