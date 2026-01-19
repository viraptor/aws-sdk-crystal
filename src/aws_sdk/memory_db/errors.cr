module AwsSdk
  module MemoryDB
    module Errors
      class ServiceError < Exception
      end

      # An ACL with the specified name already exists.
      class ACLAlreadyExistsFault < ServiceError
      end

      # The specified ACL does not exist.
      class ACLNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of ACLs allowed.
      class ACLQuotaExceededFault < ServiceError
      end

      # The customer has exceeded the maximum number of API requests allowed per time period.
      class APICallRateForCustomerExceededFault < ServiceError
      end

      # A cluster with the specified name already exists.
      class ClusterAlreadyExistsFault < ServiceError
      end

      # The specified cluster does not exist.
      class ClusterNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of clusters allowed for
      # this customer.
      class ClusterQuotaForCustomerExceededFault < ServiceError
      end

      # A default user is required and must be specified.
      class DefaultUserRequired < ServiceError
      end

      # A user with the specified name already exists.
      class DuplicateUserNameFault < ServiceError
      end

      # The cluster does not have sufficient capacity to perform the requested operation.
      class InsufficientClusterCapacityFault < ServiceError
      end

      # The ACL is not in a valid state for the requested operation.
      class InvalidACLStateFault < ServiceError
      end

      # The specified Amazon Resource Name (ARN) is not valid.
      class InvalidARNFault < ServiceError
      end

      # The cluster is not in a valid state for the requested operation.
      class InvalidClusterStateFault < ServiceError
      end

      # The provided credentials are not valid.
      class InvalidCredentialsException < ServiceError
      end

      # The specified KMS key is not valid or accessible.
      class InvalidKMSKeyFault < ServiceError
      end

      # The requested operation cannot be performed on the multi-Region cluster in its current state.
      class InvalidMultiRegionClusterStateFault < ServiceError
      end

      # The node is not in a valid state for the requested operation.
      class InvalidNodeStateFault < ServiceError
      end

      # The specified parameter combination is not valid.
      class InvalidParameterCombinationException < ServiceError
      end

      # The parameter group is not in a valid state for the requested operation.
      class InvalidParameterGroupStateFault < ServiceError
      end

      # The specified parameter value is not valid.
      class InvalidParameterValueException < ServiceError
      end

      # The snapshot is not in a valid state for the requested operation.
      class InvalidSnapshotStateFault < ServiceError
      end

      # The specified subnet is not valid.
      class InvalidSubnet < ServiceError
      end

      # The user is not in a valid state for the requested operation.
      class InvalidUserStateFault < ServiceError
      end

      # The VPC network is not in a valid state for the requested operation.
      class InvalidVPCNetworkStateFault < ServiceError
      end

      # A multi-Region cluster with the specified name already exists.
      class MultiRegionClusterAlreadyExistsFault < ServiceError
      end

      # The specified multi-Region cluster does not exist.
      class MultiRegionClusterNotFoundFault < ServiceError
      end

      # The specified multi-Region parameter group does not exist.
      class MultiRegionParameterGroupNotFoundFault < ServiceError
      end

      # The requested operation would result in no changes.
      class NoOperationFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of nodes allowed for this
      # cluster.
      class NodeQuotaForClusterExceededFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of nodes allowed for this
      # customer.
      class NodeQuotaForCustomerExceededFault < ServiceError
      end

      # A parameter group with the specified name already exists.
      class ParameterGroupAlreadyExistsFault < ServiceError
      end

      # The specified parameter group does not exist.
      class ParameterGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of parameter groups
      # allowed.
      class ParameterGroupQuotaExceededFault < ServiceError
      end

      # You already have a reservation with the given identifier.
      class ReservedNodeAlreadyExistsFault < ServiceError
      end

      # The requested node does not exist.
      class ReservedNodeNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the user's node quota.
      class ReservedNodeQuotaExceededFault < ServiceError
      end

      # The requested node offering does not exist.
      class ReservedNodesOfferingNotFoundFault < ServiceError
      end

      # The required service-linked role was not found.
      class ServiceLinkedRoleNotFoundFault < ServiceError
      end

      # The specified service update does not exist.
      class ServiceUpdateNotFoundFault < ServiceError
      end

      # The specified shard does not exist.
      class ShardNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of shards allowed per
      # cluster.
      class ShardsPerClusterQuotaExceededFault < ServiceError
      end

      # A snapshot with the specified name already exists.
      class SnapshotAlreadyExistsFault < ServiceError
      end

      # The specified snapshot does not exist.
      class SnapshotNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of snapshots allowed.
      class SnapshotQuotaExceededFault < ServiceError
      end

      # A subnet group with the specified name already exists.
      class SubnetGroupAlreadyExistsFault < ServiceError
      end

      # The subnet group is currently in use and cannot be deleted.
      class SubnetGroupInUseFault < ServiceError
      end

      # The specified subnet group does not exist.
      class SubnetGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of subnet groups allowed.
      class SubnetGroupQuotaExceededFault < ServiceError
      end

      # The subnet is currently in use and cannot be deleted.
      class SubnetInUse < ServiceError
      end

      # The specified subnet is not allowed for this operation.
      class SubnetNotAllowedFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of subnets allowed.
      class SubnetQuotaExceededFault < ServiceError
      end

      # The specified tag does not exist.
      class TagNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of tags allowed per
      # resource.
      class TagQuotaPerResourceExceeded < ServiceError
      end

      # Test failover is not available for this cluster configuration.
      class TestFailoverNotAvailableFault < ServiceError
      end

      # A user with the specified name already exists.
      class UserAlreadyExistsFault < ServiceError
      end

      # The specified user does not exist.
      class UserNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the maximum number of users allowed.
      class UserQuotaExceededFault < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ACLAlreadyExistsFault"
          ACLAlreadyExistsFault.new(message)
        when "ACLNotFoundFault"
          ACLNotFoundFault.new(message)
        when "ACLQuotaExceededFault"
          ACLQuotaExceededFault.new(message)
        when "APICallRateForCustomerExceededFault"
          APICallRateForCustomerExceededFault.new(message)
        when "ClusterAlreadyExistsFault"
          ClusterAlreadyExistsFault.new(message)
        when "ClusterNotFoundFault"
          ClusterNotFoundFault.new(message)
        when "ClusterQuotaForCustomerExceededFault"
          ClusterQuotaForCustomerExceededFault.new(message)
        when "DefaultUserRequired"
          DefaultUserRequired.new(message)
        when "DuplicateUserNameFault"
          DuplicateUserNameFault.new(message)
        when "InsufficientClusterCapacityFault"
          InsufficientClusterCapacityFault.new(message)
        when "InvalidACLStateFault"
          InvalidACLStateFault.new(message)
        when "InvalidARNFault"
          InvalidARNFault.new(message)
        when "InvalidClusterStateFault"
          InvalidClusterStateFault.new(message)
        when "InvalidCredentialsException"
          InvalidCredentialsException.new(message)
        when "InvalidKMSKeyFault"
          InvalidKMSKeyFault.new(message)
        when "InvalidMultiRegionClusterStateFault"
          InvalidMultiRegionClusterStateFault.new(message)
        when "InvalidNodeStateFault"
          InvalidNodeStateFault.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidParameterGroupStateFault"
          InvalidParameterGroupStateFault.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidSnapshotStateFault"
          InvalidSnapshotStateFault.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "InvalidUserStateFault"
          InvalidUserStateFault.new(message)
        when "InvalidVPCNetworkStateFault"
          InvalidVPCNetworkStateFault.new(message)
        when "MultiRegionClusterAlreadyExistsFault"
          MultiRegionClusterAlreadyExistsFault.new(message)
        when "MultiRegionClusterNotFoundFault"
          MultiRegionClusterNotFoundFault.new(message)
        when "MultiRegionParameterGroupNotFoundFault"
          MultiRegionParameterGroupNotFoundFault.new(message)
        when "NoOperationFault"
          NoOperationFault.new(message)
        when "NodeQuotaForClusterExceededFault"
          NodeQuotaForClusterExceededFault.new(message)
        when "NodeQuotaForCustomerExceededFault"
          NodeQuotaForCustomerExceededFault.new(message)
        when "ParameterGroupAlreadyExistsFault"
          ParameterGroupAlreadyExistsFault.new(message)
        when "ParameterGroupNotFoundFault"
          ParameterGroupNotFoundFault.new(message)
        when "ParameterGroupQuotaExceededFault"
          ParameterGroupQuotaExceededFault.new(message)
        when "ReservedNodeAlreadyExistsFault"
          ReservedNodeAlreadyExistsFault.new(message)
        when "ReservedNodeNotFoundFault"
          ReservedNodeNotFoundFault.new(message)
        when "ReservedNodeQuotaExceededFault"
          ReservedNodeQuotaExceededFault.new(message)
        when "ReservedNodesOfferingNotFoundFault"
          ReservedNodesOfferingNotFoundFault.new(message)
        when "ServiceLinkedRoleNotFoundFault"
          ServiceLinkedRoleNotFoundFault.new(message)
        when "ServiceUpdateNotFoundFault"
          ServiceUpdateNotFoundFault.new(message)
        when "ShardNotFoundFault"
          ShardNotFoundFault.new(message)
        when "ShardsPerClusterQuotaExceededFault"
          ShardsPerClusterQuotaExceededFault.new(message)
        when "SnapshotAlreadyExistsFault"
          SnapshotAlreadyExistsFault.new(message)
        when "SnapshotNotFoundFault"
          SnapshotNotFoundFault.new(message)
        when "SnapshotQuotaExceededFault"
          SnapshotQuotaExceededFault.new(message)
        when "SubnetGroupAlreadyExistsFault"
          SubnetGroupAlreadyExistsFault.new(message)
        when "SubnetGroupInUseFault"
          SubnetGroupInUseFault.new(message)
        when "SubnetGroupNotFoundFault"
          SubnetGroupNotFoundFault.new(message)
        when "SubnetGroupQuotaExceededFault"
          SubnetGroupQuotaExceededFault.new(message)
        when "SubnetInUse"
          SubnetInUse.new(message)
        when "SubnetNotAllowedFault"
          SubnetNotAllowedFault.new(message)
        when "SubnetQuotaExceededFault"
          SubnetQuotaExceededFault.new(message)
        when "TagNotFoundFault"
          TagNotFoundFault.new(message)
        when "TagQuotaPerResourceExceeded"
          TagQuotaPerResourceExceeded.new(message)
        when "TestFailoverNotAvailableFault"
          TestFailoverNotAvailableFault.new(message)
        when "UserAlreadyExistsFault"
          UserAlreadyExistsFault.new(message)
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
