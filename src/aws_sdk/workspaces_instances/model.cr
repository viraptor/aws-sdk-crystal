module AwsSdk
  module WorkspacesInstances
    module Model
      API_VERSION = "2022-07-26"
      TARGET_PREFIX = "EUCMIFrontendAPIService"
      SIGNING_NAME = "workspaces-instances"
      ENDPOINT_PREFIX = "workspaces-instances"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://workspaces-instances-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://workspaces-instances.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ASSOCIATE_VOLUME = OperationModel.new(
        name: "AssociateVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_VOLUME = OperationModel.new(
        name: "CreateVolume",
        http_method: "POST",
        request_uri: "/"
      )

      CREATE_WORKSPACE_INSTANCE = OperationModel.new(
        name: "CreateWorkspaceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_VOLUME = OperationModel.new(
        name: "DeleteVolume",
        http_method: "POST",
        request_uri: "/"
      )

      DELETE_WORKSPACE_INSTANCE = OperationModel.new(
        name: "DeleteWorkspaceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      DISASSOCIATE_VOLUME = OperationModel.new(
        name: "DisassociateVolume",
        http_method: "POST",
        request_uri: "/"
      )

      GET_WORKSPACE_INSTANCE = OperationModel.new(
        name: "GetWorkspaceInstance",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_INSTANCE_TYPES = OperationModel.new(
        name: "ListInstanceTypes",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_REGIONS = OperationModel.new(
        name: "ListRegions",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "POST",
        request_uri: "/"
      )

      LIST_WORKSPACE_INSTANCES = OperationModel.new(
        name: "ListWorkspaceInstances",
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
    end
  end
end
