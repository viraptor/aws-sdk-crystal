module Aws
  module KafkaConnect
    module Errors
      class ServiceError < Exception
      end

      # HTTP Status Code 400: Bad request due to incorrect input. Correct your request and then retry it.

      class BadRequestException < ServiceError
      end

      # HTTP Status Code 409: Conflict. A resource with this name already exists. Retry your request with
      # another name.

      class ConflictException < ServiceError
      end

      # HTTP Status Code 403: Access forbidden. Correct your credentials and then retry your request.

      class ForbiddenException < ServiceError
      end

      # HTTP Status Code 500: Unexpected internal server error. Retrying your request might resolve the
      # issue.

      class InternalServerErrorException < ServiceError
      end

      # HTTP Status Code 404: Resource not found due to incorrect input. Correct your request and then retry
      # it.

      class NotFoundException < ServiceError
      end

      # HTTP Status Code 503: Service Unavailable. Retrying your request in some time might resolve the
      # issue.

      class ServiceUnavailableException < ServiceError
      end

      # HTTP Status Code 429: Limit exceeded. Resource limit reached.

      class TooManyRequestsException < ServiceError
      end

      # HTTP Status Code 401: Unauthorized request. The provided credentials couldn't be validated.

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
