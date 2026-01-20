module AwsSdk
  module CloudSearch
    module Errors
      class ServiceError < Exception
      end

      # An error occurred while processing the request.

      class BaseException < ServiceError
      end

      # The request was rejected because it attempted an operation which is not enabled.

      class DisabledOperationException < ServiceError
      end

      # An internal error occurred while processing the request. If this problem persists, report an issue
      # from the Service Health Dashboard .

      class InternalException < ServiceError
      end

      # The request was rejected because it specified an invalid type definition.

      class InvalidTypeException < ServiceError
      end

      # The request was rejected because a resource limit has already been met.

      class LimitExceededException < ServiceError
      end

      # The request was rejected because it attempted to create a resource that already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # The request was rejected because it attempted to reference a resource that does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request was rejected because it has invalid parameters.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BaseException"
          BaseException.new(message)
        when "DisabledOperationException"
          DisabledOperationException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InvalidTypeException"
          InvalidTypeException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ResourceAlreadyExistsException"
          ResourceAlreadyExistsException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
