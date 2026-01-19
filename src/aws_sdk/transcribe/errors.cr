module AwsSdk
  module Transcribe
    module Errors
      class ServiceError < Exception
      end

      # Your request didn't pass one or more validation tests. This can occur when the entity you're trying
      # to delete doesn't exist or if it's in a non-terminal state (such as IN PROGRESS ). See the exception
      # message field for more information.
      class BadRequestException < ServiceError
      end

      # A resource already exists with this name. Resource names must be unique within an Amazon Web
      # Services account.
      class ConflictException < ServiceError
      end

      # There was an internal error. Check the error message, correct the issue, and try your request again.
      class InternalFailureException < ServiceError
      end

      # You've either sent too many requests or your input file is too long. Wait before retrying your
      # request, or use a smaller file and try your request again.
      class LimitExceededException < ServiceError
      end

      # We can't find the requested resource. Check that the specified name is correct and try your request
      # again.
      class NotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
