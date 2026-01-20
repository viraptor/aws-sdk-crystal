require "json"

module Aws
  module KinesisVideoSignaling
    module Types

      # Your request was throttled because you have exceeded the limit of allowed client calls. Try making
      # the call later.

      struct ClientLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetIceServerConfigRequest
        include JSON::Serializable

        # The ARN of the signaling channel to be used for the peer-to-peer connection between configured
        # peers.

        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String

        # Unique identifier for the viewer. Must be unique within the signaling channel.

        @[JSON::Field(key: "ClientId")]
        getter client_id : String?

        # Specifies the desired service. Currently, TURN is the only valid value.

        @[JSON::Field(key: "Service")]
        getter service : String?

        # An optional user ID to be associated with the credentials.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @channel_arn : String,
          @client_id : String? = nil,
          @service : String? = nil,
          @username : String? = nil
        )
        end
      end


      struct GetIceServerConfigResponse
        include JSON::Serializable

        # The list of ICE server information objects.

        @[JSON::Field(key: "IceServerList")]
        getter ice_server_list : Array(Types::IceServer)?

        def initialize(
          @ice_server_list : Array(Types::IceServer)? = nil
        )
        end
      end

      # A structure for the ICE server connection data.

      struct IceServer
        include JSON::Serializable

        # A password to login to the ICE server.

        @[JSON::Field(key: "Password")]
        getter password : String?

        # The period of time, in seconds, during which the username and password are valid.

        @[JSON::Field(key: "Ttl")]
        getter ttl : Int32?

        # An array of URIs, in the form specified in the I-D.petithuguenin-behave-turn-uris spec. These URIs
        # provide the different addresses and/or protocols that can be used to reach the TURN server.

        @[JSON::Field(key: "Uris")]
        getter uris : Array(String)?

        # A username to login to the ICE server.

        @[JSON::Field(key: "Username")]
        getter username : String?

        def initialize(
          @password : String? = nil,
          @ttl : Int32? = nil,
          @uris : Array(String)? = nil,
          @username : String? = nil
        )
        end
      end

      # The value for this input parameter is invalid.

      struct InvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified client is invalid.

      struct InvalidClientException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The caller is not authorized to perform this operation.

      struct NotAuthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource is not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct SendAlexaOfferToMasterRequest
        include JSON::Serializable

        # The ARN of the signaling channel by which Alexa and the master peer communicate.

        @[JSON::Field(key: "ChannelARN")]
        getter channel_arn : String

        # The base64-encoded SDP offer content.

        @[JSON::Field(key: "MessagePayload")]
        getter message_payload : String

        # The unique identifier for the sender client.

        @[JSON::Field(key: "SenderClientId")]
        getter sender_client_id : String

        def initialize(
          @channel_arn : String,
          @message_payload : String,
          @sender_client_id : String
        )
        end
      end


      struct SendAlexaOfferToMasterResponse
        include JSON::Serializable

        # The base64-encoded SDP answer content.

        @[JSON::Field(key: "Answer")]
        getter answer : String?

        def initialize(
          @answer : String? = nil
        )
        end
      end

      # If the client session is expired. Once the client is connected, the session is valid for 45 minutes.
      # Client should reconnect to the channel to continue sending/receiving messages.

      struct SessionExpiredException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
