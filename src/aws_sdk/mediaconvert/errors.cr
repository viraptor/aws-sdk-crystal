module AwsSdk
  module MediaConvert
    module Errors
      class ServiceError < Exception
      end


      class BadRequestException < ServiceError
      end


      class ConflictException < ServiceError
      end


      class ForbiddenException < ServiceError
      end


      class InternalServerErrorException < ServiceError
      end


      class NotFoundException < ServiceError
      end


      class ServiceQuotaExceededException < ServiceError
      end


      class TooManyRequestsException < ServiceError
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
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
