module AwsSdk
  module CloudTrailData
    module Errors
      class ServiceError < Exception
      end

      # The caller's account ID must be the same as the channel owner's account ID.

      class ChannelInsufficientPermission < ServiceError
      end

      # The channel could not be found.

      class ChannelNotFound < ServiceError
      end

      # The schema type of the event is not supported.

      class ChannelUnsupportedSchema < ServiceError
      end

      # Two or more entries in the request have the same event ID.

      class DuplicatedAuditEventId < ServiceError
      end

      # The specified channel ARN is not a valid channel ARN.

      class InvalidChannelARN < ServiceError
      end

      # The operation requested is not supported in this region or account.

      class UnsupportedOperationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ChannelInsufficientPermission"
          ChannelInsufficientPermission.new(message)
        when "ChannelNotFound"
          ChannelNotFound.new(message)
        when "ChannelUnsupportedSchema"
          ChannelUnsupportedSchema.new(message)
        when "DuplicatedAuditEventId"
          DuplicatedAuditEventId.new(message)
        when "InvalidChannelARN"
          InvalidChannelARN.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
