module AwsSdk
  module ResourceGroups
    module Errors
      class ServiceError < Exception
      end

      # The request includes one or more parameters that violate validation rules.
      class BadRequestException < ServiceError
      end

      # The caller isn't authorized to make the request. Check permissions.
      class ForbiddenException < ServiceError
      end

      # An internal error occurred while processing the request. Try again later.
      class InternalServerErrorException < ServiceError
      end

      # The request uses an HTTP method that isn't allowed for the specified resource.
      class MethodNotAllowedException < ServiceError
      end

      # One or more of the specified resources don't exist.
      class NotFoundException < ServiceError
      end

      # You've exceeded throttling limits by making too many requests in a period of time.
      class TooManyRequestsException < ServiceError
      end

      # The request was rejected because it doesn't have valid credentials for the target resource.
      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ForbiddenException"
          ForbiddenException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "MethodNotAllowedException"
          MethodNotAllowedException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
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
