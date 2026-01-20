module Aws
  module OpenSearch
    module Errors
      class ServiceError < Exception
      end

      # An error occurred because you don't have permissions to access the resource.

      class AccessDeniedException < ServiceError
      end

      # An error occurred while processing the request.

      class BaseException < ServiceError
      end

      # An error occurred because the client attempts to remove a resource that is currently in use.

      class ConflictException < ServiceError
      end

      # An exception for when a failure in one of the dependencies results in the service being unable to
      # fetch details about the resource.

      class DependencyFailureException < ServiceError
      end

      # An error occured because the client wanted to access an unsupported operation.

      class DisabledOperationException < ServiceError
      end

      # Request processing failed because of an unknown error, exception, or internal failure.

      class InternalException < ServiceError
      end

      # Request processing failed because you provided an invalid pagination token.

      class InvalidPaginationTokenException < ServiceError
      end

      # An exception for trying to create or access a sub-resource that's either invalid or not supported.

      class InvalidTypeException < ServiceError
      end

      # An exception for trying to create more than the allowed number of resources or sub-resources.

      class LimitExceededException < ServiceError
      end

      # An exception for creating a resource that already exists.

      class ResourceAlreadyExistsException < ServiceError
      end

      # An exception for accessing or deleting a resource that doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # An exception for attempting to schedule a domain action during an unavailable time slot.

      class SlotNotAvailableException < ServiceError
      end

      # The request was denied due to request throttling. Reduce the frequency of your requests and try
      # again.

      class ThrottlingException < ServiceError
      end

      # An exception for accessing or deleting a resource that doesn't exist.

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
        when "DependencyFailureException"
          DependencyFailureException.new(message)
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
        when "SlotNotAvailableException"
          SlotNotAvailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
