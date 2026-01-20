module AwsSdk
  module Schemas
    module Errors
      class ServiceError < Exception
      end


      class BadRequestException < ServiceError
      end


      class ConflictException < ServiceError
      end


      class ForbiddenException < ServiceError
      end


      class GoneException < ServiceError
      end


      class InternalServerErrorException < ServiceError
      end


      class NotFoundException < ServiceError
      end


      class PreconditionFailedException < ServiceError
      end


      class ServiceUnavailableException < ServiceError
      end


      class TooManyRequestsException < ServiceError
      end


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
        when "GoneException"
          GoneException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "PreconditionFailedException"
          PreconditionFailedException.new(message)
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
