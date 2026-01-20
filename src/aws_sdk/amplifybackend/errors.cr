module AwsSdk
  module AmplifyBackend
    module Errors
      class ServiceError < Exception
      end

      # An error returned if a request is not formed properly.

      class BadRequestException < ServiceError
      end

      # An error returned if there's a temporary issue with the service.

      class GatewayTimeoutException < ServiceError
      end

      # An error returned when a specific resource type is not found.

      class NotFoundException < ServiceError
      end

      # An error that is returned when a limit of a specific type has been exceeded.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "GatewayTimeoutException"
          GatewayTimeoutException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
