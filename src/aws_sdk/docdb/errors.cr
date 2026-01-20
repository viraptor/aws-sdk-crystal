module AwsSdk
  module DocDB
    module Errors
      class ServiceError < Exception
      end

      # The specified CIDR IP or Amazon EC2 security group isn't authorized for the specified security
      # group. Amazon DocumentDB also might not be authorized to perform necessary actions on your behalf
      # using IAM.

      class AuthorizationNotFoundFault < ServiceError
      end

      # CertificateIdentifier doesn't refer to an existing certificate.

      class CertificateNotFoundFault < ServiceError
      end

      # You already have a cluster with the given identifier.

      class DBClusterAlreadyExistsFault < ServiceError
      end

      # DBClusterIdentifier doesn't refer to an existing cluster.

      class DBClusterNotFoundFault < ServiceError
      end

      # DBClusterParameterGroupName doesn't refer to an existing cluster parameter group.

      class DBClusterParameterGroupNotFoundFault < ServiceError
      end

      # The cluster can't be created because you have reached the maximum allowed quota of clusters.

      class DBClusterQuotaExceededFault < ServiceError
      end

      # You already have a cluster snapshot with the given identifier.

      class DBClusterSnapshotAlreadyExistsFault < ServiceError
      end

      # DBClusterSnapshotIdentifier doesn't refer to an existing cluster snapshot.

      class DBClusterSnapshotNotFoundFault < ServiceError
      end

      # You already have a instance with the given identifier.

      class DBInstanceAlreadyExistsFault < ServiceError
      end

      # DBInstanceIdentifier doesn't refer to an existing instance.

      class DBInstanceNotFoundFault < ServiceError
      end

      # A parameter group with the same name already exists.

      class DBParameterGroupAlreadyExistsFault < ServiceError
      end

      # DBParameterGroupName doesn't refer to an existing parameter group.

      class DBParameterGroupNotFoundFault < ServiceError
      end

      # This request would cause you to exceed the allowed number of parameter groups.

      class DBParameterGroupQuotaExceededFault < ServiceError
      end

      # DBSecurityGroupName doesn't refer to an existing security group.

      class DBSecurityGroupNotFoundFault < ServiceError
      end

      # DBSnapshotIdentifier is already being used by an existing snapshot.

      class DBSnapshotAlreadyExistsFault < ServiceError
      end

      # DBSnapshotIdentifier doesn't refer to an existing snapshot.

      class DBSnapshotNotFoundFault < ServiceError
      end

      # DBSubnetGroupName is already being used by an existing subnet group.

      class DBSubnetGroupAlreadyExistsFault < ServiceError
      end

      # Subnets in the subnet group should cover at least two Availability Zones unless there is only one
      # Availability Zone.

      class DBSubnetGroupDoesNotCoverEnoughAZs < ServiceError
      end

      # DBSubnetGroupName doesn't refer to an existing subnet group.

      class DBSubnetGroupNotFoundFault < ServiceError
      end

      # The request would cause you to exceed the allowed number of subnet groups.

      class DBSubnetGroupQuotaExceededFault < ServiceError
      end

      # The request would cause you to exceed the allowed number of subnets in a subnet group.

      class DBSubnetQuotaExceededFault < ServiceError
      end

      # The upgrade failed because a resource that the depends on can't be modified.

      class DBUpgradeDependencyFailureFault < ServiceError
      end

      # You have reached the maximum number of event subscriptions.

      class EventSubscriptionQuotaExceededFault < ServiceError
      end

      # The GlobalClusterIdentifier already exists. Choose a new global cluster identifier (unique name) to
      # create a new global cluster.

      class GlobalClusterAlreadyExistsFault < ServiceError
      end

      # The GlobalClusterIdentifier doesn't refer to an existing global cluster.

      class GlobalClusterNotFoundFault < ServiceError
      end

      # The number of global clusters for this account is already at the maximum allowed.

      class GlobalClusterQuotaExceededFault < ServiceError
      end

      # The request would cause you to exceed the allowed number of instances.

      class InstanceQuotaExceededFault < ServiceError
      end

      # The cluster doesn't have enough capacity for the current operation.

      class InsufficientDBClusterCapacityFault < ServiceError
      end

      # The specified instance class isn't available in the specified Availability Zone.

      class InsufficientDBInstanceCapacityFault < ServiceError
      end

      # There is not enough storage available for the current action. You might be able to resolve this
      # error by updating your subnet group to use different Availability Zones that have more storage
      # available.

      class InsufficientStorageClusterCapacityFault < ServiceError
      end

      # The provided value isn't a valid cluster snapshot state.

      class InvalidDBClusterSnapshotStateFault < ServiceError
      end

      # The cluster isn't in a valid state.

      class InvalidDBClusterStateFault < ServiceError
      end

      # The specified instance isn't in the available state.

      class InvalidDBInstanceStateFault < ServiceError
      end

      # The parameter group is in use, or it is in a state that is not valid. If you are trying to delete
      # the parameter group, you can't delete it when the parameter group is in this state.

      class InvalidDBParameterGroupStateFault < ServiceError
      end

      # The state of the security group doesn't allow deletion.

      class InvalidDBSecurityGroupStateFault < ServiceError
      end

      # The state of the snapshot doesn't allow deletion.

      class InvalidDBSnapshotStateFault < ServiceError
      end

      # The subnet group can't be deleted because it's in use.

      class InvalidDBSubnetGroupStateFault < ServiceError
      end

      # The subnet isn't in the available state.

      class InvalidDBSubnetStateFault < ServiceError
      end

      # Someone else might be modifying a subscription. Wait a few seconds, and try again.

      class InvalidEventSubscriptionStateFault < ServiceError
      end

      # The requested operation can't be performed while the cluster is in this state.

      class InvalidGlobalClusterStateFault < ServiceError
      end

      # You cannot restore from a virtual private cloud (VPC) backup to a non-VPC DB instance.

      class InvalidRestoreFault < ServiceError
      end

      # The requested subnet is not valid, or multiple subnets were requested that are not all in a common
      # virtual private cloud (VPC).

      class InvalidSubnet < ServiceError
      end

      # The subnet group doesn't cover all Availability Zones after it is created because of changes that
      # were made.

      class InvalidVPCNetworkStateFault < ServiceError
      end

      # An error occurred when accessing an KMS key.

      class KMSKeyNotAccessibleFault < ServiceError
      end

      # The network type is not supported by either DBSubnetGroup or the DB engine version.

      class NetworkTypeNotSupported < ServiceError
      end

      # The specified resource ID was not found.

      class ResourceNotFoundFault < ServiceError
      end

      # Amazon SNS has responded that there is a problem with the specified topic.

      class SNSInvalidTopicFault < ServiceError
      end

      # You do not have permission to publish to the SNS topic Amazon Resource Name (ARN).

      class SNSNoAuthorizationFault < ServiceError
      end

      # The SNS topic Amazon Resource Name (ARN) does not exist.

      class SNSTopicArnNotFoundFault < ServiceError
      end

      # You have exceeded the maximum number of accounts that you can share a manual DB snapshot with.

      class SharedSnapshotQuotaExceededFault < ServiceError
      end

      # The request would cause you to exceed the allowed number of snapshots.

      class SnapshotQuotaExceededFault < ServiceError
      end

      # The requested source could not be found.

      class SourceNotFoundFault < ServiceError
      end

      # The request would cause you to exceed the allowed amount of storage available across all instances.

      class StorageQuotaExceededFault < ServiceError
      end

      # Storage of the specified StorageType can't be associated with the DB instance.

      class StorageTypeNotSupportedFault < ServiceError
      end

      # The subnet is already in use in the Availability Zone.

      class SubnetAlreadyInUse < ServiceError
      end

      # The provided subscription name already exists.

      class SubscriptionAlreadyExistFault < ServiceError
      end

      # The provided category does not exist.

      class SubscriptionCategoryNotFoundFault < ServiceError
      end

      # The subscription name does not exist.

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
        when "DBClusterNotFoundFault"
          DBClusterNotFoundFault.new(message)
        when "DBClusterParameterGroupNotFoundFault"
          DBClusterParameterGroupNotFoundFault.new(message)
        when "DBClusterQuotaExceededFault"
          DBClusterQuotaExceededFault.new(message)
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
        when "NetworkTypeNotSupported"
          NetworkTypeNotSupported.new(message)
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
