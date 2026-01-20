module AwsSdk
  module ApiGatewayManagementApi
    module Errors
      class ServiceError < Exception
      end

      # The caller is not authorized to invoke this operation.

      class ForbiddenException < ServiceError
      end

      # The connection with the provided id no longer exists.

      class GoneException < ServiceError
      end

      # The client is sending more than the allowed number of requests per unit of time or the WebSocket
      # client side buffer is full.

      class LimitExceededException < ServiceError
      end

      # The data has exceeded the maximum size allowed.

      class PayloadTooLargeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "GoneException"
          GoneException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "PayloadTooLargeException"
          PayloadTooLargeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
