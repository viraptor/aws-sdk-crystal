module AwsSdk
  module EKS
    module Errors
      class ServiceError < Exception
      end

      # You don't have permissions to perform the requested operation. The IAM principal making the request
      # must have at least one IAM permissions policy attached that grants the required permissions. For
      # more information, see Access management in the IAM User Guide .
      class AccessDeniedException < ServiceError
      end

      # This exception is thrown if the request contains a semantic error. The precise meaning will depend
      # on the API, and will be documented in the error message.
      class BadRequestException < ServiceError
      end

      # These errors are usually caused by a client action. Actions can include using an action or resource
      # on behalf of an IAM principal that doesn't have permissions to use the action or resource or
      # specifying an identifier that is not valid.
      class ClientException < ServiceError
      end

      # The specified parameter is invalid. Review the available parameters for the API request.
      class InvalidParameterException < ServiceError
      end

      # The request is invalid given the state of the cluster. Check the state of the cluster and the
      # associated operations.
      class InvalidRequestException < ServiceError
      end

      # Amazon EKS detected upgrade readiness issues. Call the ListInsights API to view detected upgrade
      # blocking issues. Pass the force flag when updating to override upgrade readiness errors.
      class InvalidStateException < ServiceError
      end

      # A service resource associated with the request could not be found. Clients should not retry such
      # requests.
      class NotFoundException < ServiceError
      end

      # The specified resource is in use.
      class ResourceInUseException < ServiceError
      end

      # You have encountered a service limit on the specified resource.
      class ResourceLimitExceededException < ServiceError
      end

      # The specified resource could not be found. You can view your available clusters with ListClusters .
      # You can view your available managed node groups with ListNodegroups . Amazon EKS clusters and node
      # groups are Amazon Web Services Region specific.
      class ResourceNotFoundException < ServiceError
      end

      # Required resources (such as service-linked roles) were created and are still propagating. Retry
      # later.
      class ResourcePropagationDelayException < ServiceError
      end

      # These errors are usually caused by a server-side issue.
      class ServerException < ServiceError
      end

      # The service is unavailable. Back off and retry the operation.
      class ServiceUnavailableException < ServiceError
      end

      # The request or operation couldn't be performed because a service is throttling requests.
      class ThrottlingException < ServiceError
      end

      # At least one of your specified cluster subnets is in an Availability Zone that does not support
      # Amazon EKS. The exception output specifies the supported Availability Zones for your account, from
      # which you can choose subnets for your cluster.
      class UnsupportedAvailabilityZoneException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "BadRequestException"
          BadRequestException.new(message)
        when "ClientException"
          ClientException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "InvalidRequestException"
          InvalidRequestException.new(message)
        when "InvalidStateException"
          InvalidStateException.new(message)
        when "NotFoundException"
          NotFoundException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceLimitExceededException"
          ResourceLimitExceededException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ResourcePropagationDelayException"
          ResourcePropagationDelayException.new(message)
        when "ServerException"
          ServerException.new(message)
        when "ServiceUnavailableException"
          ServiceUnavailableException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "UnsupportedAvailabilityZoneException"
          UnsupportedAvailabilityZoneException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
