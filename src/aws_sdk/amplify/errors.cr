module AwsSdk
  module Amplify
    module Errors
      class ServiceError < Exception
      end

      # A request contains unexpected data.

      class BadRequestException < ServiceError
      end

      # An operation failed because a dependent service threw an exception.

      class DependentServiceFailureException < ServiceError
      end

      # The service failed to perform an operation due to an internal issue.

      class InternalFailureException < ServiceError
      end

      # A resource could not be created because service quotas were exceeded.

      class LimitExceededException < ServiceError
      end

      # An entity was not found during an operation.

      class NotFoundException < ServiceError
      end

      # An operation failed due to a non-existent resource.

      class ResourceNotFoundException < ServiceError
      end

      # An operation failed due to a lack of access.

      class UnauthorizedException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BadRequestException"
          BadRequestException.new(message)
        when "DependentServiceFailureException"
          DependentServiceFailureException.new(message)
        when "InternalFailureException"
          InternalFailureException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "UnauthorizedException"
          UnauthorizedException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
