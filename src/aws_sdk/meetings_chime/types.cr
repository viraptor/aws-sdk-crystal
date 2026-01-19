require "json"

module AwsSdk
  module ChimeSDKMeetings
    module Types

      # An Amazon Chime SDK meeting attendee. Includes a unique AttendeeId and JoinToken . The JoinToken
      # allows a client to authenticate and join as the specified attendee. The JoinToken expires when the
      # meeting ends, or when DeleteAttendee is called. After that, the attendee is unable to join the
      # meeting. We recommend securely transferring each JoinToken from your server application to the
      # client so that no other client has access to the token except for the one authorized to represent
      # the attendee.
      struct Attendee
        include JSON::Serializable

        # The Amazon Chime SDK attendee ID.
        @[JSON::Field(key: "AttendeeId")]
        getter attendee_id : String?

        # The capabilities assigned to an attendee: audio, video, or content. You use the capabilities with a
        # set of values that control what the capabilities can do, such as SendReceive data. For more
        # information about those values, see . When using capabilities, be aware of these corner cases: If
        # you specify MeetingFeatures:Video:MaxResolution:None when you create a meeting, all API requests
        # that include SendReceive , Send , or Receive for AttendeeCapabilities:Video will be rejected with
        # ValidationError 400 . If you specify MeetingFeatures:Content:MaxResolution:None when you create a
        # meeting, all API requests that include SendReceive , Send , or Receive for
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
        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::AttendeeCapabilities?

        # The Amazon Chime SDK external user ID. An idempotency token. Links the attendee to an identity
        # managed by a builder application. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values
        # that begin with aws: are reserved. You can't configure a value that uses this prefix. Case
        # insensitive.
        @[JSON::Field(key: "ExternalUserId")]
        getter external_user_id : String?

        # The join token used by the Amazon Chime SDK attendee.
        @[JSON::Field(key: "JoinToken")]
        getter join_token : String?

        def initialize(
          @attendee_id : String? = nil,
          @capabilities : Types::AttendeeCapabilities? = nil,
          @external_user_id : String? = nil,
          @join_token : String? = nil
        )
        end
      end

      # The media capabilities of an attendee: audio, video, or content. You use the capabilities with a set
      # of values that control what the capabilities can do, such as SendReceive data. For more information,
      # refer to and . When using capabilities, be aware of these corner cases: If you specify
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
      # change an audio capability from None or Receive to Send or SendReceive , and an attendee unmutes
      # their microphone, audio flows from the attendee to the other meeting participants. When you change a
      # video or content capability from None or Receive to Send or SendReceive , and the attendee turns on
      # their video or content streams, remote attendees can receive those streams, but only after media
      # renegotiation between the client and the Amazon Chime back-end server.
      struct AttendeeCapabilities
        include JSON::Serializable

        # The audio capability assigned to an attendee.
        @[JSON::Field(key: "Audio")]
        getter audio : String

        # The content capability assigned to an attendee.
        @[JSON::Field(key: "Content")]
        getter content : String

        # The video capability assigned to an attendee.
        @[JSON::Field(key: "Video")]
        getter video : String

        def initialize(
          @audio : String,
          @content : String,
          @video : String
        )
        end
      end

      # Lists the maximum number of attendees allowed into the meeting. If you specify FHD for
      # MeetingFeatures:Video:MaxResolution , or if you specify UHD for
      # MeetingFeatures:Content:MaxResolution , the maximum number of attendees changes from the default of
      # 250 to 25 .
      struct AttendeeFeatures
        include JSON::Serializable

        # The maximum number of attendees allowed into the meeting.
        @[JSON::Field(key: "MaxCount")]
        getter max_count : Int32?

        def initialize(
          @max_count : Int32? = nil
        )
        end
      end

      # A structure that contains one or more attendee IDs.
      struct AttendeeIdItem
        include JSON::Serializable

        # A list of one or more attendee IDs.
        @[JSON::Field(key: "AttendeeId")]
        getter attendee_id : String

        def initialize(
          @attendee_id : String
        )
        end
      end

      # An optional category of meeting features that contains audio-specific configurations, such as
      # operating parameters for Amazon Voice Focus.
      struct AudioFeatures
        include JSON::Serializable

        # Makes echo reduction available to clients who connect to the meeting.
        @[JSON::Field(key: "EchoReduction")]
        getter echo_reduction : String?

        def initialize(
          @echo_reduction : String? = nil
        )
        end
      end

      # The input parameters don't match the service's restrictions.
      struct BadRequestException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      struct BatchCreateAttendeeRequest
        include JSON::Serializable

        # The attendee information, including attendees' IDs and join tokens.
        @[JSON::Field(key: "Attendees")]
        getter attendees : Array(Types::CreateAttendeeRequestItem)

        # The Amazon Chime SDK ID of the meeting to which you're adding attendees.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @attendees : Array(Types::CreateAttendeeRequestItem),
          @meeting_id : String
        )
        end
      end

      struct BatchCreateAttendeeResponse
        include JSON::Serializable

        # The attendee information, including attendees' IDs and join tokens.
        @[JSON::Field(key: "Attendees")]
        getter attendees : Array(Types::Attendee)?

        # If the action fails for one or more of the attendees in the request, a list of the attendees is
        # returned, along with error codes and error messages.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::CreateAttendeeError)?

        def initialize(
          @attendees : Array(Types::Attendee)? = nil,
          @errors : Array(Types::CreateAttendeeError)? = nil
        )
        end
      end

      struct BatchUpdateAttendeeCapabilitiesExceptRequest
        include JSON::Serializable

        # The capabilities ( audio , video , or content ) that you want to update.
        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::AttendeeCapabilities

        # The AttendeeIDs that you want to exclude from one or more capabilities.
        @[JSON::Field(key: "ExcludedAttendeeIds")]
        getter excluded_attendee_ids : Array(Types::AttendeeIdItem)

        # The ID of the meeting associated with the update request.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @capabilities : Types::AttendeeCapabilities,
          @excluded_attendee_ids : Array(Types::AttendeeIdItem),
          @meeting_id : String
        )
        end
      end

      # Multiple instances of the same request have been made simultaneously.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the request involved in the conflict.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Lists the content (screen share) features for the meeting. Applies to all attendees. If you specify
      # MeetingFeatures:Content:MaxResolution:None when you create a meeting, all API requests that include
      # SendReceive , Send , or Receive for AttendeeCapabilities:Content will be rejected with
      # ValidationError 400 .
      struct ContentFeatures
        include JSON::Serializable

        # The maximum resolution for the meeting content. Defaults to FHD . To use UHD , you must also provide
        # a MeetingFeatures:Attendee:MaxCount value and override the default size limit of 250 attendees.
        @[JSON::Field(key: "MaxResolution")]
        getter max_resolution : String?

        def initialize(
          @max_resolution : String? = nil
        )
        end
      end

      # The list of errors returned when errors are encountered during the BatchCreateAttendee and
      # CreateAttendee actions. This includes external user IDs, error codes, and error messages.
      struct CreateAttendeeError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "ErrorCode")]
        getter error_code : String?

        # The error message.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The Amazon Chime SDK external user ID. An idempotency token. Links the attendee to an identity
        # managed by a builder application. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values
        # that begin with aws: are reserved. You can't configure a value that uses this prefix. Case
        # insensitive.
        @[JSON::Field(key: "ExternalUserId")]
        getter external_user_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @external_user_id : String? = nil
        )
        end
      end

      struct CreateAttendeeRequest
        include JSON::Serializable

        # The Amazon Chime SDK external user ID. An idempotency token. Links the attendee to an identity
        # managed by a builder application. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values
        # that begin with aws: are reserved. You can't configure a value that uses this prefix.
        @[JSON::Field(key: "ExternalUserId")]
        getter external_user_id : String

        # The unique ID of the meeting.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        # The capabilities ( audio , video , or content ) that you want to grant an attendee. If you don't
        # specify capabilities, all users have send and receive capabilities on all media channels by default.
        # You use the capabilities with a set of values that control what the capabilities can do, such as
        # SendReceive data. For more information about those values, see . When using capabilities, be aware
        # of these corner cases: If you specify MeetingFeatures:Video:MaxResolution:None when you create a
        # meeting, all API requests that include SendReceive , Send , or Receive for
        # AttendeeCapabilities:Video will be rejected with ValidationError 400 . If you specify
        # MeetingFeatures:Content:MaxResolution:None when you create a meeting, all API requests that include
        # SendReceive , Send , or Receive for AttendeeCapabilities:Content will be rejected with
        # ValidationError 400 . You can't set content capabilities to SendReceive or Receive unless you also
        # set video capabilities to SendReceive or Receive . If you don't set the video capability to receive,
        # the response will contain an HTTP 400 Bad Request status code. However, you can set your video
        # capability to receive and you set your content capability to not receive. If meeting features is
        # defined as Video:MaxResolution:None but Content:MaxResolution is defined as something other than
        # None and attendee capabilities are not defined in the API request, then the default attendee video
        # capability is set to Receive and attendee content capability is set to SendReceive . This is because
        # content SendReceive requires video to be at least Receive . When you change an audio capability from
        # None or Receive to Send or SendReceive , and if the attendee left their microphone unmuted, audio
        # will flow from the attendee to the other meeting participants. When you change a video or content
        # capability from None or Receive to Send or SendReceive , and if the attendee turned on their video
        # or content streams, remote attendees can receive those streams, but only after media renegotiation
        # between the client and the Amazon Chime back-end server.
        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::AttendeeCapabilities?

        def initialize(
          @external_user_id : String,
          @meeting_id : String,
          @capabilities : Types::AttendeeCapabilities? = nil
        )
        end
      end

      # The Amazon Chime SDK attendee fields to create, used with the BatchCreateAttendee action.
      struct CreateAttendeeRequestItem
        include JSON::Serializable

        # The Amazon Chime SDK external user ID. An idempotency token. Links the attendee to an identity
        # managed by a builder application. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values
        # that begin with aws: are reserved. You can't configure a value that uses this prefix. Case
        # insensitive.
        @[JSON::Field(key: "ExternalUserId")]
        getter external_user_id : String

        # A list of one or more capabilities.
        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::AttendeeCapabilities?

        def initialize(
          @external_user_id : String,
          @capabilities : Types::AttendeeCapabilities? = nil
        )
        end
      end

      struct CreateAttendeeResponse
        include JSON::Serializable

        # The attendee information, including attendee ID and join token.
        @[JSON::Field(key: "Attendee")]
        getter attendee : Types::Attendee?

        def initialize(
          @attendee : Types::Attendee? = nil
        )
        end
      end

      struct CreateMeetingRequest
        include JSON::Serializable

        # The unique identifier for the client request. Use a different token for different meetings.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The external meeting ID. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values that begin
        # with aws: are reserved. You can't configure a value that uses this prefix. Case insensitive.
        @[JSON::Field(key: "ExternalMeetingId")]
        getter external_meeting_id : String

        # The Region in which to create the meeting. Available values: af-south-1 , ap-northeast-1 ,
        # ap-northeast-2 , ap-south-1 , ap-southeast-1 , ap-southeast-2 , ca-central-1 , eu-central-1 ,
        # eu-north-1 , eu-south-1 , eu-west-1 , eu-west-2 , eu-west-3 , sa-east-1 , us-east-1 , us-east-2 ,
        # us-west-1 , us-west-2 . Available values in Amazon Web Services GovCloud (US) Regions: us-gov-east-1
        # , us-gov-west-1 .
        @[JSON::Field(key: "MediaRegion")]
        getter media_region : String

        # The type of network for the media placement. Either IPv4 only or dual-stack (IPv4 and IPv6).
        @[JSON::Field(key: "MediaPlacementNetworkType")]
        getter media_placement_network_type : String?

        # Lists the audio and video features enabled for a meeting, such as echo reduction.
        @[JSON::Field(key: "MeetingFeatures")]
        getter meeting_features : Types::MeetingFeaturesConfiguration?

        # Reserved.
        @[JSON::Field(key: "MeetingHostId")]
        getter meeting_host_id : String?

        # The configuration for resource targets to receive notifications when meeting and attendee events
        # occur.
        @[JSON::Field(key: "NotificationsConfiguration")]
        getter notifications_configuration : Types::NotificationsConfiguration?

        # When specified, replicates the media from the primary meeting to the new meeting.
        @[JSON::Field(key: "PrimaryMeetingId")]
        getter primary_meeting_id : String?

        # Applies one or more tags to an Amazon Chime SDK meeting. Note the following: Not all resources have
        # tags. For a list of services with resources that support tagging using this operation, see Services
        # that support the Resource Groups Tagging API . If the resource doesn't yet support this operation,
        # the resource's service might support tagging using its own API operations. For more information,
        # refer to the documentation for that service. Each resource can have up to 50 tags. For other limits,
        # see Tag Naming and Usage Conventions in the AWS General Reference . You can only tag resources that
        # are located in the specified Amazon Web Services Region for the Amazon Web Services account. To add
        # tags to a resource, you need the necessary permissions for the service that the resource belongs to
        # as well as permissions for adding tags. For more information, see the documentation for each
        # service. Do not store personally identifiable information (PII) or other confidential or sensitive
        # information in tags. We use tags to provide you with billing and administration services. Tags are
        # not intended to be used for private or sensitive data. Minimum permissions In addition to the
        # tag:TagResources permission required by this operation, you must also have the tagging permission
        # defined by the service that created the resource. For example, to tag a ChimeSDKMeetings instance
        # using the TagResources operation, you must have both of the following permissions: tag:TagResources
        # ChimeSDKMeetings:CreateTags Some services might have specific requirements for tagging some
        # resources. For example, to tag an Amazon S3 bucket, you must also have the s3:GetBucketTagging
        # permission. If the expected minimum permissions don't work, check the documentation for that
        # service's tagging APIs for more information.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A consistent and opaque identifier, created and maintained by the builder to represent a segment of
        # their users.
        @[JSON::Field(key: "TenantIds")]
        getter tenant_ids : Array(String)?

        def initialize(
          @client_request_token : String,
          @external_meeting_id : String,
          @media_region : String,
          @media_placement_network_type : String? = nil,
          @meeting_features : Types::MeetingFeaturesConfiguration? = nil,
          @meeting_host_id : String? = nil,
          @notifications_configuration : Types::NotificationsConfiguration? = nil,
          @primary_meeting_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tenant_ids : Array(String)? = nil
        )
        end
      end

      struct CreateMeetingResponse
        include JSON::Serializable

        # The meeting information, including the meeting ID and MediaPlacement .
        @[JSON::Field(key: "Meeting")]
        getter meeting : Types::Meeting?

        def initialize(
          @meeting : Types::Meeting? = nil
        )
        end
      end

      struct CreateMeetingWithAttendeesRequest
        include JSON::Serializable

        # The attendee information, including attendees' IDs and join tokens.
        @[JSON::Field(key: "Attendees")]
        getter attendees : Array(Types::CreateAttendeeRequestItem)

        # The unique identifier for the client request. Use a different token for different meetings.
        @[JSON::Field(key: "ClientRequestToken")]
        getter client_request_token : String

        # The external meeting ID. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values that begin
        # with aws: are reserved. You can't configure a value that uses this prefix. Case insensitive.
        @[JSON::Field(key: "ExternalMeetingId")]
        getter external_meeting_id : String

        # The Region in which to create the meeting. Available values: af-south-1 , ap-northeast-1 ,
        # ap-northeast-2 , ap-south-1 , ap-southeast-1 , ap-southeast-2 , ca-central-1 , eu-central-1 ,
        # eu-north-1 , eu-south-1 , eu-west-1 , eu-west-2 , eu-west-3 , sa-east-1 , us-east-1 , us-east-2 ,
        # us-west-1 , us-west-2 . Available values in Amazon Web Services GovCloud (US) Regions: us-gov-east-1
        # , us-gov-west-1 .
        @[JSON::Field(key: "MediaRegion")]
        getter media_region : String

        # The type of network for the media placement. Either IPv4 only or dual-stack (IPv4 and IPv6).
        @[JSON::Field(key: "MediaPlacementNetworkType")]
        getter media_placement_network_type : String?

        # Lists the audio and video features enabled for a meeting, such as echo reduction.
        @[JSON::Field(key: "MeetingFeatures")]
        getter meeting_features : Types::MeetingFeaturesConfiguration?

        # Reserved.
        @[JSON::Field(key: "MeetingHostId")]
        getter meeting_host_id : String?

        # The configuration for resource targets to receive notifications when meeting and attendee events
        # occur.
        @[JSON::Field(key: "NotificationsConfiguration")]
        getter notifications_configuration : Types::NotificationsConfiguration?

        # When specified, replicates the media from the primary meeting to the new meeting.
        @[JSON::Field(key: "PrimaryMeetingId")]
        getter primary_meeting_id : String?

        # The tags in the request.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # A consistent and opaque identifier, created and maintained by the builder to represent a segment of
        # their users.
        @[JSON::Field(key: "TenantIds")]
        getter tenant_ids : Array(String)?

        def initialize(
          @attendees : Array(Types::CreateAttendeeRequestItem),
          @client_request_token : String,
          @external_meeting_id : String,
          @media_region : String,
          @media_placement_network_type : String? = nil,
          @meeting_features : Types::MeetingFeaturesConfiguration? = nil,
          @meeting_host_id : String? = nil,
          @notifications_configuration : Types::NotificationsConfiguration? = nil,
          @primary_meeting_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tenant_ids : Array(String)? = nil
        )
        end
      end

      struct CreateMeetingWithAttendeesResponse
        include JSON::Serializable

        # The attendee information, including attendees' IDs and join tokens.
        @[JSON::Field(key: "Attendees")]
        getter attendees : Array(Types::Attendee)?

        # If the action fails for one or more of the attendees in the request, a list of the attendees is
        # returned, along with error codes and error messages.
        @[JSON::Field(key: "Errors")]
        getter errors : Array(Types::CreateAttendeeError)?

        # The meeting information, including the meeting ID and MediaPlacement .
        @[JSON::Field(key: "Meeting")]
        getter meeting : Types::Meeting?

        def initialize(
          @attendees : Array(Types::Attendee)? = nil,
          @errors : Array(Types::CreateAttendeeError)? = nil,
          @meeting : Types::Meeting? = nil
        )
        end
      end

      struct DeleteAttendeeRequest
        include JSON::Serializable

        # The Amazon Chime SDK attendee ID.
        @[JSON::Field(key: "AttendeeId")]
        getter attendee_id : String

        # The Amazon Chime SDK meeting ID.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @attendee_id : String,
          @meeting_id : String
        )
        end
      end

      struct DeleteMeetingRequest
        include JSON::Serializable

        # The Amazon Chime SDK meeting ID.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @meeting_id : String
        )
        end
      end

      # Settings specific to the Amazon Transcribe Medical engine.
      struct EngineTranscribeMedicalSettings
        include JSON::Serializable

        # The language code specified for the Amazon Transcribe Medical engine.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String

        # The specialty specified for the Amazon Transcribe Medical engine.
        @[JSON::Field(key: "Specialty")]
        getter specialty : String

        # The type of transcription.
        @[JSON::Field(key: "Type")]
        getter type : String

        # Set this field to PHI to identify personal health information in the transcription output.
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # The Amazon Web Services Region passed to Amazon Transcribe Medical. If you don't specify a Region,
        # Amazon Chime uses the meeting's Region.
        @[JSON::Field(key: "Region")]
        getter region : String?

        # The name of the vocabulary passed to Amazon Transcribe Medical.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        def initialize(
          @language_code : String,
          @specialty : String,
          @type : String,
          @content_identification_type : String? = nil,
          @region : String? = nil,
          @vocabulary_name : String? = nil
        )
        end
      end

      # Settings specific for Amazon Transcribe as the live transcription engine. If you specify an invalid
      # combination of parameters, a TranscriptFailed event will be sent with the contents of the
      # BadRequestException generated by Amazon Transcribe. For more information on each parameter and which
      # combinations are valid, refer to the StartStreamTranscription API in the Amazon Transcribe Developer
      # Guide .
      struct EngineTranscribeSettings
        include JSON::Serializable

        # Labels all personally identifiable information (PII) identified in your transcript. If you don't
        # include PiiEntityTypes , all PII is identified. You can’t set ContentIdentificationType and
        # ContentRedactionType .
        @[JSON::Field(key: "ContentIdentificationType")]
        getter content_identification_type : String?

        # Content redaction is performed at the segment level. If you don't include PiiEntityTypes , all PII
        # is redacted. You can’t set ContentRedactionType and ContentIdentificationType .
        @[JSON::Field(key: "ContentRedactionType")]
        getter content_redaction_type : String?

        # Enables partial result stabilization for your transcription. Partial result stabilization can reduce
        # latency in your output, but may impact accuracy.
        @[JSON::Field(key: "EnablePartialResultsStabilization")]
        getter enable_partial_results_stabilization : Bool?

        # Enables automatic language identification for your transcription. If you include IdentifyLanguage ,
        # you can optionally use LanguageOptions to include a list of language codes that you think may be
        # present in your audio stream. Including language options can improve transcription accuracy. You can
        # also use PreferredLanguage to include a preferred language. Doing so can help Amazon Transcribe
        # identify the language faster. You must include either LanguageCode or IdentifyLanguage . Language
        # identification can't be combined with custom language models or redaction.
        @[JSON::Field(key: "IdentifyLanguage")]
        getter identify_language : Bool?

        # Specify the language code that represents the language spoken. If you're unsure of the language
        # spoken in your audio, consider using IdentifyLanguage to enable automatic language identification.
        @[JSON::Field(key: "LanguageCode")]
        getter language_code : String?

        # Specify the name of the custom language model that you want to use when processing your
        # transcription. Note that language model names are case sensitive. The language of the specified
        # language model must match the language code. If the languages don't match, the custom language model
        # isn't applied. There are no errors or warnings associated with a language mismatch. If you use
        # Amazon Transcribe in multiple Regions, the custom language model must be available in Amazon
        # Transcribe in each Region.
        @[JSON::Field(key: "LanguageModelName")]
        getter language_model_name : String?

        # Specify two or more language codes that represent the languages you think may be present in your
        # media; including more than five is not recommended. If you're unsure what languages are present, do
        # not include this parameter. Including language options can improve the accuracy of language
        # identification. If you include LanguageOptions , you must also include IdentifyLanguage . You can
        # only include one language dialect per language. For example, you cannot include en-US and en-AU .
        @[JSON::Field(key: "LanguageOptions")]
        getter language_options : String?

        # Specify the level of stability to use when you enable partial results stabilization (
        # EnablePartialResultsStabilization ). Low stability provides the highest accuracy. High stability
        # transcribes faster, but with slightly lower accuracy.
        @[JSON::Field(key: "PartialResultsStability")]
        getter partial_results_stability : String?

        # Specify which types of personally identifiable information (PII) you want to redact in your
        # transcript. You can include as many types as you'd like, or you can select ALL . Values must be
        # comma-separated and can include: ADDRESS , BANK_ACCOUNT_NUMBER , BANK_ROUTING , CREDIT_DEBIT_CVV ,
        # CREDIT_DEBIT_EXPIRY CREDIT_DEBIT_NUMBER , EMAIL , NAME , PHONE , PIN , SSN , or ALL . Note that if
        # you include PiiEntityTypes , you must also include ContentIdentificationType or ContentRedactionType
        # . If you include ContentRedactionType or ContentIdentificationType , but do not include
        # PiiEntityTypes, all PII is redacted or identified.
        @[JSON::Field(key: "PiiEntityTypes")]
        getter pii_entity_types : String?

        # Specify a preferred language from the subset of languages codes you specified in LanguageOptions .
        # You can only use this parameter if you include IdentifyLanguage and LanguageOptions .
        @[JSON::Field(key: "PreferredLanguage")]
        getter preferred_language : String?

        # The Amazon Web Services Region in which to use Amazon Transcribe. If you don't specify a Region,
        # then the MediaRegion of the meeting is used. However, if Amazon Transcribe is not available in the
        # MediaRegion , then a TranscriptFailed event is sent. Use auto to use Amazon Transcribe in a Region
        # near the meeting’s MediaRegion . For more information, refer to Choosing a transcription Region in
        # the Amazon Chime SDK Developer Guide .
        @[JSON::Field(key: "Region")]
        getter region : String?

        # Specify how you want your vocabulary filter applied to your transcript. To replace words with *** ,
        # choose mask . To delete words, choose remove . To flag words without changing them, choose tag .
        @[JSON::Field(key: "VocabularyFilterMethod")]
        getter vocabulary_filter_method : String?

        # Specify the name of the custom vocabulary filter that you want to use when processing your
        # transcription. Note that vocabulary filter names are case sensitive. If you use Amazon Transcribe in
        # multiple Regions, the vocabulary filter must be available in Amazon Transcribe in each Region. If
        # you include IdentifyLanguage and want to use one or more vocabulary filters with your transcription,
        # use the VocabularyFilterNames parameter instead.
        @[JSON::Field(key: "VocabularyFilterName")]
        getter vocabulary_filter_name : String?

        # Specify the names of the custom vocabulary filters that you want to use when processing your
        # transcription. Note that vocabulary filter names are case sensitive. If you use Amazon Transcribe in
        # multiple Regions, the vocabulary filter must be available in Amazon Transcribe in each Region. If
        # you're not including IdentifyLanguage and want to use a custom vocabulary filter with your
        # transcription, use the VocabularyFilterName parameter instead.
        @[JSON::Field(key: "VocabularyFilterNames")]
        getter vocabulary_filter_names : String?

        # Specify the name of the custom vocabulary that you want to use when processing your transcription.
        # Note that vocabulary names are case sensitive. If you use Amazon Transcribe multiple Regions, the
        # vocabulary must be available in Amazon Transcribe in each Region. If you include IdentifyLanguage
        # and want to use one or more custom vocabularies with your transcription, use the VocabularyNames
        # parameter instead.
        @[JSON::Field(key: "VocabularyName")]
        getter vocabulary_name : String?

        # Specify the names of the custom vocabularies that you want to use when processing your
        # transcription. Note that vocabulary names are case sensitive. If you use Amazon Transcribe in
        # multiple Regions, the vocabulary must be available in Amazon Transcribe in each Region. If you don't
        # include IdentifyLanguage and want to use a custom vocabulary with your transcription, use the
        # VocabularyName parameter instead.
        @[JSON::Field(key: "VocabularyNames")]
        getter vocabulary_names : String?

        def initialize(
          @content_identification_type : String? = nil,
          @content_redaction_type : String? = nil,
          @enable_partial_results_stabilization : Bool? = nil,
          @identify_language : Bool? = nil,
          @language_code : String? = nil,
          @language_model_name : String? = nil,
          @language_options : String? = nil,
          @partial_results_stability : String? = nil,
          @pii_entity_types : String? = nil,
          @preferred_language : String? = nil,
          @region : String? = nil,
          @vocabulary_filter_method : String? = nil,
          @vocabulary_filter_name : String? = nil,
          @vocabulary_filter_names : String? = nil,
          @vocabulary_name : String? = nil,
          @vocabulary_names : String? = nil
        )
        end
      end

      # The client is permanently forbidden from making the request.
      struct ForbiddenException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      struct GetAttendeeRequest
        include JSON::Serializable

        # The Amazon Chime SDK attendee ID.
        @[JSON::Field(key: "AttendeeId")]
        getter attendee_id : String

        # The Amazon Chime SDK meeting ID.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @attendee_id : String,
          @meeting_id : String
        )
        end
      end

      struct GetAttendeeResponse
        include JSON::Serializable

        # The Amazon Chime SDK attendee information.
        @[JSON::Field(key: "Attendee")]
        getter attendee : Types::Attendee?

        def initialize(
          @attendee : Types::Attendee? = nil
        )
        end
      end

      struct GetMeetingRequest
        include JSON::Serializable

        # The Amazon Chime SDK meeting ID.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @meeting_id : String
        )
        end
      end

      struct GetMeetingResponse
        include JSON::Serializable

        # The Amazon Chime SDK meeting information.
        @[JSON::Field(key: "Meeting")]
        getter meeting : Types::Meeting?

        def initialize(
          @meeting : Types::Meeting? = nil
        )
        end
      end

      # The request exceeds the resource limit.
      struct LimitExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      struct ListAttendeesRequest
        include JSON::Serializable

        # The Amazon Chime SDK meeting ID.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        # The maximum number of results to return in a single call.
        @[JSON::Field(key: "max-results")]
        getter max_results : Int32?

        # The token to use to retrieve the next page of results.
        @[JSON::Field(key: "next-token")]
        getter next_token : String?

        def initialize(
          @meeting_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAttendeesResponse
        include JSON::Serializable

        # The Amazon Chime SDK attendee information.
        @[JSON::Field(key: "Attendees")]
        getter attendees : Array(Types::Attendee)?

        # The token to use to retrieve the next page of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attendees : Array(Types::Attendee)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "arn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags requested for the specified resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # A set of endpoints used by clients to connect to the media service group for an Amazon Chime SDK
      # meeting.
      struct MediaPlacement
        include JSON::Serializable

        # The audio fallback URL.
        @[JSON::Field(key: "AudioFallbackUrl")]
        getter audio_fallback_url : String?

        # The audio host URL.
        @[JSON::Field(key: "AudioHostUrl")]
        getter audio_host_url : String?

        # The event ingestion URL.
        @[JSON::Field(key: "EventIngestionUrl")]
        getter event_ingestion_url : String?

        # The screen data URL. This parameter is deprecated and no longer used by the Amazon Chime SDK.
        @[JSON::Field(key: "ScreenDataUrl")]
        getter screen_data_url : String?

        # The screen sharing URL. This parameter is deprecated and no longer used by the Amazon Chime SDK.
        @[JSON::Field(key: "ScreenSharingUrl")]
        getter screen_sharing_url : String?

        # The screen viewing URL. This parameter is deprecated and no longer used by the Amazon Chime SDK.
        @[JSON::Field(key: "ScreenViewingUrl")]
        getter screen_viewing_url : String?

        # The signaling URL.
        @[JSON::Field(key: "SignalingUrl")]
        getter signaling_url : String?

        # The turn control URL. This parameter is deprecated and no longer used by the Amazon Chime SDK.
        @[JSON::Field(key: "TurnControlUrl")]
        getter turn_control_url : String?

        def initialize(
          @audio_fallback_url : String? = nil,
          @audio_host_url : String? = nil,
          @event_ingestion_url : String? = nil,
          @screen_data_url : String? = nil,
          @screen_sharing_url : String? = nil,
          @screen_viewing_url : String? = nil,
          @signaling_url : String? = nil,
          @turn_control_url : String? = nil
        )
        end
      end

      # A meeting created using the Amazon Chime SDK.
      struct Meeting
        include JSON::Serializable

        # The external meeting ID. Pattern: [-_&amp;@+=,(){}\[\]\/«».:|'"#a-zA-Z0-9À-ÿ\s]* Values that begin
        # with aws: are reserved. You can't configure a value that uses this prefix. Case insensitive.
        @[JSON::Field(key: "ExternalMeetingId")]
        getter external_meeting_id : String?

        # The media placement for the meeting.
        @[JSON::Field(key: "MediaPlacement")]
        getter media_placement : Types::MediaPlacement?

        # The Region in which you create the meeting. Available values: af-south-1 , ap-northeast-1 ,
        # ap-northeast-2 , ap-south-1 , ap-southeast-1 , ap-southeast-2 , ca-central-1 , eu-central-1 ,
        # eu-north-1 , eu-south-1 , eu-west-1 , eu-west-2 , eu-west-3 , sa-east-1 , us-east-1 , us-east-2 ,
        # us-west-1 , us-west-2 . Available values in Amazon Web Services GovCloud (US) Regions: us-gov-east-1
        # , us-gov-west-1 .
        @[JSON::Field(key: "MediaRegion")]
        getter media_region : String?

        # The ARN of the meeting.
        @[JSON::Field(key: "MeetingArn")]
        getter meeting_arn : String?

        # The features available to a meeting, such as echo reduction.
        @[JSON::Field(key: "MeetingFeatures")]
        getter meeting_features : Types::MeetingFeaturesConfiguration?

        # Reserved.
        @[JSON::Field(key: "MeetingHostId")]
        getter meeting_host_id : String?

        # The Amazon Chime SDK meeting ID.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String?

        # When specified, replicates the media from the primary meeting to this meeting.
        @[JSON::Field(key: "PrimaryMeetingId")]
        getter primary_meeting_id : String?

        # Array of strings.
        @[JSON::Field(key: "TenantIds")]
        getter tenant_ids : Array(String)?

        def initialize(
          @external_meeting_id : String? = nil,
          @media_placement : Types::MediaPlacement? = nil,
          @media_region : String? = nil,
          @meeting_arn : String? = nil,
          @meeting_features : Types::MeetingFeaturesConfiguration? = nil,
          @meeting_host_id : String? = nil,
          @meeting_id : String? = nil,
          @primary_meeting_id : String? = nil,
          @tenant_ids : Array(String)? = nil
        )
        end
      end

      # The configuration settings of the features available to a meeting.
      struct MeetingFeaturesConfiguration
        include JSON::Serializable

        # The configuration settings for the attendee features available to a meeting.
        @[JSON::Field(key: "Attendee")]
        getter attendee : Types::AttendeeFeatures?

        # The configuration settings for the audio features available to a meeting.
        @[JSON::Field(key: "Audio")]
        getter audio : Types::AudioFeatures?

        # The configuration settings for the content features available to a meeting.
        @[JSON::Field(key: "Content")]
        getter content : Types::ContentFeatures?

        # The configuration settings for the video features available to a meeting.
        @[JSON::Field(key: "Video")]
        getter video : Types::VideoFeatures?

        def initialize(
          @attendee : Types::AttendeeFeatures? = nil,
          @audio : Types::AudioFeatures? = nil,
          @content : Types::ContentFeatures? = nil,
          @video : Types::VideoFeatures? = nil
        )
        end
      end

      # One or more of the resources in the request does not exist in the system.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request ID associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The configuration for resource targets to receive notifications when meeting and attendee events
      # occur.
      struct NotificationsConfiguration
        include JSON::Serializable

        # The ARN of the Amazon Web Services Lambda function in the notifications configuration.
        @[JSON::Field(key: "LambdaFunctionArn")]
        getter lambda_function_arn : String?

        # The ARN of the SNS topic.
        @[JSON::Field(key: "SnsTopicArn")]
        getter sns_topic_arn : String?

        # The ARN of the SQS queue.
        @[JSON::Field(key: "SqsQueueArn")]
        getter sqs_queue_arn : String?

        def initialize(
          @lambda_function_arn : String? = nil,
          @sns_topic_arn : String? = nil,
          @sqs_queue_arn : String? = nil
        )
        end
      end

      # The resource that you want to tag couldn't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the resource that couldn't be found.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The name of the resource that couldn't be found.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The service encountered an unexpected error.
      struct ServiceFailureException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the failed request.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The service is currently unavailable.
      struct ServiceUnavailableException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The number of seconds the caller should wait before retrying.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil,
          @retry_after_seconds : String? = nil
        )
        end
      end

      struct StartMeetingTranscriptionRequest
        include JSON::Serializable

        # The unique ID of the meeting being transcribed.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        # The configuration for the current transcription operation. Must contain EngineTranscribeSettings or
        # EngineTranscribeMedicalSettings .
        @[JSON::Field(key: "TranscriptionConfiguration")]
        getter transcription_configuration : Types::TranscriptionConfiguration

        def initialize(
          @meeting_id : String,
          @transcription_configuration : Types::TranscriptionConfiguration
        )
        end
      end

      struct StopMeetingTranscriptionRequest
        include JSON::Serializable

        # The unique ID of the meeting for which you stop transcription.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @meeting_id : String
        )
        end
      end

      # A key-value pair that you define.
      struct Tag
        include JSON::Serializable

        # The tag's key.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The tag's value.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # Lists the requested tags.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The number of customer requests exceeds the request rate limit.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the request that exceeded the throttling limit.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # Too many tags were added to the specified resource.
      struct TooManyTagsException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ID of the request that contains too many tags.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The name of the resource that received too many tags.
        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # The configuration for the current transcription operation. Must contain EngineTranscribeSettings or
      # EngineTranscribeMedicalSettings .
      struct TranscriptionConfiguration
        include JSON::Serializable

        # The transcription configuration settings passed to Amazon Transcribe Medical.
        @[JSON::Field(key: "EngineTranscribeMedicalSettings")]
        getter engine_transcribe_medical_settings : Types::EngineTranscribeMedicalSettings?

        # The transcription configuration settings passed to Amazon Transcribe.
        @[JSON::Field(key: "EngineTranscribeSettings")]
        getter engine_transcribe_settings : Types::EngineTranscribeSettings?

        def initialize(
          @engine_transcribe_medical_settings : Types::EngineTranscribeMedicalSettings? = nil,
          @engine_transcribe_settings : Types::EngineTranscribeSettings? = nil
        )
        end
      end

      # The user isn't authorized to request a resource.
      struct UnauthorizedException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      # The request was well-formed but was unable to be followed due to semantic errors.
      struct UnprocessableEntityException
        include JSON::Serializable

        @[JSON::Field(key: "Code")]
        getter code : String?

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The request id associated with the call responsible for the exception.
        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil,
          @request_id : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource that you're removing tags from.
        @[JSON::Field(key: "ResourceARN")]
        getter resource_arn : String

        # The tag keys being removed from the resources.
        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateAttendeeCapabilitiesRequest
        include JSON::Serializable

        # The ID of the attendee associated with the update request.
        @[JSON::Field(key: "AttendeeId")]
        getter attendee_id : String

        # The capabilities that you want to update.
        @[JSON::Field(key: "Capabilities")]
        getter capabilities : Types::AttendeeCapabilities

        # The ID of the meeting associated with the update request.
        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String

        def initialize(
          @attendee_id : String,
          @capabilities : Types::AttendeeCapabilities,
          @meeting_id : String
        )
        end
      end

      struct UpdateAttendeeCapabilitiesResponse
        include JSON::Serializable

        # The updated attendee data.
        @[JSON::Field(key: "Attendee")]
        getter attendee : Types::Attendee?

        def initialize(
          @attendee : Types::Attendee? = nil
        )
        end
      end

      # The video features set for the meeting. Applies to all attendees. If you specify
      # MeetingFeatures:Video:MaxResolution:None when you create a meeting, all API requests that include
      # SendReceive , Send , or Receive for AttendeeCapabilities:Video will be rejected with ValidationError
      # 400 .
      struct VideoFeatures
        include JSON::Serializable

        # The maximum video resolution for the meeting. Applies to all attendees. Defaults to HD . To use FHD
        # , you must also provide a MeetingFeatures:Attendee:MaxCount value and override the default size
        # limit of 250 attendees.
        @[JSON::Field(key: "MaxResolution")]
        getter max_resolution : String?

        def initialize(
          @max_resolution : String? = nil
        )
        end
      end
    end
  end
end
