require "json"

module AwsSdk
  module CloudTrailData
    module Types

      # An event from a source outside of Amazon Web Services that you want CloudTrail to log.
      struct AuditEvent
        include JSON::Serializable

        # The content of an audit event that comes from the event, such as userIdentity , userAgent , and
        # eventSource .
        @[JSON::Field(key: "eventData")]
        getter event_data : String

        # The original event ID from the source event.
        @[JSON::Field(key: "id")]
        getter id : String

        # A checksum is a base64-SHA256 algorithm that helps you verify that CloudTrail receives the event
        # that matches with the checksum. Calculate the checksum by running a command like the following:
        # printf %s $eventdata | openssl dgst -binary -sha256 | base64
        @[JSON::Field(key: "eventDataChecksum")]
        getter event_data_checksum : String?

        def initialize(
          @event_data : String,
          @id : String,
          @event_data_checksum : String? = nil
        )
        end
      end

      # A response that includes successful and failed event results.
      struct AuditEventResultEntry
        include JSON::Serializable

        # The event ID assigned by CloudTrail.
        @[JSON::Field(key: "eventID")]
        getter event_id : String

        # The original event ID from the source event.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @event_id : String,
          @id : String
        )
        end
      end

      # The caller's account ID must be the same as the channel owner's account ID.
      struct ChannelInsufficientPermission
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The channel could not be found.
      struct ChannelNotFound
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The schema type of the event is not supported.
      struct ChannelUnsupportedSchema
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Two or more entries in the request have the same event ID.
      struct DuplicatedAuditEventId
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified channel ARN is not a valid channel ARN.
      struct InvalidChannelARN
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct PutAuditEventsRequest
        include JSON::Serializable

        # The JSON payload of events that you want to ingest. You can also point to the JSON event payload in
        # a file.
        @[JSON::Field(key: "auditEvents")]
        getter audit_events : Array(Types::AuditEvent)

        # The ARN or ID (the ARN suffix) of a channel.
        @[JSON::Field(key: "channelArn")]
        getter channel_arn : String

        # A unique identifier that is conditionally required when the channel's resource policy includes an
        # external ID. This value can be any string, such as a passphrase or account number.
        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @audit_events : Array(Types::AuditEvent),
          @channel_arn : String,
          @external_id : String? = nil
        )
        end
      end

      struct PutAuditEventsResponse
        include JSON::Serializable

        # Lists events in the provided event payload that could not be ingested into CloudTrail, and includes
        # the error code and error message returned for events that could not be ingested.
        @[JSON::Field(key: "failed")]
        getter failed : Array(Types::ResultErrorEntry)

        # Lists events in the provided event payload that were successfully ingested into CloudTrail.
        @[JSON::Field(key: "successful")]
        getter successful : Array(Types::AuditEventResultEntry)

        def initialize(
          @failed : Array(Types::ResultErrorEntry),
          @successful : Array(Types::AuditEventResultEntry)
        )
        end
      end

      # Includes the error code and error message for events that could not be ingested by CloudTrail.
      struct ResultErrorEntry
        include JSON::Serializable

        # The error code for events that could not be ingested by CloudTrail. Possible error codes include:
        # FieldTooLong , FieldNotFound , InvalidChecksum , InvalidData , InvalidRecipient , InvalidEventSource
        # , AccountNotSubscribed , Throttling , and InternalFailure .
        @[JSON::Field(key: "errorCode")]
        getter error_code : String

        # The message that describes the error for events that could not be ingested by CloudTrail.
        @[JSON::Field(key: "errorMessage")]
        getter error_message : String

        # The original event ID from the source event that could not be ingested by CloudTrail.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @error_code : String,
          @error_message : String,
          @id : String
        )
        end
      end

      # The operation requested is not supported in this region or account.
      struct UnsupportedOperationException
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
