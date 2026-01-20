module AwsSdk
  module KinesisVideoWebRTCStorage
    module Errors
      class ServiceError < Exception
      end

      # You do not have required permissions to perform this operation.

      class AccessDeniedException < ServiceError
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client calls. Try making the call later.

      class ClientLimitExceededException < ServiceError
      end

      # The value for this input parameter is invalid.

      class InvalidArgumentException < ServiceError
      end

      # The specified resource is not found.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ClientLimitExceededException"
          ClientLimitExceededException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
