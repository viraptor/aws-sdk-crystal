module AwsSdk
  module KinesisVideoSignaling
    module Errors
      class ServiceError < Exception
      end

      # Your request was throttled because you have exceeded the limit of allowed client calls. Try making
      # the call later.

      class ClientLimitExceededException < ServiceError
      end

      # The value for this input parameter is invalid.

      class InvalidArgumentException < ServiceError
      end

      # The specified client is invalid.

      class InvalidClientException < ServiceError
      end

      # The caller is not authorized to perform this operation.

      class NotAuthorizedException < ServiceError
      end

      # The specified resource is not found.

      class ResourceNotFoundException < ServiceError
      end

      # If the client session is expired. Once the client is connected, the session is valid for 45 minutes.
      # Client should reconnect to the channel to continue sending/receiving messages.

      class SessionExpiredException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ClientLimitExceededException"
          ClientLimitExceededException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidClientException"
          InvalidClientException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "SessionExpiredException"
          SessionExpiredException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
