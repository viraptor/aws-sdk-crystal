module AwsSdk
  module KinesisVideoMedia
    module Errors
      class ServiceError < Exception
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client calls. Try making the call later.

      class ClientLimitExceededException < ServiceError
      end

      # Kinesis Video Streams has throttled the request because you have exceeded the limit of allowed
      # client connections.

      class ConnectionLimitExceededException < ServiceError
      end

      # The value for this input parameter is invalid.

      class InvalidArgumentException < ServiceError
      end

      # Status Code: 400, Caller used wrong endpoint to write data to a stream. On receiving such an
      # exception, the user must call GetDataEndpoint with AccessMode set to "READ" and use the endpoint
      # Kinesis Video returns in the next GetMedia call.

      class InvalidEndpointException < ServiceError
      end

      # Status Code: 403, The caller is not authorized to perform an operation on the given stream, or the
      # token has expired.

      class NotAuthorizedException < ServiceError
      end

      # Status Code: 404, The stream with the given name does not exist.

      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ClientLimitExceededException"
          ClientLimitExceededException.new(message)
        when "ConnectionLimitExceededException"
          ConnectionLimitExceededException.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "InvalidEndpointException"
          InvalidEndpointException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
