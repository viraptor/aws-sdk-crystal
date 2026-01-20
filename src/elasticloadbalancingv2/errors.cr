module Aws
  module ElasticLoadBalancingV2
    module Errors
      class ServiceError < Exception
      end

      # The specified ALPN policy is not supported.

      class ALPNPolicyNotSupportedException < ServiceError
      end

      # The specified allocation ID does not exist.

      class AllocationIdNotFoundException < ServiceError
      end

      # The specified Availability Zone is not supported.

      class AvailabilityZoneNotSupportedException < ServiceError
      end

      # The specified ca certificate bundle does not exist.

      class CaCertificatesBundleNotFoundException < ServiceError
      end

      # You've exceeded the daily capacity decrease limit for this reservation.

      class CapacityDecreaseRequestsLimitExceededException < ServiceError
      end

      # There is a pending capacity reservation.

      class CapacityReservationPendingException < ServiceError
      end

      # You've exceeded the capacity units limit.

      class CapacityUnitsLimitExceededException < ServiceError
      end

      # The specified certificate does not exist.

      class CertificateNotFoundException < ServiceError
      end

      # The specified association can't be within the same account.

      class DeleteAssociationSameAccountException < ServiceError
      end

      # A listener with the specified port already exists.

      class DuplicateListenerException < ServiceError
      end

      # A load balancer with the specified name already exists.

      class DuplicateLoadBalancerNameException < ServiceError
      end

      # A tag key was specified more than once.

      class DuplicateTagKeysException < ServiceError
      end

      # A target group with the specified name already exists.

      class DuplicateTargetGroupNameException < ServiceError
      end

      # A trust store with the specified name already exists.

      class DuplicateTrustStoreNameException < ServiceError
      end

      # The health of the specified targets could not be retrieved due to an internal error.

      class HealthUnavailableException < ServiceError
      end

      # The specified configuration is not valid with this protocol.

      class IncompatibleProtocolsException < ServiceError
      end

      # There is insufficient capacity to reserve.

      class InsufficientCapacityException < ServiceError
      end

      # The specified ca certificate bundle is in an invalid format, or corrupt.

      class InvalidCaCertificatesBundleException < ServiceError
      end

      # The requested configuration is not valid.

      class InvalidConfigurationRequestException < ServiceError
      end

      # The requested action is not valid.

      class InvalidLoadBalancerActionException < ServiceError
      end

      # The provided revocation file is an invalid format, or uses an incorrect algorithm.

      class InvalidRevocationContentException < ServiceError
      end

      # The requested scheme is not valid.

      class InvalidSchemeException < ServiceError
      end

      # The specified security group does not exist.

      class InvalidSecurityGroupException < ServiceError
      end

      # The specified subnet is out of available addresses.

      class InvalidSubnetException < ServiceError
      end

      # The specified target does not exist, is not in the same VPC as the target group, or has an
      # unsupported instance type.

      class InvalidTargetException < ServiceError
      end

      # The specified listener does not exist.

      class ListenerNotFoundException < ServiceError
      end

      # The specified load balancer does not exist.

      class LoadBalancerNotFoundException < ServiceError
      end

      # This operation is not allowed.

      class OperationNotPermittedException < ServiceError
      end

      # This operation is not allowed while a prior request has not been completed.

      class PriorRequestNotCompleteException < ServiceError
      end

      # The specified priority is in use.

      class PriorityInUseException < ServiceError
      end

      # A specified resource is in use.

      class ResourceInUseException < ServiceError
      end

      # The specified resource does not exist.

      class ResourceNotFoundException < ServiceError
      end

      # The specified revocation file does not exist.

      class RevocationContentNotFoundException < ServiceError
      end

      # The specified revocation ID does not exist.

      class RevocationIdNotFoundException < ServiceError
      end

      # The specified rule does not exist.

      class RuleNotFoundException < ServiceError
      end

      # The specified SSL policy does not exist.

      class SSLPolicyNotFoundException < ServiceError
      end

      # The specified subnet does not exist.

      class SubnetNotFoundException < ServiceError
      end

      # You've reached the limit on the number of load balancers per target group.

      class TargetGroupAssociationLimitException < ServiceError
      end

      # The specified target group does not exist.

      class TargetGroupNotFoundException < ServiceError
      end

      # You've reached the limit on the number of actions per rule.

      class TooManyActionsException < ServiceError
      end

      # You've reached the limit on the number of certificates per load balancer.

      class TooManyCertificatesException < ServiceError
      end

      # You've reached the limit on the number of listeners per load balancer.

      class TooManyListenersException < ServiceError
      end

      # You've reached the limit on the number of load balancers for your Amazon Web Services account.

      class TooManyLoadBalancersException < ServiceError
      end

      # You've reached the limit on the number of times a target can be registered with a load balancer.

      class TooManyRegistrationsForTargetIdException < ServiceError
      end

      # You've reached the limit on the number of rules per load balancer.

      class TooManyRulesException < ServiceError
      end

      # You've reached the limit on the number of tags for this resource.

      class TooManyTagsException < ServiceError
      end

      # You've reached the limit on the number of target groups for your Amazon Web Services account.

      class TooManyTargetGroupsException < ServiceError
      end

      # You've reached the limit on the number of targets.

      class TooManyTargetsException < ServiceError
      end

      # The specified trust store has too many revocation entries.

      class TooManyTrustStoreRevocationEntriesException < ServiceError
      end

      # You've reached the limit on the number of trust stores for your Amazon Web Services account.

      class TooManyTrustStoresException < ServiceError
      end

      # You've reached the limit on the number of unique target groups per load balancer across all
      # listeners. If a target group is used by multiple actions for a load balancer, it is counted as only
      # one use.

      class TooManyUniqueTargetGroupsPerLoadBalancerException < ServiceError
      end

      # The specified association does not exist.

      class TrustStoreAssociationNotFoundException < ServiceError
      end

      # The specified trust store is currently in use.

      class TrustStoreInUseException < ServiceError
      end

      # The specified trust store does not exist.

      class TrustStoreNotFoundException < ServiceError
      end

      # The specified trust store is not active.

      class TrustStoreNotReadyException < ServiceError
      end

      # The specified protocol is not supported.

      class UnsupportedProtocolException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "ALPNPolicyNotSupportedException"
          ALPNPolicyNotSupportedException.new(message)
        when "AllocationIdNotFoundException"
          AllocationIdNotFoundException.new(message)
        when "AvailabilityZoneNotSupportedException"
          AvailabilityZoneNotSupportedException.new(message)
        when "CaCertificatesBundleNotFoundException"
          CaCertificatesBundleNotFoundException.new(message)
        when "CapacityDecreaseRequestsLimitExceededException"
          CapacityDecreaseRequestsLimitExceededException.new(message)
        when "CapacityReservationPendingException"
          CapacityReservationPendingException.new(message)
        when "CapacityUnitsLimitExceededException"
          CapacityUnitsLimitExceededException.new(message)
        when "CertificateNotFoundException"
          CertificateNotFoundException.new(message)
        when "DeleteAssociationSameAccountException"
          DeleteAssociationSameAccountException.new(message)
        when "DuplicateListenerException"
          DuplicateListenerException.new(message)
        when "DuplicateLoadBalancerNameException"
          DuplicateLoadBalancerNameException.new(message)
        when "DuplicateTagKeysException"
          DuplicateTagKeysException.new(message)
        when "DuplicateTargetGroupNameException"
          DuplicateTargetGroupNameException.new(message)
        when "DuplicateTrustStoreNameException"
          DuplicateTrustStoreNameException.new(message)
        when "HealthUnavailableException"
          HealthUnavailableException.new(message)
        when "IncompatibleProtocolsException"
          IncompatibleProtocolsException.new(message)
        when "InsufficientCapacityException"
          InsufficientCapacityException.new(message)
        when "InvalidCaCertificatesBundleException"
          InvalidCaCertificatesBundleException.new(message)
        when "InvalidConfigurationRequestException"
          InvalidConfigurationRequestException.new(message)
        when "InvalidLoadBalancerActionException"
          InvalidLoadBalancerActionException.new(message)
        when "InvalidRevocationContentException"
          InvalidRevocationContentException.new(message)
        when "InvalidSchemeException"
          InvalidSchemeException.new(message)
        when "InvalidSecurityGroupException"
          InvalidSecurityGroupException.new(message)
        when "InvalidSubnetException"
          InvalidSubnetException.new(message)
        when "InvalidTargetException"
          InvalidTargetException.new(message)
        when "ListenerNotFoundException"
          ListenerNotFoundException.new(message)
        when "LoadBalancerNotFoundException"
          LoadBalancerNotFoundException.new(message)
        when "OperationNotPermittedException"
          OperationNotPermittedException.new(message)
        when "PriorRequestNotCompleteException"
          PriorRequestNotCompleteException.new(message)
        when "PriorityInUseException"
          PriorityInUseException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "RevocationContentNotFoundException"
          RevocationContentNotFoundException.new(message)
        when "RevocationIdNotFoundException"
          RevocationIdNotFoundException.new(message)
        when "RuleNotFoundException"
          RuleNotFoundException.new(message)
        when "SSLPolicyNotFoundException"
          SSLPolicyNotFoundException.new(message)
        when "SubnetNotFoundException"
          SubnetNotFoundException.new(message)
        when "TargetGroupAssociationLimitException"
          TargetGroupAssociationLimitException.new(message)
        when "TargetGroupNotFoundException"
          TargetGroupNotFoundException.new(message)
        when "TooManyActionsException"
          TooManyActionsException.new(message)
        when "TooManyCertificatesException"
          TooManyCertificatesException.new(message)
        when "TooManyListenersException"
          TooManyListenersException.new(message)
        when "TooManyLoadBalancersException"
          TooManyLoadBalancersException.new(message)
        when "TooManyRegistrationsForTargetIdException"
          TooManyRegistrationsForTargetIdException.new(message)
        when "TooManyRulesException"
          TooManyRulesException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "TooManyTargetGroupsException"
          TooManyTargetGroupsException.new(message)
        when "TooManyTargetsException"
          TooManyTargetsException.new(message)
        when "TooManyTrustStoreRevocationEntriesException"
          TooManyTrustStoreRevocationEntriesException.new(message)
        when "TooManyTrustStoresException"
          TooManyTrustStoresException.new(message)
        when "TooManyUniqueTargetGroupsPerLoadBalancerException"
          TooManyUniqueTargetGroupsPerLoadBalancerException.new(message)
        when "TrustStoreAssociationNotFoundException"
          TrustStoreAssociationNotFoundException.new(message)
        when "TrustStoreInUseException"
          TrustStoreInUseException.new(message)
        when "TrustStoreNotFoundException"
          TrustStoreNotFoundException.new(message)
        when "TrustStoreNotReadyException"
          TrustStoreNotReadyException.new(message)
        when "UnsupportedProtocolException"
          UnsupportedProtocolException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
