module Aws
  module Pinpoint
    module Errors
      class ServiceError < Exception
      end

      # Provides information about an API request or response.

      class BadRequestException < ServiceError
      end

      # Provides information about an API request or response.

      class ConflictException < ServiceError
      end

      # Provides information about an API request or response.

      class ForbiddenException < ServiceError
      end

      # Provides information about an API request or response.

      class InternalServerErrorException < ServiceError
      end

      # Provides information about an API request or response.

      class MethodNotAllowedException < ServiceError
      end

      # Provides information about an API request or response.

      class NotFoundException < ServiceError
      end

      # Provides information about an API request or response.

      class PayloadTooLargeException < ServiceError
      end

      # Provides information about an API request or response.

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
        when "MethodNotAllowedException"
          MethodNotAllowedException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "PayloadTooLargeException"
          PayloadTooLargeException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
