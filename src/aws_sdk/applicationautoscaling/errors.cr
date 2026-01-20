module AwsSdk
  module ApplicationAutoScaling
    module Errors
      class ServiceError < Exception
      end

      # Concurrent updates caused an exception, for example, if you request an update to an Application Auto
      # Scaling resource that already has a pending update.

      class ConcurrentUpdateException < ServiceError
      end

      # Failed access to resources caused an exception. This exception is thrown when Application Auto
      # Scaling is unable to retrieve the alarms associated with a scaling policy due to a client error, for
      # example, if the role ARN specified for a scalable target does not have permission to call the
      # CloudWatch DescribeAlarms on your behalf.

      class FailedResourceAccessException < ServiceError
      end

      # The service encountered an internal error.

      class InternalServiceException < ServiceError
      end

      # The next token supplied was invalid.

      class InvalidNextTokenException < ServiceError
      end

      # A per-account resource limit is exceeded. For more information, see Application Auto Scaling service
      # quotas .

      class LimitExceededException < ServiceError
      end

      # The specified object could not be found. For any operation that depends on the existence of a
      # scalable target, this exception is thrown if the scalable target with the specified service
      # namespace, resource ID, and scalable dimension does not exist. For any operation that deletes or
      # deregisters a resource, this exception is thrown if the resource cannot be found.

      class ObjectNotFoundException < ServiceError
      end

      # The specified resource doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # The request contains too many tags. Try the request again with fewer tags.

      class TooManyTagsException < ServiceError
      end

      # An exception was thrown for a validation issue. Review the available parameters for the API request.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentUpdateException"
          ConcurrentUpdateException.new(message)
        when "FailedResourceAccessException"
          FailedResourceAccessException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "ObjectNotFoundException"
          ObjectNotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
