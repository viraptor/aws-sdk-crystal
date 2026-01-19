module AwsSdk
  module Ivschat
    module Model
      API_VERSION = "2020-07-14"
      TARGET_PREFIX = ""
      SIGNING_NAME = "ivschat"
      ENDPOINT_PREFIX = "ivschat"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ivschat-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ivschat-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://ivschat.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://ivschat.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CREATE_CHAT_TOKEN = OperationModel.new(
        name: "CreateChatToken",
        http_method: "POST",
        request_uri: "/CreateChatToken"
      )

      CREATE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "CreateLoggingConfiguration",
        http_method: "POST",
        request_uri: "/CreateLoggingConfiguration"
      )

      CREATE_ROOM = OperationModel.new(
        name: "CreateRoom",
        http_method: "POST",
        request_uri: "/CreateRoom"
      )

      DELETE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "DeleteLoggingConfiguration",
        http_method: "POST",
        request_uri: "/DeleteLoggingConfiguration"
      )

      DELETE_MESSAGE = OperationModel.new(
        name: "DeleteMessage",
        http_method: "POST",
        request_uri: "/DeleteMessage"
      )

      DELETE_ROOM = OperationModel.new(
        name: "DeleteRoom",
        http_method: "POST",
        request_uri: "/DeleteRoom"
      )

      DISCONNECT_USER = OperationModel.new(
        name: "DisconnectUser",
        http_method: "POST",
        request_uri: "/DisconnectUser"
      )

      GET_LOGGING_CONFIGURATION = OperationModel.new(
        name: "GetLoggingConfiguration",
        http_method: "POST",
        request_uri: "/GetLoggingConfiguration"
      )

      GET_ROOM = OperationModel.new(
        name: "GetRoom",
        http_method: "POST",
        request_uri: "/GetRoom"
      )

      LIST_LOGGING_CONFIGURATIONS = OperationModel.new(
        name: "ListLoggingConfigurations",
        http_method: "POST",
        request_uri: "/ListLoggingConfigurations"
      )

      LIST_ROOMS = OperationModel.new(
        name: "ListRooms",
        http_method: "POST",
        request_uri: "/ListRooms"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags/{resourceArn}"
      )

      SEND_EVENT = OperationModel.new(
        name: "SendEvent",
        http_method: "POST",
        request_uri: "/SendEvent"
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

      UPDATE_LOGGING_CONFIGURATION = OperationModel.new(
        name: "UpdateLoggingConfiguration",
        http_method: "POST",
        request_uri: "/UpdateLoggingConfiguration"
      )

      UPDATE_ROOM = OperationModel.new(
        name: "UpdateRoom",
        http_method: "POST",
        request_uri: "/UpdateRoom"
      )
    end
  end
end
