module Aws
  module EFS
    module Errors
      class ServiceError < Exception
      end

      # Returned if the access point that you are trying to create already exists, with the creation token
      # you provided in the request.

      class AccessPointAlreadyExists < ServiceError
      end

      # Returned if the Amazon Web Services account has already created the maximum number of access points
      # allowed per file system. For more informaton, see
      # https://docs.aws.amazon.com/efs/latest/ug/limits.html#limits-efs-resources-per-account-per-region .

      class AccessPointLimitExceeded < ServiceError
      end

      # Returned if the specified AccessPointId value doesn't exist in the requester's Amazon Web Services
      # account.

      class AccessPointNotFound < ServiceError
      end

      # Returned if the Availability Zone that was specified for a mount target is different from the
      # Availability Zone that was specified for One Zone storage. For more information, see Regional and
      # One Zone storage redundancy .

      class AvailabilityZonesMismatch < ServiceError
      end

      # Returned if the request is malformed or contains an error such as an invalid parameter value or a
      # missing required parameter.

      class BadRequest < ServiceError
      end

      # Returned if the source file system in a replication is encrypted but the destination file system is
      # unencrypted.

      class ConflictException < ServiceError
      end

      # The service timed out trying to fulfill the request, and the client should try the call again.

      class DependencyTimeout < ServiceError
      end

      # Returned if the file system you are trying to create already exists, with the creation token you
      # provided.

      class FileSystemAlreadyExists < ServiceError
      end

      # Returned if a file system has mount targets.

      class FileSystemInUse < ServiceError
      end

      # Returned if the Amazon Web Services account has already created the maximum number of file systems
      # allowed per account.

      class FileSystemLimitExceeded < ServiceError
      end

      # Returned if the specified FileSystemId value doesn't exist in the requester's Amazon Web Services
      # account.

      class FileSystemNotFound < ServiceError
      end

      # Returned if the file system's lifecycle state is not "available".

      class IncorrectFileSystemLifeCycleState < ServiceError
      end

      # Returned if the mount target is not in the correct state for the operation.

      class IncorrectMountTargetState < ServiceError
      end

      # Returned if there's not enough capacity to provision additional throughput. This value might be
      # returned when you try to create a file system in provisioned throughput mode, when you attempt to
      # increase the provisioned throughput of an existing file system, or when you attempt to change an
      # existing file system from Bursting Throughput to Provisioned Throughput mode. Try again later.

      class InsufficientThroughputCapacity < ServiceError
      end

      # Returned if an error occurred on the server side.

      class InternalServerError < ServiceError
      end

      # Returned if the FileSystemPolicy is malformed or contains an error such as a parameter value that is
      # not valid or a missing required parameter. Returned in the case of a policy lockout safety check
      # error.

      class InvalidPolicyException < ServiceError
      end

      # Returned if the request specified an IpAddress that is already in use in the subnet.

      class IpAddressInUse < ServiceError
      end

      # Returned if the mount target would violate one of the specified restrictions based on the file
      # system's existing mount targets.

      class MountTargetConflict < ServiceError
      end

      # Returned if there is no mount target with the specified ID found in the caller's Amazon Web Services
      # account.

      class MountTargetNotFound < ServiceError
      end

      # The calling account has reached the limit for elastic network interfaces for the specific Amazon Web
      # Services Region. Either delete some network interfaces or request that the account quota be raised.
      # For more information, see Amazon VPC Quotas in the Amazon VPC User Guide (see the Network interfaces
      # per Region entry in the Network interfaces table).

      class NetworkInterfaceLimitExceeded < ServiceError
      end

      # Returned if IpAddress was not specified in the request and there are no free IP addresses in the
      # subnet.

      class NoFreeAddressesInSubnet < ServiceError
      end

      # Returned if no backup is specified for a One Zone EFS file system.

      class PolicyNotFound < ServiceError
      end

      # Returned if the file system is already included in a replication configuration.&gt;

      class ReplicationAlreadyExists < ServiceError
      end

      # Returned if the specified file system does not have a replication configuration.

      class ReplicationNotFound < ServiceError
      end

      # Returned if the number of SecurityGroups specified in the request is greater than the limit, which
      # is based on account quota. Either delete some security groups or request that the account quota be
      # raised. For more information, see Amazon VPC Quotas in the Amazon VPC User Guide (see the Security
      # Groups table).

      class SecurityGroupLimitExceeded < ServiceError
      end

      # Returned if one of the specified security groups doesn't exist in the subnet's virtual private cloud
      # (VPC).

      class SecurityGroupNotFound < ServiceError
      end

      # Returned if there is no subnet with ID SubnetId provided in the request.

      class SubnetNotFound < ServiceError
      end

      # Returned when the CreateAccessPoint API action is called too quickly and the number of Access Points
      # on the file system is nearing the limit of 120 .

      class ThrottlingException < ServiceError
      end

      # Returned if the throughput mode or amount of provisioned throughput can't be changed because the
      # throughput limit of 1024 MiB/s has been reached.

      class ThroughputLimitExceeded < ServiceError
      end

      # Returned if you don’t wait at least 24 hours before either changing the throughput mode, or
      # decreasing the Provisioned Throughput value.

      class TooManyRequests < ServiceError
      end

      # Returned if the requested Amazon EFS functionality is not available in the specified Availability
      # Zone.

      class UnsupportedAvailabilityZone < ServiceError
      end

      # Returned if the Backup service is not available in the Amazon Web Services Region in which the
      # request was made.

      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessPointAlreadyExists"
          AccessPointAlreadyExists.new(message)
        when "AccessPointLimitExceeded"
          AccessPointLimitExceeded.new(message)
        when "AccessPointNotFound"
          AccessPointNotFound.new(message)
        when "AvailabilityZonesMismatch"
          AvailabilityZonesMismatch.new(message)
        when "BadRequest"
          BadRequest.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "DependencyTimeout"
          DependencyTimeout.new(message)
        when "FileSystemAlreadyExists"
          FileSystemAlreadyExists.new(message)
        when "FileSystemInUse"
          FileSystemInUse.new(message)
        when "FileSystemLimitExceeded"
          FileSystemLimitExceeded.new(message)
        when "FileSystemNotFound"
          FileSystemNotFound.new(message)
        when "IncorrectFileSystemLifeCycleState"
          IncorrectFileSystemLifeCycleState.new(message)
        when "IncorrectMountTargetState"
          IncorrectMountTargetState.new(message)
        when "InsufficientThroughputCapacity"
          InsufficientThroughputCapacity.new(message)
        when "InternalServerError"
          InternalServerError.new(message)
        when "InvalidPolicyException"
          InvalidPolicyException.new(message)
        when "IpAddressInUse"
          IpAddressInUse.new(message)
        when "MountTargetConflict"
          MountTargetConflict.new(message)
        when "MountTargetNotFound"
          MountTargetNotFound.new(message)
        when "NetworkInterfaceLimitExceeded"
          NetworkInterfaceLimitExceeded.new(message)
        when "NoFreeAddressesInSubnet"
          NoFreeAddressesInSubnet.new(message)
        when "PolicyNotFound"
          PolicyNotFound.new(message)
        when "ReplicationAlreadyExists"
          ReplicationAlreadyExists.new(message)
        when "ReplicationNotFound"
          ReplicationNotFound.new(message)
        when "SecurityGroupLimitExceeded"
          SecurityGroupLimitExceeded.new(message)
        when "SecurityGroupNotFound"
          SecurityGroupNotFound.new(message)
        when "SubnetNotFound"
          SubnetNotFound.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ThroughputLimitExceeded"
          ThroughputLimitExceeded.new(message)
        when "TooManyRequests"
          TooManyRequests.new(message)
        when "UnsupportedAvailabilityZone"
          UnsupportedAvailabilityZone.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
