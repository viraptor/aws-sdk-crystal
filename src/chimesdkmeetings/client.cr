module Aws
  module ChimeSDKMeetings
    class Client
      getter endpoint : String
      getter endpoint_headers : Hash(String, String)
      getter region : String

      def initialize(
        endpoint : String? = nil,
        region : String? = nil,
        profile : String? = nil,
        use_fips : Bool? = nil,
        use_dualstack : Bool? = nil
      )
        @region = region || Aws::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = Aws::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Creates up to 100 attendees for an active Amazon Chime SDK meeting. For more information about the
      # Amazon Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer Guide .

      def batch_create_attendee(
        attendees : Array(Types::CreateAttendeeRequestItem),
        meeting_id : String
      ) : Protocol::Request
        input = Types::BatchCreateAttendeeRequest.new(attendees: attendees, meeting_id: meeting_id)
        batch_create_attendee(input)
      end

      def batch_create_attendee(input : Types::BatchCreateAttendeeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_CREATE_ATTENDEE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Updates AttendeeCapabilities except the capabilities listed in an ExcludedAttendeeIds table. You use
      # the capabilities with a set of values that control what the capabilities can do, such as SendReceive
      # data. For more information about those values, see . When using capabilities, be aware of these
      # corner cases: If you specify MeetingFeatures:Video:MaxResolution:None when you create a meeting, all
      # API requests that include SendReceive , Send , or Receive for AttendeeCapabilities:Video will be
      # rejected with ValidationError 400 . If you specify MeetingFeatures:Content:MaxResolution:None when
      # you create a meeting, all API requests that include SendReceive , Send , or Receive for
      # AttendeeCapabilities:Content will be rejected with ValidationError 400 . You can't set content
      # capabilities to SendReceive or Receive unless you also set video capabilities to SendReceive or
      # Receive . If you don't set the video capability to receive, the response will contain an HTTP 400
      # Bad Request status code. However, you can set your video capability to receive and you set your
      # content capability to not receive. If meeting features is defined as Video:MaxResolution:None but
      # Content:MaxResolution is defined as something other than None and attendee capabilities are not
      # defined in the API request, then the default attendee video capability is set to Receive and
      # attendee content capability is set to SendReceive . This is because content SendReceive requires
      # video to be at least Receive . When you change an audio capability from None or Receive to Send or
      # SendReceive , and if the attendee left their microphone unmuted, audio will flow from the attendee
      # to the other meeting participants. When you change a video or content capability from None or
      # Receive to Send or SendReceive , and if the attendee turned on their video or content streams,
      # remote attendees can receive those streams, but only after media renegotiation between the client
      # and the Amazon Chime back-end server.

      def batch_update_attendee_capabilities_except(
        capabilities : Types::AttendeeCapabilities,
        excluded_attendee_ids : Array(Types::AttendeeIdItem),
        meeting_id : String
      ) : Protocol::Request
        input = Types::BatchUpdateAttendeeCapabilitiesExceptRequest.new(capabilities: capabilities, excluded_attendee_ids: excluded_attendee_ids, meeting_id: meeting_id)
        batch_update_attendee_capabilities_except(input)
      end

      def batch_update_attendee_capabilities_except(input : Types::BatchUpdateAttendeeCapabilitiesExceptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::BATCH_UPDATE_ATTENDEE_CAPABILITIES_EXCEPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new attendee for an active Amazon Chime SDK meeting. For more information about the Amazon
      # Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer Guide .

      def create_attendee(
        external_user_id : String,
        meeting_id : String,
        capabilities : Types::AttendeeCapabilities? = nil
      ) : Protocol::Request
        input = Types::CreateAttendeeRequest.new(external_user_id: external_user_id, meeting_id: meeting_id, capabilities: capabilities)
        create_attendee(input)
      end

      def create_attendee(input : Types::CreateAttendeeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_ATTENDEE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon Chime SDK meeting in the specified media Region with no initial attendees. For
      # more information about specifying media Regions, see Available Regions and Using meeting Regions ,
      # both in the Amazon Chime SDK Developer Guide . For more information about the Amazon Chime SDK, see
      # Using the Amazon Chime SDK in the Amazon Chime SDK Developer Guide . If you use this API in
      # conjuction with the and APIs, and you don't specify the MeetingFeatures.Content.MaxResolution or
      # MeetingFeatures.Video.MaxResolution parameters, the following defaults are used:
      # Content.MaxResolution: FHD Video.MaxResolution: HD

      def create_meeting(
        client_request_token : String,
        external_meeting_id : String,
        media_region : String,
        media_placement_network_type : String? = nil,
        meeting_features : Types::MeetingFeaturesConfiguration? = nil,
        meeting_host_id : String? = nil,
        notifications_configuration : Types::NotificationsConfiguration? = nil,
        primary_meeting_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tenant_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateMeetingRequest.new(client_request_token: client_request_token, external_meeting_id: external_meeting_id, media_region: media_region, media_placement_network_type: media_placement_network_type, meeting_features: meeting_features, meeting_host_id: meeting_host_id, notifications_configuration: notifications_configuration, primary_meeting_id: primary_meeting_id, tags: tags, tenant_ids: tenant_ids)
        create_meeting(input)
      end

      def create_meeting(input : Types::CreateMeetingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEETING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates a new Amazon Chime SDK meeting in the specified media Region, with attendees. For more
      # information about specifying media Regions, see Available Regions and Using meeting Regions , both
      # in the Amazon Chime SDK Developer Guide . For more information about the Amazon Chime SDK, see Using
      # the Amazon Chime SDK in the Amazon Chime SDK Developer Guide . If you use this API in conjuction
      # with the and APIs, and you don't specify the MeetingFeatures.Content.MaxResolution or
      # MeetingFeatures.Video.MaxResolution parameters, the following defaults are used:
      # Content.MaxResolution: FHD Video.MaxResolution: HD

      def create_meeting_with_attendees(
        attendees : Array(Types::CreateAttendeeRequestItem),
        client_request_token : String,
        external_meeting_id : String,
        media_region : String,
        media_placement_network_type : String? = nil,
        meeting_features : Types::MeetingFeaturesConfiguration? = nil,
        meeting_host_id : String? = nil,
        notifications_configuration : Types::NotificationsConfiguration? = nil,
        primary_meeting_id : String? = nil,
        tags : Array(Types::Tag)? = nil,
        tenant_ids : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateMeetingWithAttendeesRequest.new(attendees: attendees, client_request_token: client_request_token, external_meeting_id: external_meeting_id, media_region: media_region, media_placement_network_type: media_placement_network_type, meeting_features: meeting_features, meeting_host_id: meeting_host_id, notifications_configuration: notifications_configuration, primary_meeting_id: primary_meeting_id, tags: tags, tenant_ids: tenant_ids)
        create_meeting_with_attendees(input)
      end

      def create_meeting_with_attendees(input : Types::CreateMeetingWithAttendeesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_MEETING_WITH_ATTENDEES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes an attendee from the specified Amazon Chime SDK meeting and deletes their JoinToken .
      # Attendees are automatically deleted when a Amazon Chime SDK meeting is deleted. For more information
      # about the Amazon Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer Guide .

      def delete_attendee(
        attendee_id : String,
        meeting_id : String
      ) : Protocol::Request
        input = Types::DeleteAttendeeRequest.new(attendee_id: attendee_id, meeting_id: meeting_id)
        delete_attendee(input)
      end

      def delete_attendee(input : Types::DeleteAttendeeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_ATTENDEE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Deletes the specified Amazon Chime SDK meeting. The operation deletes all attendees, disconnects all
      # clients, and prevents new clients from joining the meeting. For more information about the Amazon
      # Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer Guide .

      def delete_meeting(
        meeting_id : String
      ) : Protocol::Request
        input = Types::DeleteMeetingRequest.new(meeting_id: meeting_id)
        delete_meeting(input)
      end

      def delete_meeting(input : Types::DeleteMeetingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DELETE_MEETING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Amazon Chime SDK attendee details for a specified meeting ID and attendee ID. For more
      # information about the Amazon Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer
      # Guide .

      def get_attendee(
        attendee_id : String,
        meeting_id : String
      ) : Protocol::Request
        input = Types::GetAttendeeRequest.new(attendee_id: attendee_id, meeting_id: meeting_id)
        get_attendee(input)
      end

      def get_attendee(input : Types::GetAttendeeRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ATTENDEE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Gets the Amazon Chime SDK meeting details for the specified meeting ID. For more information about
      # the Amazon Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer Guide .

      def get_meeting(
        meeting_id : String
      ) : Protocol::Request
        input = Types::GetMeetingRequest.new(meeting_id: meeting_id)
        get_meeting(input)
      end

      def get_meeting(input : Types::GetMeetingRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_MEETING, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Lists the attendees for the specified Amazon Chime SDK meeting. For more information about the
      # Amazon Chime SDK, see Using the Amazon Chime SDK in the Amazon Chime Developer Guide .

      def list_attendees(
        meeting_id : String,
        max_results : Int32? = nil,
        next_token : String? = nil
      ) : Protocol::Request
        input = Types::ListAttendeesRequest.new(meeting_id: meeting_id, max_results: max_results, next_token: next_token)
        list_attendees(input)
      end

      def list_attendees(input : Types::ListAttendeesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_ATTENDEES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Returns a list of the tags available for the specified resource.

      def list_tags_for_resource(
        resource_arn : String
      ) : Protocol::Request
        input = Types::ListTagsForResourceRequest.new(resource_arn: resource_arn)
        list_tags_for_resource(input)
      end

      def list_tags_for_resource(input : Types::ListTagsForResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::LIST_TAGS_FOR_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Starts transcription for the specified meetingId . For more information, refer to Using Amazon Chime
      # SDK live transcription in the Amazon Chime SDK Developer Guide . If you specify an invalid
      # configuration, a TranscriptFailed event will be sent with the contents of the BadRequestException
      # generated by Amazon Transcribe. For more information on each parameter and which combinations are
      # valid, refer to the StartStreamTranscription API in the Amazon Transcribe Developer Guide . By
      # default, Amazon Transcribe may use and store audio content processed by the service to develop and
      # improve Amazon Web Services AI/ML services as further described in section 50 of the Amazon Web
      # Services Service Terms . Using Amazon Transcribe may be subject to federal and state laws or
      # regulations regarding the recording or interception of electronic communications. It is your and
      # your end users’ responsibility to comply with all applicable laws regarding the recording, including
      # properly notifying all participants in a recorded session or communication that the session or
      # communication is being recorded, and obtaining all necessary consents. You can opt out from Amazon
      # Web Services using audio content to develop and improve AWS AI/ML services by configuring an AI
      # services opt out policy using Amazon Web Services Organizations.

      def start_meeting_transcription(
        meeting_id : String,
        transcription_configuration : Types::TranscriptionConfiguration
      ) : Protocol::Request
        input = Types::StartMeetingTranscriptionRequest.new(meeting_id: meeting_id, transcription_configuration: transcription_configuration)
        start_meeting_transcription(input)
      end

      def start_meeting_transcription(input : Types::StartMeetingTranscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_MEETING_TRANSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Stops transcription for the specified meetingId . For more information, refer to Using Amazon Chime
      # SDK live transcription in the Amazon Chime SDK Developer Guide . By default, Amazon Transcribe may
      # use and store audio content processed by the service to develop and improve Amazon Web Services
      # AI/ML services as further described in section 50 of the Amazon Web Services Service Terms . Using
      # Amazon Transcribe may be subject to federal and state laws or regulations regarding the recording or
      # interception of electronic communications. It is your and your end users’ responsibility to comply
      # with all applicable laws regarding the recording, including properly notifying all participants in a
      # recorded session or communication that the session or communication is being recorded, and obtaining
      # all necessary consents. You can opt out from Amazon Web Services using audio content to develop and
      # improve Amazon Web Services AI/ML services by configuring an AI services opt out policy using Amazon
      # Web Services Organizations.

      def stop_meeting_transcription(
        meeting_id : String
      ) : Protocol::Request
        input = Types::StopMeetingTranscriptionRequest.new(meeting_id: meeting_id)
        stop_meeting_transcription(input)
      end

      def stop_meeting_transcription(input : Types::StopMeetingTranscriptionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::STOP_MEETING_TRANSCRIPTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The resource that supports tags.

      def tag_resource(
        resource_arn : String,
        tags : Array(Types::Tag)
      ) : Protocol::Request
        input = Types::TagResourceRequest.new(resource_arn: resource_arn, tags: tags)
        tag_resource(input)
      end

      def tag_resource(input : Types::TagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::TAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Removes the specified tags from the specified resources. When you specify a tag key, the action
      # removes both that key and its associated value. The operation succeeds even if you attempt to remove
      # tags from a resource that were already removed. Note the following: To remove tags from a resource,
      # you need the necessary permissions for the service that the resource belongs to as well as
      # permissions for removing tags. For more information, see the documentation for the service whose
      # resource you want to untag. You can only tag resources that are located in the specified Amazon Web
      # Services Region for the calling Amazon Web Services account. Minimum permissions In addition to the
      # tag:UntagResources permission required by this operation, you must also have the remove tags
      # permission defined by the service that created the resource. For example, to remove the tags from an
      # Amazon EC2 instance using the UntagResources operation, you must have both of the following
      # permissions: tag:UntagResource ChimeSDKMeetings:DeleteTags

      def untag_resource(
        resource_arn : String,
        tag_keys : Array(String)
      ) : Protocol::Request
        input = Types::UntagResourceRequest.new(resource_arn: resource_arn, tag_keys: tag_keys)
        untag_resource(input)
      end

      def untag_resource(input : Types::UntagResourceRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UNTAG_RESOURCE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The capabilities that you want to update. You use the capabilities with a set of values that control
      # what the capabilities can do, such as SendReceive data. For more information about those values, see
      # . When using capabilities, be aware of these corner cases: If you specify
      # MeetingFeatures:Video:MaxResolution:None when you create a meeting, all API requests that include
      # SendReceive , Send , or Receive for AttendeeCapabilities:Video will be rejected with ValidationError
      # 400 . If you specify MeetingFeatures:Content:MaxResolution:None when you create a meeting, all API
      # requests that include SendReceive , Send , or Receive for AttendeeCapabilities:Content will be
      # rejected with ValidationError 400 . You can't set content capabilities to SendReceive or Receive
      # unless you also set video capabilities to SendReceive or Receive . If you don't set the video
      # capability to receive, the response will contain an HTTP 400 Bad Request status code. However, you
      # can set your video capability to receive and you set your content capability to not receive. If
      # meeting features is defined as Video:MaxResolution:None but Content:MaxResolution is defined as
      # something other than None and attendee capabilities are not defined in the API request, then the
      # default attendee video capability is set to Receive and attendee content capability is set to
      # SendReceive . This is because content SendReceive requires video to be at least Receive . When you
      # change an audio capability from None or Receive to Send or SendReceive , and if the attendee left
      # their microphone unmuted, audio will flow from the attendee to the other meeting participants. When
      # you change a video or content capability from None or Receive to Send or SendReceive , and if the
      # attendee turned on their video or content streams, remote attendees can receive those streams, but
      # only after media renegotiation between the client and the Amazon Chime back-end server.

      def update_attendee_capabilities(
        attendee_id : String,
        capabilities : Types::AttendeeCapabilities,
        meeting_id : String
      ) : Protocol::Request
        input = Types::UpdateAttendeeCapabilitiesRequest.new(attendee_id: attendee_id, capabilities: capabilities, meeting_id: meeting_id)
        update_attendee_capabilities(input)
      end

      def update_attendee_capabilities(input : Types::UpdateAttendeeCapabilitiesRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::UPDATE_ATTENDEE_CAPABILITIES, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
