module Aws
  module ChimeSDKMeetings
    module Model
      API_VERSION = "2021-07-15"
      TARGET_PREFIX = ""
      SIGNING_NAME = "chime"
      ENDPOINT_PREFIX = "meetings-chime"
      ENDPOINT_RULE_SET_JSON = <<-JSON
        {"version":"1.0","parameters":{"Region":{"builtIn":"AWS::Region","required":false,"documentation":"The AWS region used to dispatch the request.","type":"string"},"UseDualStack":{"builtIn":"AWS::UseDualStack","required":true,"default":false,"documentation":"When true, use the dual-stack endpoint. If the configured endpoint does not support dual-stack, dispatching the request MAY return an error.","type":"boolean"},"UseFIPS":{"builtIn":"AWS::UseFIPS","required":true,"default":false,"documentation":"When true, send this request to the FIPS-compliant regional endpoint. If the configured endpoint does not have a FIPS compliant endpoint, dispatching the request will return an error.","type":"boolean"},"Endpoint":{"builtIn":"SDK::Endpoint","required":false,"documentation":"Override the endpoint used to send this request","type":"string"}},"rules":[{"conditions":[{"fn":"isSet","argv":[{"ref":"Endpoint"}]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"error":"Invalid Configuration: FIPS and custom endpoint are not supported","type":"error"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"error":"Invalid Configuration: Dualstack and custom endpoint are not supported","type":"error"},{"conditions":[],"endpoint":{"url":{"ref":"Endpoint"},"properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[{"fn":"isSet","argv":[{"ref":"Region"}]}],"rules":[{"conditions":[{"fn":"aws.partition","argv":[{"ref":"Region"}],"assign":"PartitionResult"}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]},{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]}]},{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://meetings-chime-fips.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS and DualStack are enabled, but this partition does not support one or both","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseFIPS"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsFIPS"]},true]}],"rules":[{"conditions":[],"endpoint":{"url":"https://meetings-chime-fips.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"FIPS is enabled but this partition does not support FIPS","type":"error"}],"type":"tree"},{"conditions":[{"fn":"booleanEquals","argv":[{"ref":"UseDualStack"},true]}],"rules":[{"conditions":[{"fn":"booleanEquals","argv":[true,{"fn":"getAttr","argv":[{"ref":"PartitionResult"},"supportsDualStack"]}]}],"rules":[{"conditions":[],"endpoint":{"url":"https://meetings-chime.{Region}.{PartitionResult#dualStackDnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"},{"conditions":[],"error":"DualStack is enabled but this partition does not support DualStack","type":"error"}],"type":"tree"},{"conditions":[],"endpoint":{"url":"https://meetings-chime.{Region}.{PartitionResult#dnsSuffix}","properties":{},"headers":{}},"type":"endpoint"}],"type":"tree"}],"type":"tree"},{"conditions":[],"error":"Invalid Configuration: Missing Region","type":"error"}]}
      JSON

      struct OperationModel
        getter name : String
        getter http_method : String
        getter request_uri : String

        def initialize(@name : String, @http_method : String, @request_uri : String)
          raise ArgumentError.new("request_uri must start with /") unless @request_uri.starts_with?("/")
        end
      end

      BATCH_CREATE_ATTENDEE = OperationModel.new(
        name: "BatchCreateAttendee",
        http_method: "POST",
        request_uri: "/meetings/{MeetingId}/attendees?operation=batch-create"
      )

      BATCH_UPDATE_ATTENDEE_CAPABILITIES_EXCEPT = OperationModel.new(
        name: "BatchUpdateAttendeeCapabilitiesExcept",
        http_method: "PUT",
        request_uri: "/meetings/{MeetingId}/attendees/capabilities?operation=batch-update-except"
      )

      CREATE_ATTENDEE = OperationModel.new(
        name: "CreateAttendee",
        http_method: "POST",
        request_uri: "/meetings/{MeetingId}/attendees"
      )

      CREATE_MEETING = OperationModel.new(
        name: "CreateMeeting",
        http_method: "POST",
        request_uri: "/meetings"
      )

      CREATE_MEETING_WITH_ATTENDEES = OperationModel.new(
        name: "CreateMeetingWithAttendees",
        http_method: "POST",
        request_uri: "/meetings?operation=create-attendees"
      )

      DELETE_ATTENDEE = OperationModel.new(
        name: "DeleteAttendee",
        http_method: "DELETE",
        request_uri: "/meetings/{MeetingId}/attendees/{AttendeeId}"
      )

      DELETE_MEETING = OperationModel.new(
        name: "DeleteMeeting",
        http_method: "DELETE",
        request_uri: "/meetings/{MeetingId}"
      )

      GET_ATTENDEE = OperationModel.new(
        name: "GetAttendee",
        http_method: "GET",
        request_uri: "/meetings/{MeetingId}/attendees/{AttendeeId}"
      )

      GET_MEETING = OperationModel.new(
        name: "GetMeeting",
        http_method: "GET",
        request_uri: "/meetings/{MeetingId}"
      )

      LIST_ATTENDEES = OperationModel.new(
        name: "ListAttendees",
        http_method: "GET",
        request_uri: "/meetings/{MeetingId}/attendees"
      )

      LIST_TAGS_FOR_RESOURCE = OperationModel.new(
        name: "ListTagsForResource",
        http_method: "GET",
        request_uri: "/tags"
      )

      START_MEETING_TRANSCRIPTION = OperationModel.new(
        name: "StartMeetingTranscription",
        http_method: "POST",
        request_uri: "/meetings/{MeetingId}/transcription?operation=start"
      )

      STOP_MEETING_TRANSCRIPTION = OperationModel.new(
        name: "StopMeetingTranscription",
        http_method: "POST",
        request_uri: "/meetings/{MeetingId}/transcription?operation=stop"
      )

      TAG_RESOURCE = OperationModel.new(
        name: "TagResource",
        http_method: "POST",
        request_uri: "/tags?operation=tag-resource"
      )

      UNTAG_RESOURCE = OperationModel.new(
        name: "UntagResource",
        http_method: "POST",
        request_uri: "/tags?operation=untag-resource"
      )

      UPDATE_ATTENDEE_CAPABILITIES = OperationModel.new(
        name: "UpdateAttendeeCapabilities",
        http_method: "PUT",
        request_uri: "/meetings/{MeetingId}/attendees/{AttendeeId}/capabilities"
      )
    end
  end
end
