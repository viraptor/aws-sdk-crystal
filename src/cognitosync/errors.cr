module Aws
  module CognitoSync
    module Errors
      class ServiceError < Exception
      end

      # An exception thrown when a bulk publish operation is requested less than 24 hours after a previous
      # bulk publish operation completed successfully.

      class AlreadyStreamedException < ServiceError
      end

      # Thrown if there are parallel requests to modify a resource.

      class ConcurrentModificationException < ServiceError
      end

      # An exception thrown when there is an IN_PROGRESS bulk publish operation for the given identity pool.

      class DuplicateRequestException < ServiceError
      end

      # Indicates an internal service error.

      class InternalErrorException < ServiceError
      end


      class InvalidConfigurationException < ServiceError
      end

      # The AWS Lambda function returned invalid output or an exception.

      class InvalidLambdaFunctionOutputException < ServiceError
      end

      # Thrown when a request parameter does not comply with the associated constraints.

      class InvalidParameterException < ServiceError
      end

      # AWS Lambda throttled your account, please contact AWS Support

      class LambdaThrottledException < ServiceError
      end

      # Thrown when the limit on the number of objects or operations has been exceeded.

      class LimitExceededException < ServiceError
      end

      # Thrown when a user is not authorized to access the requested resource.

      class NotAuthorizedException < ServiceError
      end

      # Thrown if an update can't be applied because the resource was changed by another call and this would
      # result in a conflict.

      class ResourceConflictException < ServiceError
      end

      # Thrown if the resource doesn't exist.

      class ResourceNotFoundException < ServiceError
      end

      # Thrown if the request is throttled.

      class TooManyRequestsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlreadyStreamedException"
          AlreadyStreamedException.new(message)
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "DuplicateRequestException"
          DuplicateRequestException.new(message)
        when "InternalErrorException"
          InternalErrorException.new(message)
        when "InvalidConfigurationException"
          InvalidConfigurationException.new(message)
        when "InvalidLambdaFunctionOutputException"
          InvalidLambdaFunctionOutputException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "LambdaThrottledException"
          LambdaThrottledException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotAuthorizedException"
          NotAuthorizedException.new(message)
        when "ResourceConflictException"
          ResourceConflictException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "TooManyRequestsException"
          TooManyRequestsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
