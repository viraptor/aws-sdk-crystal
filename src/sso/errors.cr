module Aws
  module SSO
    module Errors
      class ServiceError < Exception
      end

      # Indicates that a problem occurred with the input to the request. For example, a required parameter
      # might be missing or out of range.

      class InvalidRequestException < ServiceError
      end

      # The specified resource doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # Indicates that the request is being made too frequently and is more than what the server can handle.

      class TooManyRequestsException < ServiceError
      end

      # Indicates that the request is not authorized. This can happen due to an invalid access token in the
      # request.

      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
