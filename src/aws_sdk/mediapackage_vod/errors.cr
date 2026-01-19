module AwsSdk
  module MediaPackageVod
    module Errors
      class ServiceError < Exception
      end

      class ForbiddenException < ServiceError
      end

      class InternalServerErrorException < ServiceError
      end

      class NotFoundException < ServiceError
      end

      class ServiceUnavailableException < ServiceError
      end

      class TooManyRequestsException < ServiceError
      end

      class UnprocessableEntityException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
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
        when "UnprocessableEntityException"
          UnprocessableEntityException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
