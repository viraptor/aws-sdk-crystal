module Aws
  module IVSRealTime
    module Model
      API_VERSION = "2020-07-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ivs"
      ENDPOINT_PREFIX = "ivsrealtime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ivsrealtime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ivsrealtime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ivsrealtime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"rules":[{"conditions":[],"endpoint":{"url":"https://ivsrealtime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}],"type":"tree"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_ENCODER_CONFIGURATION = OperationModel.new(
        name: "CreateEncoderConfiguration",
        http_method: "POST",
        request_uri: "/CreateEncoderConfiguration"
      )

      CREATE_INGEST_CONFIGURATION = OperationModel.new(
        name: "CreateIngestConfiguration",
        http_method: "POST",
        request_uri: "/CreateIngestConfiguration"
      )

      CREATE_PARTICIPANT_TOKEN = OperationModel.new(
        name: "CreateParticipantToken",
        http_method: "POST",
        request_uri: "/CreateParticipantToken"
      )

      CREATE_STAGE = OperationModel.new(
        name: "CreateStage",
        http_method: "POST",
        request_uri: "/CreateStage"
      )

      CREATE_STORAGE_CONFIGURATION = OperationModel.new(
        name: "CreateStorageConfiguration",
        http_method: "POST",
        request_uri: "/CreateStorageConfiguration"
      )

      DELETE_ENCODER_CONFIGURATION = OperationModel.new(
        name: "DeleteEncoderConfiguration",
        http_method: "POST",
        request_uri: "/DeleteEncoderConfiguration"
      )

      DELETE_INGEST_CONFIGURATION = OperationModel.new(
        name: "DeleteIngestConfiguration",
        http_method: "POST",
        request_uri: "/DeleteIngestConfiguration"
      )

      DELETE_PUBLIC_KEY = OperationModel.new(
        name: "DeletePublicKey",
        http_method: "POST",
        request_uri: "/DeletePublicKey"
      )

      DELETE_STAGE = OperationModel.new(
        name: "DeleteStage",
        http_method: "POST",
        request_uri: "/DeleteStage"
      )

      DELETE_STORAGE_CONFIGURATION = OperationModel.new(
        name: "DeleteStorageConfiguration",
        http_method: "POST",
        request_uri: "/DeleteStorageConfiguration"
      )

      DISCONNECT_PARTICIPANT = OperationModel.new(
        name: "DisconnectParticipant",
        http_method: "POST",
        request_uri: "/DisconnectParticipant"
      )

      GET_COMPOSITION = OperationModel.new(
        name: "GetComposition",
        http_method: "POST",
        request_uri: "/GetComposition"
      )

      GET_ENCODER_CONFIGURATION = OperationModel.new(
        name: "GetEncoderConfiguration",
        http_method: "POST",
        request_uri: "/GetEncoderConfiguration"
      )

      GET_INGEST_CONFIGURATION = OperationModel.new(
        name: "GetIngestConfiguration",
        http_method: "POST",
        request_uri: "/GetIngestConfiguration"
      )

      GET_PARTICIPANT = OperationModel.new(
        name: "GetParticipant",
        http_method: "POST",
        request_uri: "/GetParticipant"
      )

      GET_PUBLIC_KEY = OperationModel.new(
        name: "GetPublicKey",
        http_method: "POST",
        request_uri: "/GetPublicKey"
      )

      GET_STAGE = OperationModel.new(
        name: "GetStage",
        http_method: "POST",
        request_uri: "/GetStage"
      )

      GET_STAGE_SESSION = OperationModel.new(
        name: "GetStageSession",
        http_method: "POST",
        request_uri: "/GetStageSession"
      )

      GET_STORAGE_CONFIGURATION = OperationModel.new(
        name: "GetStorageConfiguration",
        http_method: "POST",
        request_uri: "/GetStorageConfiguration"
      )

      IMPORT_PUBLIC_KEY = OperationModel.new(
        name: "ImportPublicKey",
        http_method: "POST",
        request_uri: "/ImportPublicKey"
      )

      LIST_COMPOSITIONS = OperationModel.new(
        name: "ListCompositions",
        http_method: "POST",
        request_uri: "/ListCompositions"
      )

      LIST_ENCODER_CONFIGURATIONS = OperationModel.new(
        name: "ListEncoderConfigurations",
        http_method: "POST",
        request_uri: "/ListEncoderConfigurations"
      )

      LIST_INGEST_CONFIGURATIONS = OperationModel.new(
        name: "ListIngestConfigurations",
        http_method: "POST",
        request_uri: "/ListIngestConfigurations"
      )

      LIST_PARTICIPANT_EVENTS = OperationModel.new(
        name: "ListParticipantEvents",
        http_method: "POST",
        request_uri: "/ListParticipantEvents"
      )

      LIST_PARTICIPANT_REPLICAS = OperationModel.new(
        name: "ListParticipantReplicas",
        http_method: "POST",
        request_uri: "/ListParticipantReplicas"
      )

      LIST_PARTICIPANTS = OperationModel.new(
        name: "ListParticipants",
        http_method: "POST",
        request_uri: "/ListParticipants"
      )

      LIST_PUBLIC_KEYS = OperationModel.new(
        name: "ListPublicKeys",
        http_method: "POST",
        request_uri: "/ListPublicKeys"
      )

      LIST_STAGE_SESSIONS = OperationModel.new(
        name: "ListStageSessions",
        http_method: "POST",
        request_uri: "/ListStageSessions"
      )

      LIST_STAGES = OperationModel.new(
        name: "ListStages",
        http_method: "POST",
        request_uri: "/ListStages"
      )

      LIST_STORAGE_CONFIGURATIONS = OperationModel.new(
        name: "ListStorageConfigurations",
        http_method: "POST",
        request_uri: "/ListStorageConfigurations"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      START_COMPOSITION = OperationModel.new(
        name: "StartComposition",
        http_method: "POST",
        request_uri: "/StartComposition"
      )

      START_PARTICIPANT_REPLICATION = OperationModel.new(
        name: "StartParticipantReplication",
        http_method: "POST",
        request_uri: "/StartParticipantReplication"
      )

      STOP_COMPOSITION = OperationModel.new(
        name: "StopComposition",
        http_method: "POST",
        request_uri: "/StopComposition"
      )

      STOP_PARTICIPANT_REPLICATION = OperationModel.new(
        name: "StopParticipantReplication",
        http_method: "POST",
        request_uri: "/StopParticipantReplication"
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

      UPDATE_INGEST_CONFIGURATION = OperationModel.new(
        name: "UpdateIngestConfiguration",
        http_method: "POST",
        request_uri: "/UpdateIngestConfiguration"
      )

      UPDATE_STAGE = OperationModel.new(
        name: "UpdateStage",
        http_method: "POST",
        request_uri: "/UpdateStage"
      )
    end
  end
end
