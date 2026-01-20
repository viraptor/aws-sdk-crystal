module AwsSdk
  module CodeDeploy
    module Errors
      class ServiceError < Exception
      end

      # The maximum number of alarms for a deployment group (10) was exceeded.

      class AlarmsLimitExceededException < ServiceError
      end

      # An application with the specified name with the user or Amazon Web Services account already exists.

      class ApplicationAlreadyExistsException < ServiceError
      end

      # The application does not exist with the user or Amazon Web Services account.

      class ApplicationDoesNotExistException < ServiceError
      end

      # More applications were attempted to be created than are allowed.

      class ApplicationLimitExceededException < ServiceError
      end

      # The minimum number of required application names was not specified.

      class ApplicationNameRequiredException < ServiceError
      end

      # The specified ARN is not supported. For example, it might be an ARN for a resource that is not
      # expected.

      class ArnNotSupportedException < ServiceError
      end

      # The maximum number of names or IDs allowed for this request (100) was exceeded.

      class BatchLimitExceededException < ServiceError
      end

      # A bucket name is required, but was not provided.

      class BucketNameFilterRequiredException < ServiceError
      end

      # The deployment is already complete.

      class DeploymentAlreadyCompletedException < ServiceError
      end

      # A deployment to a target was attempted while another deployment was in progress.

      class DeploymentAlreadyStartedException < ServiceError
      end

      # A deployment configuration with the specified name with the user or Amazon Web Services account
      # already exists.

      class DeploymentConfigAlreadyExistsException < ServiceError
      end

      # The deployment configuration does not exist with the user or Amazon Web Services account.

      class DeploymentConfigDoesNotExistException < ServiceError
      end

      # The deployment configuration is still in use.

      class DeploymentConfigInUseException < ServiceError
      end

      # The deployment configurations limit was exceeded.

      class DeploymentConfigLimitExceededException < ServiceError
      end

      # The deployment configuration name was not specified.

      class DeploymentConfigNameRequiredException < ServiceError
      end

      # The deployment with the user or Amazon Web Services account does not exist.

      class DeploymentDoesNotExistException < ServiceError
      end

      # A deployment group with the specified name with the user or Amazon Web Services account already
      # exists.

      class DeploymentGroupAlreadyExistsException < ServiceError
      end

      # The named deployment group with the user or Amazon Web Services account does not exist.

      class DeploymentGroupDoesNotExistException < ServiceError
      end

      # The deployment groups limit was exceeded.

      class DeploymentGroupLimitExceededException < ServiceError
      end

      # The deployment group name was not specified.

      class DeploymentGroupNameRequiredException < ServiceError
      end

      # At least one deployment ID must be specified.

      class DeploymentIdRequiredException < ServiceError
      end

      # The deployment does not have a status of Ready and can't continue yet.

      class DeploymentIsNotInReadyStateException < ServiceError
      end

      # The number of allowed deployments was exceeded.

      class DeploymentLimitExceededException < ServiceError
      end

      # The specified deployment has not started.

      class DeploymentNotStartedException < ServiceError
      end

      # The provided target ID does not belong to the attempted deployment.

      class DeploymentTargetDoesNotExistException < ServiceError
      end

      # A deployment target ID was not provided.

      class DeploymentTargetIdRequiredException < ServiceError
      end

      # The maximum number of targets that can be associated with an Amazon ECS or Lambda deployment was
      # exceeded. The target list of both types of deployments must have exactly one item. This exception
      # does not apply to EC2/On-premises deployments.

      class DeploymentTargetListSizeExceededException < ServiceError
      end

      # The description is too long.

      class DescriptionTooLongException < ServiceError
      end

      # The Amazon ECS service is associated with more than one deployment groups. An Amazon ECS service can
      # be associated with only one deployment group.

      class ECSServiceMappingLimitExceededException < ServiceError
      end

      # No GitHub account connection exists with the named specified in the call.

      class GitHubAccountTokenDoesNotExistException < ServiceError
      end

      # The call is missing a required GitHub account connection name.

      class GitHubAccountTokenNameRequiredException < ServiceError
      end

      # No IAM ARN was included in the request. You must use an IAM session ARN or user ARN in the request.

      class IamArnRequiredException < ServiceError
      end

      # The request included an IAM session ARN that has already been used to register a different instance.

      class IamSessionArnAlreadyRegisteredException < ServiceError
      end

      # The specified user ARN is already registered with an on-premises instance.

      class IamUserArnAlreadyRegisteredException < ServiceError
      end

      # An user ARN was not specified.

      class IamUserArnRequiredException < ServiceError
      end

      # The specified instance does not exist in the deployment group.

      class InstanceDoesNotExistException < ServiceError
      end

      # The instance ID was not specified.

      class InstanceIdRequiredException < ServiceError
      end

      # The maximum number of allowed on-premises instances in a single call was exceeded.

      class InstanceLimitExceededException < ServiceError
      end

      # The specified on-premises instance name is already registered.

      class InstanceNameAlreadyRegisteredException < ServiceError
      end

      # An on-premises instance name was not specified.

      class InstanceNameRequiredException < ServiceError
      end

      # The specified on-premises instance is not registered.

      class InstanceNotRegisteredException < ServiceError
      end

      # The format of the alarm configuration is invalid. Possible causes include: The alarm list is null.
      # The alarm object is null. The alarm name is empty or null or exceeds the limit of 255 characters.
      # Two alarms with the same name have been specified. The alarm configuration is enabled, but the alarm
      # list is empty.

      class InvalidAlarmConfigException < ServiceError
      end

      # The application name was specified in an invalid format.

      class InvalidApplicationNameException < ServiceError
      end

      # The specified ARN is not in a valid format.

      class InvalidArnException < ServiceError
      end

      # The automatic rollback configuration was specified in an invalid format. For example, automatic
      # rollback is enabled, but an invalid triggering event type or no event types were listed.

      class InvalidAutoRollbackConfigException < ServiceError
      end

      # The Auto Scaling group was specified in an invalid format or does not exist.

      class InvalidAutoScalingGroupException < ServiceError
      end

      # The configuration for the blue/green deployment group was provided in an invalid format. For
      # information about deployment configuration format, see CreateDeploymentConfig .

      class InvalidBlueGreenDeploymentConfigurationException < ServiceError
      end

      # The bucket name either doesn't exist or was specified in an invalid format.

      class InvalidBucketNameFilterException < ServiceError
      end

      # The computePlatform is invalid. The computePlatform should be Lambda , Server , or ECS .

      class InvalidComputePlatformException < ServiceError
      end

      # The deployed state filter was specified in an invalid format.

      class InvalidDeployedStateFilterException < ServiceError
      end

      # The deployment configuration name was specified in an invalid format.

      class InvalidDeploymentConfigNameException < ServiceError
      end

      # The deployment group name was specified in an invalid format.

      class InvalidDeploymentGroupNameException < ServiceError
      end

      # At least one of the deployment IDs was specified in an invalid format.

      class InvalidDeploymentIdException < ServiceError
      end

      # An instance type was specified for an in-place deployment. Instance types are supported for
      # blue/green deployments only.

      class InvalidDeploymentInstanceTypeException < ServiceError
      end

      # The specified deployment status doesn't exist or cannot be determined.

      class InvalidDeploymentStatusException < ServiceError
      end

      # An invalid deployment style was specified. Valid deployment types include "IN_PLACE" and
      # "BLUE_GREEN." Valid deployment options include "WITH_TRAFFIC_CONTROL" and "WITHOUT_TRAFFIC_CONTROL."

      class InvalidDeploymentStyleException < ServiceError
      end

      # The target ID provided was not valid.

      class InvalidDeploymentTargetIdException < ServiceError
      end

      # The wait type is invalid.

      class InvalidDeploymentWaitTypeException < ServiceError
      end

      # A call was submitted that specified both Ec2TagFilters and Ec2TagSet, but only one of these data
      # types can be used in a single call.

      class InvalidEC2TagCombinationException < ServiceError
      end

      # The tag was specified in an invalid format.

      class InvalidEC2TagException < ServiceError
      end

      # The Amazon ECS service identifier is not valid.

      class InvalidECSServiceException < ServiceError
      end

      # The external ID was specified in an invalid format.

      class InvalidExternalIdException < ServiceError
      end

      # An invalid fileExistsBehavior option was specified to determine how CodeDeploy handles files or
      # directories that already exist in a deployment target location, but weren't part of the previous
      # successful deployment. Valid values include "DISALLOW," "OVERWRITE," and "RETAIN."

      class InvalidFileExistsBehaviorException < ServiceError
      end

      # The GitHub token is not valid.

      class InvalidGitHubAccountTokenException < ServiceError
      end

      # The format of the specified GitHub account connection name is invalid.

      class InvalidGitHubAccountTokenNameException < ServiceError
      end

      # The IAM session ARN was specified in an invalid format.

      class InvalidIamSessionArnException < ServiceError
      end

      # The user ARN was specified in an invalid format.

      class InvalidIamUserArnException < ServiceError
      end

      # The IgnoreApplicationStopFailures value is invalid. For Lambda deployments, false is expected. For
      # EC2/On-premises deployments, true or false is expected.

      class InvalidIgnoreApplicationStopFailuresValueException < ServiceError
      end

      # The input was specified in an invalid format.

      class InvalidInputException < ServiceError
      end


      class InvalidInstanceIdException < ServiceError
      end

      # The on-premises instance name was specified in an invalid format.

      class InvalidInstanceNameException < ServiceError
      end

      # The specified instance status does not exist.

      class InvalidInstanceStatusException < ServiceError
      end

      # An invalid instance type was specified for instances in a blue/green deployment. Valid values
      # include "Blue" for an original environment and "Green" for a replacement environment.

      class InvalidInstanceTypeException < ServiceError
      end

      # The specified key prefix filter was specified in an invalid format.

      class InvalidKeyPrefixFilterException < ServiceError
      end

      # A lifecycle event hook is invalid. Review the hooks section in your AppSpec file to ensure the
      # lifecycle events and hooks functions are valid.

      class InvalidLifecycleEventHookExecutionIdException < ServiceError
      end

      # The result of a Lambda validation function that verifies a lifecycle event is invalid. It should
      # return Succeeded or Failed .

      class InvalidLifecycleEventHookExecutionStatusException < ServiceError
      end

      # An invalid load balancer name, or no load balancer name, was specified.

      class InvalidLoadBalancerInfoException < ServiceError
      end

      # The minimum healthy instance value was specified in an invalid format.

      class InvalidMinimumHealthyHostValueException < ServiceError
      end

      # The next token was specified in an invalid format.

      class InvalidNextTokenException < ServiceError
      end

      # A call was submitted that specified both OnPremisesTagFilters and OnPremisesTagSet, but only one of
      # these data types can be used in a single call.

      class InvalidOnPremisesTagCombinationException < ServiceError
      end

      # An invalid operation was detected.

      class InvalidOperationException < ServiceError
      end

      # The registration status was specified in an invalid format.

      class InvalidRegistrationStatusException < ServiceError
      end

      # The revision was specified in an invalid format.

      class InvalidRevisionException < ServiceError
      end

      # The service role ARN was specified in an invalid format. Or, if an Auto Scaling group was specified,
      # the specified service role does not grant the appropriate permissions to Amazon EC2 Auto Scaling.

      class InvalidRoleException < ServiceError
      end

      # The column name to sort by is either not present or was specified in an invalid format.

      class InvalidSortByException < ServiceError
      end

      # The sort order was specified in an invalid format.

      class InvalidSortOrderException < ServiceError
      end

      # The tag was specified in an invalid format.

      class InvalidTagException < ServiceError
      end

      # The tag filter was specified in an invalid format.

      class InvalidTagFilterException < ServiceError
      end

      # The specified tags are not valid.

      class InvalidTagsToAddException < ServiceError
      end

      # A target is not valid.

      class InvalidTargetException < ServiceError
      end

      # The target filter name is invalid.

      class InvalidTargetFilterNameException < ServiceError
      end

      # A target group pair associated with this deployment is not valid.

      class InvalidTargetGroupPairException < ServiceError
      end

      # The target instance configuration is invalid. Possible causes include: Configuration data for target
      # instances was entered for an in-place deployment. The limit of 10 tags for a tag type was exceeded.
      # The combined length of the tag names exceeded the limit. A specified tag is not currently applied to
      # any instances.

      class InvalidTargetInstancesException < ServiceError
      end

      # The specified time range was specified in an invalid format.

      class InvalidTimeRangeException < ServiceError
      end

      # The configuration that specifies how traffic is routed during a deployment is invalid.

      class InvalidTrafficRoutingConfigurationException < ServiceError
      end

      # The trigger was specified in an invalid format.

      class InvalidTriggerConfigException < ServiceError
      end

      # The UpdateOutdatedInstancesOnly value is invalid. For Lambda deployments, false is expected. For
      # EC2/On-premises deployments, true or false is expected.

      class InvalidUpdateOutdatedInstancesOnlyValueException < ServiceError
      end

      # The ZonalConfig object is not valid.

      class InvalidZonalDeploymentConfigurationException < ServiceError
      end

      # An attempt to return the status of an already completed lifecycle event occurred.

      class LifecycleEventAlreadyCompletedException < ServiceError
      end

      # The limit for lifecycle hooks was exceeded.

      class LifecycleHookLimitExceededException < ServiceError
      end

      # Both an user ARN and an IAM session ARN were included in the request. Use only one ARN type.

      class MultipleIamArnsProvidedException < ServiceError
      end

      # The API used does not support the deployment.

      class OperationNotSupportedException < ServiceError
      end

      # The ARN of a resource is required, but was not found.

      class ResourceArnRequiredException < ServiceError
      end

      # The specified resource could not be validated.

      class ResourceValidationException < ServiceError
      end

      # The named revision does not exist with the user or Amazon Web Services account.

      class RevisionDoesNotExistException < ServiceError
      end

      # The revision ID was not specified.

      class RevisionRequiredException < ServiceError
      end

      # The role ID was not specified.

      class RoleRequiredException < ServiceError
      end

      # The maximum allowed number of tags was exceeded.

      class TagLimitExceededException < ServiceError
      end

      # A tag was not specified.

      class TagRequiredException < ServiceError
      end

      # The number of tag groups included in the tag set list exceeded the maximum allowed limit of 3.

      class TagSetListLimitExceededException < ServiceError
      end

      # An API function was called too frequently.

      class ThrottlingException < ServiceError
      end

      # The maximum allowed number of triggers was exceeded.

      class TriggerTargetsLimitExceededException < ServiceError
      end

      # A call was submitted that is not supported for the specified deployment type.

      class UnsupportedActionForDeploymentTypeException < ServiceError
      end

      def self.build(error_type : String?, message : String?) : Exception
        case error_type
        when "AlarmsLimitExceededException"
          AlarmsLimitExceededException.new(message)
        when "ApplicationAlreadyExistsException"
          ApplicationAlreadyExistsException.new(message)
        when "ApplicationDoesNotExistException"
          ApplicationDoesNotExistException.new(message)
        when "ApplicationLimitExceededException"
          ApplicationLimitExceededException.new(message)
        when "ApplicationNameRequiredException"
          ApplicationNameRequiredException.new(message)
        when "ArnNotSupportedException"
          ArnNotSupportedException.new(message)
        when "BatchLimitExceededException"
          BatchLimitExceededException.new(message)
        when "BucketNameFilterRequiredException"
          BucketNameFilterRequiredException.new(message)
        when "DeploymentAlreadyCompletedException"
          DeploymentAlreadyCompletedException.new(message)
        when "DeploymentAlreadyStartedException"
          DeploymentAlreadyStartedException.new(message)
        when "DeploymentConfigAlreadyExistsException"
          DeploymentConfigAlreadyExistsException.new(message)
        when "DeploymentConfigDoesNotExistException"
          DeploymentConfigDoesNotExistException.new(message)
        when "DeploymentConfigInUseException"
          DeploymentConfigInUseException.new(message)
        when "DeploymentConfigLimitExceededException"
          DeploymentConfigLimitExceededException.new(message)
        when "DeploymentConfigNameRequiredException"
          DeploymentConfigNameRequiredException.new(message)
        when "DeploymentDoesNotExistException"
          DeploymentDoesNotExistException.new(message)
        when "DeploymentGroupAlreadyExistsException"
          DeploymentGroupAlreadyExistsException.new(message)
        when "DeploymentGroupDoesNotExistException"
          DeploymentGroupDoesNotExistException.new(message)
        when "DeploymentGroupLimitExceededException"
          DeploymentGroupLimitExceededException.new(message)
        when "DeploymentGroupNameRequiredException"
          DeploymentGroupNameRequiredException.new(message)
        when "DeploymentIdRequiredException"
          DeploymentIdRequiredException.new(message)
        when "DeploymentIsNotInReadyStateException"
          DeploymentIsNotInReadyStateException.new(message)
        when "DeploymentLimitExceededException"
          DeploymentLimitExceededException.new(message)
        when "DeploymentNotStartedException"
          DeploymentNotStartedException.new(message)
        when "DeploymentTargetDoesNotExistException"
          DeploymentTargetDoesNotExistException.new(message)
        when "DeploymentTargetIdRequiredException"
          DeploymentTargetIdRequiredException.new(message)
        when "DeploymentTargetListSizeExceededException"
          DeploymentTargetListSizeExceededException.new(message)
        when "DescriptionTooLongException"
          DescriptionTooLongException.new(message)
        when "ECSServiceMappingLimitExceededException"
          ECSServiceMappingLimitExceededException.new(message)
        when "GitHubAccountTokenDoesNotExistException"
          GitHubAccountTokenDoesNotExistException.new(message)
        when "GitHubAccountTokenNameRequiredException"
          GitHubAccountTokenNameRequiredException.new(message)
        when "IamArnRequiredException"
          IamArnRequiredException.new(message)
        when "IamSessionArnAlreadyRegisteredException"
          IamSessionArnAlreadyRegisteredException.new(message)
        when "IamUserArnAlreadyRegisteredException"
          IamUserArnAlreadyRegisteredException.new(message)
        when "IamUserArnRequiredException"
          IamUserArnRequiredException.new(message)
        when "InstanceDoesNotExistException"
          InstanceDoesNotExistException.new(message)
        when "InstanceIdRequiredException"
          InstanceIdRequiredException.new(message)
        when "InstanceLimitExceededException"
          InstanceLimitExceededException.new(message)
        when "InstanceNameAlreadyRegisteredException"
          InstanceNameAlreadyRegisteredException.new(message)
        when "InstanceNameRequiredException"
          InstanceNameRequiredException.new(message)
        when "InstanceNotRegisteredException"
          InstanceNotRegisteredException.new(message)
        when "InvalidAlarmConfigException"
          InvalidAlarmConfigException.new(message)
        when "InvalidApplicationNameException"
          InvalidApplicationNameException.new(message)
        when "InvalidArnException"
          InvalidArnException.new(message)
        when "InvalidAutoRollbackConfigException"
          InvalidAutoRollbackConfigException.new(message)
        when "InvalidAutoScalingGroupException"
          InvalidAutoScalingGroupException.new(message)
        when "InvalidBlueGreenDeploymentConfigurationException"
          InvalidBlueGreenDeploymentConfigurationException.new(message)
        when "InvalidBucketNameFilterException"
          InvalidBucketNameFilterException.new(message)
        when "InvalidComputePlatformException"
          InvalidComputePlatformException.new(message)
        when "InvalidDeployedStateFilterException"
          InvalidDeployedStateFilterException.new(message)
        when "InvalidDeploymentConfigNameException"
          InvalidDeploymentConfigNameException.new(message)
        when "InvalidDeploymentGroupNameException"
          InvalidDeploymentGroupNameException.new(message)
        when "InvalidDeploymentIdException"
          InvalidDeploymentIdException.new(message)
        when "InvalidDeploymentInstanceTypeException"
          InvalidDeploymentInstanceTypeException.new(message)
        when "InvalidDeploymentStatusException"
          InvalidDeploymentStatusException.new(message)
        when "InvalidDeploymentStyleException"
          InvalidDeploymentStyleException.new(message)
        when "InvalidDeploymentTargetIdException"
          InvalidDeploymentTargetIdException.new(message)
        when "InvalidDeploymentWaitTypeException"
          InvalidDeploymentWaitTypeException.new(message)
        when "InvalidEC2TagCombinationException"
          InvalidEC2TagCombinationException.new(message)
        when "InvalidEC2TagException"
          InvalidEC2TagException.new(message)
        when "InvalidECSServiceException"
          InvalidECSServiceException.new(message)
        when "InvalidExternalIdException"
          InvalidExternalIdException.new(message)
        when "InvalidFileExistsBehaviorException"
          InvalidFileExistsBehaviorException.new(message)
        when "InvalidGitHubAccountTokenException"
          InvalidGitHubAccountTokenException.new(message)
        when "InvalidGitHubAccountTokenNameException"
          InvalidGitHubAccountTokenNameException.new(message)
        when "InvalidIamSessionArnException"
          InvalidIamSessionArnException.new(message)
        when "InvalidIamUserArnException"
          InvalidIamUserArnException.new(message)
        when "InvalidIgnoreApplicationStopFailuresValueException"
          InvalidIgnoreApplicationStopFailuresValueException.new(message)
        when "InvalidInputException"
          InvalidInputException.new(message)
        when "InvalidInstanceIdException"
          InvalidInstanceIdException.new(message)
        when "InvalidInstanceNameException"
          InvalidInstanceNameException.new(message)
        when "InvalidInstanceStatusException"
          InvalidInstanceStatusException.new(message)
        when "InvalidInstanceTypeException"
          InvalidInstanceTypeException.new(message)
        when "InvalidKeyPrefixFilterException"
          InvalidKeyPrefixFilterException.new(message)
        when "InvalidLifecycleEventHookExecutionIdException"
          InvalidLifecycleEventHookExecutionIdException.new(message)
        when "InvalidLifecycleEventHookExecutionStatusException"
          InvalidLifecycleEventHookExecutionStatusException.new(message)
        when "InvalidLoadBalancerInfoException"
          InvalidLoadBalancerInfoException.new(message)
        when "InvalidMinimumHealthyHostValueException"
          InvalidMinimumHealthyHostValueException.new(message)
        when "InvalidNextTokenException"
          InvalidNextTokenException.new(message)
        when "InvalidOnPremisesTagCombinationException"
          InvalidOnPremisesTagCombinationException.new(message)
        when "InvalidOperationException"
          InvalidOperationException.new(message)
        when "InvalidRegistrationStatusException"
          InvalidRegistrationStatusException.new(message)
        when "InvalidRevisionException"
          InvalidRevisionException.new(message)
        when "InvalidRoleException"
          InvalidRoleException.new(message)
        when "InvalidSortByException"
          InvalidSortByException.new(message)
        when "InvalidSortOrderException"
          InvalidSortOrderException.new(message)
        when "InvalidTagException"
          InvalidTagException.new(message)
        when "InvalidTagFilterException"
          InvalidTagFilterException.new(message)
        when "InvalidTagsToAddException"
          InvalidTagsToAddException.new(message)
        when "InvalidTargetException"
          InvalidTargetException.new(message)
        when "InvalidTargetFilterNameException"
          InvalidTargetFilterNameException.new(message)
        when "InvalidTargetGroupPairException"
          InvalidTargetGroupPairException.new(message)
        when "InvalidTargetInstancesException"
          InvalidTargetInstancesException.new(message)
        when "InvalidTimeRangeException"
          InvalidTimeRangeException.new(message)
        when "InvalidTrafficRoutingConfigurationException"
          InvalidTrafficRoutingConfigurationException.new(message)
        when "InvalidTriggerConfigException"
          InvalidTriggerConfigException.new(message)
        when "InvalidUpdateOutdatedInstancesOnlyValueException"
          InvalidUpdateOutdatedInstancesOnlyValueException.new(message)
        when "InvalidZonalDeploymentConfigurationException"
          InvalidZonalDeploymentConfigurationException.new(message)
        when "LifecycleEventAlreadyCompletedException"
          LifecycleEventAlreadyCompletedException.new(message)
        when "LifecycleHookLimitExceededException"
          LifecycleHookLimitExceededException.new(message)
        when "MultipleIamArnsProvidedException"
          MultipleIamArnsProvidedException.new(message)
        when "OperationNotSupportedException"
          OperationNotSupportedException.new(message)
        when "ResourceArnRequiredException"
          ResourceArnRequiredException.new(message)
        when "ResourceValidationException"
          ResourceValidationException.new(message)
        when "RevisionDoesNotExistException"
          RevisionDoesNotExistException.new(message)
        when "RevisionRequiredException"
          RevisionRequiredException.new(message)
        when "RoleRequiredException"
          RoleRequiredException.new(message)
        when "TagLimitExceededException"
          TagLimitExceededException.new(message)
        when "TagRequiredException"
          TagRequiredException.new(message)
        when "TagSetListLimitExceededException"
          TagSetListLimitExceededException.new(message)
        when "ThrottlingException"
          ThrottlingException.new(message)
        when "TriggerTargetsLimitExceededException"
          TriggerTargetsLimitExceededException.new(message)
        when "UnsupportedActionForDeploymentTypeException"
          UnsupportedActionForDeploymentTypeException.new(message)
        else
          ServiceError.new(message || "Unknown error")
        end
      end
    end
  end
end
