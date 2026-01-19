module AwsSdk
  module DLM
    module Errors
      class ServiceError < Exception
      end

      # The service failed in an unexpected way.
      class InternalServerException < ServiceError
      end

      # Bad request. The request is missing required parameters or has invalid parameters.
      class InvalidRequestException < ServiceError
      end

      # The request failed because a limit was exceeded.
      class LimitExceededException < ServiceError
      end

      # A requested resource was not found.
      class ResourceNotFoundException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalServerException"
          InternalServerException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
