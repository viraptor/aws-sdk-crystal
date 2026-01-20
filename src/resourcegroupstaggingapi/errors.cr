module Aws
  module ResourceGroupsTaggingAPI
    module Errors
      class ServiceError < Exception
      end

      # The request failed because the target of the operation is currently being modified by a different
      # request. Try again later.

      class ConcurrentModificationException < ServiceError
      end

      # The request failed because performing the operation would violate a constraint. Some of the reasons
      # in the following list might not apply to this specific operation. You must meet the prerequisites
      # for using tag policies. For information, see Prerequisites and permissions in the Tagging Amazon Web
      # Services resources and Tag Editor user guide. You must enable the tag policies service principal (
      # tagpolicies.tag.amazonaws.com ) to integrate with Organizations For information, see
      # EnableAWSServiceAccess . You must have a tag policy attached to the organization root, an OU, or an
      # account.

      class ConstraintViolationException < ServiceError
      end

      # The request processing failed because of an unknown error, exception, or failure. You can retry the
      # request.

      class InternalServiceException < ServiceError
      end

      # The request failed because of one of the following reasons: A required parameter is missing. A
      # provided string parameter is malformed. An provided parameter value is out of range. The target ID
      # is invalid, unsupported, or doesn't exist. You can't access the Amazon S3 bucket for report storage.
      # For more information, see Amazon S3 bucket policy for report storage in the Tagging Amazon Web
      # Services resources and Tag Editor user guide. The partition specified in an ARN parameter in the
      # request doesn't match the partition where you invoked the operation. The partition is specified by
      # the second field of the ARN.

      class InvalidParameterException < ServiceError
      end

      # The request failed because the specified PaginationToken has expired. A PaginationToken is valid for
      # a maximum of 15 minutes.

      class PaginationTokenExpiredException < ServiceError
      end

      # The request failed because it exceeded the allowed frequency of submitted requests.

      class ThrottledException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ConcurrentModificationException"
          ConcurrentModificationException.new(message)
        when "ConstraintViolationException"
          ConstraintViolationException.new(message)
        when "InternalServiceException"
          InternalServiceException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "PaginationTokenExpiredException"
          PaginationTokenExpiredException.new(message)
        when "ThrottledException"
          ThrottledException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
