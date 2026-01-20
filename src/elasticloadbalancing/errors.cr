module Aws
  module ElasticLoadBalancing
    module Errors
      class ServiceError < Exception
      end

      # The specified load balancer does not exist.

      class AccessPointNotFoundException < ServiceError
      end

      # The specified ARN does not refer to a valid SSL certificate in AWS Identity and Access Management
      # (IAM) or AWS Certificate Manager (ACM). Note that if you recently uploaded the certificate to IAM,
      # this error might indicate that the certificate is not fully available yet.

      class CertificateNotFoundException < ServiceError
      end

      # A request made by Elastic Load Balancing to another service exceeds the maximum request rate
      # permitted for your account.

      class DependencyThrottleException < ServiceError
      end

      # The specified load balancer name already exists for this account.

      class DuplicateAccessPointNameException < ServiceError
      end

      # A listener already exists for the specified load balancer name and port, but with a different
      # instance port, protocol, or SSL certificate.

      class DuplicateListenerException < ServiceError
      end

      # A policy with the specified name already exists for this load balancer.

      class DuplicatePolicyNameException < ServiceError
      end

      # A tag key was specified more than once.

      class DuplicateTagKeysException < ServiceError
      end

      # The requested configuration change is not valid.

      class InvalidConfigurationRequestException < ServiceError
      end

      # The specified endpoint is not valid.

      class InvalidEndPointException < ServiceError
      end

      # The specified value for the schema is not valid. You can only specify a scheme for load balancers in
      # a VPC.

      class InvalidSchemeException < ServiceError
      end

      # One or more of the specified security groups do not exist.

      class InvalidSecurityGroupException < ServiceError
      end

      # The specified VPC has no associated Internet gateway.

      class InvalidSubnetException < ServiceError
      end

      # The load balancer does not have a listener configured at the specified port.

      class ListenerNotFoundException < ServiceError
      end

      # The specified load balancer attribute does not exist.

      class LoadBalancerAttributeNotFoundException < ServiceError
      end

      # This operation is not allowed.

      class OperationNotPermittedException < ServiceError
      end

      # One or more of the specified policies do not exist.

      class PolicyNotFoundException < ServiceError
      end

      # One or more of the specified policy types do not exist.

      class PolicyTypeNotFoundException < ServiceError
      end

      # One or more of the specified subnets do not exist.

      class SubnetNotFoundException < ServiceError
      end

      # The quota for the number of load balancers has been reached.

      class TooManyAccessPointsException < ServiceError
      end

      # The quota for the number of policies for this load balancer has been reached.

      class TooManyPoliciesException < ServiceError
      end

      # The quota for the number of tags that can be assigned to a load balancer has been reached.

      class TooManyTagsException < ServiceError
      end

      # The specified protocol or signature version is not supported.

      class UnsupportedProtocolException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessPointNotFoundException"
          AccessPointNotFoundException.new(message)
        when "CertificateNotFoundException"
          CertificateNotFoundException.new(message)
        when "DependencyThrottleException"
          DependencyThrottleException.new(message)
        when "DuplicateAccessPointNameException"
          DuplicateAccessPointNameException.new(message)
        when "DuplicateListenerException"
          DuplicateListenerException.new(message)
        when "DuplicatePolicyNameException"
          DuplicatePolicyNameException.new(message)
        when "DuplicateTagKeysException"
          DuplicateTagKeysException.new(message)
        when "InvalidConfigurationRequestException"
          InvalidConfigurationRequestException.new(message)
        when "InvalidEndPointException"
          InvalidEndPointException.new(message)
        when "InvalidSchemeException"
          InvalidSchemeException.new(message)
        when "InvalidSecurityGroupException"
          InvalidSecurityGroupException.new(message)
        when "InvalidSubnetException"
          InvalidSubnetException.new(message)
        when "ListenerNotFoundException"
          ListenerNotFoundException.new(message)
        when "LoadBalancerAttributeNotFoundException"
          LoadBalancerAttributeNotFoundException.new(message)
        when "OperationNotPermittedException"
          OperationNotPermittedException.new(message)
        when "PolicyNotFoundException"
          PolicyNotFoundException.new(message)
        when "PolicyTypeNotFoundException"
          PolicyTypeNotFoundException.new(message)
        when "SubnetNotFoundException"
          SubnetNotFoundException.new(message)
        when "TooManyAccessPointsException"
          TooManyAccessPointsException.new(message)
        when "TooManyPoliciesException"
          TooManyPoliciesException.new(message)
        when "TooManyTagsException"
          TooManyTagsException.new(message)
        when "UnsupportedProtocolException"
          UnsupportedProtocolException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
