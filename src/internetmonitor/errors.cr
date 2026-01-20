module Aws
  module InternetMonitor
    module Errors
      class ServiceError < Exception
      end

      # You don't have sufficient permission to perform this action.

      class AccessDeniedException < ServiceError
      end

      # A bad request was received.

      class BadRequestException < ServiceError
      end

      # The requested resource is in use.

      class ConflictException < ServiceError
      end

      # There was an internal server error.

      class InternalServerErrorException < ServiceError
      end

      # An internal error occurred.

      class InternalServerException < ServiceError
      end

      # The request exceeded a service quota.

      class LimitExceededException < ServiceError
      end

      # The request specifies something that doesn't exist.

      class NotFoundException < ServiceError
      end

      # The request specifies a resource that doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      # There were too many requests.

      class TooManyRequestsException < ServiceError
      end

      # Invalid request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerErrorException"
          InternalServerErrorException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
