module AwsSdk
  module ECS
    module Errors
      class ServiceError < Exception
      end

      # You don't have authorization to perform the requested action.

      class AccessDeniedException < ServiceError
      end

      # You can apply up to 10 custom attributes for each resource. You can view the attributes of a
      # resource with ListAttributes . You can remove existing attributes on a resource with
      # DeleteAttributes .

      class AttributeLimitExceededException < ServiceError
      end

      # Your Amazon Web Services account was blocked. For more information, contact Amazon Web Services
      # Support .

      class BlockedException < ServiceError
      end

      # These errors are usually caused by a client action. This client action might be using an action or
      # resource on behalf of a user that doesn't have permissions to use the action or resource. Or, it
      # might be specifying an identifier that isn't valid.

      class ClientException < ServiceError
      end

      # The cluster contains one or more capacity providers that prevent the requested operation. This
      # exception occurs when you try to delete a cluster that still has active capacity providers,
      # including Amazon ECS Managed Instances capacity providers. You must first delete all capacity
      # providers from the cluster before you can delete the cluster itself.

      class ClusterContainsCapacityProviderException < ServiceError
      end

      # You can't delete a cluster that has registered container instances. First, deregister the container
      # instances before you can delete the cluster. For more information, see DeregisterContainerInstance .

      class ClusterContainsContainerInstancesException < ServiceError
      end

      # You can't delete a cluster that contains services. First, update the service to reduce its desired
      # task count to 0, and then delete the service. For more information, see UpdateService and
      # DeleteService .

      class ClusterContainsServicesException < ServiceError
      end

      # You can't delete a cluster that has active tasks.

      class ClusterContainsTasksException < ServiceError
      end

      # The specified cluster wasn't found. You can view your available clusters with ListClusters . Amazon
      # ECS clusters are Region specific.

      class ClusterNotFoundException < ServiceError
      end

      # The request could not be processed because of conflict in the current state of the resource.

      class ConflictException < ServiceError
      end

      # The specified parameter isn't valid. Review the available parameters for the API request. For more
      # information about service event errors, see Amazon ECS service event messages .

      class InvalidParameterException < ServiceError
      end

      # The limit for the resource was exceeded.

      class LimitExceededException < ServiceError
      end

      # Amazon ECS can't determine the current version of the Amazon ECS container agent on the container
      # instance and doesn't have enough information to proceed with an update. This could be because the
      # agent running on the container instance is a previous or custom version that doesn't use our version
      # information.

      class MissingVersionException < ServiceError
      end

      # The specified namespace wasn't found.

      class NamespaceNotFoundException < ServiceError
      end

      # There's no update available for this Amazon ECS container agent. This might be because the agent is
      # already running the latest version or because it's so old that there's no update path to the current
      # version.

      class NoUpdateAvailableException < ServiceError
      end

      # The specified platform version doesn't satisfy the required capabilities of the task definition.

      class PlatformTaskDefinitionIncompatibilityException < ServiceError
      end

      # The specified platform version doesn't exist.

      class PlatformUnknownException < ServiceError
      end

      # The specified resource is in-use and can't be removed.

      class ResourceInUseException < ServiceError
      end

      # The specified resource wasn't found.

      class ResourceNotFoundException < ServiceError
      end

      # These errors are usually caused by a server issue.

      class ServerException < ServiceError
      end

      # The service deploy ARN that you specified in the StopServiceDeployment doesn't exist. You can use
      # ListServiceDeployments to retrieve the service deployment ARNs.

      class ServiceDeploymentNotFoundException < ServiceError
      end

      # The specified service isn't active. You can't update a service that's inactive. If you have
      # previously deleted a service, you can re-create it with CreateService .

      class ServiceNotActiveException < ServiceError
      end

      # The specified service wasn't found. You can view your available services with ListServices . Amazon
      # ECS services are cluster specific and Region specific.

      class ServiceNotFoundException < ServiceError
      end

      # The execute command cannot run. This error can be caused by any of the following configuration
      # issues: Incorrect IAM permissions The SSM agent is not installed or is not running There is an
      # interface Amazon VPC endpoint for Amazon ECS, but there is not one for Systems Manager Session
      # Manager For information about how to troubleshoot the issues, see Troubleshooting issues with ECS
      # Exec in the Amazon Elastic Container Service Developer Guide .

      class TargetNotConnectedException < ServiceError
      end

      # The specified target wasn't found. You can view your available container instances with
      # ListContainerInstances . Amazon ECS container instances are cluster-specific and Region-specific.

      class TargetNotFoundException < ServiceError
      end

      # The specified task set wasn't found. You can view your available task sets with DescribeTaskSets .
      # Task sets are specific to each cluster, service and Region.

      class TaskSetNotFoundException < ServiceError
      end

      # The specified task isn't supported in this Region.

      class UnsupportedFeatureException < ServiceError
      end

      # There's already a current Amazon ECS container agent update in progress on the container instance
      # that's specified. If the container agent becomes disconnected while it's in a transitional stage,
      # such as PENDING or STAGING , the update process can get stuck in that state. However, when the agent
      # reconnects, it resumes where it stopped previously.

      class UpdateInProgressException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AccessDeniedException"
          AccessDeniedException.new(message)
        when "AttributeLimitExceededException"
          AttributeLimitExceededException.new(message)
        when "BlockedException"
          BlockedException.new(message)
        when "ClientException"
          ClientException.new(message)
        when "ClusterContainsCapacityProviderException"
          ClusterContainsCapacityProviderException.new(message)
        when "ClusterContainsContainerInstancesException"
          ClusterContainsContainerInstancesException.new(message)
        when "ClusterContainsServicesException"
          ClusterContainsServicesException.new(message)
        when "ClusterContainsTasksException"
          ClusterContainsTasksException.new(message)
        when "ClusterNotFoundException"
          ClusterNotFoundException.new(message)
        when "ConflictException"
          ConflictException.new(message)
        when "InvalidParameterException"
          InvalidParameterException.new(message)
        when "LimitExceededException"
          LimitExceededException.new(message)
        when "MissingVersionException"
          MissingVersionException.new(message)
        when "NamespaceNotFoundException"
          NamespaceNotFoundException.new(message)
        when "NoUpdateAvailableException"
          NoUpdateAvailableException.new(message)
        when "PlatformTaskDefinitionIncompatibilityException"
          PlatformTaskDefinitionIncompatibilityException.new(message)
        when "PlatformUnknownException"
          PlatformUnknownException.new(message)
        when "ResourceInUseException"
          ResourceInUseException.new(message)
        when "ResourceNotFoundException"
          ResourceNotFoundException.new(message)
        when "ServerException"
          ServerException.new(message)
        when "ServiceDeploymentNotFoundException"
          ServiceDeploymentNotFoundException.new(message)
        when "ServiceNotActiveException"
          ServiceNotActiveException.new(message)
        when "ServiceNotFoundException"
          ServiceNotFoundException.new(message)
        when "TargetNotConnectedException"
          TargetNotConnectedException.new(message)
        when "TargetNotFoundException"
          TargetNotFoundException.new(message)
        when "TaskSetNotFoundException"
          TaskSetNotFoundException.new(message)
        when "UnsupportedFeatureException"
          UnsupportedFeatureException.new(message)
        when "UpdateInProgressException"
          UpdateInProgressException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
