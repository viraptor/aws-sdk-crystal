require "json"
require "time"

module AwsSdk
  module Ivschat
    module Types


      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies a CloudWatch Logs location where chat logs will be stored.

      struct CloudWatchLogsDestinationConfiguration
        include JSON::Serializable

        # Name of the Amazon Cloudwatch Logs destination where chat activity will be logged.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        def initialize(
          @log_group_name : String
        )
        end
      end


      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct CreateChatTokenRequest
        include JSON::Serializable

        # Identifier of the room that the client is trying to access. Currently this must be an ARN.

        @[JSON::Field(key: "roomIdentifier")]
        getter room_identifier : String

        # Application-provided ID that uniquely identifies the user associated with this token. This can be
        # any UTF-8 encoded text.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # Application-provided attributes to encode into the token and attach to a chat session. Map keys and
        # values can contain UTF-8 encoded text. The maximum length of this field is 1 KB total.

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        # Set of capabilities that the user is allowed to perform in the room. Default: None (the capability
        # to view messages is implicitly included in all requests).

        @[JSON::Field(key: "capabilities")]
        getter capabilities : Array(String)?

        # Session duration (in minutes), after which the session expires. Default: 60 (1 hour).

        @[JSON::Field(key: "sessionDurationInMinutes")]
        getter session_duration_in_minutes : Int32?

        def initialize(
          @room_identifier : String,
          @user_id : String,
          @attributes : Hash(String, String)? = nil,
          @capabilities : Array(String)? = nil,
          @session_duration_in_minutes : Int32? = nil
        )
        end
      end


      struct CreateChatTokenResponse
        include JSON::Serializable

        # Time after which an end user's session is no longer valid. This is an ISO 8601 timestamp; note that
        # this is returned as a string .

        @[JSON::Field(key: "sessionExpirationTime")]
        getter session_expiration_time : Time?

        # The issued client token, encrypted.

        @[JSON::Field(key: "token")]
        getter token : String?

        # Time after which the token is no longer valid and cannot be used to connect to a room. This is an
        # ISO 8601 timestamp; note that this is returned as a string .

        @[JSON::Field(key: "tokenExpirationTime")]
        getter token_expiration_time : Time?

        def initialize(
          @session_expiration_time : Time? = nil,
          @token : String? = nil,
          @token_expiration_time : Time? = nil
        )
        end
      end


      struct CreateLoggingConfigurationRequest
        include JSON::Serializable

        # A complex type that contains a destination configuration for where chat content will be logged.
        # There can be only one type of destination ( cloudWatchLogs , firehose , or s3 ) in a
        # destinationConfiguration .

        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration

        # Logging-configuration name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags to attach to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS Chat
        # has no constraints on tags beyond what is documented there.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @destination_configuration : Types::DestinationConfiguration,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLoggingConfigurationResponse
        include JSON::Serializable

        # Logging-configuration ARN, assigned by the system.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the logging configuration was created. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # A complex type that contains a destination configuration for where chat content will be logged, from
        # the request. There is only one type of destination ( cloudWatchLogs , firehose , or s3 ) in a
        # destinationConfiguration .

        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration?

        # Logging-configuration ID, generated by the system. This is a relative identifier, the part of the
        # ARN that uniquely identifies the logging configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Logging-configuration name, from the request (if specified).

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the logging configuration. When the state is ACTIVE , the configuration is ready to log
        # chat content.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Tags attached to the resource, from the request (if specified). Array of maps, each of the form
        # string:string (key:value) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the logging configuration’s last update. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @destination_configuration : Types::DestinationConfiguration? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end


      struct CreateRoomRequest
        include JSON::Serializable

        # Array of logging-configuration identifiers attached to the room.

        @[JSON::Field(key: "loggingConfigurationIdentifiers")]
        getter logging_configuration_identifiers : Array(String)?

        # Maximum number of characters in a single message. Messages are expected to be UTF-8 encoded and this
        # limit applies specifically to rune/code-point count, not number of bytes. Default: 500.

        @[JSON::Field(key: "maximumMessageLength")]
        getter maximum_message_length : Int32?

        # Maximum number of messages per second that can be sent to the room (by all clients). Default: 10.

        @[JSON::Field(key: "maximumMessageRatePerSecond")]
        getter maximum_message_rate_per_second : Int32?

        # Configuration information for optional review of messages.

        @[JSON::Field(key: "messageReviewHandler")]
        getter message_review_handler : Types::MessageReviewHandler?

        # Room name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags to attach to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS Chat
        # has no constraints beyond what is documented there.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @logging_configuration_identifiers : Array(String)? = nil,
          @maximum_message_length : Int32? = nil,
          @maximum_message_rate_per_second : Int32? = nil,
          @message_review_handler : Types::MessageReviewHandler? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateRoomResponse
        include JSON::Serializable

        # Room ARN, assigned by the system.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the room was created. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # Room ID, generated by the system. This is a relative identifier, the part of the ARN that uniquely
        # identifies the room.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Array of logging configurations attached to the room, from the request (if specified).

        @[JSON::Field(key: "loggingConfigurationIdentifiers")]
        getter logging_configuration_identifiers : Array(String)?

        # Maximum number of characters in a single message, from the request (if specified).

        @[JSON::Field(key: "maximumMessageLength")]
        getter maximum_message_length : Int32?

        # Maximum number of messages per second that can be sent to the room (by all clients), from the
        # request (if specified).

        @[JSON::Field(key: "maximumMessageRatePerSecond")]
        getter maximum_message_rate_per_second : Int32?

        # Configuration information for optional review of messages.

        @[JSON::Field(key: "messageReviewHandler")]
        getter message_review_handler : Types::MessageReviewHandler?

        # Room name, from the request (if specified).

        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource, from the request (if specified).

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the room’s last update. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @id : String? = nil,
          @logging_configuration_identifiers : Array(String)? = nil,
          @maximum_message_length : Int32? = nil,
          @maximum_message_rate_per_second : Int32? = nil,
          @message_review_handler : Types::MessageReviewHandler? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end


      struct DeleteLoggingConfigurationRequest
        include JSON::Serializable

        # Identifier of the logging configuration to be deleted.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct DeleteMessageRequest
        include JSON::Serializable

        # ID of the message to be deleted. This is the Id field in the received message (see Message
        # (Subscribe) in the Chat Messaging API).

        @[JSON::Field(key: "id")]
        getter id : String

        # Identifier of the room where the message should be deleted. Currently this must be an ARN.

        @[JSON::Field(key: "roomIdentifier")]
        getter room_identifier : String

        # Reason for deleting the message.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @id : String,
          @room_identifier : String,
          @reason : String? = nil
        )
        end
      end


      struct DeleteMessageResponse
        include JSON::Serializable

        # Operation identifier, generated by Amazon IVS Chat.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct DeleteRoomRequest
        include JSON::Serializable

        # Identifier of the room to be deleted. Currently this must be an ARN.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end

      # A complex type that describes a location where chat logs will be stored. Each member represents the
      # configuration of one log destination. For logging, you define only one type of destination (for
      # CloudWatch Logs, Kinesis Firehose, or S3).

      struct DestinationConfiguration
        include JSON::Serializable

        # An Amazon CloudWatch Logs destination configuration where chat activity will be logged.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsDestinationConfiguration?

        # An Amazon Kinesis Data Firehose destination configuration where chat activity will be logged.

        @[JSON::Field(key: "firehose")]
        getter firehose : Types::FirehoseDestinationConfiguration?

        # An Amazon S3 destination configuration where chat activity will be logged.

        @[JSON::Field(key: "s3")]
        getter s3 : Types::S3DestinationConfiguration?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsDestinationConfiguration? = nil,
          @firehose : Types::FirehoseDestinationConfiguration? = nil,
          @s3 : Types::S3DestinationConfiguration? = nil
        )
        end
      end


      struct DisconnectUserRequest
        include JSON::Serializable

        # Identifier of the room from which the user's clients should be disconnected. Currently this must be
        # an ARN.

        @[JSON::Field(key: "roomIdentifier")]
        getter room_identifier : String

        # ID of the user (connection) to disconnect from the room.

        @[JSON::Field(key: "userId")]
        getter user_id : String

        # Reason for disconnecting the user.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @room_identifier : String,
          @user_id : String,
          @reason : String? = nil
        )
        end
      end


      struct DisconnectUserResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies a Kinesis Firehose location where chat logs will be stored.

      struct FirehoseDestinationConfiguration
        include JSON::Serializable

        # Name of the Amazon Kinesis Firehose delivery stream where chat activity will be logged.

        @[JSON::Field(key: "deliveryStreamName")]
        getter delivery_stream_name : String

        def initialize(
          @delivery_stream_name : String
        )
        end
      end


      struct GetLoggingConfigurationRequest
        include JSON::Serializable

        # Identifier of the logging configuration to be retrieved.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetLoggingConfigurationResponse
        include JSON::Serializable

        # Logging-configuration ARN, from the request (if identifier was an ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the logging configuration was created. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # A complex type that contains a destination configuration for where chat content will be logged.
        # There is only one type of destination ( cloudWatchLogs , firehose , or s3 ) in a
        # destinationConfiguration .

        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration?

        # Logging-configuration ID, generated by the system. This is a relative identifier, the part of the
        # ARN that uniquely identifies the logging configuration.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Logging-configuration name. This value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the logging configuration. When the state is ACTIVE , the configuration is ready to log
        # chat content.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the logging configuration’s last update. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @destination_configuration : Types::DestinationConfiguration? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end


      struct GetRoomRequest
        include JSON::Serializable

        # Identifier of the room for which the configuration is to be retrieved. Currently this must be an
        # ARN.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        def initialize(
          @identifier : String
        )
        end
      end


      struct GetRoomResponse
        include JSON::Serializable

        # Room ARN, from the request (if identifier was an ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the room was created. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # Room ID, generated by the system. This is a relative identifier, the part of the ARN that uniquely
        # identifies the room.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Array of logging configurations attached to the room.

        @[JSON::Field(key: "loggingConfigurationIdentifiers")]
        getter logging_configuration_identifiers : Array(String)?

        # Maximum number of characters in a single message. Messages are expected to be UTF-8 encoded and this
        # limit applies specifically to rune/code-point count, not number of bytes. Default: 500.

        @[JSON::Field(key: "maximumMessageLength")]
        getter maximum_message_length : Int32?

        # Maximum number of messages per second that can be sent to the room (by all clients). Default: 10.

        @[JSON::Field(key: "maximumMessageRatePerSecond")]
        getter maximum_message_rate_per_second : Int32?

        # Configuration information for optional review of messages.

        @[JSON::Field(key: "messageReviewHandler")]
        getter message_review_handler : Types::MessageReviewHandler?

        # Room name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the room’s last update. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @id : String? = nil,
          @logging_configuration_identifiers : Array(String)? = nil,
          @maximum_message_length : Int32? = nil,
          @maximum_message_rate_per_second : Int32? = nil,
          @message_review_handler : Types::MessageReviewHandler? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end


      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListLoggingConfigurationsRequest
        include JSON::Serializable

        # Maximum number of logging configurations to return. Default: 50.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The first logging configurations to retrieve. This is used for pagination; see the nextToken
        # response field.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLoggingConfigurationsResponse
        include JSON::Serializable

        # List of the matching logging configurations (summary information only). There is only one type of
        # destination ( cloudWatchLogs , firehose , or s3 ) in a destinationConfiguration .

        @[JSON::Field(key: "loggingConfigurations")]
        getter logging_configurations : Array(Types::LoggingConfigurationSummary)

        # If there are more logging configurations than maxResults , use nextToken in the request to get the
        # next set.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @logging_configurations : Array(Types::LoggingConfigurationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListRoomsRequest
        include JSON::Serializable

        # Logging-configuration identifier.

        @[JSON::Field(key: "loggingConfigurationIdentifier")]
        getter logging_configuration_identifier : String?

        # Maximum number of rooms to return. Default: 50.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filters the list to match the specified message review handler URI.

        @[JSON::Field(key: "messageReviewHandlerUri")]
        getter message_review_handler_uri : String?

        # Filters the list to match the specified room name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The first room to retrieve. This is used for pagination; see the nextToken response field.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @logging_configuration_identifier : String? = nil,
          @max_results : Int32? = nil,
          @message_review_handler_uri : String? = nil,
          @name : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRoomsResponse
        include JSON::Serializable

        # List of the matching rooms (summary information only).

        @[JSON::Field(key: "rooms")]
        getter rooms : Array(Types::RoomSummary)

        # If there are more rooms than maxResults , use nextToken in the request to get the next set.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @rooms : Array(Types::RoomSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be retrieved. The ARN must be URL-encoded.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # Summary information about a logging configuration.

      struct LoggingConfigurationSummary
        include JSON::Serializable

        # Logging-configuration ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the logging configuration was created. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # A complex type that contains a destination configuration for where chat content will be logged.

        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration?

        # Logging-configuration ID, generated by the system. This is a relative identifier, the part of the
        # ARN that uniquely identifies the room.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Logging-configuration name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the logging configuration. When this is ACTIVE , the configuration is ready for logging
        # chat content.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Tags to attach to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS Chat
        # has no constraints on tags beyond what is documented there.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the logging configuration’s last update. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @destination_configuration : Types::DestinationConfiguration? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # Configuration information for optional message review.

      struct MessageReviewHandler
        include JSON::Serializable

        # Specifies the fallback behavior (whether the message is allowed or denied) if the handler does not
        # return a valid response, encounters an error, or times out. (For the timeout period, see Service
        # Quotas .) If allowed, the message is delivered with returned content to all users connected to the
        # room. If denied, the message is not delivered to any user. Default: ALLOW .

        @[JSON::Field(key: "fallbackResult")]
        getter fallback_result : String?

        # Identifier of the message review handler. Currently this must be an ARN of a lambda function.

        @[JSON::Field(key: "uri")]
        getter uri : String?

        def initialize(
          @fallback_result : String? = nil,
          @uri : String? = nil
        )
        end
      end


      struct PendingVerification
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Summary information about a room.

      struct RoomSummary
        include JSON::Serializable

        # Room ARN.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the room was created. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # Room ID, generated by the system. This is a relative identifier, the part of the ARN that uniquely
        # identifies the room.

        @[JSON::Field(key: "id")]
        getter id : String?

        # List of logging-configuration identifiers attached to the room.

        @[JSON::Field(key: "loggingConfigurationIdentifiers")]
        getter logging_configuration_identifiers : Array(String)?

        # Configuration information for optional review of messages.

        @[JSON::Field(key: "messageReviewHandler")]
        getter message_review_handler : Types::MessageReviewHandler?

        # Room name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS Chat
        # has no constraints beyond what is documented there.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the room’s last update. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @id : String? = nil,
          @logging_configuration_identifiers : Array(String)? = nil,
          @message_review_handler : Types::MessageReviewHandler? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end

      # Specifies an S3 location where chat logs will be stored.

      struct S3DestinationConfiguration
        include JSON::Serializable

        # Name of the Amazon S3 bucket where chat activity will be logged.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        def initialize(
          @bucket_name : String
        )
        end
      end


      struct SendEventRequest
        include JSON::Serializable

        # Application-defined name of the event to send to clients.

        @[JSON::Field(key: "eventName")]
        getter event_name : String

        # Identifier of the room to which the event will be sent. Currently this must be an ARN.

        @[JSON::Field(key: "roomIdentifier")]
        getter room_identifier : String

        # Application-defined metadata to attach to the event sent to clients. The maximum length of the
        # metadata is 1 KB total.

        @[JSON::Field(key: "attributes")]
        getter attributes : Hash(String, String)?

        def initialize(
          @event_name : String,
          @room_identifier : String,
          @attributes : Hash(String, String)? = nil
        )
        end
      end


      struct SendEventResponse
        include JSON::Serializable

        # An identifier generated by Amazon IVS Chat. This identifier must be used in subsequent operations
        # for this message, such as DeleteMessage.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end


      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "limit")]
        getter limit : Int32


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @limit : Int32,
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be tagged. The ARN must be URL-encoded.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be added or updated. Array of maps, each of the form string:string (key:value) .
        # See Best practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for
        # details, including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon
        # IVS Chat has no constraints beyond what is documented there.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "limit")]
        getter limit : Int32


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "resourceId")]
        getter resource_id : String


        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @limit : Int32,
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to be untagged. The ARN must be URL-encoded.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Array of tags to be removed. Array of maps, each of the form string:string (key:value) . See Best
        # practices and strategies in Tagging Amazon Web Services Resources and Tag Editor for details,
        # including restrictions that apply to tags and "Tag naming limits and requirements"; Amazon IVS Chat
        # has no constraints beyond what is documented there.

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


      struct UpdateLoggingConfigurationRequest
        include JSON::Serializable

        # Identifier of the logging configuration to be updated.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # A complex type that contains a destination configuration for where chat content will be logged.
        # There can be only one type of destination ( cloudWatchLogs , firehose , or s3 ) in a
        # destinationConfiguration .

        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration?

        # Logging-configuration name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @destination_configuration : Types::DestinationConfiguration? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateLoggingConfigurationResponse
        include JSON::Serializable

        # Logging-configuration ARN, from the request (if identifier was an ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the logging configuration was created. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # A complex type that contains a destination configuration for where chat content will be logged, from
        # the request. There is only one type of destination ( cloudWatchLogs , firehose , or s3 ) in a
        # destinationConfiguration .

        @[JSON::Field(key: "destinationConfiguration")]
        getter destination_configuration : Types::DestinationConfiguration?

        # Logging-configuration ID, generated by the system. This is a relative identifier, the part of the
        # ARN that uniquely identifies the room.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Logging-configuration name, from the request (if specified).

        @[JSON::Field(key: "name")]
        getter name : String?

        # The state of the logging configuration. When the state is ACTIVE , the configuration is ready to log
        # chat content.

        @[JSON::Field(key: "state")]
        getter state : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the logging configuration’s last update. This is an ISO 8601 timestamp; note that this is
        # returned as a string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @destination_configuration : Types::DestinationConfiguration? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end


      struct UpdateRoomRequest
        include JSON::Serializable

        # Identifier of the room to be updated. Currently this must be an ARN.

        @[JSON::Field(key: "identifier")]
        getter identifier : String

        # Array of logging-configuration identifiers attached to the room.

        @[JSON::Field(key: "loggingConfigurationIdentifiers")]
        getter logging_configuration_identifiers : Array(String)?

        # The maximum number of characters in a single message. Messages are expected to be UTF-8 encoded and
        # this limit applies specifically to rune/code-point count, not number of bytes. Default: 500.

        @[JSON::Field(key: "maximumMessageLength")]
        getter maximum_message_length : Int32?

        # Maximum number of messages per second that can be sent to the room (by all clients). Default: 10.

        @[JSON::Field(key: "maximumMessageRatePerSecond")]
        getter maximum_message_rate_per_second : Int32?

        # Configuration information for optional review of messages. Specify an empty uri string to
        # disassociate a message review handler from the specified room.

        @[JSON::Field(key: "messageReviewHandler")]
        getter message_review_handler : Types::MessageReviewHandler?

        # Room name. The value does not need to be unique.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @identifier : String,
          @logging_configuration_identifiers : Array(String)? = nil,
          @maximum_message_length : Int32? = nil,
          @maximum_message_rate_per_second : Int32? = nil,
          @message_review_handler : Types::MessageReviewHandler? = nil,
          @name : String? = nil
        )
        end
      end


      struct UpdateRoomResponse
        include JSON::Serializable

        # Room ARN, from the request (if identifier was an ARN).

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Time when the room was created. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "createTime")]
        getter create_time : Time?

        # Room ID, generated by the system. This is a relative identifier, the part of the ARN that uniquely
        # identifies the room.

        @[JSON::Field(key: "id")]
        getter id : String?

        # Array of logging configurations attached to the room, from the request (if specified).

        @[JSON::Field(key: "loggingConfigurationIdentifiers")]
        getter logging_configuration_identifiers : Array(String)?

        # Maximum number of characters in a single message, from the request (if specified).

        @[JSON::Field(key: "maximumMessageLength")]
        getter maximum_message_length : Int32?

        # Maximum number of messages per second that can be sent to the room (by all clients), from the
        # request (if specified).

        @[JSON::Field(key: "maximumMessageRatePerSecond")]
        getter maximum_message_rate_per_second : Int32?

        # Configuration information for optional review of messages.

        @[JSON::Field(key: "messageReviewHandler")]
        getter message_review_handler : Types::MessageReviewHandler?

        # Room name, from the request (if specified).

        @[JSON::Field(key: "name")]
        getter name : String?

        # Tags attached to the resource. Array of maps, each of the form string:string (key:value) .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Time of the room’s last update. This is an ISO 8601 timestamp; note that this is returned as a
        # string .

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time?

        def initialize(
          @arn : String? = nil,
          @create_time : Time? = nil,
          @id : String? = nil,
          @logging_configuration_identifiers : Array(String)? = nil,
          @maximum_message_length : Int32? = nil,
          @maximum_message_rate_per_second : Int32? = nil,
          @message_review_handler : Types::MessageReviewHandler? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil,
          @update_time : Time? = nil
        )
        end
      end


      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String


        @[JSON::Field(key: "reason")]
        getter reason : String


        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # This object is used in the ValidationException error.

      struct ValidationExceptionField
        include JSON::Serializable

        # Explanation of the reason for the validation error.

        @[JSON::Field(key: "message")]
        getter message : String

        # Name of the field which failed validation.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
