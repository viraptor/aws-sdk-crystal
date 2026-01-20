require "json"

module Aws
  module KinesisVideoWebRTCStorage
    module Types

      # You do not have required permissions to perform this operation.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client calls. Try making the call later.

      struct ClientLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The value for this input parameter is invalid.

      struct InvalidArgumentException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct JoinStorageSessionAsViewerInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel.

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # The unique identifier for the sender client.

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        def initialize(
          @channel_arn : String,
          @client_id : String
        )
        end
      end


      struct JoinStorageSessionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the signaling channel.

        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        def initialize(
          @channel_arn : String
        )
        end
      end

      # The specified resource is not found.

      struct ResourceNotFoundException
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
