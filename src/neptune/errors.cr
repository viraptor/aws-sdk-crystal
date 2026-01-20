module Aws
  module Neptune
    module Errors
      class ServiceError < Exception
      end

      # Specified CIDRIP or EC2 security group is not authorized for the specified DB security group.
      # Neptune may not also be authorized via IAM to perform necessary actions on your behalf.

      class AuthorizationNotFoundFault < ServiceError
      end

      # CertificateIdentifier does not refer to an existing certificate.

      class CertificateNotFoundFault < ServiceError
      end

      # User already has a DB cluster with the given identifier.

      class DBClusterAlreadyExistsFault < ServiceError
      end

      # The specified custom endpoint cannot be created because it already exists.

      class DBClusterEndpointAlreadyExistsFault < ServiceError
      end

      # The specified custom endpoint doesn't exist.

      class DBClusterEndpointNotFoundFault < ServiceError
      end

      # The cluster already has the maximum number of custom endpoints.

      class DBClusterEndpointQuotaExceededFault < ServiceError
      end

      # DBClusterIdentifier does not refer to an existing DB cluster.

      class DBClusterNotFoundFault < ServiceError
      end

      # DBClusterParameterGroupName does not refer to an existing DB Cluster parameter group.

      class DBClusterParameterGroupNotFoundFault < ServiceError
      end

      # User attempted to create a new DB cluster and the user has already reached the maximum allowed DB
      # cluster quota.

      class DBClusterQuotaExceededFault < ServiceError
      end

      # The specified IAM role Amazon Resource Name (ARN) is already associated with the specified DB
      # cluster.

      class DBClusterRoleAlreadyExistsFault < ServiceError
      end

      # The specified IAM role Amazon Resource Name (ARN) is not associated with the specified DB cluster.

      class DBClusterRoleNotFoundFault < ServiceError
      end

      # You have exceeded the maximum number of IAM roles that can be associated with the specified DB
      # cluster.

      class DBClusterRoleQuotaExceededFault < ServiceError
      end

      # User already has a DB cluster snapshot with the given identifier.

      class DBClusterSnapshotAlreadyExistsFault < ServiceError
      end

      # DBClusterSnapshotIdentifier does not refer to an existing DB cluster snapshot.

      class DBClusterSnapshotNotFoundFault < ServiceError
      end

      # User already has a DB instance with the given identifier.

      class DBInstanceAlreadyExistsFault < ServiceError
      end

      # DBInstanceIdentifier does not refer to an existing DB instance.

      class DBInstanceNotFoundFault < ServiceError
      end

      # A DB parameter group with the same name exists.

      class DBParameterGroupAlreadyExistsFault < ServiceError
      end

      # DBParameterGroupName does not refer to an existing DB parameter group.

      class DBParameterGroupNotFoundFault < ServiceError
      end

      # Request would result in user exceeding the allowed number of DB parameter groups.

      class DBParameterGroupQuotaExceededFault < ServiceError
      end

      # DBSecurityGroupName does not refer to an existing DB security group.

      class DBSecurityGroupNotFoundFault < ServiceError
      end

      # DBSnapshotIdentifier is already used by an existing snapshot.

      class DBSnapshotAlreadyExistsFault < ServiceError
      end

      # DBSnapshotIdentifier does not refer to an existing DB snapshot.

      class DBSnapshotNotFoundFault < ServiceError
      end

      # DBSubnetGroupName is already used by an existing DB subnet group.

      class DBSubnetGroupAlreadyExistsFault < ServiceError
      end

      # Subnets in the DB subnet group should cover at least two Availability Zones unless there is only one
      # Availability Zone.

      class DBSubnetGroupDoesNotCoverEnoughAZs < ServiceError
      end

      # DBSubnetGroupName does not refer to an existing DB subnet group.

      class DBSubnetGroupNotFoundFault < ServiceError
      end

      # Request would result in user exceeding the allowed number of DB subnet groups.

      class DBSubnetGroupQuotaExceededFault < ServiceError
      end

      # Request would result in user exceeding the allowed number of subnets in a DB subnet groups.

      class DBSubnetQuotaExceededFault < ServiceError
      end

      # The DB upgrade failed because a resource the DB depends on could not be modified.

      class DBUpgradeDependencyFailureFault < ServiceError
      end

      # Domain does not refer to an existing Active Directory Domain.

      class DomainNotFoundFault < ServiceError
      end

      # You have exceeded the number of events you can subscribe to.

      class EventSubscriptionQuotaExceededFault < ServiceError
      end

      # The GlobalClusterIdentifier already exists. Choose a new global database identifier (unique name) to
      # create a new global database cluster.

      class GlobalClusterAlreadyExistsFault < ServiceError
      end

      # The GlobalClusterIdentifier doesn't refer to an existing global database cluster.

      class GlobalClusterNotFoundFault < ServiceError
      end

      # The number of global database clusters for this account is already at the maximum allowed.

      class GlobalClusterQuotaExceededFault < ServiceError
      end

      # Request would result in user exceeding the allowed number of DB instances.

      class InstanceQuotaExceededFault < ServiceError
      end

      # The DB cluster does not have enough capacity for the current operation.

      class InsufficientDBClusterCapacityFault < ServiceError
      end

      # Specified DB instance class is not available in the specified Availability Zone.

      class InsufficientDBInstanceCapacityFault < ServiceError
      end

      # There is insufficient storage available for the current action. You may be able to resolve this
      # error by updating your subnet group to use different Availability Zones that have more storage
      # available.

      class InsufficientStorageClusterCapacityFault < ServiceError
      end

      # The requested operation cannot be performed on the endpoint while the endpoint is in this state.

      class InvalidDBClusterEndpointStateFault < ServiceError
      end

      # The supplied value is not a valid DB cluster snapshot state.

      class InvalidDBClusterSnapshotStateFault < ServiceError
      end

      # The DB cluster is not in a valid state.

      class InvalidDBClusterStateFault < ServiceError
      end

      # The specified DB instance is not in the available state.

      class InvalidDBInstanceStateFault < ServiceError
      end

      # The DB parameter group is in use or is in an invalid state. If you are attempting to delete the
      # parameter group, you cannot delete it when the parameter group is in this state.

      class InvalidDBParameterGroupStateFault < ServiceError
      end

      # The state of the DB security group does not allow deletion.

      class InvalidDBSecurityGroupStateFault < ServiceError
      end

      # The state of the DB snapshot does not allow deletion.

      class InvalidDBSnapshotStateFault < ServiceError
      end

      # The DB subnet group cannot be deleted because it is in use.

      class InvalidDBSubnetGroupStateFault < ServiceError
      end

      # The DB subnet is not in the available state.

      class InvalidDBSubnetStateFault < ServiceError
      end

      # The event subscription is in an invalid state.

      class InvalidEventSubscriptionStateFault < ServiceError
      end

      # The global cluster is in an invalid state and can't perform the requested operation.

      class InvalidGlobalClusterStateFault < ServiceError
      end

      # Cannot restore from vpc backup to non-vpc DB instance.

      class InvalidRestoreFault < ServiceError
      end

      # The requested subnet is invalid, or multiple subnets were requested that are not all in a common
      # VPC.

      class InvalidSubnet < ServiceError
      end

      # DB subnet group does not cover all Availability Zones after it is created because users' change.

      class InvalidVPCNetworkStateFault < ServiceError
      end

      # Error accessing KMS key.

      class KMSKeyNotAccessibleFault < ServiceError
      end

      # The designated option group could not be found.

      class OptionGroupNotFoundFault < ServiceError
      end

      # Provisioned IOPS not available in the specified Availability Zone.

      class ProvisionedIopsNotAvailableInAZFault < ServiceError
      end

      # The specified resource ID was not found.

      class ResourceNotFoundFault < ServiceError
      end

      # The SNS topic is invalid.

      class SNSInvalidTopicFault < ServiceError
      end

      # There is no SNS authorization.

      class SNSNoAuthorizationFault < ServiceError
      end

      # The ARN of the SNS topic could not be found.

      class SNSTopicArnNotFoundFault < ServiceError
      end

      # You have exceeded the maximum number of accounts that you can share a manual DB snapshot with.

      class SharedSnapshotQuotaExceededFault < ServiceError
      end

      # Request would result in user exceeding the allowed number of DB snapshots.

      class SnapshotQuotaExceededFault < ServiceError
      end

      # The source could not be found.

      class SourceNotFoundFault < ServiceError
      end

      # Request would result in user exceeding the allowed amount of storage available across all DB
      # instances.

      class StorageQuotaExceededFault < ServiceError
      end

      # StorageType specified cannot be associated with the DB Instance.

      class StorageTypeNotSupportedFault < ServiceError
      end

      # The DB subnet is already in use in the Availability Zone.

      class SubnetAlreadyInUse < ServiceError
      end

      # This subscription already exists.

      class SubscriptionAlreadyExistFault < ServiceError
      end

      # The designated subscription category could not be found.

      class SubscriptionCategoryNotFoundFault < ServiceError
      end

      # The designated subscription could not be found.

      class SubscriptionNotFoundFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AuthorizationNotFoundFault"
          AuthorizationNotFoundFault.new(message)
        when "CertificateNotFoundFault"
          CertificateNotFoundFault.new(message)
        when "DBClusterAlreadyExistsFault"
          DBClusterAlreadyExistsFault.new(message)
        when "DBClusterEndpointAlreadyExistsFault"
          DBClusterEndpointAlreadyExistsFault.new(message)
        when "DBClusterEndpointNotFoundFault"
          DBClusterEndpointNotFoundFault.new(message)
        when "DBClusterEndpointQuotaExceededFault"
          DBClusterEndpointQuotaExceededFault.new(message)
        when "DBClusterNotFoundFault"
          DBClusterNotFoundFault.new(message)
        when "DBClusterParameterGroupNotFoundFault"
          DBClusterParameterGroupNotFoundFault.new(message)
        when "DBClusterQuotaExceededFault"
          DBClusterQuotaExceededFault.new(message)
        when "DBClusterRoleAlreadyExistsFault"
          DBClusterRoleAlreadyExistsFault.new(message)
        when "DBClusterRoleNotFoundFault"
          DBClusterRoleNotFoundFault.new(message)
        when "DBClusterRoleQuotaExceededFault"
          DBClusterRoleQuotaExceededFault.new(message)
        when "DBClusterSnapshotAlreadyExistsFault"
          DBClusterSnapshotAlreadyExistsFault.new(message)
        when "DBClusterSnapshotNotFoundFault"
          DBClusterSnapshotNotFoundFault.new(message)
        when "DBInstanceAlreadyExistsFault"
          DBInstanceAlreadyExistsFault.new(message)
        when "DBInstanceNotFoundFault"
          DBInstanceNotFoundFault.new(message)
        when "DBParameterGroupAlreadyExistsFault"
          DBParameterGroupAlreadyExistsFault.new(message)
        when "DBParameterGroupNotFoundFault"
          DBParameterGroupNotFoundFault.new(message)
        when "DBParameterGroupQuotaExceededFault"
          DBParameterGroupQuotaExceededFault.new(message)
        when "DBSecurityGroupNotFoundFault"
          DBSecurityGroupNotFoundFault.new(message)
        when "DBSnapshotAlreadyExistsFault"
          DBSnapshotAlreadyExistsFault.new(message)
        when "DBSnapshotNotFoundFault"
          DBSnapshotNotFoundFault.new(message)
        when "DBSubnetGroupAlreadyExistsFault"
          DBSubnetGroupAlreadyExistsFault.new(message)
        when "DBSubnetGroupDoesNotCoverEnoughAZs"
          DBSubnetGroupDoesNotCoverEnoughAZs.new(message)
        when "DBSubnetGroupNotFoundFault"
          DBSubnetGroupNotFoundFault.new(message)
        when "DBSubnetGroupQuotaExceededFault"
          DBSubnetGroupQuotaExceededFault.new(message)
        when "DBSubnetQuotaExceededFault"
          DBSubnetQuotaExceededFault.new(message)
        when "DBUpgradeDependencyFailureFault"
          DBUpgradeDependencyFailureFault.new(message)
        when "DomainNotFoundFault"
          DomainNotFoundFault.new(message)
        when "EventSubscriptionQuotaExceededFault"
          EventSubscriptionQuotaExceededFault.new(message)
        when "GlobalClusterAlreadyExistsFault"
          GlobalClusterAlreadyExistsFault.new(message)
        when "GlobalClusterNotFoundFault"
          GlobalClusterNotFoundFault.new(message)
        when "GlobalClusterQuotaExceededFault"
          GlobalClusterQuotaExceededFault.new(message)
        when "InstanceQuotaExceededFault"
          InstanceQuotaExceededFault.new(message)
        when "InsufficientDBClusterCapacityFault"
          InsufficientDBClusterCapacityFault.new(message)
        when "InsufficientDBInstanceCapacityFault"
          InsufficientDBInstanceCapacityFault.new(message)
        when "InsufficientStorageClusterCapacityFault"
          InsufficientStorageClusterCapacityFault.new(message)
        when "InvalidDBClusterEndpointStateFault"
          InvalidDBClusterEndpointStateFault.new(message)
        when "InvalidDBClusterSnapshotStateFault"
          InvalidDBClusterSnapshotStateFault.new(message)
        when "InvalidDBClusterStateFault"
          InvalidDBClusterStateFault.new(message)
        when "InvalidDBInstanceStateFault"
          InvalidDBInstanceStateFault.new(message)
        when "InvalidDBParameterGroupStateFault"
          InvalidDBParameterGroupStateFault.new(message)
        when "InvalidDBSecurityGroupStateFault"
          InvalidDBSecurityGroupStateFault.new(message)
        when "InvalidDBSnapshotStateFault"
          InvalidDBSnapshotStateFault.new(message)
        when "InvalidDBSubnetGroupStateFault"
          InvalidDBSubnetGroupStateFault.new(message)
        when "InvalidDBSubnetStateFault"
          InvalidDBSubnetStateFault.new(message)
        when "InvalidEventSubscriptionStateFault"
          InvalidEventSubscriptionStateFault.new(message)
        when "InvalidGlobalClusterStateFault"
          InvalidGlobalClusterStateFault.new(message)
        when "InvalidRestoreFault"
          InvalidRestoreFault.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "InvalidVPCNetworkStateFault"
          InvalidVPCNetworkStateFault.new(message)
        when "KMSKeyNotAccessibleFault"
          KMSKeyNotAccessibleFault.new(message)
        when "OptionGroupNotFoundFault"
          OptionGroupNotFoundFault.new(message)
        when "ProvisionedIopsNotAvailableInAZFault"
          ProvisionedIopsNotAvailableInAZFault.new(message)
        when "ResourceNotFoundFault"
          ResourceNotFoundFault.new(message)
        when "SNSInvalidTopicFault"
          SNSInvalidTopicFault.new(message)
        when "SNSNoAuthorizationFault"
          SNSNoAuthorizationFault.new(message)
        when "SNSTopicArnNotFoundFault"
          SNSTopicArnNotFoundFault.new(message)
        when "SharedSnapshotQuotaExceededFault"
          SharedSnapshotQuotaExceededFault.new(message)
        when "SnapshotQuotaExceededFault"
          SnapshotQuotaExceededFault.new(message)
        when "SourceNotFoundFault"
          SourceNotFoundFault.new(message)
        when "StorageQuotaExceededFault"
          StorageQuotaExceededFault.new(message)
        when "StorageTypeNotSupportedFault"
          StorageTypeNotSupportedFault.new(message)
        when "SubnetAlreadyInUse"
          SubnetAlreadyInUse.new(message)
        when "SubscriptionAlreadyExistFault"
          SubscriptionAlreadyExistFault.new(message)
        when "SubscriptionCategoryNotFoundFault"
          SubscriptionCategoryNotFoundFault.new(message)
        when "SubscriptionNotFoundFault"
          SubscriptionNotFoundFault.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
