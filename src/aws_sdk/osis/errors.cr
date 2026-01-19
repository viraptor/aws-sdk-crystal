module AwsSdk
  module OSIS
    module Errors
      class ServiceError < Exception
      end

      # You don't have permissions to access the resource.
      class AccessDeniedException < ServiceError
      end

      # The client attempted to remove a resource that is currently in use.
      class ConflictException < ServiceError
      end

      # Exception is thrown when an operation has been disabled.
      class DisabledOperationException < ServiceError
      end

      # The request failed because of an unknown error, exception, or failure (the failure is internal to
      # the service).
      class InternalException < ServiceError
      end

      # An invalid pagination token provided in the request.
      class InvalidPaginationTokenException < ServiceError
      end

      # You attempted to create more than the allowed number of tags.
      class LimitExceededException < ServiceError
      end

      # You attempted to create a resource that already exists.
      class ResourceAlreadyExistsException < ServiceError
      end

      # You attempted to access or delete a resource that does not exist.
      class ResourceNotFoundException < ServiceError
      end

      # An exception for missing or invalid input fields.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DisabledOperationException"
          DisabledOperationException.new(message)
        when "InternalException"
          InternalException.new(message)
        when "InvalidPaginationTokenException"
          InvalidPaginationTokenException.new(message)
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
