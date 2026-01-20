module AwsSdk
  module PinpointSMSVoice
    module Errors
      class ServiceError < Exception
      end

      # The resource specified in your request already exists.

      class AlreadyExistsException < ServiceError
      end

      # The input you provided is invalid.

      class BadRequestException < ServiceError
      end

      # The API encountered an unexpected error and couldn't complete the request. You might be able to
      # successfully issue the request again in the future.

      class InternalServiceErrorException < ServiceError
      end

      # There are too many instances of the specified resource type.

      class LimitExceededException < ServiceError
      end

      # The resource you attempted to access doesn't exist.

      class NotFoundException < ServiceError
      end

      # You've issued too many requests to the resource. Wait a few minutes, and then try again.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlreadyExistsException"
          AlreadyExistsException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "InternalServiceErrorException"
          InternalServiceErrorException.new(message)
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
