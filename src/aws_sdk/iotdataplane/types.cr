require "json"

module AwsSdk
  module IoTDataPlane
    module Types

      # The specified version does not match the version of the document.

      struct ConflictException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct DeleteConnectionRequest
        include JSON::Serializable

        # The unique identifier of the MQTT client to disconnect. The client ID can't start with a dollar sign
        # ($).

        @[JSON::Field(key: "clientId")]
        getter client_id : String

        # Specifies whether to remove the client's session state when disconnecting. Set to TRUE to delete all
        # session information, including subscriptions and queued messages. Set to FALSE to preserve the
        # session state. By default, this is set to FALSE (preserves the session state).

        @[JSON::Field(key: "cleanSession")]
        getter clean_session : Bool?

        # Controls if Amazon Web Services IoT Core publishes the client's Last Will and Testament (LWT)
        # message upon disconnection. Set to TRUE to prevent publishing the LWT message. Set to FALSE to allow
        # publishing. By default, this is set to FALSE (allows publishing the LWT message).

        @[JSON::Field(key: "preventWillMessage")]
        getter prevent_will_message : Bool?

        def initialize(
          @client_id : String,
          @clean_session : Bool? = nil,
          @prevent_will_message : Bool? = nil
        )
        end
      end

      # The input for the DeleteThingShadow operation.

      struct DeleteThingShadowRequest
        include JSON::Serializable

        # The name of the thing.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The name of the shadow.

        @[JSON::Field(key: "name")]
        getter shadow_name : String?

        def initialize(
          @thing_name : String,
          @shadow_name : String? = nil
        )
        end
      end

      # The output from the DeleteThingShadow operation.

      struct DeleteThingShadowResponse
        include JSON::Serializable

        # The state information, in JSON format.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        def initialize(
          @payload : Bytes
        )
        end
      end

      # The caller isn't authorized to make the request.

      struct ForbiddenException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input for the GetRetainedMessage operation.

      struct GetRetainedMessageRequest
        include JSON::Serializable

        # The topic name of the retained message to retrieve.

        @[JSON::Field(key: "topic")]
        getter topic : String

        def initialize(
          @topic : String
        )
        end
      end

      # The output from the GetRetainedMessage operation.

      struct GetRetainedMessageResponse
        include JSON::Serializable

        # The Epoch date and time, in milliseconds, when the retained message was stored by IoT.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # The Base64-encoded message payload of the retained message body.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        # The quality of service (QoS) level used to publish the retained message.

        @[JSON::Field(key: "qos")]
        getter qos : Int32?

        # The topic name to which the retained message was published.

        @[JSON::Field(key: "topic")]
        getter topic : String?

        # A base64-encoded JSON string that includes an array of JSON objects, or null if the retained message
        # doesn't include any user properties. The following example userProperties parameter is a JSON string
        # that represents two user properties. Note that it will be base64-encoded: [{"deviceName": "alpha"},
        # {"deviceCnt": "45"}]

        @[JSON::Field(key: "userProperties")]
        getter user_properties : Bytes?

        def initialize(
          @last_modified_time : Int64? = nil,
          @payload : Bytes? = nil,
          @qos : Int32? = nil,
          @topic : String? = nil,
          @user_properties : Bytes? = nil
        )
        end
      end

      # The input for the GetThingShadow operation.

      struct GetThingShadowRequest
        include JSON::Serializable

        # The name of the thing.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The name of the shadow.

        @[JSON::Field(key: "name")]
        getter shadow_name : String?

        def initialize(
          @thing_name : String,
          @shadow_name : String? = nil
        )
        end
      end

      # The output from the GetThingShadow operation.

      struct GetThingShadowResponse
        include JSON::Serializable

        # The state information, in JSON format.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        def initialize(
          @payload : Bytes? = nil
        )
        end
      end

      # An unexpected error has occurred.

      struct InternalFailureException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The request is not valid.

      struct InvalidRequestException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListNamedShadowsForThingRequest
        include JSON::Serializable

        # The name of the thing.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The token to retrieve the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The result page size.

        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        def initialize(
          @thing_name : String,
          @next_token : String? = nil,
          @page_size : Int32? = nil
        )
        end
      end


      struct ListNamedShadowsForThingResponse
        include JSON::Serializable

        # The token to use to get the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of shadows for the specified thing.

        @[JSON::Field(key: "results")]
        getter results : Array(String)?

        # The Epoch date and time the response was generated by IoT.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Int64?

        def initialize(
          @next_token : String? = nil,
          @results : Array(String)? = nil,
          @timestamp : Int64? = nil
        )
        end
      end


      struct ListRetainedMessagesRequest
        include JSON::Serializable

        # The maximum number of results to return at one time.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # To retrieve the next set of results, the nextToken value from a previous response; otherwise null to
        # receive the first set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRetainedMessagesResponse
        include JSON::Serializable

        # The token for the next set of results, or null if there are no additional results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A summary list the account's retained messages. The information returned doesn't include the message
        # payloads of the retained messages.

        @[JSON::Field(key: "retainedTopics")]
        getter retained_topics : Array(Types::RetainedMessageSummary)?

        def initialize(
          @next_token : String? = nil,
          @retained_topics : Array(Types::RetainedMessageSummary)? = nil
        )
        end
      end

      # The specified combination of HTTP verb and URI is not supported.

      struct MethodNotAllowedException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input for the Publish operation.

      struct PublishRequest
        include JSON::Serializable

        # The name of the MQTT topic.

        @[JSON::Field(key: "topic")]
        getter topic : String

        # A UTF-8 encoded string that describes the content of the publishing message.

        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        # The base64-encoded binary data used by the sender of the request message to identify which request
        # the response message is for when it's received. correlationData is an HTTP header value in the API.

        @[JSON::Field(key: "x-amz-mqtt5-correlation-data")]
        getter correlation_data : String?

        # A user-defined integer value that represents the message expiry interval in seconds. If absent, the
        # message doesn't expire. For more information about the limits of messageExpiry , see Amazon Web
        # Services IoT Core message broker and protocol limits and quotas from the Amazon Web Services
        # Reference Guide.

        @[JSON::Field(key: "messageExpiry")]
        getter message_expiry : Int64?

        # The message body. MQTT accepts text, binary, and empty (null) message payloads. Publishing an empty
        # (null) payload with retain = true deletes the retained message identified by topic from Amazon Web
        # Services IoT Core.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        # An Enum string value that indicates whether the payload is formatted as UTF-8.
        # payloadFormatIndicator is an HTTP header value in the API.

        @[JSON::Field(key: "x-amz-mqtt5-payload-format-indicator")]
        getter payload_format_indicator : String?

        # The Quality of Service (QoS) level. The default QoS level is 0.

        @[JSON::Field(key: "qos")]
        getter qos : Int32?

        # A UTF-8 encoded string that's used as the topic name for a response message. The response topic is
        # used to describe the topic which the receiver should publish to as part of the request-response
        # flow. The topic must not contain wildcard characters.

        @[JSON::Field(key: "responseTopic")]
        getter response_topic : String?

        # A Boolean value that determines whether to set the RETAIN flag when the message is published.
        # Setting the RETAIN flag causes the message to be retained and sent to new subscribers to the topic.
        # Valid values: true | false Default value: false

        @[JSON::Field(key: "retain")]
        getter retain : Bool?

        # A JSON string that contains an array of JSON objects. If you don’t use Amazon Web Services SDK or
        # CLI, you must encode the JSON string to base64 format before adding it to the HTTP header.
        # userProperties is an HTTP header value in the API. The following example userProperties parameter is
        # a JSON string which represents two User Properties. Note that it needs to be base64-encoded:
        # [{"deviceName": "alpha"}, {"deviceCnt": "45"}]

        @[JSON::Field(key: "x-amz-mqtt5-user-properties")]
        getter user_properties : String?

        def initialize(
          @topic : String,
          @content_type : String? = nil,
          @correlation_data : String? = nil,
          @message_expiry : Int64? = nil,
          @payload : Bytes? = nil,
          @payload_format_indicator : String? = nil,
          @qos : Int32? = nil,
          @response_topic : String? = nil,
          @retain : Bool? = nil,
          @user_properties : String? = nil
        )
        end
      end

      # The payload exceeds the maximum size allowed.

      struct RequestEntityTooLargeException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about a single retained message.

      struct RetainedMessageSummary
        include JSON::Serializable

        # The Epoch date and time, in milliseconds, when the retained message was stored by IoT.

        @[JSON::Field(key: "lastModifiedTime")]
        getter last_modified_time : Int64?

        # The size of the retained message's payload in bytes.

        @[JSON::Field(key: "payloadSize")]
        getter payload_size : Int64?

        # The quality of service (QoS) level used to publish the retained message.

        @[JSON::Field(key: "qos")]
        getter qos : Int32?

        # The topic name to which the retained message was published.

        @[JSON::Field(key: "topic")]
        getter topic : String?

        def initialize(
          @last_modified_time : Int64? = nil,
          @payload_size : Int64? = nil,
          @qos : Int32? = nil,
          @topic : String? = nil
        )
        end
      end

      # The service is temporarily unavailable.

      struct ServiceUnavailableException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The rate exceeds the limit.

      struct ThrottlingException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # You are not authorized to perform this operation.

      struct UnauthorizedException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The document encoding is not supported.

      struct UnsupportedDocumentEncodingException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The input for the UpdateThingShadow operation.

      struct UpdateThingShadowRequest
        include JSON::Serializable

        # The state information, in JSON format.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes

        # The name of the thing.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # The name of the shadow.

        @[JSON::Field(key: "name")]
        getter shadow_name : String?

        def initialize(
          @payload : Bytes,
          @thing_name : String,
          @shadow_name : String? = nil
        )
        end
      end

      # The output from the UpdateThingShadow operation.

      struct UpdateThingShadowResponse
        include JSON::Serializable

        # The state information, in JSON format.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        def initialize(
          @payload : Bytes? = nil
        )
        end
      end
    end
  end
end
