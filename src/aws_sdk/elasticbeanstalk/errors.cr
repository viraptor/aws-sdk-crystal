module AwsSdk
  module ElasticBeanstalk
    module Errors
      class ServiceError < Exception
      end

      # AWS CodeBuild is not available in the specified region.

      class CodeBuildNotInServiceRegionException < ServiceError
      end

      # A generic service exception has occurred.

      class ElasticBeanstalkServiceException < ServiceError
      end

      # The specified account does not have sufficient privileges for one or more AWS services.

      class InsufficientPrivilegesException < ServiceError
      end

      # One or more input parameters is not valid. Please correct the input parameters and try the operation
      # again.

      class InvalidRequestException < ServiceError
      end

      # Cannot modify the managed action in its current state.

      class ManagedActionInvalidStateException < ServiceError
      end

      # Unable to perform the specified operation because another operation that effects an element in this
      # activity is already in progress.

      class OperationInProgressException < ServiceError
      end

      # You cannot delete the platform version because there are still environments running on it.

      class PlatformVersionStillReferencedException < ServiceError
      end

      # A resource doesn't exist for the specified Amazon Resource Name (ARN).

      class ResourceNotFoundException < ServiceError
      end

      # The type of the specified Amazon Resource Name (ARN) isn't supported for this operation.

      class ResourceTypeNotSupportedException < ServiceError
      end

      # The specified S3 bucket does not belong to the S3 region in which the service is running. The
      # following regions are supported: IAD/us-east-1 PDX/us-west-2 DUB/eu-west-1

      class S3LocationNotInServiceRegionException < ServiceError
      end

      # The specified account does not have a subscription to Amazon S3.

      class S3SubscriptionRequiredException < ServiceError
      end

      # Unable to delete the Amazon S3 source bundle associated with the application version. The
      # application version was deleted successfully.

      class SourceBundleDeletionException < ServiceError
      end

      # The specified account has reached its limit of application versions.

      class TooManyApplicationVersionsException < ServiceError
      end

      # The specified account has reached its limit of applications.

      class TooManyApplicationsException < ServiceError
      end

      # The specified account has reached its limit of Amazon S3 buckets.

      class TooManyBucketsException < ServiceError
      end

      # The specified account has reached its limit of configuration templates.

      class TooManyConfigurationTemplatesException < ServiceError
      end

      # The specified account has reached its limit of environments.

      class TooManyEnvironmentsException < ServiceError
      end

      # You have exceeded the maximum number of allowed platforms associated with the account.

      class TooManyPlatformsException < ServiceError
      end

      # The number of tags in the resource would exceed the number of tags that each resource can have. To
      # calculate this, the operation considers both the number of tags the resource already has and the
      # tags this operation would add if it succeeded.

      class TooManyTagsException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "CodeBuildNotInServiceRegionException"
          CodeBuildNotInServiceRegionException.new(message)
        when "ElasticBeanstalkServiceException"
          ElasticBeanstalkServiceException.new(message)
        when "InsufficientPrivilegesException"
          InsufficientPrivilegesException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "ManagedActionInvalidStateException"
          ManagedActionInvalidStateException.new(message)
        when "OperationInProgressException"
          OperationInProgressException.new(message)
        when "PlatformVersionStillReferencedException"
          PlatformVersionStillReferencedException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourceTypeNotSupportedException"
          ResourceTypeNotSupportedException.new(message)
        when "S3LocationNotInServiceRegionException"
          S3LocationNotInServiceRegionException.new(message)
        when "S3SubscriptionRequiredException"
          S3SubscriptionRequiredException.new(message)
        when "SourceBundleDeletionException"
          SourceBundleDeletionException.new(message)
        when "TooManyApplicationVersionsException"
          TooManyApplicationVersionsException.new(message)
        when "TooManyApplicationsException"
          TooManyApplicationsException.new(message)
        when "TooManyBucketsException"
          TooManyBucketsException.new(message)
        when "TooManyConfigurationTemplatesException"
          TooManyConfigurationTemplatesException.new(message)
        when "TooManyEnvironmentsException"
          TooManyEnvironmentsException.new(message)
        when "TooManyPlatformsException"
          TooManyPlatformsException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
