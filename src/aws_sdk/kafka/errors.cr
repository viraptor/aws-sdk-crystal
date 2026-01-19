module AwsSdk
  module Kafka
    module Errors
      class ServiceError < Exception
      end

      # Returns information about an error.
      class BadRequestException < ServiceError
      end

      # Returns information about an error.
      class ConflictException < ServiceError
      end

      # Returns information about an error.
      class ForbiddenException < ServiceError
      end

      # Returns information about an error.
      class InternalServerErrorException < ServiceError
      end

      # Returns information about an error.
      class NotFoundException < ServiceError
      end

      # Returns information about an error.
      class ServiceUnavailableException < ServiceError
      end

      # Returns information about an error.
      class TooManyRequestsException < ServiceError
      end

      # Returns information about an error.
      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
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
