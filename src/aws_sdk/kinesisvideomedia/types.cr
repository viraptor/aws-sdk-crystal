require "json"
require "time"

module AwsSdk
  module KinesisVideoMedia
    module Types

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client calls. Try making the call later.

      struct ClientLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client connections.

      struct ConnectionLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct GetMediaInput
        include JSON::Serializable

        # Identifies the starting chunk to get from the specified stream.

        @[JSON::Field(key: "StartSelector")]
        getter start_selector : Types::StartSelector

        # The ARN of the stream from where you want to get the media content. If you don't specify the
        # streamARN , you must specify the streamName .

        @[JSON::Field(key: "StreamARN")]
        getter stream_arn : String?

        # The Kinesis video stream name from where you want to get the media content. If you don't specify the
        # streamName , you must specify the streamARN .

        @[JSON::Field(key: "StreamName")]
        getter stream_name : String?

        def initialize(
          @start_selector : Types::StartSelector,
          @stream_arn : String? = nil,
          @stream_name : String? = nil
        )
        end
      end


      struct GetMediaOutput
        include JSON::Serializable

        # The content type of the requested media.

        @[JSON::Field(key: "Content-Type")]
        getter content_type : String?

        # The payload Kinesis Video Streams returns is a sequence of chunks from the specified stream. For
        # information about the chunks, see . The chunks that Kinesis Video Streams returns in the GetMedia
        # call also include the following additional Matroska (MKV) tags: AWS_KINESISVIDEO_CONTINUATION_TOKEN
        # (UTF-8 string) - In the event your GetMedia call terminates, you can use this continuation token in
        # your next request to get the next chunk where the last request terminated.
        # AWS_KINESISVIDEO_MILLIS_BEHIND_NOW (UTF-8 string) - Client applications can use this tag value to
        # determine how far behind the chunk returned in the response is from the latest chunk on the stream.
        # AWS_KINESISVIDEO_FRAGMENT_NUMBER - Fragment number returned in the chunk.
        # AWS_KINESISVIDEO_SERVER_TIMESTAMP - Server timestamp of the fragment.
        # AWS_KINESISVIDEO_PRODUCER_TIMESTAMP - Producer timestamp of the fragment. The following tags will be
        # present if an error occurs: AWS_KINESISVIDEO_ERROR_CODE - String description of an error that caused
        # GetMedia to stop. AWS_KINESISVIDEO_ERROR_ID: Integer code of the error. The error codes are as
        # follows: 3002 - Error writing to the stream 4000 - Requested fragment is not found 4500 - Access
        # denied for the stream's KMS key 4501 - Stream's KMS key is disabled 4502 - Validation error on the
        # stream's KMS key 4503 - KMS key specified in the stream is unavailable 4504 - Invalid usage of the
        # KMS key specified in the stream 4505 - Invalid state of the KMS key specified in the stream 4506 -
        # Unable to find the KMS key specified in the stream 5000 - Internal error

        @[JSON::Field(key: "Payload")]
        getter payload : Bytes?

        def initialize(
          @content_type : String? = nil,
          @payload : Bytes? = nil
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

      # Status Code: 400, Caller used wrong endpoint to write data to a stream. On receiving such an
      # exception, the user must call GetDataEndpoint with AccessMode set to "READ" and use the endpoint
      # Kinesis Video returns in the next GetMedia call.

      struct InvalidEndpointException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Status Code: 403, The caller is not authorized to perform an operation on the given stream, or the
      # token has expired.

      struct NotAuthorizedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Status Code: 404, The stream with the given name does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Identifies the chunk on the Kinesis video stream where you want the GetMedia API to start returning
      # media data. You have the following options to identify the starting chunk: Choose the latest (or
      # oldest) chunk. Identify a specific chunk. You can identify a specific chunk either by providing a
      # fragment number or timestamp (server or producer). Each chunk's metadata includes a continuation
      # token as a Matroska (MKV) tag ( AWS_KINESISVIDEO_CONTINUATION_TOKEN ). If your previous GetMedia
      # request terminated, you can use this tag value in your next GetMedia request. The API then starts
      # returning chunks starting where the last API ended.

      struct StartSelector
        include JSON::Serializable

        # Identifies the fragment on the Kinesis video stream where you want to start getting the data from.
        # NOW - Start with the latest chunk on the stream. EARLIEST - Start with earliest available chunk on
        # the stream. FRAGMENT_NUMBER - Start with the chunk after a specific fragment. You must also specify
        # the AfterFragmentNumber parameter. PRODUCER_TIMESTAMP or SERVER_TIMESTAMP - Start with the chunk
        # containing a fragment with the specified producer or server timestamp. You specify the timestamp by
        # adding StartTimestamp . CONTINUATION_TOKEN - Read using the specified continuation token. If you
        # choose the NOW, EARLIEST, or CONTINUATION_TOKEN as the startSelectorType , you don't provide any
        # additional information in the startSelector .

        @[JSON::Field(key: "StartSelectorType")]
        getter start_selector_type : String

        # Specifies the fragment number from where you want the GetMedia API to start returning the fragments.

        @[JSON::Field(key: "AfterFragmentNumber")]
        getter after_fragment_number : String?

        # Continuation token that Kinesis Video Streams returned in the previous GetMedia response. The
        # GetMedia API then starts with the chunk identified by the continuation token.

        @[JSON::Field(key: "ContinuationToken")]
        getter continuation_token : String?

        # A timestamp value. This value is required if you choose the PRODUCER_TIMESTAMP or the
        # SERVER_TIMESTAMP as the startSelectorType . The GetMedia API then starts with the chunk containing
        # the fragment that has the specified timestamp.

        @[JSON::Field(key: "StartTimestamp")]
        getter start_timestamp : Time?

        def initialize(
          @start_selector_type : String,
          @after_fragment_number : String? = nil,
          @continuation_token : String? = nil,
          @start_timestamp : Time? = nil
        )
        end
      end
    end
  end
end
