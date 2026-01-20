module Aws
  module ElastiCache
    module Errors
      class ServiceError < Exception
      end

      # The customer has exceeded the allowed rate of API calls.

      class APICallRateForCustomerExceededFault < ServiceError
      end

      # The specified Amazon EC2 security group is already authorized for the specified cache security
      # group.

      class AuthorizationAlreadyExistsFault < ServiceError
      end

      # The specified Amazon EC2 security group is not authorized for the specified cache security group.

      class AuthorizationNotFoundFault < ServiceError
      end

      # You already have a cluster with the given identifier.

      class CacheClusterAlreadyExistsFault < ServiceError
      end

      # The requested cluster ID does not refer to an existing cluster.

      class CacheClusterNotFoundFault < ServiceError
      end

      # A cache parameter group with the requested name already exists.

      class CacheParameterGroupAlreadyExistsFault < ServiceError
      end

      # The requested cache parameter group name does not refer to an existing cache parameter group.

      class CacheParameterGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of cache security groups.

      class CacheParameterGroupQuotaExceededFault < ServiceError
      end

      # A cache security group with the specified name already exists.

      class CacheSecurityGroupAlreadyExistsFault < ServiceError
      end

      # The requested cache security group name does not refer to an existing cache security group.

      class CacheSecurityGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of cache security groups.

      class CacheSecurityGroupQuotaExceededFault < ServiceError
      end

      # The requested cache subnet group name is already in use by an existing cache subnet group.

      class CacheSubnetGroupAlreadyExistsFault < ServiceError
      end

      # The requested cache subnet group is currently in use.

      class CacheSubnetGroupInUse < ServiceError
      end

      # The requested cache subnet group name does not refer to an existing cache subnet group.

      class CacheSubnetGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of cache subnet groups.

      class CacheSubnetGroupQuotaExceededFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of subnets in a cache
      # subnet group.

      class CacheSubnetQuotaExceededFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of clusters per customer.

      class ClusterQuotaForCustomerExceededFault < ServiceError
      end

      # The default user assigned to the user group.

      class DefaultUserAssociatedToUserGroupFault < ServiceError
      end

      # You must add default user to a user group.

      class DefaultUserRequired < ServiceError
      end

      # A user with this username already exists.

      class DuplicateUserNameFault < ServiceError
      end

      # The Global datastore name already exists.

      class GlobalReplicationGroupAlreadyExistsFault < ServiceError
      end

      # The Global datastore does not exist

      class GlobalReplicationGroupNotFoundFault < ServiceError
      end

      # The requested cache node type is not available in the specified Availability Zone. For more
      # information, see InsufficientCacheClusterCapacity in the ElastiCache User Guide.

      class InsufficientCacheClusterCapacityFault < ServiceError
      end

      # The requested Amazon Resource Name (ARN) does not refer to an existing resource.

      class InvalidARNFault < ServiceError
      end

      # The requested cluster is not in the available state.

      class InvalidCacheClusterStateFault < ServiceError
      end

      # The current state of the cache parameter group does not allow the requested operation to occur.

      class InvalidCacheParameterGroupStateFault < ServiceError
      end

      # The current state of the cache security group does not allow deletion.

      class InvalidCacheSecurityGroupStateFault < ServiceError
      end

      # You must enter valid credentials.

      class InvalidCredentialsException < ServiceError
      end

      # The Global datastore is not available or in primary-only state.

      class InvalidGlobalReplicationGroupStateFault < ServiceError
      end

      # The KMS key supplied is not valid.

      class InvalidKMSKeyFault < ServiceError
      end

      # Two or more incompatible parameters were specified.

      class InvalidParameterCombinationException < ServiceError
      end

      # The value for a parameter is invalid.

      class InvalidParameterValueException < ServiceError
      end

      # The requested replication group is not in the available state.

      class InvalidReplicationGroupStateFault < ServiceError
      end

      # The state of the serverless cache snapshot was not received. Available for Valkey, Redis OSS and
      # Serverless Memcached only.

      class InvalidServerlessCacheSnapshotStateFault < ServiceError
      end

      # The account for these credentials is not currently active.

      class InvalidServerlessCacheStateFault < ServiceError
      end

      # The current state of the snapshot does not allow the requested operation to occur.

      class InvalidSnapshotStateFault < ServiceError
      end

      # An invalid subnet identifier was specified.

      class InvalidSubnet < ServiceError
      end

      # The user group is not in an active state.

      class InvalidUserGroupStateFault < ServiceError
      end

      # The user is not in active state.

      class InvalidUserStateFault < ServiceError
      end

      # The VPC network is in an invalid state.

      class InvalidVPCNetworkStateFault < ServiceError
      end

      # The operation was not performed because no changes were required.

      class NoOperationFault < ServiceError
      end

      # The node group specified by the NodeGroupId parameter could not be found. Please verify that the
      # node group exists and that you spelled the NodeGroupId value correctly.

      class NodeGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum allowed number of node groups
      # (shards) in a single replication group. The default maximum is 90

      class NodeGroupsPerReplicationGroupQuotaExceededFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of cache nodes in a
      # single cluster.

      class NodeQuotaForClusterExceededFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of cache nodes per
      # customer.

      class NodeQuotaForCustomerExceededFault < ServiceError
      end

      # The specified replication group already exists.

      class ReplicationGroupAlreadyExistsFault < ServiceError
      end

      # The targeted replication group is not available.

      class ReplicationGroupAlreadyUnderMigrationFault < ServiceError
      end

      # The specified replication group does not exist.

      class ReplicationGroupNotFoundFault < ServiceError
      end

      # The designated replication group is not available for data migration.

      class ReplicationGroupNotUnderMigrationFault < ServiceError
      end

      # You already have a reservation with the given identifier.

      class ReservedCacheNodeAlreadyExistsFault < ServiceError
      end

      # The requested reserved cache node was not found.

      class ReservedCacheNodeNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the user's cache node quota.

      class ReservedCacheNodeQuotaExceededFault < ServiceError
      end

      # The requested cache node offering does not exist.

      class ReservedCacheNodesOfferingNotFoundFault < ServiceError
      end

      # A serverless cache with this name already exists.

      class ServerlessCacheAlreadyExistsFault < ServiceError
      end

      # The serverless cache was not found or does not exist.

      class ServerlessCacheNotFoundFault < ServiceError
      end

      # The number of serverless caches exceeds the customer quota.

      class ServerlessCacheQuotaForCustomerExceededFault < ServiceError
      end

      # A serverless cache snapshot with this name already exists. Available for Valkey, Redis OSS and
      # Serverless Memcached only.

      class ServerlessCacheSnapshotAlreadyExistsFault < ServiceError
      end

      # This serverless cache snapshot could not be found or does not exist. Available for Valkey, Redis OSS
      # and Serverless Memcached only.

      class ServerlessCacheSnapshotNotFoundFault < ServiceError
      end

      # The number of serverless cache snapshots exceeds the customer snapshot quota. Available for Valkey,
      # Redis OSS and Serverless Memcached only.

      class ServerlessCacheSnapshotQuotaExceededFault < ServiceError
      end

      # The specified service linked role (SLR) was not found.

      class ServiceLinkedRoleNotFoundFault < ServiceError
      end

      # The service update doesn't exist

      class ServiceUpdateNotFoundFault < ServiceError
      end

      # You already have a snapshot with the given name.

      class SnapshotAlreadyExistsFault < ServiceError
      end

      # You attempted one of the following operations: Creating a snapshot of a Valkey or Redis OSS cluster
      # running on a cache.t1.micro cache node. Creating a snapshot of a cluster that is running Memcached
      # rather than Valkey or Redis OSS. Neither of these are supported by ElastiCache.

      class SnapshotFeatureNotSupportedFault < ServiceError
      end

      # The requested snapshot name does not refer to an existing snapshot.

      class SnapshotNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of snapshots.

      class SnapshotQuotaExceededFault < ServiceError
      end

      # The requested subnet is being used by another cache subnet group.

      class SubnetInUse < ServiceError
      end

      # At least one subnet ID does not match the other subnet IDs. This mismatch typically occurs when a
      # user sets one subnet ID to a regional Availability Zone and a different one to an outpost. Or when a
      # user sets the subnet ID to an Outpost when not subscribed on this service.

      class SubnetNotAllowedFault < ServiceError
      end

      # The requested tag was not found on this resource.

      class TagNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would cause the resource to have more than the allowed
      # number of tags. The maximum number of tags permitted on a resource is 50.

      class TagQuotaPerResourceExceeded < ServiceError
      end

      # The TestFailover action is not available.

      class TestFailoverNotAvailableFault < ServiceError
      end

      # A user with this ID already exists.

      class UserAlreadyExistsFault < ServiceError
      end

      # The user group with this ID already exists.

      class UserGroupAlreadyExistsFault < ServiceError
      end

      # The user group was not found or does not exist

      class UserGroupNotFoundFault < ServiceError
      end

      # The number of users exceeds the user group limit.

      class UserGroupQuotaExceededFault < ServiceError
      end

      # The user does not exist or could not be found.

      class UserNotFoundFault < ServiceError
      end

      # The quota of users has been exceeded.

      class UserQuotaExceededFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "APICallRateForCustomerExceededFault"
          APICallRateForCustomerExceededFault.new(message)
        when "AuthorizationAlreadyExistsFault"
          AuthorizationAlreadyExistsFault.new(message)
        when "AuthorizationNotFoundFault"
          AuthorizationNotFoundFault.new(message)
        when "CacheClusterAlreadyExistsFault"
          CacheClusterAlreadyExistsFault.new(message)
        when "CacheClusterNotFoundFault"
          CacheClusterNotFoundFault.new(message)
        when "CacheParameterGroupAlreadyExistsFault"
          CacheParameterGroupAlreadyExistsFault.new(message)
        when "CacheParameterGroupNotFoundFault"
          CacheParameterGroupNotFoundFault.new(message)
        when "CacheParameterGroupQuotaExceededFault"
          CacheParameterGroupQuotaExceededFault.new(message)
        when "CacheSecurityGroupAlreadyExistsFault"
          CacheSecurityGroupAlreadyExistsFault.new(message)
        when "CacheSecurityGroupNotFoundFault"
          CacheSecurityGroupNotFoundFault.new(message)
        when "CacheSecurityGroupQuotaExceededFault"
          CacheSecurityGroupQuotaExceededFault.new(message)
        when "CacheSubnetGroupAlreadyExistsFault"
          CacheSubnetGroupAlreadyExistsFault.new(message)
        when "CacheSubnetGroupInUse"
          CacheSubnetGroupInUse.new(message)
        when "CacheSubnetGroupNotFoundFault"
          CacheSubnetGroupNotFoundFault.new(message)
        when "CacheSubnetGroupQuotaExceededFault"
          CacheSubnetGroupQuotaExceededFault.new(message)
        when "CacheSubnetQuotaExceededFault"
          CacheSubnetQuotaExceededFault.new(message)
        when "ClusterQuotaForCustomerExceededFault"
          ClusterQuotaForCustomerExceededFault.new(message)
        when "DefaultUserAssociatedToUserGroupFault"
          DefaultUserAssociatedToUserGroupFault.new(message)
        when "DefaultUserRequired"
          DefaultUserRequired.new(message)
        when "DuplicateUserNameFault"
          DuplicateUserNameFault.new(message)
        when "GlobalReplicationGroupAlreadyExistsFault"
          GlobalReplicationGroupAlreadyExistsFault.new(message)
        when "GlobalReplicationGroupNotFoundFault"
          GlobalReplicationGroupNotFoundFault.new(message)
        when "InsufficientCacheClusterCapacityFault"
          InsufficientCacheClusterCapacityFault.new(message)
        when "InvalidARNFault"
          InvalidARNFault.new(message)
        when "InvalidCacheClusterStateFault"
          InvalidCacheClusterStateFault.new(message)
        when "InvalidCacheParameterGroupStateFault"
          InvalidCacheParameterGroupStateFault.new(message)
        when "InvalidCacheSecurityGroupStateFault"
          InvalidCacheSecurityGroupStateFault.new(message)
        when "InvalidCredentialsException"
          InvalidCredentialsException.new(message)
        when "InvalidGlobalReplicationGroupStateFault"
          InvalidGlobalReplicationGroupStateFault.new(message)
        when "InvalidKMSKeyFault"
          InvalidKMSKeyFault.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidReplicationGroupStateFault"
          InvalidReplicationGroupStateFault.new(message)
        when "InvalidServerlessCacheSnapshotStateFault"
          InvalidServerlessCacheSnapshotStateFault.new(message)
        when "InvalidServerlessCacheStateFault"
          InvalidServerlessCacheStateFault.new(message)
        when "InvalidSnapshotStateFault"
          InvalidSnapshotStateFault.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "InvalidUserGroupStateFault"
          InvalidUserGroupStateFault.new(message)
        when "InvalidUserStateFault"
          InvalidUserStateFault.new(message)
        when "InvalidVPCNetworkStateFault"
          InvalidVPCNetworkStateFault.new(message)
        when "NoOperationFault"
          NoOperationFault.new(message)
        when "NodeGroupNotFoundFault"
          NodeGroupNotFoundFault.new(message)
        when "NodeGroupsPerReplicationGroupQuotaExceededFault"
          NodeGroupsPerReplicationGroupQuotaExceededFault.new(message)
        when "NodeQuotaForClusterExceededFault"
          NodeQuotaForClusterExceededFault.new(message)
        when "NodeQuotaForCustomerExceededFault"
          NodeQuotaForCustomerExceededFault.new(message)
        when "ReplicationGroupAlreadyExistsFault"
          ReplicationGroupAlreadyExistsFault.new(message)
        when "ReplicationGroupAlreadyUnderMigrationFault"
          ReplicationGroupAlreadyUnderMigrationFault.new(message)
        when "ReplicationGroupNotFoundFault"
          ReplicationGroupNotFoundFault.new(message)
        when "ReplicationGroupNotUnderMigrationFault"
          ReplicationGroupNotUnderMigrationFault.new(message)
        when "ReservedCacheNodeAlreadyExistsFault"
          ReservedCacheNodeAlreadyExistsFault.new(message)
        when "ReservedCacheNodeNotFoundFault"
          ReservedCacheNodeNotFoundFault.new(message)
        when "ReservedCacheNodeQuotaExceededFault"
          ReservedCacheNodeQuotaExceededFault.new(message)
        when "ReservedCacheNodesOfferingNotFoundFault"
          ReservedCacheNodesOfferingNotFoundFault.new(message)
        when "ServerlessCacheAlreadyExistsFault"
          ServerlessCacheAlreadyExistsFault.new(message)
        when "ServerlessCacheNotFoundFault"
          ServerlessCacheNotFoundFault.new(message)
        when "ServerlessCacheQuotaForCustomerExceededFault"
          ServerlessCacheQuotaForCustomerExceededFault.new(message)
        when "ServerlessCacheSnapshotAlreadyExistsFault"
          ServerlessCacheSnapshotAlreadyExistsFault.new(message)
        when "ServerlessCacheSnapshotNotFoundFault"
          ServerlessCacheSnapshotNotFoundFault.new(message)
        when "ServerlessCacheSnapshotQuotaExceededFault"
          ServerlessCacheSnapshotQuotaExceededFault.new(message)
        when "ServiceLinkedRoleNotFoundFault"
          ServiceLinkedRoleNotFoundFault.new(message)
        when "ServiceUpdateNotFoundFault"
          ServiceUpdateNotFoundFault.new(message)
        when "SnapshotAlreadyExistsFault"
          SnapshotAlreadyExistsFault.new(message)
        when "SnapshotFeatureNotSupportedFault"
          SnapshotFeatureNotSupportedFault.new(message)
        when "SnapshotNotFoundFault"
          SnapshotNotFoundFault.new(message)
        when "SnapshotQuotaExceededFault"
          SnapshotQuotaExceededFault.new(message)
        when "SubnetInUse"
          SubnetInUse.new(message)
        when "SubnetNotAllowedFault"
          SubnetNotAllowedFault.new(message)
        when "TagNotFoundFault"
          TagNotFoundFault.new(message)
        when "TagQuotaPerResourceExceeded"
          TagQuotaPerResourceExceeded.new(message)
        when "TestFailoverNotAvailableFault"
          TestFailoverNotAvailableFault.new(message)
        when "UserAlreadyExistsFault"
          UserAlreadyExistsFault.new(message)
        when "UserGroupAlreadyExistsFault"
          UserGroupAlreadyExistsFault.new(message)
        when "UserGroupNotFoundFault"
          UserGroupNotFoundFault.new(message)
        when "UserGroupQuotaExceededFault"
          UserGroupQuotaExceededFault.new(message)
        when "UserNotFoundFault"
          UserNotFoundFault.new(message)
        when "UserQuotaExceededFault"
          UserQuotaExceededFault.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
