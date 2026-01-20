module AwsSdk
  module IoTEvents
    module Errors
      class ServiceError < Exception
      end

      # An internal failure occurred.

      class InternalFailureException < ServiceError
      end

      # The request was invalid.

      class InvalidRequestException < ServiceError
      end

      # A limit was exceeded.

      class LimitExceededException < ServiceError
      end

      # The resource already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The resource is in use.

      class ResourceInUseException < ServiceError
      end

      # The resource was not found.

      class ResourceNotFoundException < ServiceError
      end

      # The service is currently unavailable.

      class ServiceUnavailableException < ServiceError
      end

      # The request could not be completed due to throttling.

      class ThrottlingException < ServiceError
      end

      # The requested operation is not supported.

      class UnsupportedOperationException < ServiceError
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
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedOperationException"
          UnsupportedOperationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
