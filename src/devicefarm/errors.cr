module Aws
  module DeviceFarm
    module Errors
      class ServiceError < Exception
      end

      # An invalid argument was specified.

      class ArgumentException < ServiceError
      end

      # The requested object could not be deleted.

      class CannotDeleteException < ServiceError
      end

      # An entity with the same name already exists.

      class IdempotencyException < ServiceError
      end

      # An internal exception was raised in the service. Contact aws-devicefarm-support@amazon.com if you
      # see this error.

      class InternalServiceException < ServiceError
      end

      # There was an error with the update request, or you do not have sufficient permissions to update this
      # VPC endpoint configuration.

      class InvalidOperationException < ServiceError
      end

      # A limit was exceeded.

      class LimitExceededException < ServiceError
      end

      # Exception gets thrown when a user is not eligible to perform the specified transaction.

      class NotEligibleException < ServiceError
      end

      # The specified entity was not found.

      class NotFoundException < ServiceError
      end

      # There was a problem with the service account.

      class ServiceAccountException < ServiceError
      end

      # The operation was not successful. Try again.

      class TagOperationException < ServiceError
      end

      # The request doesn't comply with the AWS Identity and Access Management (IAM) tag policy. Correct
      # your request and then retry it.

      class TagPolicyException < ServiceError
      end

      # The list of tags on the repository is over the limit. The maximum number of tags that can be applied
      # to a repository is 50.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ArgumentException"
          ArgumentException.new(message)
        when "CannotDeleteException"
          CannotDeleteException.new(message)
        when "IdempotencyException"
          IdempotencyException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "NotEligibleException"
          NotEligibleException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ServiceAccountException"
          ServiceAccountException.new(message)
        when "TagOperationException"
          TagOperationException.new(message)
        when "TagPolicyException"
          TagPolicyException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
