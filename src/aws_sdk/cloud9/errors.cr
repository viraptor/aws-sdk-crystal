module AwsSdk
  module Cloud9
    module Errors
      class ServiceError < Exception
      end

      # The target request is invalid.
      class BadRequestException < ServiceError
      end

      # A concurrent access issue occurred.
      class ConcurrentAccessException < ServiceError
      end

      # A conflict occurred.
      class ConflictException < ServiceError
      end

      # An access permissions issue occurred.
      class ForbiddenException < ServiceError
      end

      # An internal server error occurred.
      class InternalServerErrorException < ServiceError
      end

      # A service limit was exceeded.
      class LimitExceededException < ServiceError
      end

      # The target resource cannot be found.
      class NotFoundException < ServiceError
      end

      # Too many service requests were made over the given time period.
      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConcurrentAccessException"
          ConcurrentAccessException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
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
