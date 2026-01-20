require "json"

module Aws
  module WorkMailMessageFlow
    module Types


      struct GetRawMessageContentRequest
        include JSON::Serializable

        # The identifier of the email message to retrieve.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        def initialize(
          @message_id : String
        )
        end
      end


      struct GetRawMessageContentResponse
        include JSON::Serializable

        # The raw content of the email message, in MIME format.

        @[JSON::Field(key: "messageContent")]
        getter message_content : Bytes

        def initialize(
          @message_content : Bytes
        )
        end
      end

      # WorkMail could not access the updated email content. Possible reasons: You made the request in a
      # region other than your S3 bucket region. The S3 bucket owner is not the same as the calling AWS
      # account. You have an incomplete or missing S3 bucket policy. For more information about policies,
      # see Updating message content with AWS Lambda in the WorkMail Administrator Guide .

      struct InvalidContentLocation
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested email is not eligible for update. This is usually the case for a redirected email.

      struct MessageFrozen
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The requested email could not be updated due to an error in the MIME content. Check the error
      # message for more information about what caused the error.

      struct MessageRejected
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct PutRawMessageContentRequest
        include JSON::Serializable

        # Describes the raw message content of the updated email message.

        @[JSON::Field(key: "content")]
        getter content : Types::RawMessageContent

        # The identifier of the email message being updated.

        @[JSON::Field(key: "messageId")]
        getter message_id : String

        def initialize(
          @content : Types::RawMessageContent,
          @message_id : String
        )
        end
      end


      struct PutRawMessageContentResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Provides the MIME content of the updated email message as an S3 object. All MIME content must meet
      # the following criteria: Each part of a multipart MIME message must be formatted properly.
      # Attachments must be of a content type that Amazon SES supports. For more information, see
      # Unsupported Attachment Types . If any of the MIME parts in a message contain content that is outside
      # of the 7-bit ASCII character range, we recommend encoding that content. Per RFC 5321 , the maximum
      # length of each line of text, including the &lt;CRLF&gt;, must not exceed 1,000 characters. The
      # message must contain all the required header fields. Check the returned error message for more
      # information. The value of immutable headers must remain unchanged. Check the returned error message
      # for more information. Certain unique headers can only appear once. Check the returned error message
      # for more information.

      struct RawMessageContent
        include JSON::Serializable

        # The S3 reference of an email message.

        @[JSON::Field(key: "s3Reference")]
        getter s3_reference : Types::S3Reference

        def initialize(
          @s3_reference : Types::S3Reference
        )
        end
      end

      # The requested email message is not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Amazon S3 object representing the updated message content, in MIME format. The region for the S3
      # bucket containing the S3 object must match the region used for WorkMail operations. Also, for
      # WorkMail to process an S3 object, it must have permission to access that object. For more
      # information, see Updating message content with AWS Lambda .

      struct S3Reference
        include JSON::Serializable

        # The S3 bucket name.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # The S3 key object name.

        @[JSON::Field(key: "key")]
        getter key : String

        # If you enable versioning for the bucket, you can specify the object version.

        @[JSON::Field(key: "objectVersion")]
        getter object_version : String?

        def initialize(
          @bucket : String,
          @key : String,
          @object_version : String? = nil
        )
        end
      end
    end
  end
end
