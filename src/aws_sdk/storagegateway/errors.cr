module AwsSdk
  module StorageGateway
    module Errors
      class ServiceError < Exception
      end

      # An internal server error has occurred during the request. For more information, see the error and
      # message fields.

      class InternalServerError < ServiceError
      end

      # An exception occurred because an invalid gateway request was issued to the service. For more
      # information, see the error and message fields.

      class InvalidGatewayRequestException < ServiceError
      end

      # An internal server error has occurred because the service is unavailable. For more information, see
      # the error and message fields.

      class ServiceUnavailableError < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidGatewayRequestException"
          InvalidGatewayRequestException.new(message)
        when "ServiceUnavailableError"
          ServiceUnavailableError.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
