module Aws
  module GameLiftStreams
    module Model
      API_VERSION = "2018-05-10"
      TARGET_PREFIX = ""
      SIGNING_NAME = "gameliftstreams"
      ENDPOINT_PREFIX = "gameliftstreams"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"},"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"endpoint":{"url":"https://gameliftstreams-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://gameliftstreams.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      ADD_STREAM_GROUP_LOCATIONS = OperationModel.new(
        name: "AddStreamGroupLocations",
        http_method: "POST",
        request_uri: "/streamgroups/{Identifier}/locations"
      )

      ASSOCIATE_APPLICATIONS = OperationModel.new(
        name: "AssociateApplications",
        http_method: "POST",
        request_uri: "/streamgroups/{Identifier}/associations"
      )

      CREATE_APPLICATION = OperationModel.new(
        name: "CreateApplication",
        http_method: "POST",
        request_uri: "/applications"
      )

      CREATE_STREAM_GROUP = OperationModel.new(
        name: "CreateStreamGroup",
        http_method: "POST",
        request_uri: "/streamgroups"
      )

      CREATE_STREAM_SESSION_CONNECTION = OperationModel.new(
        name: "CreateStreamSessionConnection",
        http_method: "POST",
        request_uri: "/streamgroups/{Identifier}/streamsessions/{StreamSessionIdentifier}/connections"
      )

      DELETE_APPLICATION = OperationModel.new(
        name: "DeleteApplication",
        http_method: "DELETE",
        request_uri: "/applications/{Identifier}"
      )

      DELETE_STREAM_GROUP = OperationModel.new(
        name: "DeleteStreamGroup",
        http_method: "DELETE",
        request_uri: "/streamgroups/{Identifier}"
      )

      DISASSOCIATE_APPLICATIONS = OperationModel.new(
        name: "DisassociateApplications",
        http_method: "POST",
        request_uri: "/streamgroups/{Identifier}/disassociations"
      )

      EXPORT_STREAM_SESSION_FILES = OperationModel.new(
        name: "ExportStreamSessionFiles",
        http_method: "PUT",
        request_uri: "/streamgroups/{Identifier}/streamsessions/{StreamSessionIdentifier}/exportfiles"
      )

      GET_APPLICATION = OperationModel.new(
        name: "GetApplication",
        http_method: "GET",
        request_uri: "/applications/{Identifier}"
      )

      GET_STREAM_GROUP = OperationModel.new(
        name: "GetStreamGroup",
        http_method: "GET",
        request_uri: "/streamgroups/{Identifier}"
      )

      GET_STREAM_SESSION = OperationModel.new(
        name: "GetStreamSession",
        http_method: "GET",
        request_uri: "/streamgroups/{Identifier}/streamsessions/{StreamSessionIdentifier}"
      )

      LIST_APPLICATIONS = OperationModel.new(
        name: "ListApplications",
        http_method: "GET",
        request_uri: "/applications"
      )

      LIST_STREAM_GROUPS = OperationModel.new(
        name: "ListStreamGroups",
        http_method: "GET",
        request_uri: "/streamgroups"
      )

      LIST_STREAM_SESSIONS = OperationModel.new(
        name: "ListStreamSessions",
        http_method: "GET",
        request_uri: "/streamgroups/{Identifier}/streamsessions"
      )

      LIST_STREAM_SESSIONS_BY_ACCOUNT = OperationModel.new(
        name: "ListStreamSessionsByAccount",
        http_method: "GET",
        request_uri: "/streamsessions"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{ResourceArn}"
      )

      REMOVE_STREAM_GROUP_LOCATIONS = OperationModel.new(
        name: "RemoveStreamGroupLocations",
        http_method: "DELETE",
        request_uri: "/streamgroups/{Identifier}/locations"
      )

      START_STREAM_SESSION = OperationModel.new(
        name: "StartStreamSession",
        http_method: "POST",
        request_uri: "/streamgroups/{Identifier}/streamsessions"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags/{ResourceArn}"
      )

      TERMINATE_STREAM_SESSION = OperationModel.new(
        name: "TerminateStreamSession",
        http_method: "DELETE",
        request_uri: "/streamgroups/{Identifier}/streamsessions/{StreamSessionIdentifier}"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "DELETE",
        request_uri: "/tags/{ResourceArn}"
      )

      UPDATE_APPLICATION = OperationModel.new(
        name: "UpdateApplication",
        http_method: "PATCH",
        request_uri: "/applications/{Identifier}"
      )

      UPDATE_STREAM_GROUP = OperationModel.new(
        name: "UpdateStreamGroup",
        http_method: "PATCH",
        request_uri: "/streamgroups/{Identifier}"
      )
    end
  end
end
