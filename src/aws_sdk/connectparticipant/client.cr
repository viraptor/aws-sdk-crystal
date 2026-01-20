module AwsSdk
  module ConnectParticipant
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
        @region = region || AwsSdk::Runtime::Defaults.resolve_region(profile)
        endpoint_provider = AwsSdk::Runtime::EndpointProvider.new(Model::ENDPOINT_PREFIX, Model::ENDPOINT_RULE_SET_JSON)
        endpoint_result = endpoint_provider.resolve(@region, endpoint, use_fips, use_dualstack)
        @endpoint = endpoint_result.url
        @endpoint_headers = endpoint_result.headers
      end

      # Cancels the authentication session. The opted out branch of the Authenticate Customer flow block
      # will be taken. The current supported channel is chat. This API is not supported for Apple Messages
      # for Business, WhatsApp, or SMS chats. ConnectionToken is used for invoking this API instead of
      # ParticipantToken . The Amazon Connect Participant Service APIs do not use Signature Version 4
      # authentication .

      def cancel_participant_authentication(
        connection_token : String,
        session_id : String
      ) : Protocol::Request
        input = Types::CancelParticipantAuthenticationRequest.new(connection_token: connection_token, session_id: session_id)
        cancel_participant_authentication(input)
      end

      def cancel_participant_authentication(input : Types::CancelParticipantAuthenticationRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CANCEL_PARTICIPANT_AUTHENTICATION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Allows you to confirm that the attachment has been uploaded using the pre-signed URL provided in
      # StartAttachmentUpload API. A conflict exception is thrown when an attachment with that identifier is
      # already being uploaded. For security recommendations, see Amazon Connect Chat security best
      # practices . ConnectionToken is used for invoking this API instead of ParticipantToken . The Amazon
      # Connect Participant Service APIs do not use Signature Version 4 authentication .

      def complete_attachment_upload(
        attachment_ids : Array(String),
        client_token : String,
        connection_token : String
      ) : Protocol::Request
        input = Types::CompleteAttachmentUploadRequest.new(attachment_ids: attachment_ids, client_token: client_token, connection_token: connection_token)
        complete_attachment_upload(input)
      end

      def complete_attachment_upload(input : Types::CompleteAttachmentUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::COMPLETE_ATTACHMENT_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Creates the participant's connection. For security recommendations, see Amazon Connect Chat security
      # best practices . For WebRTC security recommendations, see Amazon Connect WebRTC security best
      # practices . ParticipantToken is used for invoking this API instead of ConnectionToken . The
      # participant token is valid for the lifetime of the participant – until they are part of a contact.
      # For WebRTC participants, if they leave or are disconnected for 60 seconds, a new participant needs
      # to be created using the CreateParticipant API. For WEBSOCKET Type : The response URL for has a
      # connect expiry timeout of 100s. Clients must manually connect to the returned websocket URL and
      # subscribe to the desired topic. For chat, you need to publish the following on the established
      # websocket connection: {"topic":"aws/subscribe","content":{"topics":["aws/chat"]}} Upon websocket URL
      # expiry, as specified in the response ConnectionExpiry parameter, clients need to call this API again
      # to obtain a new websocket URL and perform the same steps as before. The expiry time for the
      # connection token is different than the ChatDurationInMinutes . Expiry time for the connection token
      # is 1 day. For WEBRTC_CONNECTION Type : The response includes connection data required for the client
      # application to join the call using the Amazon Chime SDK client libraries. The WebRTCConnection
      # response contains Meeting and Attendee information needed to establish the media connection. The
      # attendee join token in WebRTCConnection response is valid for the lifetime of the participant in the
      # call. If a participant leaves or is disconnected for 60 seconds, their participant credentials will
      # no longer be valid, and a new participant will need to be created to rejoin the call. Message
      # streaming support : This API can also be used together with the StartContactStreaming API to create
      # a participant connection for chat contacts that are not using a websocket. For more information
      # about message streaming, Enable real-time chat message streaming in the Amazon Connect Administrator
      # Guide . Multi-user web, in-app, video calling support : For WebRTC calls, this API is used in
      # conjunction with the CreateParticipant API to enable multi-party calling. The StartWebRTCContact API
      # creates the initial contact and routes it to an agent, while CreateParticipant adds additional
      # participants to the ongoing call. For more information about multi-party WebRTC calls, see Enable
      # multi-user web, in-app, and video calling in the Amazon Connect Administrator Guide . Feature
      # specifications : For information about feature specifications, such as the allowed number of open
      # websocket connections per participant or maximum number of WebRTC participants, see Feature
      # specifications in the Amazon Connect Administrator Guide . The Amazon Connect Participant Service
      # APIs do not use Signature Version 4 authentication .

      def create_participant_connection(
        participant_token : String,
        connect_participant : Bool? = nil,
        type : Array(String)? = nil
      ) : Protocol::Request
        input = Types::CreateParticipantConnectionRequest.new(participant_token: participant_token, connect_participant: connect_participant, type: type)
        create_participant_connection(input)
      end

      def create_participant_connection(input : Types::CreateParticipantConnectionRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::CREATE_PARTICIPANT_CONNECTION, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the view for the specified view token. For security recommendations, see Amazon Connect
      # Chat security best practices .

      def describe_view(
        connection_token : String,
        view_token : String
      ) : Protocol::Request
        input = Types::DescribeViewRequest.new(connection_token: connection_token, view_token: view_token)
        describe_view(input)
      end

      def describe_view(input : Types::DescribeViewRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DESCRIBE_VIEW, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Disconnects a participant. For security recommendations, see Amazon Connect Chat security best
      # practices . ConnectionToken is used for invoking this API instead of ParticipantToken . The Amazon
      # Connect Participant Service APIs do not use Signature Version 4 authentication .

      def disconnect_participant(
        connection_token : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::DisconnectParticipantRequest.new(connection_token: connection_token, client_token: client_token)
        disconnect_participant(input)
      end

      def disconnect_participant(input : Types::DisconnectParticipantRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::DISCONNECT_PARTICIPANT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a pre-signed URL for download of a completed attachment. This is an asynchronous API for
      # use with active contacts. For security recommendations, see Amazon Connect Chat security best
      # practices . The participant role CUSTOM_BOT is not permitted to access attachments customers may
      # upload. An AccessDeniedException can indicate that the participant may be a CUSTOM_BOT, and it
      # doesn't have access to attachments. ConnectionToken is used for invoking this API instead of
      # ParticipantToken . The Amazon Connect Participant Service APIs do not use Signature Version 4
      # authentication .

      def get_attachment(
        attachment_id : String,
        connection_token : String,
        url_expiry_in_seconds : Int32? = nil
      ) : Protocol::Request
        input = Types::GetAttachmentRequest.new(attachment_id: attachment_id, connection_token: connection_token, url_expiry_in_seconds: url_expiry_in_seconds)
        get_attachment(input)
      end

      def get_attachment(input : Types::GetAttachmentRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_ATTACHMENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves the AuthenticationUrl for the current authentication session for the AuthenticateCustomer
      # flow block. For security recommendations, see Amazon Connect Chat security best practices . This API
      # can only be called within one minute of receiving the authenticationInitiated event. The current
      # supported channel is chat. This API is not supported for Apple Messages for Business, WhatsApp, or
      # SMS chats. ConnectionToken is used for invoking this API instead of ParticipantToken . The Amazon
      # Connect Participant Service APIs do not use Signature Version 4 authentication .

      def get_authentication_url(
        connection_token : String,
        redirect_uri : String,
        session_id : String
      ) : Protocol::Request
        input = Types::GetAuthenticationUrlRequest.new(connection_token: connection_token, redirect_uri: redirect_uri, session_id: session_id)
        get_authentication_url(input)
      end

      def get_authentication_url(input : Types::GetAuthenticationUrlRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_AUTHENTICATION_URL, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Retrieves a transcript of the session, including details about any attachments. For information
      # about accessing past chat contact transcripts for a persistent chat, see Enable persistent chat .
      # For security recommendations, see Amazon Connect Chat security best practices . If you have a
      # process that consumes events in the transcript of an chat that has ended, note that chat transcripts
      # contain the following event content types if the event has occurred during the chat session:
      # application/vnd.amazonaws.connect.event.participant.invited
      # application/vnd.amazonaws.connect.event.participant.joined
      # application/vnd.amazonaws.connect.event.participant.left
      # application/vnd.amazonaws.connect.event.chat.ended
      # application/vnd.amazonaws.connect.event.transfer.succeeded
      # application/vnd.amazonaws.connect.event.transfer.failed ConnectionToken is used for invoking this
      # API instead of ParticipantToken . The Amazon Connect Participant Service APIs do not use Signature
      # Version 4 authentication .

      def get_transcript(
        connection_token : String,
        contact_id : String? = nil,
        max_results : Int32? = nil,
        next_token : String? = nil,
        scan_direction : String? = nil,
        sort_order : String? = nil,
        start_position : Types::StartPosition? = nil
      ) : Protocol::Request
        input = Types::GetTranscriptRequest.new(connection_token: connection_token, contact_id: contact_id, max_results: max_results, next_token: next_token, scan_direction: scan_direction, sort_order: sort_order, start_position: start_position)
        get_transcript(input)
      end

      def get_transcript(input : Types::GetTranscriptRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::GET_TRANSCRIPT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # The application/vnd.amazonaws.connect.event.connection.acknowledged ContentType is no longer
      # maintained since December 31, 2024. This event has been migrated to the CreateParticipantConnection
      # API using the ConnectParticipant field. Sends an event. Message receipts are not supported when
      # there are more than two active participants in the chat. Using the SendEvent API for message
      # receipts when a supervisor is barged-in will result in a conflict exception. For security
      # recommendations, see Amazon Connect Chat security best practices . ConnectionToken is used for
      # invoking this API instead of ParticipantToken . The Amazon Connect Participant Service APIs do not
      # use Signature Version 4 authentication .

      def send_event(
        connection_token : String,
        content_type : String,
        client_token : String? = nil,
        content : String? = nil
      ) : Protocol::Request
        input = Types::SendEventRequest.new(connection_token: connection_token, content_type: content_type, client_token: client_token, content: content)
        send_event(input)
      end

      def send_event(input : Types::SendEventRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_EVENT, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Sends a message. For security recommendations, see Amazon Connect Chat security best practices .
      # ConnectionToken is used for invoking this API instead of ParticipantToken . The Amazon Connect
      # Participant Service APIs do not use Signature Version 4 authentication .

      def send_message(
        connection_token : String,
        content : String,
        content_type : String,
        client_token : String? = nil
      ) : Protocol::Request
        input = Types::SendMessageRequest.new(connection_token: connection_token, content: content, content_type: content_type, client_token: client_token)
        send_message(input)
      end

      def send_message(input : Types::SendMessageRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::SEND_MESSAGE, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end

      # Provides a pre-signed Amazon S3 URL in response for uploading the file directly to S3. For security
      # recommendations, see Amazon Connect Chat security best practices . ConnectionToken is used for
      # invoking this API instead of ParticipantToken . The Amazon Connect Participant Service APIs do not
      # use Signature Version 4 authentication .

      def start_attachment_upload(
        attachment_name : String,
        attachment_size_in_bytes : Int64,
        client_token : String,
        connection_token : String,
        content_type : String
      ) : Protocol::Request
        input = Types::StartAttachmentUploadRequest.new(attachment_name: attachment_name, attachment_size_in_bytes: attachment_size_in_bytes, client_token: client_token, connection_token: connection_token, content_type: content_type)
        start_attachment_upload(input)
      end

      def start_attachment_upload(input : Types::StartAttachmentUploadRequest) : Protocol::Request
        request = Protocol::RestJson.build_request(Model::START_ATTACHMENT_UPLOAD, input, endpoint)
        Protocol::Request.new(request.method, request.uri, request.headers.merge(endpoint_headers), request.body)
      end
    end
  end
end
