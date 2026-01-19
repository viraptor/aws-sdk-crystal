module AwsSdk
  module ConnectParticipant
    module Model
      API_VERSION = "2018-09-07"
      TARGET_PREFIX = ""
      SIGNING_NAME = "execute-api"
      ENDPOINT_PREFIX = "participant.connect"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://participant.connect-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[{"fn":"stringEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"name"]},"aws-us-gov"]}],"endpoint":{"url":"https://participant.connect.{Region}.amazonaws.com","properties":{},"headers":{}},"type":"endpoint"},{"conditions":[],"endpoint":{"url":"https://participant.connect-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://participant.connect.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://participant.connect.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      CANCEL_PARTICIPANT_AUTHENTICATION = OperationModel.new(
        name: "CancelParticipantAuthentication",
        http_method: "POST",
        request_uri: "/participant/cancel-authentication"
      )

      COMPLETE_ATTACHMENT_UPLOAD = OperationModel.new(
        name: "CompleteAttachmentUpload",
        http_method: "POST",
        request_uri: "/participant/complete-attachment-upload"
      )

      CREATE_PARTICIPANT_CONNECTION = OperationModel.new(
        name: "CreateParticipantConnection",
        http_method: "POST",
        request_uri: "/participant/connection"
      )

      DESCRIBE_VIEW = OperationModel.new(
        name: "DescribeView",
        http_method: "GET",
        request_uri: "/participant/views/{ViewToken}"
      )

      DISCONNECT_PARTICIPANT = OperationModel.new(
        name: "DisconnectParticipant",
        http_method: "POST",
        request_uri: "/participant/disconnect"
      )

      GET_ATTACHMENT = OperationModel.new(
        name: "GetAttachment",
        http_method: "POST",
        request_uri: "/participant/attachment"
      )

      GET_AUTHENTICATION_URL = OperationModel.new(
        name: "GetAuthenticationUrl",
        http_method: "POST",
        request_uri: "/participant/authentication-url"
      )

      GET_TRANSCRIPT = OperationModel.new(
        name: "GetTranscript",
        http_method: "POST",
        request_uri: "/participant/transcript"
      )

      SEND_EVENT = OperationModel.new(
        name: "SendEvent",
        http_method: "POST",
        request_uri: "/participant/event"
      )

      SEND_MESSAGE = OperationModel.new(
        name: "SendMessage",
        http_method: "POST",
        request_uri: "/participant/message"
      )

      START_ATTACHMENT_UPLOAD = OperationModel.new(
        name: "StartAttachmentUpload",
        http_method: "POST",
        request_uri: "/participant/start-attachment-upload"
      )
    end
  end
end
