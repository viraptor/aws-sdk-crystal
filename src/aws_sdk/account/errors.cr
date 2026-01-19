module AwsSdk
  module Account
    module Errors
      class ServiceError < Exception
      end

      # The operation failed because the calling identity doesn't have the minimum required permissions.
      class AccessDeniedException < ServiceError
      end

      # The request could not be processed because of a conflict in the current status of the resource. For
      # example, this happens if you try to enable a Region that is currently being disabled (in a status of
      # DISABLING) or if you try to change an account’s root user email to an email address which is already
      # in use.
      class ConflictException < ServiceError
      end

      # The operation failed because of an error internal to Amazon Web Services. Try your operation again
      # later.
      class InternalServerException < ServiceError
      end

      # The operation failed because it specified a resource that can't be found.
      class ResourceNotFoundException < ServiceError
      end

      # The operation failed because it specified a resource that is not currently available.
      class ResourceUnavailableException < ServiceError
      end

      # The operation failed because it was called too frequently and exceeded a throttle limit.
      class TooManyRequestsException < ServiceError
      end

      # The operation failed because one of the input parameters was invalid.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceUnavailableException"
          ResourceUnavailableException.new(message)
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
