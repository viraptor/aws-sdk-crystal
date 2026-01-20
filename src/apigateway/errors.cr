module Aws
  module APIGateway
    module Errors
      class ServiceError < Exception
      end

      # The submitted request is not valid, for example, the input is incomplete or incorrect. See the
      # accompanying error message for details.

      class BadRequestException < ServiceError
      end

      # The request configuration has conflicts. For details, see the accompanying error message.

      class ConflictException < ServiceError
      end

      # The request exceeded the rate limit. Retry after the specified time period.

      class LimitExceededException < ServiceError
      end

      # The requested resource is not found. Make sure that the request URI is correct.

      class NotFoundException < ServiceError
      end

      # The requested service is not available. For details see the accompanying error message. Retry after
      # the specified time period.

      class ServiceUnavailableException < ServiceError
      end

      # The request has reached its throttling limit. Retry after the specified time period.

      class TooManyRequestsException < ServiceError
      end

      # The request is denied because the caller has insufficient permissions.

      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
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
