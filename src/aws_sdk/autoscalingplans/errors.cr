module AwsSdk
  module AutoScalingPlans
    module Errors
      class ServiceError < Exception
      end

      # Concurrent updates caused an exception, for example, if you request an update to a scaling plan that
      # already has a pending update.

      class ConcurrentUpdateException < ServiceError
      end

      # The service encountered an internal error.

      class InternalServiceException < ServiceError
      end

      # The token provided is not valid.

      class InvalidNextTokenException < ServiceError
      end

      # Your account exceeded a limit. This exception is thrown when a per-account resource limit is
      # exceeded.

      class LimitExceededException < ServiceError
      end

      # The specified object could not be found.

      class ObjectNotFoundException < ServiceError
      end

      # An exception was thrown for a validation issue. Review the parameters provided.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentUpdateException"
          ConcurrentUpdateException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ObjectNotFoundException"
          ObjectNotFoundException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
