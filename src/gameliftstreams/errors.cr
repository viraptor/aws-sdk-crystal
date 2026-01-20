module Aws
  module GameLiftStreams
    module Errors
      class ServiceError < Exception
      end

      # You don't have the required permissions to access this Amazon GameLift Streams resource. Correct the
      # permissions before you try again.

      class AccessDeniedException < ServiceError
      end

      # The requested operation would cause a conflict with the current state of a service resource
      # associated with the request. Resolve the conflict before retrying this request.

      class ConflictException < ServiceError
      end

      # The service encountered an internal error and is unable to complete the request.

      class InternalServerException < ServiceError
      end

      # The resource specified in the request was not found. Correct the request before you try again.

      class ResourceNotFoundException < ServiceError
      end

      # The request would cause the resource to exceed an allowed service quota. Resolve the issue before
      # you try again.

      class ServiceQuotaExceededException < ServiceError
      end

      # The request was denied due to request throttling. Retry the request after the suggested wait time.

      class ThrottlingException < ServiceError
      end

      # One or more parameter values in the request fail to satisfy the specified constraints. Correct the
      # invalid parameter values before retrying the request.

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
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
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
