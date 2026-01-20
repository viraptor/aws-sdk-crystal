require "json"
require "time"

module AwsSdk
  module CodeDeploy
    module Types

      # Represents the input of, and adds tags to, an on-premises instance operation.

      struct AddTagsToOnPremisesInstancesInput
        include JSON::Serializable

        # The names of the on-premises instances to which to add tags.

        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        # The tag key-value pairs to add to the on-premises instances. Keys and values are both required. Keys
        # cannot be null or empty strings. Value-only tags are not allowed.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @instance_names : Array(String),
          @tags : Array(Types::Tag)
        )
        end
      end

      # Information about an alarm.

      struct Alarm
        include JSON::Serializable

        # The name of the alarm. Maximum length is 255 characters. Each alarm name can be used only once in a
        # list of alarms.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Information about alarms associated with a deployment or deployment group.

      struct AlarmConfiguration
        include JSON::Serializable

        # A list of alarms configured for the deployment or deployment group. A maximum of 10 alarms can be
        # added.

        @[JSON::Field(key: "alarms")]
        getter alarms : Array(Types::Alarm)?

        # Indicates whether the alarm configuration is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # Indicates whether a deployment should continue if information about the current state of alarms
        # cannot be retrieved from Amazon CloudWatch. The default value is false. true : The deployment
        # proceeds even if alarm status information can't be retrieved from Amazon CloudWatch. false : The
        # deployment stops if alarm status information can't be retrieved from Amazon CloudWatch.

        @[JSON::Field(key: "ignorePollAlarmFailure")]
        getter ignore_poll_alarm_failure : Bool?

        def initialize(
          @alarms : Array(Types::Alarm)? = nil,
          @enabled : Bool? = nil,
          @ignore_poll_alarm_failure : Bool? = nil
        )
        end
      end

      # The maximum number of alarms for a deployment group (10) was exceeded.

      struct AlarmsLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A revision for an Lambda or Amazon ECS deployment that is a YAML-formatted or JSON-formatted string.
      # For Lambda and Amazon ECS deployments, the revision is the same as the AppSpec file. This method
      # replaces the deprecated RawString data type.

      struct AppSpecContent
        include JSON::Serializable

        # The YAML-formatted or JSON-formatted revision string. For an Lambda deployment, the content includes
        # a Lambda function name, the alias for its original version, and the alias for its replacement
        # version. The deployment shifts traffic from the original version of the Lambda function to the
        # replacement version. For an Amazon ECS deployment, the content includes the task name, information
        # about the load balancer that serves traffic to the container, and more. For both types of
        # deployments, the content can specify Lambda functions that run at specified hooks, such as
        # BeforeInstall , during a deployment.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The SHA256 hash value of the revision content.

        @[JSON::Field(key: "sha256")]
        getter sha256 : String?

        def initialize(
          @content : String? = nil,
          @sha256 : String? = nil
        )
        end
      end

      # An application with the specified name with the user or Amazon Web Services account already exists.

      struct ApplicationAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The application does not exist with the user or Amazon Web Services account.

      struct ApplicationDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an application.

      struct ApplicationInfo
        include JSON::Serializable

        # The application ID.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The application name.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # The destination platform type for deployment of the application ( Lambda or Server ).

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # The time at which the application was created.

        @[JSON::Field(key: "createTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The name for a connection to a GitHub account.

        @[JSON::Field(key: "gitHubAccountName")]
        getter git_hub_account_name : String?

        # True if the user has authenticated with GitHub for the specified application. Otherwise, false.

        @[JSON::Field(key: "linkedToGitHub")]
        getter linked_to_git_hub : Bool?

        def initialize(
          @application_id : String? = nil,
          @application_name : String? = nil,
          @compute_platform : String? = nil,
          @create_time : Time? = nil,
          @git_hub_account_name : String? = nil,
          @linked_to_git_hub : Bool? = nil
        )
        end
      end

      # More applications were attempted to be created than are allowed.

      struct ApplicationLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The minimum number of required application names was not specified.

      struct ApplicationNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ARN is not supported. For example, it might be an ARN for a resource that is not
      # expected.

      struct ArnNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a configuration for automatically rolling back to a previous version of an
      # application revision when a deployment is not completed successfully.

      struct AutoRollbackConfiguration
        include JSON::Serializable

        # Indicates whether a defined automatic rollback configuration is currently enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The event type or types that trigger a rollback.

        @[JSON::Field(key: "events")]
        getter events : Array(String)?

        def initialize(
          @enabled : Bool? = nil,
          @events : Array(String)? = nil
        )
        end
      end

      # Information about an Auto Scaling group.

      struct AutoScalingGroup
        include JSON::Serializable

        # The name of the launch hook that CodeDeploy installed into the Auto Scaling group. For more
        # information about the launch hook, see How Amazon EC2 Auto Scaling works with CodeDeploy in the
        # CodeDeploy User Guide .

        @[JSON::Field(key: "hook")]
        getter hook : String?

        # The Auto Scaling group name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The name of the termination hook that CodeDeploy installed into the Auto Scaling group. For more
        # information about the termination hook, see Enabling termination deployments during Auto Scaling
        # scale-in events in the CodeDeploy User Guide .

        @[JSON::Field(key: "terminationHook")]
        getter termination_hook : String?

        def initialize(
          @hook : String? = nil,
          @name : String? = nil,
          @termination_hook : String? = nil
        )
        end
      end

      # Represents the input of a BatchGetApplicationRevisions operation.

      struct BatchGetApplicationRevisionsInput
        include JSON::Serializable

        # The name of an CodeDeploy application about which to get revision information.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # An array of RevisionLocation objects that specify information to get about the application
        # revisions, including type and location. The maximum number of RevisionLocation objects you can
        # specify is 25.

        @[JSON::Field(key: "revisions")]
        getter revisions : Array(Types::RevisionLocation)

        def initialize(
          @application_name : String,
          @revisions : Array(Types::RevisionLocation)
        )
        end
      end

      # Represents the output of a BatchGetApplicationRevisions operation.

      struct BatchGetApplicationRevisionsOutput
        include JSON::Serializable

        # The name of the application that corresponds to the revisions.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # Information about errors that might have occurred during the API call.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Additional information about the revisions, including the type and location.

        @[JSON::Field(key: "revisions")]
        getter revisions : Array(Types::RevisionInfo)?

        def initialize(
          @application_name : String? = nil,
          @error_message : String? = nil,
          @revisions : Array(Types::RevisionInfo)? = nil
        )
        end
      end

      # Represents the input of a BatchGetApplications operation.

      struct BatchGetApplicationsInput
        include JSON::Serializable

        # A list of application names separated by spaces. The maximum number of application names you can
        # specify is 100.

        @[JSON::Field(key: "applicationNames")]
        getter application_names : Array(String)

        def initialize(
          @application_names : Array(String)
        )
        end
      end

      # Represents the output of a BatchGetApplications operation.

      struct BatchGetApplicationsOutput
        include JSON::Serializable

        # Information about the applications.

        @[JSON::Field(key: "applicationsInfo")]
        getter applications_info : Array(Types::ApplicationInfo)?

        def initialize(
          @applications_info : Array(Types::ApplicationInfo)? = nil
        )
        end
      end

      # Represents the input of a BatchGetDeploymentGroups operation.

      struct BatchGetDeploymentGroupsInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the applicable user or Amazon Web Services
        # account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # The names of the deployment groups.

        @[JSON::Field(key: "deploymentGroupNames")]
        getter deployment_group_names : Array(String)

        def initialize(
          @application_name : String,
          @deployment_group_names : Array(String)
        )
        end
      end

      # Represents the output of a BatchGetDeploymentGroups operation.

      struct BatchGetDeploymentGroupsOutput
        include JSON::Serializable

        # Information about the deployment groups.

        @[JSON::Field(key: "deploymentGroupsInfo")]
        getter deployment_groups_info : Array(Types::DeploymentGroupInfo)?

        # Information about errors that might have occurred during the API call.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        def initialize(
          @deployment_groups_info : Array(Types::DeploymentGroupInfo)? = nil,
          @error_message : String? = nil
        )
        end
      end

      # Represents the input of a BatchGetDeploymentInstances operation.

      struct BatchGetDeploymentInstancesInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The unique IDs of instances used in the deployment. The maximum number of instance IDs you can
        # specify is 25.

        @[JSON::Field(key: "instanceIds")]
        getter instance_ids : Array(String)

        def initialize(
          @deployment_id : String,
          @instance_ids : Array(String)
        )
        end
      end

      # Represents the output of a BatchGetDeploymentInstances operation.

      struct BatchGetDeploymentInstancesOutput
        include JSON::Serializable

        # Information about errors that might have occurred during the API call.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # Information about the instance.

        @[JSON::Field(key: "instancesSummary")]
        getter instances_summary : Array(Types::InstanceSummary)?

        def initialize(
          @error_message : String? = nil,
          @instances_summary : Array(Types::InstanceSummary)? = nil
        )
        end
      end


      struct BatchGetDeploymentTargetsInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The unique IDs of the deployment targets. The compute platform of the deployment determines the type
        # of the targets and their formats. The maximum number of deployment target IDs you can specify is 25.
        # For deployments that use the EC2/On-premises compute platform, the target IDs are Amazon EC2 or
        # on-premises instances IDs, and their target type is instanceTarget . For deployments that use the
        # Lambda compute platform, the target IDs are the names of Lambda functions, and their target type is
        # instanceTarget . For deployments that use the Amazon ECS compute platform, the target IDs are pairs
        # of Amazon ECS clusters and services specified using the format
        # &lt;clustername&gt;:&lt;servicename&gt; . Their target type is ecsTarget . For deployments that are
        # deployed with CloudFormation, the target IDs are CloudFormation stack IDs. Their target type is
        # cloudFormationTarget .

        @[JSON::Field(key: "targetIds")]
        getter target_ids : Array(String)

        def initialize(
          @deployment_id : String,
          @target_ids : Array(String)
        )
        end
      end


      struct BatchGetDeploymentTargetsOutput
        include JSON::Serializable

        # A list of target objects for a deployment. Each target object contains details about the target,
        # such as its status and lifecycle events. The type of the target objects depends on the deployment'
        # compute platform. EC2/On-premises : Each target object is an Amazon EC2 or on-premises instance.
        # Lambda : The target object is a specific version of an Lambda function. Amazon ECS : The target
        # object is an Amazon ECS service. CloudFormation : The target object is an CloudFormation blue/green
        # deployment.

        @[JSON::Field(key: "deploymentTargets")]
        getter deployment_targets : Array(Types::DeploymentTarget)?

        def initialize(
          @deployment_targets : Array(Types::DeploymentTarget)? = nil
        )
        end
      end

      # Represents the input of a BatchGetDeployments operation.

      struct BatchGetDeploymentsInput
        include JSON::Serializable

        # A list of deployment IDs, separated by spaces. The maximum number of deployment IDs you can specify
        # is 25.

        @[JSON::Field(key: "deploymentIds")]
        getter deployment_ids : Array(String)

        def initialize(
          @deployment_ids : Array(String)
        )
        end
      end

      # Represents the output of a BatchGetDeployments operation.

      struct BatchGetDeploymentsOutput
        include JSON::Serializable

        # Information about the deployments.

        @[JSON::Field(key: "deploymentsInfo")]
        getter deployments_info : Array(Types::DeploymentInfo)?

        def initialize(
          @deployments_info : Array(Types::DeploymentInfo)? = nil
        )
        end
      end

      # Represents the input of a BatchGetOnPremisesInstances operation.

      struct BatchGetOnPremisesInstancesInput
        include JSON::Serializable

        # The names of the on-premises instances about which to get information. The maximum number of
        # instance names you can specify is 25.

        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        def initialize(
          @instance_names : Array(String)
        )
        end
      end

      # Represents the output of a BatchGetOnPremisesInstances operation.

      struct BatchGetOnPremisesInstancesOutput
        include JSON::Serializable

        # Information about the on-premises instances.

        @[JSON::Field(key: "instanceInfos")]
        getter instance_infos : Array(Types::InstanceInfo)?

        def initialize(
          @instance_infos : Array(Types::InstanceInfo)? = nil
        )
        end
      end

      # The maximum number of names or IDs allowed for this request (100) was exceeded.

      struct BatchLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about blue/green deployment options for a deployment group.

      struct BlueGreenDeploymentConfiguration
        include JSON::Serializable

        # Information about the action to take when newly provisioned instances are ready to receive traffic
        # in a blue/green deployment.

        @[JSON::Field(key: "deploymentReadyOption")]
        getter deployment_ready_option : Types::DeploymentReadyOption?

        # Information about how instances are provisioned for a replacement environment in a blue/green
        # deployment.

        @[JSON::Field(key: "greenFleetProvisioningOption")]
        getter green_fleet_provisioning_option : Types::GreenFleetProvisioningOption?

        # Information about whether to terminate instances in the original fleet during a blue/green
        # deployment.

        @[JSON::Field(key: "terminateBlueInstancesOnDeploymentSuccess")]
        getter terminate_blue_instances_on_deployment_success : Types::BlueInstanceTerminationOption?

        def initialize(
          @deployment_ready_option : Types::DeploymentReadyOption? = nil,
          @green_fleet_provisioning_option : Types::GreenFleetProvisioningOption? = nil,
          @terminate_blue_instances_on_deployment_success : Types::BlueInstanceTerminationOption? = nil
        )
        end
      end

      # Information about whether instances in the original environment are terminated when a blue/green
      # deployment is successful. BlueInstanceTerminationOption does not apply to Lambda deployments.

      struct BlueInstanceTerminationOption
        include JSON::Serializable

        # The action to take on instances in the original environment after a successful blue/green
        # deployment. TERMINATE : Instances are terminated after a specified wait time. KEEP_ALIVE : Instances
        # are left running after they are deregistered from the load balancer and removed from the deployment
        # group.

        @[JSON::Field(key: "action")]
        getter action : String?

        # For an Amazon EC2 deployment, the number of minutes to wait after a successful blue/green deployment
        # before terminating instances from the original environment. For an Amazon ECS deployment, the number
        # of minutes before deleting the original (blue) task set. During an Amazon ECS deployment, CodeDeploy
        # shifts traffic from the original (blue) task set to a replacement (green) task set. The maximum
        # setting is 2880 minutes (2 days).

        @[JSON::Field(key: "terminationWaitTimeInMinutes")]
        getter termination_wait_time_in_minutes : Int32?

        def initialize(
          @action : String? = nil,
          @termination_wait_time_in_minutes : Int32? = nil
        )
        end
      end

      # A bucket name is required, but was not provided.

      struct BucketNameFilterRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the target to be updated by an CloudFormation blue/green deployment. This target
      # type is used for all deployments initiated by a CloudFormation stack update.

      struct CloudFormationTarget
        include JSON::Serializable

        # The unique ID of an CloudFormation blue/green deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The date and time when the target application was updated by an CloudFormation blue/green
        # deployment.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The lifecycle events of the CloudFormation blue/green deployment to this target application.

        @[JSON::Field(key: "lifecycleEvents")]
        getter lifecycle_events : Array(Types::LifecycleEvent)?

        # The resource type for the CloudFormation blue/green deployment.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The status of an CloudFormation blue/green deployment's target application.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The unique ID of a deployment target that has a type of CloudFormationTarget .

        @[JSON::Field(key: "targetId")]
        getter target_id : String?

        # The percentage of production traffic that the target version of an CloudFormation blue/green
        # deployment receives.

        @[JSON::Field(key: "targetVersionWeight")]
        getter target_version_weight : Float64?

        def initialize(
          @deployment_id : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_events : Array(Types::LifecycleEvent)? = nil,
          @resource_type : String? = nil,
          @status : String? = nil,
          @target_id : String? = nil,
          @target_version_weight : Float64? = nil
        )
        end
      end


      struct ContinueDeploymentInput
        include JSON::Serializable

        # The unique ID of a blue/green deployment for which you want to start rerouting traffic to the
        # replacement environment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The status of the deployment's waiting period. READY_WAIT indicates that the deployment is ready to
        # start shifting traffic. TERMINATION_WAIT indicates that the traffic is shifted, but the original
        # target is not terminated.

        @[JSON::Field(key: "deploymentWaitType")]
        getter deployment_wait_type : String?

        def initialize(
          @deployment_id : String? = nil,
          @deployment_wait_type : String? = nil
        )
        end
      end

      # Represents the input of a CreateApplication operation.

      struct CreateApplicationInput
        include JSON::Serializable

        # The name of the application. This name must be unique with the applicable user or Amazon Web
        # Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # The destination platform type for the deployment ( Lambda , Server , or ECS ).

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # The metadata that you apply to CodeDeploy applications to help you organize and categorize them.
        # Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_name : String,
          @compute_platform : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the output of a CreateApplication operation.

      struct CreateApplicationOutput
        include JSON::Serializable

        # A unique application ID.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        def initialize(
          @application_id : String? = nil
        )
        end
      end

      # Represents the input of a CreateDeploymentConfig operation.

      struct CreateDeploymentConfigInput
        include JSON::Serializable

        # The name of the deployment configuration to create.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String

        # The destination platform type for the deployment ( Lambda , Server , or ECS ).

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # The minimum number of healthy instances that should be available at any time during the deployment.
        # There are two parameters expected in the input: type and value. The type parameter takes either of
        # the following values: HOST_COUNT: The value parameter represents the minimum number of healthy
        # instances as an absolute value. FLEET_PERCENT: The value parameter represents the minimum number of
        # healthy instances as a percentage of the total number of instances in the deployment. If you specify
        # FLEET_PERCENT, at the start of the deployment, CodeDeploy converts the percentage to the equivalent
        # number of instances and rounds up fractional instances. The value parameter takes an integer. For
        # example, to set a minimum of 95% healthy instance, specify a type of FLEET_PERCENT and a value of
        # 95.

        @[JSON::Field(key: "minimumHealthyHosts")]
        getter minimum_healthy_hosts : Types::MinimumHealthyHosts?

        # The configuration that specifies how the deployment traffic is routed.

        @[JSON::Field(key: "trafficRoutingConfig")]
        getter traffic_routing_config : Types::TrafficRoutingConfig?

        # Configure the ZonalConfig object if you want CodeDeploy to deploy your application to one
        # Availability Zone at a time, within an Amazon Web Services Region. For more information about the
        # zonal configuration feature, see zonal configuration in the CodeDeploy User Guide .

        @[JSON::Field(key: "zonalConfig")]
        getter zonal_config : Types::ZonalConfig?

        def initialize(
          @deployment_config_name : String,
          @compute_platform : String? = nil,
          @minimum_healthy_hosts : Types::MinimumHealthyHosts? = nil,
          @traffic_routing_config : Types::TrafficRoutingConfig? = nil,
          @zonal_config : Types::ZonalConfig? = nil
        )
        end
      end

      # Represents the output of a CreateDeploymentConfig operation.

      struct CreateDeploymentConfigOutput
        include JSON::Serializable

        # A unique deployment configuration ID.

        @[JSON::Field(key: "deploymentConfigId")]
        getter deployment_config_id : String?

        def initialize(
          @deployment_config_id : String? = nil
        )
        end
      end

      # Represents the input of a CreateDeploymentGroup operation.

      struct CreateDeploymentGroupInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # The name of a new deployment group for the specified application.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String

        # A service role Amazon Resource Name (ARN) that allows CodeDeploy to act on the user's behalf when
        # interacting with Amazon Web Services services.

        @[JSON::Field(key: "serviceRoleArn")]
        getter service_role_arn : String

        # Information to add about Amazon CloudWatch alarms when the deployment group is created.

        @[JSON::Field(key: "alarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # Configuration information for an automatic rollback that is added when a deployment group is
        # created.

        @[JSON::Field(key: "autoRollbackConfiguration")]
        getter auto_rollback_configuration : Types::AutoRollbackConfiguration?

        # A list of associated Amazon EC2 Auto Scaling groups.

        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Array(String)?

        # Information about blue/green deployment options for a deployment group.

        @[JSON::Field(key: "blueGreenDeploymentConfiguration")]
        getter blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration?

        # If specified, the deployment configuration name can be either one of the predefined configurations
        # provided with CodeDeploy or a custom deployment configuration that you create by calling the create
        # deployment configuration operation. CodeDeployDefault.OneAtATime is the default deployment
        # configuration. It is used if a configuration isn't specified for the deployment or deployment group.
        # For more information about the predefined deployment configurations in CodeDeploy, see Working with
        # Deployment Configurations in CodeDeploy in the CodeDeploy User Guide .

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String?

        # Information about the type of deployment, in-place or blue/green, that you want to run and whether
        # to route deployment traffic behind a load balancer.

        @[JSON::Field(key: "deploymentStyle")]
        getter deployment_style : Types::DeploymentStyle?

        # The Amazon EC2 tags on which to filter. The deployment group includes Amazon EC2 instances with any
        # of the specified tags. Cannot be used in the same call as ec2TagSet.

        @[JSON::Field(key: "ec2TagFilters")]
        getter ec2_tag_filters : Array(Types::EC2TagFilter)?

        # Information about groups of tags applied to Amazon EC2 instances. The deployment group includes only
        # Amazon EC2 instances identified by all the tag groups. Cannot be used in the same call as
        # ec2TagFilters .

        @[JSON::Field(key: "ec2TagSet")]
        getter ec2_tag_set : Types::EC2TagSet?

        # The target Amazon ECS services in the deployment group. This applies only to deployment groups that
        # use the Amazon ECS compute platform. A target Amazon ECS service is specified as an Amazon ECS
        # cluster and service name pair using the format &lt;clustername&gt;:&lt;servicename&gt; .

        @[JSON::Field(key: "ecsServices")]
        getter ecs_services : Array(Types::ECSService)?

        # Information about the load balancer used in a deployment.

        @[JSON::Field(key: "loadBalancerInfo")]
        getter load_balancer_info : Types::LoadBalancerInfo?

        # The on-premises instance tags on which to filter. The deployment group includes on-premises
        # instances with any of the specified tags. Cannot be used in the same call as OnPremisesTagSet .

        @[JSON::Field(key: "onPremisesInstanceTagFilters")]
        getter on_premises_instance_tag_filters : Array(Types::TagFilter)?

        # Information about groups of tags applied to on-premises instances. The deployment group includes
        # only on-premises instances identified by all of the tag groups. Cannot be used in the same call as
        # onPremisesInstanceTagFilters .

        @[JSON::Field(key: "onPremisesTagSet")]
        getter on_premises_tag_set : Types::OnPremisesTagSet?

        # Indicates what happens when new Amazon EC2 instances are launched mid-deployment and do not receive
        # the deployed application revision. If this option is set to UPDATE or is unspecified, CodeDeploy
        # initiates one or more 'auto-update outdated instances' deployments to apply the deployed application
        # revision to the new Amazon EC2 instances. If this option is set to IGNORE , CodeDeploy does not
        # initiate a deployment to update the new Amazon EC2 instances. This may result in instances having
        # different revisions.

        @[JSON::Field(key: "outdatedInstancesStrategy")]
        getter outdated_instances_strategy : String?

        # The metadata that you apply to CodeDeploy deployment groups to help you organize and categorize
        # them. Each tag consists of a key and an optional value, both of which you define.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # This parameter only applies if you are using CodeDeploy with Amazon EC2 Auto Scaling. For more
        # information, see Integrating CodeDeploy with Amazon EC2 Auto Scaling in the CodeDeploy User Guide .
        # Set terminationHookEnabled to true to have CodeDeploy install a termination hook into your Auto
        # Scaling group when you create a deployment group. When this hook is installed, CodeDeploy will
        # perform termination deployments. For information about termination deployments, see Enabling
        # termination deployments during Auto Scaling scale-in events in the CodeDeploy User Guide . For more
        # information about Auto Scaling scale-in events, see the Scale in topic in the Amazon EC2 Auto
        # Scaling User Guide .

        @[JSON::Field(key: "terminationHookEnabled")]
        getter termination_hook_enabled : Bool?

        # Information about triggers to create when the deployment group is created. For examples, see Create
        # a Trigger for an CodeDeploy Event in the CodeDeploy User Guide .

        @[JSON::Field(key: "triggerConfigurations")]
        getter trigger_configurations : Array(Types::TriggerConfig)?

        def initialize(
          @application_name : String,
          @deployment_group_name : String,
          @service_role_arn : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
          @auto_scaling_groups : Array(String)? = nil,
          @blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration? = nil,
          @deployment_config_name : String? = nil,
          @deployment_style : Types::DeploymentStyle? = nil,
          @ec2_tag_filters : Array(Types::EC2TagFilter)? = nil,
          @ec2_tag_set : Types::EC2TagSet? = nil,
          @ecs_services : Array(Types::ECSService)? = nil,
          @load_balancer_info : Types::LoadBalancerInfo? = nil,
          @on_premises_instance_tag_filters : Array(Types::TagFilter)? = nil,
          @on_premises_tag_set : Types::OnPremisesTagSet? = nil,
          @outdated_instances_strategy : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @termination_hook_enabled : Bool? = nil,
          @trigger_configurations : Array(Types::TriggerConfig)? = nil
        )
        end
      end

      # Represents the output of a CreateDeploymentGroup operation.

      struct CreateDeploymentGroupOutput
        include JSON::Serializable

        # A unique deployment group ID.

        @[JSON::Field(key: "deploymentGroupId")]
        getter deployment_group_id : String?

        def initialize(
          @deployment_group_id : String? = nil
        )
        end
      end

      # Represents the input of a CreateDeployment operation.

      struct CreateDeploymentInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # Configuration information for an automatic rollback that is added when a deployment is created.

        @[JSON::Field(key: "autoRollbackConfiguration")]
        getter auto_rollback_configuration : Types::AutoRollbackConfiguration?

        # The name of a deployment configuration associated with the user or Amazon Web Services account. If
        # not specified, the value configured in the deployment group is used as the default. If the
        # deployment group does not have a deployment configuration associated with it, CodeDeployDefault .
        # OneAtATime is used by default.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String?

        # The name of the deployment group.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String?

        # A comment about the deployment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about how CodeDeploy handles files that already exist in a deployment target location
        # but weren't part of the previous successful deployment. The fileExistsBehavior parameter takes any
        # of the following values: DISALLOW: The deployment fails. This is also the default behavior if no
        # option is specified. OVERWRITE: The version of the file from the application revision currently
        # being deployed replaces the version already on the instance. RETAIN: The version of the file already
        # on the instance is kept and used as part of the new deployment.

        @[JSON::Field(key: "fileExistsBehavior")]
        getter file_exists_behavior : String?

        # If true, then if an ApplicationStop , BeforeBlockTraffic , or AfterBlockTraffic deployment lifecycle
        # event to an instance fails, then the deployment continues to the next deployment lifecycle event.
        # For example, if ApplicationStop fails, the deployment continues with DownloadBundle . If
        # BeforeBlockTraffic fails, the deployment continues with BlockTraffic . If AfterBlockTraffic fails,
        # the deployment continues with ApplicationStop . If false or not specified, then if a lifecycle event
        # fails during a deployment to an instance, that deployment fails. If deployment to that instance is
        # part of an overall deployment and the number of healthy hosts is not less than the minimum number of
        # healthy hosts, then a deployment to the next instance is attempted. During a deployment, the
        # CodeDeploy agent runs the scripts specified for ApplicationStop , BeforeBlockTraffic , and
        # AfterBlockTraffic in the AppSpec file from the previous successful deployment. (All other scripts
        # are run from the AppSpec file in the current deployment.) If one of these scripts contains an error
        # and does not run successfully, the deployment can fail. If the cause of the failure is a script from
        # the last successful deployment that will never run successfully, create a new deployment and use
        # ignoreApplicationStopFailures to specify that the ApplicationStop , BeforeBlockTraffic , and
        # AfterBlockTraffic failures should be ignored.

        @[JSON::Field(key: "ignoreApplicationStopFailures")]
        getter ignore_application_stop_failures : Bool?

        # Allows you to specify information about alarms associated with a deployment. The alarm configuration
        # that you specify here will override the alarm configuration at the deployment group level. Consider
        # overriding the alarm configuration if you have set up alarms at the deployment group level that are
        # causing deployment failures. In this case, you would call CreateDeployment to create a new
        # deployment that uses a previous application revision that is known to work, and set its alarm
        # configuration to turn off alarm polling. Turning off alarm polling ensures that the new deployment
        # proceeds without being blocked by the alarm that was generated by the previous, failed, deployment.
        # If you specify an overrideAlarmConfiguration , you need the UpdateDeploymentGroup IAM permission
        # when calling CreateDeployment .

        @[JSON::Field(key: "overrideAlarmConfiguration")]
        getter override_alarm_configuration : Types::AlarmConfiguration?

        # The type and location of the revision to deploy.

        @[JSON::Field(key: "revision")]
        getter revision : Types::RevisionLocation?

        # Information about the instances that belong to the replacement environment in a blue/green
        # deployment.

        @[JSON::Field(key: "targetInstances")]
        getter target_instances : Types::TargetInstances?

        # Indicates whether to deploy to all instances or only to instances that are not running the latest
        # application revision.

        @[JSON::Field(key: "updateOutdatedInstancesOnly")]
        getter update_outdated_instances_only : Bool?

        def initialize(
          @application_name : String,
          @auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
          @deployment_config_name : String? = nil,
          @deployment_group_name : String? = nil,
          @description : String? = nil,
          @file_exists_behavior : String? = nil,
          @ignore_application_stop_failures : Bool? = nil,
          @override_alarm_configuration : Types::AlarmConfiguration? = nil,
          @revision : Types::RevisionLocation? = nil,
          @target_instances : Types::TargetInstances? = nil,
          @update_outdated_instances_only : Bool? = nil
        )
        end
      end

      # Represents the output of a CreateDeployment operation.

      struct CreateDeploymentOutput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        def initialize(
          @deployment_id : String? = nil
        )
        end
      end

      # Represents the input of a DeleteApplication operation.

      struct DeleteApplicationInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        def initialize(
          @application_name : String
        )
        end
      end

      # Represents the input of a DeleteDeploymentConfig operation.

      struct DeleteDeploymentConfigInput
        include JSON::Serializable

        # The name of a deployment configuration associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String

        def initialize(
          @deployment_config_name : String
        )
        end
      end

      # Represents the input of a DeleteDeploymentGroup operation.

      struct DeleteDeploymentGroupInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # The name of a deployment group for the specified application.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String

        def initialize(
          @application_name : String,
          @deployment_group_name : String
        )
        end
      end

      # Represents the output of a DeleteDeploymentGroup operation.

      struct DeleteDeploymentGroupOutput
        include JSON::Serializable

        # If the output contains no data, and the corresponding deployment group contained at least one Auto
        # Scaling group, CodeDeploy successfully removed all corresponding Auto Scaling lifecycle event hooks
        # from the Amazon EC2 instances in the Auto Scaling group. If the output contains data, CodeDeploy
        # could not remove some Auto Scaling lifecycle event hooks from the Amazon EC2 instances in the Auto
        # Scaling group.

        @[JSON::Field(key: "hooksNotCleanedUp")]
        getter hooks_not_cleaned_up : Array(Types::AutoScalingGroup)?

        def initialize(
          @hooks_not_cleaned_up : Array(Types::AutoScalingGroup)? = nil
        )
        end
      end

      # Represents the input of a DeleteGitHubAccount operation.

      struct DeleteGitHubAccountTokenInput
        include JSON::Serializable

        # The name of the GitHub account connection to delete.

        @[JSON::Field(key: "tokenName")]
        getter token_name : String?

        def initialize(
          @token_name : String? = nil
        )
        end
      end

      # Represents the output of a DeleteGitHubAccountToken operation.

      struct DeleteGitHubAccountTokenOutput
        include JSON::Serializable

        # The name of the GitHub account connection that was deleted.

        @[JSON::Field(key: "tokenName")]
        getter token_name : String?

        def initialize(
          @token_name : String? = nil
        )
        end
      end


      struct DeleteResourcesByExternalIdInput
        include JSON::Serializable

        # The unique ID of an external resource (for example, a CloudFormation stack ID) that is linked to one
        # or more CodeDeploy resources.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        def initialize(
          @external_id : String? = nil
        )
        end
      end


      struct DeleteResourcesByExternalIdOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment is already complete.

      struct DeploymentAlreadyCompletedException
        include JSON::Serializable

        def initialize
        end
      end

      # A deployment to a target was attempted while another deployment was in progress.

      struct DeploymentAlreadyStartedException
        include JSON::Serializable

        def initialize
        end
      end

      # A deployment configuration with the specified name with the user or Amazon Web Services account
      # already exists.

      struct DeploymentConfigAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment configuration does not exist with the user or Amazon Web Services account.

      struct DeploymentConfigDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment configuration is still in use.

      struct DeploymentConfigInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a deployment configuration.

      struct DeploymentConfigInfo
        include JSON::Serializable

        # The destination platform type for the deployment ( Lambda , Server , or ECS ).

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # The time at which the deployment configuration was created.

        @[JSON::Field(key: "createTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The deployment configuration ID.

        @[JSON::Field(key: "deploymentConfigId")]
        getter deployment_config_id : String?

        # The deployment configuration name.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String?

        # Information about the number or percentage of minimum healthy instances.

        @[JSON::Field(key: "minimumHealthyHosts")]
        getter minimum_healthy_hosts : Types::MinimumHealthyHosts?

        # The configuration that specifies how the deployment traffic is routed. Used for deployments with a
        # Lambda or Amazon ECS compute platform only.

        @[JSON::Field(key: "trafficRoutingConfig")]
        getter traffic_routing_config : Types::TrafficRoutingConfig?

        # Information about a zonal configuration.

        @[JSON::Field(key: "zonalConfig")]
        getter zonal_config : Types::ZonalConfig?

        def initialize(
          @compute_platform : String? = nil,
          @create_time : Time? = nil,
          @deployment_config_id : String? = nil,
          @deployment_config_name : String? = nil,
          @minimum_healthy_hosts : Types::MinimumHealthyHosts? = nil,
          @traffic_routing_config : Types::TrafficRoutingConfig? = nil,
          @zonal_config : Types::ZonalConfig? = nil
        )
        end
      end

      # The deployment configurations limit was exceeded.

      struct DeploymentConfigLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment configuration name was not specified.

      struct DeploymentConfigNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment with the user or Amazon Web Services account does not exist.

      struct DeploymentDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # A deployment group with the specified name with the user or Amazon Web Services account already
      # exists.

      struct DeploymentGroupAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # The named deployment group with the user or Amazon Web Services account does not exist.

      struct DeploymentGroupDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a deployment group.

      struct DeploymentGroupInfo
        include JSON::Serializable

        # A list of alarms associated with the deployment group.

        @[JSON::Field(key: "alarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # The application name.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # Information about the automatic rollback configuration associated with the deployment group.

        @[JSON::Field(key: "autoRollbackConfiguration")]
        getter auto_rollback_configuration : Types::AutoRollbackConfiguration?

        # A list of associated Auto Scaling groups.

        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Array(Types::AutoScalingGroup)?

        # Information about blue/green deployment options for a deployment group.

        @[JSON::Field(key: "blueGreenDeploymentConfiguration")]
        getter blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration?

        # The destination platform type for the deployment ( Lambda , Server , or ECS ).

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # The deployment configuration name.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String?

        # The deployment group ID.

        @[JSON::Field(key: "deploymentGroupId")]
        getter deployment_group_id : String?

        # The deployment group name.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String?

        # Information about the type of deployment, either in-place or blue/green, you want to run and whether
        # to route deployment traffic behind a load balancer.

        @[JSON::Field(key: "deploymentStyle")]
        getter deployment_style : Types::DeploymentStyle?

        # The Amazon EC2 tags on which to filter. The deployment group includes EC2 instances with any of the
        # specified tags.

        @[JSON::Field(key: "ec2TagFilters")]
        getter ec2_tag_filters : Array(Types::EC2TagFilter)?

        # Information about groups of tags applied to an Amazon EC2 instance. The deployment group includes
        # only Amazon EC2 instances identified by all of the tag groups. Cannot be used in the same call as
        # ec2TagFilters.

        @[JSON::Field(key: "ec2TagSet")]
        getter ec2_tag_set : Types::EC2TagSet?

        # The target Amazon ECS services in the deployment group. This applies only to deployment groups that
        # use the Amazon ECS compute platform. A target Amazon ECS service is specified as an Amazon ECS
        # cluster and service name pair using the format &lt;clustername&gt;:&lt;servicename&gt; .

        @[JSON::Field(key: "ecsServices")]
        getter ecs_services : Array(Types::ECSService)?

        # Information about the most recent attempted deployment to the deployment group.

        @[JSON::Field(key: "lastAttemptedDeployment")]
        getter last_attempted_deployment : Types::LastDeploymentInfo?

        # Information about the most recent successful deployment to the deployment group.

        @[JSON::Field(key: "lastSuccessfulDeployment")]
        getter last_successful_deployment : Types::LastDeploymentInfo?

        # Information about the load balancer to use in a deployment.

        @[JSON::Field(key: "loadBalancerInfo")]
        getter load_balancer_info : Types::LoadBalancerInfo?

        # The on-premises instance tags on which to filter. The deployment group includes on-premises
        # instances with any of the specified tags.

        @[JSON::Field(key: "onPremisesInstanceTagFilters")]
        getter on_premises_instance_tag_filters : Array(Types::TagFilter)?

        # Information about groups of tags applied to an on-premises instance. The deployment group includes
        # only on-premises instances identified by all the tag groups. Cannot be used in the same call as
        # onPremisesInstanceTagFilters.

        @[JSON::Field(key: "onPremisesTagSet")]
        getter on_premises_tag_set : Types::OnPremisesTagSet?

        # Indicates what happens when new Amazon EC2 instances are launched mid-deployment and do not receive
        # the deployed application revision. If this option is set to UPDATE or is unspecified, CodeDeploy
        # initiates one or more 'auto-update outdated instances' deployments to apply the deployed application
        # revision to the new Amazon EC2 instances. If this option is set to IGNORE , CodeDeploy does not
        # initiate a deployment to update the new Amazon EC2 instances. This may result in instances having
        # different revisions.

        @[JSON::Field(key: "outdatedInstancesStrategy")]
        getter outdated_instances_strategy : String?

        # A service role Amazon Resource Name (ARN) that grants CodeDeploy permission to make calls to Amazon
        # Web Services services on your behalf. For more information, see Create a Service Role for CodeDeploy
        # in the CodeDeploy User Guide .

        @[JSON::Field(key: "serviceRoleArn")]
        getter service_role_arn : String?

        # Information about the deployment group's target revision, including type and location.

        @[JSON::Field(key: "targetRevision")]
        getter target_revision : Types::RevisionLocation?

        # Indicates whether the deployment group was configured to have CodeDeploy install a termination hook
        # into an Auto Scaling group. For more information about the termination hook, see How Amazon EC2 Auto
        # Scaling works with CodeDeploy in the CodeDeploy User Guide .

        @[JSON::Field(key: "terminationHookEnabled")]
        getter termination_hook_enabled : Bool?

        # Information about triggers associated with the deployment group.

        @[JSON::Field(key: "triggerConfigurations")]
        getter trigger_configurations : Array(Types::TriggerConfig)?

        def initialize(
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @application_name : String? = nil,
          @auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
          @auto_scaling_groups : Array(Types::AutoScalingGroup)? = nil,
          @blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration? = nil,
          @compute_platform : String? = nil,
          @deployment_config_name : String? = nil,
          @deployment_group_id : String? = nil,
          @deployment_group_name : String? = nil,
          @deployment_style : Types::DeploymentStyle? = nil,
          @ec2_tag_filters : Array(Types::EC2TagFilter)? = nil,
          @ec2_tag_set : Types::EC2TagSet? = nil,
          @ecs_services : Array(Types::ECSService)? = nil,
          @last_attempted_deployment : Types::LastDeploymentInfo? = nil,
          @last_successful_deployment : Types::LastDeploymentInfo? = nil,
          @load_balancer_info : Types::LoadBalancerInfo? = nil,
          @on_premises_instance_tag_filters : Array(Types::TagFilter)? = nil,
          @on_premises_tag_set : Types::OnPremisesTagSet? = nil,
          @outdated_instances_strategy : String? = nil,
          @service_role_arn : String? = nil,
          @target_revision : Types::RevisionLocation? = nil,
          @termination_hook_enabled : Bool? = nil,
          @trigger_configurations : Array(Types::TriggerConfig)? = nil
        )
        end
      end

      # The deployment groups limit was exceeded.

      struct DeploymentGroupLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment group name was not specified.

      struct DeploymentGroupNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # At least one deployment ID must be specified.

      struct DeploymentIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a deployment.

      struct DeploymentInfo
        include JSON::Serializable

        # Provides information about the results of a deployment, such as whether instances in the original
        # environment in a blue/green deployment were not terminated.

        @[JSON::Field(key: "additionalDeploymentStatusInfo")]
        getter additional_deployment_status_info : String?

        # The application name.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # Information about the automatic rollback configuration associated with the deployment.

        @[JSON::Field(key: "autoRollbackConfiguration")]
        getter auto_rollback_configuration : Types::AutoRollbackConfiguration?

        # Information about blue/green deployment options for this deployment.

        @[JSON::Field(key: "blueGreenDeploymentConfiguration")]
        getter blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration?

        # A timestamp that indicates when the deployment was complete.

        @[JSON::Field(key: "completeTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter complete_time : Time?

        # The destination platform type for the deployment ( Lambda , Server , or ECS ).

        @[JSON::Field(key: "computePlatform")]
        getter compute_platform : String?

        # A timestamp that indicates when the deployment was created.

        @[JSON::Field(key: "createTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The means by which the deployment was created: user : A user created the deployment. autoscaling :
        # Amazon EC2 Auto Scaling created the deployment. codeDeployRollback : A rollback process created the
        # deployment. CodeDeployAutoUpdate : An auto-update process created the deployment when it detected
        # outdated Amazon EC2 instances.

        @[JSON::Field(key: "creator")]
        getter creator : String?

        # The deployment configuration name.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String?

        # The deployment group name.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String?

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A summary of the deployment status of the instances in the deployment.

        @[JSON::Field(key: "deploymentOverview")]
        getter deployment_overview : Types::DeploymentOverview?

        # Messages that contain information about the status of a deployment.

        @[JSON::Field(key: "deploymentStatusMessages")]
        getter deployment_status_messages : Array(String)?

        # Information about the type of deployment, either in-place or blue/green, you want to run and whether
        # to route deployment traffic behind a load balancer.

        @[JSON::Field(key: "deploymentStyle")]
        getter deployment_style : Types::DeploymentStyle?

        # A comment about the deployment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about any error associated with this deployment.

        @[JSON::Field(key: "errorInformation")]
        getter error_information : Types::ErrorInformation?

        # The unique ID for an external resource (for example, a CloudFormation stack ID) that is linked to
        # this deployment.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # Information about how CodeDeploy handles files that already exist in a deployment target location
        # but weren't part of the previous successful deployment. DISALLOW : The deployment fails. This is
        # also the default behavior if no option is specified. OVERWRITE : The version of the file from the
        # application revision currently being deployed replaces the version already on the instance. RETAIN :
        # The version of the file already on the instance is kept and used as part of the new deployment.

        @[JSON::Field(key: "fileExistsBehavior")]
        getter file_exists_behavior : String?

        # If true, then if an ApplicationStop , BeforeBlockTraffic , or AfterBlockTraffic deployment lifecycle
        # event to an instance fails, then the deployment continues to the next deployment lifecycle event.
        # For example, if ApplicationStop fails, the deployment continues with DownloadBundle. If
        # BeforeBlockTraffic fails, the deployment continues with BlockTraffic . If AfterBlockTraffic fails,
        # the deployment continues with ApplicationStop . If false or not specified, then if a lifecycle event
        # fails during a deployment to an instance, that deployment fails. If deployment to that instance is
        # part of an overall deployment and the number of healthy hosts is not less than the minimum number of
        # healthy hosts, then a deployment to the next instance is attempted. During a deployment, the
        # CodeDeploy agent runs the scripts specified for ApplicationStop , BeforeBlockTraffic , and
        # AfterBlockTraffic in the AppSpec file from the previous successful deployment. (All other scripts
        # are run from the AppSpec file in the current deployment.) If one of these scripts contains an error
        # and does not run successfully, the deployment can fail. If the cause of the failure is a script from
        # the last successful deployment that will never run successfully, create a new deployment and use
        # ignoreApplicationStopFailures to specify that the ApplicationStop , BeforeBlockTraffic , and
        # AfterBlockTraffic failures should be ignored.

        @[JSON::Field(key: "ignoreApplicationStopFailures")]
        getter ignore_application_stop_failures : Bool?

        # Indicates whether the wait period set for the termination of instances in the original environment
        # has started. Status is 'false' if the KEEP_ALIVE option is specified. Otherwise, 'true' as soon as
        # the termination wait period starts.

        @[JSON::Field(key: "instanceTerminationWaitTimeStarted")]
        getter instance_termination_wait_time_started : Bool?

        # Information about the load balancer used in the deployment.

        @[JSON::Field(key: "loadBalancerInfo")]
        getter load_balancer_info : Types::LoadBalancerInfo?


        @[JSON::Field(key: "overrideAlarmConfiguration")]
        getter override_alarm_configuration : Types::AlarmConfiguration?

        # Information about the application revision that was deployed to the deployment group before the most
        # recent successful deployment.

        @[JSON::Field(key: "previousRevision")]
        getter previous_revision : Types::RevisionLocation?


        @[JSON::Field(key: "relatedDeployments")]
        getter related_deployments : Types::RelatedDeployments?

        # Information about the location of stored application artifacts and the service from which to
        # retrieve them.

        @[JSON::Field(key: "revision")]
        getter revision : Types::RevisionLocation?

        # Information about a deployment rollback.

        @[JSON::Field(key: "rollbackInfo")]
        getter rollback_info : Types::RollbackInfo?

        # A timestamp that indicates when the deployment was deployed to the deployment group. In some cases,
        # the reported value of the start time might be later than the complete time. This is due to
        # differences in the clock settings of backend servers that participate in the deployment process.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The current state of the deployment as a whole.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Information about the instances that belong to the replacement environment in a blue/green
        # deployment.

        @[JSON::Field(key: "targetInstances")]
        getter target_instances : Types::TargetInstances?

        # Indicates whether only instances that are not running the latest application revision are to be
        # deployed to.

        @[JSON::Field(key: "updateOutdatedInstancesOnly")]
        getter update_outdated_instances_only : Bool?

        def initialize(
          @additional_deployment_status_info : String? = nil,
          @application_name : String? = nil,
          @auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
          @blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration? = nil,
          @complete_time : Time? = nil,
          @compute_platform : String? = nil,
          @create_time : Time? = nil,
          @creator : String? = nil,
          @deployment_config_name : String? = nil,
          @deployment_group_name : String? = nil,
          @deployment_id : String? = nil,
          @deployment_overview : Types::DeploymentOverview? = nil,
          @deployment_status_messages : Array(String)? = nil,
          @deployment_style : Types::DeploymentStyle? = nil,
          @description : String? = nil,
          @error_information : Types::ErrorInformation? = nil,
          @external_id : String? = nil,
          @file_exists_behavior : String? = nil,
          @ignore_application_stop_failures : Bool? = nil,
          @instance_termination_wait_time_started : Bool? = nil,
          @load_balancer_info : Types::LoadBalancerInfo? = nil,
          @override_alarm_configuration : Types::AlarmConfiguration? = nil,
          @previous_revision : Types::RevisionLocation? = nil,
          @related_deployments : Types::RelatedDeployments? = nil,
          @revision : Types::RevisionLocation? = nil,
          @rollback_info : Types::RollbackInfo? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @target_instances : Types::TargetInstances? = nil,
          @update_outdated_instances_only : Bool? = nil
        )
        end
      end

      # The deployment does not have a status of Ready and can't continue yet.

      struct DeploymentIsNotInReadyStateException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of allowed deployments was exceeded.

      struct DeploymentLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified deployment has not started.

      struct DeploymentNotStartedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the deployment status of the instances in the deployment.

      struct DeploymentOverview
        include JSON::Serializable

        # The number of instances in the deployment in a failed state.

        @[JSON::Field(key: "Failed")]
        getter failed : Int64?

        # The number of instances in which the deployment is in progress.

        @[JSON::Field(key: "InProgress")]
        getter in_progress : Int64?

        # The number of instances in the deployment in a pending state.

        @[JSON::Field(key: "Pending")]
        getter pending : Int64?

        # The number of instances in a replacement environment ready to receive traffic in a blue/green
        # deployment.

        @[JSON::Field(key: "Ready")]
        getter ready : Int64?

        # The number of instances in the deployment in a skipped state.

        @[JSON::Field(key: "Skipped")]
        getter skipped : Int64?

        # The number of instances in the deployment to which revisions have been successfully deployed.

        @[JSON::Field(key: "Succeeded")]
        getter succeeded : Int64?

        def initialize(
          @failed : Int64? = nil,
          @in_progress : Int64? = nil,
          @pending : Int64? = nil,
          @ready : Int64? = nil,
          @skipped : Int64? = nil,
          @succeeded : Int64? = nil
        )
        end
      end

      # Information about how traffic is rerouted to instances in a replacement environment in a blue/green
      # deployment.

      struct DeploymentReadyOption
        include JSON::Serializable

        # Information about when to reroute traffic from an original environment to a replacement environment
        # in a blue/green deployment. CONTINUE_DEPLOYMENT: Register new instances with the load balancer
        # immediately after the new application revision is installed on the instances in the replacement
        # environment. STOP_DEPLOYMENT: Do not register new instances with a load balancer unless traffic
        # rerouting is started using ContinueDeployment . If traffic rerouting is not started before the end
        # of the specified wait period, the deployment status is changed to Stopped.

        @[JSON::Field(key: "actionOnTimeout")]
        getter action_on_timeout : String?

        # The number of minutes to wait before the status of a blue/green deployment is changed to Stopped if
        # rerouting is not started manually. Applies only to the STOP_DEPLOYMENT option for actionOnTimeout .

        @[JSON::Field(key: "waitTimeInMinutes")]
        getter wait_time_in_minutes : Int32?

        def initialize(
          @action_on_timeout : String? = nil,
          @wait_time_in_minutes : Int32? = nil
        )
        end
      end

      # Information about the type of deployment, either in-place or blue/green, you want to run and whether
      # to route deployment traffic behind a load balancer.

      struct DeploymentStyle
        include JSON::Serializable

        # Indicates whether to route deployment traffic behind a load balancer.

        @[JSON::Field(key: "deploymentOption")]
        getter deployment_option : String?

        # Indicates whether to run an in-place deployment or a blue/green deployment.

        @[JSON::Field(key: "deploymentType")]
        getter deployment_type : String?

        def initialize(
          @deployment_option : String? = nil,
          @deployment_type : String? = nil
        )
        end
      end

      # Information about the deployment target.

      struct DeploymentTarget
        include JSON::Serializable


        @[JSON::Field(key: "cloudFormationTarget")]
        getter cloud_formation_target : Types::CloudFormationTarget?

        # The deployment type that is specific to the deployment's compute platform or deployments initiated
        # by a CloudFormation stack update.

        @[JSON::Field(key: "deploymentTargetType")]
        getter deployment_target_type : String?

        # Information about the target for a deployment that uses the Amazon ECS compute platform.

        @[JSON::Field(key: "ecsTarget")]
        getter ecs_target : Types::ECSTarget?

        # Information about the target for a deployment that uses the EC2/On-premises compute platform.

        @[JSON::Field(key: "instanceTarget")]
        getter instance_target : Types::InstanceTarget?

        # Information about the target for a deployment that uses the Lambda compute platform.

        @[JSON::Field(key: "lambdaTarget")]
        getter lambda_target : Types::LambdaTarget?

        def initialize(
          @cloud_formation_target : Types::CloudFormationTarget? = nil,
          @deployment_target_type : String? = nil,
          @ecs_target : Types::ECSTarget? = nil,
          @instance_target : Types::InstanceTarget? = nil,
          @lambda_target : Types::LambdaTarget? = nil
        )
        end
      end

      # The provided target ID does not belong to the attempted deployment.

      struct DeploymentTargetDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # A deployment target ID was not provided.

      struct DeploymentTargetIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The maximum number of targets that can be associated with an Amazon ECS or Lambda deployment was
      # exceeded. The target list of both types of deployments must have exactly one item. This exception
      # does not apply to EC2/On-premises deployments.

      struct DeploymentTargetListSizeExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a DeregisterOnPremisesInstance operation.

      struct DeregisterOnPremisesInstanceInput
        include JSON::Serializable

        # The name of the on-premises instance to deregister.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      # The description is too long.

      struct DescriptionTooLongException
        include JSON::Serializable

        def initialize
        end
      end

      # Diagnostic information about executable scripts that are part of a deployment.

      struct Diagnostics
        include JSON::Serializable

        # The associated error code: Success: The specified script ran. ScriptMissing: The specified script
        # was not found in the specified location. ScriptNotExecutable: The specified script is not a
        # recognized executable file type. ScriptTimedOut: The specified script did not finish running in the
        # specified time period. ScriptFailed: The specified script failed to run as expected. UnknownError:
        # The specified script did not run for an unknown reason.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The last portion of the diagnostic log. If available, CodeDeploy returns up to the last 4 KB of the
        # diagnostic log.

        @[JSON::Field(key: "logTail")]
        getter log_tail : String?

        # The message associated with the error.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The name of the script.

        @[JSON::Field(key: "scriptName")]
        getter script_name : String?

        def initialize(
          @error_code : String? = nil,
          @log_tail : String? = nil,
          @message : String? = nil,
          @script_name : String? = nil
        )
        end
      end

      # Information about an EC2 tag filter.

      struct EC2TagFilter
        include JSON::Serializable

        # The tag filter key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The tag filter type: KEY_ONLY : Key only. VALUE_ONLY : Value only. KEY_AND_VALUE : Key and value.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The tag filter value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about groups of Amazon EC2 instance tags.

      struct EC2TagSet
        include JSON::Serializable

        # A list that contains other lists of Amazon EC2 instance tag groups. For an instance to be included
        # in the deployment group, it must be identified by all of the tag groups in the list.

        @[JSON::Field(key: "ec2TagSetList")]
        getter ec2_tag_set_list : Array(Array(Types::EC2TagFilter))?

        def initialize(
          @ec2_tag_set_list : Array(Array(Types::EC2TagFilter))? = nil
        )
        end
      end

      # Contains the service and cluster names used to identify an Amazon ECS deployment's target.

      struct ECSService
        include JSON::Serializable

        # The name of the cluster that the Amazon ECS service is associated with.

        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The name of the target Amazon ECS service.

        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        def initialize(
          @cluster_name : String? = nil,
          @service_name : String? = nil
        )
        end
      end

      # The Amazon ECS service is associated with more than one deployment groups. An Amazon ECS service can
      # be associated with only one deployment group.

      struct ECSServiceMappingLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the target of an Amazon ECS deployment.

      struct ECSTarget
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The date and time when the target Amazon ECS application was updated by a deployment.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The lifecycle events of the deployment to this target Amazon ECS application.

        @[JSON::Field(key: "lifecycleEvents")]
        getter lifecycle_events : Array(Types::LifecycleEvent)?

        # The status an Amazon ECS deployment's target ECS application.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the target.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        # The unique ID of a deployment target that has a type of ecsTarget .

        @[JSON::Field(key: "targetId")]
        getter target_id : String?

        # The ECSTaskSet objects associated with the ECS target.

        @[JSON::Field(key: "taskSetsInfo")]
        getter task_sets_info : Array(Types::ECSTaskSet)?

        def initialize(
          @deployment_id : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_events : Array(Types::LifecycleEvent)? = nil,
          @status : String? = nil,
          @target_arn : String? = nil,
          @target_id : String? = nil,
          @task_sets_info : Array(Types::ECSTaskSet)? = nil
        )
        end
      end

      # Information about a set of Amazon ECS tasks in an CodeDeploy deployment. An Amazon ECS task set
      # includes details such as the desired number of tasks, how many tasks are running, and whether the
      # task set serves production traffic. An CodeDeploy application that uses the Amazon ECS compute
      # platform deploys a containerized application in an Amazon ECS service as a task set.

      struct ECSTaskSet
        include JSON::Serializable

        # The number of tasks in a task set. During a deployment that uses the Amazon ECS compute type,
        # CodeDeploy instructs Amazon ECS to create a new task set and uses this value to determine how many
        # tasks to create. After the updated task set is created, CodeDeploy shifts traffic to the new task
        # set.

        @[JSON::Field(key: "desiredCount")]
        getter desired_count : Int64?

        # A unique ID of an ECSTaskSet .

        @[JSON::Field(key: "identifer")]
        getter identifer : String?

        # The number of tasks in the task set that are in the PENDING status during an Amazon ECS deployment.
        # A task in the PENDING state is preparing to enter the RUNNING state. A task set enters the PENDING
        # status when it launches for the first time, or when it is restarted after being in the STOPPED
        # state.

        @[JSON::Field(key: "pendingCount")]
        getter pending_count : Int64?

        # The number of tasks in the task set that are in the RUNNING status during an Amazon ECS deployment.
        # A task in the RUNNING state is running and ready for use.

        @[JSON::Field(key: "runningCount")]
        getter running_count : Int64?

        # The status of the task set. There are three valid task set statuses: PRIMARY : Indicates the task
        # set is serving production traffic. ACTIVE : Indicates the task set is not serving production
        # traffic. DRAINING : Indicates the tasks in the task set are being stopped and their corresponding
        # targets are being deregistered from their target group.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The target group associated with the task set. The target group is used by CodeDeploy to manage
        # traffic to a task set.

        @[JSON::Field(key: "targetGroup")]
        getter target_group : Types::TargetGroupInfo?

        # A label that identifies whether the ECS task set is an original target ( BLUE ) or a replacement
        # target ( GREEN ).

        @[JSON::Field(key: "taskSetLabel")]
        getter task_set_label : String?

        # The percentage of traffic served by this task set.

        @[JSON::Field(key: "trafficWeight")]
        getter traffic_weight : Float64?

        def initialize(
          @desired_count : Int64? = nil,
          @identifer : String? = nil,
          @pending_count : Int64? = nil,
          @running_count : Int64? = nil,
          @status : String? = nil,
          @target_group : Types::TargetGroupInfo? = nil,
          @task_set_label : String? = nil,
          @traffic_weight : Float64? = nil
        )
        end
      end

      # Information about a Classic Load Balancer in Elastic Load Balancing to use in a deployment.
      # Instances are registered directly with a load balancer, and traffic is routed to the load balancer.

      struct ELBInfo
        include JSON::Serializable

        # For blue/green deployments, the name of the Classic Load Balancer that is used to route traffic from
        # original instances to replacement instances in a blue/green deployment. For in-place deployments,
        # the name of the Classic Load Balancer that instances are deregistered from so they are not serving
        # traffic during a deployment, and then re-registered with after the deployment is complete.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Information about a deployment error.

      struct ErrorInformation
        include JSON::Serializable

        # For more information, see Error Codes for CodeDeploy in the CodeDeploy User Guide . The error code:
        # APPLICATION_MISSING: The application was missing. This error code is most likely raised if the
        # application is deleted after the deployment is created, but before it is started.
        # DEPLOYMENT_GROUP_MISSING: The deployment group was missing. This error code is most likely raised if
        # the deployment group is deleted after the deployment is created, but before it is started.
        # HEALTH_CONSTRAINTS: The deployment failed on too many instances to be successfully deployed within
        # the instance health constraints specified. HEALTH_CONSTRAINTS_INVALID: The revision cannot be
        # successfully deployed within the instance health constraints specified. IAM_ROLE_MISSING: The
        # service role cannot be accessed. IAM_ROLE_PERMISSIONS: The service role does not have the correct
        # permissions. INTERNAL_ERROR: There was an internal error. NO_EC2_SUBSCRIPTION: The calling account
        # is not subscribed to Amazon EC2. NO_INSTANCES: No instances were specified, or no instances can be
        # found. OVER_MAX_INSTANCES: The maximum number of instances was exceeded. THROTTLED: The operation
        # was throttled because the calling account exceeded the throttling limits of one or more Amazon Web
        # Services services. TIMEOUT: The deployment has timed out. REVISION_MISSING: The revision ID was
        # missing. This error code is most likely raised if the revision is deleted after the deployment is
        # created, but before it is started.

        @[JSON::Field(key: "code")]
        getter code : String?

        # An accompanying error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Information about an application revision.

      struct GenericRevisionInfo
        include JSON::Serializable

        # The deployment groups for which this is the current target revision.

        @[JSON::Field(key: "deploymentGroups")]
        getter deployment_groups : Array(String)?

        # A comment about the revision.

        @[JSON::Field(key: "description")]
        getter description : String?

        # When the revision was first used by CodeDeploy.

        @[JSON::Field(key: "firstUsedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter first_used_time : Time?

        # When the revision was last used by CodeDeploy.

        @[JSON::Field(key: "lastUsedTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_used_time : Time?

        # When the revision was registered with CodeDeploy.

        @[JSON::Field(key: "registerTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter register_time : Time?

        def initialize(
          @deployment_groups : Array(String)? = nil,
          @description : String? = nil,
          @first_used_time : Time? = nil,
          @last_used_time : Time? = nil,
          @register_time : Time? = nil
        )
        end
      end

      # Represents the input of a GetApplication operation.

      struct GetApplicationInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        def initialize(
          @application_name : String
        )
        end
      end

      # Represents the output of a GetApplication operation.

      struct GetApplicationOutput
        include JSON::Serializable

        # Information about the application.

        @[JSON::Field(key: "application")]
        getter application : Types::ApplicationInfo?

        def initialize(
          @application : Types::ApplicationInfo? = nil
        )
        end
      end

      # Represents the input of a GetApplicationRevision operation.

      struct GetApplicationRevisionInput
        include JSON::Serializable

        # The name of the application that corresponds to the revision.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # Information about the application revision to get, including type and location.

        @[JSON::Field(key: "revision")]
        getter revision : Types::RevisionLocation

        def initialize(
          @application_name : String,
          @revision : Types::RevisionLocation
        )
        end
      end

      # Represents the output of a GetApplicationRevision operation.

      struct GetApplicationRevisionOutput
        include JSON::Serializable

        # The name of the application that corresponds to the revision.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # Additional information about the revision, including type and location.

        @[JSON::Field(key: "revision")]
        getter revision : Types::RevisionLocation?

        # General information about the revision.

        @[JSON::Field(key: "revisionInfo")]
        getter revision_info : Types::GenericRevisionInfo?

        def initialize(
          @application_name : String? = nil,
          @revision : Types::RevisionLocation? = nil,
          @revision_info : Types::GenericRevisionInfo? = nil
        )
        end
      end

      # Represents the input of a GetDeploymentConfig operation.

      struct GetDeploymentConfigInput
        include JSON::Serializable

        # The name of a deployment configuration associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String

        def initialize(
          @deployment_config_name : String
        )
        end
      end

      # Represents the output of a GetDeploymentConfig operation.

      struct GetDeploymentConfigOutput
        include JSON::Serializable

        # Information about the deployment configuration.

        @[JSON::Field(key: "deploymentConfigInfo")]
        getter deployment_config_info : Types::DeploymentConfigInfo?

        def initialize(
          @deployment_config_info : Types::DeploymentConfigInfo? = nil
        )
        end
      end

      # Represents the input of a GetDeploymentGroup operation.

      struct GetDeploymentGroupInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # The name of a deployment group for the specified application.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String

        def initialize(
          @application_name : String,
          @deployment_group_name : String
        )
        end
      end

      # Represents the output of a GetDeploymentGroup operation.

      struct GetDeploymentGroupOutput
        include JSON::Serializable

        # Information about the deployment group.

        @[JSON::Field(key: "deploymentGroupInfo")]
        getter deployment_group_info : Types::DeploymentGroupInfo?

        def initialize(
          @deployment_group_info : Types::DeploymentGroupInfo? = nil
        )
        end
      end

      # Represents the input of a GetDeployment operation.

      struct GetDeploymentInput
        include JSON::Serializable

        # The unique ID of a deployment associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end

      # Represents the input of a GetDeploymentInstance operation.

      struct GetDeploymentInstanceInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The unique ID of an instance in the deployment group.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String

        def initialize(
          @deployment_id : String,
          @instance_id : String
        )
        end
      end

      # Represents the output of a GetDeploymentInstance operation.

      struct GetDeploymentInstanceOutput
        include JSON::Serializable

        # Information about the instance.

        @[JSON::Field(key: "instanceSummary")]
        getter instance_summary : Types::InstanceSummary?

        def initialize(
          @instance_summary : Types::InstanceSummary? = nil
        )
        end
      end

      # Represents the output of a GetDeployment operation.

      struct GetDeploymentOutput
        include JSON::Serializable

        # Information about the deployment.

        @[JSON::Field(key: "deploymentInfo")]
        getter deployment_info : Types::DeploymentInfo?

        def initialize(
          @deployment_info : Types::DeploymentInfo? = nil
        )
        end
      end


      struct GetDeploymentTargetInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The unique ID of a deployment target.

        @[JSON::Field(key: "targetId")]
        getter target_id : String

        def initialize(
          @deployment_id : String,
          @target_id : String
        )
        end
      end


      struct GetDeploymentTargetOutput
        include JSON::Serializable

        # A deployment target that contains information about a deployment such as its status, lifecycle
        # events, and when it was last updated. It also contains metadata about the deployment target. The
        # deployment target metadata depends on the deployment target's type ( instanceTarget , lambdaTarget ,
        # or ecsTarget ).

        @[JSON::Field(key: "deploymentTarget")]
        getter deployment_target : Types::DeploymentTarget?

        def initialize(
          @deployment_target : Types::DeploymentTarget? = nil
        )
        end
      end

      # Represents the input of a GetOnPremisesInstance operation.

      struct GetOnPremisesInstanceInput
        include JSON::Serializable

        # The name of the on-premises instance about which to get information.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        def initialize(
          @instance_name : String
        )
        end
      end

      # Represents the output of a GetOnPremisesInstance operation.

      struct GetOnPremisesInstanceOutput
        include JSON::Serializable

        # Information about the on-premises instance.

        @[JSON::Field(key: "instanceInfo")]
        getter instance_info : Types::InstanceInfo?

        def initialize(
          @instance_info : Types::InstanceInfo? = nil
        )
        end
      end

      # No GitHub account connection exists with the named specified in the call.

      struct GitHubAccountTokenDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The call is missing a required GitHub account connection name.

      struct GitHubAccountTokenNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about the location of application artifacts stored in GitHub.

      struct GitHubLocation
        include JSON::Serializable

        # The SHA1 commit ID of the GitHub commit that represents the bundled artifacts for the application
        # revision.

        @[JSON::Field(key: "commitId")]
        getter commit_id : String?

        # The GitHub account and repository pair that stores a reference to the commit that represents the
        # bundled artifacts for the application revision. Specified as account/repository.

        @[JSON::Field(key: "repository")]
        getter repository : String?

        def initialize(
          @commit_id : String? = nil,
          @repository : String? = nil
        )
        end
      end

      # Information about the instances that belong to the replacement environment in a blue/green
      # deployment.

      struct GreenFleetProvisioningOption
        include JSON::Serializable

        # The method used to add instances to a replacement environment. DISCOVER_EXISTING : Use instances
        # that already exist or will be created manually. COPY_AUTO_SCALING_GROUP : Use settings from a
        # specified Auto Scaling group to define and create instances in a new Auto Scaling group.

        @[JSON::Field(key: "action")]
        getter action : String?

        def initialize(
          @action : String? = nil
        )
        end
      end

      # No IAM ARN was included in the request. You must use an IAM session ARN or user ARN in the request.

      struct IamArnRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The request included an IAM session ARN that has already been used to register a different instance.

      struct IamSessionArnAlreadyRegisteredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified user ARN is already registered with an on-premises instance.

      struct IamUserArnAlreadyRegisteredException
        include JSON::Serializable

        def initialize
        end
      end

      # An user ARN was not specified.

      struct IamUserArnRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified instance does not exist in the deployment group.

      struct InstanceDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # The instance ID was not specified.

      struct InstanceIdRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an on-premises instance.

      struct InstanceInfo
        include JSON::Serializable

        # If the on-premises instance was deregistered, the time at which the on-premises instance was
        # deregistered.

        @[JSON::Field(key: "deregisterTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deregister_time : Time?

        # The ARN of the IAM session associated with the on-premises instance.

        @[JSON::Field(key: "iamSessionArn")]
        getter iam_session_arn : String?

        # The user ARN associated with the on-premises instance.

        @[JSON::Field(key: "iamUserArn")]
        getter iam_user_arn : String?

        # The ARN of the on-premises instance.

        @[JSON::Field(key: "instanceArn")]
        getter instance_arn : String?

        # The name of the on-premises instance.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String?

        # The time at which the on-premises instance was registered.

        @[JSON::Field(key: "registerTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter register_time : Time?

        # The tags currently associated with the on-premises instance.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @deregister_time : Time? = nil,
          @iam_session_arn : String? = nil,
          @iam_user_arn : String? = nil,
          @instance_arn : String? = nil,
          @instance_name : String? = nil,
          @register_time : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The maximum number of allowed on-premises instances in a single call was exceeded.

      struct InstanceLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified on-premises instance name is already registered.

      struct InstanceNameAlreadyRegisteredException
        include JSON::Serializable

        def initialize
        end
      end

      # An on-premises instance name was not specified.

      struct InstanceNameRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified on-premises instance is not registered.

      struct InstanceNotRegisteredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an instance in a deployment.

      struct InstanceSummary
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The instance ID.

        @[JSON::Field(key: "instanceId")]
        getter instance_id : String?

        # Information about which environment an instance belongs to in a blue/green deployment. BLUE: The
        # instance is part of the original environment. GREEN: The instance is part of the replacement
        # environment.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # A timestamp that indicates when the instance information was last updated.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # A list of lifecycle events for this instance.

        @[JSON::Field(key: "lifecycleEvents")]
        getter lifecycle_events : Array(Types::LifecycleEvent)?

        # The deployment status for this instance: Pending : The deployment is pending for this instance. In
        # Progress : The deployment is in progress for this instance. Succeeded : The deployment has succeeded
        # for this instance. Failed : The deployment has failed for this instance. Skipped : The deployment
        # has been skipped for this instance. Unknown : The deployment status is unknown for this instance.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @deployment_id : String? = nil,
          @instance_id : String? = nil,
          @instance_type : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_events : Array(Types::LifecycleEvent)? = nil,
          @status : String? = nil
        )
        end
      end

      # A target Amazon EC2 or on-premises instance during a deployment that uses the EC2/On-premises
      # compute platform.

      struct InstanceTarget
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A label that identifies whether the instance is an original target ( BLUE ) or a replacement target
        # ( GREEN ).

        @[JSON::Field(key: "instanceLabel")]
        getter instance_label : String?

        # The date and time when the target instance was updated by a deployment.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The lifecycle events of the deployment to this target instance.

        @[JSON::Field(key: "lifecycleEvents")]
        getter lifecycle_events : Array(Types::LifecycleEvent)?

        # The status an EC2/On-premises deployment's target instance.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the target.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        # The unique ID of a deployment target that has a type of instanceTarget .

        @[JSON::Field(key: "targetId")]
        getter target_id : String?

        def initialize(
          @deployment_id : String? = nil,
          @instance_label : String? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_events : Array(Types::LifecycleEvent)? = nil,
          @status : String? = nil,
          @target_arn : String? = nil,
          @target_id : String? = nil
        )
        end
      end

      # The format of the alarm configuration is invalid. Possible causes include: The alarm list is null.
      # The alarm object is null. The alarm name is empty or null or exceeds the limit of 255 characters.
      # Two alarms with the same name have been specified. The alarm configuration is enabled, but the alarm
      # list is empty.

      struct InvalidAlarmConfigException
        include JSON::Serializable

        def initialize
        end
      end

      # The application name was specified in an invalid format.

      struct InvalidApplicationNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified ARN is not in a valid format.

      struct InvalidArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The automatic rollback configuration was specified in an invalid format. For example, automatic
      # rollback is enabled, but an invalid triggering event type or no event types were listed.

      struct InvalidAutoRollbackConfigException
        include JSON::Serializable

        def initialize
        end
      end

      # The Auto Scaling group was specified in an invalid format or does not exist.

      struct InvalidAutoScalingGroupException
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration for the blue/green deployment group was provided in an invalid format. For
      # information about deployment configuration format, see CreateDeploymentConfig .

      struct InvalidBlueGreenDeploymentConfigurationException
        include JSON::Serializable

        def initialize
        end
      end

      # The bucket name either doesn't exist or was specified in an invalid format.

      struct InvalidBucketNameFilterException
        include JSON::Serializable

        def initialize
        end
      end

      # The computePlatform is invalid. The computePlatform should be Lambda , Server , or ECS .

      struct InvalidComputePlatformException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployed state filter was specified in an invalid format.

      struct InvalidDeployedStateFilterException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment configuration name was specified in an invalid format.

      struct InvalidDeploymentConfigNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The deployment group name was specified in an invalid format.

      struct InvalidDeploymentGroupNameException
        include JSON::Serializable

        def initialize
        end
      end

      # At least one of the deployment IDs was specified in an invalid format.

      struct InvalidDeploymentIdException
        include JSON::Serializable

        def initialize
        end
      end

      # An instance type was specified for an in-place deployment. Instance types are supported for
      # blue/green deployments only.

      struct InvalidDeploymentInstanceTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified deployment status doesn't exist or cannot be determined.

      struct InvalidDeploymentStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid deployment style was specified. Valid deployment types include "IN_PLACE" and
      # "BLUE_GREEN." Valid deployment options include "WITH_TRAFFIC_CONTROL" and "WITHOUT_TRAFFIC_CONTROL."

      struct InvalidDeploymentStyleException
        include JSON::Serializable

        def initialize
        end
      end

      # The target ID provided was not valid.

      struct InvalidDeploymentTargetIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The wait type is invalid.

      struct InvalidDeploymentWaitTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # A call was submitted that specified both Ec2TagFilters and Ec2TagSet, but only one of these data
      # types can be used in a single call.

      struct InvalidEC2TagCombinationException
        include JSON::Serializable

        def initialize
        end
      end

      # The tag was specified in an invalid format.

      struct InvalidEC2TagException
        include JSON::Serializable

        def initialize
        end
      end

      # The Amazon ECS service identifier is not valid.

      struct InvalidECSServiceException
        include JSON::Serializable

        def initialize
        end
      end

      # The external ID was specified in an invalid format.

      struct InvalidExternalIdException
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid fileExistsBehavior option was specified to determine how CodeDeploy handles files or
      # directories that already exist in a deployment target location, but weren't part of the previous
      # successful deployment. Valid values include "DISALLOW," "OVERWRITE," and "RETAIN."

      struct InvalidFileExistsBehaviorException
        include JSON::Serializable

        def initialize
        end
      end

      # The GitHub token is not valid.

      struct InvalidGitHubAccountTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # The format of the specified GitHub account connection name is invalid.

      struct InvalidGitHubAccountTokenNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The IAM session ARN was specified in an invalid format.

      struct InvalidIamSessionArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The user ARN was specified in an invalid format.

      struct InvalidIamUserArnException
        include JSON::Serializable

        def initialize
        end
      end

      # The IgnoreApplicationStopFailures value is invalid. For Lambda deployments, false is expected. For
      # EC2/On-premises deployments, true or false is expected.

      struct InvalidIgnoreApplicationStopFailuresValueException
        include JSON::Serializable

        def initialize
        end
      end

      # The input was specified in an invalid format.

      struct InvalidInputException
        include JSON::Serializable

        def initialize
        end
      end


      struct InvalidInstanceIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The on-premises instance name was specified in an invalid format.

      struct InvalidInstanceNameException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified instance status does not exist.

      struct InvalidInstanceStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid instance type was specified for instances in a blue/green deployment. Valid values
      # include "Blue" for an original environment and "Green" for a replacement environment.

      struct InvalidInstanceTypeException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified key prefix filter was specified in an invalid format.

      struct InvalidKeyPrefixFilterException
        include JSON::Serializable

        def initialize
        end
      end

      # A lifecycle event hook is invalid. Review the hooks section in your AppSpec file to ensure the
      # lifecycle events and hooks functions are valid.

      struct InvalidLifecycleEventHookExecutionIdException
        include JSON::Serializable

        def initialize
        end
      end

      # The result of a Lambda validation function that verifies a lifecycle event is invalid. It should
      # return Succeeded or Failed .

      struct InvalidLifecycleEventHookExecutionStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid load balancer name, or no load balancer name, was specified.

      struct InvalidLoadBalancerInfoException
        include JSON::Serializable

        def initialize
        end
      end

      # The minimum healthy instance value was specified in an invalid format.

      struct InvalidMinimumHealthyHostValueException
        include JSON::Serializable

        def initialize
        end
      end

      # The next token was specified in an invalid format.

      struct InvalidNextTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # A call was submitted that specified both OnPremisesTagFilters and OnPremisesTagSet, but only one of
      # these data types can be used in a single call.

      struct InvalidOnPremisesTagCombinationException
        include JSON::Serializable

        def initialize
        end
      end

      # An invalid operation was detected.

      struct InvalidOperationException
        include JSON::Serializable

        def initialize
        end
      end

      # The registration status was specified in an invalid format.

      struct InvalidRegistrationStatusException
        include JSON::Serializable

        def initialize
        end
      end

      # The revision was specified in an invalid format.

      struct InvalidRevisionException
        include JSON::Serializable

        def initialize
        end
      end

      # The service role ARN was specified in an invalid format. Or, if an Auto Scaling group was specified,
      # the specified service role does not grant the appropriate permissions to Amazon EC2 Auto Scaling.

      struct InvalidRoleException
        include JSON::Serializable

        def initialize
        end
      end

      # The column name to sort by is either not present or was specified in an invalid format.

      struct InvalidSortByException
        include JSON::Serializable

        def initialize
        end
      end

      # The sort order was specified in an invalid format.

      struct InvalidSortOrderException
        include JSON::Serializable

        def initialize
        end
      end

      # The tag was specified in an invalid format.

      struct InvalidTagException
        include JSON::Serializable

        def initialize
        end
      end

      # The tag filter was specified in an invalid format.

      struct InvalidTagFilterException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified tags are not valid.

      struct InvalidTagsToAddException
        include JSON::Serializable

        def initialize
        end
      end

      # A target is not valid.

      struct InvalidTargetException
        include JSON::Serializable

        def initialize
        end
      end

      # The target filter name is invalid.

      struct InvalidTargetFilterNameException
        include JSON::Serializable

        def initialize
        end
      end

      # A target group pair associated with this deployment is not valid.

      struct InvalidTargetGroupPairException
        include JSON::Serializable

        def initialize
        end
      end

      # The target instance configuration is invalid. Possible causes include: Configuration data for target
      # instances was entered for an in-place deployment. The limit of 10 tags for a tag type was exceeded.
      # The combined length of the tag names exceeded the limit. A specified tag is not currently applied to
      # any instances.

      struct InvalidTargetInstancesException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified time range was specified in an invalid format.

      struct InvalidTimeRangeException
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration that specifies how traffic is routed during a deployment is invalid.

      struct InvalidTrafficRoutingConfigurationException
        include JSON::Serializable

        def initialize
        end
      end

      # The trigger was specified in an invalid format.

      struct InvalidTriggerConfigException
        include JSON::Serializable

        def initialize
        end
      end

      # The UpdateOutdatedInstancesOnly value is invalid. For Lambda deployments, false is expected. For
      # EC2/On-premises deployments, true or false is expected.

      struct InvalidUpdateOutdatedInstancesOnlyValueException
        include JSON::Serializable

        def initialize
        end
      end

      # The ZonalConfig object is not valid.

      struct InvalidZonalDeploymentConfigurationException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a Lambda function specified in a deployment.

      struct LambdaFunctionInfo
        include JSON::Serializable

        # The version of a Lambda function that production traffic points to.

        @[JSON::Field(key: "currentVersion")]
        getter current_version : String?

        # The alias of a Lambda function. For more information, see Lambda Function Aliases in the Lambda
        # Developer Guide .

        @[JSON::Field(key: "functionAlias")]
        getter function_alias : String?

        # The name of a Lambda function.

        @[JSON::Field(key: "functionName")]
        getter function_name : String?

        # The version of a Lambda function that production traffic points to after the Lambda function is
        # deployed.

        @[JSON::Field(key: "targetVersion")]
        getter target_version : String?

        # The percentage of production traffic that the target version of a Lambda function receives.

        @[JSON::Field(key: "targetVersionWeight")]
        getter target_version_weight : Float64?

        def initialize(
          @current_version : String? = nil,
          @function_alias : String? = nil,
          @function_name : String? = nil,
          @target_version : String? = nil,
          @target_version_weight : Float64? = nil
        )
        end
      end

      # Information about the target Lambda function during an Lambda deployment.

      struct LambdaTarget
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A LambdaFunctionInfo object that describes a target Lambda function.

        @[JSON::Field(key: "lambdaFunctionInfo")]
        getter lambda_function_info : Types::LambdaFunctionInfo?

        # The date and time when the target Lambda function was updated by a deployment.

        @[JSON::Field(key: "lastUpdatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated_at : Time?

        # The lifecycle events of the deployment to this target Lambda function.

        @[JSON::Field(key: "lifecycleEvents")]
        getter lifecycle_events : Array(Types::LifecycleEvent)?

        # The status an Lambda deployment's target Lambda function.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the target.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String?

        # The unique ID of a deployment target that has a type of lambdaTarget .

        @[JSON::Field(key: "targetId")]
        getter target_id : String?

        def initialize(
          @deployment_id : String? = nil,
          @lambda_function_info : Types::LambdaFunctionInfo? = nil,
          @last_updated_at : Time? = nil,
          @lifecycle_events : Array(Types::LifecycleEvent)? = nil,
          @status : String? = nil,
          @target_arn : String? = nil,
          @target_id : String? = nil
        )
        end
      end

      # Information about the most recent attempted or successful deployment to a deployment group.

      struct LastDeploymentInfo
        include JSON::Serializable

        # A timestamp that indicates when the most recent deployment to the deployment group started.

        @[JSON::Field(key: "createTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter create_time : Time?

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # A timestamp that indicates when the most recent deployment to the deployment group was complete.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The status of the most recent deployment.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @create_time : Time? = nil,
          @deployment_id : String? = nil,
          @end_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Information about a deployment lifecycle event.

      struct LifecycleEvent
        include JSON::Serializable

        # Diagnostic information about the deployment lifecycle event.

        @[JSON::Field(key: "diagnostics")]
        getter diagnostics : Types::Diagnostics?

        # A timestamp that indicates when the deployment lifecycle event ended.

        @[JSON::Field(key: "endTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The deployment lifecycle event name, such as ApplicationStop , BeforeInstall , AfterInstall ,
        # ApplicationStart , or ValidateService .

        @[JSON::Field(key: "lifecycleEventName")]
        getter lifecycle_event_name : String?

        # A timestamp that indicates when the deployment lifecycle event started.

        @[JSON::Field(key: "startTime", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The deployment lifecycle event status: Pending: The deployment lifecycle event is pending.
        # InProgress: The deployment lifecycle event is in progress. Succeeded: The deployment lifecycle event
        # ran successfully. Failed: The deployment lifecycle event has failed. Skipped: The deployment
        # lifecycle event has been skipped. Unknown: The deployment lifecycle event is unknown.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @diagnostics : Types::Diagnostics? = nil,
          @end_time : Time? = nil,
          @lifecycle_event_name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # An attempt to return the status of an already completed lifecycle event occurred.

      struct LifecycleEventAlreadyCompletedException
        include JSON::Serializable

        def initialize
        end
      end

      # The limit for lifecycle hooks was exceeded.

      struct LifecycleHookLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a ListApplicationRevisions operation.

      struct ListApplicationRevisionsInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # Whether to list revisions based on whether the revision is the target revision of a deployment
        # group: include : List revisions that are target revisions of a deployment group. exclude : Do not
        # list revisions that are target revisions of a deployment group. ignore : List all revisions.

        @[JSON::Field(key: "deployed")]
        getter deployed : String?

        # An identifier returned from the previous ListApplicationRevisions call. It can be used to return the
        # next set of applications in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An Amazon S3 bucket name to limit the search for revisions. If set to null, all of the user's
        # buckets are searched.

        @[JSON::Field(key: "s3Bucket")]
        getter s3_bucket : String?

        # A key prefix for the set of Amazon S3 objects to limit the search for revisions.

        @[JSON::Field(key: "s3KeyPrefix")]
        getter s3_key_prefix : String?

        # The column name to use to sort the list results: registerTime : Sort by the time the revisions were
        # registered with CodeDeploy. firstUsedTime : Sort by the time the revisions were first used in a
        # deployment. lastUsedTime : Sort by the time the revisions were last used in a deployment. If not
        # specified or set to null, the results are returned in an arbitrary order.

        @[JSON::Field(key: "sortBy")]
        getter sort_by : String?

        # The order in which to sort the list results: ascending : ascending order. descending : descending
        # order. If not specified, the results are sorted in ascending order. If set to null, the results are
        # sorted in an arbitrary order.

        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String?

        def initialize(
          @application_name : String,
          @deployed : String? = nil,
          @next_token : String? = nil,
          @s3_bucket : String? = nil,
          @s3_key_prefix : String? = nil,
          @sort_by : String? = nil,
          @sort_order : String? = nil
        )
        end
      end

      # Represents the output of a ListApplicationRevisions operation.

      struct ListApplicationRevisionsOutput
        include JSON::Serializable

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list application revisions call to return the next set of application revisions in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of locations that contain the matching revisions.

        @[JSON::Field(key: "revisions")]
        getter revisions : Array(Types::RevisionLocation)?

        def initialize(
          @next_token : String? = nil,
          @revisions : Array(Types::RevisionLocation)? = nil
        )
        end
      end

      # Represents the input of a ListApplications operation.

      struct ListApplicationsInput
        include JSON::Serializable

        # An identifier returned from the previous list applications call. It can be used to return the next
        # set of applications in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListApplications operation.

      struct ListApplicationsOutput
        include JSON::Serializable

        # A list of application names.

        @[JSON::Field(key: "applications")]
        getter applications : Array(String)?

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list applications call to return the next set of applications in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListDeploymentConfigs operation.

      struct ListDeploymentConfigsInput
        include JSON::Serializable

        # An identifier returned from the previous ListDeploymentConfigs call. It can be used to return the
        # next set of deployment configurations in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListDeploymentConfigs operation.

      struct ListDeploymentConfigsOutput
        include JSON::Serializable

        # A list of deployment configurations, including built-in configurations such as
        # CodeDeployDefault.OneAtATime .

        @[JSON::Field(key: "deploymentConfigsList")]
        getter deployment_configs_list : Array(String)?

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list deployment configurations call to return the next set of deployment configurations
        # in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployment_configs_list : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListDeploymentGroups operation.

      struct ListDeploymentGroupsInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # An identifier returned from the previous list deployment groups call. It can be used to return the
        # next set of deployment groups in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_name : String,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListDeploymentGroups operation.

      struct ListDeploymentGroupsOutput
        include JSON::Serializable

        # The application name.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # A list of deployment group names.

        @[JSON::Field(key: "deploymentGroups")]
        getter deployment_groups : Array(String)?

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list deployment groups call to return the next set of deployment groups in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_name : String? = nil,
          @deployment_groups : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListDeploymentInstances operation.

      struct ListDeploymentInstancesInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # A subset of instances to list by status: Pending : Include those instances with pending deployments.
        # InProgress : Include those instances where deployments are still in progress. Succeeded : Include
        # those instances with successful deployments. Failed : Include those instances with failed
        # deployments. Skipped : Include those instances with skipped deployments. Unknown : Include those
        # instances with deployments in an unknown state.

        @[JSON::Field(key: "instanceStatusFilter")]
        getter instance_status_filter : Array(String)?

        # The set of instances in a blue/green deployment, either those in the original environment ("BLUE")
        # or those in the replacement environment ("GREEN"), for which you want to view instance information.

        @[JSON::Field(key: "instanceTypeFilter")]
        getter instance_type_filter : Array(String)?

        # An identifier returned from the previous list deployment instances call. It can be used to return
        # the next set of deployment instances in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployment_id : String,
          @instance_status_filter : Array(String)? = nil,
          @instance_type_filter : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListDeploymentInstances operation.

      struct ListDeploymentInstancesOutput
        include JSON::Serializable

        # A list of instance IDs.

        @[JSON::Field(key: "instancesList")]
        getter instances_list : Array(String)?

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list deployment instances call to return the next set of deployment instances in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instances_list : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentTargetsInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # A token identifier returned from the previous ListDeploymentTargets call. It can be used to return
        # the next set of deployment targets in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A key used to filter the returned targets. The two valid values are: TargetStatus - A TargetStatus
        # filter string can be Failed , InProgress , Pending , Ready , Skipped , Succeeded , or Unknown .
        # ServerInstanceLabel - A ServerInstanceLabel filter string can be Blue or Green .

        @[JSON::Field(key: "targetFilters")]
        getter target_filters : Hash(String, Array(String))?

        def initialize(
          @deployment_id : String,
          @next_token : String? = nil,
          @target_filters : Hash(String, Array(String))? = nil
        )
        end
      end


      struct ListDeploymentTargetsOutput
        include JSON::Serializable

        # If a large amount of information is returned, a token identifier is also returned. It can be used in
        # a subsequent ListDeploymentTargets call to return the next set of deployment targets in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The unique IDs of deployment targets.

        @[JSON::Field(key: "targetIds")]
        getter target_ids : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @target_ids : Array(String)? = nil
        )
        end
      end

      # Represents the input of a ListDeployments operation.

      struct ListDeploymentsInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account. If
        # applicationName is specified, then deploymentGroupName must be specified. If it is not specified,
        # then deploymentGroupName must not be specified.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # A time range (start and end) for returning a subset of the list of deployments.

        @[JSON::Field(key: "createTimeRange")]
        getter create_time_range : Types::TimeRange?

        # The name of a deployment group for the specified application. If deploymentGroupName is specified,
        # then applicationName must be specified. If it is not specified, then applicationName must not be
        # specified.

        @[JSON::Field(key: "deploymentGroupName")]
        getter deployment_group_name : String?

        # The unique ID of an external resource for returning deployments linked to the external resource.

        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # A subset of deployments to list by status: Created : Include created deployments in the resulting
        # list. Queued : Include queued deployments in the resulting list. In Progress : Include in-progress
        # deployments in the resulting list. Succeeded : Include successful deployments in the resulting list.
        # Failed : Include failed deployments in the resulting list. Stopped : Include stopped deployments in
        # the resulting list.

        @[JSON::Field(key: "includeOnlyStatuses")]
        getter include_only_statuses : Array(String)?

        # An identifier returned from the previous list deployments call. It can be used to return the next
        # set of deployments in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_name : String? = nil,
          @create_time_range : Types::TimeRange? = nil,
          @deployment_group_name : String? = nil,
          @external_id : String? = nil,
          @include_only_statuses : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListDeployments operation.

      struct ListDeploymentsOutput
        include JSON::Serializable

        # A list of deployment IDs.

        @[JSON::Field(key: "deployments")]
        getter deployments : Array(String)?

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list deployments call to return the next set of deployments in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListGitHubAccountTokenNames operation.

      struct ListGitHubAccountTokenNamesInput
        include JSON::Serializable

        # An identifier returned from the previous ListGitHubAccountTokenNames call. It can be used to return
        # the next set of names in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListGitHubAccountTokenNames operation.

      struct ListGitHubAccountTokenNamesOutput
        include JSON::Serializable

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent ListGitHubAccountTokenNames call to return the next set of names in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of names of connections to GitHub accounts.

        @[JSON::Field(key: "tokenNameList")]
        getter token_name_list : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @token_name_list : Array(String)? = nil
        )
        end
      end

      # Represents the input of a ListOnPremisesInstances operation.

      struct ListOnPremisesInstancesInput
        include JSON::Serializable

        # An identifier returned from the previous list on-premises instances call. It can be used to return
        # the next set of on-premises instances in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The registration status of the on-premises instances: Deregistered : Include deregistered
        # on-premises instances in the resulting list. Registered : Include registered on-premises instances
        # in the resulting list.

        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String?

        # The on-premises instance tags that are used to restrict the on-premises instance names returned.

        @[JSON::Field(key: "tagFilters")]
        getter tag_filters : Array(Types::TagFilter)?

        def initialize(
          @next_token : String? = nil,
          @registration_status : String? = nil,
          @tag_filters : Array(Types::TagFilter)? = nil
        )
        end
      end

      # Represents the output of the list on-premises instances operation.

      struct ListOnPremisesInstancesOutput
        include JSON::Serializable

        # The list of matching on-premises instance names.

        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)?

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list on-premises instances call to return the next set of on-premises instances in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @instance_names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of a CodeDeploy resource. ListTagsForResource returns all the tags associated with the
        # resource that is identified by the ResourceArn .

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # An identifier returned from the previous ListTagsForResource call. It can be used to return the next
        # set of applications in the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # If a large amount of information is returned, an identifier is also returned. It can be used in a
        # subsequent list application revisions call to return the next set of application revisions in the
        # list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of tags returned by ListTagsForResource . The tags are associated with the resource
        # identified by the input ResourceArn parameter.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Information about the Elastic Load Balancing load balancer or target group used in a deployment. You
      # can use load balancers and target groups in combination. For example, if you have two Classic Load
      # Balancers, and five target groups tied to an Application Load Balancer, you can specify the two
      # Classic Load Balancers in elbInfoList , and the five target groups in targetGroupInfoList .

      struct LoadBalancerInfo
        include JSON::Serializable

        # An array that contains information about the load balancers to use for load balancing in a
        # deployment. If you're using Classic Load Balancers, specify those load balancers in this array. You
        # can add up to 10 load balancers to the array. If you're using Application Load Balancers or Network
        # Load Balancers, use the targetGroupInfoList array instead of this one.

        @[JSON::Field(key: "elbInfoList")]
        getter elb_info_list : Array(Types::ELBInfo)?

        # An array that contains information about the target groups to use for load balancing in a
        # deployment. If you're using Application Load Balancers and Network Load Balancers, specify their
        # associated target groups in this array. You can add up to 10 target groups to the array. If you're
        # using Classic Load Balancers, use the elbInfoList array instead of this one.

        @[JSON::Field(key: "targetGroupInfoList")]
        getter target_group_info_list : Array(Types::TargetGroupInfo)?

        # The target group pair information. This is an array of TargeGroupPairInfo objects with a maximum
        # size of one.

        @[JSON::Field(key: "targetGroupPairInfoList")]
        getter target_group_pair_info_list : Array(Types::TargetGroupPairInfo)?

        def initialize(
          @elb_info_list : Array(Types::ELBInfo)? = nil,
          @target_group_info_list : Array(Types::TargetGroupInfo)? = nil,
          @target_group_pair_info_list : Array(Types::TargetGroupPairInfo)? = nil
        )
        end
      end

      # Information about the minimum number of healthy instances.

      struct MinimumHealthyHosts
        include JSON::Serializable

        # The minimum healthy instance type: HOST_COUNT : The minimum number of healthy instances as an
        # absolute value. FLEET_PERCENT : The minimum number of healthy instances as a percentage of the total
        # number of instances in the deployment. In an example of nine instances, if a HOST_COUNT of six is
        # specified, deploy to up to three instances at a time. The deployment is successful if six or more
        # instances are deployed to successfully. Otherwise, the deployment fails. If a FLEET_PERCENT of 40 is
        # specified, deploy to up to five instances at a time. The deployment is successful if four or more
        # instances are deployed to successfully. Otherwise, the deployment fails. In a call to the
        # GetDeploymentConfig , CodeDeployDefault.OneAtATime returns a minimum healthy instance type of
        # MOST_CONCURRENCY and a value of 1. This means a deployment to only one instance at a time. (You
        # cannot set the type to MOST_CONCURRENCY, only to HOST_COUNT or FLEET_PERCENT.) In addition, with
        # CodeDeployDefault.OneAtATime, CodeDeploy attempts to ensure that all instances but one are kept in a
        # healthy state during the deployment. Although this allows one instance at a time to be taken offline
        # for a new deployment, it also means that if the deployment to the last instance fails, the overall
        # deployment is still successful. For more information, see CodeDeploy Instance Health in the
        # CodeDeploy User Guide .

        @[JSON::Field(key: "type")]
        getter type : String?

        # The minimum healthy instance value.

        @[JSON::Field(key: "value")]
        getter value : Int32?

        def initialize(
          @type : String? = nil,
          @value : Int32? = nil
        )
        end
      end

      # Information about the minimum number of healthy instances per Availability Zone.

      struct MinimumHealthyHostsPerZone
        include JSON::Serializable

        # The type associated with the MinimumHealthyHostsPerZone option.

        @[JSON::Field(key: "type")]
        getter type : String?

        # The value associated with the MinimumHealthyHostsPerZone option.

        @[JSON::Field(key: "value")]
        getter value : Int32?

        def initialize(
          @type : String? = nil,
          @value : Int32? = nil
        )
        end
      end

      # Both an user ARN and an IAM session ARN were included in the request. Use only one ARN type.

      struct MultipleIamArnsProvidedException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about groups of on-premises instance tags.

      struct OnPremisesTagSet
        include JSON::Serializable

        # A list that contains other lists of on-premises instance tag groups. For an instance to be included
        # in the deployment group, it must be identified by all of the tag groups in the list.

        @[JSON::Field(key: "onPremisesTagSetList")]
        getter on_premises_tag_set_list : Array(Array(Types::TagFilter))?

        def initialize(
          @on_premises_tag_set_list : Array(Array(Types::TagFilter))? = nil
        )
        end
      end

      # The API used does not support the deployment.

      struct OperationNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end


      struct PutLifecycleEventHookExecutionStatusInput
        include JSON::Serializable

        # The unique ID of a deployment. Pass this ID to a Lambda function that validates a deployment
        # lifecycle event.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        # The execution ID of a deployment's lifecycle hook. A deployment lifecycle hook is specified in the
        # hooks section of the AppSpec file.

        @[JSON::Field(key: "lifecycleEventHookExecutionId")]
        getter lifecycle_event_hook_execution_id : String?

        # The result of a Lambda function that validates a deployment lifecycle event. The values listed in
        # Valid Values are valid for lifecycle statuses in general; however, only Succeeded and Failed can be
        # passed successfully in your API call.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @deployment_id : String? = nil,
          @lifecycle_event_hook_execution_id : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct PutLifecycleEventHookExecutionStatusOutput
        include JSON::Serializable

        # The execution ID of the lifecycle event hook. A hook is specified in the hooks section of the
        # deployment's AppSpec file.

        @[JSON::Field(key: "lifecycleEventHookExecutionId")]
        getter lifecycle_event_hook_execution_id : String?

        def initialize(
          @lifecycle_event_hook_execution_id : String? = nil
        )
        end
      end

      # A revision for an Lambda deployment that is a YAML-formatted or JSON-formatted string. For Lambda
      # deployments, the revision is the same as the AppSpec file.

      struct RawString
        include JSON::Serializable

        # The YAML-formatted or JSON-formatted revision string. It includes information about which Lambda
        # function to update and optional Lambda functions that validate deployment lifecycle events.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The SHA256 hash value of the revision content.

        @[JSON::Field(key: "sha256")]
        getter sha256 : String?

        def initialize(
          @content : String? = nil,
          @sha256 : String? = nil
        )
        end
      end

      # Represents the input of a RegisterApplicationRevision operation.

      struct RegisterApplicationRevisionInput
        include JSON::Serializable

        # The name of an CodeDeploy application associated with the user or Amazon Web Services account.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # Information about the application revision to register, including type and location.

        @[JSON::Field(key: "revision")]
        getter revision : Types::RevisionLocation

        # A comment about the revision.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @application_name : String,
          @revision : Types::RevisionLocation,
          @description : String? = nil
        )
        end
      end

      # Represents the input of the register on-premises instance operation.

      struct RegisterOnPremisesInstanceInput
        include JSON::Serializable

        # The name of the on-premises instance to register.

        @[JSON::Field(key: "instanceName")]
        getter instance_name : String

        # The ARN of the IAM session to associate with the on-premises instance.

        @[JSON::Field(key: "iamSessionArn")]
        getter iam_session_arn : String?

        # The ARN of the user to associate with the on-premises instance.

        @[JSON::Field(key: "iamUserArn")]
        getter iam_user_arn : String?

        def initialize(
          @instance_name : String,
          @iam_session_arn : String? = nil,
          @iam_user_arn : String? = nil
        )
        end
      end

      # Information about deployments related to the specified deployment.

      struct RelatedDeployments
        include JSON::Serializable

        # The deployment IDs of 'auto-update outdated instances' deployments triggered by this deployment.

        @[JSON::Field(key: "autoUpdateOutdatedInstancesDeploymentIds")]
        getter auto_update_outdated_instances_deployment_ids : Array(String)?

        # The deployment ID of the root deployment that triggered this deployment.

        @[JSON::Field(key: "autoUpdateOutdatedInstancesRootDeploymentId")]
        getter auto_update_outdated_instances_root_deployment_id : String?

        def initialize(
          @auto_update_outdated_instances_deployment_ids : Array(String)? = nil,
          @auto_update_outdated_instances_root_deployment_id : String? = nil
        )
        end
      end

      # Represents the input of a RemoveTagsFromOnPremisesInstances operation.

      struct RemoveTagsFromOnPremisesInstancesInput
        include JSON::Serializable

        # The names of the on-premises instances from which to remove tags.

        @[JSON::Field(key: "instanceNames")]
        getter instance_names : Array(String)

        # The tag key-value pairs to remove from the on-premises instances.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @instance_names : Array(String),
          @tags : Array(Types::Tag)
        )
        end
      end

      # The ARN of a resource is required, but was not found.

      struct ResourceArnRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource could not be validated.

      struct ResourceValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # The named revision does not exist with the user or Amazon Web Services account.

      struct RevisionDoesNotExistException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about an application revision.

      struct RevisionInfo
        include JSON::Serializable

        # Information about an application revision, including usage details and associated deployment groups.

        @[JSON::Field(key: "genericRevisionInfo")]
        getter generic_revision_info : Types::GenericRevisionInfo?

        # Information about the location and type of an application revision.

        @[JSON::Field(key: "revisionLocation")]
        getter revision_location : Types::RevisionLocation?

        def initialize(
          @generic_revision_info : Types::GenericRevisionInfo? = nil,
          @revision_location : Types::RevisionLocation? = nil
        )
        end
      end

      # Information about the location of an application revision.

      struct RevisionLocation
        include JSON::Serializable

        # The content of an AppSpec file for an Lambda or Amazon ECS deployment. The content is formatted as
        # JSON or YAML and stored as a RawString.

        @[JSON::Field(key: "appSpecContent")]
        getter app_spec_content : Types::AppSpecContent?

        # Information about the location of application artifacts stored in GitHub.

        @[JSON::Field(key: "gitHubLocation")]
        getter git_hub_location : Types::GitHubLocation?

        # The type of application revision: S3: An application revision stored in Amazon S3. GitHub: An
        # application revision stored in GitHub (EC2/On-premises deployments only). String: A YAML-formatted
        # or JSON-formatted string (Lambda deployments only). AppSpecContent: An AppSpecContent object that
        # contains the contents of an AppSpec file for an Lambda or Amazon ECS deployment. The content is
        # formatted as JSON or YAML stored as a RawString.

        @[JSON::Field(key: "revisionType")]
        getter revision_type : String?

        # Information about the location of a revision stored in Amazon S3.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3Location?

        # Information about the location of an Lambda deployment revision stored as a RawString.

        @[JSON::Field(key: "string")]
        getter string : Types::RawString?

        def initialize(
          @app_spec_content : Types::AppSpecContent? = nil,
          @git_hub_location : Types::GitHubLocation? = nil,
          @revision_type : String? = nil,
          @s3_location : Types::S3Location? = nil,
          @string : Types::RawString? = nil
        )
        end
      end

      # The revision ID was not specified.

      struct RevisionRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # The role ID was not specified.

      struct RoleRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a deployment rollback.

      struct RollbackInfo
        include JSON::Serializable

        # The ID of the deployment rollback.

        @[JSON::Field(key: "rollbackDeploymentId")]
        getter rollback_deployment_id : String?

        # Information that describes the status of a deployment rollback (for example, whether the deployment
        # can't be rolled back, is in progress, failed, or succeeded).

        @[JSON::Field(key: "rollbackMessage")]
        getter rollback_message : String?

        # The deployment ID of the deployment that was underway and triggered a rollback deployment because it
        # failed or was stopped.

        @[JSON::Field(key: "rollbackTriggeringDeploymentId")]
        getter rollback_triggering_deployment_id : String?

        def initialize(
          @rollback_deployment_id : String? = nil,
          @rollback_message : String? = nil,
          @rollback_triggering_deployment_id : String? = nil
        )
        end
      end

      # Information about the location of application artifacts stored in Amazon S3.

      struct S3Location
        include JSON::Serializable

        # The name of the Amazon S3 bucket where the application revision is stored.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The file type of the application revision. Must be one of the following: tar : A tar archive file.
        # tgz : A compressed tar archive file. zip : A zip archive file. YAML : A YAML-formatted file. JSON :
        # A JSON-formatted file.

        @[JSON::Field(key: "bundleType")]
        getter bundle_type : String?

        # The ETag of the Amazon S3 object that represents the bundled artifacts for the application revision.
        # If the ETag is not specified as an input parameter, ETag validation of the object is skipped.

        @[JSON::Field(key: "eTag")]
        getter e_tag : String?

        # The name of the Amazon S3 object that represents the bundled artifacts for the application revision.

        @[JSON::Field(key: "key")]
        getter key : String?

        # A specific version of the Amazon S3 object that represents the bundled artifacts for the application
        # revision. If the version is not specified, the system uses the most recent version by default.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @bucket : String? = nil,
          @bundle_type : String? = nil,
          @e_tag : String? = nil,
          @key : String? = nil,
          @version : String? = nil
        )
        end
      end


      struct SkipWaitTimeForInstanceTerminationInput
        include JSON::Serializable

        # The unique ID of a blue/green deployment for which you want to skip the instance termination wait
        # time.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String?

        def initialize(
          @deployment_id : String? = nil
        )
        end
      end

      # Represents the input of a StopDeployment operation.

      struct StopDeploymentInput
        include JSON::Serializable

        # The unique ID of a deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # Indicates, when a deployment is stopped, whether instances that have been updated should be rolled
        # back to the previous version of the application revision.

        @[JSON::Field(key: "autoRollbackEnabled")]
        getter auto_rollback_enabled : Bool?

        def initialize(
          @deployment_id : String,
          @auto_rollback_enabled : Bool? = nil
        )
        end
      end

      # Represents the output of a StopDeployment operation.

      struct StopDeploymentOutput
        include JSON::Serializable

        # The status of the stop deployment operation: Pending: The stop operation is pending. Succeeded: The
        # stop operation was successful.

        @[JSON::Field(key: "status")]
        getter status : String?

        # An accompanying status message.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @status : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # Information about a tag.

      struct Tag
        include JSON::Serializable

        # The tag's key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The tag's value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Information about an on-premises instance tag filter.

      struct TagFilter
        include JSON::Serializable

        # The on-premises instance tag filter key.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The on-premises instance tag filter type: KEY_ONLY: Key only. VALUE_ONLY: Value only. KEY_AND_VALUE:
        # Key and value.

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The on-premises instance tag filter value.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The maximum allowed number of tags was exceeded.

      struct TagLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A tag was not specified.

      struct TagRequiredException
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The ARN of a resource, such as a CodeDeploy application or deployment group.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags that TagResource associates with a resource. The resource is identified by the
        # ResourceArn input parameter.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end


      struct TagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The number of tag groups included in the tag set list exceeded the maximum allowed limit of 3.

      struct TagSetListLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about a target group in Elastic Load Balancing to use in a deployment. Instances are
      # registered as targets in a target group, and traffic is routed to the target group.

      struct TargetGroupInfo
        include JSON::Serializable

        # For blue/green deployments, the name of the target group that instances in the original environment
        # are deregistered from, and instances in the replacement environment are registered with. For
        # in-place deployments, the name of the target group that instances are deregistered from, so they are
        # not serving traffic during a deployment, and then re-registered with after the deployment is
        # complete.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Information about two target groups and how traffic is routed during an Amazon ECS deployment. An
      # optional test traffic route can be specified.

      struct TargetGroupPairInfo
        include JSON::Serializable

        # The path used by a load balancer to route production traffic when an Amazon ECS deployment is
        # complete.

        @[JSON::Field(key: "prodTrafficRoute")]
        getter prod_traffic_route : Types::TrafficRoute?

        # One pair of target groups. One is associated with the original task set. The second is associated
        # with the task set that serves traffic after the deployment is complete.

        @[JSON::Field(key: "targetGroups")]
        getter target_groups : Array(Types::TargetGroupInfo)?

        # An optional path used by a load balancer to route test traffic after an Amazon ECS deployment.
        # Validation can occur while test traffic is served during a deployment.

        @[JSON::Field(key: "testTrafficRoute")]
        getter test_traffic_route : Types::TrafficRoute?

        def initialize(
          @prod_traffic_route : Types::TrafficRoute? = nil,
          @target_groups : Array(Types::TargetGroupInfo)? = nil,
          @test_traffic_route : Types::TrafficRoute? = nil
        )
        end
      end

      # Information about the instances to be used in the replacement environment in a blue/green
      # deployment.

      struct TargetInstances
        include JSON::Serializable

        # The names of one or more Auto Scaling groups to identify a replacement environment for a blue/green
        # deployment.

        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Array(String)?

        # Information about the groups of Amazon EC2 instance tags that an instance must be identified by in
        # order for it to be included in the replacement environment for a blue/green deployment. Cannot be
        # used in the same call as tagFilters .

        @[JSON::Field(key: "ec2TagSet")]
        getter ec2_tag_set : Types::EC2TagSet?

        # The tag filter key, type, and value used to identify Amazon EC2 instances in a replacement
        # environment for a blue/green deployment. Cannot be used in the same call as ec2TagSet .

        @[JSON::Field(key: "tagFilters")]
        getter tag_filters : Array(Types::EC2TagFilter)?

        def initialize(
          @auto_scaling_groups : Array(String)? = nil,
          @ec2_tag_set : Types::EC2TagSet? = nil,
          @tag_filters : Array(Types::EC2TagFilter)? = nil
        )
        end
      end

      # An API function was called too frequently.

      struct ThrottlingException
        include JSON::Serializable

        def initialize
        end
      end

      # A configuration that shifts traffic from one version of a Lambda function or Amazon ECS task set to
      # another in two increments. The original and target Lambda function versions or ECS task sets are
      # specified in the deployment's AppSpec file.

      struct TimeBasedCanary
        include JSON::Serializable

        # The number of minutes between the first and second traffic shifts of a TimeBasedCanary deployment.

        @[JSON::Field(key: "canaryInterval")]
        getter canary_interval : Int32?

        # The percentage of traffic to shift in the first increment of a TimeBasedCanary deployment.

        @[JSON::Field(key: "canaryPercentage")]
        getter canary_percentage : Int32?

        def initialize(
          @canary_interval : Int32? = nil,
          @canary_percentage : Int32? = nil
        )
        end
      end

      # A configuration that shifts traffic from one version of a Lambda function or ECS task set to another
      # in equal increments, with an equal number of minutes between each increment. The original and target
      # Lambda function versions or ECS task sets are specified in the deployment's AppSpec file.

      struct TimeBasedLinear
        include JSON::Serializable

        # The number of minutes between each incremental traffic shift of a TimeBasedLinear deployment.

        @[JSON::Field(key: "linearInterval")]
        getter linear_interval : Int32?

        # The percentage of traffic that is shifted at the start of each increment of a TimeBasedLinear
        # deployment.

        @[JSON::Field(key: "linearPercentage")]
        getter linear_percentage : Int32?

        def initialize(
          @linear_interval : Int32? = nil,
          @linear_percentage : Int32? = nil
        )
        end
      end

      # Information about a time range.

      struct TimeRange
        include JSON::Serializable

        # The end time of the time range. Specify null to leave the end time open-ended.

        @[JSON::Field(key: "end", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter end : Time?

        # The start time of the time range. Specify null to leave the start time open-ended.

        @[JSON::Field(key: "start", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start : Time?

        def initialize(
          @end : Time? = nil,
          @start : Time? = nil
        )
        end
      end

      # Information about a listener. The listener contains the path used to route traffic that is received
      # from the load balancer to a target group.

      struct TrafficRoute
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of one listener. The listener identifies the route between a target
        # group and a load balancer. This is an array of strings with a maximum size of one.

        @[JSON::Field(key: "listenerArns")]
        getter listener_arns : Array(String)?

        def initialize(
          @listener_arns : Array(String)? = nil
        )
        end
      end

      # The configuration that specifies how traffic is shifted from one version of a Lambda function to
      # another version during an Lambda deployment, or from one Amazon ECS task set to another during an
      # Amazon ECS deployment.

      struct TrafficRoutingConfig
        include JSON::Serializable

        # A configuration that shifts traffic from one version of a Lambda function or ECS task set to another
        # in two increments. The original and target Lambda function versions or ECS task sets are specified
        # in the deployment's AppSpec file.

        @[JSON::Field(key: "timeBasedCanary")]
        getter time_based_canary : Types::TimeBasedCanary?

        # A configuration that shifts traffic from one version of a Lambda function or Amazon ECS task set to
        # another in equal increments, with an equal number of minutes between each increment. The original
        # and target Lambda function versions or Amazon ECS task sets are specified in the deployment's
        # AppSpec file.

        @[JSON::Field(key: "timeBasedLinear")]
        getter time_based_linear : Types::TimeBasedLinear?

        # The type of traffic shifting ( TimeBasedCanary or TimeBasedLinear ) used by a deployment
        # configuration.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @time_based_canary : Types::TimeBasedCanary? = nil,
          @time_based_linear : Types::TimeBasedLinear? = nil,
          @type : String? = nil
        )
        end
      end

      # Information about notification triggers for the deployment group.

      struct TriggerConfig
        include JSON::Serializable

        # The event type or types for which notifications are triggered.

        @[JSON::Field(key: "triggerEvents")]
        getter trigger_events : Array(String)?

        # The name of the notification trigger.

        @[JSON::Field(key: "triggerName")]
        getter trigger_name : String?

        # The Amazon Resource Name (ARN) of the Amazon Simple Notification Service topic through which
        # notifications about deployment or instance events are sent.

        @[JSON::Field(key: "triggerTargetArn")]
        getter trigger_target_arn : String?

        def initialize(
          @trigger_events : Array(String)? = nil,
          @trigger_name : String? = nil,
          @trigger_target_arn : String? = nil
        )
        end
      end

      # The maximum allowed number of triggers was exceeded.

      struct TriggerTargetsLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # A call was submitted that is not supported for the specified deployment type.

      struct UnsupportedActionForDeploymentTypeException
        include JSON::Serializable

        def initialize
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that specifies from which resource to disassociate the tags with the
        # keys in the TagKeys input parameter.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of keys of Tag objects. The Tag objects identified by the keys are disassociated from the
        # resource specified by the ResourceArn input parameter.

        @[JSON::Field(key: "TagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end


      struct UntagResourceOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of an UpdateApplication operation.

      struct UpdateApplicationInput
        include JSON::Serializable

        # The current name of the application you want to change.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String?

        # The new name to give the application.

        @[JSON::Field(key: "newApplicationName")]
        getter new_application_name : String?

        def initialize(
          @application_name : String? = nil,
          @new_application_name : String? = nil
        )
        end
      end

      # Represents the input of an UpdateDeploymentGroup operation.

      struct UpdateDeploymentGroupInput
        include JSON::Serializable

        # The application name that corresponds to the deployment group to update.

        @[JSON::Field(key: "applicationName")]
        getter application_name : String

        # The current name of the deployment group.

        @[JSON::Field(key: "currentDeploymentGroupName")]
        getter current_deployment_group_name : String

        # Information to add or change about Amazon CloudWatch alarms when the deployment group is updated.

        @[JSON::Field(key: "alarmConfiguration")]
        getter alarm_configuration : Types::AlarmConfiguration?

        # Information for an automatic rollback configuration that is added or changed when a deployment group
        # is updated.

        @[JSON::Field(key: "autoRollbackConfiguration")]
        getter auto_rollback_configuration : Types::AutoRollbackConfiguration?

        # The replacement list of Auto Scaling groups to be included in the deployment group, if you want to
        # change them. To keep the Auto Scaling groups, enter their names or do not specify this parameter. To
        # remove Auto Scaling groups, specify a non-null empty list of Auto Scaling group names to detach all
        # CodeDeploy-managed Auto Scaling lifecycle hooks. For examples, see Amazon EC2 instances in an Amazon
        # EC2 Auto Scaling group fail to launch and receive the error "Heartbeat Timeout" in the CodeDeploy
        # User Guide .

        @[JSON::Field(key: "autoScalingGroups")]
        getter auto_scaling_groups : Array(String)?

        # Information about blue/green deployment options for a deployment group.

        @[JSON::Field(key: "blueGreenDeploymentConfiguration")]
        getter blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration?

        # The replacement deployment configuration name to use, if you want to change it.

        @[JSON::Field(key: "deploymentConfigName")]
        getter deployment_config_name : String?

        # Information about the type of deployment, either in-place or blue/green, you want to run and whether
        # to route deployment traffic behind a load balancer.

        @[JSON::Field(key: "deploymentStyle")]
        getter deployment_style : Types::DeploymentStyle?

        # The replacement set of Amazon EC2 tags on which to filter, if you want to change them. To keep the
        # existing tags, enter their names. To remove tags, do not enter any tag names.

        @[JSON::Field(key: "ec2TagFilters")]
        getter ec2_tag_filters : Array(Types::EC2TagFilter)?

        # Information about groups of tags applied to on-premises instances. The deployment group includes
        # only Amazon EC2 instances identified by all the tag groups.

        @[JSON::Field(key: "ec2TagSet")]
        getter ec2_tag_set : Types::EC2TagSet?

        # The target Amazon ECS services in the deployment group. This applies only to deployment groups that
        # use the Amazon ECS compute platform. A target Amazon ECS service is specified as an Amazon ECS
        # cluster and service name pair using the format &lt;clustername&gt;:&lt;servicename&gt; .

        @[JSON::Field(key: "ecsServices")]
        getter ecs_services : Array(Types::ECSService)?

        # Information about the load balancer used in a deployment.

        @[JSON::Field(key: "loadBalancerInfo")]
        getter load_balancer_info : Types::LoadBalancerInfo?

        # The new name of the deployment group, if you want to change it.

        @[JSON::Field(key: "newDeploymentGroupName")]
        getter new_deployment_group_name : String?

        # The replacement set of on-premises instance tags on which to filter, if you want to change them. To
        # keep the existing tags, enter their names. To remove tags, do not enter any tag names.

        @[JSON::Field(key: "onPremisesInstanceTagFilters")]
        getter on_premises_instance_tag_filters : Array(Types::TagFilter)?

        # Information about an on-premises instance tag set. The deployment group includes only on-premises
        # instances identified by all the tag groups.

        @[JSON::Field(key: "onPremisesTagSet")]
        getter on_premises_tag_set : Types::OnPremisesTagSet?

        # Indicates what happens when new Amazon EC2 instances are launched mid-deployment and do not receive
        # the deployed application revision. If this option is set to UPDATE or is unspecified, CodeDeploy
        # initiates one or more 'auto-update outdated instances' deployments to apply the deployed application
        # revision to the new Amazon EC2 instances. If this option is set to IGNORE , CodeDeploy does not
        # initiate a deployment to update the new Amazon EC2 instances. This may result in instances having
        # different revisions.

        @[JSON::Field(key: "outdatedInstancesStrategy")]
        getter outdated_instances_strategy : String?

        # A replacement ARN for the service role, if you want to change it.

        @[JSON::Field(key: "serviceRoleArn")]
        getter service_role_arn : String?

        # This parameter only applies if you are using CodeDeploy with Amazon EC2 Auto Scaling. For more
        # information, see Integrating CodeDeploy with Amazon EC2 Auto Scaling in the CodeDeploy User Guide .
        # Set terminationHookEnabled to true to have CodeDeploy install a termination hook into your Auto
        # Scaling group when you update a deployment group. When this hook is installed, CodeDeploy will
        # perform termination deployments. For information about termination deployments, see Enabling
        # termination deployments during Auto Scaling scale-in events in the CodeDeploy User Guide . For more
        # information about Auto Scaling scale-in events, see the Scale in topic in the Amazon EC2 Auto
        # Scaling User Guide .

        @[JSON::Field(key: "terminationHookEnabled")]
        getter termination_hook_enabled : Bool?

        # Information about triggers to change when the deployment group is updated. For examples, see Edit a
        # Trigger in a CodeDeploy Deployment Group in the CodeDeploy User Guide .

        @[JSON::Field(key: "triggerConfigurations")]
        getter trigger_configurations : Array(Types::TriggerConfig)?

        def initialize(
          @application_name : String,
          @current_deployment_group_name : String,
          @alarm_configuration : Types::AlarmConfiguration? = nil,
          @auto_rollback_configuration : Types::AutoRollbackConfiguration? = nil,
          @auto_scaling_groups : Array(String)? = nil,
          @blue_green_deployment_configuration : Types::BlueGreenDeploymentConfiguration? = nil,
          @deployment_config_name : String? = nil,
          @deployment_style : Types::DeploymentStyle? = nil,
          @ec2_tag_filters : Array(Types::EC2TagFilter)? = nil,
          @ec2_tag_set : Types::EC2TagSet? = nil,
          @ecs_services : Array(Types::ECSService)? = nil,
          @load_balancer_info : Types::LoadBalancerInfo? = nil,
          @new_deployment_group_name : String? = nil,
          @on_premises_instance_tag_filters : Array(Types::TagFilter)? = nil,
          @on_premises_tag_set : Types::OnPremisesTagSet? = nil,
          @outdated_instances_strategy : String? = nil,
          @service_role_arn : String? = nil,
          @termination_hook_enabled : Bool? = nil,
          @trigger_configurations : Array(Types::TriggerConfig)? = nil
        )
        end
      end

      # Represents the output of an UpdateDeploymentGroup operation.

      struct UpdateDeploymentGroupOutput
        include JSON::Serializable

        # If the output contains no data, and the corresponding deployment group contained at least one Auto
        # Scaling group, CodeDeploy successfully removed all corresponding Auto Scaling lifecycle event hooks
        # from the Amazon Web Services account. If the output contains data, CodeDeploy could not remove some
        # Auto Scaling lifecycle event hooks from the Amazon Web Services account.

        @[JSON::Field(key: "hooksNotCleanedUp")]
        getter hooks_not_cleaned_up : Array(Types::AutoScalingGroup)?

        def initialize(
          @hooks_not_cleaned_up : Array(Types::AutoScalingGroup)? = nil
        )
        end
      end

      # Configure the ZonalConfig object if you want CodeDeploy to deploy your application to one
      # Availability Zone at a time, within an Amazon Web Services Region. By deploying to one Availability
      # Zone at a time, you can expose your deployment to a progressively larger audience as confidence in
      # the deployment's performance and viability grows. If you don't configure the ZonalConfig object,
      # CodeDeploy deploys your application to a random selection of hosts across a Region. For more
      # information about the zonal configuration feature, see zonal configuration in the CodeDeploy User
      # Guide .

      struct ZonalConfig
        include JSON::Serializable

        # The period of time, in seconds, that CodeDeploy must wait after completing a deployment to the first
        # Availability Zone. CodeDeploy will wait this amount of time before starting a deployment to the
        # second Availability Zone. You might set this option if you want to allow extra bake time for the
        # first Availability Zone. If you don't specify a value for firstZoneMonitorDurationInSeconds , then
        # CodeDeploy uses the monitorDurationInSeconds value for the first Availability Zone. For more
        # information about the zonal configuration feature, see zonal configuration in the CodeDeploy User
        # Guide .

        @[JSON::Field(key: "firstZoneMonitorDurationInSeconds")]
        getter first_zone_monitor_duration_in_seconds : Int64?

        # The number or percentage of instances that must remain available per Availability Zone during a
        # deployment. This option works in conjunction with the MinimumHealthyHosts option. For more
        # information, see About the minimum number of healthy hosts per Availability Zone in the CodeDeploy
        # User Guide . If you don't specify the minimumHealthyHostsPerZone option, then CodeDeploy uses a
        # default value of 0 percent. For more information about the zonal configuration feature, see zonal
        # configuration in the CodeDeploy User Guide .

        @[JSON::Field(key: "minimumHealthyHostsPerZone")]
        getter minimum_healthy_hosts_per_zone : Types::MinimumHealthyHostsPerZone?

        # The period of time, in seconds, that CodeDeploy must wait after completing a deployment to an
        # Availability Zone. CodeDeploy will wait this amount of time before starting a deployment to the next
        # Availability Zone. Consider adding a monitor duration to give the deployment some time to prove
        # itself (or 'bake') in one Availability Zone before it is released in the next zone. If you don't
        # specify a monitorDurationInSeconds , CodeDeploy starts deploying to the next Availability Zone
        # immediately. For more information about the zonal configuration feature, see zonal configuration in
        # the CodeDeploy User Guide .

        @[JSON::Field(key: "monitorDurationInSeconds")]
        getter monitor_duration_in_seconds : Int64?

        def initialize(
          @first_zone_monitor_duration_in_seconds : Int64? = nil,
          @minimum_healthy_hosts_per_zone : Types::MinimumHealthyHostsPerZone? = nil,
          @monitor_duration_in_seconds : Int64? = nil
        )
        end
      end
    end
  end
end
