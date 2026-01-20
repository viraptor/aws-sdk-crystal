require "json"
require "time"

module Aws
  module ApiGatewayManagementApi
    module Types


      struct DeleteConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end

      # The caller is not authorized to invoke this operation.

      struct ForbiddenException
        include JSON::Serializable

        def initialize
        end
      end


      struct GetConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String

        def initialize(
          @connection_id : String
        )
        end
      end


      struct GetConnectionResponse
        include JSON::Serializable


        @[JSON::Field(key: "connectedAt")]
        getter connected_at : Time?


        @[JSON::Field(key: "identity")]
        getter identity : Types::Identity?


        @[JSON::Field(key: "lastActiveAt")]
        getter last_active_at : Time?

        def initialize(
          @connected_at : Time? = nil,
          @identity : Types::Identity? = nil,
          @last_active_at : Time? = nil
        )
        end
      end

      # The connection with the provided id no longer exists.

      struct GoneException
        include JSON::Serializable

        def initialize
        end
      end


      struct Identity
        include JSON::Serializable

        # The source IP address of the TCP connection making the request to API Gateway.

        @[JSON::Field(key: "sourceIp")]
        getter source_ip : String

        # The User Agent of the API caller.

        @[JSON::Field(key: "userAgent")]
        getter user_agent : String

        def initialize(
          @source_ip : String,
          @user_agent : String
        )
        end
      end

      # The client is sending more than the allowed number of requests per unit of time or the WebSocket
      # client side buffer is full.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The data has exceeded the maximum size allowed.

      struct PayloadTooLargeException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PostToConnectionRequest
        include JSON::Serializable


        @[JSON::Field(key: "connectionId")]
        getter connection_id : String


        @[JSON::Field(key: "Data")]
        getter data : Bytes

        def initialize(
          @connection_id : String,
          @data : Bytes
        )
        end
      end
    end
  end
end
