module AwsSdk
  module FSx
    module Errors
      class ServiceError < Exception
      end

      # An access point with that name already exists in the Amazon Web Services Region in your Amazon Web
      # Services account.
      class AccessPointAlreadyOwnedByYou < ServiceError
      end

      # An Active Directory error.
      class ActiveDirectoryError < ServiceError
      end

      # You can't delete a backup while it's being copied.
      class BackupBeingCopied < ServiceError
      end

      # Another backup is already under way. Wait for completion before initiating additional backups of
      # this file system.
      class BackupInProgress < ServiceError
      end

      # No Amazon FSx backups were found based upon the supplied parameters.
      class BackupNotFound < ServiceError
      end

      # You can't delete a backup while it's being used to restore a file system.
      class BackupRestoring < ServiceError
      end

      # A generic error indicating a failure with a client request.
      class BadRequest < ServiceError
      end

      # No data repository associations were found based upon the supplied parameters.
      class DataRepositoryAssociationNotFound < ServiceError
      end

      # The data repository task could not be canceled because the task has already ended.
      class DataRepositoryTaskEnded < ServiceError
      end

      # An existing data repository task is currently executing on the file system. Wait until the existing
      # task has completed, then create the new task.
      class DataRepositoryTaskExecuting < ServiceError
      end

      # The data repository task or tasks you specified could not be found.
      class DataRepositoryTaskNotFound < ServiceError
      end

      # No caches were found based upon supplied parameters.
      class FileCacheNotFound < ServiceError
      end

      # No Amazon FSx file systems were found based upon supplied parameters.
      class FileSystemNotFound < ServiceError
      end

      # The error returned when a second request is received with the same client request token but
      # different parameters settings. A client request token should always uniquely identify a single
      # request.
      class IncompatibleParameterError < ServiceError
      end

      # Amazon FSx doesn't support Multi-AZ Windows File Server copy backup in the destination Region, so
      # the copied backup can't be restored.
      class IncompatibleRegionForMultiAZ < ServiceError
      end

      # A generic error indicating a server-side failure.
      class InternalServerError < ServiceError
      end

      # The access point specified doesn't exist.
      class InvalidAccessPoint < ServiceError
      end

      # You have filtered the response to a data repository type that is not supported.
      class InvalidDataRepositoryType < ServiceError
      end

      # The Key Management Service (KMS) key of the destination backup is not valid.
      class InvalidDestinationKmsKey < ServiceError
      end

      # The path provided for data repository export isn't valid.
      class InvalidExportPath < ServiceError
      end

      # The path provided for data repository import isn't valid.
      class InvalidImportPath < ServiceError
      end

      # One or more network settings specified in the request are invalid.
      class InvalidNetworkSettings < ServiceError
      end

      # An invalid value for PerUnitStorageThroughput was provided. Please create your file system again,
      # using a valid value.
      class InvalidPerUnitStorageThroughput < ServiceError
      end

      # The Region provided for SourceRegion is not valid or is in a different Amazon Web Services
      # partition.
      class InvalidRegion < ServiceError
      end

      # The action or operation requested is invalid. Verify that the action is typed correctly.
      class InvalidRequest < ServiceError
      end

      # The Key Management Service (KMS) key of the source backup is not valid.
      class InvalidSourceKmsKey < ServiceError
      end

      # A cache configuration is required for this operation.
      class MissingFileCacheConfiguration < ServiceError
      end

      # A file system configuration is required for this operation.
      class MissingFileSystemConfiguration < ServiceError
      end

      # A volume configuration is required for this operation.
      class MissingVolumeConfiguration < ServiceError
      end

      # The resource specified for the tagging operation is not a resource type owned by Amazon FSx. Use the
      # API of the relevant service to perform the operation.
      class NotServiceResourceError < ServiceError
      end

      # The resource specified does not support tagging.
      class ResourceDoesNotSupportTagging < ServiceError
      end

      # The resource specified by the Amazon Resource Name (ARN) can't be found.
      class ResourceNotFound < ServiceError
      end

      # The access point specified was not found.
      class S3AccessPointAttachmentNotFound < ServiceError
      end

      # An error indicating that a particular service limit was exceeded. You can increase some service
      # limits by contacting Amazon Web Services Support.
      class ServiceLimitExceeded < ServiceError
      end

      # No Amazon FSx snapshots were found based on the supplied parameters.
      class SnapshotNotFound < ServiceError
      end

      # The request was rejected because the lifecycle status of the source backup isn't AVAILABLE .
      class SourceBackupUnavailable < ServiceError
      end

      # No FSx for ONTAP SVMs were found based upon the supplied parameters.
      class StorageVirtualMachineNotFound < ServiceError
      end

      # You have reached the maximum number of S3 access points attachments allowed for your account in this
      # Amazon Web Services Region, or for the file system. For more information, or to request an increase,
      # see Service quotas on FSx resources in the FSx for OpenZFS User Guide.
      class TooManyAccessPoints < ServiceError
      end

      # The requested operation is not supported for this resource or API.
      class UnsupportedOperation < ServiceError
      end

      # No Amazon FSx volumes were found based upon the supplied parameters.
      class VolumeNotFound < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessPointAlreadyOwnedByYou"
          AccessPointAlreadyOwnedByYou.new(message)
        when "ActiveDirectoryError"
          ActiveDirectoryError.new(message)
        when "BackupBeingCopied"
          BackupBeingCopied.new(message)
        when "BackupInProgress"
          BackupInProgress.new(message)
        when "BackupNotFound"
          BackupNotFound.new(message)
        when "BackupRestoring"
          BackupRestoring.new(message)
        when "BadRequest"
          BadRequest.new(message)
        when "DataRepositoryAssociationNotFound"
          DataRepositoryAssociationNotFound.new(message)
        when "DataRepositoryTaskEnded"
          DataRepositoryTaskEnded.new(message)
        when "DataRepositoryTaskExecuting"
          DataRepositoryTaskExecuting.new(message)
        when "DataRepositoryTaskNotFound"
          DataRepositoryTaskNotFound.new(message)
        when "FileCacheNotFound"
          FileCacheNotFound.new(message)
        when "FileSystemNotFound"
          FileSystemNotFound.new(message)
        when "IncompatibleParameterError"
          IncompatibleParameterError.new(message)
        when "IncompatibleRegionForMultiAZ"
          IncompatibleRegionForMultiAZ.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidAccessPoint"
          InvalidAccessPoint.new(message)
        when "InvalidDataRepositoryType"
          InvalidDataRepositoryType.new(message)
        when "InvalidDestinationKmsKey"
          InvalidDestinationKmsKey.new(message)
        when "InvalidExportPath"
          InvalidExportPath.new(message)
        when "InvalidImportPath"
          InvalidImportPath.new(message)
        when "InvalidNetworkSettings"
          InvalidNetworkSettings.new(message)
        when "InvalidPerUnitStorageThroughput"
          InvalidPerUnitStorageThroughput.new(message)
        when "InvalidRegion"
          InvalidRegion.new(message)
        when "InvalidRequest"
          InvalidRequest.new(message)
        when "InvalidSourceKmsKey"
          InvalidSourceKmsKey.new(message)
        when "MissingFileCacheConfiguration"
          MissingFileCacheConfiguration.new(message)
        when "MissingFileSystemConfiguration"
          MissingFileSystemConfiguration.new(message)
        when "MissingVolumeConfiguration"
          MissingVolumeConfiguration.new(message)
        when "NotServiceResourceError"
          NotServiceResourceError.new(message)
        when "ResourceDoesNotSupportTagging"
          ResourceDoesNotSupportTagging.new(message)
        when "ResourceNotFound"
          ResourceNotFound.new(message)
        when "S3AccessPointAttachmentNotFound"
          S3AccessPointAttachmentNotFound.new(message)
        when "ServiceLimitExceeded"
          ServiceLimitExceeded.new(message)
        when "SnapshotNotFound"
          SnapshotNotFound.new(message)
        when "SourceBackupUnavailable"
          SourceBackupUnavailable.new(message)
        when "StorageVirtualMachineNotFound"
          StorageVirtualMachineNotFound.new(message)
        when "TooManyAccessPoints"
          TooManyAccessPoints.new(message)
        when "UnsupportedOperation"
          UnsupportedOperation.new(message)
        when "VolumeNotFound"
          VolumeNotFound.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
