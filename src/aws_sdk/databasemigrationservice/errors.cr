module AwsSdk
  module DatabaseMigrationService
    module Errors
      class ServiceError < Exception
      end

      # DMS was denied access to the endpoint. Check that the role is correctly configured.

      class AccessDeniedFault < ServiceError
      end

      # The specified collector doesn't exist.

      class CollectorNotFoundFault < ServiceError
      end

      # A dependency threw an exception.

      class FailedDependencyFault < ServiceError
      end

      # There are not enough resources allocated to the database migration.

      class InsufficientResourceCapacityFault < ServiceError
      end

      # The certificate was not valid.

      class InvalidCertificateFault < ServiceError
      end

      # The action or operation requested isn't valid.

      class InvalidOperationFault < ServiceError
      end

      # The resource is in a state that prevents it from being used for database migration.

      class InvalidResourceStateFault < ServiceError
      end

      # The subnet provided isn't valid.

      class InvalidSubnet < ServiceError
      end

      # The ciphertext references a key that doesn't exist or that the DMS account doesn't have access to.

      class KMSAccessDeniedFault < ServiceError
      end

      # The specified KMS key isn't enabled.

      class KMSDisabledFault < ServiceError
      end

      # An Key Management Service (KMS) error is preventing access to KMS.

      class KMSFault < ServiceError
      end

      # The state of the specified KMS resource isn't valid for this request.

      class KMSInvalidStateFault < ServiceError
      end

      # DMS cannot access the KMS key.

      class KMSKeyNotAccessibleFault < ServiceError
      end

      # The specified KMS entity or resource can't be found.

      class KMSNotFoundFault < ServiceError
      end

      # This request triggered KMS request throttling.

      class KMSThrottlingFault < ServiceError
      end

      # The replication subnet group does not cover enough Availability Zones (AZs). Edit the replication
      # subnet group and add more AZs.

      class ReplicationSubnetGroupDoesNotCoverEnoughAZs < ServiceError
      end

      # The resource you are attempting to create already exists.

      class ResourceAlreadyExistsFault < ServiceError
      end

      # The resource could not be found.

      class ResourceNotFoundFault < ServiceError
      end

      # The quota for this resource quota has been exceeded.

      class ResourceQuotaExceededFault < ServiceError
      end

      # Insufficient privileges are preventing access to an Amazon S3 object.

      class S3AccessDeniedFault < ServiceError
      end

      # A specified Amazon S3 bucket, bucket folder, or other object can't be found.

      class S3ResourceNotFoundFault < ServiceError
      end

      # The SNS topic is invalid.

      class SNSInvalidTopicFault < ServiceError
      end

      # You are not authorized for the SNS subscription.

      class SNSNoAuthorizationFault < ServiceError
      end

      # The storage quota has been exceeded.

      class StorageQuotaExceededFault < ServiceError
      end

      # The specified subnet is already in use.

      class SubnetAlreadyInUse < ServiceError
      end

      # An upgrade dependency is preventing the database migration.

      class UpgradeDependencyFailureFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedFault"
          AccessDeniedFault.new(message)
        when "CollectorNotFoundFault"
          CollectorNotFoundFault.new(message)
        when "FailedDependencyFault"
          FailedDependencyFault.new(message)
        when "InsufficientResourceCapacityFault"
          InsufficientResourceCapacityFault.new(message)
        when "InvalidCertificateFault"
          InvalidCertificateFault.new(message)
        when "InvalidOperationFault"
          InvalidOperationFault.new(message)
        when "InvalidResourceStateFault"
          InvalidResourceStateFault.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "KMSAccessDeniedFault"
          KMSAccessDeniedFault.new(message)
        when "KMSDisabledFault"
          KMSDisabledFault.new(message)
        when "KMSFault"
          KMSFault.new(message)
        when "KMSInvalidStateFault"
          KMSInvalidStateFault.new(message)
        when "KMSKeyNotAccessibleFault"
          KMSKeyNotAccessibleFault.new(message)
        when "KMSNotFoundFault"
          KMSNotFoundFault.new(message)
        when "KMSThrottlingFault"
          KMSThrottlingFault.new(message)
        when "ReplicationSubnetGroupDoesNotCoverEnoughAZs"
          ReplicationSubnetGroupDoesNotCoverEnoughAZs.new(message)
        when "ResourceAlreadyExistsFault"
          ResourceAlreadyExistsFault.new(message)
        when "ResourceNotFoundFault"
          ResourceNotFoundFault.new(message)
        when "ResourceQuotaExceededFault"
          ResourceQuotaExceededFault.new(message)
        when "S3AccessDeniedFault"
          S3AccessDeniedFault.new(message)
        when "S3ResourceNotFoundFault"
          S3ResourceNotFoundFault.new(message)
        when "SNSInvalidTopicFault"
          SNSInvalidTopicFault.new(message)
        when "SNSNoAuthorizationFault"
          SNSNoAuthorizationFault.new(message)
        when "StorageQuotaExceededFault"
          StorageQuotaExceededFault.new(message)
        when "SubnetAlreadyInUse"
          SubnetAlreadyInUse.new(message)
        when "UpgradeDependencyFailureFault"
          UpgradeDependencyFailureFault.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
