require "json"
require "time"

module AwsSdk
  module IoTSecureTunneling
    module Types


      struct CloseTunnelRequest
        include JSON::Serializable

        # The ID of the tunnel to close.

        @[JSON::Field(key: "tunnelId")]
        getter tunnel_id : String

        # When set to true, IoT Secure Tunneling deletes the tunnel data immediately.

        @[JSON::Field(key: "delete")]
        getter delete : Bool?

        def initialize(
          @tunnel_id : String,
          @delete : Bool? = nil
        )
        end
      end


      struct CloseTunnelResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The state of a connection.

      struct ConnectionState
        include JSON::Serializable

        # The last time the connection status was updated.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The connection status of the tunnel. Valid values are CONNECTED and DISCONNECTED .

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @last_updated_at : Time? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeTunnelRequest
        include JSON::Serializable

        # The tunnel to describe.

        @[JSON::Field(key: "tunnelId")]
        getter tunnel_id : String

        def initialize(
          @tunnel_id : String
        )
        end
      end


      struct DescribeTunnelResponse
        include JSON::Serializable

        # The tunnel being described.

        @[JSON::Field(key: "tunnel")]
        getter tunnel : Types::Tunnel?

        def initialize(
          @tunnel : Types::Tunnel? = nil
        )
        end
      end

      # The destination configuration.

      struct DestinationConfig
        include JSON::Serializable

        # A list of service names that identify the target application. The IoT client running on the
        # destination device reads this value and uses it to look up a port or an IP address and a port. The
        # IoT client instantiates the local proxy, which uses this information to connect to the destination
        # application.

        @[JSON::Field(key: "services")]
        getter services : Array(String)

        # The name of the IoT thing to which you want to connect.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @services : Array(String),
          @thing_name : String? = nil
        )
        end
      end

      # Thrown when a tunnel limit is exceeded.

      struct LimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the specified resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListTunnelsRequest
        include JSON::Serializable

        # The maximum number of results to return at once.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the IoT thing associated with the destination device.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @thing_name : String? = nil
        )
        end
      end


      struct ListTunnelsResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A short description of the tunnels in an Amazon Web Services account.

        @[JSON::Field(key: "tunnelSummaries")]
        getter tunnel_summaries : Array(Types::TunnelSummary)?

        def initialize(
          @next_token : String? = nil,
          @tunnel_summaries : Array(Types::TunnelSummary)? = nil
        )
        end
      end


      struct OpenTunnelRequest
        include JSON::Serializable

        # A short text description of the tunnel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The destination configuration for the OpenTunnel request.

        @[JSON::Field(key: "destinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # A collection of tag metadata.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Timeout configuration for a tunnel.

        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        def initialize(
          @description : String? = nil,
          @destination_config : Types::DestinationConfig? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_config : Types::TimeoutConfig? = nil
        )
        end
      end


      struct OpenTunnelResponse
        include JSON::Serializable

        # The access token the destination local proxy uses to connect to IoT Secure Tunneling.

        @[JSON::Field(key: "destinationAccessToken")]
        getter destination_access_token : String?

        # The access token the source local proxy uses to connect to IoT Secure Tunneling.

        @[JSON::Field(key: "sourceAccessToken")]
        getter source_access_token : String?

        # The Amazon Resource Name for the tunnel.

        @[JSON::Field(key: "tunnelArn")]
        getter tunnel_arn : String?

        # A unique alpha-numeric tunnel ID.

        @[JSON::Field(key: "tunnelId")]
        getter tunnel_id : String?

        def initialize(
          @destination_access_token : String? = nil,
          @source_access_token : String? = nil,
          @tunnel_arn : String? = nil,
          @tunnel_id : String? = nil
        )
        end
      end

      # Thrown when an operation is attempted on a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct RotateTunnelAccessTokenRequest
        include JSON::Serializable

        # The mode of the client that will use the client token, which can be either the source or
        # destination, or both source and destination.

        @[JSON::Field(key: "clientMode")]
        getter client_mode : String

        # The tunnel for which you want to rotate the access tokens.

        @[JSON::Field(key: "tunnelId")]
        getter tunnel_id : String


        @[JSON::Field(key: "destinationConfig")]
        getter destination_config : Types::DestinationConfig?

        def initialize(
          @client_mode : String,
          @tunnel_id : String,
          @destination_config : Types::DestinationConfig? = nil
        )
        end
      end


      struct RotateTunnelAccessTokenResponse
        include JSON::Serializable

        # The client access token that the destination local proxy uses to connect to IoT Secure Tunneling.

        @[JSON::Field(key: "destinationAccessToken")]
        getter destination_access_token : String?

        # The client access token that the source local proxy uses to connect to IoT Secure Tunneling.

        @[JSON::Field(key: "sourceAccessToken")]
        getter source_access_token : String?

        # The Amazon Resource Name for the tunnel.

        @[JSON::Field(key: "tunnelArn")]
        getter tunnel_arn : String?

        def initialize(
          @destination_access_token : String? = nil,
          @source_access_token : String? = nil,
          @tunnel_arn : String? = nil
        )
        end
      end

      # An arbitary key/value pair used to add searchable metadata to secure tunnel resources.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "key")]
        getter key : String

        # The value of the tag.

        @[JSON::Field(key: "value")]
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

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
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

      # Tunnel timeout configuration.

      struct TimeoutConfig
        include JSON::Serializable

        # The maximum amount of time (in minutes) a tunnel can remain open. If not specified,
        # maxLifetimeTimeoutMinutes defaults to 720 minutes. Valid values are from 1 minute to 12 hours (720
        # minutes)

        @[JSON::Field(key: "maxLifetimeTimeoutMinutes")]
        getter max_lifetime_timeout_minutes : Int32?

        def initialize(
          @max_lifetime_timeout_minutes : Int32? = nil
        )
        end
      end

      # A connection between a source computer and a destination device.

      struct Tunnel
        include JSON::Serializable

        # The time when the tunnel was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A description of the tunnel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The destination configuration that specifies the thing name of the destination device and a service
        # name that the local proxy uses to connect to the destination application.

        @[JSON::Field(key: "destinationConfig")]
        getter destination_config : Types::DestinationConfig?

        # The connection state of the destination application.

        @[JSON::Field(key: "destinationConnectionState")]
        getter destination_connection_state : Types::ConnectionState?

        # The last time the tunnel was updated.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The connection state of the source application.

        @[JSON::Field(key: "sourceConnectionState")]
        getter source_connection_state : Types::ConnectionState?

        # The status of a tunnel. Valid values are: Open and Closed.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A list of tag metadata associated with the secure tunnel.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Timeout configuration for the tunnel.

        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::TimeoutConfig?

        # The Amazon Resource Name (ARN) of a tunnel.

        @[JSON::Field(key: "tunnelArn")]
        getter tunnel_arn : String?

        # A unique alpha-numeric ID that identifies a tunnel.

        @[JSON::Field(key: "tunnelId")]
        getter tunnel_id : String?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @destination_config : Types::DestinationConfig? = nil,
          @destination_connection_state : Types::ConnectionState? = nil,
          @last_updated_at : Time? = nil,
          @source_connection_state : Types::ConnectionState? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @timeout_config : Types::TimeoutConfig? = nil,
          @tunnel_arn : String? = nil,
          @tunnel_id : String? = nil
        )
        end
      end

      # Information about the tunnel.

      struct TunnelSummary
        include JSON::Serializable

        # The time the tunnel was created.

        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A description of the tunnel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The time the tunnel was last updated.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The status of a tunnel. Valid values are: Open and Closed.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Resource Name of the tunnel.

        @[JSON::Field(key: "tunnelArn")]
        getter tunnel_arn : String?

        # The unique alpha-numeric identifier for the tunnel.

        @[JSON::Field(key: "tunnelId")]
        getter tunnel_id : String?

        def initialize(
          @created_at : Time? = nil,
          @description : String? = nil,
          @last_updated_at : Time? = nil,
          @status : String? = nil,
          @tunnel_arn : String? = nil,
          @tunnel_id : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The resource ARN.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove.

        @[JSON::Field(key: "tagKeys")]
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
    end
  end
end
