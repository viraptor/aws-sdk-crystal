module AwsSdk
  module PCS
    module Errors
      class ServiceError < Exception
      end

      # You don't have permission to perform the action. Examples The launch template instance profile
      # doesn't pass iam:PassRole verification. There is a mismatch between the account ID and cluster ID.
      # The cluster ID doesn't exist. The EC2 instance isn't present.
      class AccessDeniedException < ServiceError
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than 1
      # operation on the same resource at the same time. Examples A cluster with the same name already
      # exists. A cluster isn't in ACTIVE status. A cluster to delete is in an unstable state. For example,
      # because it still has ACTIVE node groups or queues. A queue already exists in a cluster.
      class ConflictException < ServiceError
      end

      # PCS can't process your request right now. Try again later.
      class InternalServerException < ServiceError
      end

      # The requested resource can't be found. The cluster, node group, or queue you're attempting to get,
      # update, list, or delete doesn't exist. Examples
      class ResourceNotFoundException < ServiceError
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your Amazon Web Services account. To learn how to increase
      # your service quota, see Requesting a quota increase in the Service Quotas User Guide Examples The
      # max number of clusters or queues has been reached for the account. The max number of compute node
      # groups has been reached for the associated cluster. The total of maxInstances across all compute
      # node groups has been reached for associated cluster.
      class ServiceQuotaExceededException < ServiceError
      end

      # Your request exceeded a request rate quota. Check the resource's request rate quota and try again.
      class ThrottlingException < ServiceError
      end

      # The request isn't valid. Examples Your request contains malformed JSON or unsupported characters.
      # The scheduler version isn't supported. There are networking related errors, such as network
      # validation failure. AMI type is CUSTOM and the launch template doesn't define the AMI ID, or the AMI
      # type is AL2 and the launch template defines the AMI.
      class ValidationException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InternalServerException"
          InternalServerException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServiceQuotaExceededException"
          ServiceQuotaExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "ValidationException"
          ValidationException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
