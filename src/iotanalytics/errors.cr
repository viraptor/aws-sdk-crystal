module Aws
  module IoTAnalytics
    module Errors
      class ServiceError < Exception
      end

      # There was an internal failure.

      class InternalFailureException < ServiceError
      end

      # The request was not valid.

      class InvalidRequestException < ServiceError
      end

      # The command caused an internal limit to be exceeded.

      class LimitExceededException < ServiceError
      end

      # A resource with the same name already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # A resource with the specified name could not be found.

      class ResourceNotFoundException < ServiceError
      end

      # The service is temporarily unavailable.

      class ServiceUnavailableException < ServiceError
      end

      # The request was denied due to request throttling.

      class ThrottlingException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
