module AwsSdk
  module ServerlessApplicationRepository
    module Errors
      class ServiceError < Exception
      end

      # One of the parameters in the request is invalid.
      class BadRequestException < ServiceError
      end

      # The resource already exists.
      class ConflictException < ServiceError
      end

      # The client is not authenticated.
      class ForbiddenException < ServiceError
      end

      # The AWS Serverless Application Repository service encountered an internal error.
      class InternalServerErrorException < ServiceError
      end

      # The resource (for example, an access policy statement) specified in the request doesn't exist.
      class NotFoundException < ServiceError
      end

      # The client is sending more than the allowed number of requests per unit of time.
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
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
