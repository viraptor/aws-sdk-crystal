module Aws
  module ImportExport
    module Errors
      class ServiceError < Exception
      end

      # The account specified does not have the appropriate bucket permissions.

      class BucketPermissionException < ServiceError
      end

      # The specified job ID has been canceled and is no longer valid.

      class CanceledJobIdException < ServiceError
      end

      # Each account can create only a certain number of jobs per day. If you need to create more than this,
      # please contact awsimportexport@amazon.com to explain your particular use case.

      class CreateJobQuotaExceededException < ServiceError
      end

      # Indicates that the specified job has expired out of the system.

      class ExpiredJobIdException < ServiceError
      end

      # The AWS Access Key ID specified in the request did not match the manifest's accessKeyId value. The
      # manifest and the request authentication must use the same AWS Access Key ID.

      class InvalidAccessKeyIdException < ServiceError
      end

      # The address specified in the manifest is invalid.

      class InvalidAddressException < ServiceError
      end

      # One or more customs parameters was invalid. Please correct and resubmit.

      class InvalidCustomsException < ServiceError
      end

      # File system specified in export manifest is invalid.

      class InvalidFileSystemException < ServiceError
      end

      # The JOBID was missing, not found, or not associated with the AWS account.

      class InvalidJobIdException < ServiceError
      end

      # One or more manifest fields was invalid. Please correct and resubmit.

      class InvalidManifestFieldException < ServiceError
      end

      # One or more parameters had an invalid value.

      class InvalidParameterException < ServiceError
      end

      # The client tool version is invalid.

      class InvalidVersionException < ServiceError
      end

      # Your manifest is not well-formed.

      class MalformedManifestException < ServiceError
      end

      # One or more required customs parameters was missing from the manifest.

      class MissingCustomsException < ServiceError
      end

      # One or more required fields were missing from the manifest file. Please correct and resubmit.

      class MissingManifestFieldException < ServiceError
      end

      # One or more required parameters was missing from the request.

      class MissingParameterException < ServiceError
      end

      # Your manifest file contained buckets from multiple regions. A job is restricted to buckets from one
      # region. Please correct and resubmit.

      class MultipleRegionsException < ServiceError
      end

      # The specified bucket does not exist. Create the specified bucket or change the manifest's bucket,
      # exportBucket, or logBucket field to a bucket that the account, as specified by the manifest's Access
      # Key ID, has write permissions to.

      class NoSuchBucketException < ServiceError
      end

      # AWS Import/Export cannot cancel the job

      class UnableToCancelJobIdException < ServiceError
      end

      # AWS Import/Export cannot update the job

      class UnableToUpdateJobIdException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "BucketPermissionException"
          BucketPermissionException.new(message)
        when "CanceledJobIdException"
          CanceledJobIdException.new(message)
        when "CreateJobQuotaExceededException"
          CreateJobQuotaExceededException.new(message)
        when "ExpiredJobIdException"
          ExpiredJobIdException.new(message)
        when "InvalidAccessKeyIdException"
          InvalidAccessKeyIdException.new(message)
        when "InvalidAddressException"
          InvalidAddressException.new(message)
        when "InvalidCustomsException"
          InvalidCustomsException.new(message)
        when "InvalidFileSystemException"
          InvalidFileSystemException.new(message)
        when "InvalidJobIdException"
          InvalidJobIdException.new(message)
        when "InvalidManifestFieldException"
          InvalidManifestFieldException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidVersionException"
          InvalidVersionException.new(message)
        when "MalformedManifestException"
          MalformedManifestException.new(message)
        when "MissingCustomsException"
          MissingCustomsException.new(message)
        when "MissingManifestFieldException"
          MissingManifestFieldException.new(message)
        when "MissingParameterException"
          MissingParameterException.new(message)
        when "MultipleRegionsException"
          MultipleRegionsException.new(message)
        when "NoSuchBucketException"
          NoSuchBucketException.new(message)
        when "UnableToCancelJobIdException"
          UnableToCancelJobIdException.new(message)
        when "UnableToUpdateJobIdException"
          UnableToUpdateJobIdException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
