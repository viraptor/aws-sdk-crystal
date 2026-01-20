module AwsSdk
  module ElasticsearchService
    module Errors
      class ServiceError < Exception
      end

      # An error occurred because user does not have permissions to access the resource. Returns HTTP status
      # code 403.

      class AccessDeniedException < ServiceError
      end

      # An error occurred while processing the request.

      class BaseException < ServiceError
      end

      # An error occurred because the client attempts to remove a resource that is currently in use. Returns
      # HTTP status code 409.

      class ConflictException < ServiceError
      end

      # An error occured because the client wanted to access a not supported operation. Gives http status
      # code of 409.

      class DisabledOperationException < ServiceError
      end

      # The request processing has failed because of an unknown error, exception or failure (the failure is
      # internal to the service) . Gives http status code of 500.

      class InternalException < ServiceError
      end

      # The request processing has failed because of invalid pagination token provided by customer. Returns
      # an HTTP status code of 400.

      class InvalidPaginationTokenException < ServiceError
      end

      # An exception for trying to create or access sub-resource that is either invalid or not supported.
      # Gives http status code of 409.

      class InvalidTypeException < ServiceError
      end

      # An exception for trying to create more than allowed resources or sub-resources. Gives http status
      # code of 409.

      class LimitExceededException < ServiceError
      end

      # An exception for creating a resource that already exists. Gives http status code of 400.

      class ResourceAlreadyExistsException < ServiceError
      end

      # An exception for accessing or deleting a resource that does not exist. Gives http status code of
      # 400.

      class ResourceNotFoundException < ServiceError
      end

      # An exception for missing / invalid input fields. Gives http status code of 400.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BaseException"
          BaseException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DisabledOperationException"
          DisabledOperationException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InvalidPaginationTokenException"
          InvalidPaginationTokenException.new(message)
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
