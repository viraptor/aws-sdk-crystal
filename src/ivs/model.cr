module Aws
  module Ivs
    module Model
      API_VERSION = "2020-07-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ivs"
      ENDPOINT_PREFIX = "ivs"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ivs-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ivs-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ivs.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ivs.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_GET_CHANNEL = OperationModel.new(
        name: "BatchGetChannel",
        http_method: "POST",
        request_uri: "/BatchGetChannel"
      )

      BATCH_GET_STREAM_KEY = OperationModel.new(
        name: "BatchGetStreamKey",
        http_method: "POST",
        request_uri: "/BatchGetStreamKey"
      )

      BATCH_START_VIEWER_SESSION_REVOCATION = OperationModel.new(
        name: "BatchStartViewerSessionRevocation",
        http_method: "POST",
        request_uri: "/BatchStartViewerSessionRevocation"
      )

      CREATE_CHANNEL = OperationModel.new(
        name: "CreateChannel",
        http_method: "POST",
        request_uri: "/CreateChannel"
      )

      CREATE_PLAYBACK_RESTRICTION_POLICY = OperationModel.new(
        name: "CreatePlaybackRestrictionPolicy",
        http_method: "POST",
        request_uri: "/CreatePlaybackRestrictionPolicy"
      )

      CREATE_RECORDING_CONFIGURATION = OperationModel.new(
        name: "CreateRecordingConfiguration",
        http_method: "POST",
        request_uri: "/CreateRecordingConfiguration"
      )

      CREATE_STREAM_KEY = OperationModel.new(
        name: "CreateStreamKey",
        http_method: "POST",
        request_uri: "/CreateStreamKey"
      )

      DELETE_CHANNEL = OperationModel.new(
        name: "DeleteChannel",
        http_method: "POST",
        request_uri: "/DeleteChannel"
      )

      DELETE_PLAYBACK_KEY_PAIR = OperationModel.new(
        name: "DeletePlaybackKeyPair",
        http_method: "POST",
        request_uri: "/DeletePlaybackKeyPair"
      )

      DELETE_PLAYBACK_RESTRICTION_POLICY = OperationModel.new(
        name: "DeletePlaybackRestrictionPolicy",
        http_method: "POST",
        request_uri: "/DeletePlaybackRestrictionPolicy"
      )

      DELETE_RECORDING_CONFIGURATION = OperationModel.new(
        name: "DeleteRecordingConfiguration",
        http_method: "POST",
        request_uri: "/DeleteRecordingConfiguration"
      )

      DELETE_STREAM_KEY = OperationModel.new(
        name: "DeleteStreamKey",
        http_method: "POST",
        request_uri: "/DeleteStreamKey"
      )

      GET_CHANNEL = OperationModel.new(
        name: "GetChannel",
        http_method: "POST",
        request_uri: "/GetChannel"
      )

      GET_PLAYBACK_KEY_PAIR = OperationModel.new(
        name: "GetPlaybackKeyPair",
        http_method: "POST",
        request_uri: "/GetPlaybackKeyPair"
      )

      GET_PLAYBACK_RESTRICTION_POLICY = OperationModel.new(
        name: "GetPlaybackRestrictionPolicy",
        http_method: "POST",
        request_uri: "/GetPlaybackRestrictionPolicy"
      )

      GET_RECORDING_CONFIGURATION = OperationModel.new(
        name: "GetRecordingConfiguration",
        http_method: "POST",
        request_uri: "/GetRecordingConfiguration"
      )

      GET_STREAM = OperationModel.new(
        name: "GetStream",
        http_method: "POST",
        request_uri: "/GetStream"
      )

      GET_STREAM_KEY = OperationModel.new(
        name: "GetStreamKey",
        http_method: "POST",
        request_uri: "/GetStreamKey"
      )

      GET_STREAM_SESSION = OperationModel.new(
        name: "GetStreamSession",
        http_method: "POST",
        request_uri: "/GetStreamSession"
      )

      IMPORT_PLAYBACK_KEY_PAIR = OperationModel.new(
        name: "ImportPlaybackKeyPair",
        http_method: "POST",
        request_uri: "/ImportPlaybackKeyPair"
      )

      LIST_CHANNELS = OperationModel.new(
        name: "ListChannels",
        http_method: "POST",
        request_uri: "/ListChannels"
      )

      LIST_PLAYBACK_KEY_PAIRS = OperationModel.new(
        name: "ListPlaybackKeyPairs",
        http_method: "POST",
        request_uri: "/ListPlaybackKeyPairs"
      )

      LIST_PLAYBACK_RESTRICTION_POLICIES = OperationModel.new(
        name: "ListPlaybackRestrictionPolicies",
        http_method: "POST",
        request_uri: "/ListPlaybackRestrictionPolicies"
      )

      LIST_RECORDING_CONFIGURATIONS = OperationModel.new(
        name: "ListRecordingConfigurations",
        http_method: "POST",
        request_uri: "/ListRecordingConfigurations"
      )

      LIST_STREAM_KEYS = OperationModel.new(
        name: "ListStreamKeys",
        http_method: "POST",
        request_uri: "/ListStreamKeys"
      )

      LIST_STREAM_SESSIONS = OperationModel.new(
        name: "ListStreamSessions",
        http_method: "POST",
        request_uri: "/ListStreamSessions"
      )

      LIST_STREAMS = OperationModel.new(
        name: "ListStreams",
        http_method: "POST",
        request_uri: "/ListStreams"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      PUT_METADATA = OperationModel.new(
        name: "PutMetadata",
        http_method: "POST",
        request_uri: "/PutMetadata"
      )

      START_VIEWER_SESSION_REVOCATION = OperationModel.new(
        name: "StartViewerSessionRevocation",
        http_method: "POST",
        request_uri: "/StartViewerSessionRevocation"
      )

      STOP_STREAM = OperationModel.new(
        name: "StopStream",
        http_method: "POST",
        request_uri: "/StopStream"
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

      UPDATE_CHANNEL = OperationModel.new(
        name: "UpdateChannel",
        http_method: "POST",
        request_uri: "/UpdateChannel"
      )

      UPDATE_PLAYBACK_RESTRICTION_POLICY = OperationModel.new(
        name: "UpdatePlaybackRestrictionPolicy",
        http_method: "POST",
        request_uri: "/UpdatePlaybackRestrictionPolicy"
      )
    end
  end
end
