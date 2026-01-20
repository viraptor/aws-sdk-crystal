module AwsSdk
  module PI
    module Errors
      class ServiceError < Exception
      end

      # The request failed due to an unknown error.

      class InternalServiceError < ServiceError
      end

      # One of the arguments provided is invalid for this request.

      class InvalidArgumentException < ServiceError
      end

      # The user is not authorized to perform this request.

      class NotAuthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServiceError"
          InternalServiceError.new(message)
        when "InvalidArgumentException"
          InvalidArgumentException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
