module AwsSdk
  module MediaLive
    module Errors
      class ServiceError < Exception
      end

      class BadGatewayException < ServiceError
      end

      class BadRequestException < ServiceError
      end

      class ConflictException < ServiceError
      end

      class ForbiddenException < ServiceError
      end

      class GatewayTimeoutException < ServiceError
      end

      class InternalServerErrorException < ServiceError
      end

      class NotFoundException < ServiceError
      end

      class TooManyRequestsException < ServiceError
      end

      class UnprocessableEntityException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadGatewayException"
          BadGatewayException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "GatewayTimeoutException"
          GatewayTimeoutException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "UnprocessableEntityException"
          UnprocessableEntityException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
