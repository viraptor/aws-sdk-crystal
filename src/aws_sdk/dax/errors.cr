module AwsSdk
  module DAX
    module Errors
      class ServiceError < Exception
      end

      # You already have a DAX cluster with the given identifier.

      class ClusterAlreadyExistsFault < ServiceError
      end

      # The requested cluster ID does not refer to an existing DAX cluster.

      class ClusterNotFoundFault < ServiceError
      end

      # You have attempted to exceed the maximum number of DAX clusters for your Amazon Web Services
      # account.

      class ClusterQuotaForCustomerExceededFault < ServiceError
      end

      # There are not enough system resources to create the cluster you requested (or to resize an
      # already-existing cluster).

      class InsufficientClusterCapacityFault < ServiceError
      end

      # The Amazon Resource Name (ARN) supplied in the request is not valid.

      class InvalidARNFault < ServiceError
      end

      # The requested DAX cluster is not in the available state.

      class InvalidClusterStateFault < ServiceError
      end

      # Two or more incompatible parameters were specified.

      class InvalidParameterCombinationException < ServiceError
      end

      # One or more parameters in a parameter group are in an invalid state.

      class InvalidParameterGroupStateFault < ServiceError
      end

      # The value for a parameter is invalid.

      class InvalidParameterValueException < ServiceError
      end

      # An invalid subnet identifier was specified.

      class InvalidSubnet < ServiceError
      end

      # The VPC network is in an invalid state.

      class InvalidVPCNetworkStateFault < ServiceError
      end

      # None of the nodes in the cluster have the given node ID.

      class NodeNotFoundFault < ServiceError
      end

      # You have attempted to exceed the maximum number of nodes for a DAX cluster.

      class NodeQuotaForClusterExceededFault < ServiceError
      end

      # You have attempted to exceed the maximum number of nodes for your Amazon Web Services account.

      class NodeQuotaForCustomerExceededFault < ServiceError
      end

      # The specified parameter group already exists.

      class ParameterGroupAlreadyExistsFault < ServiceError
      end

      # The specified parameter group does not exist.

      class ParameterGroupNotFoundFault < ServiceError
      end

      # You have attempted to exceed the maximum number of parameter groups.

      class ParameterGroupQuotaExceededFault < ServiceError
      end

      # The specified service linked role (SLR) was not found.

      class ServiceLinkedRoleNotFoundFault < ServiceError
      end

      # You have reached the maximum number of x509 certificates that can be created for encrypted clusters
      # in a 30 day period. Contact Amazon Web Services customer support to discuss options for continuing
      # to create encrypted clusters.

      class ServiceQuotaExceededException < ServiceError
      end

      # The specified subnet group already exists.

      class SubnetGroupAlreadyExistsFault < ServiceError
      end

      # The specified subnet group is currently in use.

      class SubnetGroupInUseFault < ServiceError
      end

      # The requested subnet group name does not refer to an existing subnet group.

      class SubnetGroupNotFoundFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of subnets in a subnet
      # group.

      class SubnetGroupQuotaExceededFault < ServiceError
      end

      # The requested subnet is being used by another subnet group.

      class SubnetInUse < ServiceError
      end

      # The specified subnet can't be used for the requested network type. This error occurs when either
      # there aren't enough subnets of the required network type to create the cluster, or when you try to
      # use a subnet that doesn't support the requested network type (for example, trying to create a
      # dual-stack cluster with a subnet that doesn't have IPv6 CIDR).

      class SubnetNotAllowedFault < ServiceError
      end

      # The request cannot be processed because it would exceed the allowed number of subnets in a subnet
      # group.

      class SubnetQuotaExceededFault < ServiceError
      end

      # The tag does not exist.

      class TagNotFoundFault < ServiceError
      end

      # You have exceeded the maximum number of tags for this DAX cluster.

      class TagQuotaPerResourceExceeded < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ClusterAlreadyExistsFault"
          ClusterAlreadyExistsFault.new(message)
        when "ClusterNotFoundFault"
          ClusterNotFoundFault.new(message)
        when "ClusterQuotaForCustomerExceededFault"
          ClusterQuotaForCustomerExceededFault.new(message)
        when "InsufficientClusterCapacityFault"
          InsufficientClusterCapacityFault.new(message)
        when "InvalidARNFault"
          InvalidARNFault.new(message)
        when "InvalidClusterStateFault"
          InvalidClusterStateFault.new(message)
        when "InvalidParameterCombinationException"
          InvalidParameterCombinationException.new(message)
        when "InvalidParameterGroupStateFault"
          InvalidParameterGroupStateFault.new(message)
        when "InvalidParameterValueException"
          InvalidParameterValueException.new(message)
        when "InvalidSubnet"
          InvalidSubnet.new(message)
        when "InvalidVPCNetworkStateFault"
          InvalidVPCNetworkStateFault.new(message)
        when "NodeNotFoundFault"
          NodeNotFoundFault.new(message)
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
        when "ServiceLinkedRoleNotFoundFault"
          ServiceLinkedRoleNotFoundFault.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
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
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
