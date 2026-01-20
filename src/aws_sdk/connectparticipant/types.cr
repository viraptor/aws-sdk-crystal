require "json"

module AwsSdk
  module ConnectParticipant
    module Types

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The case-insensitive input to indicate standard MIME type that describes the format of the file that
      # will be uploaded.

      struct AttachmentItem
        include JSON::Serializable

        # A unique identifier for the attachment.

        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # A case-sensitive name of the attachment being uploaded.

        @[JSON::Field(key: "AttachmentName")]
        getter attachment_name : String?

        # Describes the MIME file type of the attachment. For a list of supported file types, see Feature
        # specifications in the Amazon Connect Administrator Guide .

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # Status of the attachment.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @attachment_id : String? = nil,
          @attachment_name : String? = nil,
          @content_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The attendee information, including attendee ID and join token.

      struct Attendee
        include JSON::Serializable

        # The Amazon Chime SDK attendee ID.

        @[JSON::Field(key: "AttendeeId")]
        getter attendee_id : String?

        # The join token used by the Amazon Chime SDK attendee.

        @[JSON::Field(key: "JoinToken")]
        getter join_token : String?

        def initialize(
          @attendee_id : String? = nil,
          @join_token : String? = nil
        )
        end
      end

      # Has audio-specific configurations as the operating parameter for Echo Reduction.

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


      struct CancelParticipantAuthenticationRequest
        include JSON::Serializable

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # The sessionId provided in the authenticationInitiated event.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @connection_token : String,
          @session_id : String
        )
        end
      end


      struct CancelParticipantAuthenticationResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct CompleteAttachmentUploadRequest
        include JSON::Serializable

        # A list of unique identifiers for the attachments.

        @[JSON::Field(key: "AttachmentIds")]
        getter attachment_ids : Array(String)

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        def initialize(
          @attachment_ids : Array(String),
          @client_token : String,
          @connection_token : String
        )
        end
      end


      struct CompleteAttachmentUploadResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The requested operation conflicts with the current state of a service resource associated with the
      # request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Connection credentials.

      struct ConnectionCredentials
        include JSON::Serializable

        # The connection token.

        @[JSON::Field(key: "ConnectionToken")]
        getter connection_token : String?

        # The expiration of the token. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For
        # example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "Expiry")]
        getter expiry : String?

        def initialize(
          @connection_token : String? = nil,
          @expiry : String? = nil
        )
        end
      end


      struct CreateParticipantConnectionRequest
        include JSON::Serializable

        # This is a header parameter. The ParticipantToken as obtained from StartChatContact API response.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter participant_token : String

        # Amazon Connect Participant is used to mark the participant as connected for customer participant in
        # message streaming, as well as for agent or manager participant in non-streaming chats.

        @[JSON::Field(key: "ConnectParticipant")]
        getter connect_participant : Bool?

        # Type of connection information required. If you need CONNECTION_CREDENTIALS along with marking
        # participant as connected, pass CONNECTION_CREDENTIALS in Type .

        @[JSON::Field(key: "Type")]
        getter type : Array(String)?

        def initialize(
          @participant_token : String,
          @connect_participant : Bool? = nil,
          @type : Array(String)? = nil
        )
        end
      end


      struct CreateParticipantConnectionResponse
        include JSON::Serializable

        # Creates the participant's connection credentials. The authentication token associated with the
        # participant's connection.

        @[JSON::Field(key: "ConnectionCredentials")]
        getter connection_credentials : Types::ConnectionCredentials?

        # Creates the participant's WebRTC connection data required for the client application (mobile
        # application or website) to connect to the call.

        @[JSON::Field(key: "WebRTCConnection")]
        getter web_rtc_connection : Types::WebRTCConnection?

        # Creates the participant's websocket connection.

        @[JSON::Field(key: "Websocket")]
        getter websocket : Types::Websocket?

        def initialize(
          @connection_credentials : Types::ConnectionCredentials? = nil,
          @web_rtc_connection : Types::WebRTCConnection? = nil,
          @websocket : Types::Websocket? = nil
        )
        end
      end


      struct DescribeViewRequest
        include JSON::Serializable

        # The connection token.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # An encrypted token originating from the interactive message of a ShowView block operation.
        # Represents the desired view.

        @[JSON::Field(key: "ViewToken")]
        getter view_token : String

        def initialize(
          @connection_token : String,
          @view_token : String
        )
        end
      end


      struct DescribeViewResponse
        include JSON::Serializable

        # A view resource object. Contains metadata and content necessary to render the view.

        @[JSON::Field(key: "View")]
        getter view : Types::View?

        def initialize(
          @view : Types::View? = nil
        )
        end
      end


      struct DisconnectParticipantRequest
        include JSON::Serializable

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @connection_token : String,
          @client_token : String? = nil
        )
        end
      end


      struct DisconnectParticipantResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct GetAttachmentRequest
        include JSON::Serializable

        # A unique identifier for the attachment.

        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format:
        # yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "UrlExpiryInSeconds")]
        getter url_expiry_in_seconds : Int32?

        def initialize(
          @attachment_id : String,
          @connection_token : String,
          @url_expiry_in_seconds : Int32? = nil
        )
        end
      end


      struct GetAttachmentResponse
        include JSON::Serializable

        # The size of the attachment in bytes.

        @[JSON::Field(key: "AttachmentSizeInBytes")]
        getter attachment_size_in_bytes : Int64

        # This is the pre-signed URL that can be used for uploading the file to Amazon S3 when used in
        # response to StartAttachmentUpload .

        @[JSON::Field(key: "Url")]
        getter url : String?

        # The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format:
        # yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "UrlExpiry")]
        getter url_expiry : String?

        def initialize(
          @attachment_size_in_bytes : Int64,
          @url : String? = nil,
          @url_expiry : String? = nil
        )
        end
      end


      struct GetAuthenticationUrlRequest
        include JSON::Serializable

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # The URL where the customer will be redirected after Amazon Cognito authorizes the user.

        @[JSON::Field(key: "RedirectUri")]
        getter redirect_uri : String

        # The sessionId provided in the authenticationInitiated event.

        @[JSON::Field(key: "SessionId")]
        getter session_id : String

        def initialize(
          @connection_token : String,
          @redirect_uri : String,
          @session_id : String
        )
        end
      end


      struct GetAuthenticationUrlResponse
        include JSON::Serializable

        # The URL where the customer will sign in to the identity provider. This URL contains the authorize
        # endpoint for the Cognito UserPool used in the authentication.

        @[JSON::Field(key: "AuthenticationUrl")]
        getter authentication_url : String?

        def initialize(
          @authentication_url : String? = nil
        )
        end
      end


      struct GetTranscriptRequest
        include JSON::Serializable

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # The contactId from the current contact chain for which transcript is needed.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String?

        # The maximum number of results to return in the page. Default: 10.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token. Use the value returned previously in the next subsequent request to retrieve
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The direction from StartPosition from which to retrieve message. Default: BACKWARD when no
        # StartPosition is provided, FORWARD with StartPosition.

        @[JSON::Field(key: "ScanDirection")]
        getter scan_direction : String?

        # The sort order for the records. Default: DESCENDING.

        @[JSON::Field(key: "SortOrder")]
        getter sort_order : String?

        # A filtering option for where to start.

        @[JSON::Field(key: "StartPosition")]
        getter start_position : Types::StartPosition?

        def initialize(
          @connection_token : String,
          @contact_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @scan_direction : String? = nil,
          @sort_order : String? = nil,
          @start_position : Types::StartPosition? = nil
        )
        end
      end


      struct GetTranscriptResponse
        include JSON::Serializable

        # The initial contact ID for the contact.

        @[JSON::Field(key: "InitialContactId")]
        getter initial_contact_id : String?

        # The pagination token. Use the value returned previously in the next subsequent request to retrieve
        # the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The list of messages in the session.

        @[JSON::Field(key: "Transcript")]
        getter transcript : Array(Types::Item)?

        def initialize(
          @initial_contact_id : String? = nil,
          @next_token : String? = nil,
          @transcript : Array(Types::Item)? = nil
        )
        end
      end

      # This exception occurs when there is an internal failure in the Amazon Connect service.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # An item - message or event - that has been sent.

      struct Item
        include JSON::Serializable

        # The time when the message or event was sent. It's specified in ISO 8601 format:
        # yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "AbsoluteTime")]
        getter absolute_time : String?

        # Provides information about the attachments.

        @[JSON::Field(key: "Attachments")]
        getter attachments : Array(Types::AttachmentItem)?

        # The contactId on which the transcript item was originally sent. This field is populated only when
        # the transcript item is from the current chat session.

        @[JSON::Field(key: "ContactId")]
        getter contact_id : String?

        # The content of the message or event.

        @[JSON::Field(key: "Content")]
        getter content : String?

        # The type of content of the item.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String?

        # The chat display name of the sender.

        @[JSON::Field(key: "DisplayName")]
        getter display_name : String?

        # The ID of the item.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The metadata related to the message. Currently this supports only information related to message
        # receipts.

        @[JSON::Field(key: "MessageMetadata")]
        getter message_metadata : Types::MessageMetadata?

        # The ID of the sender in the session.

        @[JSON::Field(key: "ParticipantId")]
        getter participant_id : String?

        # The role of the sender. For example, is it a customer, agent, or system.

        @[JSON::Field(key: "ParticipantRole")]
        getter participant_role : String?

        # The contactId on which the transcript item was originally sent. This field is only populated for
        # persistent chats when the transcript item is from the past chat session. For more information, see
        # Enable persistent chat .

        @[JSON::Field(key: "RelatedContactId")]
        getter related_contact_id : String?

        # Type of the item: message or event.

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @absolute_time : String? = nil,
          @attachments : Array(Types::AttachmentItem)? = nil,
          @contact_id : String? = nil,
          @content : String? = nil,
          @content_type : String? = nil,
          @display_name : String? = nil,
          @id : String? = nil,
          @message_metadata : Types::MessageMetadata? = nil,
          @participant_id : String? = nil,
          @participant_role : String? = nil,
          @related_contact_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The configuration settings of the features available to a meeting.

      struct MeetingFeaturesConfiguration
        include JSON::Serializable

        # The configuration settings for the audio features available to a meeting.

        @[JSON::Field(key: "Audio")]
        getter audio : Types::AudioFeatures?

        def initialize(
          @audio : Types::AudioFeatures? = nil
        )
        end
      end

      # Contains metadata related to a message.

      struct MessageMetadata
        include JSON::Serializable

        # The identifier of the message that contains the metadata information.

        @[JSON::Field(key: "MessageId")]
        getter message_id : String?

        # The status of Message Processing for the message.

        @[JSON::Field(key: "MessageProcessingStatus")]
        getter message_processing_status : String?

        # The list of receipt information for a message for different recipients.

        @[JSON::Field(key: "Receipts")]
        getter receipts : Array(Types::Receipt)?

        def initialize(
          @message_id : String? = nil,
          @message_processing_status : String? = nil,
          @receipts : Array(Types::Receipt)? = nil
        )
        end
      end

      # Contains metadata for chat messages.

      struct MessageProcessingMetadata
        include JSON::Serializable

        # The status of Message Processing for the message.

        @[JSON::Field(key: "MessageProcessingStatus")]
        getter message_processing_status : String?

        def initialize(
          @message_processing_status : String? = nil
        )
        end
      end

      # The receipt for the message delivered to the recipient.

      struct Receipt
        include JSON::Serializable

        # The time when the message was delivered to the recipient.

        @[JSON::Field(key: "DeliveredTimestamp")]
        getter delivered_timestamp : String?

        # The time when the message was read by the recipient.

        @[JSON::Field(key: "ReadTimestamp")]
        getter read_timestamp : String?

        # The identifier of the recipient of the message.

        @[JSON::Field(key: "RecipientParticipantId")]
        getter recipient_participant_id : String?

        def initialize(
          @delivered_timestamp : String? = nil,
          @read_timestamp : String? = nil,
          @recipient_participant_id : String? = nil
        )
        end
      end

      # The resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        # The identifier of the resource.

        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String?

        # The type of Amazon Connect resource.

        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct SendEventRequest
        include JSON::Serializable

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # The content type of the request. Supported types are: application/vnd.amazonaws.connect.event.typing
        # application/vnd.amazonaws.connect.event.connection.acknowledged (is no longer maintained since
        # December 31, 2024) application/vnd.amazonaws.connect.event.message.delivered
        # application/vnd.amazonaws.connect.event.message.read

        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The content of the event to be sent (for example, message text). For content related to message
        # receipts, this is supported in the form of a JSON string. Sample Content:
        # "{\"messageId\":\"11111111-aaaa-bbbb-cccc-EXAMPLE01234\"}"

        @[JSON::Field(key: "Content")]
        getter content : String?

        def initialize(
          @connection_token : String,
          @content_type : String,
          @client_token : String? = nil,
          @content : String? = nil
        )
        end
      end


      struct SendEventResponse
        include JSON::Serializable

        # The time when the event was sent. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For
        # example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "AbsoluteTime")]
        getter absolute_time : String?

        # The ID of the response.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @absolute_time : String? = nil,
          @id : String? = nil
        )
        end
      end


      struct SendMessageRequest
        include JSON::Serializable

        # The authentication token associated with the connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # The content of the message. For text/plain and text/markdown , the Length Constraints are Minimum of
        # 1, Maximum of 1024. For application/json , the Length Constraints are Minimum of 1, Maximum of
        # 12000. For application/vnd.amazonaws.connect.message.interactive.response , the Length Constraints
        # are Minimum of 1, Maximum of 12288.

        @[JSON::Field(key: "Content")]
        getter content : String

        # The type of the content. Possible types are text/plain , text/markdown , application/json , and
        # application/vnd.amazonaws.connect.message.interactive.response . Supported types on the contact are
        # configured through SupportedMessagingContentTypes on StartChatContact and StartOutboundChatContact .
        # For Apple Messages for Business, SMS, and WhatsApp Business Messaging contacts, only text/plain is
        # supported.

        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        def initialize(
          @connection_token : String,
          @content : String,
          @content_type : String,
          @client_token : String? = nil
        )
        end
      end


      struct SendMessageResponse
        include JSON::Serializable

        # The time when the message was sent. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ. For
        # example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "AbsoluteTime")]
        getter absolute_time : String?

        # The ID of the message.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # Contains metadata for the message.

        @[JSON::Field(key: "MessageMetadata")]
        getter message_metadata : Types::MessageProcessingMetadata?

        def initialize(
          @absolute_time : String? = nil,
          @id : String? = nil,
          @message_metadata : Types::MessageProcessingMetadata? = nil
        )
        end
      end

      # The number of attachments per contact exceeds the quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct StartAttachmentUploadRequest
        include JSON::Serializable

        # A case-sensitive name of the attachment being uploaded.

        @[JSON::Field(key: "AttachmentName")]
        getter attachment_name : String

        # The size of the attachment in bytes.

        @[JSON::Field(key: "AttachmentSizeInBytes")]
        getter attachment_size_in_bytes : Int64

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # not provided, the Amazon Web Services SDK populates this field. For more information about
        # idempotency, see Making retries safe with idempotent APIs .

        @[JSON::Field(key: "ClientToken")]
        getter client_token : String

        # The authentication token associated with the participant's connection.

        @[JSON::Field(key: "X-Amz-Bearer")]
        getter connection_token : String

        # Describes the MIME file type of the attachment. For a list of supported file types, see Feature
        # specifications in the Amazon Connect Administrator Guide .

        @[JSON::Field(key: "ContentType")]
        getter content_type : String

        def initialize(
          @attachment_name : String,
          @attachment_size_in_bytes : Int64,
          @client_token : String,
          @connection_token : String,
          @content_type : String
        )
        end
      end


      struct StartAttachmentUploadResponse
        include JSON::Serializable

        # A unique identifier for the attachment.

        @[JSON::Field(key: "AttachmentId")]
        getter attachment_id : String?

        # The headers to be provided while uploading the file to the URL.

        @[JSON::Field(key: "UploadMetadata")]
        getter upload_metadata : Types::UploadMetadata?

        def initialize(
          @attachment_id : String? = nil,
          @upload_metadata : Types::UploadMetadata? = nil
        )
        end
      end

      # A filtering option for where to start. For example, if you sent 100 messages, start with message 50.

      struct StartPosition
        include JSON::Serializable

        # The time in ISO format where to start. It's specified in ISO 8601 format: yyyy-MM-ddThh:mm:ss.SSSZ.
        # For example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "AbsoluteTime")]
        getter absolute_time : String?

        # The ID of the message or event where to start.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The start position of the most recent message where you want to start.

        @[JSON::Field(key: "MostRecent")]
        getter most_recent : Int32?

        def initialize(
          @absolute_time : String? = nil,
          @id : String? = nil,
          @most_recent : Int32? = nil
        )
        end
      end

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Fields to be used while uploading the attachment.

      struct UploadMetadata
        include JSON::Serializable

        # The headers to be provided while uploading the file to the URL.

        @[JSON::Field(key: "HeadersToInclude")]
        getter headers_to_include : Hash(String, String)?

        # This is the pre-signed URL that can be used for uploading the file to Amazon S3 when used in
        # response to StartAttachmentUpload .

        @[JSON::Field(key: "Url")]
        getter url : String?

        # The expiration time of the URL in ISO timestamp. It's specified in ISO 8601 format:
        # yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "UrlExpiry")]
        getter url_expiry : String?

        def initialize(
          @headers_to_include : Hash(String, String)? = nil,
          @url : String? = nil,
          @url_expiry : String? = nil
        )
        end
      end

      # The input fails to satisfy the constraints specified by Amazon Connect.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A view resource object. Contains metadata and content necessary to render the view.

      struct View
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the view.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # View content containing all content necessary to render a view except for runtime input data.

        @[JSON::Field(key: "Content")]
        getter content : Types::ViewContent?

        # The identifier of the view.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the view.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The current version of the view.

        @[JSON::Field(key: "Version")]
        getter version : Int32?

        def initialize(
          @arn : String? = nil,
          @content : Types::ViewContent? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @version : Int32? = nil
        )
        end
      end

      # View content containing all content necessary to render a view except for runtime input data.

      struct ViewContent
        include JSON::Serializable

        # A list of actions possible from the view

        @[JSON::Field(key: "Actions")]
        getter actions : Array(String)?

        # The schema representing the input data that the view template must be supplied to render.

        @[JSON::Field(key: "InputSchema")]
        getter input_schema : String?

        # The view template representing the structure of the view.

        @[JSON::Field(key: "Template")]
        getter template : String?

        def initialize(
          @actions : Array(String)? = nil,
          @input_schema : String? = nil,
          @template : String? = nil
        )
        end
      end

      # Creates the participant’s WebRTC connection data required for the client application (mobile or web)
      # to connect to the call.

      struct WebRTCConnection
        include JSON::Serializable


        @[JSON::Field(key: "Attendee")]
        getter attendee : Types::Attendee?

        # A meeting created using the Amazon Chime SDK.

        @[JSON::Field(key: "Meeting")]
        getter meeting : Types::WebRTCMeeting?

        def initialize(
          @attendee : Types::Attendee? = nil,
          @meeting : Types::WebRTCMeeting? = nil
        )
        end
      end

      # A set of endpoints used by clients to connect to the media service group for an Amazon Chime SDK
      # meeting.

      struct WebRTCMediaPlacement
        include JSON::Serializable

        # The audio fallback URL.

        @[JSON::Field(key: "AudioFallbackUrl")]
        getter audio_fallback_url : String?

        # The audio host URL.

        @[JSON::Field(key: "AudioHostUrl")]
        getter audio_host_url : String?

        # The event ingestion URL to which you send client meeting events.

        @[JSON::Field(key: "EventIngestionUrl")]
        getter event_ingestion_url : String?

        # The signaling URL.

        @[JSON::Field(key: "SignalingUrl")]
        getter signaling_url : String?

        def initialize(
          @audio_fallback_url : String? = nil,
          @audio_host_url : String? = nil,
          @event_ingestion_url : String? = nil,
          @signaling_url : String? = nil
        )
        end
      end

      # A meeting created using the Amazon Chime SDK.

      struct WebRTCMeeting
        include JSON::Serializable

        # The media placement for the meeting.

        @[JSON::Field(key: "MediaPlacement")]
        getter media_placement : Types::WebRTCMediaPlacement?


        @[JSON::Field(key: "MeetingFeatures")]
        getter meeting_features : Types::MeetingFeaturesConfiguration?

        # The Amazon Chime SDK meeting ID.

        @[JSON::Field(key: "MeetingId")]
        getter meeting_id : String?

        def initialize(
          @media_placement : Types::WebRTCMediaPlacement? = nil,
          @meeting_features : Types::MeetingFeaturesConfiguration? = nil,
          @meeting_id : String? = nil
        )
        end
      end

      # The websocket for the participant's connection.

      struct Websocket
        include JSON::Serializable

        # The URL expiration timestamp in ISO date format. It's specified in ISO 8601 format:
        # yyyy-MM-ddThh:mm:ss.SSSZ. For example, 2019-11-08T02:41:28.172Z.

        @[JSON::Field(key: "ConnectionExpiry")]
        getter connection_expiry : String?

        # The URL of the websocket.

        @[JSON::Field(key: "Url")]
        getter url : String?

        def initialize(
          @connection_expiry : String? = nil,
          @url : String? = nil
        )
        end
      end
    end
  end
end
