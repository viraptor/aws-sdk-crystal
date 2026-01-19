require "json"
require "time"

module AwsSdk
  module ECS
    module Types

      # The minimum and maximum number of accelerators (such as GPUs) for instance type selection. This is
      # used for workloads that require specific numbers of accelerators.
      struct AcceleratorCountRequest
        include JSON::Serializable

        # The maximum number of accelerators. Instance types with more accelerators are excluded from
        # selection.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        # The minimum number of accelerators. Instance types with fewer accelerators are excluded from
        # selection.
        @[JSON::Field(key: "min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # The minimum and maximum total accelerator memory in mebibytes (MiB) for instance type selection.
      # This is important for GPU workloads that require specific amounts of video memory.
      struct AcceleratorTotalMemoryMiBRequest
        include JSON::Serializable

        # The maximum total accelerator memory in MiB. Instance types with more accelerator memory are
        # excluded from selection.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        # The minimum total accelerator memory in MiB. Instance types with less accelerator memory are
        # excluded from selection.
        @[JSON::Field(key: "min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # You don't have authorization to perform the requested action.
      struct AccessDeniedException
        include JSON::Serializable

        def initialize
        end
      end

      # The advanced settings for a load balancer used in blue/green deployments. Specify the alternate
      # target group, listener rules, and IAM role required for traffic shifting during blue/green
      # deployments. For more information, see Required resources for Amazon ECS blue/green deployments in
      # the Amazon Elastic Container Service Developer Guide .
      struct AdvancedConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the alternate target group for Amazon ECS blue/green deployments.
        @[JSON::Field(key: "alternateTargetGroupArn")]
        getter alternate_target_group_arn : String?

        # The Amazon Resource Name (ARN) that that identifies the production listener rule (in the case of an
        # Application Load Balancer) or listener (in the case for an Network Load Balancer) for routing
        # production traffic.
        @[JSON::Field(key: "productionListenerRule")]
        getter production_listener_rule : String?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon ECS permission to call the Elastic
        # Load Balancing APIs for you.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon Resource Name (ARN) that identifies ) that identifies the test listener rule (in the case
        # of an Application Load Balancer) or listener (in the case for an Network Load Balancer) for routing
        # test traffic.
        @[JSON::Field(key: "testListenerRule")]
        getter test_listener_rule : String?

        def initialize(
          @alternate_target_group_arn : String? = nil,
          @production_listener_rule : String? = nil,
          @role_arn : String? = nil,
          @test_listener_rule : String? = nil
        )
        end
      end

      # An object representing a container instance or task attachment.
      struct Attachment
        include JSON::Serializable

        # Details of the attachment. For elastic network interfaces, this includes the network interface ID,
        # the MAC address, the subnet ID, and the private IPv4 address. For Service Connect services, this
        # includes portName , clientAliases , discoveryName , and ingressPortOverride . For Elastic Block
        # Storage, this includes roleArn , deleteOnTermination , volumeName , volumeId , and statusReason
        # (only when the attachment fails to create or attach).
        @[JSON::Field(key: "details")]
        getter details : Array(Types::KeyValuePair)?

        # The unique identifier for the attachment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The status of the attachment. Valid values are PRECREATED , CREATED , ATTACHING , ATTACHED ,
        # DETACHING , DETACHED , DELETED , and FAILED .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of the attachment, such as ElasticNetworkInterface , Service Connect , and
        # AmazonElasticBlockStorage .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @details : Array(Types::KeyValuePair)? = nil,
          @id : String? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An object representing a change in state for a task attachment.
      struct AttachmentStateChange
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the attachment.
        @[JSON::Field(key: "attachmentArn")]
        getter attachment_arn : String

        # The status of the attachment.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @attachment_arn : String,
          @status : String
        )
        end
      end

      # An attribute is a name-value pair that's associated with an Amazon ECS object. Use attributes to
      # extend the Amazon ECS data model by adding custom metadata to your resources. For more information,
      # see Attributes in the Amazon Elastic Container Service Developer Guide .
      struct Attribute
        include JSON::Serializable

        # The name of the attribute. The name must contain between 1 and 128 characters. The name may contain
        # letters (uppercase and lowercase), numbers, hyphens (-), underscores (_), forward slashes (/), back
        # slashes (\), or periods (.).
        @[JSON::Field(key: "name")]
        getter name : String

        # The ID of the target. You can specify the short form ID for a resource or the full Amazon Resource
        # Name (ARN).
        @[JSON::Field(key: "targetId")]
        getter target_id : String?

        # The type of the target to attach the attribute with. This parameter is required if you use the short
        # form ID for a resource instead of the full ARN.
        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        # The value of the attribute. The value must contain between 1 and 128 characters. It can contain
        # letters (uppercase and lowercase), numbers, hyphens (-), underscores (_), periods (.), at signs (@),
        # forward slashes (/), back slashes (\), colons (:), or spaces. The value can't start or end with a
        # space.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String,
          @target_id : String? = nil,
          @target_type : String? = nil,
          @value : String? = nil
        )
        end
      end

      # You can apply up to 10 custom attributes for each resource. You can view the attributes of a
      # resource with ListAttributes . You can remove existing attributes on a resource with
      # DeleteAttributes .
      struct AttributeLimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # The details of the Auto Scaling group for the capacity provider.
      struct AutoScalingGroupProvider
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the Auto Scaling group, or the Auto Scaling group
        # name.
        @[JSON::Field(key: "autoScalingGroupArn")]
        getter auto_scaling_group_arn : String

        # The managed draining option for the Auto Scaling group capacity provider. When you enable this,
        # Amazon ECS manages and gracefully drains the EC2 container instances that are in the Auto Scaling
        # group capacity provider.
        @[JSON::Field(key: "managedDraining")]
        getter managed_draining : String?

        # The managed scaling settings for the Auto Scaling group capacity provider.
        @[JSON::Field(key: "managedScaling")]
        getter managed_scaling : Types::ManagedScaling?

        # The managed termination protection setting to use for the Auto Scaling group capacity provider. This
        # determines whether the Auto Scaling group has managed termination protection. The default is off.
        # When using managed termination protection, managed scaling must also be used otherwise managed
        # termination protection doesn't work. When managed termination protection is on, Amazon ECS prevents
        # the Amazon EC2 instances in an Auto Scaling group that contain tasks from being terminated during a
        # scale-in action. The Auto Scaling group and each instance in the Auto Scaling group must have
        # instance protection from scale-in actions on as well. For more information, see Instance Protection
        # in the Auto Scaling User Guide . When managed termination protection is off, your Amazon EC2
        # instances aren't protected from termination when the Auto Scaling group scales in.
        @[JSON::Field(key: "managedTerminationProtection")]
        getter managed_termination_protection : String?

        def initialize(
          @auto_scaling_group_arn : String,
          @managed_draining : String? = nil,
          @managed_scaling : Types::ManagedScaling? = nil,
          @managed_termination_protection : String? = nil
        )
        end
      end

      # The details of the Auto Scaling group capacity provider to update.
      struct AutoScalingGroupProviderUpdate
        include JSON::Serializable

        # The managed draining option for the Auto Scaling group capacity provider. When you enable this,
        # Amazon ECS manages and gracefully drains the EC2 container instances that are in the Auto Scaling
        # group capacity provider.
        @[JSON::Field(key: "managedDraining")]
        getter managed_draining : String?

        # The managed scaling settings for the Auto Scaling group capacity provider.
        @[JSON::Field(key: "managedScaling")]
        getter managed_scaling : Types::ManagedScaling?

        # The managed termination protection setting to use for the Auto Scaling group capacity provider. This
        # determines whether the Auto Scaling group has managed termination protection. When using managed
        # termination protection, managed scaling must also be used otherwise managed termination protection
        # doesn't work. When managed termination protection is on, Amazon ECS prevents the Amazon EC2
        # instances in an Auto Scaling group that contain tasks from being terminated during a scale-in
        # action. The Auto Scaling group and each instance in the Auto Scaling group must have instance
        # protection from scale-in actions on. For more information, see Instance Protection in the Auto
        # Scaling User Guide . When managed termination protection is off, your Amazon EC2 instances aren't
        # protected from termination when the Auto Scaling group scales in.
        @[JSON::Field(key: "managedTerminationProtection")]
        getter managed_termination_protection : String?

        def initialize(
          @managed_draining : String? = nil,
          @managed_scaling : Types::ManagedScaling? = nil,
          @managed_termination_protection : String? = nil
        )
        end
      end

      # An object representing the networking details for a task or service. For example
      # awsVpcConfiguration={subnets=["subnet-12344321"],securityGroups=["sg-12344321"]} .
      struct AwsVpcConfiguration
        include JSON::Serializable

        # The IDs of the subnets associated with the task or service. There's a limit of 16 subnets that can
        # be specified. All specified subnets must be from the same VPC.
        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)

        # Whether the task's elastic network interface receives a public IP address. Consider the following
        # when you set this value: When you use create-service or update-service , the default is DISABLED .
        # When the service deploymentController is ECS , the value must be DISABLED .
        @[JSON::Field(key: "assignPublicIp")]
        getter assign_public_ip : String?

        # The IDs of the security groups associated with the task or service. If you don't specify a security
        # group, the default security group for the VPC is used. There's a limit of 5 security groups that can
        # be specified. All specified security groups must be from the same VPC.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @subnets : Array(String),
          @assign_public_ip : String? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # The minimum and maximum baseline Amazon EBS bandwidth in megabits per second (Mbps) for instance
      # type selection. This is important for workloads with high storage I/O requirements.
      struct BaselineEbsBandwidthMbpsRequest
        include JSON::Serializable

        # The maximum baseline Amazon EBS bandwidth in Mbps. Instance types with higher Amazon EBS bandwidth
        # are excluded from selection.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        # The minimum baseline Amazon EBS bandwidth in Mbps. Instance types with lower Amazon EBS bandwidth
        # are excluded from selection.
        @[JSON::Field(key: "min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # Your Amazon Web Services account was blocked. For more information, contact Amazon Web Services
      # Support .
      struct BlockedException
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for a canary deployment strategy that shifts a fixed percentage of traffic to the new
      # service revision, waits for a specified bake time, then shifts the remaining traffic. This is only
      # valid when you run CreateService or UpdateService with deploymentController set to ECS and a
      # deploymentConfiguration with a strategy set to CANARY .
      struct CanaryConfiguration
        include JSON::Serializable

        # The amount of time in minutes to wait during the canary phase before shifting the remaining
        # production traffic to the new service revision. Valid values are 0 to 1440 minutes (24 hours). The
        # default value is 10.
        @[JSON::Field(key: "canaryBakeTimeInMinutes")]
        getter canary_bake_time_in_minutes : Int32?

        # The percentage of production traffic to shift to the new service revision during the canary phase.
        # Valid values are multiples of 0.1 from 0.1 to 100.0. The default value is 5.0.
        @[JSON::Field(key: "canaryPercent")]
        getter canary_percent : Float64?

        def initialize(
          @canary_bake_time_in_minutes : Int32? = nil,
          @canary_percent : Float64? = nil
        )
        end
      end

      # The details for a capacity provider.
      struct CapacityProvider
        include JSON::Serializable

        # The Auto Scaling group settings for the capacity provider.
        @[JSON::Field(key: "autoScalingGroupProvider")]
        getter auto_scaling_group_provider : Types::AutoScalingGroupProvider?

        # The Amazon Resource Name (ARN) that identifies the capacity provider.
        @[JSON::Field(key: "capacityProviderArn")]
        getter capacity_provider_arn : String?

        # The cluster that this capacity provider is associated with. Managed instances capacity providers are
        # cluster-scoped, meaning they can only be used within their associated cluster. This is required for
        # Managed instances.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The configuration for the Amazon ECS Managed Instances provider. This includes the infrastructure
        # role, the launch template configuration, and tag propagation settings.
        @[JSON::Field(key: "managedInstancesProvider")]
        getter managed_instances_provider : Types::ManagedInstancesProvider?

        # The name of the capacity provider.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The current status of the capacity provider. Only capacity providers in an ACTIVE state can be used
        # in a cluster. When a capacity provider is successfully deleted, it has an INACTIVE status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The metadata that you apply to the capacity provider to help you categorize and organize it. Each
        # tag consists of a key and an optional value. You define both. The following basic restrictions apply
        # to tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique,
        # and each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8
        # Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is used across
        # multiple services and resources, remember that other services may have restrictions on allowed
        # characters. Generally allowed characters are: letters, numbers, and spaces representable in UTF-8,
        # and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use
        # aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as
        # it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this
        # prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The type of capacity provider. For Amazon ECS Managed Instances, this value is MANAGED_INSTANCES ,
        # indicating that Amazon ECS manages the underlying Amazon EC2 instances on your behalf.
        @[JSON::Field(key: "type")]
        getter type : String?

        # The update status of the capacity provider. The following are the possible states that is returned.
        # DELETE_IN_PROGRESS The capacity provider is in the process of being deleted. DELETE_COMPLETE The
        # capacity provider was successfully deleted and has an INACTIVE status. DELETE_FAILED The capacity
        # provider can't be deleted. The update status reason provides further details about why the delete
        # failed.
        @[JSON::Field(key: "updateStatus")]
        getter update_status : String?

        # The update status reason. This provides further details about the update status for the capacity
        # provider.
        @[JSON::Field(key: "updateStatusReason")]
        getter update_status_reason : String?

        def initialize(
          @auto_scaling_group_provider : Types::AutoScalingGroupProvider? = nil,
          @capacity_provider_arn : String? = nil,
          @cluster : String? = nil,
          @managed_instances_provider : Types::ManagedInstancesProvider? = nil,
          @name : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @type : String? = nil,
          @update_status : String? = nil,
          @update_status_reason : String? = nil
        )
        end
      end

      # The details of a capacity provider strategy. A capacity provider strategy can be set when using the
      # RunTask or CreateCluster APIs or as the default capacity provider strategy for a cluster with the
      # CreateCluster API. Only capacity providers that are already associated with a cluster and have an
      # ACTIVE or UPDATING status can be used in a capacity provider strategy. The
      # PutClusterCapacityProviders API is used to associate a capacity provider with a cluster. If
      # specifying a capacity provider that uses an Auto Scaling group, the capacity provider must already
      # be created. New Auto Scaling group capacity providers can be created with the
      # CreateClusterCapacityProvider API operation. To use a Fargate capacity provider, specify either the
      # FARGATE or FARGATE_SPOT capacity providers. The Fargate capacity providers are available to all
      # accounts and only need to be associated with a cluster to be used in a capacity provider strategy.
      # With FARGATE_SPOT , you can run interruption tolerant tasks at a rate that's discounted compared to
      # the FARGATE price. FARGATE_SPOT runs tasks on spare compute capacity. When Amazon Web Services needs
      # the capacity back, your tasks are interrupted with a two-minute warning. FARGATE_SPOT supports Linux
      # tasks with the X86_64 architecture on platform version 1.3.0 or later. FARGATE_SPOT supports Linux
      # tasks with the ARM64 architecture on platform version 1.4.0 or later. A capacity provider strategy
      # can contain a maximum of 20 capacity providers.
      struct CapacityProviderStrategyItem
        include JSON::Serializable

        # The short name of the capacity provider.
        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : String

        # The base value designates how many tasks, at a minimum, to run on the specified capacity provider
        # for each service. Only one capacity provider in a capacity provider strategy can have a base
        # defined. If no value is specified, the default value of 0 is used. Base value characteristics: Only
        # one capacity provider in a strategy can have a base defined The default value is 0 if not specified
        # The valid range is 0 to 100,000 Base requirements are satisfied first before weight distribution
        @[JSON::Field(key: "base")]
        getter base : Int32?

        # The weight value designates the relative percentage of the total number of tasks launched that
        # should use the specified capacity provider. The weight value is taken into consideration after the
        # base value, if defined, is satisfied. If no weight value is specified, the default value of 0 is
        # used. When multiple capacity providers are specified within a capacity provider strategy, at least
        # one of the capacity providers must have a weight value greater than zero and any capacity providers
        # with a weight of 0 can't be used to place tasks. If you specify multiple capacity providers in a
        # strategy that all have a weight of 0 , any RunTask or CreateService actions using the capacity
        # provider strategy will fail. Weight value characteristics: Weight is considered after the base value
        # is satisfied The default value is 0 if not specified The valid range is 0 to 1,000 At least one
        # capacity provider must have a weight greater than zero Capacity providers with weight of 0 cannot
        # place tasks Task distribution logic: Base satisfaction: The minimum number of tasks specified by the
        # base value are placed on that capacity provider Weight distribution: After base requirements are
        # met, additional tasks are distributed according to weight ratios Examples: Equal Distribution: Two
        # capacity providers both with weight 1 will split tasks evenly after base requirements are met.
        # Weighted Distribution: If capacityProviderA has weight 1 and capacityProviderB has weight 4 , then
        # for every 1 task on A, 4 tasks will run on B.
        @[JSON::Field(key: "weight")]
        getter weight : Int32?

        def initialize(
          @capacity_provider : String,
          @base : Int32? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # These errors are usually caused by a client action. This client action might be using an action or
      # resource on behalf of a user that doesn't have permissions to use the action or resource. Or, it
      # might be specifying an identifier that isn't valid.
      struct ClientException
        include JSON::Serializable

        # Message that describes the cause of the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A regional grouping of one or more container instances where you can run task requests. Each account
      # receives a default cluster the first time you use the Amazon ECS service, but you may also create
      # other clusters. Clusters may contain more than one instance type simultaneously.
      struct Cluster
        include JSON::Serializable

        # The number of services that are running on the cluster in an ACTIVE state. You can view these
        # services with ListServices .
        @[JSON::Field(key: "activeServicesCount")]
        getter active_services_count : Int32?

        # The resources attached to a cluster. When using a capacity provider with a cluster, the capacity
        # provider and associated resources are returned as cluster attachments.
        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::Attachment)?

        # The status of the capacity providers associated with the cluster. The following are the states that
        # are returned. UPDATE_IN_PROGRESS The available capacity providers for the cluster are updating.
        # UPDATE_COMPLETE The capacity providers have successfully updated. UPDATE_FAILED The capacity
        # provider updates failed.
        @[JSON::Field(key: "attachmentsStatus")]
        getter attachments_status : String?

        # The capacity providers associated with the cluster.
        @[JSON::Field(key: "capacityProviders")]
        getter capacity_providers : Array(String)?

        # The Amazon Resource Name (ARN) that identifies the cluster. For more information about the ARN
        # format, see Amazon Resource Name (ARN) in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # A user-generated string that you use to identify your cluster.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The execute command and managed storage configuration for the cluster.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ClusterConfiguration?

        # The default capacity provider strategy for the cluster. When services or tasks are run in the
        # cluster with no launch type or capacity provider strategy specified, the default capacity provider
        # strategy is used.
        @[JSON::Field(key: "defaultCapacityProviderStrategy")]
        getter default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # The number of tasks in the cluster that are in the PENDING state.
        @[JSON::Field(key: "pendingTasksCount")]
        getter pending_tasks_count : Int32?

        # The number of container instances registered into the cluster. This includes container instances in
        # both ACTIVE and DRAINING status.
        @[JSON::Field(key: "registeredContainerInstancesCount")]
        getter registered_container_instances_count : Int32?

        # The number of tasks in the cluster that are in the RUNNING state.
        @[JSON::Field(key: "runningTasksCount")]
        getter running_tasks_count : Int32?

        # Use this parameter to set a default Service Connect namespace. After you set a default Service
        # Connect namespace, any new services with Service Connect turned on that are created in the cluster
        # are added as client services in the namespace. This setting only applies to new services that set
        # the enabled parameter to true in the ServiceConnectConfiguration . You can set the namespace of each
        # service individually in the ServiceConnectConfiguration to override this default parameter. Tasks
        # that run in a namespace can use short names to connect to services in the namespace. Tasks can
        # connect to services across all of the clusters in the namespace. Tasks connect through a managed
        # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
        # ECS services create are supported with Service Connect. For more information, see Service Connect in
        # the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "serviceConnectDefaults")]
        getter service_connect_defaults : Types::ClusterServiceConnectDefaults?

        # The settings for the cluster. This parameter indicates whether CloudWatch Container Insights is on
        # or off for a cluster.
        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::ClusterSetting)?

        # Additional information about your clusters that are separated by launch type. They include the
        # following: runningEC2TasksCount RunningFargateTasksCount pendingEC2TasksCount
        # pendingFargateTasksCount activeEC2ServiceCount activeFargateServiceCount drainingEC2ServiceCount
        # drainingFargateServiceCount
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(Types::KeyValuePair)?

        # The status of the cluster. The following are the possible states that are returned. ACTIVE The
        # cluster is ready to accept tasks and if applicable you can register container instances with the
        # cluster. PROVISIONING The cluster has capacity providers that are associated with it and the
        # resources needed for the capacity provider are being created. DEPROVISIONING The cluster has
        # capacity providers that are associated with it and the resources needed for the capacity provider
        # are being deleted. FAILED The cluster has capacity providers that are associated with it and the
        # resources needed for the capacity provider have failed to create. INACTIVE The cluster has been
        # deleted. Clusters with an INACTIVE status may remain discoverable in your account for a period of
        # time. However, this behavior is subject to change in the future. We don't recommend that you rely on
        # INACTIVE clusters persisting.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The metadata that you apply to the cluster to help you categorize and organize them. Each tag
        # consists of a key and an optional value. You define both. The following basic restrictions apply to
        # tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique, and
        # each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8 Maximum
        # value length - 256 Unicode characters in UTF-8 If your tagging schema is used across multiple
        # services and resources, remember that other services may have restrictions on allowed characters.
        # Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, and the
        # following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use aws: ,
        # AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this prefix.
        # Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @active_services_count : Int32? = nil,
          @attachments : Array(Types::Attachment)? = nil,
          @attachments_status : String? = nil,
          @capacity_providers : Array(String)? = nil,
          @cluster_arn : String? = nil,
          @cluster_name : String? = nil,
          @configuration : Types::ClusterConfiguration? = nil,
          @default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @pending_tasks_count : Int32? = nil,
          @registered_container_instances_count : Int32? = nil,
          @running_tasks_count : Int32? = nil,
          @service_connect_defaults : Types::ClusterServiceConnectDefaults? = nil,
          @settings : Array(Types::ClusterSetting)? = nil,
          @statistics : Array(Types::KeyValuePair)? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The execute command and managed storage configuration for the cluster.
      struct ClusterConfiguration
        include JSON::Serializable

        # The details of the execute command configuration.
        @[JSON::Field(key: "executeCommandConfiguration")]
        getter execute_command_configuration : Types::ExecuteCommandConfiguration?

        # The details of the managed storage configuration.
        @[JSON::Field(key: "managedStorageConfiguration")]
        getter managed_storage_configuration : Types::ManagedStorageConfiguration?

        def initialize(
          @execute_command_configuration : Types::ExecuteCommandConfiguration? = nil,
          @managed_storage_configuration : Types::ManagedStorageConfiguration? = nil
        )
        end
      end

      # The cluster contains one or more capacity providers that prevent the requested operation. This
      # exception occurs when you try to delete a cluster that still has active capacity providers,
      # including Amazon ECS Managed Instances capacity providers. You must first delete all capacity
      # providers from the cluster before you can delete the cluster itself.
      struct ClusterContainsCapacityProviderException
        include JSON::Serializable

        def initialize
        end
      end

      # You can't delete a cluster that has registered container instances. First, deregister the container
      # instances before you can delete the cluster. For more information, see DeregisterContainerInstance .
      struct ClusterContainsContainerInstancesException
        include JSON::Serializable

        def initialize
        end
      end

      # You can't delete a cluster that contains services. First, update the service to reduce its desired
      # task count to 0, and then delete the service. For more information, see UpdateService and
      # DeleteService .
      struct ClusterContainsServicesException
        include JSON::Serializable

        def initialize
        end
      end

      # You can't delete a cluster that has active tasks.
      struct ClusterContainsTasksException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified cluster wasn't found. You can view your available clusters with ListClusters . Amazon
      # ECS clusters are Region specific.
      struct ClusterNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Use this parameter to set a default Service Connect namespace. After you set a default Service
      # Connect namespace, any new services with Service Connect turned on that are created in the cluster
      # are added as client services in the namespace. This setting only applies to new services that set
      # the enabled parameter to true in the ServiceConnectConfiguration . You can set the namespace of each
      # service individually in the ServiceConnectConfiguration to override this default parameter. Tasks
      # that run in a namespace can use short names to connect to services in the namespace. Tasks can
      # connect to services across all of the clusters in the namespace. Tasks connect through a managed
      # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
      # ECS services create are supported with Service Connect. For more information, see Service Connect in
      # the Amazon Elastic Container Service Developer Guide .
      struct ClusterServiceConnectDefaults
        include JSON::Serializable

        # The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace. When you create a
        # service and don't specify a Service Connect configuration, this namespace is used.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @namespace : String? = nil
        )
        end
      end

      # Use this parameter to set a default Service Connect namespace. After you set a default Service
      # Connect namespace, any new services with Service Connect turned on that are created in the cluster
      # are added as client services in the namespace. This setting only applies to new services that set
      # the enabled parameter to true in the ServiceConnectConfiguration . You can set the namespace of each
      # service individually in the ServiceConnectConfiguration to override this default parameter. Tasks
      # that run in a namespace can use short names to connect to services in the namespace. Tasks can
      # connect to services across all of the clusters in the namespace. Tasks connect through a managed
      # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
      # ECS services create are supported with Service Connect. For more information, see Service Connect in
      # the Amazon Elastic Container Service Developer Guide .
      struct ClusterServiceConnectDefaultsRequest
        include JSON::Serializable

        # The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace that's used when
        # you create a service and don't specify a Service Connect configuration. The namespace name can
        # include up to 1024 characters. The name is case-sensitive. The name can't include greater than
        # (&gt;), less than (&lt;), double quotation marks ("), or slash (/). If you enter an existing
        # namespace name or ARN, then that namespace will be used. Any namespace type is supported. The
        # namespace must be in this account and this Amazon Web Services Region. If you enter a new name, a
        # Cloud Map namespace will be created. Amazon ECS creates a Cloud Map namespace with the "API calls"
        # method of instance discovery only. This instance discovery method is the "HTTP" namespace type in
        # the Command Line Interface. Other types of instance discovery aren't used by Service Connect. If you
        # update the cluster with an empty string "" for the namespace name, the cluster configuration for
        # Service Connect is removed. Note that the namespace will remain in Cloud Map and must be deleted
        # separately. For more information about Cloud Map, see Working with Services in the Cloud Map
        # Developer Guide .
        @[JSON::Field(key: "namespace")]
        getter namespace : String

        def initialize(
          @namespace : String
        )
        end
      end

      # The settings to use when creating a cluster. This parameter is used to turn on CloudWatch Container
      # Insights with enhanced observability or CloudWatch Container Insights for a cluster. Container
      # Insights with enhanced observability provides all the Container Insights metrics, plus additional
      # task and container metrics. This version supports enhanced observability for Amazon ECS clusters
      # using the Amazon EC2 and Fargate launch types. After you configure Container Insights with enhanced
      # observability on Amazon ECS, Container Insights auto-collects detailed infrastructure telemetry from
      # the cluster level down to the container level in your environment and displays these critical
      # performance data in curated dashboards removing the heavy lifting in observability set-up. For more
      # information, see Monitor Amazon ECS containers using Container Insights with enhanced observability
      # in the Amazon Elastic Container Service Developer Guide .
      struct ClusterSetting
        include JSON::Serializable

        # The name of the cluster setting. The value is containerInsights .
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value to set for the cluster setting. The supported values are enhanced , enabled , and disabled
        # . To use Container Insights with enhanced observability, set the containerInsights account setting
        # to enhanced . To use Container Insights, set the containerInsights account setting to enabled . If a
        # cluster value is specified, it will override the containerInsights value set with PutAccountSetting
        # or PutAccountSettingDefault .
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        # The existing task ARNs which are already associated with the clientToken .
        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Array(String)?

        def initialize(
          @resource_ids : Array(String)? = nil
        )
        end
      end

      # A Docker container that's part of a task.
      struct Container
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container.
        @[JSON::Field(key: "containerArn")]
        getter container_arn : String?

        # The number of CPU units set for the container. The value is 0 if no value was specified in the
        # container definition when the task definition was registered.
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The exit code returned from the container.
        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The IDs of each GPU assigned to the container.
        @[JSON::Field(key: "gpuIds")]
        getter gpu_ids : Array(String)?

        # The health status of the container. If health checks aren't configured for this container in its
        # task definition, then it reports the health status as UNKNOWN .
        @[JSON::Field(key: "healthStatus")]
        getter health_status : String?

        # The image used for the container.
        @[JSON::Field(key: "image")]
        getter image : String?

        # The container image manifest digest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # The last known status of the container.
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        # The details of any Amazon ECS managed agents associated with the container.
        @[JSON::Field(key: "managedAgents")]
        getter managed_agents : Array(Types::ManagedAgent)?

        # The hard limit (in MiB) of memory set for the container.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The soft limit (in MiB) of memory set for the container.
        @[JSON::Field(key: "memoryReservation")]
        getter memory_reservation : String?

        # The name of the container.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The network bindings associated with the container.
        @[JSON::Field(key: "networkBindings")]
        getter network_bindings : Array(Types::NetworkBinding)?

        # The network interfaces associated with the container.
        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # A short (1024 max characters) human-readable string to provide additional details about a running or
        # stopped container.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The ID of the Docker container.
        @[JSON::Field(key: "runtimeId")]
        getter runtime_id : String?

        # The ARN of the task.
        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        def initialize(
          @container_arn : String? = nil,
          @cpu : String? = nil,
          @exit_code : Int32? = nil,
          @gpu_ids : Array(String)? = nil,
          @health_status : String? = nil,
          @image : String? = nil,
          @image_digest : String? = nil,
          @last_status : String? = nil,
          @managed_agents : Array(Types::ManagedAgent)? = nil,
          @memory : String? = nil,
          @memory_reservation : String? = nil,
          @name : String? = nil,
          @network_bindings : Array(Types::NetworkBinding)? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @reason : String? = nil,
          @runtime_id : String? = nil,
          @task_arn : String? = nil
        )
        end
      end

      # Container definitions are used in task definitions to describe the different containers that are
      # launched as part of a task.
      struct ContainerDefinition
        include JSON::Serializable

        # The command that's passed to the container. This parameter maps to Cmd in the docker container
        # create command and the COMMAND parameter to docker run. If there are multiple arguments, each
        # argument is a separated string in the array.
        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The number of cpu units reserved for the container. This parameter maps to CpuShares in the docker
        # container create command and the --cpu-shares option to docker run. This field is optional for tasks
        # using the Fargate launch type, and the only requirement is that the total amount of CPU reserved for
        # all containers within a task be lower than the task-level cpu value. You can determine the number of
        # CPU units that are available per EC2 instance type by multiplying the vCPUs listed for that instance
        # type on the Amazon EC2 Instances detail page by 1,024. Linux containers share unallocated CPU units
        # with other containers on the container instance with the same ratio as their allocated amount. For
        # example, if you run a single-container task on a single-core instance type with 512 CPU units
        # specified for that container, and that's the only task running on the container instance, that
        # container could use the full 1,024 CPU unit share at any given time. However, if you launched
        # another copy of the same task on that container instance, each task is guaranteed a minimum of 512
        # CPU units when needed. Moreover, each container could float to higher CPU usage if the other
        # container was not using it. If both tasks were 100% active all of the time, they would be limited to
        # 512 CPU units. On Linux container instances, the Docker daemon on the container instance uses the
        # CPU value to calculate the relative CPU share ratios for running containers. The minimum valid CPU
        # share value that the Linux kernel allows is 2, and the maximum valid CPU share value that the Linux
        # kernel allows is 262144. However, the CPU parameter isn't required, and you can use CPU values below
        # 2 or above 262144 in your container definitions. For CPU values below 2 (including null) or above
        # 262144, the behavior varies based on your Amazon ECS container agent version: Agent versions less
        # than or equal to 1.1.0: Null and zero CPU values are passed to Docker as 0, which Docker then
        # converts to 1,024 CPU shares. CPU values of 1 are passed to Docker as 1, which the Linux kernel
        # converts to two CPU shares. Agent versions greater than or equal to 1.2.0: Null, zero, and CPU
        # values of 1 are passed to Docker as 2. Agent versions greater than or equal to 1.84.0: CPU values
        # greater than 256 vCPU are passed to Docker as 256, which is equivalent to 262144 CPU shares. On
        # Windows container instances, the CPU limit is enforced as an absolute limit, or a quota. Windows
        # containers only have access to the specified amount of CPU that's described in the task definition.
        # A null or zero CPU value is passed to Docker as 0 , which Windows interprets as 1% of one CPU.
        @[JSON::Field(key: "cpu")]
        getter cpu : Int32?

        # A list of ARNs in SSM or Amazon S3 to a credential spec ( CredSpec ) file that configures the
        # container for Active Directory authentication. We recommend that you use this parameter instead of
        # the dockerSecurityOptions . The maximum number of ARNs is 1. There are two formats for each ARN.
        # credentialspecdomainless:MyARN You use credentialspecdomainless:MyARN to provide a CredSpec with an
        # additional section for a secret in Secrets Manager. You provide the login credentials to the domain
        # in the secret. Each task that runs on any container instance can join different domains. You can use
        # this format without joining the container instance to a domain. credentialspec:MyARN You use
        # credentialspec:MyARN to provide a CredSpec for a single domain. You must join the container instance
        # to the domain before you start any tasks that use this task definition. In both formats, replace
        # MyARN with the ARN in SSM or Amazon S3. If you provide a credentialspecdomainless:MyARN , the
        # credspec must provide a ARN in Secrets Manager for a secret containing the username, password, and
        # the domain to connect to. For better security, the instance isn't joined to the domain for
        # domainless authentication. Other applications on the instance can't use the domainless credentials.
        # You can use this parameter to run tasks on the same instance, even it the tasks need to join
        # different domains. For more information, see Using gMSAs for Windows Containers and Using gMSAs for
        # Linux Containers .
        @[JSON::Field(key: "credentialSpecs")]
        getter credential_specs : Array(String)?

        # The dependencies defined for container startup and shutdown. A container can contain multiple
        # dependencies on other containers in a task definition. When a dependency is defined for container
        # startup, for container shutdown it is reversed. For tasks using the EC2 launch type, the container
        # instances require at least version 1.26.0 of the container agent to turn on container dependencies.
        # However, we recommend using the latest container agent version. For information about checking your
        # agent version and updating to the latest version, see Updating the Amazon ECS Container Agent in the
        # Amazon Elastic Container Service Developer Guide . If you're using an Amazon ECS-optimized Linux
        # AMI, your instance needs at least version 1.26.0-1 of the ecs-init package. If your container
        # instances are launched from version 20190301 or later, then they contain the required versions of
        # the container agent and ecs-init . For more information, see Amazon ECS-optimized Linux AMI in the
        # Amazon Elastic Container Service Developer Guide . For tasks using the Fargate launch type, the task
        # or service requires the following platforms: Linux platform version 1.3.0 or later. Windows platform
        # version 1.0.0 or later.
        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(Types::ContainerDependency)?

        # When this parameter is true, networking is off within the container. This parameter maps to
        # NetworkDisabled in the docker container create command. This parameter is not supported for Windows
        # containers.
        @[JSON::Field(key: "disableNetworking")]
        getter disable_networking : Bool?

        # A list of DNS search domains that are presented to the container. This parameter maps to DnsSearch
        # in the docker container create command and the --dns-search option to docker run. This parameter is
        # not supported for Windows containers.
        @[JSON::Field(key: "dnsSearchDomains")]
        getter dns_search_domains : Array(String)?

        # A list of DNS servers that are presented to the container. This parameter maps to Dns in the docker
        # container create command and the --dns option to docker run. This parameter is not supported for
        # Windows containers.
        @[JSON::Field(key: "dnsServers")]
        getter dns_servers : Array(String)?

        # A key/value map of labels to add to the container. This parameter maps to Labels in the docker
        # container create command and the --label option to docker run. This parameter requires version 1.18
        # of the Docker Remote API or greater on your container instance. To check the Docker Remote API
        # version on your container instance, log in to your container instance and run the following command:
        # sudo docker version --format '{{.Server.APIVersion}}'
        @[JSON::Field(key: "dockerLabels")]
        getter docker_labels : Hash(String, String)?

        # A list of strings to provide custom configuration for multiple security systems. This field isn't
        # valid for containers in tasks using the Fargate launch type. For Linux tasks on EC2, this parameter
        # can be used to reference custom labels for SELinux and AppArmor multi-level security systems. For
        # any tasks on EC2, this parameter can be used to reference a credential spec file that configures a
        # container for Active Directory authentication. For more information, see Using gMSAs for Windows
        # Containers and Using gMSAs for Linux Containers in the Amazon Elastic Container Service Developer
        # Guide . This parameter maps to SecurityOpt in the docker container create command and the
        # --security-opt option to docker run. The Amazon ECS container agent running on a container instance
        # must register with the ECS_SELINUX_CAPABLE=true or ECS_APPARMOR_CAPABLE=true environment variables
        # before containers placed on that instance can use these security options. For more information, see
        # Amazon ECS Container Agent Configuration in the Amazon Elastic Container Service Developer Guide .
        # Valid values: "no-new-privileges" | "apparmor:PROFILE" | "label:value" |
        # "credentialspec:CredentialSpecFilePath"
        @[JSON::Field(key: "dockerSecurityOptions")]
        getter docker_security_options : Array(String)?

        # Early versions of the Amazon ECS container agent don't properly handle entryPoint parameters. If you
        # have problems using entryPoint , update your container agent or enter your commands and arguments as
        # command array items instead. The entry point that's passed to the container. This parameter maps to
        # Entrypoint in the docker container create command and the --entrypoint option to docker run.
        @[JSON::Field(key: "entryPoint")]
        getter entry_point : Array(String)?

        # The environment variables to pass to a container. This parameter maps to Env in the docker container
        # create command and the --env option to docker run. We don't recommend that you use plaintext
        # environment variables for sensitive information, such as credential data.
        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # A list of files containing the environment variables to pass to a container. This parameter maps to
        # the --env-file option to docker run. You can specify up to ten environment files. The file must have
        # a .env file extension. Each line in an environment file contains an environment variable in
        # VARIABLE=VALUE format. Lines beginning with # are treated as comments and are ignored. If there are
        # environment variables specified using the environment parameter in a container definition, they take
        # precedence over the variables contained within an environment file. If multiple environment files
        # are specified that contain the same variable, they're processed from the top down. We recommend that
        # you use unique variable names. For more information, see Specifying Environment Variables in the
        # Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "environmentFiles")]
        getter environment_files : Array(Types::EnvironmentFile)?

        # If the essential parameter of a container is marked as true , and that container fails or stops for
        # any reason, all other containers that are part of the task are stopped. If the essential parameter
        # of a container is marked as false , its failure doesn't affect the rest of the containers in a task.
        # If this parameter is omitted, a container is assumed to be essential. All tasks must have at least
        # one essential container. If you have an application that's composed of multiple containers, group
        # containers that are used for a common purpose into components, and separate the different components
        # into multiple task definitions. For more information, see Application Architecture in the Amazon
        # Elastic Container Service Developer Guide .
        @[JSON::Field(key: "essential")]
        getter essential : Bool?

        # A list of hostnames and IP address mappings to append to the /etc/hosts file on the container. This
        # parameter maps to ExtraHosts in the docker container create command and the --add-host option to
        # docker run. This parameter isn't supported for Windows containers or tasks that use the awsvpc
        # network mode.
        @[JSON::Field(key: "extraHosts")]
        getter extra_hosts : Array(Types::HostEntry)?

        # The FireLens configuration for the container. This is used to specify and configure a log router for
        # container logs. For more information, see Custom Log Routing in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "firelensConfiguration")]
        getter firelens_configuration : Types::FirelensConfiguration?

        # The container health check command and associated configuration parameters for the container. This
        # parameter maps to HealthCheck in the docker container create command and the HEALTHCHECK parameter
        # of docker run.
        @[JSON::Field(key: "healthCheck")]
        getter health_check : Types::HealthCheck?

        # The hostname to use for your container. This parameter maps to Hostname in the docker container
        # create command and the --hostname option to docker run. The hostname parameter is not supported if
        # you're using the awsvpc network mode.
        @[JSON::Field(key: "hostname")]
        getter hostname : String?

        # The image used to start a container. This string is passed directly to the Docker daemon. By
        # default, images in the Docker Hub registry are available. Other repositories are specified with
        # either repository-url / image : tag or repository-url / image @ digest . For images using tags
        # (repository-url/image:tag), up to 255 characters total are allowed, including letters (uppercase and
        # lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs (#).
        # For images using digests (repository-url/image@digest), the 255 character limit applies only to the
        # repository URL and image name (everything before the @ sign). The only supported hash function is
        # sha256, and the hash value after sha256: must be exactly 64 characters (only letters A-F, a-f, and
        # numbers 0-9 are allowed). This parameter maps to Image in the docker container create command and
        # the IMAGE parameter of docker run. When a new task starts, the Amazon ECS container agent pulls the
        # latest version of the specified image and tag for the container to use. However, subsequent updates
        # to a repository image aren't propagated to already running tasks. Images in Amazon ECR repositories
        # can be specified by either using the full registry/repository:tag or registry/repository@digest .
        # For example, 012345678910.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt;:latest
        # or
        # 012345678910.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt;@sha256:94afd1f2e64d908bc90dbca0035a5b567EXAMPLE
        # . Images in official repositories on Docker Hub use a single name (for example, ubuntu or mongo ).
        # Images in other repositories on Docker Hub are qualified with an organization name (for example,
        # amazon/amazon-ecs-agent ). Images in other online repositories are qualified further by a domain
        # name (for example, quay.io/assemblyline/ubuntu ).
        @[JSON::Field(key: "image")]
        getter image : String?

        # When this parameter is true , you can deploy containerized applications that require stdin or a tty
        # to be allocated. This parameter maps to OpenStdin in the docker container create command and the
        # --interactive option to docker run.
        @[JSON::Field(key: "interactive")]
        getter interactive : Bool?

        # The links parameter allows containers to communicate with each other without the need for port
        # mappings. This parameter is only supported if the network mode of a task definition is bridge . The
        # name:internalName construct is analogous to name:alias in Docker links. Up to 255 letters (uppercase
        # and lowercase), numbers, underscores, and hyphens are allowed.. This parameter maps to Links in the
        # docker container create command and the --link option to docker run. This parameter is not supported
        # for Windows containers. Containers that are collocated on a single container instance may be able to
        # communicate with each other without requiring links or host port mappings. Network isolation is
        # achieved on the container instance using security groups and VPC settings.
        @[JSON::Field(key: "links")]
        getter links : Array(String)?

        # Linux-specific modifications that are applied to the default Docker container configuration, such as
        # Linux kernel capabilities. For more information see KernelCapabilities . This parameter is not
        # supported for Windows containers.
        @[JSON::Field(key: "linuxParameters")]
        getter linux_parameters : Types::LinuxParameters?

        # The log configuration specification for the container. This parameter maps to LogConfig in the
        # docker container create command and the --log-driver option to docker run. By default, containers
        # use the same logging driver that the Docker daemon uses. However the container can use a different
        # logging driver than the Docker daemon by specifying a log driver with this parameter in the
        # container definition. To use a different logging driver for a container, the log system must be
        # configured properly on the container instance (or on a different log server for remote logging
        # options). Amazon ECS currently supports a subset of the logging drivers available to the Docker
        # daemon (shown in the LogConfiguration data type). Additional log drivers may be available in future
        # releases of the Amazon ECS container agent. This parameter requires version 1.18 of the Docker
        # Remote API or greater on your container instance. To check the Docker Remote API version on your
        # container instance, log in to your container instance and run the following command: sudo docker
        # version --format '{{.Server.APIVersion}}' The Amazon ECS container agent running on a container
        # instance must register the logging drivers available on that instance with the
        # ECS_AVAILABLE_LOGGING_DRIVERS environment variable before containers placed on that instance can use
        # these log configuration options. For more information, see Amazon ECS Container Agent Configuration
        # in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The amount (in MiB) of memory to present to the container. If your container attempts to exceed the
        # memory specified here, the container is killed. The total amount of memory reserved for all
        # containers within a task must be lower than the task memory value, if one is specified. This
        # parameter maps to Memory in the docker container create command and the --memory option to docker
        # run. If using the Fargate launch type, this parameter is optional. If using the EC2 launch type, you
        # must specify either a task-level memory value or a container-level memory value. If you specify both
        # a container-level memory and memoryReservation value, memory must be greater than memoryReservation
        # . If you specify memoryReservation , then that value is subtracted from the available memory
        # resources for the container instance where the container is placed. Otherwise, the value of memory
        # is used. The Docker 20.10.0 or later daemon reserves a minimum of 6 MiB of memory for a container.
        # So, don't specify less than 6 MiB of memory for your containers. The Docker 19.03.13-ce or earlier
        # daemon reserves a minimum of 4 MiB of memory for a container. So, don't specify less than 4 MiB of
        # memory for your containers.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The soft limit (in MiB) of memory to reserve for the container. When system memory is under heavy
        # contention, Docker attempts to keep the container memory to this soft limit. However, your container
        # can consume more memory when it needs to, up to either the hard limit specified with the memory
        # parameter (if applicable), or all of the available memory on the container instance, whichever comes
        # first. This parameter maps to MemoryReservation in the docker container create command and the
        # --memory-reservation option to docker run. If a task-level memory value is not specified, you must
        # specify a non-zero integer for one or both of memory or memoryReservation in a container definition.
        # If you specify both, memory must be greater than memoryReservation . If you specify
        # memoryReservation , then that value is subtracted from the available memory resources for the
        # container instance where the container is placed. Otherwise, the value of memory is used. For
        # example, if your container normally uses 128 MiB of memory, but occasionally bursts to 256 MiB of
        # memory for short periods of time, you can set a memoryReservation of 128 MiB, and a memory hard
        # limit of 300 MiB. This configuration would allow the container to only reserve 128 MiB of memory
        # from the remaining resources on the container instance, but also allow the container to consume more
        # memory resources when needed. The Docker 20.10.0 or later daemon reserves a minimum of 6 MiB of
        # memory for a container. So, don't specify less than 6 MiB of memory for your containers. The Docker
        # 19.03.13-ce or earlier daemon reserves a minimum of 4 MiB of memory for a container. So, don't
        # specify less than 4 MiB of memory for your containers.
        @[JSON::Field(key: "memoryReservation")]
        getter memory_reservation : Int32?

        # The mount points for data volumes in your container. This parameter maps to Volumes in the docker
        # container create command and the --volume option to docker run. Windows containers can mount whole
        # directories on the same drive as $env:ProgramData . Windows containers can't mount directories on a
        # different drive, and mount point can't be across drives.
        @[JSON::Field(key: "mountPoints")]
        getter mount_points : Array(Types::MountPoint)?

        # The name of a container. If you're linking multiple containers together in a task definition, the
        # name of one container can be entered in the links of another container to connect the containers. Up
        # to 255 letters (uppercase and lowercase), numbers, underscores, and hyphens are allowed. This
        # parameter maps to name in the docker container create command and the --name option to docker run.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The list of port mappings for the container. Port mappings allow containers to access ports on the
        # host container instance to send or receive traffic. For task definitions that use the awsvpc network
        # mode, only specify the containerPort . The hostPort can be left blank or it must be the same value
        # as the containerPort . Port mappings on Windows use the NetNAT gateway address rather than localhost
        # . There's no loopback for port mappings on Windows, so you can't access a container's mapped port
        # from the host itself. This parameter maps to PortBindings in the docker container create command and
        # the --publish option to docker run. If the network mode of a task definition is set to none , then
        # you can't specify port mappings. If the network mode of a task definition is set to host , then host
        # ports must either be undefined or they must match the container port in the port mapping. After a
        # task reaches the RUNNING status, manual and automatic host and container port assignments are
        # visible in the Network Bindings section of a container description for a selected task in the Amazon
        # ECS console. The assignments are also visible in the networkBindings section DescribeTasks
        # responses.
        @[JSON::Field(key: "portMappings")]
        getter port_mappings : Array(Types::PortMapping)?

        # When this parameter is true, the container is given elevated privileges on the host container
        # instance (similar to the root user). This parameter maps to Privileged in the docker container
        # create command and the --privileged option to docker run This parameter is not supported for Windows
        # containers or tasks run on Fargate.
        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        # When this parameter is true , a TTY is allocated. This parameter maps to Tty in the docker container
        # create command and the --tty option to docker run.
        @[JSON::Field(key: "pseudoTerminal")]
        getter pseudo_terminal : Bool?

        # When this parameter is true, the container is given read-only access to its root file system. This
        # parameter maps to ReadonlyRootfs in the docker container create command and the --read-only option
        # to docker run. This parameter is not supported for Windows containers.
        @[JSON::Field(key: "readonlyRootFilesystem")]
        getter readonly_root_filesystem : Bool?

        # The private repository authentication credentials to use.
        @[JSON::Field(key: "repositoryCredentials")]
        getter repository_credentials : Types::RepositoryCredentials?

        # The type and amount of a resource to assign to a container. The only supported resource is a GPU.
        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        # The restart policy for a container. When you set up a restart policy, Amazon ECS can restart the
        # container without needing to replace the task. For more information, see Restart individual
        # containers in Amazon ECS tasks with container restart policies in the Amazon Elastic Container
        # Service Developer Guide .
        @[JSON::Field(key: "restartPolicy")]
        getter restart_policy : Types::ContainerRestartPolicy?

        # The secrets to pass to the container. For more information, see Specifying Sensitive Data in the
        # Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "secrets")]
        getter secrets : Array(Types::Secret)?

        # Time duration (in seconds) to wait before giving up on resolving dependencies for a container. For
        # example, you specify two containers in a task definition with containerA having a dependency on
        # containerB reaching a COMPLETE , SUCCESS , or HEALTHY status. If a startTimeout value is specified
        # for containerB and it doesn't reach the desired status within that time then containerA gives up and
        # not start. This results in the task transitioning to a STOPPED state. When the
        # ECS_CONTAINER_START_TIMEOUT container agent configuration variable is used, it's enforced
        # independently from this start timeout value. For tasks using the Fargate launch type, the task or
        # service requires the following platforms: Linux platform version 1.3.0 or later. Windows platform
        # version 1.0.0 or later. For tasks using the EC2 launch type, your container instances require at
        # least version 1.26.0 of the container agent to use a container start timeout value. However, we
        # recommend using the latest container agent version. For information about checking your agent
        # version and updating to the latest version, see Updating the Amazon ECS Container Agent in the
        # Amazon Elastic Container Service Developer Guide . If you're using an Amazon ECS-optimized Linux
        # AMI, your instance needs at least version 1.26.0-1 of the ecs-init package. If your container
        # instances are launched from version 20190301 or later, then they contain the required versions of
        # the container agent and ecs-init . For more information, see Amazon ECS-optimized Linux AMI in the
        # Amazon Elastic Container Service Developer Guide . The valid values for Fargate are 2-120 seconds.
        @[JSON::Field(key: "startTimeout")]
        getter start_timeout : Int32?

        # Time duration (in seconds) to wait before the container is forcefully killed if it doesn't exit
        # normally on its own. For tasks using the Fargate launch type, the task or service requires the
        # following platforms: Linux platform version 1.3.0 or later. Windows platform version 1.0.0 or later.
        # For tasks that use the Fargate launch type, the max stop timeout value is 120 seconds and if the
        # parameter is not specified, the default value of 30 seconds is used. For tasks that use the EC2
        # launch type, if the stopTimeout parameter isn't specified, the value set for the Amazon ECS
        # container agent configuration variable ECS_CONTAINER_STOP_TIMEOUT is used. If neither the
        # stopTimeout parameter or the ECS_CONTAINER_STOP_TIMEOUT agent configuration variable are set, then
        # the default values of 30 seconds for Linux containers and 30 seconds on Windows containers are used.
        # Your container instances require at least version 1.26.0 of the container agent to use a container
        # stop timeout value. However, we recommend using the latest container agent version. For information
        # about checking your agent version and updating to the latest version, see Updating the Amazon ECS
        # Container Agent in the Amazon Elastic Container Service Developer Guide . If you're using an Amazon
        # ECS-optimized Linux AMI, your instance needs at least version 1.26.0-1 of the ecs-init package. If
        # your container instances are launched from version 20190301 or later, then they contain the required
        # versions of the container agent and ecs-init . For more information, see Amazon ECS-optimized Linux
        # AMI in the Amazon Elastic Container Service Developer Guide . The valid values for Fargate are 2-120
        # seconds.
        @[JSON::Field(key: "stopTimeout")]
        getter stop_timeout : Int32?

        # A list of namespaced kernel parameters to set in the container. This parameter maps to Sysctls in
        # the docker container create command and the --sysctl option to docker run. For example, you can
        # configure net.ipv4.tcp_keepalive_time setting to maintain longer lived connections.
        @[JSON::Field(key: "systemControls")]
        getter system_controls : Array(Types::SystemControl)?

        # A list of ulimits to set in the container. If a ulimit value is specified in a task definition, it
        # overrides the default values set by Docker. This parameter maps to Ulimits in the docker container
        # create command and the --ulimit option to docker run. Valid naming values are displayed in the
        # Ulimit data type. Amazon ECS tasks hosted on Fargate use the default resource limit values set by
        # the operating system with the exception of the nofile resource limit parameter which Fargate
        # overrides. The nofile resource limit sets a restriction on the number of open files that a container
        # can use. The default nofile soft limit is 65535 and the default hard limit is 65535 . This parameter
        # requires version 1.18 of the Docker Remote API or greater on your container instance. To check the
        # Docker Remote API version on your container instance, log in to your container instance and run the
        # following command: sudo docker version --format '{{.Server.APIVersion}}' This parameter is not
        # supported for Windows containers.
        @[JSON::Field(key: "ulimits")]
        getter ulimits : Array(Types::Ulimit)?

        # The user to use inside the container. This parameter maps to User in the docker container create
        # command and the --user option to docker run. When running tasks using the host network mode, don't
        # run containers using the root user (UID 0). We recommend using a non-root user for better security.
        # You can specify the user using the following formats. If specifying a UID or GID, you must specify
        # it as a positive integer. user user:group uid uid:gid user:gid uid:group This parameter is not
        # supported for Windows containers.
        @[JSON::Field(key: "user")]
        getter user : String?

        # Specifies whether Amazon ECS will resolve the container image tag provided in the container
        # definition to an image digest. By default, the value is enabled . If you set the value for a
        # container as disabled , Amazon ECS will not resolve the provided container image tag to a digest and
        # will use the original image URI specified in the container definition for deployment. For more
        # information about container image resolution, see Container image resolution in the Amazon ECS
        # Developer Guide .
        @[JSON::Field(key: "versionConsistency")]
        getter version_consistency : String?

        # Data volumes to mount from another container. This parameter maps to VolumesFrom in the docker
        # container create command and the --volumes-from option to docker run.
        @[JSON::Field(key: "volumesFrom")]
        getter volumes_from : Array(Types::VolumeFrom)?

        # The working directory to run commands inside the container in. This parameter maps to WorkingDir in
        # the docker container create command and the --workdir option to docker run.
        @[JSON::Field(key: "workingDirectory")]
        getter working_directory : String?

        def initialize(
          @command : Array(String)? = nil,
          @cpu : Int32? = nil,
          @credential_specs : Array(String)? = nil,
          @depends_on : Array(Types::ContainerDependency)? = nil,
          @disable_networking : Bool? = nil,
          @dns_search_domains : Array(String)? = nil,
          @dns_servers : Array(String)? = nil,
          @docker_labels : Hash(String, String)? = nil,
          @docker_security_options : Array(String)? = nil,
          @entry_point : Array(String)? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @environment_files : Array(Types::EnvironmentFile)? = nil,
          @essential : Bool? = nil,
          @extra_hosts : Array(Types::HostEntry)? = nil,
          @firelens_configuration : Types::FirelensConfiguration? = nil,
          @health_check : Types::HealthCheck? = nil,
          @hostname : String? = nil,
          @image : String? = nil,
          @interactive : Bool? = nil,
          @links : Array(String)? = nil,
          @linux_parameters : Types::LinuxParameters? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @memory : Int32? = nil,
          @memory_reservation : Int32? = nil,
          @mount_points : Array(Types::MountPoint)? = nil,
          @name : String? = nil,
          @port_mappings : Array(Types::PortMapping)? = nil,
          @privileged : Bool? = nil,
          @pseudo_terminal : Bool? = nil,
          @readonly_root_filesystem : Bool? = nil,
          @repository_credentials : Types::RepositoryCredentials? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil,
          @restart_policy : Types::ContainerRestartPolicy? = nil,
          @secrets : Array(Types::Secret)? = nil,
          @start_timeout : Int32? = nil,
          @stop_timeout : Int32? = nil,
          @system_controls : Array(Types::SystemControl)? = nil,
          @ulimits : Array(Types::Ulimit)? = nil,
          @user : String? = nil,
          @version_consistency : String? = nil,
          @volumes_from : Array(Types::VolumeFrom)? = nil,
          @working_directory : String? = nil
        )
        end
      end

      # The dependencies defined for container startup and shutdown. A container can contain multiple
      # dependencies. When a dependency is defined for container startup, for container shutdown it is
      # reversed. Your Amazon ECS container instances require at least version 1.26.0 of the container agent
      # to use container dependencies. However, we recommend using the latest container agent version. For
      # information about checking your agent version and updating to the latest version, see Updating the
      # Amazon ECS Container Agent in the Amazon Elastic Container Service Developer Guide . If you're using
      # an Amazon ECS-optimized Linux AMI, your instance needs at least version 1.26.0-1 of the ecs-init
      # package. If your container instances are launched from version 20190301 or later, then they contain
      # the required versions of the container agent and ecs-init . For more information, see Amazon
      # ECS-optimized Linux AMI in the Amazon Elastic Container Service Developer Guide . For tasks that use
      # the Fargate launch type, the task or service requires the following platforms: Linux platform
      # version 1.3.0 or later. Windows platform version 1.0.0 or later. For more information about how to
      # create a container dependency, see Container dependency in the Amazon Elastic Container Service
      # Developer Guide .
      struct ContainerDependency
        include JSON::Serializable

        # The dependency condition of the container. The following are the available conditions and their
        # behavior: START - This condition emulates the behavior of links and volumes today. It validates that
        # a dependent container is started before permitting other containers to start. COMPLETE - This
        # condition validates that a dependent container runs to completion (exits) before permitting other
        # containers to start. This can be useful for nonessential containers that run a script and then exit.
        # This condition can't be set on an essential container. SUCCESS - This condition is the same as
        # COMPLETE , but it also requires that the container exits with a zero status. This condition can't be
        # set on an essential container. HEALTHY - This condition validates that the dependent container
        # passes its Docker health check before permitting other containers to start. This requires that the
        # dependent container has health checks configured. This condition is confirmed only at task startup.
        @[JSON::Field(key: "condition")]
        getter condition : String

        # The name of a container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String

        def initialize(
          @condition : String,
          @container_name : String
        )
        end
      end

      # The details about the container image a service revision uses. To ensure that all tasks in a service
      # use the same container image, Amazon ECS resolves container image names and any image tags specified
      # in the task definition to container image digests. After the container image digest has been
      # established, Amazon ECS uses the digest to start any other desired tasks, and for any future service
      # and service revision updates. This leads to all tasks in a service always running identical
      # container images, resulting in version consistency for your software. For more information, see
      # Container image resolution in the Amazon ECS Developer Guide.
      struct ContainerImage
        include JSON::Serializable

        # The name of the container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The container image.
        @[JSON::Field(key: "image")]
        getter image : String?

        # The container image digest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        def initialize(
          @container_name : String? = nil,
          @image : String? = nil,
          @image_digest : String? = nil
        )
        end
      end

      # An Amazon EC2 or External instance that's running the Amazon ECS agent and has been registered with
      # a cluster.
      struct ContainerInstance
        include JSON::Serializable

        # This parameter returns true if the agent is connected to Amazon ECS. An instance with an agent that
        # may be unhealthy or stopped return false . Only instances connected to an agent can accept task
        # placement requests.
        @[JSON::Field(key: "agentConnected")]
        getter agent_connected : Bool?

        # The status of the most recent agent update. If an update wasn't ever requested, this value is NULL .
        @[JSON::Field(key: "agentUpdateStatus")]
        getter agent_update_status : String?

        # The resources attached to a container instance, such as an elastic network interface.
        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::Attachment)?

        # The attributes set for the container instance, either by the Amazon ECS container agent at instance
        # registration or manually with the PutAttributes operation.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        # The capacity provider that's associated with the container instance.
        @[JSON::Field(key: "capacityProviderName")]
        getter capacity_provider_name : String?

        # The Amazon Resource Name (ARN) of the container instance. For more information about the ARN format,
        # see Amazon Resource Name (ARN) in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # The ID of the container instance. For Amazon EC2 instances, this value is the Amazon EC2 instance
        # ID. For external instances, this value is the Amazon Web Services Systems Manager managed instance
        # ID.
        @[JSON::Field(key: "ec2InstanceId")]
        getter ec2_instance_id : String?

        # An object representing the health status of the container instance.
        @[JSON::Field(key: "healthStatus")]
        getter health_status : Types::ContainerInstanceHealthStatus?

        # The number of tasks on the container instance that are in the PENDING status.
        @[JSON::Field(key: "pendingTasksCount")]
        getter pending_tasks_count : Int32?

        # The Unix timestamp for the time when the container instance was registered.
        @[JSON::Field(key: "registeredAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter registered_at : Time?

        # For CPU and memory resource types, this parameter describes the amount of each resource that was
        # available on the container instance when the container agent registered it with Amazon ECS. This
        # value represents the total amount of CPU and memory that can be allocated on this container instance
        # to tasks. For port resource types, this parameter describes the ports that were reserved by the
        # Amazon ECS container agent when it registered the container instance with Amazon ECS.
        @[JSON::Field(key: "registeredResources")]
        getter registered_resources : Array(Types::Resource)?

        # For CPU and memory resource types, this parameter describes the remaining CPU and memory that wasn't
        # already allocated to tasks and is therefore available for new tasks. For port resource types, this
        # parameter describes the ports that were reserved by the Amazon ECS container agent (at instance
        # registration time) and any task containers that have reserved port mappings on the host (with the
        # host or bridge network mode). Any port that's not specified here is available for new tasks.
        @[JSON::Field(key: "remainingResources")]
        getter remaining_resources : Array(Types::Resource)?

        # The number of tasks on the container instance that have a desired status ( desiredStatus ) of
        # RUNNING .
        @[JSON::Field(key: "runningTasksCount")]
        getter running_tasks_count : Int32?

        # The status of the container instance. The valid values are REGISTERING , REGISTRATION_FAILED ,
        # ACTIVE , INACTIVE , DEREGISTERING , or DRAINING . If your account has opted in to the awsvpcTrunking
        # account setting, then any newly registered container instance will transition to a REGISTERING
        # status while the trunk elastic network interface is provisioned for the instance. If the
        # registration fails, the instance will transition to a REGISTRATION_FAILED status. You can describe
        # the container instance and see the reason for failure in the statusReason parameter. Once the
        # container instance is terminated, the instance transitions to a DEREGISTERING status while the trunk
        # elastic network interface is deprovisioned. The instance then transitions to an INACTIVE status. The
        # ACTIVE status indicates that the container instance can accept tasks. The DRAINING indicates that
        # new tasks aren't placed on the container instance and any service tasks running on the container
        # instance are removed if possible. For more information, see Container instance draining in the
        # Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The reason that the container instance reached its current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The metadata that you apply to the container instance to help you categorize and organize them. Each
        # tag consists of a key and an optional value. You define both. The following basic restrictions apply
        # to tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique,
        # and each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8
        # Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is used across
        # multiple services and resources, remember that other services may have restrictions on allowed
        # characters. Generally allowed characters are: letters, numbers, and spaces representable in UTF-8,
        # and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use
        # aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as
        # it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this
        # prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The version counter for the container instance. Every time a container instance experiences a change
        # that triggers a CloudWatch event, the version counter is incremented. If you're replicating your
        # Amazon ECS container instance state with CloudWatch Events, you can compare the version of a
        # container instance reported by the Amazon ECS APIs with the version reported in CloudWatch Events
        # for the container instance (inside the detail object) to verify that the version in your event
        # stream is current.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        # The version information for the Amazon ECS container agent and Docker daemon running on the
        # container instance.
        @[JSON::Field(key: "versionInfo")]
        getter version_info : Types::VersionInfo?

        def initialize(
          @agent_connected : Bool? = nil,
          @agent_update_status : String? = nil,
          @attachments : Array(Types::Attachment)? = nil,
          @attributes : Array(Types::Attribute)? = nil,
          @capacity_provider_name : String? = nil,
          @container_instance_arn : String? = nil,
          @ec2_instance_id : String? = nil,
          @health_status : Types::ContainerInstanceHealthStatus? = nil,
          @pending_tasks_count : Int32? = nil,
          @registered_at : Time? = nil,
          @registered_resources : Array(Types::Resource)? = nil,
          @remaining_resources : Array(Types::Resource)? = nil,
          @running_tasks_count : Int32? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @version : Int64? = nil,
          @version_info : Types::VersionInfo? = nil
        )
        end
      end

      # An object representing the health status of the container instance.
      struct ContainerInstanceHealthStatus
        include JSON::Serializable

        # An array of objects representing the details of the container instance health status.
        @[JSON::Field(key: "details")]
        getter details : Array(Types::InstanceHealthCheckResult)?

        # The overall health status of the container instance. This is an aggregate status of all container
        # instance health checks.
        @[JSON::Field(key: "overallStatus")]
        getter overall_status : String?

        def initialize(
          @details : Array(Types::InstanceHealthCheckResult)? = nil,
          @overall_status : String? = nil
        )
        end
      end

      # The overrides that are sent to a container. An empty container override can be passed in. An example
      # of an empty container override is {"containerOverrides": [ ] } . If a non-empty container override
      # is specified, the name parameter must be included. You can use Secrets Manager or Amazon Web
      # Services Systems Manager Parameter Store to store the sensitive data. For more information, see
      # Retrieve secrets through environment variables in the Amazon ECS Developer Guide.
      struct ContainerOverride
        include JSON::Serializable

        # The command to send to the container that overrides the default command from the Docker image or the
        # task definition. You must also specify a container name.
        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The number of cpu units reserved for the container, instead of the default value from the task
        # definition. You must also specify a container name.
        @[JSON::Field(key: "cpu")]
        getter cpu : Int32?

        # The environment variables to send to the container. You can add new environment variables, which are
        # added to the container at launch, or you can override the existing environment variables from the
        # Docker image or the task definition. You must also specify a container name.
        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # A list of files containing the environment variables to pass to a container, instead of the value
        # from the container definition.
        @[JSON::Field(key: "environmentFiles")]
        getter environment_files : Array(Types::EnvironmentFile)?

        # The hard limit (in MiB) of memory to present to the container, instead of the default value from the
        # task definition. If your container attempts to exceed the memory specified here, the container is
        # killed. You must also specify a container name.
        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The soft limit (in MiB) of memory to reserve for the container, instead of the default value from
        # the task definition. You must also specify a container name.
        @[JSON::Field(key: "memoryReservation")]
        getter memory_reservation : Int32?

        # The name of the container that receives the override. This parameter is required if any override is
        # specified.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type and amount of a resource to assign to a container, instead of the default value from the
        # task definition. The only supported resource is a GPU.
        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        def initialize(
          @command : Array(String)? = nil,
          @cpu : Int32? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @environment_files : Array(Types::EnvironmentFile)? = nil,
          @memory : Int32? = nil,
          @memory_reservation : Int32? = nil,
          @name : String? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil
        )
        end
      end

      # You can enable a restart policy for each container defined in your task definition, to overcome
      # transient failures faster and maintain task availability. When you enable a restart policy for a
      # container, Amazon ECS can restart the container if it exits, without needing to replace the task.
      # For more information, see Restart individual containers in Amazon ECS tasks with container restart
      # policies in the Amazon Elastic Container Service Developer Guide .
      struct ContainerRestartPolicy
        include JSON::Serializable

        # Specifies whether a restart policy is enabled for the container.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # A list of exit codes that Amazon ECS will ignore and not attempt a restart on. You can specify a
        # maximum of 50 container exit codes. By default, Amazon ECS does not ignore any exit codes.
        @[JSON::Field(key: "ignoredExitCodes")]
        getter ignored_exit_codes : Array(Int32)?

        # A period of time (in seconds) that the container must run for before a restart can be attempted. A
        # container can be restarted only once every restartAttemptPeriod seconds. If a container isn't able
        # to run for this time period and exits early, it will not be restarted. You can set a minimum
        # restartAttemptPeriod of 60 seconds and a maximum restartAttemptPeriod of 1800 seconds. By default, a
        # container must run for 300 seconds before it can be restarted.
        @[JSON::Field(key: "restartAttemptPeriod")]
        getter restart_attempt_period : Int32?

        def initialize(
          @enabled : Bool,
          @ignored_exit_codes : Array(Int32)? = nil,
          @restart_attempt_period : Int32? = nil
        )
        end
      end

      # An object that represents a change in state for a container.
      struct ContainerStateChange
        include JSON::Serializable

        # The name of the container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The exit code for the container, if the state change is a result of the container exiting.
        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The container image SHA 256 digest.
        @[JSON::Field(key: "imageDigest")]
        getter image_digest : String?

        # Any network bindings that are associated with the container.
        @[JSON::Field(key: "networkBindings")]
        getter network_bindings : Array(Types::NetworkBinding)?

        # The reason for the state change.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The ID of the Docker container.
        @[JSON::Field(key: "runtimeId")]
        getter runtime_id : String?

        # The status of the container.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @container_name : String? = nil,
          @exit_code : Int32? = nil,
          @image_digest : String? = nil,
          @network_bindings : Array(Types::NetworkBinding)? = nil,
          @reason : String? = nil,
          @runtime_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct CreateCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider. Up to 255 characters are allowed. They include letters (both
        # upper and lowercase letters), numbers, underscores (_), and hyphens (-). The name can't be prefixed
        # with " aws ", " ecs ", or " fargate ".
        @[JSON::Field(key: "name")]
        getter name : String

        # The details of the Auto Scaling group for the capacity provider.
        @[JSON::Field(key: "autoScalingGroupProvider")]
        getter auto_scaling_group_provider : Types::AutoScalingGroupProvider?

        # The name of the cluster to associate with the capacity provider. When you create a capacity provider
        # with Amazon ECS Managed Instances, it becomes available only within the specified cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The configuration for the Amazon ECS Managed Instances provider. This configuration specifies how
        # Amazon ECS manages Amazon EC2 instances on your behalf, including the infrastructure role, instance
        # launch template, and tag propagation settings.
        @[JSON::Field(key: "managedInstancesProvider")]
        getter managed_instances_provider : Types::CreateManagedInstancesProviderConfiguration?

        # The metadata that you apply to the capacity provider to categorize and organize them more
        # conveniently. Each tag consists of a key and an optional value. You define both of them. The
        # following basic restrictions apply to tags: Maximum number of tags per resource - 50 For each
        # resource, each tag key must be unique, and each tag key can have only one value. Maximum key length
        # - 128 Unicode characters in UTF-8 Maximum value length - 256 Unicode characters in UTF-8 If your
        # tagging schema is used across multiple services and resources, remember that other services may have
        # restrictions on allowed characters. Generally allowed characters are: letters, numbers, and spaces
        # representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are
        # case-sensitive. Do not use aws: , AWS: , or any upper or lowercase combination of such as a prefix
        # for either keys or values as it is reserved for Amazon Web Services use. You cannot edit or delete
        # tag keys or values with this prefix. Tags with this prefix do not count against your tags per
        # resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @auto_scaling_group_provider : Types::AutoScalingGroupProvider? = nil,
          @cluster : String? = nil,
          @managed_instances_provider : Types::CreateManagedInstancesProviderConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateCapacityProviderResponse
        include JSON::Serializable

        # The full description of the new capacity provider.
        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : Types::CapacityProvider?

        def initialize(
          @capacity_provider : Types::CapacityProvider? = nil
        )
        end
      end

      struct CreateClusterRequest
        include JSON::Serializable

        # The short name of one or more capacity providers to associate with the cluster. A capacity provider
        # must be associated with a cluster before it can be included as part of the default capacity provider
        # strategy of the cluster or used in a capacity provider strategy when calling the CreateService or
        # RunTask actions. If specifying a capacity provider that uses an Auto Scaling group, the capacity
        # provider must be created but not associated with another cluster. New Auto Scaling group capacity
        # providers can be created with the CreateCapacityProvider API operation. To use a Fargate capacity
        # provider, specify either the FARGATE or FARGATE_SPOT capacity providers. The Fargate capacity
        # providers are available to all accounts and only need to be associated with a cluster to be used.
        # The PutCapacityProvider API operation is used to update the list of available capacity providers for
        # a cluster after the cluster is created.
        @[JSON::Field(key: "capacityProviders")]
        getter capacity_providers : Array(String)?

        # The name of your cluster. If you don't specify a name for your cluster, you create a cluster that's
        # named default . Up to 255 letters (uppercase and lowercase), numbers, underscores, and hyphens are
        # allowed.
        @[JSON::Field(key: "clusterName")]
        getter cluster_name : String?

        # The execute command configuration for the cluster.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ClusterConfiguration?

        # The capacity provider strategy to set as the default for the cluster. After a default capacity
        # provider strategy is set for a cluster, when you call the CreateService or RunTask APIs with no
        # capacity provider strategy or launch type specified, the default capacity provider strategy for the
        # cluster is used. If a default capacity provider strategy isn't defined for a cluster when it was
        # created, it can be defined later with the PutClusterCapacityProviders API operation.
        @[JSON::Field(key: "defaultCapacityProviderStrategy")]
        getter default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # Use this parameter to set a default Service Connect namespace. After you set a default Service
        # Connect namespace, any new services with Service Connect turned on that are created in the cluster
        # are added as client services in the namespace. This setting only applies to new services that set
        # the enabled parameter to true in the ServiceConnectConfiguration . You can set the namespace of each
        # service individually in the ServiceConnectConfiguration to override this default parameter. Tasks
        # that run in a namespace can use short names to connect to services in the namespace. Tasks can
        # connect to services across all of the clusters in the namespace. Tasks connect through a managed
        # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
        # ECS services create are supported with Service Connect. For more information, see Service Connect in
        # the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "serviceConnectDefaults")]
        getter service_connect_defaults : Types::ClusterServiceConnectDefaultsRequest?

        # The setting to use when creating a cluster. This parameter is used to turn on CloudWatch Container
        # Insights for a cluster. If this value is specified, it overrides the containerInsights value set
        # with PutAccountSetting or PutAccountSettingDefault .
        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::ClusterSetting)?

        # The metadata that you apply to the cluster to help you categorize and organize them. Each tag
        # consists of a key and an optional value. You define both. The following basic restrictions apply to
        # tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique, and
        # each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8 Maximum
        # value length - 256 Unicode characters in UTF-8 If your tagging schema is used across multiple
        # services and resources, remember that other services may have restrictions on allowed characters.
        # Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, and the
        # following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use aws: ,
        # AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this prefix.
        # Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @capacity_providers : Array(String)? = nil,
          @cluster_name : String? = nil,
          @configuration : Types::ClusterConfiguration? = nil,
          @default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @service_connect_defaults : Types::ClusterServiceConnectDefaultsRequest? = nil,
          @settings : Array(Types::ClusterSetting)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateClusterResponse
        include JSON::Serializable

        # The full description of your new cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct CreateExpressGatewayServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS container agent
        # permission to make Amazon Web Services API calls on your behalf. This role is required for Amazon
        # ECS to pull container images from Amazon ECR, send container logs to Amazon CloudWatch Logs, and
        # retrieve sensitive data from Amazon Web Services Systems Manager Parameter Store or Amazon Web
        # Services Secrets Manager. The execution role must include the AmazonECSTaskExecutionRolePolicy
        # managed policy or equivalent permissions. For Express services, this role is used during task
        # startup and runtime for container management operations.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The Amazon Resource Name (ARN) of the infrastructure role that grants Amazon ECS permission to
        # create and manage Amazon Web Services resources on your behalf for the Express service. This role is
        # used to provision and manage Application Load Balancers, target groups, security groups,
        # auto-scaling policies, and other Amazon Web Services infrastructure components. The infrastructure
        # role must include permissions for Elastic Load Balancing, Application Auto Scaling, Amazon EC2 (for
        # security groups), and other services required for managed infrastructure. This role is only used
        # during Express service creation, updates, and deletion operations.
        @[JSON::Field(key: "infrastructureRoleArn")]
        getter infrastructure_role_arn : String

        # The primary container configuration for the Express service. This defines the main application
        # container that will receive traffic from the Application Load Balancer. The primary container must
        # specify at minimum a container image. You can also configure the container port (defaults to 80),
        # logging configuration, environment variables, secrets, and startup commands. The container image can
        # be from Amazon ECR, Docker Hub, or any other container registry accessible to your execution role.
        @[JSON::Field(key: "primaryContainer")]
        getter primary_container : Types::ExpressGatewayContainer

        # The short name or full Amazon Resource Name (ARN) of the cluster on which to create the Express
        # service. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The number of CPU units used by the task. This parameter determines the CPU allocation for each task
        # in the Express service. The default value for an Express service is 256 (.25 vCPU).
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The path on the container that the Application Load Balancer uses for health checks. This should be
        # a valid HTTP endpoint that returns a successful response (HTTP 200) when the application is healthy.
        # If not specified, the default health check path is /ping . The health check path must start with a
        # forward slash and can include query parameters. Examples: /health , /api/status , /ping?format=json
        # .
        @[JSON::Field(key: "healthCheckPath")]
        getter health_check_path : String?

        # The amount of memory (in MiB) used by the task. This parameter determines the memory allocation for
        # each task in the Express service. The default value for an express service is 512 MiB.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The network configuration for the Express service tasks. This specifies the VPC subnets and security
        # groups for the tasks. For Express services, you can specify custom security groups and subnets. If
        # not provided, Amazon ECS will use the default VPC configuration and create appropriate security
        # groups automatically. The network configuration determines how your service integrates with your VPC
        # and what network access it has.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::ExpressGatewayServiceNetworkConfiguration?

        # The auto-scaling configuration for the Express service. This defines how the service automatically
        # adjusts the number of running tasks based on demand. You can specify the minimum and maximum number
        # of tasks, the scaling metric (CPU utilization, memory utilization, or request count per target), and
        # the target value for the metric. If not specified, the default target value for an Express service
        # is 60.
        @[JSON::Field(key: "scalingTarget")]
        getter scaling_target : Types::ExpressGatewayScalingTarget?

        # The name of the Express service. This name must be unique within the specified cluster and can
        # contain up to 255 letters (uppercase and lowercase), numbers, underscores, and hyphens. The name is
        # used to identify the service in the Amazon ECS console and API operations. If you don't specify a
        # service name, Amazon ECS generates a unique name for the service. The service name becomes part of
        # the service ARN and cannot be changed after the service is created.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The metadata that you apply to the Express service to help categorize and organize it. Each tag
        # consists of a key and an optional value. You can apply up to 50 tags to a service.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of the IAM role that containers in this task can assume. This role
        # allows your application code to access other Amazon Web Services services securely. The task role is
        # different from the execution role. While the execution role is used by the Amazon ECS agent to set
        # up the task, the task role is used by your application code running inside the container to make
        # Amazon Web Services API calls. If your application doesn't need to access Amazon Web Services
        # services, you can omit this parameter.
        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        def initialize(
          @execution_role_arn : String,
          @infrastructure_role_arn : String,
          @primary_container : Types::ExpressGatewayContainer,
          @cluster : String? = nil,
          @cpu : String? = nil,
          @health_check_path : String? = nil,
          @memory : String? = nil,
          @network_configuration : Types::ExpressGatewayServiceNetworkConfiguration? = nil,
          @scaling_target : Types::ExpressGatewayScalingTarget? = nil,
          @service_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_role_arn : String? = nil
        )
        end
      end

      struct CreateExpressGatewayServiceResponse
        include JSON::Serializable

        # The full description of your Express service following the create operation.
        @[JSON::Field(key: "service")]
        getter service : Types::ECSExpressGatewayService?

        def initialize(
          @service : Types::ECSExpressGatewayService? = nil
        )
        end
      end

      # The configuration for creating a Amazon ECS Managed Instances provider. This specifies how Amazon
      # ECS should manage Amazon EC2 instances, including the infrastructure role, instance launch template,
      # and whether to propagate tags from the capacity provider to the instances.
      struct CreateManagedInstancesProviderConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the infrastructure role that Amazon ECS uses to manage instances
        # on your behalf. This role must have permissions to launch, terminate, and manage Amazon EC2
        # instances, as well as access to other Amazon Web Services services required for Amazon ECS Managed
        # Instances functionality. For more information, see Amazon ECS infrastructure IAM role in the Amazon
        # ECS Developer Guide .
        @[JSON::Field(key: "infrastructureRoleArn")]
        getter infrastructure_role_arn : String

        # The launch template configuration that specifies how Amazon ECS should launch Amazon EC2 instances.
        # This includes the instance profile, network configuration, storage settings, and instance
        # requirements for attribute-based instance type selection. For more information, see Store instance
        # launch parameters in Amazon EC2 launch templates in the Amazon EC2 User Guide .
        @[JSON::Field(key: "instanceLaunchTemplate")]
        getter instance_launch_template : Types::InstanceLaunchTemplate

        # Defines how Amazon ECS Managed Instances optimizes the infrastastructure in your capacity provider.
        # Provides control over the delay between when EC2 instances become idle or underutilized and when
        # Amazon ECS optimizes them.
        @[JSON::Field(key: "infrastructureOptimization")]
        getter infrastructure_optimization : Types::InfrastructureOptimization?

        # Specifies whether to propagate tags from the capacity provider to the Amazon ECS Managed Instances.
        # When enabled, tags applied to the capacity provider are automatically applied to all instances
        # launched by this provider.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        def initialize(
          @infrastructure_role_arn : String,
          @instance_launch_template : Types::InstanceLaunchTemplate,
          @infrastructure_optimization : Types::InfrastructureOptimization? = nil,
          @propagate_tags : String? = nil
        )
        end
      end

      struct CreateServiceRequest
        include JSON::Serializable

        # The name of your service. Up to 255 letters (uppercase and lowercase), numbers, underscores, and
        # hyphens are allowed. Service names must be unique within a cluster, but you can have similarly named
        # services in multiple clusters within a Region or across multiple Regions.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String

        # Indicates whether to use Availability Zone rebalancing for the service. For more information, see
        # Balancing an Amazon ECS service across Availability Zones in the Amazon Elastic Container Service
        # Developer Guide . The default behavior of AvailabilityZoneRebalancing differs between create and
        # update requests: For create service requests, when no value is specified for
        # AvailabilityZoneRebalancing , Amazon ECS defaults the value to ENABLED . For update service
        # requests, when no value is specified for AvailabilityZoneRebalancing , Amazon ECS defaults to the
        # existing service’s AvailabilityZoneRebalancing value. If the service never had an
        # AvailabilityZoneRebalancing value set, Amazon ECS treats this as DISABLED .
        @[JSON::Field(key: "availabilityZoneRebalancing")]
        getter availability_zone_rebalancing : String?

        # The capacity provider strategy to use for the service. If you want to use Amazon ECS Managed
        # Instances, you must use the capacityProviderStrategy request parameter and omit the launchType
        # request parameter. If a capacityProviderStrategy is specified, the launchType parameter must be
        # omitted. If no capacityProviderStrategy or launchType is specified, the
        # defaultCapacityProviderStrategy for the cluster is used. A capacity provider strategy can contain a
        # maximum of 20 capacity providers.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # An identifier that you provide to ensure the idempotency of the request. It must be unique and is
        # case sensitive. Up to 36 ASCII characters in the range of 33-126 (inclusive) are allowed.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The short name or full Amazon Resource Name (ARN) of the cluster that you run your service on. If
        # you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Optional deployment parameters that control how many tasks run during the deployment and the
        # ordering of stopping and starting tasks.
        @[JSON::Field(key: "deploymentConfiguration")]
        getter deployment_configuration : Types::DeploymentConfiguration?

        # The deployment controller to use for the service. If no deployment controller is specified, the
        # default value of ECS is used.
        @[JSON::Field(key: "deploymentController")]
        getter deployment_controller : Types::DeploymentController?

        # The number of instantiations of the specified task definition to place and keep running in your
        # service. This is required if schedulingStrategy is REPLICA or isn't specified. If schedulingStrategy
        # is DAEMON then this isn't required.
        @[JSON::Field(key: "desiredCount")]
        getter desired_count : Int32?

        # Specifies whether to turn on Amazon ECS managed tags for the tasks within the service. For more
        # information, see Tagging your Amazon ECS resources in the Amazon Elastic Container Service Developer
        # Guide . When you use Amazon ECS managed tags, you must set the propagateTags request parameter.
        @[JSON::Field(key: "enableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Determines whether the execute command functionality is turned on for the service. If true , this
        # enables execute command functionality on all containers in the service tasks.
        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy Elastic Load
        # Balancing, VPC Lattice, and container health checks after a task has first started. If you do not
        # specify a health check grace period value, the default value of 0 is used. If you do not use any of
        # the health checks, then healthCheckGracePeriodSeconds is unused. If your service has more running
        # tasks than desired, unhealthy tasks in the grace period might be stopped to reach the desired count.
        @[JSON::Field(key: "healthCheckGracePeriodSeconds")]
        getter health_check_grace_period_seconds : Int32?

        # The infrastructure that you run your service on. For more information, see Amazon ECS launch types
        # in the Amazon Elastic Container Service Developer Guide . If you want to use Amazon ECS Managed
        # Instances, you must use the capacityProviderStrategy request parameter and omit the launchType
        # request parameter. The FARGATE launch type runs your tasks on Fargate On-Demand infrastructure.
        # Fargate Spot infrastructure is available for use but a capacity provider strategy must be used. For
        # more information, see Fargate capacity providers in the Amazon ECS Developer Guide . The EC2 launch
        # type runs your tasks on Amazon EC2 instances registered to your cluster. The EXTERNAL launch type
        # runs your tasks on your on-premises server or virtual machine (VM) capacity registered to your
        # cluster. A service can use either a launch type or a capacity provider strategy. If a launchType is
        # specified, the capacityProviderStrategy parameter must be omitted.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # A load balancer object representing the load balancers to use with your service. For more
        # information, see Service load balancing in the Amazon Elastic Container Service Developer Guide . If
        # the service uses the ECS deployment controller and using either an Application Load Balancer or
        # Network Load Balancer, you must specify one or more target group ARNs to attach to the service. The
        # service-linked role is required for services that use multiple target groups. For more information,
        # see Using service-linked roles for Amazon ECS in the Amazon Elastic Container Service Developer
        # Guide . If the service uses the CODE_DEPLOY deployment controller, the service is required to use
        # either an Application Load Balancer or Network Load Balancer. When creating an CodeDeploy deployment
        # group, you specify two target groups (referred to as a targetGroupPair ). During a deployment,
        # CodeDeploy determines which task set in your service has the status PRIMARY , and it associates one
        # target group with it. Then, it also associates the other target group with the replacement task set.
        # The load balancer can also have up to two listeners: a required listener for production traffic and
        # an optional listener that you can use to perform validation tests with Lambda functions before
        # routing production traffic to it. If you use the CODE_DEPLOY deployment controller, these values can
        # be changed when updating the service. For Application Load Balancers and Network Load Balancers,
        # this object must contain the load balancer target group ARN, the container name, and the container
        # port to access from the load balancer. The container name must be as it appears in a container
        # definition. The load balancer name parameter must be omitted. When a task from this service is
        # placed on a container instance, the container instance and port combination is registered as a
        # target in the target group that's specified here. For Classic Load Balancers, this object must
        # contain the load balancer name, the container name , and the container port to access from the load
        # balancer. The container name must be as it appears in a container definition. The target group ARN
        # parameter must be omitted. When a task from this service is placed on a container instance, the
        # container instance is registered with the load balancer that's specified here. Services with tasks
        # that use the awsvpc network mode (for example, those with the Fargate launch type) only support
        # Application Load Balancers and Network Load Balancers. Classic Load Balancers aren't supported.
        # Also, when you create any target groups for these services, you must choose ip as the target type,
        # not instance . This is because tasks that use the awsvpc network mode are associated with an elastic
        # network interface, not an Amazon EC2 instance.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # The network configuration for the service. This parameter is required for task definitions that use
        # the awsvpc network mode to receive their own elastic network interface, and it isn't supported for
        # other network modes. For more information, see Task networking in the Amazon Elastic Container
        # Service Developer Guide .
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # An array of placement constraint objects to use for tasks in your service. You can specify a maximum
        # of 10 constraints for each task. This limit includes constraints in the task definition and those
        # specified at runtime.
        @[JSON::Field(key: "placementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The placement strategy objects to use for tasks in your service. You can specify a maximum of 5
        # strategy rules for each service.
        @[JSON::Field(key: "placementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # The platform version that your tasks in the service are running on. A platform version is specified
        # only for tasks using the Fargate launch type. If one isn't specified, the LATEST platform version is
        # used. For more information, see Fargate platform versions in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # Specifies whether to propagate the tags from the task definition to the task. If no value is
        # specified, the tags aren't propagated. Tags can only be propagated to the task during task creation.
        # To add tags to a task after task creation, use the TagResource API action. You must set this to a
        # value other than NONE when you use Cost Explorer. For more information, see Amazon ECS usage reports
        # in the Amazon Elastic Container Service Developer Guide . The default is NONE .
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # The name or full Amazon Resource Name (ARN) of the IAM role that allows Amazon ECS to make calls to
        # your load balancer on your behalf. This parameter is only permitted if you are using a load balancer
        # with your service and your task definition doesn't use the awsvpc network mode. If you specify the
        # role parameter, you must also specify a load balancer object with the loadBalancers parameter. If
        # your account has already created the Amazon ECS service-linked role, that role is used for your
        # service unless you specify a role here. The service-linked role is required if your task definition
        # uses the awsvpc network mode or if the service is configured to use service discovery, an external
        # deployment controller, multiple target groups, or Elastic Inference accelerators in which case you
        # don't specify a role here. For more information, see Using service-linked roles for Amazon ECS in
        # the Amazon Elastic Container Service Developer Guide . If your specified role has a path other than
        # / , then you must either specify the full role ARN (this is recommended) or prefix the role name
        # with the path. For example, if a role with the name bar has a path of /foo/ then you would specify
        # /foo/bar as the role name. For more information, see Friendly names and paths in the IAM User Guide
        # .
        @[JSON::Field(key: "role")]
        getter role : String?

        # The scheduling strategy to use for the service. For more information, see Services . There are two
        # service scheduler strategies available: REPLICA -The replica scheduling strategy places and
        # maintains the desired number of tasks across your cluster. By default, the service scheduler spreads
        # tasks across Availability Zones. You can use task placement strategies and constraints to customize
        # task placement decisions. This scheduler strategy is required if the service uses the CODE_DEPLOY or
        # EXTERNAL deployment controller types. DAEMON -The daemon scheduling strategy deploys exactly one
        # task on each active container instance that meets all of the task placement constraints that you
        # specify in your cluster. The service scheduler also evaluates the task placement constraints for
        # running tasks and will stop tasks that don't meet the placement constraints. When you're using this
        # strategy, you don't need to specify a desired number of tasks, a task placement strategy, or use
        # Service Auto Scaling policies. Tasks using the Fargate launch type or the CODE_DEPLOY or EXTERNAL
        # deployment controller types don't support the DAEMON scheduling strategy.
        @[JSON::Field(key: "schedulingStrategy")]
        getter scheduling_strategy : String?

        # The configuration for this service to discover and connect to services, and be discovered by, and
        # connected from, other services within a namespace. Tasks that run in a namespace can use short names
        # to connect to services in the namespace. Tasks can connect to services across all of the clusters in
        # the namespace. Tasks connect through a managed proxy container that collects logs and metrics for
        # increased visibility. Only the tasks that Amazon ECS services create are supported with Service
        # Connect. For more information, see Service Connect in the Amazon Elastic Container Service Developer
        # Guide .
        @[JSON::Field(key: "serviceConnectConfiguration")]
        getter service_connect_configuration : Types::ServiceConnectConfiguration?

        # The details of the service discovery registry to associate with this service. For more information,
        # see Service discovery . Each service may be associated with one service registry. Multiple service
        # registries for each service isn't supported.
        @[JSON::Field(key: "serviceRegistries")]
        getter service_registries : Array(Types::ServiceRegistry)?

        # The metadata that you apply to the service to help you categorize and organize them. Each tag
        # consists of a key and an optional value, both of which you define. When a service is deleted, the
        # tags are deleted as well. The following basic restrictions apply to tags: Maximum number of tags per
        # resource - 50 For each resource, each tag key must be unique, and each tag key can have only one
        # value. Maximum key length - 128 Unicode characters in UTF-8 Maximum value length - 256 Unicode
        # characters in UTF-8 If your tagging schema is used across multiple services and resources, remember
        # that other services may have restrictions on allowed characters. Generally allowed characters are:
        # letters, numbers, and spaces representable in UTF-8, and the following characters: + - = . _ : / @.
        # Tag keys and values are case-sensitive. Do not use aws: , AWS: , or any upper or lowercase
        # combination of such as a prefix for either keys or values as it is reserved for Amazon Web Services
        # use. You cannot edit or delete tag keys or values with this prefix. Tags with this prefix do not
        # count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The family and revision ( family:revision ) or full ARN of the task definition to run in your
        # service. If a revision isn't specified, the latest ACTIVE revision is used. A task definition must
        # be specified if the service uses either the ECS or CODE_DEPLOY deployment controllers. For more
        # information about deployment types, see Amazon ECS deployment types .
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String?

        # The configuration for a volume specified in the task definition as a volume that is configured at
        # launch time. Currently, the only supported volume type is an Amazon EBS volume.
        @[JSON::Field(key: "volumeConfigurations")]
        getter volume_configurations : Array(Types::ServiceVolumeConfiguration)?

        # The VPC Lattice configuration for the service being created.
        @[JSON::Field(key: "vpcLatticeConfigurations")]
        getter vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)?

        def initialize(
          @service_name : String,
          @availability_zone_rebalancing : String? = nil,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @client_token : String? = nil,
          @cluster : String? = nil,
          @deployment_configuration : Types::DeploymentConfiguration? = nil,
          @deployment_controller : Types::DeploymentController? = nil,
          @desired_count : Int32? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @health_check_grace_period_seconds : Int32? = nil,
          @launch_type : String? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @role : String? = nil,
          @scheduling_strategy : String? = nil,
          @service_connect_configuration : Types::ServiceConnectConfiguration? = nil,
          @service_registries : Array(Types::ServiceRegistry)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_definition : String? = nil,
          @volume_configurations : Array(Types::ServiceVolumeConfiguration)? = nil,
          @vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)? = nil
        )
        end
      end

      struct CreateServiceResponse
        include JSON::Serializable

        # The full description of your service following the create call. A service will return either a
        # capacityProviderStrategy or launchType parameter, but not both, depending where one was specified
        # when it was created. If a service is using the ECS deployment controller, the deploymentController
        # and taskSets parameters will not be returned. if the service uses the CODE_DEPLOY deployment
        # controller, the deploymentController , taskSets and deployments parameters will be returned, however
        # the deployments parameter will be an empty list.
        @[JSON::Field(key: "service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end

      struct CreateTaskSetRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service to create
        # the task set in.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The short name or full Amazon Resource Name (ARN) of the service to create the task set in.
        @[JSON::Field(key: "service")]
        getter service : String

        # The task definition for the tasks in the task set to use. If a revision isn't specified, the latest
        # ACTIVE revision is used.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String

        # The capacity provider strategy to use for the task set. A capacity provider strategy consists of one
        # or more capacity providers along with the base and weight to assign to them. A capacity provider
        # must be associated with the cluster to be used in a capacity provider strategy. The
        # PutClusterCapacityProviders API is used to associate a capacity provider with a cluster. Only
        # capacity providers with an ACTIVE or UPDATING status can be used. If a capacityProviderStrategy is
        # specified, the launchType parameter must be omitted. If no capacityProviderStrategy or launchType is
        # specified, the defaultCapacityProviderStrategy for the cluster is used. If specifying a capacity
        # provider that uses an Auto Scaling group, the capacity provider must already be created. New
        # capacity providers can be created with the CreateCapacityProviderProvider API operation. To use a
        # Fargate capacity provider, specify either the FARGATE or FARGATE_SPOT capacity providers. The
        # Fargate capacity providers are available to all accounts and only need to be associated with a
        # cluster to be used. The PutClusterCapacityProviders API operation is used to update the list of
        # available capacity providers for a cluster after the cluster is created.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # An identifier that you provide to ensure the idempotency of the request. It must be unique and is
        # case sensitive. Up to 36 ASCII characters in the range of 33-126 (inclusive) are allowed.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # An optional non-unique tag that identifies this task set in external systems. If the task set is
        # associated with a service discovery registry, the tasks in this task set will have the
        # ECS_TASK_SET_EXTERNAL_ID Cloud Map attribute set to the provided value.
        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The launch type that new tasks in the task set uses. For more information, see Amazon ECS launch
        # types in the Amazon Elastic Container Service Developer Guide . If a launchType is specified, the
        # capacityProviderStrategy parameter must be omitted.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # A load balancer object representing the load balancer to use with the task set. The supported load
        # balancer types are either an Application Load Balancer or a Network Load Balancer.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # An object representing the network configuration for a task set.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The platform version that the tasks in the task set uses. A platform version is specified only for
        # tasks using the Fargate launch type. If one isn't specified, the LATEST platform version is used.
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # A floating-point percentage of the desired number of tasks to place and keep running in the task
        # set.
        @[JSON::Field(key: "scale")]
        getter scale : Types::Scale?

        # The details of the service discovery registries to assign to this task set. For more information,
        # see Service discovery .
        @[JSON::Field(key: "serviceRegistries")]
        getter service_registries : Array(Types::ServiceRegistry)?

        # The metadata that you apply to the task set to help you categorize and organize them. Each tag
        # consists of a key and an optional value. You define both. When a service is deleted, the tags are
        # deleted. The following basic restrictions apply to tags: Maximum number of tags per resource - 50
        # For each resource, each tag key must be unique, and each tag key can have only one value. Maximum
        # key length - 128 Unicode characters in UTF-8 Maximum value length - 256 Unicode characters in UTF-8
        # If your tagging schema is used across multiple services and resources, remember that other services
        # may have restrictions on allowed characters. Generally allowed characters are: letters, numbers, and
        # spaces representable in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values
        # are case-sensitive. Do not use aws: , AWS: , or any upper or lowercase combination of such as a
        # prefix for either keys or values as it is reserved for Amazon Web Services use. You cannot edit or
        # delete tag keys or values with this prefix. Tags with this prefix do not count against your tags per
        # resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @cluster : String,
          @service : String,
          @task_definition : String,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @client_token : String? = nil,
          @external_id : String? = nil,
          @launch_type : String? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @platform_version : String? = nil,
          @scale : Types::Scale? = nil,
          @service_registries : Array(Types::ServiceRegistry)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateTaskSetResponse
        include JSON::Serializable

        # Information about a set of Amazon ECS tasks in either an CodeDeploy or an EXTERNAL deployment. A
        # task set includes details such as the desired number of tasks, how many tasks are running, and
        # whether the task set serves production traffic.
        @[JSON::Field(key: "taskSet")]
        getter task_set : Types::TaskSet?

        def initialize(
          @task_set : Types::TaskSet? = nil
        )
        end
      end

      # The optional filter to narrow the ListServiceDeployment results. If you do not specify a value,
      # service deployments that were created before the current time are included in the result.
      struct CreatedAt
        include JSON::Serializable

        # Include service deployments in the result that were created after this time. The format is
        # yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "after", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter after : Time?

        # Include service deployments in the result that were created before this time. The format is
        # yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "before", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter before : Time?

        def initialize(
          @after : Time? = nil,
          @before : Time? = nil
        )
        end
      end

      struct DeleteAccountSettingRequest
        include JSON::Serializable

        # The resource name to disable the account setting for. If serviceLongArnFormat is specified, the ARN
        # for your Amazon ECS services is affected. If taskLongArnFormat is specified, the ARN and resource ID
        # for your Amazon ECS tasks is affected. If containerInstanceLongArnFormat is specified, the ARN and
        # resource ID for your Amazon ECS container instances is affected. If awsvpcTrunking is specified, the
        # ENI limit for your Amazon ECS container instances is affected.
        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the principal. It can be a user, role, or the root user. If you
        # specify the root user, it disables the account setting for all users, roles, and the root user of
        # the account unless a user or role explicitly overrides these settings. If this field is omitted, the
        # setting is changed only for the authenticated user. In order to use this parameter, you must be the
        # root user, or the principal.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @name : String,
          @principal_arn : String? = nil
        )
        end
      end

      struct DeleteAccountSettingResponse
        include JSON::Serializable

        # The account setting for the specified principal ARN.
        @[JSON::Field(key: "setting")]
        getter setting : Types::Setting?

        def initialize(
          @setting : Types::Setting? = nil
        )
        end
      end

      struct DeleteAttributesRequest
        include JSON::Serializable

        # The attributes to delete from your resource. You can specify up to 10 attributes for each request.
        # For custom attributes, specify the attribute name and target ID, but don't specify the value. If you
        # specify the target ID using the short form, you must also specify the target type.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)

        # The short name or full Amazon Resource Name (ARN) of the cluster that contains the resource to
        # delete attributes. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        def initialize(
          @attributes : Array(Types::Attribute),
          @cluster : String? = nil
        )
        end
      end

      struct DeleteAttributesResponse
        include JSON::Serializable

        # A list of attribute objects that were successfully deleted from your resource.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil
        )
        end
      end

      struct DeleteCapacityProviderRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the capacity provider to delete.
        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : String

        # The name of the cluster that contains the capacity provider to delete. Managed instances capacity
        # providers are cluster-scoped and can only be deleted from their associated cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        def initialize(
          @capacity_provider : String,
          @cluster : String? = nil
        )
        end
      end

      struct DeleteCapacityProviderResponse
        include JSON::Serializable

        # The details of the capacity provider.
        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : Types::CapacityProvider?

        def initialize(
          @capacity_provider : Types::CapacityProvider? = nil
        )
        end
      end

      struct DeleteClusterRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster to delete.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        def initialize(
          @cluster : String
        )
        end
      end

      struct DeleteClusterResponse
        include JSON::Serializable

        # The full description of the deleted cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct DeleteExpressGatewayServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Express service to delete. The ARN uniquely identifies the
        # service within your Amazon Web Services account and region.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String

        def initialize(
          @service_arn : String
        )
        end
      end

      struct DeleteExpressGatewayServiceResponse
        include JSON::Serializable

        # The full description of the deleted express service.
        @[JSON::Field(key: "service")]
        getter service : Types::ECSExpressGatewayService?

        def initialize(
          @service : Types::ECSExpressGatewayService? = nil
        )
        end
      end

      struct DeleteServiceRequest
        include JSON::Serializable

        # The name of the service to delete.
        @[JSON::Field(key: "service")]
        getter service : String

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service to delete.
        # If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # If true , allows you to delete a service even if it wasn't scaled down to zero tasks. It's only
        # necessary to use this if the service uses the REPLICA scheduling strategy.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @service : String,
          @cluster : String? = nil,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteServiceResponse
        include JSON::Serializable

        # The full description of the deleted service.
        @[JSON::Field(key: "service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end

      struct DeleteTaskDefinitionsRequest
        include JSON::Serializable

        # The family and revision ( family:revision ) or full Amazon Resource Name (ARN) of the task
        # definition to delete. You must specify a revision . You can specify up to 10 task definitions as a
        # comma separated list.
        @[JSON::Field(key: "taskDefinitions")]
        getter task_definitions : Array(String)

        def initialize(
          @task_definitions : Array(String)
        )
        end
      end

      struct DeleteTaskDefinitionsResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The list of deleted task definitions.
        @[JSON::Field(key: "taskDefinitions")]
        getter task_definitions : Array(Types::TaskDefinition)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @task_definitions : Array(Types::TaskDefinition)? = nil
        )
        end
      end

      struct DeleteTaskSetRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the
        # task set found in to delete.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The short name or full Amazon Resource Name (ARN) of the service that hosts the task set to delete.
        @[JSON::Field(key: "service")]
        getter service : String

        # The task set ID or full Amazon Resource Name (ARN) of the task set to delete.
        @[JSON::Field(key: "taskSet")]
        getter task_set : String

        # If true , you can delete a task set even if it hasn't been scaled down to zero.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @cluster : String,
          @service : String,
          @task_set : String,
          @force : Bool? = nil
        )
        end
      end

      struct DeleteTaskSetResponse
        include JSON::Serializable

        # Details about the task set.
        @[JSON::Field(key: "taskSet")]
        getter task_set : Types::TaskSet?

        def initialize(
          @task_set : Types::TaskSet? = nil
        )
        end
      end

      # The details of an Amazon ECS service deployment. This is used only when a service uses the ECS
      # deployment controller type.
      struct Deployment
        include JSON::Serializable

        # The capacity provider strategy that the deployment is using.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # The Unix timestamp for the time when the service deployment was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The most recent desired count of tasks that was specified for the service to deploy or maintain.
        @[JSON::Field(key: "desiredCount")]
        getter desired_count : Int32?

        # The number of consecutively failed tasks in the deployment. A task is considered a failure if the
        # service scheduler can't launch the task, the task doesn't transition to a RUNNING state, or if it
        # fails any of its defined health checks and is stopped. Once a service deployment has one or more
        # successfully running tasks, the failed task count resets to zero and stops being evaluated.
        @[JSON::Field(key: "failedTasks")]
        getter failed_tasks : Int32?

        # The Fargate ephemeral storage settings for the deployment.
        @[JSON::Field(key: "fargateEphemeralStorage")]
        getter fargate_ephemeral_storage : Types::DeploymentEphemeralStorage?

        # The ID of the deployment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The launch type the tasks in the service are using. For more information, see Amazon ECS Launch
        # Types in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The VPC subnet and security group configuration for tasks that receive their own elastic network
        # interface by using the awsvpc networking mode.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The number of tasks in the deployment that are in the PENDING status.
        @[JSON::Field(key: "pendingCount")]
        getter pending_count : Int32?

        # The operating system that your tasks in the service, or tasks are running on. A platform family is
        # specified only for tasks using the Fargate launch type. All tasks that run as part of this service
        # must use the same platformFamily value as the service, for example, LINUX. .
        @[JSON::Field(key: "platformFamily")]
        getter platform_family : String?

        # The platform version that your tasks in the service run on. A platform version is only specified for
        # tasks using the Fargate launch type. If one isn't specified, the LATEST platform version is used.
        # For more information, see Fargate Platform Versions in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # The rolloutState of a service is only returned for services that use the rolling update ( ECS )
        # deployment type that aren't behind a Classic Load Balancer. The rollout state of the deployment.
        # When a service deployment is started, it begins in an IN_PROGRESS state. When the service reaches a
        # steady state, the deployment transitions to a COMPLETED state. If the service fails to reach a
        # steady state and circuit breaker is turned on, the deployment transitions to a FAILED state. A
        # deployment in FAILED state doesn't launch any new tasks. For more information, see
        # DeploymentCircuitBreaker .
        @[JSON::Field(key: "rolloutState")]
        getter rollout_state : String?

        # A description of the rollout state of a deployment.
        @[JSON::Field(key: "rolloutStateReason")]
        getter rollout_state_reason : String?

        # The number of tasks in the deployment that are in the RUNNING status.
        @[JSON::Field(key: "runningCount")]
        getter running_count : Int32?

        # The details of the Service Connect configuration that's used by this deployment. Compare the
        # configuration between multiple deployments when troubleshooting issues with new deployments. The
        # configuration for this service to discover and connect to services, and be discovered by, and
        # connected from, other services within a namespace. Tasks that run in a namespace can use short names
        # to connect to services in the namespace. Tasks can connect to services across all of the clusters in
        # the namespace. Tasks connect through a managed proxy container that collects logs and metrics for
        # increased visibility. Only the tasks that Amazon ECS services create are supported with Service
        # Connect. For more information, see Service Connect in the Amazon Elastic Container Service Developer
        # Guide .
        @[JSON::Field(key: "serviceConnectConfiguration")]
        getter service_connect_configuration : Types::ServiceConnectConfiguration?

        # The list of Service Connect resources that are associated with this deployment. Each list entry maps
        # a discovery name to a Cloud Map service name.
        @[JSON::Field(key: "serviceConnectResources")]
        getter service_connect_resources : Array(Types::ServiceConnectServiceResource)?

        # The status of the deployment. The following describes each state. PRIMARY The most recent deployment
        # of a service. ACTIVE A service deployment that still has running tasks, but are in the process of
        # being replaced with a new PRIMARY deployment. INACTIVE A deployment that has been completely
        # replaced.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The most recent task definition that was specified for the tasks in the service to use.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String?

        # The Unix timestamp for the time when the service deployment was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        # The details of the volume that was configuredAtLaunch . You can configure different settings like
        # the size, throughput, volumeType, and ecryption in ServiceManagedEBSVolumeConfiguration . The name
        # of the volume must match the name from the task definition.
        @[JSON::Field(key: "volumeConfigurations")]
        getter volume_configurations : Array(Types::ServiceVolumeConfiguration)?

        # The VPC Lattice configuration for the service deployment.
        @[JSON::Field(key: "vpcLatticeConfigurations")]
        getter vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)?

        def initialize(
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @created_at : Time? = nil,
          @desired_count : Int32? = nil,
          @failed_tasks : Int32? = nil,
          @fargate_ephemeral_storage : Types::DeploymentEphemeralStorage? = nil,
          @id : String? = nil,
          @launch_type : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @pending_count : Int32? = nil,
          @platform_family : String? = nil,
          @platform_version : String? = nil,
          @rollout_state : String? = nil,
          @rollout_state_reason : String? = nil,
          @running_count : Int32? = nil,
          @service_connect_configuration : Types::ServiceConnectConfiguration? = nil,
          @service_connect_resources : Array(Types::ServiceConnectServiceResource)? = nil,
          @status : String? = nil,
          @task_definition : String? = nil,
          @updated_at : Time? = nil,
          @volume_configurations : Array(Types::ServiceVolumeConfiguration)? = nil,
          @vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)? = nil
        )
        end
      end

      # One of the methods which provide a way for you to quickly identify when a deployment has failed, and
      # then to optionally roll back the failure to the last working deployment. When the alarms are
      # generated, Amazon ECS sets the service deployment to failed. Set the rollback parameter to have
      # Amazon ECS to roll back your service to the last completed deployment after a failure. You can only
      # use the DeploymentAlarms method to detect failures when the DeploymentController is set to ECS . For
      # more information, see Rolling update in the Amazon Elastic Container Service Developer Guide .
      struct DeploymentAlarms
        include JSON::Serializable

        # One or more CloudWatch alarm names. Use a "," to separate the alarms.
        @[JSON::Field(key: "alarmNames")]
        getter alarm_names : Array(String)

        # Determines whether to use the CloudWatch alarm option in the service deployment process.
        @[JSON::Field(key: "enable")]
        getter enable : Bool

        # Determines whether to configure Amazon ECS to roll back the service if a service deployment fails.
        # If rollback is used, when a service deployment fails, the service is rolled back to the last
        # deployment that completed successfully.
        @[JSON::Field(key: "rollback")]
        getter rollback : Bool

        def initialize(
          @alarm_names : Array(String),
          @enable : Bool,
          @rollback : Bool
        )
        end
      end

      # The deployment circuit breaker can only be used for services using the rolling update ( ECS )
      # deployment type. The deployment circuit breaker determines whether a service deployment will fail if
      # the service can't reach a steady state. If it is turned on, a service deployment will transition to
      # a failed state and stop launching new tasks. You can also configure Amazon ECS to roll back your
      # service to the last completed deployment after a failure. For more information, see Rolling update
      # in the Amazon Elastic Container Service Developer Guide . For more information about API failure
      # reasons, see API failure reasons in the Amazon Elastic Container Service Developer Guide .
      struct DeploymentCircuitBreaker
        include JSON::Serializable

        # Determines whether to use the deployment circuit breaker logic for the service.
        @[JSON::Field(key: "enable")]
        getter enable : Bool

        # Determines whether to configure Amazon ECS to roll back the service if a service deployment fails.
        # If rollback is on, when a service deployment fails, the service is rolled back to the last
        # deployment that completed successfully.
        @[JSON::Field(key: "rollback")]
        getter rollback : Bool

        def initialize(
          @enable : Bool,
          @rollback : Bool
        )
        end
      end

      # Optional deployment parameters that control how many tasks run during a deployment and the ordering
      # of stopping and starting tasks.
      struct DeploymentConfiguration
        include JSON::Serializable

        # Information about the CloudWatch alarms.
        @[JSON::Field(key: "alarms")]
        getter alarms : Types::DeploymentAlarms?

        # The time period when both blue and green service revisions are running simultaneously after the
        # production traffic has shifted. You must provide this parameter when you use the BLUE_GREEN
        # deployment strategy.
        @[JSON::Field(key: "bakeTimeInMinutes")]
        getter bake_time_in_minutes : Int32?

        # Configuration for canary deployment strategy. Only valid when the deployment strategy is CANARY .
        # This configuration enables shifting a fixed percentage of traffic for testing, followed by shifting
        # the remaining traffic after a bake period.
        @[JSON::Field(key: "canaryConfiguration")]
        getter canary_configuration : Types::CanaryConfiguration?

        # The deployment circuit breaker can only be used for services using the rolling update ( ECS )
        # deployment type. The deployment circuit breaker determines whether a service deployment will fail if
        # the service can't reach a steady state. If you use the deployment circuit breaker, a service
        # deployment will transition to a failed state and stop launching new tasks. If you use the rollback
        # option, when a service deployment fails, the service is rolled back to the last deployment that
        # completed successfully. For more information, see Rolling update in the Amazon Elastic Container
        # Service Developer Guide
        @[JSON::Field(key: "deploymentCircuitBreaker")]
        getter deployment_circuit_breaker : Types::DeploymentCircuitBreaker?

        # An array of deployment lifecycle hook objects to run custom logic at specific stages of the
        # deployment lifecycle.
        @[JSON::Field(key: "lifecycleHooks")]
        getter lifecycle_hooks : Array(Types::DeploymentLifecycleHook)?

        # Configuration for linear deployment strategy. Only valid when the deployment strategy is LINEAR .
        # This configuration enables progressive traffic shifting in equal percentage increments with
        # configurable bake times between each step.
        @[JSON::Field(key: "linearConfiguration")]
        getter linear_configuration : Types::LinearConfiguration?

        # If a service is using the rolling update ( ECS ) deployment type, the maximumPercent parameter
        # represents an upper limit on the number of your service's tasks that are allowed in the RUNNING or
        # PENDING state during a deployment, as a percentage of the desiredCount (rounded down to the nearest
        # integer). This parameter enables you to define the deployment batch size. For example, if your
        # service is using the REPLICA service scheduler and has a desiredCount of four tasks and a
        # maximumPercent value of 200%, the scheduler may start four new tasks before stopping the four older
        # tasks (provided that the cluster resources required to do this are available). The default
        # maximumPercent value for a service using the REPLICA service scheduler is 200%. The Amazon ECS
        # scheduler uses this parameter to replace unhealthy tasks by starting replacement tasks first and
        # then stopping the unhealthy tasks, as long as cluster resources for starting replacement tasks are
        # available. For more information about how the scheduler replaces unhealthy tasks, see Amazon ECS
        # services . If a service is using either the blue/green ( CODE_DEPLOY ) or EXTERNAL deployment types,
        # and tasks in the service use the EC2 launch type, the maximum percent value is set to the default
        # value. The maximum percent value is used to define the upper limit on the number of the tasks in the
        # service that remain in the RUNNING state while the container instances are in the DRAINING state.
        # You can't specify a custom maximumPercent value for a service that uses either the blue/green (
        # CODE_DEPLOY ) or EXTERNAL deployment types and has tasks that use the EC2 launch type. If the
        # service uses either the blue/green ( CODE_DEPLOY ) or EXTERNAL deployment types, and the tasks in
        # the service use the Fargate launch type, the maximum percent value is not used. The value is still
        # returned when describing your service.
        @[JSON::Field(key: "maximumPercent")]
        getter maximum_percent : Int32?

        # If a service is using the rolling update ( ECS ) deployment type, the minimumHealthyPercent
        # represents a lower limit on the number of your service's tasks that must remain in the RUNNING state
        # during a deployment, as a percentage of the desiredCount (rounded up to the nearest integer). This
        # parameter enables you to deploy without using additional cluster capacity. For example, if your
        # service has a desiredCount of four tasks and a minimumHealthyPercent of 50%, the service scheduler
        # may stop two existing tasks to free up cluster capacity before starting two new tasks. If any tasks
        # are unhealthy and if maximumPercent doesn't allow the Amazon ECS scheduler to start replacement
        # tasks, the scheduler stops the unhealthy tasks one-by-one — using the minimumHealthyPercent as a
        # constraint — to clear up capacity to launch replacement tasks. For more information about how the
        # scheduler replaces unhealthy tasks, see Amazon ECS services . For services that do not use a load
        # balancer, the following should be noted: A service is considered healthy if all essential containers
        # within the tasks in the service pass their health checks. If a task has no essential containers with
        # a health check defined, the service scheduler will wait for 40 seconds after a task reaches a
        # RUNNING state before the task is counted towards the minimum healthy percent total. If a task has
        # one or more essential containers with a health check defined, the service scheduler will wait for
        # the task to reach a healthy status before counting it towards the minimum healthy percent total. A
        # task is considered healthy when all essential containers within the task have passed their health
        # checks. The amount of time the service scheduler can wait for is determined by the container health
        # check settings. For services that do use a load balancer, the following should be noted: If a task
        # has no essential containers with a health check defined, the service scheduler will wait for the
        # load balancer target group health check to return a healthy status before counting the task towards
        # the minimum healthy percent total. If a task has an essential container with a health check defined,
        # the service scheduler will wait for both the task to reach a healthy status and the load balancer
        # target group health check to return a healthy status before counting the task towards the minimum
        # healthy percent total. The default value for a replica service for minimumHealthyPercent is 100%.
        # The default minimumHealthyPercent value for a service using the DAEMON service schedule is 0% for
        # the CLI, the Amazon Web Services SDKs, and the APIs and 50% for the Amazon Web Services Management
        # Console. The minimum number of healthy tasks during a deployment is the desiredCount multiplied by
        # the minimumHealthyPercent /100, rounded up to the nearest integer value. If a service is using
        # either the blue/green ( CODE_DEPLOY ) or EXTERNAL deployment types and is running tasks that use the
        # EC2 launch type, the minimum healthy percent value is set to the default value. The minimum healthy
        # percent value is used to define the lower limit on the number of the tasks in the service that
        # remain in the RUNNING state while the container instances are in the DRAINING state. You can't
        # specify a custom minimumHealthyPercent value for a service that uses either the blue/green (
        # CODE_DEPLOY ) or EXTERNAL deployment types and has tasks that use the EC2 launch type. If a service
        # is using either the blue/green ( CODE_DEPLOY ) or EXTERNAL deployment types and is running tasks
        # that use the Fargate launch type, the minimum healthy percent value is not used, although it is
        # returned when describing your service.
        @[JSON::Field(key: "minimumHealthyPercent")]
        getter minimum_healthy_percent : Int32?

        # The deployment strategy for the service. Choose from these valid values: ROLLING - When you create a
        # service which uses the rolling update ( ROLLING ) deployment strategy, the Amazon ECS service
        # scheduler replaces the currently running tasks with new tasks. The number of tasks that Amazon ECS
        # adds or removes from the service during a rolling update is controlled by the service deployment
        # configuration. BLUE_GREEN - A blue/green deployment strategy ( BLUE_GREEN ) is a release methodology
        # that reduces downtime and risk by running two identical production environments called blue and
        # green. With Amazon ECS blue/green deployments, you can validate new service revisions before
        # directing production traffic to them. This approach provides a safer way to deploy changes with the
        # ability to quickly roll back if needed. LINEAR - A linear deployment strategy ( LINEAR ) gradually
        # shifts traffic from the current production environment to a new environment in equal percentages
        # over time. With Amazon ECS linear deployments, you can control the pace of traffic shifting and
        # validate new service revisions with increasing amounts of production traffic. CANARY - A canary
        # deployment strategy ( CANARY ) shifts a small percentage of traffic to the new service revision
        # first, then shifts the remaining traffic all at once after a specified time period. This allows you
        # to test the new version with a subset of users before full deployment.
        @[JSON::Field(key: "strategy")]
        getter strategy : String?

        def initialize(
          @alarms : Types::DeploymentAlarms? = nil,
          @bake_time_in_minutes : Int32? = nil,
          @canary_configuration : Types::CanaryConfiguration? = nil,
          @deployment_circuit_breaker : Types::DeploymentCircuitBreaker? = nil,
          @lifecycle_hooks : Array(Types::DeploymentLifecycleHook)? = nil,
          @linear_configuration : Types::LinearConfiguration? = nil,
          @maximum_percent : Int32? = nil,
          @minimum_healthy_percent : Int32? = nil,
          @strategy : String? = nil
        )
        end
      end

      # The deployment controller to use for the service.
      struct DeploymentController
        include JSON::Serializable

        # The deployment controller type to use. The deployment controller is the mechanism that determines
        # how tasks are deployed for your service. The valid options are: ECS When you create a service which
        # uses the ECS deployment controller, you can choose between the following deployment strategies:
        # ROLLING : When you create a service which uses the rolling update ( ROLLING ) deployment strategy,
        # the Amazon ECS service scheduler replaces the currently running tasks with new tasks. The number of
        # tasks that Amazon ECS adds or removes from the service during a rolling update is controlled by the
        # service deployment configuration. Rolling update deployments are best suited for the following
        # scenarios: Gradual service updates: You need to update your service incrementally without taking the
        # entire service offline at once. Limited resource requirements: You want to avoid the additional
        # resource costs of running two complete environments simultaneously (as required by blue/green
        # deployments). Acceptable deployment time: Your application can tolerate a longer deployment process,
        # as rolling updates replace tasks one by one. No need for instant roll back: Your service can
        # tolerate a rollback process that takes minutes rather than seconds. Simple deployment process: You
        # prefer a straightforward deployment approach without the complexity of managing multiple
        # environments, target groups, and listeners. No load balancer requirement: Your service doesn't use
        # or require a load balancer, Application Load Balancer, Network Load Balancer, or Service Connect
        # (which are required for blue/green deployments). Stateful applications: Your application maintains
        # state that makes it difficult to run two parallel environments. Cost sensitivity: You want to
        # minimize deployment costs by not running duplicate environments during deployment. Rolling updates
        # are the default deployment strategy for services and provide a balance between deployment safety and
        # resource efficiency for many common application scenarios. BLUE_GREEN : A blue/green deployment
        # strategy ( BLUE_GREEN ) is a release methodology that reduces downtime and risk by running two
        # identical production environments called blue and green. With Amazon ECS blue/green deployments, you
        # can validate new service revisions before directing production traffic to them. This approach
        # provides a safer way to deploy changes with the ability to quickly roll back if needed. Amazon ECS
        # blue/green deployments are best suited for the following scenarios: Service validation: When you
        # need to validate new service revisions before directing production traffic to them Zero downtime:
        # When your service requires zero-downtime deployments Instant roll back: When you need the ability to
        # quickly roll back if issues are detected Load balancer requirement: When your service uses
        # Application Load Balancer, Network Load Balancer, or Service Connect External Use a third-party
        # deployment controller. Blue/green deployment (powered by CodeDeploy) CodeDeploy installs an updated
        # version of the application as a new replacement task set and reroutes production traffic from the
        # original application task set to the replacement task set. The original task set is terminated after
        # a successful deployment. Use this deployment controller to verify a new deployment of a service
        # before sending production traffic to it.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # The amount of ephemeral storage to allocate for the deployment.
      struct DeploymentEphemeralStorage
        include JSON::Serializable

        # Specify an Key Management Service key ID to encrypt the ephemeral storage for deployment.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @kms_key_id : String? = nil
        )
        end
      end

      # A deployment lifecycle hook runs custom logic at specific stages of the deployment process.
      # Currently, you can use Lambda functions as hook targets. For more information, see Lifecycle hooks
      # for Amazon ECS service deployments in the Amazon Elastic Container Service Developer Guide .
      struct DeploymentLifecycleHook
        include JSON::Serializable

        # Use this field to specify custom parameters that Amazon ECS will pass to your hook target
        # invocations (such as a Lambda function).
        @[JSON::Field(key: "hookDetails")]
        getter hook_details : Types::HookDetails?

        # The Amazon Resource Name (ARN) of the hook target. Currently, only Lambda function ARNs are
        # supported. You must provide this parameter when configuring a deployment lifecycle hook.
        @[JSON::Field(key: "hookTargetArn")]
        getter hook_target_arn : String?

        # The lifecycle stages at which to run the hook. Choose from these valid values: RECONCILE_SERVICE The
        # reconciliation stage that only happens when you start a new service deployment with more than 1
        # service revision in an ACTIVE state. You can use a lifecycle hook for this stage. PRE_SCALE_UP The
        # green service revision has not started. The blue service revision is handling 100% of the production
        # traffic. There is no test traffic. You can use a lifecycle hook for this stage. POST_SCALE_UP The
        # green service revision has started. The blue service revision is handling 100% of the production
        # traffic. There is no test traffic. You can use a lifecycle hook for this stage. TEST_TRAFFIC_SHIFT
        # The blue and green service revisions are running. The blue service revision handles 100% of the
        # production traffic. The green service revision is migrating from 0% to 100% of test traffic. You can
        # use a lifecycle hook for this stage. POST_TEST_TRAFFIC_SHIFT The test traffic shift is complete. The
        # green service revision handles 100% of the test traffic. You can use a lifecycle hook for this
        # stage. PRODUCTION_TRAFFIC_SHIFT Production traffic is shifting to the green service revision. The
        # green service revision is migrating from 0% to 100% of production traffic. You can use a lifecycle
        # hook for this stage. POST_PRODUCTION_TRAFFIC_SHIFT The production traffic shift is complete. You can
        # use a lifecycle hook for this stage. You must provide this parameter when configuring a deployment
        # lifecycle hook.
        @[JSON::Field(key: "lifecycleStages")]
        getter lifecycle_stages : Array(String)?

        # The Amazon Resource Name (ARN) of the IAM role that grants Amazon ECS permission to call Lambda
        # functions on your behalf. For more information, see Permissions required for Lambda functions in
        # Amazon ECS blue/green deployments in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @hook_details : Types::HookDetails? = nil,
          @hook_target_arn : String? = nil,
          @lifecycle_stages : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct DeregisterContainerInstanceRequest
        include JSON::Serializable

        # The container instance ID or full ARN of the container instance to deregister. For more information
        # about the ARN format, see Amazon Resource Name (ARN) in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : String

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instance
        # to deregister. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Forces the container instance to be deregistered. If you have tasks running on the container
        # instance when you deregister it with the force option, these tasks remain running until you
        # terminate the instance or the tasks stop through some other means, but they're orphaned (no longer
        # monitored or accounted for by Amazon ECS). If an orphaned task on your container instance is part of
        # an Amazon ECS service, then the service scheduler starts another copy of that task, on a different
        # container instance if possible. Any containers in orphaned service tasks that are registered with a
        # Classic Load Balancer or an Application Load Balancer target group are deregistered. They begin
        # connection draining according to the settings on the load balancer or target group.
        @[JSON::Field(key: "force")]
        getter force : Bool?

        def initialize(
          @container_instance : String,
          @cluster : String? = nil,
          @force : Bool? = nil
        )
        end
      end

      struct DeregisterContainerInstanceResponse
        include JSON::Serializable

        # The container instance that was deregistered.
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : Types::ContainerInstance?

        def initialize(
          @container_instance : Types::ContainerInstance? = nil
        )
        end
      end

      struct DeregisterTaskDefinitionRequest
        include JSON::Serializable

        # The family and revision ( family:revision ) or full Amazon Resource Name (ARN) of the task
        # definition to deregister. You must specify a revision .
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String

        def initialize(
          @task_definition : String
        )
        end
      end

      struct DeregisterTaskDefinitionResponse
        include JSON::Serializable

        # The full description of the deregistered task.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : Types::TaskDefinition?

        def initialize(
          @task_definition : Types::TaskDefinition? = nil
        )
        end
      end

      struct DescribeCapacityProvidersRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of one or more capacity providers. Up to 100
        # capacity providers can be described in an action.
        @[JSON::Field(key: "capacityProviders")]
        getter capacity_providers : Array(String)?

        # The name of the cluster to describe capacity providers for. When specified, only capacity providers
        # associated with this cluster are returned, including Amazon ECS Managed Instances capacity
        # providers.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Specifies whether or not you want to see the resource tags for the capacity provider. If TAGS is
        # specified, the tags are included in the response. If this field is omitted, tags aren't included in
        # the response.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        # The maximum number of account setting results returned by DescribeCapacityProviders in paginated
        # output. When this parameter is used, DescribeCapacityProviders only returns maxResults results in a
        # single page along with a nextToken response element. The remaining results of the initial request
        # can be seen by sending another DescribeCapacityProviders request with the returned nextToken value.
        # This value can be between 1 and 10. If this parameter is not used, then DescribeCapacityProviders
        # returns up to 10 results and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeCapacityProviders request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This token should be treated as
        # an opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @capacity_providers : Array(String)? = nil,
          @cluster : String? = nil,
          @include : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeCapacityProvidersResponse
        include JSON::Serializable

        # The list of capacity providers.
        @[JSON::Field(key: "capacityProviders")]
        getter capacity_providers : Array(Types::CapacityProvider)?

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The nextToken value to include in a future DescribeCapacityProviders request. When the results of a
        # DescribeCapacityProviders request exceed maxResults , this value can be used to retrieve the next
        # page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @capacity_providers : Array(Types::CapacityProvider)? = nil,
          @failures : Array(Types::Failure)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct DescribeClustersRequest
        include JSON::Serializable

        # A list of up to 100 cluster names or full cluster Amazon Resource Name (ARN) entries. If you do not
        # specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "clusters")]
        getter clusters : Array(String)?

        # Determines whether to include additional information about the clusters in the response. If this
        # field is omitted, this information isn't included. If ATTACHMENTS is specified, the attachments for
        # the container instances or tasks within the cluster are included, for example the capacity
        # providers. If SETTINGS is specified, the settings for the cluster are included. If CONFIGURATIONS is
        # specified, the configuration for the cluster is included. If STATISTICS is specified, the task and
        # service count is included, separated by launch type. If TAGS is specified, the metadata tags
        # associated with the cluster are included.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @clusters : Array(String)? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      struct DescribeClustersResponse
        include JSON::Serializable

        # The list of clusters.
        @[JSON::Field(key: "clusters")]
        getter clusters : Array(Types::Cluster)?

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        def initialize(
          @clusters : Array(Types::Cluster)? = nil,
          @failures : Array(Types::Failure)? = nil
        )
        end
      end

      struct DescribeContainerInstancesRequest
        include JSON::Serializable

        # A list of up to 100 container instance IDs or full Amazon Resource Name (ARN) entries.
        @[JSON::Field(key: "containerInstances")]
        getter container_instances : Array(String)

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instances
        # to describe. If you do not specify a cluster, the default cluster is assumed. This parameter is
        # required if the container instance or container instances you are describing were launched in any
        # cluster other than the default cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Specifies whether you want to see the resource tags for the container instance. If TAGS is
        # specified, the tags are included in the response. If CONTAINER_INSTANCE_HEALTH is specified, the
        # container instance health is included in the response. If this field is omitted, tags and container
        # instance health status aren't included in the response.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @container_instances : Array(String),
          @cluster : String? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      struct DescribeContainerInstancesResponse
        include JSON::Serializable

        # The list of container instances.
        @[JSON::Field(key: "containerInstances")]
        getter container_instances : Array(Types::ContainerInstance)?

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        def initialize(
          @container_instances : Array(Types::ContainerInstance)? = nil,
          @failures : Array(Types::Failure)? = nil
        )
        end
      end

      struct DescribeExpressGatewayServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Express service to describe. The ARN uniquely identifies the
        # service within your Amazon Web Services account and region.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String

        # Specifies additional information to include in the response. Valid values are TAGS to include
        # resource tags associated with the Express service.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @service_arn : String,
          @include : Array(String)? = nil
        )
        end
      end

      struct DescribeExpressGatewayServiceResponse
        include JSON::Serializable

        # The full description of the described express service.
        @[JSON::Field(key: "service")]
        getter service : Types::ECSExpressGatewayService?

        def initialize(
          @service : Types::ECSExpressGatewayService? = nil
        )
        end
      end

      struct DescribeServiceDeploymentsRequest
        include JSON::Serializable

        # The ARN of the service deployment. You can specify a maximum of 20 ARNs.
        @[JSON::Field(key: "serviceDeploymentArns")]
        getter service_deployment_arns : Array(String)

        def initialize(
          @service_deployment_arns : Array(String)
        )
        end
      end

      struct DescribeServiceDeploymentsResponse
        include JSON::Serializable

        # Any failures associated with the call. If you decsribe a deployment with a service revision created
        # before October 25, 2024, the call fails. The failure includes the service revision ARN and the
        # reason set to MISSING .
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The list of service deployments described.
        @[JSON::Field(key: "serviceDeployments")]
        getter service_deployments : Array(Types::ServiceDeployment)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @service_deployments : Array(Types::ServiceDeployment)? = nil
        )
        end
      end

      struct DescribeServiceRevisionsRequest
        include JSON::Serializable

        # The ARN of the service revision. You can specify a maximum of 20 ARNs. You can call
        # ListServiceDeployments to get the ARNs.
        @[JSON::Field(key: "serviceRevisionArns")]
        getter service_revision_arns : Array(String)

        def initialize(
          @service_revision_arns : Array(String)
        )
        end
      end

      struct DescribeServiceRevisionsResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The list of service revisions described.
        @[JSON::Field(key: "serviceRevisions")]
        getter service_revisions : Array(Types::ServiceRevision)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @service_revisions : Array(Types::ServiceRevision)? = nil
        )
        end
      end

      struct DescribeServicesRequest
        include JSON::Serializable

        # A list of services to describe. You may specify up to 10 services to describe in a single operation.
        @[JSON::Field(key: "services")]
        getter services : Array(String)

        # The short name or full Amazon Resource Name (ARN)the cluster that hosts the service to describe. If
        # you do not specify a cluster, the default cluster is assumed. This parameter is required if the
        # service or services you are describing were launched in any cluster other than the default cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Determines whether you want to see the resource tags for the service. If TAGS is specified, the tags
        # are included in the response. If this field is omitted, tags aren't included in the response.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @services : Array(String),
          @cluster : String? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      struct DescribeServicesResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The list of services described.
        @[JSON::Field(key: "services")]
        getter services : Array(Types::Service)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @services : Array(Types::Service)? = nil
        )
        end
      end

      struct DescribeTaskDefinitionRequest
        include JSON::Serializable

        # The family for the latest ACTIVE revision, family and revision ( family:revision ) for a specific
        # revision in the family, or full Amazon Resource Name (ARN) of the task definition to describe.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String

        # Determines whether to see the resource tags for the task definition. If TAGS is specified, the tags
        # are included in the response. If this field is omitted, tags aren't included in the response.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @task_definition : String,
          @include : Array(String)? = nil
        )
        end
      end

      struct DescribeTaskDefinitionResponse
        include JSON::Serializable

        # The metadata that's applied to the task definition to help you categorize and organize them. Each
        # tag consists of a key and an optional value. You define both. The following basic restrictions apply
        # to tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique,
        # and each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8
        # Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is used across
        # multiple services and resources, remember that other services may have restrictions on allowed
        # characters. Generally allowed characters are: letters, numbers, and spaces representable in UTF-8,
        # and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use
        # aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as
        # it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this
        # prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The full task definition description.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : Types::TaskDefinition?

        def initialize(
          @tags : Array(Types::Tag)? = nil,
          @task_definition : Types::TaskDefinition? = nil
        )
        end
      end

      struct DescribeTaskSetsRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the
        # task sets exist in.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The short name or full Amazon Resource Name (ARN) of the service that the task sets exist in.
        @[JSON::Field(key: "service")]
        getter service : String

        # Specifies whether to see the resource tags for the task set. If TAGS is specified, the tags are
        # included in the response. If this field is omitted, tags aren't included in the response.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        # The ID or full Amazon Resource Name (ARN) of task sets to describe.
        @[JSON::Field(key: "taskSets")]
        getter task_sets : Array(String)?

        def initialize(
          @cluster : String,
          @service : String,
          @include : Array(String)? = nil,
          @task_sets : Array(String)? = nil
        )
        end
      end

      struct DescribeTaskSetsResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The list of task sets described.
        @[JSON::Field(key: "taskSets")]
        getter task_sets : Array(Types::TaskSet)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @task_sets : Array(Types::TaskSet)? = nil
        )
        end
      end

      struct DescribeTasksRequest
        include JSON::Serializable

        # A list of up to 100 task IDs or full ARN entries.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(String)

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task or tasks to
        # describe. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Specifies whether you want to see the resource tags for the task. If TAGS is specified, the tags are
        # included in the response. If this field is omitted, tags aren't included in the response.
        @[JSON::Field(key: "include")]
        getter include : Array(String)?

        def initialize(
          @tasks : Array(String),
          @cluster : String? = nil,
          @include : Array(String)? = nil
        )
        end
      end

      struct DescribeTasksResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # The list of tasks.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::Task)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @tasks : Array(Types::Task)? = nil
        )
        end
      end

      # An object representing a container instance host device.
      struct Device
        include JSON::Serializable

        # The path for the device on the host container instance.
        @[JSON::Field(key: "hostPath")]
        getter host_path : String

        # The path inside the container at which to expose the host device.
        @[JSON::Field(key: "containerPath")]
        getter container_path : String?

        # The explicit permissions to provide to the container for the device. By default, the container has
        # permissions for read , write , and mknod for the device.
        @[JSON::Field(key: "permissions")]
        getter permissions : Array(String)?

        def initialize(
          @host_path : String,
          @container_path : String? = nil,
          @permissions : Array(String)? = nil
        )
        end
      end

      struct DiscoverPollEndpointRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that the container instance belongs
        # to.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The container instance ID or full ARN of the container instance. For more information about the ARN
        # format, see Amazon Resource Name (ARN) in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : String?

        def initialize(
          @cluster : String? = nil,
          @container_instance : String? = nil
        )
        end
      end

      struct DiscoverPollEndpointResponse
        include JSON::Serializable

        # The endpoint for the Amazon ECS agent to poll.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String?

        # The endpoint for the Amazon ECS agent to poll for Service Connect configuration. For more
        # information, see Service Connect in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "serviceConnectEndpoint")]
        getter service_connect_endpoint : String?

        # The telemetry endpoint for the Amazon ECS agent.
        @[JSON::Field(key: "telemetryEndpoint")]
        getter telemetry_endpoint : String?

        def initialize(
          @endpoint : String? = nil,
          @service_connect_endpoint : String? = nil,
          @telemetry_endpoint : String? = nil
        )
        end
      end

      # This parameter is specified when you're using Docker volumes. Docker volumes are only supported when
      # you're using the EC2 launch type. Windows containers only support the use of the local driver. To
      # use bind mounts, specify a host instead.
      struct DockerVolumeConfiguration
        include JSON::Serializable

        # If this value is true , the Docker volume is created if it doesn't already exist. This field is only
        # used if the scope is shared .
        @[JSON::Field(key: "autoprovision")]
        getter autoprovision : Bool?

        # The Docker volume driver to use. The driver value must match the driver name provided by Docker
        # because it is used for task placement. If the driver was installed using the Docker plugin CLI, use
        # docker plugin ls to retrieve the driver name from your container instance. If the driver was
        # installed using another method, use Docker plugin discovery to retrieve the driver name. This
        # parameter maps to Driver in the docker container create command and the xxdriver option to docker
        # volume create.
        @[JSON::Field(key: "driver")]
        getter driver : String?

        # A map of Docker driver-specific options passed through. This parameter maps to DriverOpts in the
        # docker create-volume command and the xxopt option to docker volume create.
        @[JSON::Field(key: "driverOpts")]
        getter driver_opts : Hash(String, String)?

        # Custom metadata to add to your Docker volume. This parameter maps to Labels in the docker container
        # create command and the xxlabel option to docker volume create.
        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # The scope for the Docker volume that determines its lifecycle. Docker volumes that are scoped to a
        # task are automatically provisioned when the task starts and destroyed when the task stops. Docker
        # volumes that are scoped as shared persist after the task stops.
        @[JSON::Field(key: "scope")]
        getter scope : String?

        def initialize(
          @autoprovision : Bool? = nil,
          @driver : String? = nil,
          @driver_opts : Hash(String, String)? = nil,
          @labels : Hash(String, String)? = nil,
          @scope : String? = nil
        )
        end
      end

      # The tag specifications of an Amazon EBS volume.
      struct EBSTagSpecification
        include JSON::Serializable

        # The type of volume resource.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Determines whether to propagate the tags from the task definition to &#x2028;the Amazon EBS volume.
        # Tags can only propagate to a SERVICE specified in &#x2028; ServiceVolumeConfiguration . If no value
        # is specified, the tags aren't &#x2028;propagated.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # The tags applied to this Amazon EBS volume. AmazonECSCreated and AmazonECSManaged are reserved tags
        # that can't be used.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @resource_type : String,
          @propagate_tags : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents an Express service, which provides a simplified way to deploy containerized web
      # applications on Amazon ECS with managed Amazon Web Services infrastructure. An Express service
      # automatically provisions and manages Application Load Balancers, target groups, security groups, and
      # auto-scaling policies. Express services use a service revision architecture where each service can
      # have multiple active configurations, enabling blue-green deployments and gradual rollouts. The
      # service maintains a list of active configurations and manages the lifecycle of the underlying Amazon
      # Web Services resources.
      struct ECSExpressGatewayService
        include JSON::Serializable

        # The list of active service configurations for the Express service.
        @[JSON::Field(key: "activeConfigurations")]
        getter active_configurations : Array(Types::ExpressGatewayServiceConfiguration)?

        # The short name or full ARN of the cluster that hosts the Express service.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The Unix timestamp for when the Express service was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The current deployment configuration for the Express service.
        @[JSON::Field(key: "currentDeployment")]
        getter current_deployment : String?

        # The ARN of the infrastructure role that manages Amazon Web Services resources for the Express
        # service.
        @[JSON::Field(key: "infrastructureRoleArn")]
        getter infrastructure_role_arn : String?

        # The ARN that identifies the Express service.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The name of the Express service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The current status of the Express service.
        @[JSON::Field(key: "status")]
        getter status : Types::ExpressGatewayServiceStatus?

        # The metadata applied to the Express service.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The Unix timestamp for when the Express service was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @active_configurations : Array(Types::ExpressGatewayServiceConfiguration)? = nil,
          @cluster : String? = nil,
          @created_at : Time? = nil,
          @current_deployment : String? = nil,
          @infrastructure_role_arn : String? = nil,
          @service_arn : String? = nil,
          @service_name : String? = nil,
          @status : Types::ExpressGatewayServiceStatus? = nil,
          @tags : Array(Types::Tag)? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # Represents the Amazon Web Services resources managed by Amazon ECS for an Express service, including
      # ingress paths, auto-scaling policies, metric alarms, and security groups.
      struct ECSManagedResources
        include JSON::Serializable

        # The auto-scaling configuration and policies for the Express service.
        @[JSON::Field(key: "autoScaling")]
        getter auto_scaling : Types::ManagedAutoScaling?

        # The ingress paths and endpoints for the Express service.
        @[JSON::Field(key: "ingressPaths")]
        getter ingress_paths : Array(Types::ManagedIngressPath)?

        # The log groups managed by the Express service.
        @[JSON::Field(key: "logGroups")]
        getter log_groups : Array(Types::ManagedLogGroup)?

        # The CloudWatch metric alarms associated with the Express service.
        @[JSON::Field(key: "metricAlarms")]
        getter metric_alarms : Array(Types::ManagedMetricAlarm)?

        # The security groups managed by the Express service.
        @[JSON::Field(key: "serviceSecurityGroups")]
        getter service_security_groups : Array(Types::ManagedSecurityGroup)?

        def initialize(
          @auto_scaling : Types::ManagedAutoScaling? = nil,
          @ingress_paths : Array(Types::ManagedIngressPath)? = nil,
          @log_groups : Array(Types::ManagedLogGroup)? = nil,
          @metric_alarms : Array(Types::ManagedMetricAlarm)? = nil,
          @service_security_groups : Array(Types::ManagedSecurityGroup)? = nil
        )
        end
      end

      # The authorization configuration details for the Amazon EFS file system.
      struct EFSAuthorizationConfig
        include JSON::Serializable

        # The Amazon EFS access point ID to use. If an access point is specified, the root directory value
        # specified in the EFSVolumeConfiguration must either be omitted or set to / which will enforce the
        # path set on the EFS access point. If an access point is used, transit encryption must be on in the
        # EFSVolumeConfiguration . For more information, see Working with Amazon EFS access points in the
        # Amazon Elastic File System User Guide .
        @[JSON::Field(key: "accessPointId")]
        getter access_point_id : String?

        # Determines whether to use the Amazon ECS task role defined in a task definition when mounting the
        # Amazon EFS file system. If it is turned on, transit encryption must be turned on in the
        # EFSVolumeConfiguration . If this parameter is omitted, the default value of DISABLED is used. For
        # more information, see Using Amazon EFS access points in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "iam")]
        getter iam : String?

        def initialize(
          @access_point_id : String? = nil,
          @iam : String? = nil
        )
        end
      end

      # This parameter is specified when you're using an Amazon Elastic File System file system for task
      # storage. For more information, see Amazon EFS volumes in the Amazon Elastic Container Service
      # Developer Guide .
      struct EFSVolumeConfiguration
        include JSON::Serializable

        # The Amazon EFS file system ID to use.
        @[JSON::Field(key: "fileSystemId")]
        getter file_system_id : String

        # The authorization configuration details for the Amazon EFS file system.
        @[JSON::Field(key: "authorizationConfig")]
        getter authorization_config : Types::EFSAuthorizationConfig?

        # The directory within the Amazon EFS file system to mount as the root directory inside the host. If
        # this parameter is omitted, the root of the Amazon EFS volume will be used. Specifying / will have
        # the same effect as omitting this parameter. If an EFS access point is specified in the
        # authorizationConfig , the root directory parameter must either be omitted or set to / which will
        # enforce the path set on the EFS access point.
        @[JSON::Field(key: "rootDirectory")]
        getter root_directory : String?

        # Determines whether to use encryption for Amazon EFS data in transit between the Amazon ECS host and
        # the Amazon EFS server. Transit encryption must be turned on if Amazon EFS IAM authorization is used.
        # If this parameter is omitted, the default value of DISABLED is used. For more information, see
        # Encrypting data in transit in the Amazon Elastic File System User Guide .
        @[JSON::Field(key: "transitEncryption")]
        getter transit_encryption : String?

        # The port to use when sending encrypted data between the Amazon ECS host and the Amazon EFS server.
        # If you do not specify a transit encryption port, it will use the port selection strategy that the
        # Amazon EFS mount helper uses. For more information, see EFS mount helper in the Amazon Elastic File
        # System User Guide .
        @[JSON::Field(key: "transitEncryptionPort")]
        getter transit_encryption_port : Int32?

        def initialize(
          @file_system_id : String,
          @authorization_config : Types::EFSAuthorizationConfig? = nil,
          @root_directory : String? = nil,
          @transit_encryption : String? = nil,
          @transit_encryption_port : Int32? = nil
        )
        end
      end

      # A list of files containing the environment variables to pass to a container. You can specify up to
      # ten environment files. The file must have a .env file extension. Each line in an environment file
      # should contain an environment variable in VARIABLE=VALUE format. Lines beginning with # are treated
      # as comments and are ignored. If there are environment variables specified using the environment
      # parameter in a container definition, they take precedence over the variables contained within an
      # environment file. If multiple environment files are specified that contain the same variable,
      # they're processed from the top down. We recommend that you use unique variable names. For more
      # information, see Use a file to pass environment variables to a container in the Amazon Elastic
      # Container Service Developer Guide . Environment variable files are objects in Amazon S3 and all
      # Amazon S3 security considerations apply. You must use the following platforms for the Fargate launch
      # type: Linux platform version 1.4.0 or later. Windows platform version 1.0.0 or later. Consider the
      # following when using the Fargate launch type: The file is handled like a native Docker env-file.
      # There is no support for shell escape handling. The container entry point interperts the VARIABLE
      # values.
      struct EnvironmentFile
        include JSON::Serializable

        # The file type to use. Environment files are objects in Amazon S3. The only supported value is s3 .
        @[JSON::Field(key: "type")]
        getter type : String

        # The Amazon Resource Name (ARN) of the Amazon S3 object containing the environment variable file.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total
      # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate. For
      # more information, see Using data volumes in tasks in the Amazon ECS Developer Guide; . For tasks
      # using the Fargate launch type, the task requires the following platforms: Linux platform version
      # 1.4.0 or later. Windows platform version 1.0.0 or later.
      struct EphemeralStorage
        include JSON::Serializable

        # The total amount, in GiB, of ephemeral storage to set for the task. The minimum supported value is
        # 21 GiB and the maximum supported value is 200 GiB.
        @[JSON::Field(key: "sizeInGiB")]
        getter size_in_gi_b : Int32

        def initialize(
          @size_in_gi_b : Int32
        )
        end
      end

      # The details of the execute command configuration.
      struct ExecuteCommandConfiguration
        include JSON::Serializable

        # Specify an Key Management Service key ID to encrypt the data between the local client and the
        # container.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The log configuration for the results of the execute command actions. The logs can be sent to
        # CloudWatch Logs or an Amazon S3 bucket. When logging=OVERRIDE is specified, a logConfiguration must
        # be provided.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::ExecuteCommandLogConfiguration?

        # The log setting to use for redirecting logs for your execute command results. The following log
        # settings are available. NONE : The execute command session is not logged. DEFAULT : The awslogs
        # configuration in the task definition is used. If no logging parameter is specified, it defaults to
        # this value. If no awslogs log driver is configured in the task definition, the output won't be
        # logged. OVERRIDE : Specify the logging details as a part of logConfiguration . If the OVERRIDE
        # logging option is specified, the logConfiguration is required.
        @[JSON::Field(key: "logging")]
        getter logging : String?

        def initialize(
          @kms_key_id : String? = nil,
          @log_configuration : Types::ExecuteCommandLogConfiguration? = nil,
          @logging : String? = nil
        )
        end
      end

      # The log configuration for the results of the execute command actions. The logs can be sent to
      # CloudWatch Logs or an Amazon S3 bucket.
      struct ExecuteCommandLogConfiguration
        include JSON::Serializable

        # Determines whether to use encryption on the CloudWatch logs. If not specified, encryption will be
        # off.
        @[JSON::Field(key: "cloudWatchEncryptionEnabled")]
        getter cloud_watch_encryption_enabled : Bool?

        # The name of the CloudWatch log group to send logs to. The CloudWatch log group must already be
        # created.
        @[JSON::Field(key: "cloudWatchLogGroupName")]
        getter cloud_watch_log_group_name : String?

        # The name of the S3 bucket to send logs to. The S3 bucket must already be created.
        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String?

        # Determines whether to use encryption on the S3 logs. If not specified, encryption is not used.
        @[JSON::Field(key: "s3EncryptionEnabled")]
        getter s3_encryption_enabled : Bool?

        # An optional folder in the S3 bucket to place logs in.
        @[JSON::Field(key: "s3KeyPrefix")]
        getter s3_key_prefix : String?

        def initialize(
          @cloud_watch_encryption_enabled : Bool? = nil,
          @cloud_watch_log_group_name : String? = nil,
          @s3_bucket_name : String? = nil,
          @s3_encryption_enabled : Bool? = nil,
          @s3_key_prefix : String? = nil
        )
        end
      end

      struct ExecuteCommandRequest
        include JSON::Serializable

        # The command to run on the container.
        @[JSON::Field(key: "command")]
        getter command : String

        # Use this flag to run your command in interactive mode.
        @[JSON::Field(key: "interactive")]
        getter interactive : Bool

        # The Amazon Resource Name (ARN) or ID of the task the container is part of.
        @[JSON::Field(key: "task")]
        getter task : String

        # The Amazon Resource Name (ARN) or short name of the cluster the task is running in. If you do not
        # specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The name of the container to execute the command on. A container name only needs to be specified for
        # tasks containing multiple containers.
        @[JSON::Field(key: "container")]
        getter container : String?

        def initialize(
          @command : String,
          @interactive : Bool,
          @task : String,
          @cluster : String? = nil,
          @container : String? = nil
        )
        end
      end

      struct ExecuteCommandResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the cluster.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Amazon Resource Name (ARN) of the container.
        @[JSON::Field(key: "containerArn")]
        getter container_arn : String?

        # The name of the container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # Determines whether the execute command session is running in interactive mode. Amazon ECS only
        # supports initiating interactive sessions, so you must specify true for this value.
        @[JSON::Field(key: "interactive")]
        getter interactive : Bool?

        # The details of the SSM session that was created for this instance of execute-command.
        @[JSON::Field(key: "session")]
        getter session : Types::Session?

        # The Amazon Resource Name (ARN) of the task.
        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @container_arn : String? = nil,
          @container_name : String? = nil,
          @interactive : Bool? = nil,
          @session : Types::Session? = nil,
          @task_arn : String? = nil
        )
        end
      end

      # Defines the configuration for the primary container in an Express service. This container receives
      # traffic from the Application Load Balancer and runs your application code. The container
      # configuration includes the container image, port mapping, logging settings, environment variables,
      # and secrets. The container image is the only required parameter, with sensible defaults provided for
      # other settings.
      struct ExpressGatewayContainer
        include JSON::Serializable

        # The image used to start a container. This string is passed directly to the Docker daemon. Images in
        # the Docker Hub registry are available by default. Other repositories are specified with either
        # repository-url/image:tag or repository-url/image@digest . For Express services, the image typically
        # contains a web application that listens on the specified container port. The image can be stored in
        # Amazon ECR, Docker Hub, or any other container registry accessible to your execution role.
        @[JSON::Field(key: "image")]
        getter image : String

        # The log configuration for the container.
        @[JSON::Field(key: "awsLogsConfiguration")]
        getter aws_logs_configuration : Types::ExpressGatewayServiceAwsLogsConfiguration?

        # The command that is passed to the container.
        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The port number on the container that receives traffic from the load balancer. Default is 80.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32?

        # The environment variables to pass to the container.
        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # The configuration for repository credentials for private registry authentication.
        @[JSON::Field(key: "repositoryCredentials")]
        getter repository_credentials : Types::ExpressGatewayRepositoryCredentials?

        # The secrets to pass to the container.
        @[JSON::Field(key: "secrets")]
        getter secrets : Array(Types::Secret)?

        def initialize(
          @image : String,
          @aws_logs_configuration : Types::ExpressGatewayServiceAwsLogsConfiguration? = nil,
          @command : Array(String)? = nil,
          @container_port : Int32? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @repository_credentials : Types::ExpressGatewayRepositoryCredentials? = nil,
          @secrets : Array(Types::Secret)? = nil
        )
        end
      end

      # The repository credentials for private registry authentication to pass to the container.
      struct ExpressGatewayRepositoryCredentials
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret containing the private repository credentials.
        @[JSON::Field(key: "credentialsParameter")]
        getter credentials_parameter : String?

        def initialize(
          @credentials_parameter : String? = nil
        )
        end
      end

      # Defines the auto-scaling configuration for an Express service. This determines how the service
      # automatically adjusts the number of running tasks based on demand metrics such as CPU utilization,
      # memory utilization, or request count per target. Auto-scaling helps ensure your application can
      # handle varying levels of traffic while optimizing costs by scaling down during low-demand periods.
      # You can specify the minimum and maximum number of tasks, the scaling metric, and the target value
      # for that metric.
      struct ExpressGatewayScalingTarget
        include JSON::Serializable

        # The metric used for auto-scaling decisions. The default metric used for an Express service is
        # CPUUtilization .
        @[JSON::Field(key: "autoScalingMetric")]
        getter auto_scaling_metric : String?

        # The target value for the auto-scaling metric. The default value for an Express service is 60.
        @[JSON::Field(key: "autoScalingTargetValue")]
        getter auto_scaling_target_value : Int32?

        # The maximum number of tasks to run in the Express service.
        @[JSON::Field(key: "maxTaskCount")]
        getter max_task_count : Int32?

        # The minimum number of tasks to run in the Express service.
        @[JSON::Field(key: "minTaskCount")]
        getter min_task_count : Int32?

        def initialize(
          @auto_scaling_metric : String? = nil,
          @auto_scaling_target_value : Int32? = nil,
          @max_task_count : Int32? = nil,
          @min_task_count : Int32? = nil
        )
        end
      end

      # Specifies the Amazon CloudWatch Logs configuration for the Express service container.
      struct ExpressGatewayServiceAwsLogsConfiguration
        include JSON::Serializable

        # The name of the CloudWatch Logs log group to send container logs to.
        @[JSON::Field(key: "logGroup")]
        getter log_group : String

        # The prefix for the CloudWatch Logs log stream names. The default for an Express service is ecs .
        @[JSON::Field(key: "logStreamPrefix")]
        getter log_stream_prefix : String

        def initialize(
          @log_group : String,
          @log_stream_prefix : String
        )
        end
      end

      # Represents a specific configuration revision of an Express service, containing all the settings and
      # parameters for that revision.
      struct ExpressGatewayServiceConfiguration
        include JSON::Serializable

        # The CPU allocation for tasks in this service revision.
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The Unix timestamp for when this service revision was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ARN of the task execution role for the service revision.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The health check path for this service revision.
        @[JSON::Field(key: "healthCheckPath")]
        getter health_check_path : String?

        # The entry point into this service revision.
        @[JSON::Field(key: "ingressPaths")]
        getter ingress_paths : Array(Types::IngressPathSummary)?

        # The memory allocation for tasks in this service revision.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The network configuration for tasks in this service revision.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::ExpressGatewayServiceNetworkConfiguration?

        # The primary container configuration for this service revision.
        @[JSON::Field(key: "primaryContainer")]
        getter primary_container : Types::ExpressGatewayContainer?

        # The auto-scaling configuration for this service revision.
        @[JSON::Field(key: "scalingTarget")]
        getter scaling_target : Types::ExpressGatewayScalingTarget?

        # The ARN of the service revision.
        @[JSON::Field(key: "serviceRevisionArn")]
        getter service_revision_arn : String?

        # The ARN of the task role for the service revision.
        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        def initialize(
          @cpu : String? = nil,
          @created_at : Time? = nil,
          @execution_role_arn : String? = nil,
          @health_check_path : String? = nil,
          @ingress_paths : Array(Types::IngressPathSummary)? = nil,
          @memory : String? = nil,
          @network_configuration : Types::ExpressGatewayServiceNetworkConfiguration? = nil,
          @primary_container : Types::ExpressGatewayContainer? = nil,
          @scaling_target : Types::ExpressGatewayScalingTarget? = nil,
          @service_revision_arn : String? = nil,
          @task_role_arn : String? = nil
        )
        end
      end

      # The network configuration for an Express service. By default, an Express service utilizes subnets
      # and security groups associated with the default VPC.
      struct ExpressGatewayServiceNetworkConfiguration
        include JSON::Serializable

        # The IDs of the security groups associated with the Express service.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The IDs of the subnets associated with the Express service.
        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        def initialize(
          @security_groups : Array(String)? = nil,
          @subnets : Array(String)? = nil
        )
        end
      end

      # An object that defines the status of Express service creation and information about the status of
      # the service.
      struct ExpressGatewayServiceStatus
        include JSON::Serializable

        # The status of the Express service.
        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        # Information about why the Express service is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status_code : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The authorization configuration details for Amazon FSx for Windows File Server file system. See
      # FSxWindowsFileServerVolumeConfiguration in the Amazon ECS API Reference . For more information and
      # the input format, see Amazon FSx for Windows File Server Volumes in the Amazon Elastic Container
      # Service Developer Guide .
      struct FSxWindowsFileServerAuthorizationConfig
        include JSON::Serializable

        # The authorization credential option to use. The authorization credential options can be provided
        # using either the Amazon Resource Name (ARN) of an Secrets Manager secret or SSM Parameter Store
        # parameter. The ARN refers to the stored credentials.
        @[JSON::Field(key: "credentialsParameter")]
        getter credentials_parameter : String

        # A fully qualified domain name hosted by an Directory Service Managed Microsoft AD (Active Directory)
        # or self-hosted AD on Amazon EC2.
        @[JSON::Field(key: "domain")]
        getter domain : String

        def initialize(
          @credentials_parameter : String,
          @domain : String
        )
        end
      end

      # This parameter is specified when you're using Amazon FSx for Windows File Server file system for
      # task storage. For more information and the input format, see Amazon FSx for Windows File Server
      # volumes in the Amazon Elastic Container Service Developer Guide .
      struct FSxWindowsFileServerVolumeConfiguration
        include JSON::Serializable

        # The authorization configuration details for the Amazon FSx for Windows File Server file system.
        @[JSON::Field(key: "authorizationConfig")]
        getter authorization_config : Types::FSxWindowsFileServerAuthorizationConfig

        # The Amazon FSx for Windows File Server file system ID to use.
        @[JSON::Field(key: "fileSystemId")]
        getter file_system_id : String

        # The directory within the Amazon FSx for Windows File Server file system to mount as the root
        # directory inside the host.
        @[JSON::Field(key: "rootDirectory")]
        getter root_directory : String

        def initialize(
          @authorization_config : Types::FSxWindowsFileServerAuthorizationConfig,
          @file_system_id : String,
          @root_directory : String
        )
        end
      end

      # A failed resource. For a list of common causes, see API failure reasons in the Amazon Elastic
      # Container Service Developer Guide .
      struct Failure
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the failed resource.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The details of the failure.
        @[JSON::Field(key: "detail")]
        getter detail : String?

        # The reason for the failure.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @arn : String? = nil,
          @detail : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # The FireLens configuration for the container. This is used to specify and configure a log router for
      # container logs. For more information, see Custom log routing in the Amazon Elastic Container Service
      # Developer Guide .
      struct FirelensConfiguration
        include JSON::Serializable

        # The log router to use. The valid values are fluentd or fluentbit .
        @[JSON::Field(key: "type")]
        getter type : String

        # The options to use when configuring the log router. This field is optional and can be used to
        # specify a custom configuration file or to add additional metadata, such as the task, task
        # definition, cluster, and container instance details to the log event. If specified, the syntax to
        # use is
        # "options":{"enable-ecs-log-metadata":"true|false","config-file-type:"s3|file","config-file-value":"arn:aws:s3:::mybucket/fluent.conf|filepath"}
        # . For more information, see Creating a task definition that uses a FireLens configuration in the
        # Amazon Elastic Container Service Developer Guide . Tasks hosted on Fargate only support the file
        # configuration file type.
        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        def initialize(
          @type : String,
          @options : Hash(String, String)? = nil
        )
        end
      end

      struct GetTaskProtectionRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the
        # task sets exist in.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # A list of up to 100 task IDs or full ARN entries.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(String)?

        def initialize(
          @cluster : String,
          @tasks : Array(String)? = nil
        )
        end
      end

      struct GetTaskProtectionResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # A list of tasks with the following information. taskArn : The task ARN. protectionEnabled : The
        # protection status of the task. If scale-in protection is turned on for a task, the value is true .
        # Otherwise, it is false . expirationDate : The epoch time when protection for the task will expire.
        @[JSON::Field(key: "protectedTasks")]
        getter protected_tasks : Array(Types::ProtectedTask)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @protected_tasks : Array(Types::ProtectedTask)? = nil
        )
        end
      end

      # An object representing a container health check. Health check parameters that are specified in a
      # container definition override any Docker health checks that exist in the container image (such as
      # those specified in a parent image or from the image's Dockerfile). This configuration maps to the
      # HEALTHCHECK parameter of docker run. The Amazon ECS container agent only monitors and reports on the
      # health checks specified in the task definition. Amazon ECS does not monitor Docker health checks
      # that are embedded in a container image and not specified in the container definition. Health check
      # parameters that are specified in a container definition override any Docker health checks that exist
      # in the container image. You can view the health status of both individual containers and a task with
      # the DescribeTasks API operation or when viewing the task details in the console. The health check is
      # designed to make sure that your containers survive agent restarts, upgrades, or temporary
      # unavailability. Amazon ECS performs health checks on containers with the default that launched the
      # container instance or the task. The following describes the possible healthStatus values for a
      # container: HEALTHY -The container health check has passed successfully. UNHEALTHY -The container
      # health check has failed. UNKNOWN -The container health check is being evaluated, there's no
      # container health check defined, or Amazon ECS doesn't have the health status of the container. The
      # following describes the possible healthStatus values based on the container health checker status of
      # essential containers in the task with the following priority order (high to low): UNHEALTHY -One or
      # more essential containers have failed their health check. UNKNOWN -Any essential container running
      # within the task is in an UNKNOWN state and no other essential containers have an UNHEALTHY state.
      # HEALTHY -All essential containers within the task have passed their health checks. Consider the
      # following task health example with 2 containers. If Container1 is UNHEALTHY and Container2 is
      # UNKNOWN , the task health is UNHEALTHY . If Container1 is UNHEALTHY and Container2 is HEALTHY , the
      # task health is UNHEALTHY . If Container1 is HEALTHY and Container2 is UNKNOWN , the task health is
      # UNKNOWN . If Container1 is HEALTHY and Container2 is HEALTHY , the task health is HEALTHY . Consider
      # the following task health example with 3 containers. If Container1 is UNHEALTHY and Container2 is
      # UNKNOWN , and Container3 is UNKNOWN , the task health is UNHEALTHY . If Container1 is UNHEALTHY and
      # Container2 is UNKNOWN , and Container3 is HEALTHY , the task health is UNHEALTHY . If Container1 is
      # UNHEALTHY and Container2 is HEALTHY , and Container3 is HEALTHY , the task health is UNHEALTHY . If
      # Container1 is HEALTHY and Container2 is UNKNOWN , and Container3 is HEALTHY , the task health is
      # UNKNOWN . If Container1 is HEALTHY and Container2 is UNKNOWN , and Container3 is UNKNOWN , the task
      # health is UNKNOWN . If Container1 is HEALTHY and Container2 is HEALTHY , and Container3 is HEALTHY ,
      # the task health is HEALTHY . If a task is run manually, and not as part of a service, the task will
      # continue its lifecycle regardless of its health status. For tasks that are part of a service, if the
      # task reports as unhealthy then the task will be stopped and the service scheduler will replace it.
      # When a container health check fails for a task that is part of a service, the following process
      # occurs: The task is marked as UNHEALTHY . The unhealthy task will be stopped, and during the
      # stopping process, it will go through the following states: DEACTIVATING - In this state, Amazon ECS
      # performs additional steps before stopping the task. For example, for tasks that are part of services
      # configured to use Elastic Load Balancing target groups, target groups will be deregistered in this
      # state. STOPPING - The task is in the process of being stopped. DEPROVISIONING - Resources associated
      # with the task are being cleaned up. STOPPED - The task has been completely stopped. After the old
      # task stops, a new task will be launched to ensure service operation, and the new task will go
      # through the following lifecycle: PROVISIONING - Resources required for the task are being
      # provisioned. PENDING - The task is waiting to be placed on a container instance. ACTIVATING - In
      # this state, Amazon ECS pulls container images, creates containers, configures task networking,
      # registers load balancer target groups, and configures service discovery status. RUNNING - The task
      # is running and performing its work. For more detailed information about task lifecycle states, see
      # Task lifecycle in the Amazon Elastic Container Service Developer Guide . The following are notes
      # about container health check support: If the Amazon ECS container agent becomes disconnected from
      # the Amazon ECS service, this won't cause a container to transition to an UNHEALTHY status. This is
      # by design, to ensure that containers remain running during agent restarts or temporary
      # unavailability. The health check status is the "last heard from" response from the Amazon ECS agent,
      # so if the container was considered HEALTHY prior to the disconnect, that status will remain until
      # the agent reconnects and another health check occurs. There are no assumptions made about the status
      # of the container health checks. Container health checks require version 1.17.0 or greater of the
      # Amazon ECS container agent. For more information, see Updating the Amazon ECS container agent .
      # Container health checks are supported for Fargate tasks if you're using platform version 1.1.0 or
      # greater. For more information, see Fargate platform versions . Container health checks aren't
      # supported for tasks that are part of a service that's configured to use a Classic Load Balancer. For
      # an example of how to specify a task definition with multiple containers where container dependency
      # is specified, see Container dependency in the Amazon Elastic Container Service Developer Guide .
      struct HealthCheck
        include JSON::Serializable

        # A string array representing the command that the container runs to determine if it is healthy. The
        # string array must start with CMD to run the command arguments directly, or CMD-SHELL to run the
        # command with the container's default shell. When you use the Amazon Web Services Management Console
        # JSON panel, the Command Line Interface, or the APIs, enclose the list of commands in double quotes
        # and brackets. [ "CMD-SHELL", "curl -f http://localhost/ || exit 1" ] You don't include the double
        # quotes and brackets when you use the Amazon Web Services Management Console. CMD-SHELL, curl -f
        # http://localhost/ || exit 1 An exit code of 0 indicates success, and non-zero exit code indicates
        # failure. For more information, see HealthCheck in the docker container create command.
        @[JSON::Field(key: "command")]
        getter command : Array(String)

        # The time period in seconds between each health check execution. You may specify between 5 and 300
        # seconds. The default value is 30 seconds. This value applies only when you specify a command .
        @[JSON::Field(key: "interval")]
        getter interval : Int32?

        # The number of times to retry a failed health check before the container is considered unhealthy. You
        # may specify between 1 and 10 retries. The default value is 3. This value applies only when you
        # specify a command .
        @[JSON::Field(key: "retries")]
        getter retries : Int32?

        # The optional grace period to provide containers time to bootstrap before failed health checks count
        # towards the maximum number of retries. You can specify between 0 and 300 seconds. By default, the
        # startPeriod is off. This value applies only when you specify a command . If a health check succeeds
        # within the startPeriod , then the container is considered healthy and any subsequent failures count
        # toward the maximum number of retries.
        @[JSON::Field(key: "startPeriod")]
        getter start_period : Int32?

        # The time period in seconds to wait for a health check to succeed before it is considered a failure.
        # You may specify between 2 and 60 seconds. The default value is 5. This value applies only when you
        # specify a command .
        @[JSON::Field(key: "timeout")]
        getter timeout : Int32?

        def initialize(
          @command : Array(String),
          @interval : Int32? = nil,
          @retries : Int32? = nil,
          @start_period : Int32? = nil,
          @timeout : Int32? = nil
        )
        end
      end

      struct HookDetails
        include JSON::Serializable

        def initialize
        end
      end

      # Hostnames and IP address entries that are added to the /etc/hosts file of a container via the
      # extraHosts parameter of its ContainerDefinition .
      struct HostEntry
        include JSON::Serializable

        # The hostname to use in the /etc/hosts entry.
        @[JSON::Field(key: "hostname")]
        getter hostname : String

        # The IP address to use in the /etc/hosts entry.
        @[JSON::Field(key: "ipAddress")]
        getter ip_address : String

        def initialize(
          @hostname : String,
          @ip_address : String
        )
        end
      end

      # Details on a container instance bind mount host volume.
      struct HostVolumeProperties
        include JSON::Serializable

        # When the host parameter is used, specify a sourcePath to declare the path on the host container
        # instance that's presented to the container. If this parameter is empty, then the Docker daemon has
        # assigned a host path for you. If the host parameter contains a sourcePath file location, then the
        # data volume persists at the specified location on the host container instance until you delete it
        # manually. If the sourcePath value doesn't exist on the host container instance, the Docker daemon
        # creates it. If the location does exist, the contents of the source path folder are exported. If
        # you're using the Fargate launch type, the sourcePath parameter is not supported.
        @[JSON::Field(key: "sourcePath")]
        getter source_path : String?

        def initialize(
          @source_path : String? = nil
        )
        end
      end

      # Details on an Elastic Inference accelerator. For more information, see Working with Amazon Elastic
      # Inference on Amazon ECS in the Amazon Elastic Container Service Developer Guide .
      struct InferenceAccelerator
        include JSON::Serializable

        # The Elastic Inference accelerator device name. The deviceName must also be referenced in a container
        # definition as a ResourceRequirement .
        @[JSON::Field(key: "deviceName")]
        getter device_name : String

        # The Elastic Inference accelerator type to use.
        @[JSON::Field(key: "deviceType")]
        getter device_type : String

        def initialize(
          @device_name : String,
          @device_type : String
        )
        end
      end

      # Details on an Elastic Inference accelerator task override. This parameter is used to override the
      # Elastic Inference accelerator specified in the task definition. For more information, see Working
      # with Amazon Elastic Inference on Amazon ECS in the Amazon Elastic Container Service Developer Guide
      # .
      struct InferenceAcceleratorOverride
        include JSON::Serializable

        # The Elastic Inference accelerator device name to override for the task. This parameter must match a
        # deviceName specified in the task definition.
        @[JSON::Field(key: "deviceName")]
        getter device_name : String?

        # The Elastic Inference accelerator type to use.
        @[JSON::Field(key: "deviceType")]
        getter device_type : String?

        def initialize(
          @device_name : String? = nil,
          @device_type : String? = nil
        )
        end
      end

      # The configuration that controls how Amazon ECS optimizes your infrastructure.
      struct InfrastructureOptimization
        include JSON::Serializable

        # This parameter defines the number of seconds Amazon ECS Managed Instances waits before optimizing
        # EC2 instances that have become idle or underutilized. A longer delay increases the likelihood of
        # placing new tasks on idle or underutilized instances instances, reducing startup time. A shorter
        # delay helps reduce infrastructure costs by optimizing idle or underutilized instances,instances more
        # quickly. Valid values are: null - Uses the default optimization behavior. -1 - Disables automatic
        # infrastructure optimization. A value between 0 and 3600 (inclusive) - Specifies the number of
        # seconds to wait before optimizing instances.
        @[JSON::Field(key: "scaleInAfter")]
        getter scale_in_after : Int32?

        def initialize(
          @scale_in_after : Int32? = nil
        )
        end
      end

      # The entry point into an Express service.
      struct IngressPathSummary
        include JSON::Serializable

        # The type of access to the endpoint for the Express service.
        @[JSON::Field(key: "accessType")]
        getter access_type : String

        # The endpoint for access to the service.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        def initialize(
          @access_type : String,
          @endpoint : String
        )
        end
      end

      # An object representing the result of a container instance health status check.
      struct InstanceHealthCheckResult
        include JSON::Serializable

        # The Unix timestamp for when the container instance health status last changed.
        @[JSON::Field(key: "lastStatusChange", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_status_change : Time?

        # The Unix timestamp for when the container instance health status was last updated.
        @[JSON::Field(key: "lastUpdated", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_updated : Time?

        # The container instance health status.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The type of container instance health status that was verified.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @last_status_change : Time? = nil,
          @last_updated : Time? = nil,
          @status : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The launch template configuration for Amazon ECS Managed Instances. This defines how Amazon ECS
      # launches Amazon EC2 instances, including the instance profile for your tasks, network and storage
      # configuration, capacity options, and instance requirements for flexible instance type selection.
      struct InstanceLaunchTemplate
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the instance profile that Amazon ECS applies to Amazon ECS Managed
        # Instances. This instance profile must include the necessary permissions for your tasks to access
        # Amazon Web Services services and resources. For more information, see Amazon ECS instance profile
        # for Managed Instances in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "ec2InstanceProfileArn")]
        getter ec2_instance_profile_arn : String

        # The network configuration for Amazon ECS Managed Instances. This specifies the subnets and security
        # groups that instances use for network connectivity.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::ManagedInstancesNetworkConfiguration

        # The capacity option type. This determines whether Amazon ECS launches On-Demand or Spot Instances
        # for your managed instance capacity provider. Valid values are: ON_DEMAND - Launches standard
        # On-Demand Instances. On-Demand Instances provide predictable pricing and availability. SPOT -
        # Launches Spot Instances that use spare Amazon EC2 capacity at reduced cost. Spot Instances can be
        # interrupted by Amazon EC2 with a two-minute notification when the capacity is needed back. The
        # default is On-Demand For more information about Amazon EC2 capacity options, see Instance purchasing
        # options in the Amazon EC2 User Guide .
        @[JSON::Field(key: "capacityOptionType")]
        getter capacity_option_type : String?

        # Determines whether to enable FIPS 140-2 validated cryptographic modules on EC2 instances launched by
        # the capacity provider. If true , instances use FIPS-compliant cryptographic algorithms and modules
        # for enhanced security compliance. If false , instances use standard cryptographic implementations.
        # If not specified, instances are launched with FIPS enabled in AWS GovCloud (US) regions and FIPS
        # disabled in other regions.
        @[JSON::Field(key: "fipsEnabled")]
        getter fips_enabled : Bool?

        # The instance requirements. You can specify: The instance types Instance requirements such as vCPU
        # count, memory, network performance, and accelerator specifications Amazon ECS automatically selects
        # the instances that match the specified criteria.
        @[JSON::Field(key: "instanceRequirements")]
        getter instance_requirements : Types::InstanceRequirementsRequest?

        # CloudWatch provides two categories of monitoring: basic monitoring and detailed monitoring. By
        # default, your managed instance is configured for basic monitoring. You can optionally enable
        # detailed monitoring to help you more quickly identify and act on operational issues. You can enable
        # or turn off detailed monitoring at launch or when the managed instance is running or stopped. For
        # more information, see Detailed monitoring for Amazon ECS Managed Instances in the Amazon ECS
        # Developer Guide.
        @[JSON::Field(key: "monitoring")]
        getter monitoring : String?

        # The storage configuration for Amazon ECS Managed Instances. This defines the root volume size and
        # type for the instances.
        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::ManagedInstancesStorageConfiguration?

        def initialize(
          @ec2_instance_profile_arn : String,
          @network_configuration : Types::ManagedInstancesNetworkConfiguration,
          @capacity_option_type : String? = nil,
          @fips_enabled : Bool? = nil,
          @instance_requirements : Types::InstanceRequirementsRequest? = nil,
          @monitoring : String? = nil,
          @storage_configuration : Types::ManagedInstancesStorageConfiguration? = nil
        )
        end
      end

      # The updated launch template configuration for Amazon ECS Managed Instances. You can modify the
      # instance profile, network configuration, storage settings, and instance requirements. Changes apply
      # to new instances launched after the update. For more information, see Store instance launch
      # parameters in Amazon EC2 launch templates in the Amazon EC2 User Guide .
      struct InstanceLaunchTemplateUpdate
        include JSON::Serializable

        # The updated Amazon Resource Name (ARN) of the instance profile. The new instance profile must have
        # the necessary permissions for your tasks. For more information, see Amazon ECS instance profile for
        # Managed Instances in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "ec2InstanceProfileArn")]
        getter ec2_instance_profile_arn : String?

        # The updated instance requirements for attribute-based instance type selection. Changes to instance
        # requirements affect which instance types Amazon ECS selects for new instances.
        @[JSON::Field(key: "instanceRequirements")]
        getter instance_requirements : Types::InstanceRequirementsRequest?

        # CloudWatch provides two categories of monitoring: basic monitoring and detailed monitoring. By
        # default, your managed instance is configured for basic monitoring. You can optionally enable
        # detailed monitoring to help you more quickly identify and act on operational issues. You can enable
        # or turn off detailed monitoring at launch or when the managed instance is running or stopped. For
        # more information, see Detailed monitoring for Amazon ECS Managed Instances in the Amazon ECS
        # Developer Guide.
        @[JSON::Field(key: "monitoring")]
        getter monitoring : String?

        # The updated network configuration for Amazon ECS Managed Instances. Changes to subnets and security
        # groups affect new instances launched after the update.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::ManagedInstancesNetworkConfiguration?

        # The updated storage configuration for Amazon ECS Managed Instances. Changes to storage settings
        # apply to new instances launched after the update.
        @[JSON::Field(key: "storageConfiguration")]
        getter storage_configuration : Types::ManagedInstancesStorageConfiguration?

        def initialize(
          @ec2_instance_profile_arn : String? = nil,
          @instance_requirements : Types::InstanceRequirementsRequest? = nil,
          @monitoring : String? = nil,
          @network_configuration : Types::ManagedInstancesNetworkConfiguration? = nil,
          @storage_configuration : Types::ManagedInstancesStorageConfiguration? = nil
        )
        end
      end

      # The instance requirements for attribute-based instance type selection. Instead of specifying exact
      # instance types, you define requirements such as vCPU count, memory size, network performance, and
      # accelerator specifications. Amazon ECS automatically selects Amazon EC2 instance types that match
      # these requirements, providing flexibility and helping to mitigate capacity constraints.
      struct InstanceRequirementsRequest
        include JSON::Serializable

        # The minimum and maximum amount of memory in mebibytes (MiB) for the instance types. Amazon ECS
        # selects instance types that have memory within this range.
        @[JSON::Field(key: "memoryMiB")]
        getter memory_mi_b : Types::MemoryMiBRequest

        # The minimum and maximum number of vCPUs for the instance types. Amazon ECS selects instance types
        # that have vCPU counts within this range.
        @[JSON::Field(key: "vCpuCount")]
        getter v_cpu_count : Types::VCpuCountRangeRequest

        # The minimum and maximum number of accelerators for the instance types. This is used when you need
        # instances with specific numbers of GPUs or other accelerators.
        @[JSON::Field(key: "acceleratorCount")]
        getter accelerator_count : Types::AcceleratorCountRequest?

        # The accelerator manufacturers to include. You can specify nvidia , amd , amazon-web-services , or
        # xilinx depending on your accelerator requirements.
        @[JSON::Field(key: "acceleratorManufacturers")]
        getter accelerator_manufacturers : Array(String)?

        # The specific accelerator names to include. For example, you can specify a100 , v100 , k80 , or other
        # specific accelerator models.
        @[JSON::Field(key: "acceleratorNames")]
        getter accelerator_names : Array(String)?

        # The minimum and maximum total accelerator memory in mebibytes (MiB). This is important for GPU
        # workloads that require specific amounts of video memory.
        @[JSON::Field(key: "acceleratorTotalMemoryMiB")]
        getter accelerator_total_memory_mi_b : Types::AcceleratorTotalMemoryMiBRequest?

        # The accelerator types to include. You can specify gpu for graphics processing units, fpga for field
        # programmable gate arrays, or inference for machine learning inference accelerators.
        @[JSON::Field(key: "acceleratorTypes")]
        getter accelerator_types : Array(String)?

        # The instance types to include in the selection. When specified, Amazon ECS only considers these
        # instance types, subject to the other requirements specified.
        @[JSON::Field(key: "allowedInstanceTypes")]
        getter allowed_instance_types : Array(String)?

        # Indicates whether to include bare metal instance types. Set to included to allow bare metal
        # instances, excluded to exclude them, or required to use only bare metal instances.
        @[JSON::Field(key: "bareMetal")]
        getter bare_metal : String?

        # The minimum and maximum baseline Amazon EBS bandwidth in megabits per second (Mbps). This is
        # important for workloads with high storage I/O requirements.
        @[JSON::Field(key: "baselineEbsBandwidthMbps")]
        getter baseline_ebs_bandwidth_mbps : Types::BaselineEbsBandwidthMbpsRequest?

        # Indicates whether to include burstable performance instance types (T2, T3, T3a, T4g). Set to
        # included to allow burstable instances, excluded to exclude them, or required to use only burstable
        # instances.
        @[JSON::Field(key: "burstablePerformance")]
        getter burstable_performance : String?

        # The CPU manufacturers to include or exclude. You can specify intel , amd , or amazon-web-services to
        # control which CPU types are used for your workloads.
        @[JSON::Field(key: "cpuManufacturers")]
        getter cpu_manufacturers : Array(String)?

        # The instance types to exclude from selection. Use this to prevent Amazon ECS from selecting specific
        # instance types that may not be suitable for your workloads.
        @[JSON::Field(key: "excludedInstanceTypes")]
        getter excluded_instance_types : Array(String)?

        # The instance generations to include. You can specify current to use the latest generation instances,
        # or previous to include previous generation instances for cost optimization.
        @[JSON::Field(key: "instanceGenerations")]
        getter instance_generations : Array(String)?

        # Indicates whether to include instance types with local storage. Set to included to allow local
        # storage, excluded to exclude it, or required to use only instances with local storage.
        @[JSON::Field(key: "localStorage")]
        getter local_storage : String?

        # The local storage types to include. You can specify hdd for hard disk drives, ssd for solid state
        # drives, or both.
        @[JSON::Field(key: "localStorageTypes")]
        getter local_storage_types : Array(String)?

        # The maximum price for Spot instances as a percentage of the optimal On-Demand price. This provides
        # more precise cost control for Spot instance selection.
        @[JSON::Field(key: "maxSpotPriceAsPercentageOfOptimalOnDemandPrice")]
        getter max_spot_price_as_percentage_of_optimal_on_demand_price : Int32?

        # The minimum and maximum amount of memory per vCPU in gibibytes (GiB). This helps ensure that
        # instance types have the appropriate memory-to-CPU ratio for your workloads.
        @[JSON::Field(key: "memoryGiBPerVCpu")]
        getter memory_gi_b_per_v_cpu : Types::MemoryGiBPerVCpuRequest?

        # The minimum and maximum network bandwidth in gigabits per second (Gbps). This is crucial for
        # network-intensive workloads that require high throughput.
        @[JSON::Field(key: "networkBandwidthGbps")]
        getter network_bandwidth_gbps : Types::NetworkBandwidthGbpsRequest?

        # The minimum and maximum number of network interfaces for the instance types. This is useful for
        # workloads that require multiple network interfaces.
        @[JSON::Field(key: "networkInterfaceCount")]
        getter network_interface_count : Types::NetworkInterfaceCountRequest?

        # The price protection threshold for On-Demand Instances, as a percentage higher than an identified
        # On-Demand price. The identified On-Demand price is the price of the lowest priced current generation
        # C, M, or R instance type with your specified attributes. If no current generation C, M, or R
        # instance type matches your attributes, then the identified price is from either the lowest priced
        # current generation instance types or, failing that, the lowest priced previous generation instance
        # types that match your attributes. When Amazon ECS selects instance types with your attributes, we
        # will exclude instance types whose price exceeds your specified threshold.
        @[JSON::Field(key: "onDemandMaxPricePercentageOverLowestPrice")]
        getter on_demand_max_price_percentage_over_lowest_price : Int32?

        # Indicates whether the instance types must support hibernation. When set to true , only instance
        # types that support hibernation are selected.
        @[JSON::Field(key: "requireHibernateSupport")]
        getter require_hibernate_support : Bool?

        # The maximum price for Spot instances as a percentage over the lowest priced On-Demand instance. This
        # helps control Spot instance costs while maintaining access to capacity.
        @[JSON::Field(key: "spotMaxPricePercentageOverLowestPrice")]
        getter spot_max_price_percentage_over_lowest_price : Int32?

        # The minimum and maximum total local storage in gigabytes (GB) for instance types with local storage.
        @[JSON::Field(key: "totalLocalStorageGB")]
        getter total_local_storage_gb : Types::TotalLocalStorageGBRequest?

        def initialize(
          @memory_mi_b : Types::MemoryMiBRequest,
          @v_cpu_count : Types::VCpuCountRangeRequest,
          @accelerator_count : Types::AcceleratorCountRequest? = nil,
          @accelerator_manufacturers : Array(String)? = nil,
          @accelerator_names : Array(String)? = nil,
          @accelerator_total_memory_mi_b : Types::AcceleratorTotalMemoryMiBRequest? = nil,
          @accelerator_types : Array(String)? = nil,
          @allowed_instance_types : Array(String)? = nil,
          @bare_metal : String? = nil,
          @baseline_ebs_bandwidth_mbps : Types::BaselineEbsBandwidthMbpsRequest? = nil,
          @burstable_performance : String? = nil,
          @cpu_manufacturers : Array(String)? = nil,
          @excluded_instance_types : Array(String)? = nil,
          @instance_generations : Array(String)? = nil,
          @local_storage : String? = nil,
          @local_storage_types : Array(String)? = nil,
          @max_spot_price_as_percentage_of_optimal_on_demand_price : Int32? = nil,
          @memory_gi_b_per_v_cpu : Types::MemoryGiBPerVCpuRequest? = nil,
          @network_bandwidth_gbps : Types::NetworkBandwidthGbpsRequest? = nil,
          @network_interface_count : Types::NetworkInterfaceCountRequest? = nil,
          @on_demand_max_price_percentage_over_lowest_price : Int32? = nil,
          @require_hibernate_support : Bool? = nil,
          @spot_max_price_percentage_over_lowest_price : Int32? = nil,
          @total_local_storage_gb : Types::TotalLocalStorageGBRequest? = nil
        )
        end
      end

      # The specified parameter isn't valid. Review the available parameters for the API request. For more
      # information about service event errors, see Amazon ECS service event messages .
      struct InvalidParameterException
        include JSON::Serializable

        def initialize
        end
      end

      # The Linux capabilities to add or remove from the default Docker configuration for a container
      # defined in the task definition. For more detailed information about these Linux capabilities, see
      # the capabilities(7) Linux manual page. The following describes how Docker processes the Linux
      # capabilities specified in the add and drop request parameters. For information about the latest
      # behavior, see Docker Compose: order of cap_drop and cap_add in the Docker Community Forum. When the
      # container is a privleged container, the container capabilities are all of the default Docker
      # capabilities. The capabilities specified in the add request parameter, and the drop request
      # parameter are ignored. When the add request parameter is set to ALL, the container capabilities are
      # all of the default Docker capabilities, excluding those specified in the drop request parameter.
      # When the drop request parameter is set to ALL, the container capabilities are the capabilities
      # specified in the add request parameter. When the add request parameter and the drop request
      # parameter are both empty, the capabilities the container capabilities are all of the default Docker
      # capabilities. The default is to first drop the capabilities specified in the drop request parameter,
      # and then add the capabilities specified in the add request parameter.
      struct KernelCapabilities
        include JSON::Serializable

        # The Linux capabilities for the container that have been added to the default configuration provided
        # by Docker. This parameter maps to CapAdd in the docker container create command and the --cap-add
        # option to docker run. Tasks launched on Fargate only support adding the SYS_PTRACE kernel
        # capability. Valid values: "ALL" | "AUDIT_CONTROL" | "AUDIT_WRITE" | "BLOCK_SUSPEND" | "CHOWN" |
        # "DAC_OVERRIDE" | "DAC_READ_SEARCH" | "FOWNER" | "FSETID" | "IPC_LOCK" | "IPC_OWNER" | "KILL" |
        # "LEASE" | "LINUX_IMMUTABLE" | "MAC_ADMIN" | "MAC_OVERRIDE" | "MKNOD" | "NET_ADMIN" |
        # "NET_BIND_SERVICE" | "NET_BROADCAST" | "NET_RAW" | "SETFCAP" | "SETGID" | "SETPCAP" | "SETUID" |
        # "SYS_ADMIN" | "SYS_BOOT" | "SYS_CHROOT" | "SYS_MODULE" | "SYS_NICE" | "SYS_PACCT" | "SYS_PTRACE" |
        # "SYS_RAWIO" | "SYS_RESOURCE" | "SYS_TIME" | "SYS_TTY_CONFIG" | "SYSLOG" | "WAKE_ALARM"
        @[JSON::Field(key: "add")]
        getter add : Array(String)?

        # The Linux capabilities for the container that have been removed from the default configuration
        # provided by Docker. This parameter maps to CapDrop in the docker container create command and the
        # --cap-drop option to docker run. Valid values: "ALL" | "AUDIT_CONTROL" | "AUDIT_WRITE" |
        # "BLOCK_SUSPEND" | "CHOWN" | "DAC_OVERRIDE" | "DAC_READ_SEARCH" | "FOWNER" | "FSETID" | "IPC_LOCK" |
        # "IPC_OWNER" | "KILL" | "LEASE" | "LINUX_IMMUTABLE" | "MAC_ADMIN" | "MAC_OVERRIDE" | "MKNOD" |
        # "NET_ADMIN" | "NET_BIND_SERVICE" | "NET_BROADCAST" | "NET_RAW" | "SETFCAP" | "SETGID" | "SETPCAP" |
        # "SETUID" | "SYS_ADMIN" | "SYS_BOOT" | "SYS_CHROOT" | "SYS_MODULE" | "SYS_NICE" | "SYS_PACCT" |
        # "SYS_PTRACE" | "SYS_RAWIO" | "SYS_RESOURCE" | "SYS_TIME" | "SYS_TTY_CONFIG" | "SYSLOG" |
        # "WAKE_ALARM"
        @[JSON::Field(key: "drop")]
        getter drop : Array(String)?

        def initialize(
          @add : Array(String)? = nil,
          @drop : Array(String)? = nil
        )
        end
      end

      # A key-value pair object.
      struct KeyValuePair
        include JSON::Serializable

        # The name of the key-value pair. For environment variables, this is the name of the environment
        # variable.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The value of the key-value pair. For environment variables, this is the value of the environment
        # variable.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The limit for the resource was exceeded.
      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for linear deployment strategy that shifts production traffic in equal percentage
      # increments with configurable wait times between each step until 100% of traffic is shifted to the
      # new service revision. This is only valid when you run CreateService or UpdateService with
      # deploymentController set to ECS and a deploymentConfiguration with a strategy set to LINEAR .
      struct LinearConfiguration
        include JSON::Serializable

        # The amount of time in minutes to wait between each traffic shifting step during a linear deployment.
        # Valid values are 0 to 1440 minutes (24 hours). The default value is 6. This bake time is not applied
        # after reaching 100 percent traffic.
        @[JSON::Field(key: "stepBakeTimeInMinutes")]
        getter step_bake_time_in_minutes : Int32?

        # The percentage of production traffic to shift in each step during a linear deployment. Valid values
        # are multiples of 0.1 from 3.0 to 100.0. The default value is 10.0.
        @[JSON::Field(key: "stepPercent")]
        getter step_percent : Float64?

        def initialize(
          @step_bake_time_in_minutes : Int32? = nil,
          @step_percent : Float64? = nil
        )
        end
      end

      # The Linux-specific options that are applied to the container, such as Linux KernelCapabilities .
      struct LinuxParameters
        include JSON::Serializable

        # The Linux capabilities for the container that are added to or dropped from the default configuration
        # provided by Docker. For tasks that use the Fargate launch type, capabilities is supported for all
        # platform versions but the add parameter is only supported if using platform version 1.4.0 or later.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Types::KernelCapabilities?

        # Any host devices to expose to the container. This parameter maps to Devices in the docker container
        # create command and the --device option to docker run. If you're using tasks that use the Fargate
        # launch type, the devices parameter isn't supported.
        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::Device)?

        # Run an init process inside the container that forwards signals and reaps processes. This parameter
        # maps to the --init option to docker run. This parameter requires version 1.25 of the Docker Remote
        # API or greater on your container instance. To check the Docker Remote API version on your container
        # instance, log in to your container instance and run the following command: sudo docker version
        # --format '{{.Server.APIVersion}}'
        @[JSON::Field(key: "initProcessEnabled")]
        getter init_process_enabled : Bool?

        # The total amount of swap memory (in MiB) a container can use. This parameter will be translated to
        # the --memory-swap option to docker run where the value would be the sum of the container memory plus
        # the maxSwap value. If a maxSwap value of 0 is specified, the container will not use swap. Accepted
        # values are 0 or any positive integer. If the maxSwap parameter is omitted, the container will use
        # the swap configuration for the container instance it is running on. A maxSwap value must be set for
        # the swappiness parameter to be used. If you're using tasks that use the Fargate launch type, the
        # maxSwap parameter isn't supported. If you're using tasks on Amazon Linux 2023 the swappiness
        # parameter isn't supported.
        @[JSON::Field(key: "maxSwap")]
        getter max_swap : Int32?

        # The value for the size (in MiB) of the /dev/shm volume. This parameter maps to the --shm-size option
        # to docker run. If you are using tasks that use the Fargate launch type, the sharedMemorySize
        # parameter is not supported.
        @[JSON::Field(key: "sharedMemorySize")]
        getter shared_memory_size : Int32?

        # This allows you to tune a container's memory swappiness behavior. A swappiness value of 0 will cause
        # swapping to not happen unless absolutely necessary. A swappiness value of 100 will cause pages to be
        # swapped very aggressively. Accepted values are whole numbers between 0 and 100 . If the swappiness
        # parameter is not specified, a default value of 60 is used. If a value is not specified for maxSwap
        # then this parameter is ignored. This parameter maps to the --memory-swappiness option to docker run.
        # If you're using tasks that use the Fargate launch type, the swappiness parameter isn't supported. If
        # you're using tasks on Amazon Linux 2023 the swappiness parameter isn't supported.
        @[JSON::Field(key: "swappiness")]
        getter swappiness : Int32?

        # The container path, mount options, and size (in MiB) of the tmpfs mount. This parameter maps to the
        # --tmpfs option to docker run. If you're using tasks that use the Fargate launch type, the tmpfs
        # parameter isn't supported.
        @[JSON::Field(key: "tmpfs")]
        getter tmpfs : Array(Types::Tmpfs)?

        def initialize(
          @capabilities : Types::KernelCapabilities? = nil,
          @devices : Array(Types::Device)? = nil,
          @init_process_enabled : Bool? = nil,
          @max_swap : Int32? = nil,
          @shared_memory_size : Int32? = nil,
          @swappiness : Int32? = nil,
          @tmpfs : Array(Types::Tmpfs)? = nil
        )
        end
      end

      struct ListAccountSettingsRequest
        include JSON::Serializable

        # Determines whether to return the effective settings. If true , the account settings for the root
        # user or the default setting for the principalArn are returned. If false , the account settings for
        # the principalArn are returned if they're set. Otherwise, no account settings are returned.
        @[JSON::Field(key: "effectiveSettings")]
        getter effective_settings : Bool?

        # The maximum number of account setting results returned by ListAccountSettings in paginated output.
        # When this parameter is used, ListAccountSettings only returns maxResults results in a single page
        # along with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another ListAccountSettings request with the returned nextToken value. This value can be
        # between 1 and 10. If this parameter isn't used, then ListAccountSettings returns up to 10 results
        # and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The name of the account setting you want to list the settings for.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The nextToken value returned from a ListAccountSettings request indicating that more results are
        # available to fulfill the request and further calls will be needed. If maxResults was provided, it's
        # possible the number of results to be fewer than maxResults . This token should be treated as an
        # opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The ARN of the principal, which can be a user, role, or the root user. If this field is omitted, the
        # account settings are listed only for the authenticated user. In order to use this parameter, you
        # must be the root user, or the principal. Federated users assume the account setting of the root user
        # and can't have explicit account settings set for them.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        # The value of the account settings to filter results with. You must also specify an account setting
        # name to use this parameter.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @effective_settings : Bool? = nil,
          @max_results : Int32? = nil,
          @name : String? = nil,
          @next_token : String? = nil,
          @principal_arn : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct ListAccountSettingsResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListAccountSettings request. When the results of a
        # ListAccountSettings request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The account settings for the resource.
        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::Setting)?

        def initialize(
          @next_token : String? = nil,
          @settings : Array(Types::Setting)? = nil
        )
        end
      end

      struct ListAttributesRequest
        include JSON::Serializable

        # The type of the target to list attributes with.
        @[JSON::Field(key: "targetType")]
        getter target_type : String

        # The name of the attribute to filter the results with.
        @[JSON::Field(key: "attributeName")]
        getter attribute_name : String?

        # The value of the attribute to filter results with. You must also specify an attribute name to use
        # this parameter.
        @[JSON::Field(key: "attributeValue")]
        getter attribute_value : String?

        # The short name or full Amazon Resource Name (ARN) of the cluster to list attributes. If you do not
        # specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The maximum number of cluster results that ListAttributes returned in paginated output. When this
        # parameter is used, ListAttributes only returns maxResults results in a single page along with a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another ListAttributes request with the returned nextToken value. This value can be between 1 and
        # 100. If this parameter isn't used, then ListAttributes returns up to 100 results and a nextToken
        # value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListAttributes request indicating that more results are
        # available to fulfill the request and further calls are needed. If maxResults was provided, it's
        # possible the number of results to be fewer than maxResults . This token should be treated as an
        # opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @target_type : String,
          @attribute_name : String? = nil,
          @attribute_value : String? = nil,
          @cluster : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAttributesResponse
        include JSON::Serializable

        # A list of attribute objects that meet the criteria of the request.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        # The nextToken value to include in a future ListAttributes request. When the results of a
        # ListAttributes request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListClustersRequest
        include JSON::Serializable

        # The maximum number of cluster results that ListClusters returned in paginated output. When this
        # parameter is used, ListClusters only returns maxResults results in a single page along with a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another ListClusters request with the returned nextToken value. This value can be between 1 and 100.
        # If this parameter isn't used, then ListClusters returns up to 100 results and a nextToken value if
        # applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListClusters request indicating that more results are available
        # to fulfill the request and further calls are needed. If maxResults was provided, it's possible the
        # number of results to be fewer than maxResults . This token should be treated as an opaque identifier
        # that is only used to retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListClustersResponse
        include JSON::Serializable

        # The list of full Amazon Resource Name (ARN) entries for each cluster that's associated with your
        # account.
        @[JSON::Field(key: "clusterArns")]
        getter cluster_arns : Array(String)?

        # The nextToken value to include in a future ListClusters request. When the results of a ListClusters
        # request exceed maxResults , this value can be used to retrieve the next page of results. This value
        # is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @cluster_arns : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListContainerInstancesRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instances
        # to list. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # You can filter the results of a ListContainerInstances operation with cluster query language
        # statements. For more information, see Cluster Query Language in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "filter")]
        getter filter : String?

        # The maximum number of container instance results that ListContainerInstances returned in paginated
        # output. When this parameter is used, ListContainerInstances only returns maxResults results in a
        # single page along with a nextToken response element. The remaining results of the initial request
        # can be seen by sending another ListContainerInstances request with the returned nextToken value.
        # This value can be between 1 and 100. If this parameter isn't used, then ListContainerInstances
        # returns up to 100 results and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListContainerInstances request indicating that more results are
        # available to fulfill the request and further calls are needed. If maxResults was provided, it's
        # possible the number of results to be fewer than maxResults . This token should be treated as an
        # opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filters the container instances by status. For example, if you specify the DRAINING status, the
        # results include only container instances that have been set to DRAINING using
        # UpdateContainerInstancesState . If you don't specify this parameter, the The default is to include
        # container instances set to all states other than INACTIVE .
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @cluster : String? = nil,
          @filter : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListContainerInstancesResponse
        include JSON::Serializable

        # The list of container instances with full ARN entries for each container instance associated with
        # the specified cluster.
        @[JSON::Field(key: "containerInstanceArns")]
        getter container_instance_arns : Array(String)?

        # The nextToken value to include in a future ListContainerInstances request. When the results of a
        # ListContainerInstances request exceed maxResults , this value can be used to retrieve the next page
        # of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @container_instance_arns : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServiceDeploymentsRequest
        include JSON::Serializable

        # The ARN or name of the service
        @[JSON::Field(key: "service")]
        getter service : String

        # The cluster that hosts the service. This can either be the cluster name or ARN. Starting April 15,
        # 2023, Amazon Web Services will not onboard new customers to Amazon Elastic Inference (EI), and will
        # help current customers migrate their workloads to options that offer better price and performance.
        # If you don't specify a cluster, default is used.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # An optional filter you can use to narrow the results by the service creation date. If you do not
        # specify a value, the result includes all services created before the current time. The format is
        # yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Types::CreatedAt?

        # The maximum number of service deployment results that ListServiceDeployments returned in paginated
        # output. When this parameter is used, ListServiceDeployments only returns maxResults results in a
        # single page along with a nextToken response element. The remaining results of the initial request
        # can be seen by sending another ListServiceDeployments request with the returned nextToken value.
        # This value can be between 1 and 100. If this parameter isn't used, then ListServiceDeployments
        # returns up to 20 results and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListServiceDeployments request indicating that more results are
        # available to fulfill the request and further calls are needed. If you provided maxResults , it's
        # possible the number of results is fewer than maxResults .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional filter you can use to narrow the results. If you do not specify a status, then all
        # status values are included in the result.
        @[JSON::Field(key: "status")]
        getter status : Array(String)?

        def initialize(
          @service : String,
          @cluster : String? = nil,
          @created_at : Types::CreatedAt? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : Array(String)? = nil
        )
        end
      end

      struct ListServiceDeploymentsResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListServiceDeployments request. When the results of a
        # ListServiceDeployments request exceed maxResults , this value can be used to retrieve the next page
        # of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An overview of the service deployment, including the following properties: The ARN of the service
        # deployment. The ARN of the service being deployed. The ARN of the cluster that hosts the service in
        # the service deployment. The time that the service deployment started. The time that the service
        # deployment completed. The service deployment status. Information about why the service deployment is
        # in the current state. The ARN of the service revision that is being deployed.
        @[JSON::Field(key: "serviceDeployments")]
        getter service_deployments : Array(Types::ServiceDeploymentBrief)?

        def initialize(
          @next_token : String? = nil,
          @service_deployments : Array(Types::ServiceDeploymentBrief)? = nil
        )
        end
      end

      struct ListServicesByNamespaceRequest
        include JSON::Serializable

        # The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace to list the
        # services in. Tasks that run in a namespace can use short names to connect to services in the
        # namespace. Tasks can connect to services across all of the clusters in the namespace. Tasks connect
        # through a managed proxy container that collects logs and metrics for increased visibility. Only the
        # tasks that Amazon ECS services create are supported with Service Connect. For more information, see
        # Service Connect in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "namespace")]
        getter namespace : String

        # The maximum number of service results that ListServicesByNamespace returns in paginated output. When
        # this parameter is used, ListServicesByNamespace only returns maxResults results in a single page
        # along with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another ListServicesByNamespace request with the returned nextToken value. This value can be
        # between 1 and 100. If this parameter isn't used, then ListServicesByNamespace returns up to 10
        # results and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value that's returned from a ListServicesByNamespace request. It indicates that more
        # results are available to fulfill the request and further calls are needed. If maxResults is
        # returned, it is possible the number of results is less than maxResults .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @namespace : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListServicesByNamespaceResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListServicesByNamespace request. When the results of a
        # ListServicesByNamespace request exceed maxResults , this value can be used to retrieve the next page
        # of results. When there are no more results to return, this value is null .
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of full ARN entries for each service that's associated with the specified namespace.
        @[JSON::Field(key: "serviceArns")]
        getter service_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @service_arns : Array(String)? = nil
        )
        end
      end

      struct ListServicesRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster to use when filtering the
        # ListServices results. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The launch type to use when filtering the ListServices results.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The maximum number of service results that ListServices returned in paginated output. When this
        # parameter is used, ListServices only returns maxResults results in a single page along with a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another ListServices request with the returned nextToken value. This value can be between 1 and 100.
        # If this parameter isn't used, then ListServices returns up to 10 results and a nextToken value if
        # applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListServices request indicating that more results are available
        # to fulfill the request and further calls will be needed. If maxResults was provided, it is possible
        # the number of results to be fewer than maxResults . This token should be treated as an opaque
        # identifier that is only used to retrieve the next items in a list and not for other programmatic
        # purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The resourceManagementType type to use when filtering the ListServices results.
        @[JSON::Field(key: "resourceManagementType")]
        getter resource_management_type : String?

        # The scheduling strategy to use when filtering the ListServices results.
        @[JSON::Field(key: "schedulingStrategy")]
        getter scheduling_strategy : String?

        def initialize(
          @cluster : String? = nil,
          @launch_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @resource_management_type : String? = nil,
          @scheduling_strategy : String? = nil
        )
        end
      end

      struct ListServicesResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListServices request. When the results of a ListServices
        # request exceed maxResults , this value can be used to retrieve the next page of results. This value
        # is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of full ARN entries for each service that's associated with the specified cluster.
        @[JSON::Field(key: "serviceArns")]
        getter service_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @service_arns : Array(String)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags for. Currently, the
        # supported resources are Amazon ECS tasks, services, task definitions, clusters, and container
        # instances.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags for the resource.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct ListTaskDefinitionFamiliesRequest
        include JSON::Serializable

        # The familyPrefix is a string that's used to filter the results of ListTaskDefinitionFamilies . If
        # you specify a familyPrefix , only task definition family names that begin with the familyPrefix
        # string are returned.
        @[JSON::Field(key: "familyPrefix")]
        getter family_prefix : String?

        # The maximum number of task definition family results that ListTaskDefinitionFamilies returned in
        # paginated output. When this parameter is used, ListTaskDefinitions only returns maxResults results
        # in a single page along with a nextToken response element. The remaining results of the initial
        # request can be seen by sending another ListTaskDefinitionFamilies request with the returned
        # nextToken value. This value can be between 1 and 100. If this parameter isn't used, then
        # ListTaskDefinitionFamilies returns up to 100 results and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListTaskDefinitionFamilies request indicating that more results
        # are available to fulfill the request and further calls will be needed. If maxResults was provided,
        # it is possible the number of results to be fewer than maxResults . This token should be treated as
        # an opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The task definition family status to filter the ListTaskDefinitionFamilies results with. By default,
        # both ACTIVE and INACTIVE task definition families are listed. If this parameter is set to ACTIVE ,
        # only task definition families that have an ACTIVE task definition revision are returned. If this
        # parameter is set to INACTIVE , only task definition families that do not have any ACTIVE task
        # definition revisions are returned. If you paginate the resulting output, be sure to keep the status
        # value constant in each subsequent request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @family_prefix : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListTaskDefinitionFamiliesResponse
        include JSON::Serializable

        # The list of task definition family names that match the ListTaskDefinitionFamilies request.
        @[JSON::Field(key: "families")]
        getter families : Array(String)?

        # The nextToken value to include in a future ListTaskDefinitionFamilies request. When the results of a
        # ListTaskDefinitionFamilies request exceed maxResults , this value can be used to retrieve the next
        # page of results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @families : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTaskDefinitionsRequest
        include JSON::Serializable

        # The full family name to filter the ListTaskDefinitions results with. Specifying a familyPrefix
        # limits the listed task definitions to task definition revisions that belong to that family.
        @[JSON::Field(key: "familyPrefix")]
        getter family_prefix : String?

        # The maximum number of task definition results that ListTaskDefinitions returned in paginated output.
        # When this parameter is used, ListTaskDefinitions only returns maxResults results in a single page
        # along with a nextToken response element. The remaining results of the initial request can be seen by
        # sending another ListTaskDefinitions request with the returned nextToken value. This value can be
        # between 1 and 100. If this parameter isn't used, then ListTaskDefinitions returns up to 100 results
        # and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListTaskDefinitions request indicating that more results are
        # available to fulfill the request and further calls will be needed. If maxResults was provided, it is
        # possible the number of results to be fewer than maxResults . This token should be treated as an
        # opaque identifier that is only used to retrieve the next items in a list and not for other
        # programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The order to sort the results in. Valid values are ASC and DESC . By default, ( ASC ) task
        # definitions are listed lexicographically by family name and in ascending numerical order by revision
        # so that the newest task definitions in a family are listed last. Setting this parameter to DESC
        # reverses the sort order on family name and revision. This is so that the newest task definitions in
        # a family are listed first.
        @[JSON::Field(key: "sort")]
        getter sort : String?

        # The task definition status to filter the ListTaskDefinitions results with. By default, only ACTIVE
        # task definitions are listed. By setting this parameter to INACTIVE , you can view task definitions
        # that are INACTIVE as long as an active task or service still references them. If you paginate the
        # resulting output, be sure to keep the status value constant in each subsequent request.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @family_prefix : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @sort : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListTaskDefinitionsResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListTaskDefinitions request. When the results of a
        # ListTaskDefinitions request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of task definition Amazon Resource Name (ARN) entries for the ListTaskDefinitions request.
        @[JSON::Field(key: "taskDefinitionArns")]
        getter task_definition_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @task_definition_arns : Array(String)? = nil
        )
        end
      end

      struct ListTasksRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster to use when filtering the ListTasks
        # results. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The container instance ID or full ARN of the container instance to use when filtering the ListTasks
        # results. Specifying a containerInstance limits the results to tasks that belong to that container
        # instance.
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : String?

        # The task desired status to use when filtering the ListTasks results. Specifying a desiredStatus of
        # STOPPED limits the results to tasks that Amazon ECS has set the desired status to STOPPED . This can
        # be useful for debugging tasks that aren't starting properly or have died or finished. The default
        # status filter is RUNNING , which shows tasks that Amazon ECS has set the desired status to RUNNING .
        # Although you can filter results based on a desired status of PENDING , this doesn't return any
        # results. Amazon ECS never sets the desired status of a task to that value (only a task's lastStatus
        # may have a value of PENDING ).
        @[JSON::Field(key: "desiredStatus")]
        getter desired_status : String?

        # The name of the task definition family to use when filtering the ListTasks results. Specifying a
        # family limits the results to tasks that belong to that family.
        @[JSON::Field(key: "family")]
        getter family : String?

        # The launch type to use when filtering the ListTasks results.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The maximum number of task results that ListTasks returned in paginated output. When this parameter
        # is used, ListTasks only returns maxResults results in a single page along with a nextToken response
        # element. The remaining results of the initial request can be seen by sending another ListTasks
        # request with the returned nextToken value. This value can be between 1 and 100. If this parameter
        # isn't used, then ListTasks returns up to 100 results and a nextToken value if applicable.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a ListTasks request indicating that more results are available to
        # fulfill the request and further calls will be needed. If maxResults was provided, it's possible the
        # number of results to be fewer than maxResults . This token should be treated as an opaque identifier
        # that is only used to retrieve the next items in a list and not for other programmatic purposes.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the service to use when filtering the ListTasks results. Specifying a serviceName limits
        # the results to tasks that belong to that service.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The startedBy value to filter the task results with. Specifying a startedBy value limits the results
        # to tasks that were started with that value. When you specify startedBy as the filter, it must be the
        # only filter that you use.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        def initialize(
          @cluster : String? = nil,
          @container_instance : String? = nil,
          @desired_status : String? = nil,
          @family : String? = nil,
          @launch_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_name : String? = nil,
          @started_by : String? = nil
        )
        end
      end

      struct ListTasksResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListTasks request. When the results of a ListTasks
        # request exceed maxResults , this value can be used to retrieve the next page of results. This value
        # is null when there are no more results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of task ARN entries for the ListTasks request.
        @[JSON::Field(key: "taskArns")]
        getter task_arns : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @task_arns : Array(String)? = nil
        )
        end
      end

      # The load balancer configuration to use with a service or task set. When you add, update, or remove a
      # load balancer configuration, Amazon ECS starts a new deployment with the updated Elastic Load
      # Balancing configuration. This causes tasks to register to and deregister from load balancers. We
      # recommend that you verify this on a test environment before you update the Elastic Load Balancing
      # configuration. A service-linked role is required for services that use multiple target groups. For
      # more information, see Using service-linked roles in the Amazon Elastic Container Service Developer
      # Guide .
      struct LoadBalancer
        include JSON::Serializable

        # The advanced settings for the load balancer used in blue/green deployments. Specify the alternate
        # target group, listener rules, and IAM role required for traffic shifting during blue/green
        # deployments.
        @[JSON::Field(key: "advancedConfiguration")]
        getter advanced_configuration : Types::AdvancedConfiguration?

        # The name of the container (as it appears in a container definition) to associate with the load
        # balancer. You need to specify the container name when configuring the target group for an Amazon ECS
        # load balancer.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The port on the container to associate with the load balancer. This port must correspond to a
        # containerPort in the task definition the tasks in the service are using. For tasks that use the EC2
        # launch type, the container instance they're launched on must allow ingress traffic on the hostPort
        # of the port mapping.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32?

        # The name of the load balancer to associate with the Amazon ECS service or task set. If you are using
        # an Application Load Balancer or a Network Load Balancer the load balancer name parameter should be
        # omitted.
        @[JSON::Field(key: "loadBalancerName")]
        getter load_balancer_name : String?

        # The full Amazon Resource Name (ARN) of the Elastic Load Balancing target group or groups associated
        # with a service or task set. A target group ARN is only specified when using an Application Load
        # Balancer or Network Load Balancer. For services using the ECS deployment controller, you can specify
        # one or multiple target groups. For more information, see Registering multiple target groups with a
        # service in the Amazon Elastic Container Service Developer Guide . For services using the CODE_DEPLOY
        # deployment controller, you're required to define two target groups for the load balancer. For more
        # information, see Blue/green deployment with CodeDeploy in the Amazon Elastic Container Service
        # Developer Guide . If your service's task definition uses the awsvpc network mode, you must choose ip
        # as the target type, not instance . Do this when creating your target groups because tasks that use
        # the awsvpc network mode are associated with an elastic network interface, not an Amazon EC2
        # instance. This network mode is required for the Fargate launch type.
        @[JSON::Field(key: "targetGroupArn")]
        getter target_group_arn : String?

        def initialize(
          @advanced_configuration : Types::AdvancedConfiguration? = nil,
          @container_name : String? = nil,
          @container_port : Int32? = nil,
          @load_balancer_name : String? = nil,
          @target_group_arn : String? = nil
        )
        end
      end

      # The log configuration for the container. This parameter maps to LogConfig in the docker container
      # create command and the --log-driver option to docker run. By default, containers use the same
      # logging driver that the Docker daemon uses. However, the container might use a different logging
      # driver than the Docker daemon by specifying a log driver configuration in the container definition.
      # Understand the following when specifying a log configuration for your containers. Amazon ECS
      # currently supports a subset of the logging drivers available to the Docker daemon. Additional log
      # drivers may be available in future releases of the Amazon ECS container agent. For tasks on Fargate,
      # the supported log drivers are awslogs , splunk , and awsfirelens . For tasks hosted on Amazon EC2
      # instances, the supported log drivers are awslogs , fluentd , gelf , json-file , journald , syslog ,
      # splunk , and awsfirelens . This parameter requires version 1.18 of the Docker Remote API or greater
      # on your container instance. For tasks that are hosted on Amazon EC2 instances, the Amazon ECS
      # container agent must register the available logging drivers with the ECS_AVAILABLE_LOGGING_DRIVERS
      # environment variable before containers placed on that instance can use these log configuration
      # options. For more information, see Amazon ECS container agent configuration in the Amazon Elastic
      # Container Service Developer Guide . For tasks that are on Fargate, because you don't have access to
      # the underlying infrastructure your tasks are hosted on, any additional software needed must be
      # installed outside of the task. For example, the Fluentd output aggregators or a remote host running
      # Logstash to send Gelf logs to.
      struct LogConfiguration
        include JSON::Serializable

        # The log driver to use for the container. For tasks on Fargate, the supported log drivers are awslogs
        # , splunk , and awsfirelens . For tasks hosted on Amazon EC2 instances, the supported log drivers are
        # awslogs , fluentd , gelf , json-file , journald , syslog , splunk , and awsfirelens . For more
        # information about using the awslogs log driver, see Send Amazon ECS logs to CloudWatch in the Amazon
        # Elastic Container Service Developer Guide . For more information about using the awsfirelens log
        # driver, see Send Amazon ECS logs to an Amazon Web Services service or Amazon Web Services Partner .
        # If you have a custom driver that isn't listed, you can fork the Amazon ECS container agent project
        # that's available on GitHub and customize it to work with that driver. We encourage you to submit
        # pull requests for changes that you would like to have included. However, we don't currently provide
        # support for running modified copies of this software.
        @[JSON::Field(key: "logDriver")]
        getter log_driver : String

        # The configuration options to send to the log driver. The options you can specify depend on the log
        # driver. Some of the options you can specify when you use the awslogs log driver to route logs to
        # Amazon CloudWatch include the following: awslogs-create-group Required: No Specify whether you want
        # the log group to be created automatically. If this option isn't specified, it defaults to false .
        # Your IAM policy must include the logs:CreateLogGroup permission before you attempt to use
        # awslogs-create-group . awslogs-region Required: Yes Specify the Amazon Web Services Region that the
        # awslogs log driver is to send your Docker logs to. You can choose to send all of your logs from
        # clusters in different Regions to a single region in CloudWatch Logs. This is so that they're all
        # visible in one location. Otherwise, you can separate them by Region for more granularity. Make sure
        # that the specified log group exists in the Region that you specify with this option. awslogs-group
        # Required: Yes Make sure to specify a log group that the awslogs log driver sends its log streams to.
        # awslogs-stream-prefix Required: Yes, when using Fargate.Optional when using EC2. Use the
        # awslogs-stream-prefix option to associate a log stream with the specified prefix, the container
        # name, and the ID of the Amazon ECS task that the container belongs to. If you specify a prefix with
        # this option, then the log stream takes the format prefix-name/container-name/ecs-task-id . If you
        # don't specify a prefix with this option, then the log stream is named after the container ID that's
        # assigned by the Docker daemon on the container instance. Because it's difficult to trace logs back
        # to the container that sent them with just the Docker container ID (which is only available on the
        # container instance), we recommend that you specify a prefix with this option. For Amazon ECS
        # services, you can use the service name as the prefix. Doing so, you can trace log streams to the
        # service that the container belongs to, the name of the container that sent them, and the ID of the
        # task that the container belongs to. You must specify a stream-prefix for your logs to have your logs
        # appear in the Log pane when using the Amazon ECS console. awslogs-datetime-format Required: No This
        # option defines a multiline start pattern in Python strftime format. A log message consists of a line
        # that matches the pattern and any following lines that don’t match the pattern. The matched line is
        # the delimiter between log messages. One example of a use case for using this format is for parsing
        # output such as a stack dump, which might otherwise be logged in multiple entries. The correct
        # pattern allows it to be captured in a single entry. For more information, see
        # awslogs-datetime-format . You cannot configure both the awslogs-datetime-format and
        # awslogs-multiline-pattern options. Multiline logging performs regular expression parsing and
        # matching of all log messages. This might have a negative impact on logging performance.
        # awslogs-multiline-pattern Required: No This option defines a multiline start pattern that uses a
        # regular expression. A log message consists of a line that matches the pattern and any following
        # lines that don’t match the pattern. The matched line is the delimiter between log messages. For more
        # information, see awslogs-multiline-pattern . This option is ignored if awslogs-datetime-format is
        # also configured. You cannot configure both the awslogs-datetime-format and awslogs-multiline-pattern
        # options. Multiline logging performs regular expression parsing and matching of all log messages.
        # This might have a negative impact on logging performance. The following options apply to all
        # supported log drivers. mode Required: No Valid values: non-blocking | blocking This option defines
        # the delivery mode of log messages from the container to the log driver specified using logDriver .
        # The delivery mode you choose affects application availability when the flow of logs from container
        # is interrupted. If you use the blocking mode and the flow of logs is interrupted, calls from
        # container code to write to the stdout and stderr streams will block. The logging thread of the
        # application will block as a result. This may cause the application to become unresponsive and lead
        # to container healthcheck failure. If you use the non-blocking mode, the container's logs are instead
        # stored in an in-memory intermediate buffer configured with the max-buffer-size option. This prevents
        # the application from becoming unresponsive when logs cannot be sent. We recommend using this mode if
        # you want to ensure service availability and are okay with some log loss. For more information, see
        # Preventing log loss with non-blocking mode in the awslogs container log driver . You can set a
        # default mode for all containers in a specific Amazon Web Services Region by using the
        # defaultLogDriverMode account setting. If you don't specify the mode option or configure the account
        # setting, Amazon ECS will default to the non-blocking mode. For more information about the account
        # setting, see Default log driver mode in the Amazon Elastic Container Service Developer Guide . On
        # June 25, 2025, Amazon ECS changed the default log driver mode from blocking to non-blocking to
        # prioritize task availability over logging. To continue using the blocking mode after this change, do
        # one of the following: Set the mode option in your container definition's logConfiguration as
        # blocking . Set the defaultLogDriverMode account setting to blocking . max-buffer-size Required: No
        # Default value: 10m When non-blocking mode is used, the max-buffer-size log option controls the size
        # of the buffer that's used for intermediate message storage. Make sure to specify an adequate buffer
        # size based on your application. When the buffer fills up, further logs cannot be stored. Logs that
        # cannot be stored are lost. To route logs using the splunk log router, you need to specify a
        # splunk-token and a splunk-url . When you use the awsfirelens log router to route logs to an Amazon
        # Web Services Service or Amazon Web Services Partner Network destination for log storage and
        # analytics, you can set the log-driver-buffer-limit option to limit the number of events that are
        # buffered in memory, before being sent to the log router container. It can help to resolve potential
        # log loss issue because high throughput might result in memory running out for the buffer inside of
        # Docker. Other options you can specify when using awsfirelens to route logs depend on the
        # destination. When you export logs to Amazon Data Firehose, you can specify the Amazon Web Services
        # Region with region and a name for the log stream with delivery_stream . When you export logs to
        # Amazon Kinesis Data Streams, you can specify an Amazon Web Services Region with region and a data
        # stream name with stream . When you export logs to Amazon OpenSearch Service, you can specify options
        # like Name , Host (OpenSearch Service endpoint without protocol), Port , Index , Type , Aws_auth ,
        # Aws_region , Suppress_Type_Name , and tls . For more information, see Under the hood: FireLens for
        # Amazon ECS Tasks . When you export logs to Amazon S3, you can specify the bucket using the bucket
        # option. You can also specify region , total_file_size , upload_timeout , and use_put_object as
        # options. This parameter requires version 1.19 of the Docker Remote API or greater on your container
        # instance. To check the Docker Remote API version on your container instance, log in to your
        # container instance and run the following command: sudo docker version --format
        # '{{.Server.APIVersion}}'
        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        # The secrets to pass to the log configuration. For more information, see Specifying sensitive data in
        # the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "secretOptions")]
        getter secret_options : Array(Types::Secret)?

        def initialize(
          @log_driver : String,
          @options : Hash(String, String)? = nil,
          @secret_options : Array(Types::Secret)? = nil
        )
        end
      end

      # Details about the managed agent status for the container.
      struct ManagedAgent
        include JSON::Serializable

        # The Unix timestamp for the time when the managed agent was last started.
        @[JSON::Field(key: "lastStartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter last_started_at : Time?

        # The last known status of the managed agent.
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        # The name of the managed agent. When the execute command feature is turned on, the managed agent name
        # is ExecuteCommandAgent .
        @[JSON::Field(key: "name")]
        getter name : String?

        # The reason for why the managed agent is in the state it is in.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @last_started_at : Time? = nil,
          @last_status : String? = nil,
          @name : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # An object representing a change in state for a managed agent.
      struct ManagedAgentStateChange
        include JSON::Serializable

        # The name of the container that's associated with the managed agent.
        @[JSON::Field(key: "containerName")]
        getter container_name : String

        # The name of the managed agent.
        @[JSON::Field(key: "managedAgentName")]
        getter managed_agent_name : String

        # The status of the managed agent.
        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the status of the managed agent.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @container_name : String,
          @managed_agent_name : String,
          @status : String,
          @reason : String? = nil
        )
        end
      end

      # The Application Auto Scaling policy created by Amazon ECS when you create an Express service.
      struct ManagedApplicationAutoScalingPolicy
        include JSON::Serializable

        # The metric used for auto scaling decisions. The available metrics are
        # ECSServiceAverageCPUUtilization , ECSServiceAverageMemoryUtilization , and ALBRequestCOuntPerTarget
        # .
        @[JSON::Field(key: "metric")]
        getter metric : String

        # The type of Application Auto Scaling policy associated with the Express service. Valid values are
        # TargetTrackingScaling , StepScaling , and PredictiveScaling .
        @[JSON::Field(key: "policyType")]
        getter policy_type : String

        # The status of Application Auto Scaling policy creation.
        @[JSON::Field(key: "status")]
        getter status : String

        # The target value for the auto scaling metric.
        @[JSON::Field(key: "targetValue")]
        getter target_value : Float64

        # The Unix timestamp for when the Application Auto Scaling policy was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the Application Auto Scaling policy associated with the Express
        # service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the Application Auto Scaling policy is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @metric : String,
          @policy_type : String,
          @status : String,
          @target_value : Float64,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The auto scaling configuration created by Amazon ECS for an Express service.
      struct ManagedAutoScaling
        include JSON::Serializable

        # The policy used for auto scaling.
        @[JSON::Field(key: "applicationAutoScalingPolicies")]
        getter application_auto_scaling_policies : Array(Types::ManagedApplicationAutoScalingPolicy)?

        # Represents a scalable target.
        @[JSON::Field(key: "scalableTarget")]
        getter scalable_target : Types::ManagedScalableTarget?

        def initialize(
          @application_auto_scaling_policies : Array(Types::ManagedApplicationAutoScalingPolicy)? = nil,
          @scalable_target : Types::ManagedScalableTarget? = nil
        )
        end
      end

      # The ACM certificate associated with the HTTPS domain created for the Express service.
      struct ManagedCertificate
        include JSON::Serializable

        # The fully qualified domain name (FQDN) that is secured with this ACM certificate.
        @[JSON::Field(key: "domainName")]
        getter domain_name : String

        # The status of the ACM; certificate.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when the ACM certificate was last updated
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the ACM certificate.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the ACM certificate is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @domain_name : String,
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The entry point into the Express service.
      struct ManagedIngressPath
        include JSON::Serializable

        # The type of access to the endpoint for the Express service.
        @[JSON::Field(key: "accessType")]
        getter access_type : String

        # The endpoint for access to the Express service.
        @[JSON::Field(key: "endpoint")]
        getter endpoint : String

        # The ACM certificate for the Express service's domain.
        @[JSON::Field(key: "certificate")]
        getter certificate : Types::ManagedCertificate?

        # The listeners associated with the Application Load Balancer.
        @[JSON::Field(key: "listener")]
        getter listener : Types::ManagedListener?

        # The Application Load Balancer associated with the Express service.
        @[JSON::Field(key: "loadBalancer")]
        getter load_balancer : Types::ManagedLoadBalancer?

        # The security groups associated with the Application Load Balancer.
        @[JSON::Field(key: "loadBalancerSecurityGroups")]
        getter load_balancer_security_groups : Array(Types::ManagedSecurityGroup)?

        # The listener rules for the Application Load Balancer.
        @[JSON::Field(key: "rule")]
        getter rule : Types::ManagedListenerRule?

        # The target groups associated with the Application Load Balancer.
        @[JSON::Field(key: "targetGroups")]
        getter target_groups : Array(Types::ManagedTargetGroup)?

        def initialize(
          @access_type : String,
          @endpoint : String,
          @certificate : Types::ManagedCertificate? = nil,
          @listener : Types::ManagedListener? = nil,
          @load_balancer : Types::ManagedLoadBalancer? = nil,
          @load_balancer_security_groups : Array(Types::ManagedSecurityGroup)? = nil,
          @rule : Types::ManagedListenerRule? = nil,
          @target_groups : Array(Types::ManagedTargetGroup)? = nil
        )
        end
      end

      # The network configuration for Amazon ECS Managed Instances. This specifies the VPC subnets and
      # security groups that instances use for network connectivity. Amazon ECS Managed Instances support
      # multiple network modes including awsvpc (instances receive ENIs for task isolation), host (instances
      # share network namespace with tasks), and none (no external network connectivity), ensuring backward
      # compatibility for migrating workloads from Fargate or Amazon EC2.
      struct ManagedInstancesNetworkConfiguration
        include JSON::Serializable

        # The list of security group IDs to apply to Amazon ECS Managed Instances. These security groups
        # control the network traffic allowed to and from the instances.
        @[JSON::Field(key: "securityGroups")]
        getter security_groups : Array(String)?

        # The list of subnet IDs where Amazon ECS can launch Amazon ECS Managed Instances. Instances are
        # distributed across the specified subnets for high availability. All subnets must be in the same VPC.
        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        def initialize(
          @security_groups : Array(String)? = nil,
          @subnets : Array(String)? = nil
        )
        end
      end

      # The configuration for a Amazon ECS Managed Instances provider. Amazon ECS uses this configuration to
      # automatically launch, manage, and terminate Amazon EC2 instances on your behalf. Managed instances
      # provide access to the full range of Amazon EC2 instance types and features while offloading
      # infrastructure management to Amazon Web Services.
      struct ManagedInstancesProvider
        include JSON::Serializable

        # Defines how Amazon ECS Managed Instances optimizes the infrastastructure in your capacity provider.
        # Configure it to turn on or off the infrastructure optimization in your capacity provider, and to
        # control the idle or underutilized EC2 instances optimization delay.
        @[JSON::Field(key: "infrastructureOptimization")]
        getter infrastructure_optimization : Types::InfrastructureOptimization?

        # The Amazon Resource Name (ARN) of the infrastructure role that Amazon ECS assumes to manage
        # instances. This role must include permissions for Amazon EC2 instance lifecycle management,
        # networking, and any additional Amazon Web Services services required for your workloads. For more
        # information, see Amazon ECS infrastructure IAM role in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "infrastructureRoleArn")]
        getter infrastructure_role_arn : String?

        # The launch template that defines how Amazon ECS launches Amazon ECS Managed Instances. This includes
        # the instance profile for your tasks, network and storage configuration, and instance requirements
        # that determine which Amazon EC2 instance types can be used. For more information, see Store instance
        # launch parameters in Amazon EC2 launch templates in the Amazon EC2 User Guide .
        @[JSON::Field(key: "instanceLaunchTemplate")]
        getter instance_launch_template : Types::InstanceLaunchTemplate?

        # Determines whether tags from the capacity provider are automatically applied to Amazon ECS Managed
        # Instances. This helps with cost allocation and resource management by ensuring consistent tagging
        # across your infrastructure.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        def initialize(
          @infrastructure_optimization : Types::InfrastructureOptimization? = nil,
          @infrastructure_role_arn : String? = nil,
          @instance_launch_template : Types::InstanceLaunchTemplate? = nil,
          @propagate_tags : String? = nil
        )
        end
      end

      # The storage configuration for Amazon ECS Managed Instances. This defines the root volume
      # configuration for the instances.
      struct ManagedInstancesStorageConfiguration
        include JSON::Serializable

        # The size of the tasks volume.
        @[JSON::Field(key: "storageSizeGiB")]
        getter storage_size_gi_b : Int32?

        def initialize(
          @storage_size_gi_b : Int32? = nil
        )
        end
      end

      # The listeners associated with the Express service's Application Load Balancer.
      struct ManagedListener
        include JSON::Serializable

        # The status of the load balancer listener.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when this listener was most recently updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the load balancer listener.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Informaion about why the load balancer listener is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The listener rule associated with the Express service's Application Load Balancer.
      struct ManagedListenerRule
        include JSON::Serializable

        # The status of the load balancer listener rule.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when this listener rule was most recently updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the load balancer listener rule.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the load balancer listener rule is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The Application Load Balancer associated with the Express service.
      struct ManagedLoadBalancer
        include JSON::Serializable

        # The scheme of the load balancer. By default, the scheme of the load balancer is internet-facing .
        @[JSON::Field(key: "scheme")]
        getter scheme : String

        # The status of the load balancer.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when this load balancer was most recently updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the load balancer.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The IDs of the security groups associated with the load balancer.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # Information about why the load balancer is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The IDs of the subnets associated with the load balancer.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @scheme : String,
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @status_reason : String? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # The Cloudwatch Log Group created by Amazon ECS for an Express service.
      struct ManagedLogGroup
        include JSON::Serializable

        # The name of the Cloudwatch Log Group associated with the Express service.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        # The status of the Cloudwatch LogGroup.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when the Cloudwatch LogGroup was last updated
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the Cloudwatch Log Group associated with the Express service.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the Cloudwatch LogGroup is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @log_group_name : String,
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The CloudWatch metric alarm associated with the Express service's scaling policy.
      struct ManagedMetricAlarm
        include JSON::Serializable

        # The status of the CloudWatch metric alarm.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when the CloudWatch metric alarm was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the CloudWatch metric alarm.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the CloudWatch metric alarm is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Represents a scalable target.
      struct ManagedScalableTarget
        include JSON::Serializable

        # The maximum value to scale to in response to a scale-out activity.
        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32

        # The minimum value to scale to in response to a scale-in activity.
        @[JSON::Field(key: "minCapacity")]
        getter min_capacity : Int32

        # The status of the scalable target.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when the target was most recently updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The ARN of the scalable target.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the scalable target is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @max_capacity : Int32,
          @min_capacity : Int32,
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The managed scaling settings for the Auto Scaling group capacity provider. When managed scaling is
      # turned on, Amazon ECS manages the scale-in and scale-out actions of the Auto Scaling group. Amazon
      # ECS manages a target tracking scaling policy using an Amazon ECS managed CloudWatch metric with the
      # specified targetCapacity value as the target value for the metric. For more information, see Using
      # managed scaling in the Amazon Elastic Container Service Developer Guide . If managed scaling is off,
      # the user must manage the scaling of the Auto Scaling group.
      struct ManagedScaling
        include JSON::Serializable

        # The period of time, in seconds, after a newly launched Amazon EC2 instance can contribute to
        # CloudWatch metrics for Auto Scaling group. If this parameter is omitted, the default value of 300
        # seconds is used.
        @[JSON::Field(key: "instanceWarmupPeriod")]
        getter instance_warmup_period : Int32?

        # The maximum number of Amazon EC2 instances that Amazon ECS will scale out at one time. If this
        # parameter is omitted, the default value of 10000 is used.
        @[JSON::Field(key: "maximumScalingStepSize")]
        getter maximum_scaling_step_size : Int32?

        # The minimum number of Amazon EC2 instances that Amazon ECS will scale out at one time. The scale in
        # process is not affected by this parameter If this parameter is omitted, the default value of 1 is
        # used. When additional capacity is required, Amazon ECS will scale up the minimum scaling step size
        # even if the actual demand is less than the minimum scaling step size.
        @[JSON::Field(key: "minimumScalingStepSize")]
        getter minimum_scaling_step_size : Int32?

        # Determines whether to use managed scaling for the capacity provider.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The target capacity utilization as a percentage for the capacity provider. The specified value must
        # be greater than 0 and less than or equal to 100 . For example, if you want the capacity provider to
        # maintain 10% spare capacity, then that means the utilization is 90%, so use a targetCapacity of 90 .
        # The default value of 100 percent results in the Amazon EC2 instances in your Auto Scaling group
        # being completely used.
        @[JSON::Field(key: "targetCapacity")]
        getter target_capacity : Int32?

        def initialize(
          @instance_warmup_period : Int32? = nil,
          @maximum_scaling_step_size : Int32? = nil,
          @minimum_scaling_step_size : Int32? = nil,
          @status : String? = nil,
          @target_capacity : Int32? = nil
        )
        end
      end

      # A security group associated with the Express service.
      struct ManagedSecurityGroup
        include JSON::Serializable

        # The status of the security group.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when the security group was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The ARN of the security group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the security group is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The managed storage configuration for the cluster.
      struct ManagedStorageConfiguration
        include JSON::Serializable

        # Specify the Key Management Service key ID for Fargate ephemeral storage. When you specify a
        # fargateEphemeralStorageKmsKeyId , Amazon Web Services Fargate uses the key to encrypt data at rest
        # in ephemeral storage. For more information about Fargate ephemeral storage encryption, see Customer
        # managed keys for Amazon Web Services Fargate ephemeral storage for Amazon ECS in the Amazon Elastic
        # Container Service Developer Guide . The key must be a single Region key.
        @[JSON::Field(key: "fargateEphemeralStorageKmsKeyId")]
        getter fargate_ephemeral_storage_kms_key_id : String?

        # Specify a Key Management Service key ID to encrypt Amazon ECS managed storage. When you specify a
        # kmsKeyId , Amazon ECS uses the key to encrypt data volumes managed by Amazon ECS that are attached
        # to tasks in the cluster. The following data volumes are managed by Amazon ECS: Amazon EBS. For more
        # information about encryption of Amazon EBS volumes attached to Amazon ECS tasks, see Encrypt data
        # stored in Amazon EBS volumes for Amazon ECS in the Amazon Elastic Container Service Developer Guide
        # . The key must be a single Region key.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @fargate_ephemeral_storage_kms_key_id : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # The target group associated with the Express service's Application Load Balancer. For more
      # information about load balancer target groups, see CreateTargetGroup in the Elastic Load Balancing
      # API Reference
      struct ManagedTargetGroup
        include JSON::Serializable

        # The destination for health checks on the targets.
        @[JSON::Field(key: "healthCheckPath")]
        getter health_check_path : String

        # The port the load balancer uses when performing health checks on targets.
        @[JSON::Field(key: "healthCheckPort")]
        getter health_check_port : Int32

        # The port on which the targets receive traffic.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The status of the target group.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp for when the target group was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time

        # The Amazon Resource Name (ARN) of the target group.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # Information about why the target group is in the current status.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @health_check_path : String,
          @health_check_port : Int32,
          @port : Int32,
          @status : String,
          @updated_at : Time,
          @arn : String? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # The minimum and maximum amount of memory per vCPU in gibibytes (GiB). This helps ensure that
      # instance types have the appropriate memory-to-CPU ratio for your workloads.
      struct MemoryGiBPerVCpuRequest
        include JSON::Serializable

        # The maximum amount of memory per vCPU in GiB. Instance types with a higher memory-to-vCPU ratio are
        # excluded from selection.
        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The minimum amount of memory per vCPU in GiB. Instance types with a lower memory-to-vCPU ratio are
        # excluded from selection.
        @[JSON::Field(key: "min")]
        getter min : Float64?

        def initialize(
          @max : Float64? = nil,
          @min : Float64? = nil
        )
        end
      end

      # The minimum and maximum amount of memory in mebibytes (MiB) for instance type selection. This
      # ensures that selected instance types have adequate memory for your workloads.
      struct MemoryMiBRequest
        include JSON::Serializable

        # The minimum amount of memory in MiB. Instance types with less memory than this value are excluded
        # from selection.
        @[JSON::Field(key: "min")]
        getter min : Int32

        # The maximum amount of memory in MiB. Instance types with more memory than this value are excluded
        # from selection.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # Amazon ECS can't determine the current version of the Amazon ECS container agent on the container
      # instance and doesn't have enough information to proceed with an update. This could be because the
      # agent running on the container instance is a previous or custom version that doesn't use our version
      # information.
      struct MissingVersionException
        include JSON::Serializable

        def initialize
        end
      end

      # The details for a volume mount point that's used in a container definition.
      struct MountPoint
        include JSON::Serializable

        # The path on the container to mount the host volume at.
        @[JSON::Field(key: "containerPath")]
        getter container_path : String?

        # If this value is true , the container has read-only access to the volume. If this value is false ,
        # then the container can write to the volume. The default value is false .
        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool?

        # The name of the volume to mount. Must be a volume name referenced in the name parameter of task
        # definition volume .
        @[JSON::Field(key: "sourceVolume")]
        getter source_volume : String?

        def initialize(
          @container_path : String? = nil,
          @read_only : Bool? = nil,
          @source_volume : String? = nil
        )
        end
      end

      # The specified namespace wasn't found.
      struct NamespaceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The minimum and maximum network bandwidth in gigabits per second (Gbps) for instance type selection.
      # This is important for network-intensive workloads.
      struct NetworkBandwidthGbpsRequest
        include JSON::Serializable

        # The maximum network bandwidth in Gbps. Instance types with higher network bandwidth are excluded
        # from selection.
        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The minimum network bandwidth in Gbps. Instance types with lower network bandwidth are excluded from
        # selection.
        @[JSON::Field(key: "min")]
        getter min : Float64?

        def initialize(
          @max : Float64? = nil,
          @min : Float64? = nil
        )
        end
      end

      # Details on the network bindings between a container and its host container instance. After a task
      # reaches the RUNNING status, manual and automatic host and container port assignments are visible in
      # the networkBindings section of DescribeTasks API responses.
      struct NetworkBinding
        include JSON::Serializable

        # The IP address that the container is bound to on the container instance.
        @[JSON::Field(key: "bindIP")]
        getter bind_ip : String?

        # The port number on the container that's used with the network binding.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32?

        # The port number range on the container that's bound to the dynamically mapped host port range. The
        # following rules apply when you specify a containerPortRange : You must use either the bridge network
        # mode or the awsvpc network mode. This parameter is available for both the EC2 and Fargate launch
        # types. This parameter is available for both the Linux and Windows operating systems. The container
        # instance must have at least version 1.67.0 of the container agent and at least version 1.67.0-1 of
        # the ecs-init package You can specify a maximum of 100 port ranges per container. You do not specify
        # a hostPortRange . The value of the hostPortRange is set as follows: For containers in a task with
        # the awsvpc network mode, the hostPortRange is set to the same value as the containerPortRange . This
        # is a static mapping strategy. For containers in a task with the bridge network mode, the Amazon ECS
        # agent finds open host ports from the default ephemeral range and passes it to docker to bind them to
        # the container ports. The containerPortRange valid values are between 1 and 65535. A port can only be
        # included in one port mapping per container. You cannot specify overlapping port ranges. The first
        # port in the range must be less than last port in the range. Docker recommends that you turn off the
        # docker-proxy in the Docker daemon config file when you have a large number of ports. For more
        # information, see Issue #11185 on the Github website. For information about how to turn off the
        # docker-proxy in the Docker daemon config file, see Docker daemon in the Amazon ECS Developer Guide .
        # You can call DescribeTasks to view the hostPortRange which are the host ports that are bound to the
        # container ports.
        @[JSON::Field(key: "containerPortRange")]
        getter container_port_range : String?

        # The port number on the host that's used with the network binding.
        @[JSON::Field(key: "hostPort")]
        getter host_port : Int32?

        # The port number range on the host that's used with the network binding. This is assigned is assigned
        # by Docker and delivered by the Amazon ECS agent.
        @[JSON::Field(key: "hostPortRange")]
        getter host_port_range : String?

        # The protocol used for the network binding.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @bind_ip : String? = nil,
          @container_port : Int32? = nil,
          @container_port_range : String? = nil,
          @host_port : Int32? = nil,
          @host_port_range : String? = nil,
          @protocol : String? = nil
        )
        end
      end

      # The network configuration for a task or service.
      struct NetworkConfiguration
        include JSON::Serializable

        # The VPC subnets and security groups that are associated with a task. All specified subnets and
        # security groups must be from the same VPC.
        @[JSON::Field(key: "awsvpcConfiguration")]
        getter awsvpc_configuration : Types::AwsVpcConfiguration?

        def initialize(
          @awsvpc_configuration : Types::AwsVpcConfiguration? = nil
        )
        end
      end

      # An object representing the elastic network interface for tasks that use the awsvpc network mode.
      struct NetworkInterface
        include JSON::Serializable

        # The attachment ID for the network interface.
        @[JSON::Field(key: "attachmentId")]
        getter attachment_id : String?

        # The private IPv6 address for the network interface.
        @[JSON::Field(key: "ipv6Address")]
        getter ipv6_address : String?

        # The private IPv4 address for the network interface.
        @[JSON::Field(key: "privateIpv4Address")]
        getter private_ipv4_address : String?

        def initialize(
          @attachment_id : String? = nil,
          @ipv6_address : String? = nil,
          @private_ipv4_address : String? = nil
        )
        end
      end

      # The minimum and maximum number of network interfaces for instance type selection. This is useful for
      # workloads that require multiple network interfaces.
      struct NetworkInterfaceCountRequest
        include JSON::Serializable

        # The maximum number of network interfaces. Instance types that support more network interfaces are
        # excluded from selection.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        # The minimum number of network interfaces. Instance types that support fewer network interfaces are
        # excluded from selection.
        @[JSON::Field(key: "min")]
        getter min : Int32?

        def initialize(
          @max : Int32? = nil,
          @min : Int32? = nil
        )
        end
      end

      # There's no update available for this Amazon ECS container agent. This might be because the agent is
      # already running the latest version or because it's so old that there's no update path to the current
      # version.
      struct NoUpdateAvailableException
        include JSON::Serializable

        def initialize
        end
      end

      # An object representing a constraint on task placement. For more information, see Task placement
      # constraints in the Amazon Elastic Container Service Developer Guide . If you're using the Fargate
      # launch type, task placement constraints aren't supported.
      struct PlacementConstraint
        include JSON::Serializable

        # A cluster query language expression to apply to the constraint. The expression can have a maximum
        # length of 2000 characters. You can't specify an expression if the constraint type is
        # distinctInstance . For more information, see Cluster query language in the Amazon Elastic Container
        # Service Developer Guide .
        @[JSON::Field(key: "expression")]
        getter expression : String?

        # The type of constraint. Use distinctInstance to ensure that each task in a particular group is
        # running on a different container instance. Use memberOf to restrict the selection to a group of
        # valid candidates.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @expression : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The task placement strategy for a task or service. For more information, see Task placement
      # strategies in the Amazon Elastic Container Service Developer Guide .
      struct PlacementStrategy
        include JSON::Serializable

        # The field to apply the placement strategy against. For the spread placement strategy, valid values
        # are instanceId (or host , which has the same effect), or any platform or custom attribute that's
        # applied to a container instance, such as attribute:ecs.availability-zone . For the binpack placement
        # strategy, valid values are cpu and memory . For the random placement strategy, this field is not
        # used.
        @[JSON::Field(key: "field")]
        getter field : String?

        # The type of placement strategy. The random placement strategy randomly places tasks on available
        # candidates. The spread placement strategy spreads placement across available candidates evenly based
        # on the field parameter. The binpack strategy places tasks on available candidates that have the
        # least available amount of the resource that's specified with the field parameter. For example, if
        # you binpack on memory, a task is placed on the instance with the least amount of remaining memory
        # but still enough to run the task.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @field : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The devices that are available on the container instance. The only supported device type is a GPU.
      struct PlatformDevice
        include JSON::Serializable

        # The ID for the GPUs on the container instance. The available GPU IDs can also be obtained on the
        # container instance in the /var/lib/ecs/gpu/nvidia_gpu_info.json file.
        @[JSON::Field(key: "id")]
        getter id : String

        # The type of device that's available on the container instance. The only supported value is GPU .
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      # The specified platform version doesn't satisfy the required capabilities of the task definition.
      struct PlatformTaskDefinitionIncompatibilityException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified platform version doesn't exist.
      struct PlatformUnknownException
        include JSON::Serializable

        def initialize
        end
      end

      # Port mappings allow containers to access ports on the host container instance to send or receive
      # traffic. Port mappings are specified as part of the container definition. If you use containers in a
      # task with the awsvpc or host network mode, specify the exposed ports using containerPort . The
      # hostPort can be left blank or it must be the same value as the containerPort . Most fields of this
      # parameter ( containerPort , hostPort , protocol ) maps to PortBindings in the docker container
      # create command and the --publish option to docker run . If the network mode of a task definition is
      # set to host , host ports must either be undefined or match the container port in the port mapping.
      # You can't expose the same container port for multiple protocols. If you attempt this, an error is
      # returned. After a task reaches the RUNNING status, manual and automatic host and container port
      # assignments are visible in the networkBindings section of DescribeTasks API responses.
      struct PortMapping
        include JSON::Serializable

        # The application protocol that's used for the port mapping. This parameter only applies to Service
        # Connect. We recommend that you set this parameter to be consistent with the protocol that your
        # application uses. If you set this parameter, Amazon ECS adds protocol-specific connection handling
        # to the Service Connect proxy. If you set this parameter, Amazon ECS adds protocol-specific telemetry
        # in the Amazon ECS console and CloudWatch. If you don't set a value for this parameter, then TCP is
        # used. However, Amazon ECS doesn't add protocol-specific telemetry for TCP. appProtocol is immutable
        # in a Service Connect service. Updating this field requires a service deletion and redeployment.
        # Tasks that run in a namespace can use short names to connect to services in the namespace. Tasks can
        # connect to services across all of the clusters in the namespace. Tasks connect through a managed
        # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
        # ECS services create are supported with Service Connect. For more information, see Service Connect in
        # the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "appProtocol")]
        getter app_protocol : String?

        # The port number on the container that's bound to the user-specified or automatically assigned host
        # port. If you use containers in a task with the awsvpc or host network mode, specify the exposed
        # ports using containerPort . If you use containers in a task with the bridge network mode and you
        # specify a container port and not a host port, your container automatically receives a host port in
        # the ephemeral port range. For more information, see hostPort . Port mappings that are automatically
        # assigned in this way do not count toward the 100 reserved ports limit of a container instance.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32?

        # The port number range on the container that's bound to the dynamically mapped host port range. The
        # following rules apply when you specify a containerPortRange : You must use either the bridge network
        # mode or the awsvpc network mode. This parameter is available for both the EC2 and Fargate launch
        # types. This parameter is available for both the Linux and Windows operating systems. The container
        # instance must have at least version 1.67.0 of the container agent and at least version 1.67.0-1 of
        # the ecs-init package You can specify a maximum of 100 port ranges per container. You do not specify
        # a hostPortRange . The value of the hostPortRange is set as follows: For containers in a task with
        # the awsvpc network mode, the hostPortRange is set to the same value as the containerPortRange . This
        # is a static mapping strategy. For containers in a task with the bridge network mode, the Amazon ECS
        # agent finds open host ports from the default ephemeral range and passes it to docker to bind them to
        # the container ports. The containerPortRange valid values are between 1 and 65535. A port can only be
        # included in one port mapping per container. You cannot specify overlapping port ranges. The first
        # port in the range must be less than last port in the range. Docker recommends that you turn off the
        # docker-proxy in the Docker daemon config file when you have a large number of ports. For more
        # information, see Issue #11185 on the Github website. For information about how to turn off the
        # docker-proxy in the Docker daemon config file, see Docker daemon in the Amazon ECS Developer Guide .
        # You can call DescribeTasks to view the hostPortRange which are the host ports that are bound to the
        # container ports.
        @[JSON::Field(key: "containerPortRange")]
        getter container_port_range : String?

        # The port number on the container instance to reserve for your container. If you specify a
        # containerPortRange , leave this field empty and the value of the hostPort is set as follows: For
        # containers in a task with the awsvpc network mode, the hostPort is set to the same value as the
        # containerPort . This is a static mapping strategy. For containers in a task with the bridge network
        # mode, the Amazon ECS agent finds open ports on the host and automatically binds them to the
        # container ports. This is a dynamic mapping strategy. If you use containers in a task with the awsvpc
        # or host network mode, the hostPort can either be left blank or set to the same value as the
        # containerPort . If you use containers in a task with the bridge network mode, you can specify a
        # non-reserved host port for your container port mapping, or you can omit the hostPort (or set it to 0
        # ) while specifying a containerPort and your container automatically receives a port in the ephemeral
        # port range for your container instance operating system and Docker version. The default ephemeral
        # port range for Docker version 1.6.0 and later is listed on the instance under
        # /proc/sys/net/ipv4/ip_local_port_range . If this kernel parameter is unavailable, the default
        # ephemeral port range from 49153 through 65535 (Linux) or 49152 through 65535 (Windows) is used. Do
        # not attempt to specify a host port in the ephemeral port range as these are reserved for automatic
        # assignment. In general, ports below 32768 are outside of the ephemeral port range. The default
        # reserved ports are 22 for SSH, the Docker ports 2375 and 2376, and the Amazon ECS container agent
        # ports 51678-51680. Any host port that was previously specified in a running task is also reserved
        # while the task is running. That is, after a task stops, the host port is released. The current
        # reserved ports are displayed in the remainingResources of DescribeContainerInstances output. A
        # container instance can have up to 100 reserved ports at a time. This number includes the default
        # reserved ports. Automatically assigned ports aren't included in the 100 reserved ports quota.
        @[JSON::Field(key: "hostPort")]
        getter host_port : Int32?

        # The name that's used for the port mapping. This parameter is the name that you use in the
        # serviceConnectConfiguration and the vpcLatticeConfigurations of a service. The name can include up
        # to 64 characters. The characters can include lowercase letters, numbers, underscores (_), and
        # hyphens (-). The name can't start with a hyphen.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The protocol used for the port mapping. Valid values are tcp and udp . The default is tcp . protocol
        # is immutable in a Service Connect service. Updating this field requires a service deletion and
        # redeployment.
        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        def initialize(
          @app_protocol : String? = nil,
          @container_port : Int32? = nil,
          @container_port_range : String? = nil,
          @host_port : Int32? = nil,
          @name : String? = nil,
          @protocol : String? = nil
        )
        end
      end

      # An object representing the protection status details for a task. You can set the protection status
      # with the UpdateTaskProtection API and get the status of tasks with the GetTaskProtection API.
      struct ProtectedTask
        include JSON::Serializable

        # The epoch time when protection for the task will expire.
        @[JSON::Field(key: "expirationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter expiration_date : Time?

        # The protection status of the task. If scale-in protection is on for a task, the value is true .
        # Otherwise, it is false .
        @[JSON::Field(key: "protectionEnabled")]
        getter protection_enabled : Bool?

        # The task ARN.
        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        def initialize(
          @expiration_date : Time? = nil,
          @protection_enabled : Bool? = nil,
          @task_arn : String? = nil
        )
        end
      end

      # The configuration details for the App Mesh proxy. For tasks that use the EC2 launch type, the
      # container instances require at least version 1.26.0 of the container agent and at least version
      # 1.26.0-1 of the ecs-init package to use a proxy configuration. If your container instances are
      # launched from the Amazon ECS optimized AMI version 20190301 or later, then they contain the required
      # versions of the container agent and ecs-init . For more information, see Amazon ECS-optimized Linux
      # AMI
      struct ProxyConfiguration
        include JSON::Serializable

        # The name of the container that will serve as the App Mesh proxy.
        @[JSON::Field(key: "containerName")]
        getter container_name : String

        # The set of network configuration parameters to provide the Container Network Interface (CNI) plugin,
        # specified as key-value pairs. IgnoredUID - (Required) The user ID (UID) of the proxy container as
        # defined by the user parameter in a container definition. This is used to ensure the proxy ignores
        # its own traffic. If IgnoredGID is specified, this field can be empty. IgnoredGID - (Required) The
        # group ID (GID) of the proxy container as defined by the user parameter in a container definition.
        # This is used to ensure the proxy ignores its own traffic. If IgnoredUID is specified, this field can
        # be empty. AppPorts - (Required) The list of ports that the application uses. Network traffic to
        # these ports is forwarded to the ProxyIngressPort and ProxyEgressPort . ProxyIngressPort - (Required)
        # Specifies the port that incoming traffic to the AppPorts is directed to. ProxyEgressPort -
        # (Required) Specifies the port that outgoing traffic from the AppPorts is directed to.
        # EgressIgnoredPorts - (Required) The egress traffic going to the specified ports is ignored and not
        # redirected to the ProxyEgressPort . It can be an empty list. EgressIgnoredIPs - (Required) The
        # egress traffic going to the specified IP addresses is ignored and not redirected to the
        # ProxyEgressPort . It can be an empty list.
        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::KeyValuePair)?

        # The proxy type. The only supported value is APPMESH .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @container_name : String,
          @properties : Array(Types::KeyValuePair)? = nil,
          @type : String? = nil
        )
        end
      end

      struct PutAccountSettingDefaultRequest
        include JSON::Serializable

        # The resource name for which to modify the account setting. The following are the valid values for
        # the account setting name. serviceLongArnFormat - When modified, the Amazon Resource Name (ARN) and
        # resource ID format of the resource type for a specified user, role, or the root user for an account
        # is affected. The opt-in and opt-out account setting must be set for each Amazon ECS resource
        # separately. The ARN and resource ID format of a resource is defined by the opt-in status of the user
        # or role that created the resource. You must turn on this setting to use Amazon ECS features such as
        # resource tagging. taskLongArnFormat - When modified, the Amazon Resource Name (ARN) and resource ID
        # format of the resource type for a specified user, role, or the root user for an account is affected.
        # The opt-in and opt-out account setting must be set for each Amazon ECS resource separately. The ARN
        # and resource ID format of a resource is defined by the opt-in status of the user or role that
        # created the resource. You must turn on this setting to use Amazon ECS features such as resource
        # tagging. containerInstanceLongArnFormat - When modified, the Amazon Resource Name (ARN) and resource
        # ID format of the resource type for a specified user, role, or the root user for an account is
        # affected. The opt-in and opt-out account setting must be set for each Amazon ECS resource
        # separately. The ARN and resource ID format of a resource is defined by the opt-in status of the user
        # or role that created the resource. You must turn on this setting to use Amazon ECS features such as
        # resource tagging. awsvpcTrunking - When modified, the elastic network interface (ENI) limit for any
        # new container instances that support the feature is changed. If awsvpcTrunking is turned on, any new
        # container instances that support the feature are launched have the increased ENI limits available to
        # them. For more information, see Elastic Network Interface Trunking in the Amazon Elastic Container
        # Service Developer Guide . containerInsights - Container Insights with enhanced observability
        # provides all the Container Insights metrics, plus additional task and container metrics. This
        # version supports enhanced observability for Amazon ECS clusters using the Amazon EC2 and Fargate
        # launch types. After you configure Container Insights with enhanced observability on Amazon ECS,
        # Container Insights auto-collects detailed infrastructure telemetry from the cluster level down to
        # the container level in your environment and displays these critical performance data in curated
        # dashboards removing the heavy lifting in observability set-up. To use Container Insights with
        # enhanced observability, set the containerInsights account setting to enhanced . To use Container
        # Insights, set the containerInsights account setting to enabled . For more information, see Monitor
        # Amazon ECS containers using Container Insights with enhanced observability in the Amazon Elastic
        # Container Service Developer Guide . dualStackIPv6 - When turned on, when using a VPC in dual stack
        # mode, your tasks using the awsvpc network mode can have an IPv6 address assigned. For more
        # information on using IPv6 with tasks launched on Amazon EC2 instances, see Using a VPC in dual-stack
        # mode . For more information on using IPv6 with tasks launched on Fargate, see Using a VPC in
        # dual-stack mode . fargateFIPSMode - If you specify fargateFIPSMode , Fargate FIPS 140 compliance is
        # affected. fargateTaskRetirementWaitPeriod - When Amazon Web Services determines that a security or
        # infrastructure update is needed for an Amazon ECS task hosted on Fargate, the tasks need to be
        # stopped and new tasks launched to replace them. Use fargateTaskRetirementWaitPeriod to configure the
        # wait time to retire a Fargate task. For information about the Fargate tasks maintenance, see Amazon
        # Web Services Fargate task maintenance in the Amazon ECS Developer Guide . fargateEventWindows - When
        # Amazon Web Services determines that a security or infrastructure update is needed for an Amazon ECS
        # task hosted on Fargate, the tasks need to be stopped and new tasks launched to replace them. Use
        # fargateEventWindows to use EC2 Event Windows associated with Fargate tasks to configure time windows
        # for task retirement. tagResourceAuthorization - Amazon ECS is introducing tagging authorization for
        # resource creation. Users must have permissions for actions that create the resource, such as
        # ecsCreateCluster . If tags are specified when you create a resource, Amazon Web Services performs
        # additional authorization to verify if users or roles have permissions to create tags. Therefore, you
        # must grant explicit permissions to use the ecs:TagResource action. For more information, see Grant
        # permission to tag resources on creation in the Amazon ECS Developer Guide . defaultLogDriverMode
        # -Amazon ECS supports setting a default delivery mode of log messages from a container to the
        # logDriver that you specify in the container's logConfiguration . The delivery mode affects
        # application stability when the flow of logs from the container to the log driver is interrupted. The
        # defaultLogDriverMode setting supports two values: blocking and non-blocking . If you don't specify a
        # delivery mode in your container definition's logConfiguration , the mode you specify using this
        # account setting will be used as the default. For more information about log delivery modes, see
        # LogConfiguration . On June 25, 2025, Amazon ECS changed the default log driver mode from blocking to
        # non-blocking to prioritize task availability over logging. To continue using the blocking mode after
        # this change, do one of the following: Set the mode option in your container definition's
        # logConfiguration as blocking . Set the defaultLogDriverMode account setting to blocking .
        # guardDutyActivate - The guardDutyActivate parameter is read-only in Amazon ECS and indicates whether
        # Amazon ECS Runtime Monitoring is enabled or disabled by your security administrator in your Amazon
        # ECS account. Amazon GuardDuty controls this account setting on your behalf. For more information,
        # see Protecting Amazon ECS workloads with Amazon ECS Runtime Monitoring .
        @[JSON::Field(key: "name")]
        getter name : String

        # The account setting value for the specified principal ARN. Accepted values are enabled , disabled ,
        # on , enhanced , and off . When you specify fargateTaskRetirementWaitPeriod for the name , the
        # following are the valid values: 0 - Amazon Web Services sends the notification, and immediately
        # retires the affected tasks. 7 - Amazon Web Services sends the notification, and waits 7 calendar
        # days to retire the tasks. 14 - Amazon Web Services sends the notification, and waits 14 calendar
        # days to retire the tasks.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      struct PutAccountSettingDefaultResponse
        include JSON::Serializable

        # The current setting for a resource.
        @[JSON::Field(key: "setting")]
        getter setting : Types::Setting?

        def initialize(
          @setting : Types::Setting? = nil
        )
        end
      end

      struct PutAccountSettingRequest
        include JSON::Serializable

        # The Amazon ECS account setting name to modify. The following are the valid values for the account
        # setting name. serviceLongArnFormat - When modified, the Amazon Resource Name (ARN) and resource ID
        # format of the resource type for a specified user, role, or the root user for an account is affected.
        # The opt-in and opt-out account setting must be set for each Amazon ECS resource separately. The ARN
        # and resource ID format of a resource is defined by the opt-in status of the user or role that
        # created the resource. You must turn on this setting to use Amazon ECS features such as resource
        # tagging. taskLongArnFormat - When modified, the Amazon Resource Name (ARN) and resource ID format of
        # the resource type for a specified user, role, or the root user for an account is affected. The
        # opt-in and opt-out account setting must be set for each Amazon ECS resource separately. The ARN and
        # resource ID format of a resource is defined by the opt-in status of the user or role that created
        # the resource. You must turn on this setting to use Amazon ECS features such as resource tagging.
        # containerInstanceLongArnFormat - When modified, the Amazon Resource Name (ARN) and resource ID
        # format of the resource type for a specified user, role, or the root user for an account is affected.
        # The opt-in and opt-out account setting must be set for each Amazon ECS resource separately. The ARN
        # and resource ID format of a resource is defined by the opt-in status of the user or role that
        # created the resource. You must turn on this setting to use Amazon ECS features such as resource
        # tagging. awsvpcTrunking - When modified, the elastic network interface (ENI) limit for any new
        # container instances that support the feature is changed. If awsvpcTrunking is turned on, any new
        # container instances that support the feature are launched have the increased ENI limits available to
        # them. For more information, see Elastic Network Interface Trunking in the Amazon Elastic Container
        # Service Developer Guide . containerInsights - Container Insights with enhanced observability
        # provides all the Container Insights metrics, plus additional task and container metrics. This
        # version supports enhanced observability for Amazon ECS clusters using the Amazon EC2 and Fargate
        # launch types. After you configure Container Insights with enhanced observability on Amazon ECS,
        # Container Insights auto-collects detailed infrastructure telemetry from the cluster level down to
        # the container level in your environment and displays these critical performance data in curated
        # dashboards removing the heavy lifting in observability set-up. To use Container Insights with
        # enhanced observability, set the containerInsights account setting to enhanced . To use Container
        # Insights, set the containerInsights account setting to enabled . For more information, see Monitor
        # Amazon ECS containers using Container Insights with enhanced observability in the Amazon Elastic
        # Container Service Developer Guide . dualStackIPv6 - When turned on, when using a VPC in dual stack
        # mode, your tasks using the awsvpc network mode can have an IPv6 address assigned. For more
        # information on using IPv6 with tasks launched on Amazon EC2 instances, see Using a VPC in dual-stack
        # mode . For more information on using IPv6 with tasks launched on Fargate, see Using a VPC in
        # dual-stack mode . fargateTaskRetirementWaitPeriod - When Amazon Web Services determines that a
        # security or infrastructure update is needed for an Amazon ECS task hosted on Fargate, the tasks need
        # to be stopped and new tasks launched to replace them. Use fargateTaskRetirementWaitPeriod to
        # configure the wait time to retire a Fargate task. For information about the Fargate tasks
        # maintenance, see Amazon Web Services Fargate task maintenance in the Amazon ECS Developer Guide .
        # fargateEventWindows - When Amazon Web Services determines that a security or infrastructure update
        # is needed for an Amazon ECS task hosted on Fargate, the tasks need to be stopped and new tasks
        # launched to replace them. Use fargateEventWindows to use EC2 Event Windows associated with Fargate
        # tasks to configure time windows for task retirement. tagResourceAuthorization - Amazon ECS is
        # introducing tagging authorization for resource creation. Users must have permissions for actions
        # that create the resource, such as ecsCreateCluster . If tags are specified when you create a
        # resource, Amazon Web Services performs additional authorization to verify if users or roles have
        # permissions to create tags. Therefore, you must grant explicit permissions to use the
        # ecs:TagResource action. For more information, see Grant permission to tag resources on creation in
        # the Amazon ECS Developer Guide . defaultLogDriverMode - Amazon ECS supports setting a default
        # delivery mode of log messages from a container to the logDriver that you specify in the container's
        # logConfiguration . The delivery mode affects application stability when the flow of logs from the
        # container to the log driver is interrupted. The defaultLogDriverMode setting supports two values:
        # blocking and non-blocking . If you don't specify a delivery mode in your container definition's
        # logConfiguration , the mode you specify using this account setting will be used as the default. For
        # more information about log delivery modes, see LogConfiguration . On June 25, 2025, Amazon ECS
        # changed the default log driver mode from blocking to non-blocking to prioritize task availability
        # over logging. To continue using the blocking mode after this change, do one of the following: Set
        # the mode option in your container definition's logConfiguration as blocking . Set the
        # defaultLogDriverMode account setting to blocking . guardDutyActivate - The guardDutyActivate
        # parameter is read-only in Amazon ECS and indicates whether Amazon ECS Runtime Monitoring is enabled
        # or disabled by your security administrator in your Amazon ECS account. Amazon GuardDuty controls
        # this account setting on your behalf. For more information, see Protecting Amazon ECS workloads with
        # Amazon ECS Runtime Monitoring .
        @[JSON::Field(key: "name")]
        getter name : String

        # The account setting value for the specified principal ARN. Accepted values are enabled , disabled ,
        # enhanced , on , and off . When you specify fargateTaskRetirementWaitPeriod for the name , the
        # following are the valid values: 0 - Amazon Web Services sends the notification, and immediately
        # retires the affected tasks. 7 - Amazon Web Services sends the notification, and waits 7 calendar
        # days to retire the tasks. 14 - Amazon Web Services sends the notification, and waits 14 calendar
        # days to retire the tasks.
        @[JSON::Field(key: "value")]
        getter value : String

        # The ARN of the principal, which can be a user, role, or the root user. If you specify the root user,
        # it modifies the account setting for all users, roles, and the root user of the account unless a user
        # or role explicitly overrides these settings. If this field is omitted, the setting is changed only
        # for the authenticated user. In order to use this parameter, you must be the root user, or the
        # principal. You must use the root user when you set the Fargate wait time (
        # fargateTaskRetirementWaitPeriod ). Federated users assume the account setting of the root user and
        # can't have explicit account settings set for them.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        def initialize(
          @name : String,
          @value : String,
          @principal_arn : String? = nil
        )
        end
      end

      struct PutAccountSettingResponse
        include JSON::Serializable

        # The current account setting for a resource.
        @[JSON::Field(key: "setting")]
        getter setting : Types::Setting?

        def initialize(
          @setting : Types::Setting? = nil
        )
        end
      end

      struct PutAttributesRequest
        include JSON::Serializable

        # The attributes to apply to your resource. You can specify up to 10 custom attributes for each
        # resource. You can specify up to 10 attributes in a single call.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)

        # The short name or full Amazon Resource Name (ARN) of the cluster that contains the resource to apply
        # attributes. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        def initialize(
          @attributes : Array(Types::Attribute),
          @cluster : String? = nil
        )
        end
      end

      struct PutAttributesResponse
        include JSON::Serializable

        # The attributes applied to your resource.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil
        )
        end
      end

      struct PutClusterCapacityProvidersRequest
        include JSON::Serializable

        # The name of one or more capacity providers to associate with the cluster. If specifying a capacity
        # provider that uses an Auto Scaling group, the capacity provider must already be created. New
        # capacity providers can be created with the CreateCapacityProvider API operation. To use a Fargate
        # capacity provider, specify either the FARGATE or FARGATE_SPOT capacity providers. The Fargate
        # capacity providers are available to all accounts and only need to be associated with a cluster to be
        # used.
        @[JSON::Field(key: "capacityProviders")]
        getter capacity_providers : Array(String)

        # The short name or full Amazon Resource Name (ARN) of the cluster to modify the capacity provider
        # settings for. If you don't specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The capacity provider strategy to use by default for the cluster. When creating a service or running
        # a task on a cluster, if no capacity provider or launch type is specified then the default capacity
        # provider strategy for the cluster is used. A capacity provider strategy consists of one or more
        # capacity providers along with the base and weight to assign to them. A capacity provider must be
        # associated with the cluster to be used in a capacity provider strategy. The
        # PutClusterCapacityProviders API is used to associate a capacity provider with a cluster. Only
        # capacity providers with an ACTIVE or UPDATING status can be used. If specifying a capacity provider
        # that uses an Auto Scaling group, the capacity provider must already be created. New capacity
        # providers can be created with the CreateCapacityProvider API operation. To use a Fargate capacity
        # provider, specify either the FARGATE or FARGATE_SPOT capacity providers. The Fargate capacity
        # providers are available to all accounts and only need to be associated with a cluster to be used.
        @[JSON::Field(key: "defaultCapacityProviderStrategy")]
        getter default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)

        def initialize(
          @capacity_providers : Array(String),
          @cluster : String,
          @default_capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)
        )
        end
      end

      struct PutClusterCapacityProvidersResponse
        include JSON::Serializable

        # Details about the cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct RegisterContainerInstanceRequest
        include JSON::Serializable

        # The container instance attributes that this container instance supports.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        # The short name or full Amazon Resource Name (ARN) of the cluster to register your container instance
        # with. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The ARN of the container instance (if it was previously registered).
        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # The instance identity document for the EC2 instance to register. This document can be found by
        # running the following command from the instance: curl
        # http://169.254.169.254/latest/dynamic/instance-identity/document/
        @[JSON::Field(key: "instanceIdentityDocument")]
        getter instance_identity_document : String?

        # The instance identity document signature for the EC2 instance to register. This signature can be
        # found by running the following command from the instance: curl
        # http://169.254.169.254/latest/dynamic/instance-identity/signature/
        @[JSON::Field(key: "instanceIdentityDocumentSignature")]
        getter instance_identity_document_signature : String?

        # The devices that are available on the container instance. The only supported device type is a GPU.
        @[JSON::Field(key: "platformDevices")]
        getter platform_devices : Array(Types::PlatformDevice)?

        # The metadata that you apply to the container instance to help you categorize and organize them. Each
        # tag consists of a key and an optional value. You define both. The following basic restrictions apply
        # to tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique,
        # and each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8
        # Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is used across
        # multiple services and resources, remember that other services may have restrictions on allowed
        # characters. Generally allowed characters are: letters, numbers, and spaces representable in UTF-8,
        # and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use
        # aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as
        # it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this
        # prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The resources available on the instance.
        @[JSON::Field(key: "totalResources")]
        getter total_resources : Array(Types::Resource)?

        # The version information for the Amazon ECS container agent and Docker daemon that runs on the
        # container instance.
        @[JSON::Field(key: "versionInfo")]
        getter version_info : Types::VersionInfo?

        def initialize(
          @attributes : Array(Types::Attribute)? = nil,
          @cluster : String? = nil,
          @container_instance_arn : String? = nil,
          @instance_identity_document : String? = nil,
          @instance_identity_document_signature : String? = nil,
          @platform_devices : Array(Types::PlatformDevice)? = nil,
          @tags : Array(Types::Tag)? = nil,
          @total_resources : Array(Types::Resource)? = nil,
          @version_info : Types::VersionInfo? = nil
        )
        end
      end

      struct RegisterContainerInstanceResponse
        include JSON::Serializable

        # The container instance that was registered.
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : Types::ContainerInstance?

        def initialize(
          @container_instance : Types::ContainerInstance? = nil
        )
        end
      end

      struct RegisterTaskDefinitionRequest
        include JSON::Serializable

        # A list of container definitions in JSON format that describe the different containers that make up
        # your task.
        @[JSON::Field(key: "containerDefinitions")]
        getter container_definitions : Array(Types::ContainerDefinition)

        # You must specify a family for a task definition. You can use it track multiple versions of the same
        # task definition. The family is used as a name for your task definition. Up to 255 letters (uppercase
        # and lowercase), numbers, underscores, and hyphens are allowed.
        @[JSON::Field(key: "family")]
        getter family : String

        # The number of CPU units used by the task. It can be expressed as an integer using CPU units (for
        # example, 1024 ) or as a string using vCPUs (for example, 1 vCPU or 1 vcpu ) in a task definition.
        # String values are converted to an integer indicating the CPU units when the task definition is
        # registered. Task-level CPU and memory parameters are ignored for Windows containers. We recommend
        # specifying container-level resources for Windows containers. If you're using the EC2 launch type or
        # external launch type, this field is optional. Supported values are between 128 CPU units ( 0.125
        # vCPUs) and 196608 CPU units ( 192 vCPUs). If you do not specify a value, the parameter is ignored.
        # This field is required for Fargate. For information about the valid values, see Task size in the
        # Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # Enables fault injection when you register your task definition and allows for fault injection
        # requests to be accepted from the task's containers. The default value is false .
        @[JSON::Field(key: "enableFaultInjection")]
        getter enable_fault_injection : Bool?

        # The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total
        # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate. For
        # more information, see Using data volumes in tasks in the Amazon ECS Developer Guide . For tasks
        # using the Fargate launch type, the task requires the following platforms: Linux platform version
        # 1.4.0 or later. Windows platform version 1.0.0 or later.
        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS container agent
        # permission to make Amazon Web Services API calls on your behalf. For informationabout the required
        # IAM roles for Amazon ECS, see IAM roles for Amazon ECS in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The Elastic Inference accelerators to use for the containers in the task.
        @[JSON::Field(key: "inferenceAccelerators")]
        getter inference_accelerators : Array(Types::InferenceAccelerator)?

        # The IPC resource namespace to use for the containers in the task. The valid values are host , task ,
        # or none . If host is specified, then all containers within the tasks that specified the host IPC
        # mode on the same container instance share the same IPC resources with the host Amazon EC2 instance.
        # If task is specified, all containers within the specified task share the same IPC resources. If none
        # is specified, then IPC resources within the containers of a task are private and not shared with
        # other containers in a task or on the container instance. If no value is specified, then the IPC
        # resource namespace sharing depends on the Docker daemon setting on the container instance. If the
        # host IPC mode is used, be aware that there is a heightened risk of undesired IPC namespace expose.
        # If you are setting namespaced kernel parameters using systemControls for the containers in the task,
        # the following will apply to your IPC resource namespace. For more information, see System Controls
        # in the Amazon Elastic Container Service Developer Guide . For tasks that use the host IPC mode, IPC
        # namespace related systemControls are not supported. For tasks that use the task IPC mode, IPC
        # namespace related systemControls will apply to all containers within a task. This parameter is not
        # supported for Windows containers or tasks run on Fargate.
        @[JSON::Field(key: "ipcMode")]
        getter ipc_mode : String?

        # The amount of memory (in MiB) used by the task. It can be expressed as an integer using MiB (for
        # example , 1024 ) or as a string using GB (for example, 1GB or 1 GB ) in a task definition. String
        # values are converted to an integer indicating the MiB when the task definition is registered.
        # Task-level CPU and memory parameters are ignored for Windows containers. We recommend specifying
        # container-level resources for Windows containers. If using the EC2 launch type, this field is
        # optional. If using the Fargate launch type, this field is required and you must use one of the
        # following values. This determines your range of supported values for the cpu parameter. The CPU
        # units cannot be less than 1 vCPU when you use Windows containers on Fargate. 512 (0.5 GB), 1024 (1
        # GB), 2048 (2 GB) - Available cpu values: 256 (.25 vCPU) 1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096
        # (4 GB) - Available cpu values: 512 (.5 vCPU) 2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB),
        # 6144 (6 GB), 7168 (7 GB), 8192 (8 GB) - Available cpu values: 1024 (1 vCPU) Between 4096 (4 GB) and
        # 16384 (16 GB) in increments of 1024 (1 GB) - Available cpu values: 2048 (2 vCPU) Between 8192 (8 GB)
        # and 30720 (30 GB) in increments of 1024 (1 GB) - Available cpu values: 4096 (4 vCPU) Between 16 GB
        # and 60 GB in 4 GB increments - Available cpu values: 8192 (8 vCPU) This option requires Linux
        # platform 1.4.0 or later. Between 32GB and 120 GB in 8 GB increments - Available cpu values: 16384
        # (16 vCPU) This option requires Linux platform 1.4.0 or later.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The Docker networking mode to use for the containers in the task. The valid values are none , bridge
        # , awsvpc , and host . If no network mode is specified, the default is bridge . For Amazon ECS tasks
        # on Fargate, the awsvpc network mode is required. For Amazon ECS tasks on Amazon EC2 Linux instances,
        # any network mode can be used. For Amazon ECS tasks on Amazon EC2 Windows instances, &lt;default&gt;
        # or awsvpc can be used. If the network mode is set to none , you cannot specify port mappings in your
        # container definitions, and the tasks containers do not have external connectivity. The host and
        # awsvpc network modes offer the highest networking performance for containers because they use the
        # EC2 network stack instead of the virtualized network stack provided by the bridge mode. With the
        # host and awsvpc network modes, exposed container ports are mapped directly to the corresponding host
        # port (for the host network mode) or the attached elastic network interface port (for the awsvpc
        # network mode), so you cannot take advantage of dynamic host port mappings. When using the host
        # network mode, you should not run containers using the root user (UID 0). It is considered best
        # practice to use a non-root user. If the network mode is awsvpc , the task is allocated an elastic
        # network interface, and you must specify a NetworkConfiguration value when you create a service or
        # run a task with the task definition. For more information, see Task Networking in the Amazon Elastic
        # Container Service Developer Guide . If the network mode is host , you cannot run multiple
        # instantiations of the same task on a single container instance when port mappings are used.
        @[JSON::Field(key: "networkMode")]
        getter network_mode : String?

        # The process namespace to use for the containers in the task. The valid values are host or task . On
        # Fargate for Linux containers, the only valid value is task . For example, monitoring sidecars might
        # need pidMode to access information about other containers running in the same task. If host is
        # specified, all containers within the tasks that specified the host PID mode on the same container
        # instance share the same process namespace with the host Amazon EC2 instance. If task is specified,
        # all containers within the specified task share the same process namespace. If no value is specified,
        # the The default is a private namespace for each container. If the host PID mode is used, there's a
        # heightened risk of undesired process namespace exposure. This parameter is not supported for Windows
        # containers. This parameter is only supported for tasks that are hosted on Fargate if the tasks are
        # using platform version 1.4.0 or later (Linux). This isn't supported for Windows containers on
        # Fargate.
        @[JSON::Field(key: "pidMode")]
        getter pid_mode : String?

        # An array of placement constraint objects to use for the task. You can specify a maximum of 10
        # constraints for each task. This limit includes constraints in the task definition and those
        # specified at runtime.
        @[JSON::Field(key: "placementConstraints")]
        getter placement_constraints : Array(Types::TaskDefinitionPlacementConstraint)?

        # The configuration details for the App Mesh proxy. For tasks hosted on Amazon EC2 instances, the
        # container instances require at least version 1.26.0 of the container agent and at least version
        # 1.26.0-1 of the ecs-init package to use a proxy configuration. If your container instances are
        # launched from the Amazon ECS-optimized AMI version 20190301 or later, then they contain the required
        # versions of the container agent and ecs-init . For more information, see Amazon ECS-optimized AMI
        # versions in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "proxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # The task launch type that Amazon ECS validates the task definition against. A client exception is
        # returned if the task definition doesn't validate against the compatibilities specified. If no value
        # is specified, the parameter is omitted from the response.
        @[JSON::Field(key: "requiresCompatibilities")]
        getter requires_compatibilities : Array(String)?

        # The operating system that your tasks definitions run on.
        @[JSON::Field(key: "runtimePlatform")]
        getter runtime_platform : Types::RuntimePlatform?

        # The metadata that you apply to the task definition to help you categorize and organize them. Each
        # tag consists of a key and an optional value. You define both of them. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50 For each resource, each tag key
        # must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8 Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is
        # used across multiple services and resources, remember that other services may have restrictions on
        # allowed characters. Generally allowed characters are: letters, numbers, and spaces representable in
        # UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not
        # use aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or
        # values as it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values
        # with this prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The short name or full Amazon Resource Name (ARN) of the IAM role that containers in this task can
        # assume. All containers in this task are granted the permissions that are specified in this role. For
        # more information, see IAM Roles for Tasks in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        # A list of volume definitions in JSON format that containers in your task might use.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @container_definitions : Array(Types::ContainerDefinition),
          @family : String,
          @cpu : String? = nil,
          @enable_fault_injection : Bool? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @inference_accelerators : Array(Types::InferenceAccelerator)? = nil,
          @ipc_mode : String? = nil,
          @memory : String? = nil,
          @network_mode : String? = nil,
          @pid_mode : String? = nil,
          @placement_constraints : Array(Types::TaskDefinitionPlacementConstraint)? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @requires_compatibilities : Array(String)? = nil,
          @runtime_platform : Types::RuntimePlatform? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_role_arn : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      struct RegisterTaskDefinitionResponse
        include JSON::Serializable

        # The list of tags associated with the task definition.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The full description of the registered task definition.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : Types::TaskDefinition?

        def initialize(
          @tags : Array(Types::Tag)? = nil,
          @task_definition : Types::TaskDefinition? = nil
        )
        end
      end

      # The repository credentials for private registry authentication.
      struct RepositoryCredentials
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret containing the private repository credentials. When you
        # use the Amazon ECS API, CLI, or Amazon Web Services SDK, if the secret exists in the same Region as
        # the task that you're launching then you can use either the full ARN or the name of the secret. When
        # you use the Amazon Web Services Management Console, you must specify the full ARN of the secret.
        @[JSON::Field(key: "credentialsParameter")]
        getter credentials_parameter : String

        def initialize(
          @credentials_parameter : String
        )
        end
      end

      # The resolved configuration for a service revision, which contains the actual resources your service
      # revision uses, such as which target groups serve traffic.
      struct ResolvedConfiguration
        include JSON::Serializable

        # The resolved load balancer configuration for the service revision. This includes information about
        # which target groups serve traffic and which listener rules direct traffic to them.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::ServiceRevisionLoadBalancer)?

        def initialize(
          @load_balancers : Array(Types::ServiceRevisionLoadBalancer)? = nil
        )
        end
      end

      # Describes the resources available for a container instance.
      struct Resource
        include JSON::Serializable

        # When the doubleValue type is set, the value of the resource must be a double precision
        # floating-point type.
        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # When the integerValue type is set, the value of the resource must be an integer.
        @[JSON::Field(key: "integerValue")]
        getter integer_value : Int32?

        # When the longValue type is set, the value of the resource must be an extended precision
        # floating-point type.
        @[JSON::Field(key: "longValue")]
        getter long_value : Int64?

        # The name of the resource, such as CPU , MEMORY , PORTS , PORTS_UDP , or a user-defined resource.
        @[JSON::Field(key: "name")]
        getter name : String?

        # When the stringSetValue type is set, the value of the resource must be a string type.
        @[JSON::Field(key: "stringSetValue")]
        getter string_set_value : Array(String)?

        # The type of the resource. Valid values: INTEGER , DOUBLE , LONG , or STRINGSET .
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @double_value : Float64? = nil,
          @integer_value : Int32? = nil,
          @long_value : Int64? = nil,
          @name : String? = nil,
          @string_set_value : Array(String)? = nil,
          @type : String? = nil
        )
        end
      end

      # The specified resource is in-use and can't be removed.
      struct ResourceInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource wasn't found.
      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The type and amount of a resource to assign to a container. The supported resource types are GPUs
      # and Elastic Inference accelerators. For more information, see Working with GPUs on Amazon ECS or
      # Working with Amazon Elastic Inference on Amazon ECS in the Amazon Elastic Container Service
      # Developer Guide
      struct ResourceRequirement
        include JSON::Serializable

        # The type of resource to assign to a container.
        @[JSON::Field(key: "type")]
        getter type : String

        # The value for the specified resource type. When the type is GPU , the value is the number of
        # physical GPUs the Amazon ECS container agent reserves for the container. The number of GPUs that's
        # reserved for all containers in a task can't exceed the number of available GPUs on the container
        # instance that the task is launched on. When the type is InferenceAccelerator , the value matches the
        # deviceName for an InferenceAccelerator specified in a task definition.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # Information about the service deployment rollback.
      struct Rollback
        include JSON::Serializable

        # The reason the rollback happened. For example, the circuit breaker initiated the rollback operation.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The ARN of the service revision deployed as part of the rollback.
        @[JSON::Field(key: "serviceRevisionArn")]
        getter service_revision_arn : String?

        # Time time that the rollback started. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        def initialize(
          @reason : String? = nil,
          @service_revision_arn : String? = nil,
          @started_at : Time? = nil
        )
        end
      end

      struct RunTaskRequest
        include JSON::Serializable

        # The family and revision ( family:revision ) or full ARN of the task definition to run. If a revision
        # isn't specified, the latest ACTIVE revision is used. The full ARN value must match the value that
        # you specified as the Resource of the principal's permissions policy. When you specify a task
        # definition, you must either specify a specific revision, or all revisions in the ARN. To specify a
        # specific revision, include the revision number in the ARN. For example, to specify revision 2, use
        # arn:aws:ecs:us-east-1:111122223333:task-definition/TaskFamilyName:2 . To specify all revisions, use
        # the wildcard (*) in the ARN. For example, to specify all revisions, use
        # arn:aws:ecs:us-east-1:111122223333:task-definition/TaskFamilyName:* . For more information, see
        # Policy Resources for Amazon ECS in the Amazon Elastic Container Service Developer Guide.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String

        # The capacity provider strategy to use for the task. If you want to use Amazon ECS Managed Instances,
        # you must use the capacityProviderStrategy request parameter and omit the launchType request
        # parameter. If a capacityProviderStrategy is specified, the launchType parameter must be omitted. If
        # no capacityProviderStrategy or launchType is specified, the defaultCapacityProviderStrategy for the
        # cluster is used. When you use cluster auto scaling, you must specify capacityProviderStrategy and
        # not launchType . A capacity provider strategy can contain a maximum of 20 capacity providers.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # An identifier that you provide to ensure the idempotency of the request. It must be unique and is
        # case sensitive. Up to 64 characters are allowed. The valid characters are characters in the range of
        # 33-126, inclusive. For more information, see Ensuring idempotency .
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The short name or full Amazon Resource Name (ARN) of the cluster to run your task on. If you do not
        # specify a cluster, the default cluster is assumed. Each account receives a default cluster the first
        # time you use the service, but you may also create other clusters.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The number of instantiations of the specified task to place on your cluster. You can specify up to
        # 10 tasks for each call.
        @[JSON::Field(key: "count")]
        getter count : Int32?

        # Specifies whether to use Amazon ECS managed tags for the task. For more information, see Tagging
        # Your Amazon ECS Resources in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "enableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Determines whether to use the execute command functionality for the containers in this task. If true
        # , this enables execute command functionality on all containers in the task. If true , then the task
        # definition must have a task role, or you must provide one as an override.
        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The name of the task group to associate with the task. The default value is the family name of the
        # task definition (for example, family:my-family-name ).
        @[JSON::Field(key: "group")]
        getter group : String?

        # The infrastructure to run your standalone task on. For more information, see Amazon ECS launch types
        # in the Amazon Elastic Container Service Developer Guide . If you want to use Amazon ECS Managed
        # Instances, you must use the capacityProviderStrategy request parameter and omit the launchType
        # request parameter. The FARGATE launch type runs your tasks on Fargate On-Demand infrastructure.
        # Fargate Spot infrastructure is available for use but a capacity provider strategy must be used. For
        # more information, see Fargate capacity providers in the Amazon ECS Developer Guide . The EC2 launch
        # type runs your tasks on Amazon EC2 instances registered to your cluster. The EXTERNAL launch type
        # runs your tasks on your on-premises server or virtual machine (VM) capacity registered to your
        # cluster. A task can use either a launch type or a capacity provider strategy. If a launchType is
        # specified, the capacityProviderStrategy parameter must be omitted. When you use cluster auto
        # scaling, you must specify capacityProviderStrategy and not launchType .
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The network configuration for the task. This parameter is required for task definitions that use the
        # awsvpc network mode to receive their own elastic network interface, and it isn't supported for other
        # network modes. For more information, see Task networking in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # A list of container overrides in JSON format that specify the name of a container in the specified
        # task definition and the overrides it should receive. You can override the default command for a
        # container (that's specified in the task definition or Docker image) with a command override. You can
        # also override existing environment variables (that are specified in the task definition or Docker
        # image) on a container or add new environment variables to it with an environment override. A total
        # of 8192 characters are allowed for overrides. This limit includes the JSON formatting characters of
        # the override structure.
        @[JSON::Field(key: "overrides")]
        getter overrides : Types::TaskOverride?

        # An array of placement constraint objects to use for the task. You can specify up to 10 constraints
        # for each task (including constraints in the task definition and those specified at runtime).
        @[JSON::Field(key: "placementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The placement strategy objects to use for the task. You can specify a maximum of 5 strategy rules
        # for each task.
        @[JSON::Field(key: "placementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # The platform version the task uses. A platform version is only specified for tasks hosted on
        # Fargate. If one isn't specified, the LATEST platform version is used. For more information, see
        # Fargate platform versions in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # Specifies whether to propagate the tags from the task definition to the task. If no value is
        # specified, the tags aren't propagated. Tags can only be propagated to the task during task creation.
        # To add tags to a task after task creation, use the TagResource API action. An error will be received
        # if you specify the SERVICE option when running a task.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # This parameter is only used by Amazon ECS. It is not intended for use by customers.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String?

        # An optional tag specified when a task is started. For example, if you automatically trigger a task
        # to run a batch process job, you could apply a unique identifier for that job to your task with the
        # startedBy parameter. You can then identify which tasks belong to that job by filtering the results
        # of a ListTasks call with the startedBy value. Up to 128 letters (uppercase and lowercase), numbers,
        # hyphens (-), forward slash (/), and underscores (_) are allowed. If a task is started by an Amazon
        # ECS service, then the startedBy parameter contains the deployment ID of the service that starts it.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # The metadata that you apply to the task to help you categorize and organize them. Each tag consists
        # of a key and an optional value, both of which you define. The following basic restrictions apply to
        # tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique, and
        # each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8 Maximum
        # value length - 256 Unicode characters in UTF-8 If your tagging schema is used across multiple
        # services and resources, remember that other services may have restrictions on allowed characters.
        # Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, and the
        # following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use aws: ,
        # AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this prefix.
        # Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The details of the volume that was configuredAtLaunch . You can configure the size, volumeType,
        # IOPS, throughput, snapshot and encryption in TaskManagedEBSVolumeConfiguration . The name of the
        # volume must match the name from the task definition.
        @[JSON::Field(key: "volumeConfigurations")]
        getter volume_configurations : Array(Types::TaskVolumeConfiguration)?

        def initialize(
          @task_definition : String,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @client_token : String? = nil,
          @cluster : String? = nil,
          @count : Int32? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @group : String? = nil,
          @launch_type : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @overrides : Types::TaskOverride? = nil,
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @reference_id : String? = nil,
          @started_by : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_configurations : Array(Types::TaskVolumeConfiguration)? = nil
        )
        end
      end

      struct RunTaskResponse
        include JSON::Serializable

        # Any failures associated with the call. For information about how to address failures, see Service
        # event messages and API failure reasons in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # A full description of the tasks that were run. The tasks that were successfully placed on your
        # cluster are described here.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::Task)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @tasks : Array(Types::Task)? = nil
        )
        end
      end

      # Information about the platform for the Amazon ECS service or task. For more information about
      # RuntimePlatform , see RuntimePlatform in the Amazon Elastic Container Service Developer Guide .
      struct RuntimePlatform
        include JSON::Serializable

        # The CPU architecture. You can run your Linux tasks on an ARM-based platform by setting the value to
        # ARM64 . This option is available for tasks that run on Linux Amazon EC2 instance, Amazon ECS Managed
        # Instances, or Linux containers on Fargate.
        @[JSON::Field(key: "cpuArchitecture")]
        getter cpu_architecture : String?

        # The operating system.
        @[JSON::Field(key: "operatingSystemFamily")]
        getter operating_system_family : String?

        def initialize(
          @cpu_architecture : String? = nil,
          @operating_system_family : String? = nil
        )
        end
      end

      # A floating-point percentage of the desired number of tasks to place and keep running in the task
      # set.
      struct Scale
        include JSON::Serializable

        # The unit of measure for the scale value.
        @[JSON::Field(key: "unit")]
        getter unit : String?

        # The value, specified as a percent total of a service's desiredCount , to scale the task set.
        # Accepted values are numbers between 0 and 100.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @unit : String? = nil,
          @value : Float64? = nil
        )
        end
      end

      # An object representing the secret to expose to your container. Secrets can be exposed to a container
      # in the following ways: To inject sensitive data into your containers as environment variables, use
      # the secrets container definition parameter. To reference sensitive information in the log
      # configuration of a container, use the secretOptions container definition parameter. For more
      # information, see Specifying sensitive data in the Amazon Elastic Container Service Developer Guide .
      struct Secret
        include JSON::Serializable

        # The name of the secret.
        @[JSON::Field(key: "name")]
        getter name : String

        # The secret to expose to the container. The supported values are either the full ARN of the Secrets
        # Manager secret or the full ARN of the parameter in the SSM Parameter Store. For information about
        # the require Identity and Access Management permissions, see Required IAM permissions for Amazon ECS
        # secrets (for Secrets Manager) or Required IAM permissions for Amazon ECS secrets (for Systems
        # Manager Parameter store) in the Amazon Elastic Container Service Developer Guide . If the SSM
        # Parameter Store parameter exists in the same Region as the task you're launching, then you can use
        # either the full ARN or name of the parameter. If the parameter exists in a different Region, then
        # the full ARN must be specified.
        @[JSON::Field(key: "valueFrom")]
        getter value_from : String

        def initialize(
          @name : String,
          @value_from : String
        )
        end
      end

      # These errors are usually caused by a server issue.
      struct ServerException
        include JSON::Serializable

        # Message that describes the cause of the exception.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Details on a service within a cluster.
      struct Service
        include JSON::Serializable

        # Indicates whether to use Availability Zone rebalancing for the service. For more information, see
        # Balancing an Amazon ECS service across Availability Zones in the Amazon Elastic Container Service
        # Developer Guide . The default behavior of AvailabilityZoneRebalancing differs between create and
        # update requests: For create service requests, when no value is specified for
        # AvailabilityZoneRebalancing , Amazon ECS defaults the value to ENABLED . For update service
        # requests, when no value is specified for AvailabilityZoneRebalancing , Amazon ECS defaults to the
        # existing service’s AvailabilityZoneRebalancing value. If the service never had an
        # AvailabilityZoneRebalancing value set, Amazon ECS treats this as DISABLED .
        @[JSON::Field(key: "availabilityZoneRebalancing")]
        getter availability_zone_rebalancing : String?

        # The capacity provider strategy the service uses. When using the DescribeServices API, this field is
        # omitted if the service was created using a launch type.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # The Amazon Resource Name (ARN) of the cluster that hosts the service.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The Unix timestamp for the time when the service was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The principal that created the service.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The ARN of the current service deployment.
        @[JSON::Field(key: "currentServiceDeployment")]
        getter current_service_deployment : String?

        # The list of the service revisions.
        @[JSON::Field(key: "currentServiceRevisions")]
        getter current_service_revisions : Array(Types::ServiceCurrentRevisionSummary)?

        # Optional deployment parameters that control how many tasks run during the deployment and the
        # ordering of stopping and starting tasks.
        @[JSON::Field(key: "deploymentConfiguration")]
        getter deployment_configuration : Types::DeploymentConfiguration?

        # The deployment controller type the service is using.
        @[JSON::Field(key: "deploymentController")]
        getter deployment_controller : Types::DeploymentController?

        # The current state of deployments for the service.
        @[JSON::Field(key: "deployments")]
        getter deployments : Array(Types::Deployment)?

        # The desired number of instantiations of the task definition to keep running on the service. This
        # value is specified when the service is created with CreateService , and it can be modified with
        # UpdateService .
        @[JSON::Field(key: "desiredCount")]
        getter desired_count : Int32?

        # Determines whether to use Amazon ECS managed tags for the tasks in the service. For more
        # information, see Tagging Your Amazon ECS Resources in the Amazon Elastic Container Service Developer
        # Guide .
        @[JSON::Field(key: "enableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Determines whether the execute command functionality is turned on for the service. If true , the
        # execute command functionality is turned on for all containers in tasks as part of the service.
        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The event stream for your service. A maximum of 100 of the latest events are displayed.
        @[JSON::Field(key: "events")]
        getter events : Array(Types::ServiceEvent)?

        # The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy Elastic Load
        # Balancing, VPC Lattice, and container health checks after a task has first started. If your service
        # has more running tasks than desired, unhealthy tasks in the grace period might be stopped to reach
        # the desired count.
        @[JSON::Field(key: "healthCheckGracePeriodSeconds")]
        getter health_check_grace_period_seconds : Int32?

        # The launch type the service is using. When using the DescribeServices API, this field is omitted if
        # the service was created using a capacity provider strategy.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # A list of Elastic Load Balancing load balancer objects. It contains the load balancer name, the
        # container name, and the container port to access from the load balancer. The container name is as it
        # appears in a container definition.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # The VPC subnet and security group configuration for tasks that receive their own elastic network
        # interface by using the awsvpc networking mode.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The number of tasks in the cluster that are in the PENDING state.
        @[JSON::Field(key: "pendingCount")]
        getter pending_count : Int32?

        # The placement constraints for the tasks in the service.
        @[JSON::Field(key: "placementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The placement strategy that determines how tasks for the service are placed.
        @[JSON::Field(key: "placementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # The operating system that your tasks in the service run on. A platform family is specified only for
        # tasks using the Fargate launch type. All tasks that run as part of this service must use the same
        # platformFamily value as the service (for example, LINUX ).
        @[JSON::Field(key: "platformFamily")]
        getter platform_family : String?

        # The platform version to run your service on. A platform version is only specified for tasks that are
        # hosted on Fargate. If one isn't specified, the LATEST platform version is used. For more
        # information, see Fargate Platform Versions in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # Determines whether to propagate the tags from the task definition or the service to the task. If no
        # value is specified, the tags aren't propagated.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # Identifies whether an ECS Service is an Express Service managed by ECS, or managed by the customer.
        # The valid values are ECS and CUSTOMER
        @[JSON::Field(key: "resourceManagementType")]
        getter resource_management_type : String?

        # The ARN of the IAM role that's associated with the service. It allows the Amazon ECS container agent
        # to register container instances with an Elastic Load Balancing load balancer.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The number of tasks in the cluster that are in the RUNNING state.
        @[JSON::Field(key: "runningCount")]
        getter running_count : Int32?

        # The scheduling strategy to use for the service. For more information, see Services . There are two
        # service scheduler strategies available. REPLICA -The replica scheduling strategy places and
        # maintains the desired number of tasks across your cluster. By default, the service scheduler spreads
        # tasks across Availability Zones. You can use task placement strategies and constraints to customize
        # task placement decisions. DAEMON -The daemon scheduling strategy deploys exactly one task on each
        # active container instance. This task meets all of the task placement constraints that you specify in
        # your cluster. The service scheduler also evaluates the task placement constraints for running tasks.
        # It stop tasks that don't meet the placement constraints. Fargate tasks don't support the DAEMON
        # scheduling strategy.
        @[JSON::Field(key: "schedulingStrategy")]
        getter scheduling_strategy : String?

        # The ARN that identifies the service. For more information about the ARN format, see Amazon Resource
        # Name (ARN) in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The name of your service. Up to 255 letters (uppercase and lowercase), numbers, underscores, and
        # hyphens are allowed. Service names must be unique within a cluster. However, you can have similarly
        # named services in multiple clusters within a Region or across multiple Regions.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The details for the service discovery registries to assign to this service. For more information,
        # see Service Discovery .
        @[JSON::Field(key: "serviceRegistries")]
        getter service_registries : Array(Types::ServiceRegistry)?

        # The status of the service. The valid values are ACTIVE , DRAINING , or INACTIVE .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The metadata that you apply to the service to help you categorize and organize them. Each tag
        # consists of a key and an optional value. You define bot the key and value. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50 For each resource, each tag key
        # must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8 Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is
        # used across multiple services and resources, remember that other services may have restrictions on
        # allowed characters. Generally allowed characters are: letters, numbers, and spaces representable in
        # UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not
        # use aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or
        # values as it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values
        # with this prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The task definition to use for tasks in the service. This value is specified when the service is
        # created with CreateService , and it can be modified with UpdateService .
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String?

        # Information about a set of Amazon ECS tasks in either an CodeDeploy or an EXTERNAL deployment. An
        # Amazon ECS task set includes details such as the desired number of tasks, how many tasks are
        # running, and whether the task set serves production traffic.
        @[JSON::Field(key: "taskSets")]
        getter task_sets : Array(Types::TaskSet)?

        def initialize(
          @availability_zone_rebalancing : String? = nil,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @cluster_arn : String? = nil,
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @current_service_deployment : String? = nil,
          @current_service_revisions : Array(Types::ServiceCurrentRevisionSummary)? = nil,
          @deployment_configuration : Types::DeploymentConfiguration? = nil,
          @deployment_controller : Types::DeploymentController? = nil,
          @deployments : Array(Types::Deployment)? = nil,
          @desired_count : Int32? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @events : Array(Types::ServiceEvent)? = nil,
          @health_check_grace_period_seconds : Int32? = nil,
          @launch_type : String? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @pending_count : Int32? = nil,
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_family : String? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @resource_management_type : String? = nil,
          @role_arn : String? = nil,
          @running_count : Int32? = nil,
          @scheduling_strategy : String? = nil,
          @service_arn : String? = nil,
          @service_name : String? = nil,
          @service_registries : Array(Types::ServiceRegistry)? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_definition : String? = nil,
          @task_sets : Array(Types::TaskSet)? = nil
        )
        end
      end

      # Configuration for Service Connect access logging. Access logs provide detailed information about
      # requests made to your service, including request patterns, response codes, and timing data for
      # debugging and monitoring purposes. To enable access logs, you must also specify a logConfiguration
      # in the serviceConnectConfiguration .
      struct ServiceConnectAccessLogConfiguration
        include JSON::Serializable

        # The format for Service Connect access log output. Choose TEXT for human-readable logs or JSON for
        # structured data that integrates well with log analysis tools.
        @[JSON::Field(key: "format")]
        getter format : String

        # Specifies whether to include query parameters in Service Connect access logs. When enabled, query
        # parameters from HTTP requests are included in the access logs. Consider security and privacy
        # implications when enabling this feature, as query parameters may contain sensitive information such
        # as request IDs and tokens. By default, this parameter is DISABLED .
        @[JSON::Field(key: "includeQueryParameters")]
        getter include_query_parameters : String?

        def initialize(
          @format : String,
          @include_query_parameters : String? = nil
        )
        end
      end

      # Each alias ("endpoint") is a fully-qualified name and port number that other tasks ("clients") can
      # use to connect to this service. Each name and port mapping must be unique within the namespace.
      # Tasks that run in a namespace can use short names to connect to services in the namespace. Tasks can
      # connect to services across all of the clusters in the namespace. Tasks connect through a managed
      # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
      # ECS services create are supported with Service Connect. For more information, see Service Connect in
      # the Amazon Elastic Container Service Developer Guide .
      struct ServiceConnectClientAlias
        include JSON::Serializable

        # The listening port number for the Service Connect proxy. This port is available inside of all of the
        # tasks within the same namespace. To avoid changing your applications in client Amazon ECS services,
        # set this to the same port that the client application uses by default. For more information, see
        # Service Connect in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The dnsName is the name that you use in the applications of client tasks to connect to this service.
        # The name must be a valid DNS name but doesn't need to be fully-qualified. The name can include up to
        # 127 characters. The name can include lowercase letters, numbers, underscores (_), hyphens (-), and
        # periods (.). The name can't start with a hyphen. If this parameter isn't specified, the default
        # value of discoveryName.namespace is used. If the discoveryName isn't specified, the port mapping
        # name from the task definition is used in portName.namespace . To avoid changing your applications in
        # client Amazon ECS services, set this to the same name that the client application uses by default.
        # For example, a few common names are database , db , or the lowercase name of a database, such as
        # mysql or redis . For more information, see Service Connect in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String?

        # The configuration for test traffic routing rules used during blue/green deployments with Amazon ECS
        # Service Connect. This allows you to route a portion of traffic to the new service revision of your
        # service for testing before shifting all production traffic.
        @[JSON::Field(key: "testTrafficRules")]
        getter test_traffic_rules : Types::ServiceConnectTestTrafficRules?

        def initialize(
          @port : Int32,
          @dns_name : String? = nil,
          @test_traffic_rules : Types::ServiceConnectTestTrafficRules? = nil
        )
        end
      end

      # The Service Connect configuration of your Amazon ECS service. The configuration for this service to
      # discover and connect to services, and be discovered by, and connected from, other services within a
      # namespace. Tasks that run in a namespace can use short names to connect to services in the
      # namespace. Tasks can connect to services across all of the clusters in the namespace. Tasks connect
      # through a managed proxy container that collects logs and metrics for increased visibility. Only the
      # tasks that Amazon ECS services create are supported with Service Connect. For more information, see
      # Service Connect in the Amazon Elastic Container Service Developer Guide .
      struct ServiceConnectConfiguration
        include JSON::Serializable

        # Specifies whether to use Service Connect with this service.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The configuration for Service Connect access logging. Access logs capture detailed information about
        # requests made to your service, including request patterns, response codes, and timing data. They can
        # be useful for debugging connectivity issues, monitoring service performance, and auditing
        # service-to-service communication for security and compliance purposes. To enable access logs, you
        # must also specify a logConfiguration in the serviceConnectConfiguration .
        @[JSON::Field(key: "accessLogConfiguration")]
        getter access_log_configuration : Types::ServiceConnectAccessLogConfiguration?

        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The namespace name or full Amazon Resource Name (ARN) of the Cloud Map namespace for use with
        # Service Connect. The namespace must be in the same Amazon Web Services Region as the Amazon ECS
        # service and cluster. The type of namespace doesn't affect Service Connect. For more information
        # about Cloud Map, see Working with Services in the Cloud Map Developer Guide .
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The list of Service Connect service objects. These are names and aliases (also known as endpoints)
        # that are used by other Amazon ECS services to connect to this service. This field is not required
        # for a "client" Amazon ECS service that's a member of a namespace only to connect to other services
        # within the namespace. An example of this would be a frontend application that accepts incoming
        # requests from either a load balancer that's attached to the service or by other means. An object
        # selects a port from the task definition, assigns a name for the Cloud Map service, and a list of
        # aliases (endpoints) and ports for client applications to refer to this service.
        @[JSON::Field(key: "services")]
        getter services : Array(Types::ServiceConnectService)?

        def initialize(
          @enabled : Bool,
          @access_log_configuration : Types::ServiceConnectAccessLogConfiguration? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @namespace : String? = nil,
          @services : Array(Types::ServiceConnectService)? = nil
        )
        end
      end

      # The Service Connect service object configuration. For more information, see Service Connect in the
      # Amazon Elastic Container Service Developer Guide .
      struct ServiceConnectService
        include JSON::Serializable

        # The portName must match the name of one of the portMappings from all the containers in the task
        # definition of this Amazon ECS service.
        @[JSON::Field(key: "portName")]
        getter port_name : String

        # The list of client aliases for this Service Connect service. You use these to assign names that can
        # be used by client applications. The maximum number of client aliases that you can have in this list
        # is 1. Each alias ("endpoint") is a fully-qualified name and port number that other Amazon ECS tasks
        # ("clients") can use to connect to this service. Each name and port mapping must be unique within the
        # namespace. For each ServiceConnectService , you must provide at least one clientAlias with one port
        # .
        @[JSON::Field(key: "clientAliases")]
        getter client_aliases : Array(Types::ServiceConnectClientAlias)?

        # The discoveryName is the name of the new Cloud Map service that Amazon ECS creates for this Amazon
        # ECS service. This must be unique within the Cloud Map namespace. The name can contain up to 64
        # characters. The name can include lowercase letters, numbers, underscores (_), and hyphens (-). The
        # name can't start with a hyphen. If the discoveryName isn't specified, the port mapping name from the
        # task definition is used in portName.namespace .
        @[JSON::Field(key: "discoveryName")]
        getter discovery_name : String?

        # The port number for the Service Connect proxy to listen on. Use the value of this field to bypass
        # the proxy for traffic on the port number specified in the named portMapping in the task definition
        # of this application, and then use it in your VPC security groups to allow traffic into the proxy for
        # this Amazon ECS service. In awsvpc mode and Fargate, the default value is the container port number.
        # The container port number is in the portMapping in the task definition. In bridge mode, the default
        # value is the ephemeral port of the Service Connect proxy.
        @[JSON::Field(key: "ingressPortOverride")]
        getter ingress_port_override : Int32?

        # A reference to an object that represents the configured timeouts for Service Connect.
        @[JSON::Field(key: "timeout")]
        getter timeout : Types::TimeoutConfiguration?

        # A reference to an object that represents a Transport Layer Security (TLS) configuration.
        @[JSON::Field(key: "tls")]
        getter tls : Types::ServiceConnectTlsConfiguration?

        def initialize(
          @port_name : String,
          @client_aliases : Array(Types::ServiceConnectClientAlias)? = nil,
          @discovery_name : String? = nil,
          @ingress_port_override : Int32? = nil,
          @timeout : Types::TimeoutConfiguration? = nil,
          @tls : Types::ServiceConnectTlsConfiguration? = nil
        )
        end
      end

      # The Service Connect resource. Each configuration maps a discovery name to a Cloud Map service name.
      # The data is stored in Cloud Map as part of the Service Connect configuration for each discovery name
      # of this Amazon ECS service. A task can resolve the dnsName for each of the clientAliases of a
      # service. However a task can't resolve the discovery names. If you want to connect to a service,
      # refer to the ServiceConnectConfiguration of that service for the list of clientAliases that you can
      # use.
      struct ServiceConnectServiceResource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the service in Cloud Map that matches the discovery name for this
        # Service Connect resource. You can use this ARN in other integrations with Cloud Map. However,
        # Service Connect can't ensure connectivity outside of Amazon ECS.
        @[JSON::Field(key: "discoveryArn")]
        getter discovery_arn : String?

        # The discovery name of this Service Connect resource. The discoveryName is the name of the new Cloud
        # Map service that Amazon ECS creates for this Amazon ECS service. This must be unique within the
        # Cloud Map namespace. The name can contain up to 64 characters. The name can include lowercase
        # letters, numbers, underscores (_), and hyphens (-). The name can't start with a hyphen. If the
        # discoveryName isn't specified, the port mapping name from the task definition is used in
        # portName.namespace .
        @[JSON::Field(key: "discoveryName")]
        getter discovery_name : String?

        def initialize(
          @discovery_arn : String? = nil,
          @discovery_name : String? = nil
        )
        end
      end

      # The header matching rules for test traffic routing in Amazon ECS blue/green deployments. These rules
      # determine how incoming requests are matched based on HTTP headers to route test traffic to the new
      # service revision.
      struct ServiceConnectTestTrafficHeaderMatchRules
        include JSON::Serializable

        # The exact value that the HTTP header must match for the test traffic routing rule to apply. This
        # provides precise control over which requests are routed to the new service revision during
        # blue/green deployments.
        @[JSON::Field(key: "exact")]
        getter exact : String

        def initialize(
          @exact : String
        )
        end
      end

      # The HTTP header rules used to identify and route test traffic during Amazon ECS blue/green
      # deployments. These rules specify which HTTP headers to examine and what values to match for routing
      # decisions. For more information, see Service Connect for Amazon ECS blue/green deployments in the
      # Amazon Elastic Container Service Developer Guide .
      struct ServiceConnectTestTrafficHeaderRules
        include JSON::Serializable

        # The name of the HTTP header to examine for test traffic routing. Common examples include custom
        # headers like X-Test-Version or X-Canary-Request that can be used to identify test traffic.
        @[JSON::Field(key: "name")]
        getter name : String

        # The header value matching configuration that determines how the HTTP header value is evaluated for
        # test traffic routing decisions.
        @[JSON::Field(key: "value")]
        getter value : Types::ServiceConnectTestTrafficHeaderMatchRules?

        def initialize(
          @name : String,
          @value : Types::ServiceConnectTestTrafficHeaderMatchRules? = nil
        )
        end
      end

      # The test traffic routing configuration for Amazon ECS blue/green deployments. This configuration
      # allows you to define rules for routing specific traffic to the new service revision during the
      # deployment process, allowing for safe testing before full production traffic shift. For more
      # information, see Service Connect for Amazon ECS blue/green deployments in the Amazon Elastic
      # Container Service Developer Guide .
      struct ServiceConnectTestTrafficRules
        include JSON::Serializable

        # The HTTP header-based routing rules that determine which requests should be routed to the new
        # service version during blue/green deployment testing. These rules provide fine-grained control over
        # test traffic routing based on request headers.
        @[JSON::Field(key: "header")]
        getter header : Types::ServiceConnectTestTrafficHeaderRules

        def initialize(
          @header : Types::ServiceConnectTestTrafficHeaderRules
        )
        end
      end

      # The certificate root authority that secures your service.
      struct ServiceConnectTlsCertificateAuthority
        include JSON::Serializable

        # The ARN of the Amazon Web Services Private Certificate Authority certificate.
        @[JSON::Field(key: "awsPcaAuthorityArn")]
        getter aws_pca_authority_arn : String?

        def initialize(
          @aws_pca_authority_arn : String? = nil
        )
        end
      end

      # The key that encrypts and decrypts your resources for Service Connect TLS.
      struct ServiceConnectTlsConfiguration
        include JSON::Serializable

        # The signer certificate authority.
        @[JSON::Field(key: "issuerCertificateAuthority")]
        getter issuer_certificate_authority : Types::ServiceConnectTlsCertificateAuthority

        # The Amazon Web Services Key Management Service key.
        @[JSON::Field(key: "kmsKey")]
        getter kms_key : String?

        # The Amazon Resource Name (ARN) of the IAM role that's associated with the Service Connect TLS.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @issuer_certificate_authority : Types::ServiceConnectTlsCertificateAuthority,
          @kms_key : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The summary of the current service revision configuration
      struct ServiceCurrentRevisionSummary
        include JSON::Serializable

        # The ARN of the current service revision.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The number of pending tasks in the current service revision
        @[JSON::Field(key: "pendingTaskCount")]
        getter pending_task_count : Int32?

        # The number of requested tasks in the current service revision
        @[JSON::Field(key: "requestedTaskCount")]
        getter requested_task_count : Int32?

        # The number of running tasks of the current service revision
        @[JSON::Field(key: "runningTaskCount")]
        getter running_task_count : Int32?

        def initialize(
          @arn : String? = nil,
          @pending_task_count : Int32? = nil,
          @requested_task_count : Int32? = nil,
          @running_task_count : Int32? = nil
        )
        end
      end

      # Information about the service deployment. Service deployments provide a comprehensive view of your
      # deployments. For information about service deployments, see View service history using Amazon ECS
      # service deployments in the Amazon Elastic Container Service Developer Guide .
      struct ServiceDeployment
        include JSON::Serializable

        # The CloudWatch alarms that determine when a service deployment fails.
        @[JSON::Field(key: "alarms")]
        getter alarms : Types::ServiceDeploymentAlarms?

        # The ARN of the cluster that hosts the service.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The time the service deployment was created. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The circuit breaker configuration that determines a service deployment failed.
        @[JSON::Field(key: "deploymentCircuitBreaker")]
        getter deployment_circuit_breaker : Types::ServiceDeploymentCircuitBreaker?

        @[JSON::Field(key: "deploymentConfiguration")]
        getter deployment_configuration : Types::DeploymentConfiguration?

        # The time the service deployment finished. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "finishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The current lifecycle stage of the deployment. Possible values include: RECONCILE_SERVICE The
        # reconciliation stage that only happens when you start a new service deployment with more than 1
        # service revision in an ACTIVE state. PRE_SCALE_UP The green service revision has not started. The
        # blue service revision is handling 100% of the production traffic. There is no test traffic. SCALE_UP
        # The stage when the green service revision scales up to 100% and launches new tasks. The green
        # service revision is not serving any traffic at this point. POST_SCALE_UP The green service revision
        # has started. The blue service revision is handling 100% of the production traffic. There is no test
        # traffic. TEST_TRAFFIC_SHIFT The blue and green service revisions are running. The blue service
        # revision handles 100% of the production traffic. The green service revision is migrating from 0% to
        # 100% of test traffic. POST_TEST_TRAFFIC_SHIFT The test traffic shift is complete. The green service
        # revision handles 100% of the test traffic. PRODUCTION_TRAFFIC_SHIFT Production traffic is shifting
        # to the green service revision. The green service revision is migrating from 0% to 100% of production
        # traffic. POST_PRODUCTION_TRAFFIC_SHIFT The production traffic shift is complete. BAKE_TIME The stage
        # when both blue and green service revisions are running simultaneously after the production traffic
        # has shifted. CLEAN_UP The stage when the blue service revision has completely scaled down to 0
        # running tasks. The green service revision is now the production service revision after this stage.
        @[JSON::Field(key: "lifecycleStage")]
        getter lifecycle_stage : String?

        # The rollback options the service deployment uses when the deployment fails.
        @[JSON::Field(key: "rollback")]
        getter rollback : Types::Rollback?

        # The ARN of the service for this service deployment.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ARN of the service deployment.
        @[JSON::Field(key: "serviceDeploymentArn")]
        getter service_deployment_arn : String?

        # The currently deployed workload configuration.
        @[JSON::Field(key: "sourceServiceRevisions")]
        getter source_service_revisions : Array(Types::ServiceRevisionSummary)?

        # The time the service deployment statred. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The service deployment state.
        @[JSON::Field(key: "status")]
        getter status : String?

        # Information about why the service deployment is in the current status. For example, the circuit
        # breaker detected a failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The time the service deployment stopped. The format is yyyy-MM-dd HH:mm:ss.SSSSSS. The service
        # deployment stops when any of the following actions happen: A user manually stops the deployment The
        # rollback option is not in use for the failure detection mechanism (the circuit breaker or
        # alarm-based) and the service fails.
        @[JSON::Field(key: "stoppedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stopped_at : Time?

        # The workload configuration being deployed.
        @[JSON::Field(key: "targetServiceRevision")]
        getter target_service_revision : Types::ServiceRevisionSummary?

        # The time that the service deployment was last updated. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @alarms : Types::ServiceDeploymentAlarms? = nil,
          @cluster_arn : String? = nil,
          @created_at : Time? = nil,
          @deployment_circuit_breaker : Types::ServiceDeploymentCircuitBreaker? = nil,
          @deployment_configuration : Types::DeploymentConfiguration? = nil,
          @finished_at : Time? = nil,
          @lifecycle_stage : String? = nil,
          @rollback : Types::Rollback? = nil,
          @service_arn : String? = nil,
          @service_deployment_arn : String? = nil,
          @source_service_revisions : Array(Types::ServiceRevisionSummary)? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stopped_at : Time? = nil,
          @target_service_revision : Types::ServiceRevisionSummary? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The CloudWatch alarms used to determine a service deployment failed. Amazon ECS considers the
      # service deployment as failed when any of the alarms move to the ALARM state. For more information,
      # see How CloudWatch alarms detect Amazon ECS deployment failures in the Amazon ECS Developer Guide.
      struct ServiceDeploymentAlarms
        include JSON::Serializable

        # The name of the CloudWatch alarms that determine when a service deployment failed. A "," separates
        # the alarms.
        @[JSON::Field(key: "alarmNames")]
        getter alarm_names : Array(String)?

        # The status of the alarms check. Amazon ECS is not using alarms for service deployment failures when
        # the status is DISABLED .
        @[JSON::Field(key: "status")]
        getter status : String?

        # One or more CloudWatch alarm names that have been triggered during the service deployment. A ","
        # separates the alarm names.
        @[JSON::Field(key: "triggeredAlarmNames")]
        getter triggered_alarm_names : Array(String)?

        def initialize(
          @alarm_names : Array(String)? = nil,
          @status : String? = nil,
          @triggered_alarm_names : Array(String)? = nil
        )
        end
      end

      # The service deployment properties that are retured when you call ListServiceDeployments . This
      # provides a high-level overview of the service deployment.
      struct ServiceDeploymentBrief
        include JSON::Serializable

        # The ARN of the cluster that hosts the service.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The time that the service deployment was created. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The time that the service deployment completed. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "finishedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter finished_at : Time?

        # The ARN of the service for this service deployment.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The ARN of the service deployment.
        @[JSON::Field(key: "serviceDeploymentArn")]
        getter service_deployment_arn : String?

        # The time that the service deployment statred. The format is yyyy-MM-dd HH:mm:ss.SSSSSS.
        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The status of the service deployment
        @[JSON::Field(key: "status")]
        getter status : String?

        # Information about why the service deployment is in the current status. For example, the circuit
        # breaker detected a deployment failure.
        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The ARN of the service revision being deplyed.
        @[JSON::Field(key: "targetServiceRevisionArn")]
        getter target_service_revision_arn : String?

        def initialize(
          @cluster_arn : String? = nil,
          @created_at : Time? = nil,
          @finished_at : Time? = nil,
          @service_arn : String? = nil,
          @service_deployment_arn : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @target_service_revision_arn : String? = nil
        )
        end
      end

      # Information about the circuit breaker used to determine when a service deployment has failed. The
      # deployment circuit breaker is the rolling update mechanism that determines if the tasks reach a
      # steady state. The deployment circuit breaker has an option that will automatically roll back a
      # failed deployment to the last cpompleted service revision. For more information, see How the Amazon
      # ECS deployment circuit breaker detects failures in the Amazon ECS Developer Guide .
      struct ServiceDeploymentCircuitBreaker
        include JSON::Serializable

        # The number of times the circuit breaker detected a service deploymeny failure.
        @[JSON::Field(key: "failureCount")]
        getter failure_count : Int32?

        # The circuit breaker status. Amazon ECS is not using the circuit breaker for service deployment
        # failures when the status is DISABLED .
        @[JSON::Field(key: "status")]
        getter status : String?

        # The threshhold which determines that the service deployment failed. The deployment circuit breaker
        # calculates the threshold value, and then uses the value to determine when to move the deployment to
        # a FAILED state. The deployment circuit breaker has a minimum threshold of 3 and a maximum threshold
        # of 200. and uses the values in the following formula to determine the deployment failure. 0.5 *
        # desired task count
        @[JSON::Field(key: "threshold")]
        getter threshold : Int32?

        def initialize(
          @failure_count : Int32? = nil,
          @status : String? = nil,
          @threshold : Int32? = nil
        )
        end
      end

      # The service deploy ARN that you specified in the StopServiceDeployment doesn't exist. You can use
      # ListServiceDeployments to retrieve the service deployment ARNs.
      struct ServiceDeploymentNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The details for an event that's associated with a service.
      struct ServiceEvent
        include JSON::Serializable

        # The Unix timestamp for the time when the event was triggered.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ID string for the event.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The event message.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @created_at : Time? = nil,
          @id : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your behalf.
      # These settings are used to create each Amazon EBS volume, with one volume created for each task in
      # the service. For information about the supported launch types and operating systems, see Supported
      # operating systems and launch types in the Amazon Elastic Container Service Developer Guide . Many of
      # these parameters map 1:1 with the Amazon EBS CreateVolume API request parameters.
      struct ServiceManagedEBSVolumeConfiguration
        include JSON::Serializable

        # The ARN of the IAM role to associate with this volume. This is the Amazon ECS infrastructure IAM
        # role that is used to manage your Amazon Web Services infrastructure. We recommend using the Amazon
        # ECS-managed AmazonECSInfrastructureRolePolicyForVolumes IAM policy with this role. For more
        # information, see Amazon ECS infrastructure IAM role in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Indicates whether the volume should be encrypted. If you turn on Region-level Amazon EBS encryption
        # by default but set this value as false , the setting is overridden and the volume is encrypted with
        # the KMS key specified for Amazon EBS encryption by default. This parameter maps 1:1 with the
        # Encrypted parameter of the CreateVolume API in the Amazon EC2 API Reference .
        @[JSON::Field(key: "encrypted")]
        getter encrypted : Bool?

        # The filesystem type for the volume. For volumes created from a snapshot, you must specify the same
        # filesystem type that the volume was using when the snapshot was created. If there is a filesystem
        # type mismatch, the tasks will fail to start. The available Linux filesystem types are&#x2028; ext3 ,
        # ext4 , and xfs . If no value is specified, the xfs filesystem type is used by default. The available
        # Windows filesystem types are NTFS .
        @[JSON::Field(key: "filesystemType")]
        getter filesystem_type : String?

        # The number of I/O operations per second (IOPS). For gp3 , io1 , and io2 volumes, this represents the
        # number of IOPS that are provisioned for the volume. For gp2 volumes, this represents the baseline
        # performance of the volume and the rate at which the volume accumulates I/O credits for bursting. The
        # following are the supported values for each volume type. gp3 : 3,000 - 16,000 IOPS io1 : 100 -
        # 64,000 IOPS io2 : 100 - 256,000 IOPS This parameter is required for io1 and io2 volume types. The
        # default for gp3 volumes is 3,000 IOPS . This parameter is not supported for st1 , sc1 , or standard
        # volume types. This parameter maps 1:1 with the Iops parameter of the CreateVolume API in the Amazon
        # EC2 API Reference .
        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # The Amazon Resource Name (ARN) identifier of the Amazon Web Services Key Management Service key to
        # use for Amazon EBS encryption. When a key is specified using this parameter, it overrides Amazon EBS
        # default encryption or any KMS key that you specified for cluster-level managed storage encryption.
        # This parameter maps 1:1 with the KmsKeyId parameter of the CreateVolume API in the Amazon EC2 API
        # Reference . For more information about encrypting Amazon EBS volumes attached to tasks, see Encrypt
        # data stored in Amazon EBS volumes attached to Amazon ECS tasks . Amazon Web Services authenticates
        # the Amazon Web Services Key Management Service key asynchronously. Therefore, if you specify an ID,
        # alias, or ARN that is invalid, the action can appear to complete, but eventually fails.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The size of the volume in GiB. You must specify either a volume size or a snapshot ID. If you
        # specify a snapshot ID, the snapshot size is used for the volume size by default. You can optionally
        # specify a volume size greater than or equal to the snapshot size. This parameter maps 1:1 with the
        # Size parameter of the CreateVolume API in the Amazon EC2 API Reference . The following are the
        # supported volume size values for each volume type. gp2 and gp3 : 1-16,384 io1 and io2 : 4-16,384 st1
        # and sc1 : 125-16,384 standard : 1-1,024
        @[JSON::Field(key: "sizeInGiB")]
        getter size_in_gi_b : Int32?

        # The snapshot that Amazon ECS uses to create volumes for attachment to tasks maintained by the
        # service. You must specify either snapshotId or sizeInGiB in your volume configuration. This
        # parameter maps 1:1 with the SnapshotId parameter of the CreateVolume API in the Amazon EC2 API
        # Reference .
        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String?

        # The tags to apply to the volume. Amazon ECS applies service-managed tags by default. This parameter
        # maps 1:1 with the TagSpecifications.N parameter of the CreateVolume API in the Amazon EC2 API
        # Reference .
        @[JSON::Field(key: "tagSpecifications")]
        getter tag_specifications : Array(Types::EBSTagSpecification)?

        # The throughput to provision for a volume, in MiB/s, with a maximum of 1,000 MiB/s. This parameter
        # maps 1:1 with the Throughput parameter of the CreateVolume API in the Amazon EC2 API Reference .
        # This parameter is only supported for the gp3 volume type.
        @[JSON::Field(key: "throughput")]
        getter throughput : Int32?

        # The rate, in MiB/s, at which data is fetched from a snapshot of an existing EBS volume to create new
        # volumes for attachment to the tasks maintained by the service. This property can be specified only
        # if you specify a snapshotId . For more information, see Initialize Amazon EBS volumes in the Amazon
        # EBS User Guide .
        @[JSON::Field(key: "volumeInitializationRate")]
        getter volume_initialization_rate : Int32?

        # The volume type. This parameter maps 1:1 with the VolumeType parameter of the CreateVolume API in
        # the Amazon EC2 API Reference . For more information, see Amazon EBS volume types in the Amazon EC2
        # User Guide . The following are the supported volume types. General Purpose SSD: gp2 | gp3
        # Provisioned IOPS SSD: io1 | io2 Throughput Optimized HDD: st1 Cold HDD: sc1 Magnetic: standard The
        # magnetic volume type is not supported on Fargate.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @role_arn : String,
          @encrypted : Bool? = nil,
          @filesystem_type : String? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @size_in_gi_b : Int32? = nil,
          @snapshot_id : String? = nil,
          @tag_specifications : Array(Types::EBSTagSpecification)? = nil,
          @throughput : Int32? = nil,
          @volume_initialization_rate : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # The specified service isn't active. You can't update a service that's inactive. If you have
      # previously deleted a service, you can re-create it with CreateService .
      struct ServiceNotActiveException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified service wasn't found. You can view your available services with ListServices . Amazon
      # ECS services are cluster specific and Region specific.
      struct ServiceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The details for the service registry. Each service may be associated with one service registry.
      # Multiple service registries for each service are not supported. When you add, update, or remove the
      # service registries configuration, Amazon ECS starts a new deployment. New tasks are registered and
      # deregistered to the updated service registry configuration.
      struct ServiceRegistry
        include JSON::Serializable

        # The container name value to be used for your service discovery service. It's already specified in
        # the task definition. If the task definition that your service task specifies uses the bridge or host
        # network mode, you must specify a containerName and containerPort combination from the task
        # definition. If the task definition that your service task specifies uses the awsvpc network mode and
        # a type SRV DNS record is used, you must specify either a containerName and containerPort combination
        # or a port value. However, you can't specify both.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The port value to be used for your service discovery service. It's already specified in the task
        # definition. If the task definition your service task specifies uses the bridge or host network mode,
        # you must specify a containerName and containerPort combination from the task definition. If the task
        # definition your service task specifies uses the awsvpc network mode and a type SRV DNS record is
        # used, you must specify either a containerName and containerPort combination or a port value.
        # However, you can't specify both.
        @[JSON::Field(key: "containerPort")]
        getter container_port : Int32?

        # The port value used if your service discovery service specified an SRV record. This field might be
        # used if both the awsvpc network mode and SRV records are used.
        @[JSON::Field(key: "port")]
        getter port : Int32?

        # The Amazon Resource Name (ARN) of the service registry. The currently supported service registry is
        # Cloud Map. For more information, see CreateService .
        @[JSON::Field(key: "registryArn")]
        getter registry_arn : String?

        def initialize(
          @container_name : String? = nil,
          @container_port : Int32? = nil,
          @port : Int32? = nil,
          @registry_arn : String? = nil
        )
        end
      end

      # Information about the service revision. A service revision contains a record of the workload
      # configuration Amazon ECS is attempting to deploy. Whenever you create or deploy a service, Amazon
      # ECS automatically creates and captures the configuration that you're trying to deploy in the service
      # revision. For information about service revisions, see Amazon ECS service revisions in the Amazon
      # Elastic Container Service Developer Guide .
      struct ServiceRevision
        include JSON::Serializable

        # The capacity provider strategy the service revision uses.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # The ARN of the cluster that hosts the service.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The container images the service revision uses.
        @[JSON::Field(key: "containerImages")]
        getter container_images : Array(Types::ContainerImage)?

        # The time that the service revision was created. The format is yyyy-mm-dd HH:mm:ss.SSSSS.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The resources created and managed by Amazon ECS when you create an Express service for Amazon ECS.
        @[JSON::Field(key: "ecsManagedResources")]
        getter ecs_managed_resources : Types::ECSManagedResources?

        @[JSON::Field(key: "fargateEphemeralStorage")]
        getter fargate_ephemeral_storage : Types::DeploymentEphemeralStorage?

        # Indicates whether Runtime Monitoring is turned on.
        @[JSON::Field(key: "guardDutyEnabled")]
        getter guard_duty_enabled : Bool?

        # The launch type the service revision uses.
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The load balancers the service revision uses.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The platform family the service revision uses.
        @[JSON::Field(key: "platformFamily")]
        getter platform_family : String?

        # For the Fargate launch type, the platform version the service revision uses.
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # The resolved configuration for the service revision which contains the actual resources your service
        # revision uses, such as which target groups serve traffic.
        @[JSON::Field(key: "resolvedConfiguration")]
        getter resolved_configuration : Types::ResolvedConfiguration?

        # The ARN of the service for the service revision.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        @[JSON::Field(key: "serviceConnectConfiguration")]
        getter service_connect_configuration : Types::ServiceConnectConfiguration?

        # The service registries (for Service Discovery) the service revision uses.
        @[JSON::Field(key: "serviceRegistries")]
        getter service_registries : Array(Types::ServiceRegistry)?

        # The ARN of the service revision.
        @[JSON::Field(key: "serviceRevisionArn")]
        getter service_revision_arn : String?

        # The task definition the service revision uses.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String?

        # The volumes that are configured at deployment that the service revision uses.
        @[JSON::Field(key: "volumeConfigurations")]
        getter volume_configurations : Array(Types::ServiceVolumeConfiguration)?

        # The VPC Lattice configuration for the service revision.
        @[JSON::Field(key: "vpcLatticeConfigurations")]
        getter vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)?

        def initialize(
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @cluster_arn : String? = nil,
          @container_images : Array(Types::ContainerImage)? = nil,
          @created_at : Time? = nil,
          @ecs_managed_resources : Types::ECSManagedResources? = nil,
          @fargate_ephemeral_storage : Types::DeploymentEphemeralStorage? = nil,
          @guard_duty_enabled : Bool? = nil,
          @launch_type : String? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @platform_family : String? = nil,
          @platform_version : String? = nil,
          @resolved_configuration : Types::ResolvedConfiguration? = nil,
          @service_arn : String? = nil,
          @service_connect_configuration : Types::ServiceConnectConfiguration? = nil,
          @service_registries : Array(Types::ServiceRegistry)? = nil,
          @service_revision_arn : String? = nil,
          @task_definition : String? = nil,
          @volume_configurations : Array(Types::ServiceVolumeConfiguration)? = nil,
          @vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)? = nil
        )
        end
      end

      # The resolved load balancer configuration for a service revision. This includes information about
      # which target groups serve traffic and which listener rules direct traffic to them.
      struct ServiceRevisionLoadBalancer
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the production listener rule or listener that directs traffic to
        # the target group associated with the service revision.
        @[JSON::Field(key: "productionListenerRule")]
        getter production_listener_rule : String?

        # The Amazon Resource Name (ARN) of the target group associated with the service revision.
        @[JSON::Field(key: "targetGroupArn")]
        getter target_group_arn : String?

        def initialize(
          @production_listener_rule : String? = nil,
          @target_group_arn : String? = nil
        )
        end
      end

      # The information about the number of requested, pending, and running tasks for a service revision.
      struct ServiceRevisionSummary
        include JSON::Serializable

        # The ARN of the service revision.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The number of pending tasks for the service revision.
        @[JSON::Field(key: "pendingTaskCount")]
        getter pending_task_count : Int32?

        # The percentage of production traffic that is directed to this service revision. This value
        # represents a snapshot of the traffic distribution and may not reflect real-time changes during
        # active deployments. Valid values are 0.0 to 100.0.
        @[JSON::Field(key: "requestedProductionTrafficWeight")]
        getter requested_production_traffic_weight : Float64?

        # The number of requested tasks for the service revision.
        @[JSON::Field(key: "requestedTaskCount")]
        getter requested_task_count : Int32?

        # The percentage of test traffic that is directed to this service revision. This value represents a
        # snapshot of the traffic distribution and may not reflect real-time changes during active
        # deployments. Valid values are 0.0 to 100.0.
        @[JSON::Field(key: "requestedTestTrafficWeight")]
        getter requested_test_traffic_weight : Float64?

        # The number of running tasks for the service revision.
        @[JSON::Field(key: "runningTaskCount")]
        getter running_task_count : Int32?

        def initialize(
          @arn : String? = nil,
          @pending_task_count : Int32? = nil,
          @requested_production_traffic_weight : Float64? = nil,
          @requested_task_count : Int32? = nil,
          @requested_test_traffic_weight : Float64? = nil,
          @running_task_count : Int32? = nil
        )
        end
      end

      # The configuration for a volume specified in the task definition as a volume that is configured at
      # launch time. Currently, the only supported volume type is an Amazon EBS volume.
      struct ServiceVolumeConfiguration
        include JSON::Serializable

        # The name of the volume. This value must match the volume name from the Volume object in the task
        # definition.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your behalf.
        # These settings are used to create each Amazon EBS volume, with one volume created for each task in
        # the service. The Amazon EBS volumes are visible in your account in the Amazon EC2 console once they
        # are created.
        @[JSON::Field(key: "managedEBSVolume")]
        getter managed_ebs_volume : Types::ServiceManagedEBSVolumeConfiguration?

        def initialize(
          @name : String,
          @managed_ebs_volume : Types::ServiceManagedEBSVolumeConfiguration? = nil
        )
        end
      end

      # The details for the execute command session.
      struct Session
        include JSON::Serializable

        # The ID of the execute command session.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # A URL to the managed agent on the container that the SSM Session Manager client uses to send
        # commands and receive output from the container.
        @[JSON::Field(key: "streamUrl")]
        getter stream_url : String?

        # An encrypted token value containing session and caller information. It's used to authenticate the
        # connection to the container.
        @[JSON::Field(key: "tokenValue")]
        getter token_value : String?

        def initialize(
          @session_id : String? = nil,
          @stream_url : String? = nil,
          @token_value : String? = nil
        )
        end
      end

      # The current account setting for a resource.
      struct Setting
        include JSON::Serializable

        # The Amazon ECS resource name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The ARN of the principal. It can be a user, role, or the root user. If this field is omitted, the
        # authenticated user is assumed.
        @[JSON::Field(key: "principalArn")]
        getter principal_arn : String?

        # Indicates whether Amazon Web Services manages the account setting, or if the user manages it.
        # aws_managed account settings are read-only, as Amazon Web Services manages such on the customer's
        # behalf. Currently, the guardDutyActivate account setting is the only one Amazon Web Services
        # manages.
        @[JSON::Field(key: "type")]
        getter type : String?

        # Determines whether the account setting is on or off for the specified resource.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @principal_arn : String? = nil,
          @type : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct StartTaskRequest
        include JSON::Serializable

        # The container instance IDs or full ARN entries for the container instances where you would like to
        # place your task. You can specify up to 10 container instances.
        @[JSON::Field(key: "containerInstances")]
        getter container_instances : Array(String)

        # The family and revision ( family:revision ) or full ARN of the task definition to start. If a
        # revision isn't specified, the latest ACTIVE revision is used.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String

        # The short name or full Amazon Resource Name (ARN) of the cluster where to start your task. If you do
        # not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Specifies whether to use Amazon ECS managed tags for the task. For more information, see Tagging
        # Your Amazon ECS Resources in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "enableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Whether or not the execute command functionality is turned on for the task. If true , this turns on
        # the execute command functionality on all containers in the task.
        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The name of the task group to associate with the task. The default value is the family name of the
        # task definition (for example, family:my-family-name).
        @[JSON::Field(key: "group")]
        getter group : String?

        # The VPC subnet and security group configuration for tasks that receive their own elastic network
        # interface by using the awsvpc networking mode.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # A list of container overrides in JSON format that specify the name of a container in the specified
        # task definition and the overrides it receives. You can override the default command for a container
        # (that's specified in the task definition or Docker image) with a command override. You can also
        # override existing environment variables (that are specified in the task definition or Docker image)
        # on a container or add new environment variables to it with an environment override. A total of 8192
        # characters are allowed for overrides. This limit includes the JSON formatting characters of the
        # override structure.
        @[JSON::Field(key: "overrides")]
        getter overrides : Types::TaskOverride?

        # Specifies whether to propagate the tags from the task definition or the service to the task. If no
        # value is specified, the tags aren't propagated.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # This parameter is only used by Amazon ECS. It is not intended for use by customers.
        @[JSON::Field(key: "referenceId")]
        getter reference_id : String?

        # An optional tag specified when a task is started. For example, if you automatically trigger a task
        # to run a batch process job, you could apply a unique identifier for that job to your task with the
        # startedBy parameter. You can then identify which tasks belong to that job by filtering the results
        # of a ListTasks call with the startedBy value. Up to 36 letters (uppercase and lowercase), numbers,
        # hyphens (-), forward slash (/), and underscores (_) are allowed. If a task is started by an Amazon
        # ECS service, the startedBy parameter contains the deployment ID of the service that starts it.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # The metadata that you apply to the task to help you categorize and organize them. Each tag consists
        # of a key and an optional value, both of which you define. The following basic restrictions apply to
        # tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique, and
        # each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8 Maximum
        # value length - 256 Unicode characters in UTF-8 If your tagging schema is used across multiple
        # services and resources, remember that other services may have restrictions on allowed characters.
        # Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, and the
        # following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use aws: ,
        # AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this prefix.
        # Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The details of the volume that was configuredAtLaunch . You can configure the size, volumeType,
        # IOPS, throughput, snapshot and encryption in TaskManagedEBSVolumeConfiguration . The name of the
        # volume must match the name from the task definition.
        @[JSON::Field(key: "volumeConfigurations")]
        getter volume_configurations : Array(Types::TaskVolumeConfiguration)?

        def initialize(
          @container_instances : Array(String),
          @task_definition : String,
          @cluster : String? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @group : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @overrides : Types::TaskOverride? = nil,
          @propagate_tags : String? = nil,
          @reference_id : String? = nil,
          @started_by : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @volume_configurations : Array(Types::TaskVolumeConfiguration)? = nil
        )
        end
      end

      struct StartTaskResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # A full description of the tasks that were started. Each task that was successfully placed on your
        # container instances is described.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::Task)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @tasks : Array(Types::Task)? = nil
        )
        end
      end

      struct StopServiceDeploymentRequest
        include JSON::Serializable

        # The ARN of the service deployment that you want to stop.
        @[JSON::Field(key: "serviceDeploymentArn")]
        getter service_deployment_arn : String

        # How you want Amazon ECS to stop the service. The valid values are ROLLBACK .
        @[JSON::Field(key: "stopType")]
        getter stop_type : String?

        def initialize(
          @service_deployment_arn : String,
          @stop_type : String? = nil
        )
        end
      end

      struct StopServiceDeploymentResponse
        include JSON::Serializable

        # The ARN of the stopped service deployment.
        @[JSON::Field(key: "serviceDeploymentArn")]
        getter service_deployment_arn : String?

        def initialize(
          @service_deployment_arn : String? = nil
        )
        end
      end

      struct StopTaskRequest
        include JSON::Serializable

        # Thefull Amazon Resource Name (ARN) of the task.
        @[JSON::Field(key: "task")]
        getter task : String

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task to stop. If you
        # do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # An optional message specified when a task is stopped. For example, if you're using a custom
        # scheduler, you can use this parameter to specify the reason for stopping the task here, and the
        # message appears in subsequent DescribeTasks &gt; API operations on this task.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @task : String,
          @cluster : String? = nil,
          @reason : String? = nil
        )
        end
      end

      struct StopTaskResponse
        include JSON::Serializable

        # The task that was stopped.
        @[JSON::Field(key: "task")]
        getter task : Types::Task?

        def initialize(
          @task : Types::Task? = nil
        )
        end
      end

      struct SubmitAttachmentStateChangesRequest
        include JSON::Serializable

        # Any attachments associated with the state change request.
        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::AttachmentStateChange)

        # The short name or full ARN of the cluster that hosts the container instance the attachment belongs
        # to.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        def initialize(
          @attachments : Array(Types::AttachmentStateChange),
          @cluster : String? = nil
        )
        end
      end

      struct SubmitAttachmentStateChangesResponse
        include JSON::Serializable

        # Acknowledgement of the state change.
        @[JSON::Field(key: "acknowledgment")]
        getter acknowledgment : String?

        def initialize(
          @acknowledgment : String? = nil
        )
        end
      end

      struct SubmitContainerStateChangeRequest
        include JSON::Serializable

        # The short name or full ARN of the cluster that hosts the container.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The name of the container.
        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        # The exit code that's returned for the state change request.
        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The network bindings of the container.
        @[JSON::Field(key: "networkBindings")]
        getter network_bindings : Array(Types::NetworkBinding)?

        # The reason for the state change request.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The ID of the Docker container.
        @[JSON::Field(key: "runtimeId")]
        getter runtime_id : String?

        # The status of the state change request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The task ID or full Amazon Resource Name (ARN) of the task that hosts the container.
        @[JSON::Field(key: "task")]
        getter task : String?

        def initialize(
          @cluster : String? = nil,
          @container_name : String? = nil,
          @exit_code : Int32? = nil,
          @network_bindings : Array(Types::NetworkBinding)? = nil,
          @reason : String? = nil,
          @runtime_id : String? = nil,
          @status : String? = nil,
          @task : String? = nil
        )
        end
      end

      struct SubmitContainerStateChangeResponse
        include JSON::Serializable

        # Acknowledgement of the state change.
        @[JSON::Field(key: "acknowledgment")]
        getter acknowledgment : String?

        def initialize(
          @acknowledgment : String? = nil
        )
        end
      end

      struct SubmitTaskStateChangeRequest
        include JSON::Serializable

        # Any attachments associated with the state change request.
        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::AttachmentStateChange)?

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the task.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Any containers that's associated with the state change request.
        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::ContainerStateChange)?

        # The Unix timestamp for the time when the task execution stopped.
        @[JSON::Field(key: "executionStoppedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter execution_stopped_at : Time?

        # The details for the managed agent that's associated with the task.
        @[JSON::Field(key: "managedAgents")]
        getter managed_agents : Array(Types::ManagedAgentStateChange)?

        # The Unix timestamp for the time when the container image pull started.
        @[JSON::Field(key: "pullStartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pull_started_at : Time?

        # The Unix timestamp for the time when the container image pull completed.
        @[JSON::Field(key: "pullStoppedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pull_stopped_at : Time?

        # The reason for the state change request.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The status of the state change request.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The task ID or full ARN of the task in the state change request.
        @[JSON::Field(key: "task")]
        getter task : String?

        def initialize(
          @attachments : Array(Types::AttachmentStateChange)? = nil,
          @cluster : String? = nil,
          @containers : Array(Types::ContainerStateChange)? = nil,
          @execution_stopped_at : Time? = nil,
          @managed_agents : Array(Types::ManagedAgentStateChange)? = nil,
          @pull_started_at : Time? = nil,
          @pull_stopped_at : Time? = nil,
          @reason : String? = nil,
          @status : String? = nil,
          @task : String? = nil
        )
        end
      end

      struct SubmitTaskStateChangeResponse
        include JSON::Serializable

        # Acknowledgement of the state change.
        @[JSON::Field(key: "acknowledgment")]
        getter acknowledgment : String?

        def initialize(
          @acknowledgment : String? = nil
        )
        end
      end

      # A list of namespaced kernel parameters to set in the container. This parameter maps to Sysctls in
      # the docker container create command and the --sysctl option to docker run. For example, you can
      # configure net.ipv4.tcp_keepalive_time setting to maintain longer lived connections. We don't
      # recommend that you specify network-related systemControls parameters for multiple containers in a
      # single task that also uses either the awsvpc or host network mode. Doing this has the following
      # disadvantages: For tasks that use the awsvpc network mode including Fargate, if you set
      # systemControls for any container, it applies to all containers in the task. If you set different
      # systemControls for multiple containers in a single task, the container that's started last
      # determines which systemControls take effect. For tasks that use the host network mode, the network
      # namespace systemControls aren't supported. If you're setting an IPC resource namespace to use for
      # the containers in the task, the following conditions apply to your system controls. For more
      # information, see IPC mode . For tasks that use the host IPC mode, IPC namespace systemControls
      # aren't supported. For tasks that use the task IPC mode, IPC namespace systemControls values apply to
      # all containers within a task. This parameter is not supported for Windows containers. This parameter
      # is only supported for tasks that are hosted on Fargate if the tasks are using platform version 1.4.0
      # or later (Linux). This isn't supported for Windows containers on Fargate.
      struct SystemControl
        include JSON::Serializable

        # The namespaced kernel parameter to set a value for.
        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The namespaced kernel parameter to set a value for. Valid IPC namespace values: "kernel.msgmax" |
        # "kernel.msgmnb" | "kernel.msgmni" | "kernel.sem" | "kernel.shmall" | "kernel.shmmax" |
        # "kernel.shmmni" | "kernel.shm_rmid_forced" , and Sysctls that start with "fs.mqueue.*" Valid network
        # namespace values: Sysctls that start with "net.*" . Only namespaced Sysctls that exist within the
        # container starting with "net.* are accepted. All of these values are supported by Fargate.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @namespace : String? = nil,
          @value : String? = nil
        )
        end
      end

      # The metadata that you apply to a resource to help you categorize and organize them. Each tag
      # consists of a key and an optional value. You define them. The following basic restrictions apply to
      # tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique, and
      # each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8 Maximum
      # value length - 256 Unicode characters in UTF-8 If your tagging schema is used across multiple
      # services and resources, remember that other services may have restrictions on allowed characters.
      # Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, and the
      # following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use aws: ,
      # AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as it is
      # reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this prefix.
      # Tags with this prefix do not count against your tags per resource limit.
      struct Tag
        include JSON::Serializable

        # One part of a key-value pair that make up a tag. A key is a general label that acts like a category
        # for more specific tag values.
        @[JSON::Field(key: "key")]
        getter key : String?

        # The optional part of a key-value pair that make up a tag. A value acts as a descriptor within a tag
        # category (key).
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to add tags to. Currently, the supported resources
        # are Amazon ECS capacity providers, tasks, services, task definitions, clusters, and container
        # instances. In order to tag a service that has the following ARN format, you need to migrate the
        # service to the long ARN. For more information, see Migrate an Amazon ECS short service ARN to a long
        # ARN in the Amazon Elastic Container Service Developer Guide .
        # arn:aws:ecs:region:aws_account_id:service/service-name After the migration is complete, the service
        # has the long ARN format, as shown below. Use this ARN to tag the service.
        # arn:aws:ecs:region:aws_account_id:service/cluster-name/service-name If you try to tag a service with
        # a short ARN, you receive an InvalidParameterException error.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource. A tag is an array of key-value pairs. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50 For each resource, each tag key
        # must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8 Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is
        # used across multiple services and resources, remember that other services may have restrictions on
        # allowed characters. Generally allowed characters are: letters, numbers, and spaces representable in
        # UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not
        # use aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or
        # values as it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values
        # with this prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::Tag)
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The execute command cannot run. This error can be caused by any of the following configuration
      # issues: Incorrect IAM permissions The SSM agent is not installed or is not running There is an
      # interface Amazon VPC endpoint for Amazon ECS, but there is not one for Systems Manager Session
      # Manager For information about how to troubleshoot the issues, see Troubleshooting issues with ECS
      # Exec in the Amazon Elastic Container Service Developer Guide .
      struct TargetNotConnectedException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified target wasn't found. You can view your available container instances with
      # ListContainerInstances . Amazon ECS container instances are cluster-specific and Region-specific.
      struct TargetNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Details on a task in a cluster.
      struct Task
        include JSON::Serializable

        # The Elastic Network Adapter that's associated with the task if the task uses the awsvpc network
        # mode.
        @[JSON::Field(key: "attachments")]
        getter attachments : Array(Types::Attachment)?

        # The attributes of the task
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::Attribute)?

        # The Availability Zone for the task.
        @[JSON::Field(key: "availabilityZone")]
        getter availability_zone : String?

        # The capacity provider that's associated with the task.
        @[JSON::Field(key: "capacityProviderName")]
        getter capacity_provider_name : String?

        # The ARN of the cluster that hosts the task.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The connectivity status of a task.
        @[JSON::Field(key: "connectivity")]
        getter connectivity : String?

        # The Unix timestamp for the time when the task last went into CONNECTED status.
        @[JSON::Field(key: "connectivityAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter connectivity_at : Time?

        # The ARN of the container instances that host the task.
        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # The containers that's associated with the task.
        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::Container)?

        # The number of CPU units used by the task as expressed in a task definition. It can be expressed as
        # an integer using CPU units (for example, 1024 ). It can also be expressed as a string using vCPUs
        # (for example, 1 vCPU or 1 vcpu ). String values are converted to an integer that indicates the CPU
        # units when the task definition is registered. If you're using the EC2 launch type or the external
        # launch type, this field is optional. Supported values are between 128 CPU units ( 0.125 vCPUs) and
        # 196608 CPU units ( 192 vCPUs). If you do not specify a value, the parameter is ignored. This field
        # is required for Fargate. For information about the valid values, see Task size in the Amazon Elastic
        # Container Service Developer Guide .
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The Unix timestamp for the time when the task was created. More specifically, it's for the time when
        # the task entered the PENDING state.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The desired status of the task. For more information, see Task Lifecycle .
        @[JSON::Field(key: "desiredStatus")]
        getter desired_status : String?

        # Determines whether execute command functionality is turned on for this task. If true , execute
        # command functionality is turned on all the containers in the task.
        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The ephemeral storage settings for the task.
        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Unix timestamp for the time when the task execution stopped.
        @[JSON::Field(key: "executionStoppedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter execution_stopped_at : Time?

        # The Fargate ephemeral storage settings for the task.
        @[JSON::Field(key: "fargateEphemeralStorage")]
        getter fargate_ephemeral_storage : Types::TaskEphemeralStorage?

        # The name of the task group that's associated with the task.
        @[JSON::Field(key: "group")]
        getter group : String?

        # The health status for the task. It's determined by the health of the essential containers in the
        # task. If all essential containers in the task are reporting as HEALTHY , the task status also
        # reports as HEALTHY . If any essential containers in the task are reporting as UNHEALTHY or UNKNOWN ,
        # the task status also reports as UNHEALTHY or UNKNOWN . The Amazon ECS container agent doesn't
        # monitor or report on Docker health checks that are embedded in a container image and not specified
        # in the container definition. For example, this includes those specified in a parent image or from
        # the image's Dockerfile. Health check parameters that are specified in a container definition
        # override any Docker health checks that are found in the container image.
        @[JSON::Field(key: "healthStatus")]
        getter health_status : String?

        # The Elastic Inference accelerator that's associated with the task.
        @[JSON::Field(key: "inferenceAccelerators")]
        getter inference_accelerators : Array(Types::InferenceAccelerator)?

        # The last known status for the task. For more information, see Task Lifecycle .
        @[JSON::Field(key: "lastStatus")]
        getter last_status : String?

        # The infrastructure where your task runs on. For more information, see Amazon ECS launch types in the
        # Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # The amount of memory (in MiB) that the task uses as expressed in a task definition. It can be
        # expressed as an integer using MiB (for example, 1024 ). If it's expressed as a string using GB (for
        # example, 1GB or 1 GB ), it's converted to an integer indicating the MiB when the task definition is
        # registered. If you use the EC2 launch type, this field is optional. If you use the Fargate launch
        # type, this field is required. You must use one of the following values. The value that you choose
        # determines the range of supported values for the cpu parameter. 512 (0.5 GB), 1024 (1 GB), 2048 (2
        # GB) - Available cpu values: 256 (.25 vCPU) 1024 (1 GB), 2048 (2 GB), 3072 (3 GB), 4096 (4 GB) -
        # Available cpu values: 512 (.5 vCPU) 2048 (2 GB), 3072 (3 GB), 4096 (4 GB), 5120 (5 GB), 6144 (6 GB),
        # 7168 (7 GB), 8192 (8 GB) - Available cpu values: 1024 (1 vCPU) Between 4096 (4 GB) and 16384 (16 GB)
        # in increments of 1024 (1 GB) - Available cpu values: 2048 (2 vCPU) Between 8192 (8 GB) and 30720 (30
        # GB) in increments of 1024 (1 GB) - Available cpu values: 4096 (4 vCPU) Between 16 GB and 60 GB in 4
        # GB increments - Available cpu values: 8192 (8 vCPU) This option requires Linux platform 1.4.0 or
        # later. Between 32GB and 120 GB in 8 GB increments - Available cpu values: 16384 (16 vCPU) This
        # option requires Linux platform 1.4.0 or later.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # One or more container overrides.
        @[JSON::Field(key: "overrides")]
        getter overrides : Types::TaskOverride?

        # The operating system that your tasks are running on. A platform family is specified only for tasks
        # that use the Fargate launch type. All tasks that run as part of this service must use the same
        # platformFamily value as the service (for example, LINUX. ).
        @[JSON::Field(key: "platformFamily")]
        getter platform_family : String?

        # The platform version where your task runs on. A platform version is only specified for tasks that
        # use the Fargate launch type. If you didn't specify one, the LATEST platform version is used. For
        # more information, see Fargate Platform Versions in the Amazon Elastic Container Service Developer
        # Guide .
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # The Unix timestamp for the time when the container image pull began.
        @[JSON::Field(key: "pullStartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pull_started_at : Time?

        # The Unix timestamp for the time when the container image pull completed.
        @[JSON::Field(key: "pullStoppedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter pull_stopped_at : Time?

        # The Unix timestamp for the time when the task started. More specifically, it's for the time when the
        # task transitioned from the PENDING state to the RUNNING state.
        @[JSON::Field(key: "startedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The tag specified when a task is started. If an Amazon ECS service started the task, the startedBy
        # parameter contains the deployment ID of that service.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # The stop code indicating why a task was stopped. The stoppedReason might contain additional details.
        # For more information about stop code, see Stopped tasks error codes in the Amazon ECS Developer
        # Guide .
        @[JSON::Field(key: "stopCode")]
        getter stop_code : String?

        # The Unix timestamp for the time when the task was stopped. More specifically, it's for the time when
        # the task transitioned from the RUNNING state to the STOPPED state.
        @[JSON::Field(key: "stoppedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stopped_at : Time?

        # The reason that the task was stopped.
        @[JSON::Field(key: "stoppedReason")]
        getter stopped_reason : String?

        # The Unix timestamp for the time when the task stops. More specifically, it's for the time when the
        # task transitions from the RUNNING state to STOPPING .
        @[JSON::Field(key: "stoppingAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stopping_at : Time?

        # The metadata that you apply to the task to help you categorize and organize the task. Each tag
        # consists of a key and an optional value. You define both the key and value. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50 For each resource, each tag key
        # must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8 Maximum value length - 256 Unicode characters in UTF-8 If your tagging schema is
        # used across multiple services and resources, remember that other services may have restrictions on
        # allowed characters. Generally allowed characters are: letters, numbers, and spaces representable in
        # UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not
        # use aws: , AWS: , or any upper or lowercase combination of such as a prefix for either keys or
        # values as it is reserved for Amazon Web Services use. You cannot edit or delete tag keys or values
        # with this prefix. Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The Amazon Resource Name (ARN) of the task.
        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        # The ARN of the task definition that creates the task.
        @[JSON::Field(key: "taskDefinitionArn")]
        getter task_definition_arn : String?

        # The version counter for the task. Every time a task experiences a change that starts a CloudWatch
        # event, the version counter is incremented. If you replicate your Amazon ECS task state with
        # CloudWatch Events, you can compare the version of a task reported by the Amazon ECS API actions with
        # the version reported in CloudWatch Events for the task (inside the detail object) to verify that the
        # version in your event stream is current.
        @[JSON::Field(key: "version")]
        getter version : Int64?

        def initialize(
          @attachments : Array(Types::Attachment)? = nil,
          @attributes : Array(Types::Attribute)? = nil,
          @availability_zone : String? = nil,
          @capacity_provider_name : String? = nil,
          @cluster_arn : String? = nil,
          @connectivity : String? = nil,
          @connectivity_at : Time? = nil,
          @container_instance_arn : String? = nil,
          @containers : Array(Types::Container)? = nil,
          @cpu : String? = nil,
          @created_at : Time? = nil,
          @desired_status : String? = nil,
          @enable_execute_command : Bool? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_stopped_at : Time? = nil,
          @fargate_ephemeral_storage : Types::TaskEphemeralStorage? = nil,
          @group : String? = nil,
          @health_status : String? = nil,
          @inference_accelerators : Array(Types::InferenceAccelerator)? = nil,
          @last_status : String? = nil,
          @launch_type : String? = nil,
          @memory : String? = nil,
          @overrides : Types::TaskOverride? = nil,
          @platform_family : String? = nil,
          @platform_version : String? = nil,
          @pull_started_at : Time? = nil,
          @pull_stopped_at : Time? = nil,
          @started_at : Time? = nil,
          @started_by : String? = nil,
          @stop_code : String? = nil,
          @stopped_at : Time? = nil,
          @stopped_reason : String? = nil,
          @stopping_at : Time? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_arn : String? = nil,
          @task_definition_arn : String? = nil,
          @version : Int64? = nil
        )
        end
      end

      # The details of a task definition which describes the container and volume definitions of an Amazon
      # Elastic Container Service task. You can specify which Docker images to use, the required resources,
      # and other configurations related to launching the task definition through an Amazon ECS service or
      # task.
      struct TaskDefinition
        include JSON::Serializable

        # Amazon ECS validates the task definition parameters with those supported by the launch type. For
        # more information, see Amazon ECS launch types in the Amazon Elastic Container Service Developer
        # Guide .
        @[JSON::Field(key: "compatibilities")]
        getter compatibilities : Array(String)?

        # A list of container definitions in JSON format that describe the different containers that make up
        # your task. For more information about container definition parameters and defaults, see Amazon ECS
        # Task Definitions in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "containerDefinitions")]
        getter container_definitions : Array(Types::ContainerDefinition)?

        # The number of cpu units used by the task. If you use the EC2 launch type, this field is optional.
        # Any value can be used. If you use the Fargate launch type, this field is required. You must use one
        # of the following values. The value that you choose determines your range of valid values for the
        # memory parameter. If you're using the EC2 launch type or the external launch type, this field is
        # optional. Supported values are between 128 CPU units ( 0.125 vCPUs) and 196608 CPU units ( 192
        # vCPUs). This field is required for Fargate. For information about the valid values, see Task size in
        # the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The Unix timestamp for the time when the task definition was deregistered.
        @[JSON::Field(key: "deregisteredAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deregistered_at : Time?

        # Enables fault injection and allows for fault injection requests to be accepted from the task's
        # containers. The default value is false .
        @[JSON::Field(key: "enableFaultInjection")]
        getter enable_fault_injection : Bool?

        # The ephemeral storage settings to use for tasks run with the task definition.
        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the task execution role that grants the Amazon ECS container agent
        # permission to make Amazon Web Services API calls on your behalf. For informationabout the required
        # IAM roles for Amazon ECS, see IAM roles for Amazon ECS in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The name of a family that this task definition is registered to. Up to 255 characters are allowed.
        # Letters (both uppercase and lowercase letters), numbers, hyphens (-), and underscores (_) are
        # allowed. A family groups multiple versions of a task definition. Amazon ECS gives the first task
        # definition that you registered to a family a revision number of 1. Amazon ECS gives sequential
        # revision numbers to each task definition that you add.
        @[JSON::Field(key: "family")]
        getter family : String?

        # The Elastic Inference accelerator that's associated with the task.
        @[JSON::Field(key: "inferenceAccelerators")]
        getter inference_accelerators : Array(Types::InferenceAccelerator)?

        # The IPC resource namespace to use for the containers in the task. The valid values are host , task ,
        # or none . If host is specified, then all containers within the tasks that specified the host IPC
        # mode on the same container instance share the same IPC resources with the host Amazon EC2 instance.
        # If task is specified, all containers within the specified task share the same IPC resources. If none
        # is specified, then IPC resources within the containers of a task are private and not shared with
        # other containers in a task or on the container instance. If no value is specified, then the IPC
        # resource namespace sharing depends on the Docker daemon setting on the container instance. If the
        # host IPC mode is used, be aware that there is a heightened risk of undesired IPC namespace expose.
        # If you are setting namespaced kernel parameters using systemControls for the containers in the task,
        # the following will apply to your IPC resource namespace. For more information, see System Controls
        # in the Amazon Elastic Container Service Developer Guide . For tasks that use the host IPC mode, IPC
        # namespace related systemControls are not supported. For tasks that use the task IPC mode, IPC
        # namespace related systemControls will apply to all containers within a task. This parameter is not
        # supported for Windows containers or tasks run on Fargate.
        @[JSON::Field(key: "ipcMode")]
        getter ipc_mode : String?

        # The amount (in MiB) of memory used by the task. If your tasks runs on Amazon EC2 instances, you must
        # specify either a task-level memory value or a container-level memory value. This field is optional
        # and any value can be used. If a task-level memory value is specified, the container-level memory
        # value is optional. For more information regarding container-level memory and memory reservation, see
        # ContainerDefinition . If your tasks runs on Fargate, this field is required. You must use one of the
        # following values. The value you choose determines your range of valid values for the cpu parameter.
        # 512 (0.5 GB), 1024 (1 GB), 2048 (2 GB) - Available cpu values: 256 (.25 vCPU) 1024 (1 GB), 2048 (2
        # GB), 3072 (3 GB), 4096 (4 GB) - Available cpu values: 512 (.5 vCPU) 2048 (2 GB), 3072 (3 GB), 4096
        # (4 GB), 5120 (5 GB), 6144 (6 GB), 7168 (7 GB), 8192 (8 GB) - Available cpu values: 1024 (1 vCPU)
        # Between 4096 (4 GB) and 16384 (16 GB) in increments of 1024 (1 GB) - Available cpu values: 2048 (2
        # vCPU) Between 8192 (8 GB) and 30720 (30 GB) in increments of 1024 (1 GB) - Available cpu values:
        # 4096 (4 vCPU) Between 16 GB and 60 GB in 4 GB increments - Available cpu values: 8192 (8 vCPU) This
        # option requires Linux platform 1.4.0 or later. Between 32GB and 120 GB in 8 GB increments -
        # Available cpu values: 16384 (16 vCPU) This option requires Linux platform 1.4.0 or later.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The Docker networking mode to use for the containers in the task. The valid values are none , bridge
        # , awsvpc , and host . If no network mode is specified, the default is bridge . For Amazon ECS tasks
        # on Fargate, the awsvpc network mode is required. For Amazon ECS tasks on Amazon EC2 Linux instances,
        # any network mode can be used. For Amazon ECS tasks on Amazon EC2 Windows instances, &lt;default&gt;
        # or awsvpc can be used. If the network mode is set to none , you cannot specify port mappings in your
        # container definitions, and the tasks containers do not have external connectivity. The host and
        # awsvpc network modes offer the highest networking performance for containers because they use the
        # EC2 network stack instead of the virtualized network stack provided by the bridge mode. With the
        # host and awsvpc network modes, exposed container ports are mapped directly to the corresponding host
        # port (for the host network mode) or the attached elastic network interface port (for the awsvpc
        # network mode), so you cannot take advantage of dynamic host port mappings. When using the host
        # network mode, you should not run containers using the root user (UID 0). It is considered best
        # practice to use a non-root user. If the network mode is awsvpc , the task is allocated an elastic
        # network interface, and you must specify a NetworkConfiguration value when you create a service or
        # run a task with the task definition. For more information, see Task Networking in the Amazon Elastic
        # Container Service Developer Guide . If the network mode is host , you cannot run multiple
        # instantiations of the same task on a single container instance when port mappings are used.
        @[JSON::Field(key: "networkMode")]
        getter network_mode : String?

        # The process namespace to use for the containers in the task. The valid values are host or task . On
        # Fargate for Linux containers, the only valid value is task . For example, monitoring sidecars might
        # need pidMode to access information about other containers running in the same task. If host is
        # specified, all containers within the tasks that specified the host PID mode on the same container
        # instance share the same process namespace with the host Amazon EC2 instance. If task is specified,
        # all containers within the specified task share the same process namespace. If no value is specified,
        # the The default is a private namespace for each container. If the host PID mode is used, there's a
        # heightened risk of undesired process namespace exposure. This parameter is not supported for Windows
        # containers. This parameter is only supported for tasks that are hosted on Fargate if the tasks are
        # using platform version 1.4.0 or later (Linux). This isn't supported for Windows containers on
        # Fargate.
        @[JSON::Field(key: "pidMode")]
        getter pid_mode : String?

        # An array of placement constraint objects to use for tasks. This parameter isn't supported for tasks
        # run on Fargate.
        @[JSON::Field(key: "placementConstraints")]
        getter placement_constraints : Array(Types::TaskDefinitionPlacementConstraint)?

        # The configuration details for the App Mesh proxy. Your Amazon ECS container instances require at
        # least version 1.26.0 of the container agent and at least version 1.26.0-1 of the ecs-init package to
        # use a proxy configuration. If your container instances are launched from the Amazon ECS optimized
        # AMI version 20190301 or later, they contain the required versions of the container agent and
        # ecs-init . For more information, see Amazon ECS-optimized Linux AMI in the Amazon Elastic Container
        # Service Developer Guide .
        @[JSON::Field(key: "proxyConfiguration")]
        getter proxy_configuration : Types::ProxyConfiguration?

        # The Unix timestamp for the time when the task definition was registered.
        @[JSON::Field(key: "registeredAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter registered_at : Time?

        # The principal that registered the task definition.
        @[JSON::Field(key: "registeredBy")]
        getter registered_by : String?

        # The container instance attributes required by your task. When an Amazon EC2 instance is registered
        # to your cluster, the Amazon ECS container agent assigns some standard attributes to the instance.
        # You can apply custom attributes. These are specified as key-value pairs using the Amazon ECS console
        # or the PutAttributes API. These attributes are used when determining task placement for tasks hosted
        # on Amazon EC2 instances. For more information, see Attributes in the Amazon Elastic Container
        # Service Developer Guide . This parameter isn't supported for tasks run on Fargate.
        @[JSON::Field(key: "requiresAttributes")]
        getter requires_attributes : Array(Types::Attribute)?

        # The task launch types the task definition was validated against. The valid values are
        # MANAGED_INSTANCES , EC2 , FARGATE , and EXTERNAL . For more information, see Amazon ECS launch types
        # in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "requiresCompatibilities")]
        getter requires_compatibilities : Array(String)?

        # The revision of the task in a particular family. The revision is a version number of a task
        # definition in a family. When you register a task definition for the first time, the revision is 1 .
        # Each time that you register a new revision of a task definition in the same family, the revision
        # value always increases by one. This is even if you deregistered previous revisions in this family.
        @[JSON::Field(key: "revision")]
        getter revision : Int32?

        # The operating system that your task definitions are running on. A platform family is specified only
        # for tasks using the Fargate launch type. When you specify a task in a service, this value must match
        # the runtimePlatform value of the service.
        @[JSON::Field(key: "runtimePlatform")]
        getter runtime_platform : Types::RuntimePlatform?

        # The status of the task definition.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The full Amazon Resource Name (ARN) of the task definition.
        @[JSON::Field(key: "taskDefinitionArn")]
        getter task_definition_arn : String?

        # The short name or full Amazon Resource Name (ARN) of the Identity and Access Management role that
        # grants containers in the task permission to call Amazon Web Services APIs on your behalf. For
        # informationabout the required IAM roles for Amazon ECS, see IAM roles for Amazon ECS in the Amazon
        # Elastic Container Service Developer Guide .
        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        # The list of data volume definitions for the task. For more information, see Using data volumes in
        # tasks in the Amazon Elastic Container Service Developer Guide . The host and sourcePath parameters
        # aren't supported for tasks run on Fargate.
        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @compatibilities : Array(String)? = nil,
          @container_definitions : Array(Types::ContainerDefinition)? = nil,
          @cpu : String? = nil,
          @deregistered_at : Time? = nil,
          @enable_fault_injection : Bool? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @family : String? = nil,
          @inference_accelerators : Array(Types::InferenceAccelerator)? = nil,
          @ipc_mode : String? = nil,
          @memory : String? = nil,
          @network_mode : String? = nil,
          @pid_mode : String? = nil,
          @placement_constraints : Array(Types::TaskDefinitionPlacementConstraint)? = nil,
          @proxy_configuration : Types::ProxyConfiguration? = nil,
          @registered_at : Time? = nil,
          @registered_by : String? = nil,
          @requires_attributes : Array(Types::Attribute)? = nil,
          @requires_compatibilities : Array(String)? = nil,
          @revision : Int32? = nil,
          @runtime_platform : Types::RuntimePlatform? = nil,
          @status : String? = nil,
          @task_definition_arn : String? = nil,
          @task_role_arn : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # The constraint on task placement in the task definition. For more information, see Task placement
      # constraints in the Amazon Elastic Container Service Developer Guide . Task placement constraints
      # aren't supported for tasks run on Fargate.
      struct TaskDefinitionPlacementConstraint
        include JSON::Serializable

        # A cluster query language expression to apply to the constraint. For more information, see Cluster
        # query language in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "expression")]
        getter expression : String?

        # The type of constraint. The MemberOf constraint restricts selection to be from a group of valid
        # candidates.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @expression : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The amount of ephemeral storage to allocate for the task.
      struct TaskEphemeralStorage
        include JSON::Serializable

        # Specify an Key Management Service key ID to encrypt the ephemeral storage for the task.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The total amount, in GiB, of the ephemeral storage to set for the task. The minimum supported value
        # is 20 GiB and the maximum supported value is&#x2028; 200 GiB.
        @[JSON::Field(key: "sizeInGiB")]
        getter size_in_gi_b : Int32?

        def initialize(
          @kms_key_id : String? = nil,
          @size_in_gi_b : Int32? = nil
        )
        end
      end

      # The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your behalf.
      # These settings are used to create each Amazon EBS volume, with one volume created for each task.
      struct TaskManagedEBSVolumeConfiguration
        include JSON::Serializable

        # The ARN of the IAM role to associate with this volume. This is the Amazon ECS infrastructure IAM
        # role that is used to manage your Amazon Web Services infrastructure. We recommend using the Amazon
        # ECS-managed AmazonECSInfrastructureRolePolicyForVolumes IAM policy with this role. For more
        # information, see Amazon ECS infrastructure IAM role in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Indicates whether the volume should be encrypted. If you turn on Region-level Amazon EBS encryption
        # by default but set this value as false , the setting is overridden and the volume is encrypted with
        # the KMS key specified for Amazon EBS encryption by default. This parameter maps 1:1 with the
        # Encrypted parameter of the CreateVolume API in the Amazon EC2 API Reference .
        @[JSON::Field(key: "encrypted")]
        getter encrypted : Bool?

        # The Linux filesystem type for the volume. For volumes created from a snapshot, you must specify the
        # same filesystem type that the volume was using when the snapshot was created. If there is a
        # filesystem type mismatch, the task will fail to start. The available filesystem types are&#x2028;
        # ext3 , ext4 , and xfs . If no value is specified, the xfs filesystem type is used by default.
        @[JSON::Field(key: "filesystemType")]
        getter filesystem_type : String?

        # The number of I/O operations per second (IOPS). For gp3 , io1 , and io2 volumes, this represents the
        # number of IOPS that are provisioned for the volume. For gp2 volumes, this represents the baseline
        # performance of the volume and the rate at which the volume accumulates I/O credits for bursting. The
        # following are the supported values for each volume type. gp3 : 3,000 - 16,000 IOPS io1 : 100 -
        # 64,000 IOPS io2 : 100 - 256,000 IOPS This parameter is required for io1 and io2 volume types. The
        # default for gp3 volumes is 3,000 IOPS . This parameter is not supported for st1 , sc1 , or standard
        # volume types. This parameter maps 1:1 with the Iops parameter of the CreateVolume API in the Amazon
        # EC2 API Reference .
        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # The Amazon Resource Name (ARN) identifier of the Amazon Web Services Key Management Service key to
        # use for Amazon EBS encryption. When a key is specified using this parameter, it overrides Amazon EBS
        # default encryption or any KMS key that you specified for cluster-level managed storage encryption.
        # This parameter maps 1:1 with the KmsKeyId parameter of the CreateVolume API in the Amazon EC2 API
        # Reference . For more information about encrypting Amazon EBS volumes attached to a task, see Encrypt
        # data stored in Amazon EBS volumes attached to Amazon ECS tasks . Amazon Web Services authenticates
        # the Amazon Web Services Key Management Service key asynchronously. Therefore, if you specify an ID,
        # alias, or ARN that is invalid, the action can appear to complete, but eventually fails.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The size of the volume in GiB. You must specify either a volume size or a snapshot ID. If you
        # specify a snapshot ID, the snapshot size is used for the volume size by default. You can optionally
        # specify a volume size greater than or equal to the snapshot size. This parameter maps 1:1 with the
        # Size parameter of the CreateVolume API in the Amazon EC2 API Reference . The following are the
        # supported volume size values for each volume type. gp2 and gp3 : 1-16,384 io1 and io2 : 4-16,384 st1
        # and sc1 : 125-16,384 standard : 1-1,024
        @[JSON::Field(key: "sizeInGiB")]
        getter size_in_gi_b : Int32?

        # The snapshot that Amazon ECS uses to create the volume. You must specify either a snapshot ID or a
        # volume size. This parameter maps 1:1 with the SnapshotId parameter of the CreateVolume API in the
        # Amazon EC2 API Reference .
        @[JSON::Field(key: "snapshotId")]
        getter snapshot_id : String?

        # The tags to apply to the volume. Amazon ECS applies service-managed tags by default. This parameter
        # maps 1:1 with the TagSpecifications.N parameter of the CreateVolume API in the Amazon EC2 API
        # Reference .
        @[JSON::Field(key: "tagSpecifications")]
        getter tag_specifications : Array(Types::EBSTagSpecification)?

        # The termination policy for the volume when the task exits. This provides a way to control whether
        # Amazon ECS terminates the Amazon EBS volume when the task stops.
        @[JSON::Field(key: "terminationPolicy")]
        getter termination_policy : Types::TaskManagedEBSVolumeTerminationPolicy?

        # The throughput to provision for a volume, in MiB/s, with a maximum of 1,000 MiB/s. This parameter
        # maps 1:1 with the Throughput parameter of the CreateVolume API in the Amazon EC2 API Reference .
        # This parameter is only supported for the gp3 volume type.
        @[JSON::Field(key: "throughput")]
        getter throughput : Int32?

        # The rate, in MiB/s, at which data is fetched from a snapshot of an existing Amazon EBS volume to
        # create a new volume for attachment to the task. This property can be specified only if you specify a
        # snapshotId . For more information, see Initialize Amazon EBS volumes in the Amazon EBS User Guide .
        @[JSON::Field(key: "volumeInitializationRate")]
        getter volume_initialization_rate : Int32?

        # The volume type. This parameter maps 1:1 with the VolumeType parameter of the CreateVolume API in
        # the Amazon EC2 API Reference . For more information, see Amazon EBS volume types in the Amazon EC2
        # User Guide . The following are the supported volume types. General Purpose SSD: gp2 | gp3
        # Provisioned IOPS SSD: io1 | io2 Throughput Optimized HDD: st1 Cold HDD: sc1 Magnetic: standard The
        # magnetic volume type is not supported on Fargate.
        @[JSON::Field(key: "volumeType")]
        getter volume_type : String?

        def initialize(
          @role_arn : String,
          @encrypted : Bool? = nil,
          @filesystem_type : String? = nil,
          @iops : Int32? = nil,
          @kms_key_id : String? = nil,
          @size_in_gi_b : Int32? = nil,
          @snapshot_id : String? = nil,
          @tag_specifications : Array(Types::EBSTagSpecification)? = nil,
          @termination_policy : Types::TaskManagedEBSVolumeTerminationPolicy? = nil,
          @throughput : Int32? = nil,
          @volume_initialization_rate : Int32? = nil,
          @volume_type : String? = nil
        )
        end
      end

      # The termination policy for the Amazon EBS volume when the task exits. For more information, see
      # Amazon ECS volume termination policy .
      struct TaskManagedEBSVolumeTerminationPolicy
        include JSON::Serializable

        # Indicates whether the volume should be deleted on when the task stops. If a value of true is
        # specified, &#x2028;Amazon ECS deletes the Amazon EBS volume on your behalf when the task goes into
        # the STOPPED state. If no value is specified, the &#x2028;default value is true is used. When set to
        # false , Amazon ECS leaves the volume in your &#x2028;account.
        @[JSON::Field(key: "deleteOnTermination")]
        getter delete_on_termination : Bool

        def initialize(
          @delete_on_termination : Bool
        )
        end
      end

      # The overrides that are associated with a task.
      struct TaskOverride
        include JSON::Serializable

        # One or more container overrides that are sent to a task.
        @[JSON::Field(key: "containerOverrides")]
        getter container_overrides : Array(Types::ContainerOverride)?

        # The CPU override for the task.
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The ephemeral storage setting override for the task. This parameter is only supported for tasks
        # hosted on Fargate that use the following platform versions: Linux platform version 1.4.0 or later.
        # Windows platform version 1.0.0 or later.
        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the task execution role override for the task. For more
        # information, see Amazon ECS task execution IAM role in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The Elastic Inference accelerator override for the task.
        @[JSON::Field(key: "inferenceAcceleratorOverrides")]
        getter inference_accelerator_overrides : Array(Types::InferenceAcceleratorOverride)?

        # The memory override for the task.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The Amazon Resource Name (ARN) of the role that containers in this task can assume. All containers
        # in this task are granted the permissions that are specified in this role. For more information, see
        # IAM Role for Tasks in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        def initialize(
          @container_overrides : Array(Types::ContainerOverride)? = nil,
          @cpu : String? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @inference_accelerator_overrides : Array(Types::InferenceAcceleratorOverride)? = nil,
          @memory : String? = nil,
          @task_role_arn : String? = nil
        )
        end
      end

      # Information about a set of Amazon ECS tasks in either an CodeDeploy or an EXTERNAL deployment. An
      # Amazon ECS task set includes details such as the desired number of tasks, how many tasks are
      # running, and whether the task set serves production traffic.
      struct TaskSet
        include JSON::Serializable

        # The capacity provider strategy that are associated with the task set.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # The Amazon Resource Name (ARN) of the cluster that the service that hosts the task set exists in.
        @[JSON::Field(key: "clusterArn")]
        getter cluster_arn : String?

        # The computed desired count for the task set. This is calculated by multiplying the service's
        # desiredCount by the task set's scale percentage. The result is always rounded up. For example, if
        # the computed desired count is 1.2, it rounds up to 2 tasks.
        @[JSON::Field(key: "computedDesiredCount")]
        getter computed_desired_count : Int32?

        # The Unix timestamp for the time when the task set was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The external ID associated with the task set. If an CodeDeploy deployment created a task set, the
        # externalId parameter contains the CodeDeploy deployment ID. If a task set is created for an external
        # deployment and is associated with a service discovery registry, the externalId parameter contains
        # the ECS_TASK_SET_EXTERNAL_ID Cloud Map attribute.
        @[JSON::Field(key: "externalId")]
        getter external_id : String?

        # The Fargate ephemeral storage settings for the task set.
        @[JSON::Field(key: "fargateEphemeralStorage")]
        getter fargate_ephemeral_storage : Types::DeploymentEphemeralStorage?

        # The ID of the task set.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The launch type the tasks in the task set are using. For more information, see Amazon ECS launch
        # types in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "launchType")]
        getter launch_type : String?

        # Details on a load balancer that are used with a task set.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # The network configuration for the task set.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The number of tasks in the task set that are in the PENDING status during a deployment. A task in
        # the PENDING state is preparing to enter the RUNNING state. A task set enters the PENDING status when
        # it launches for the first time or when it's restarted after being in the STOPPED state.
        @[JSON::Field(key: "pendingCount")]
        getter pending_count : Int32?

        # The operating system that your tasks in the set are running on. A platform family is specified only
        # for tasks that use the Fargate launch type. All tasks in the set must have the same value.
        @[JSON::Field(key: "platformFamily")]
        getter platform_family : String?

        # The Fargate platform version where the tasks in the task set are running. A platform version is only
        # specified for tasks run on Fargate. For more information, see Fargate platform versions in the
        # Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # The number of tasks in the task set that are in the RUNNING status during a deployment. A task in
        # the RUNNING state is running and ready for use.
        @[JSON::Field(key: "runningCount")]
        getter running_count : Int32?

        # A floating-point percentage of your desired number of tasks to place and keep running in the task
        # set.
        @[JSON::Field(key: "scale")]
        getter scale : Types::Scale?

        # The Amazon Resource Name (ARN) of the service the task set exists in.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The details for the service discovery registries to assign to this task set. For more information,
        # see Service discovery .
        @[JSON::Field(key: "serviceRegistries")]
        getter service_registries : Array(Types::ServiceRegistry)?

        # The stability status. This indicates whether the task set has reached a steady state. If the
        # following conditions are met, the task set are in STEADY_STATE : The task runningCount is equal to
        # the computedDesiredCount . The pendingCount is 0 . There are no tasks that are running on container
        # instances in the DRAINING status. All tasks are reporting a healthy status from the load balancers,
        # service discovery, and container health checks. If any of those conditions aren't met, the stability
        # status returns STABILIZING .
        @[JSON::Field(key: "stabilityStatus")]
        getter stability_status : String?

        # The Unix timestamp for the time when the task set stability status was retrieved.
        @[JSON::Field(key: "stabilityStatusAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stability_status_at : Time?

        # The tag specified when a task set is started. If an CodeDeploy deployment created the task set, the
        # startedBy parameter is CODE_DEPLOY . If an external deployment created the task set, the startedBy
        # field isn't used.
        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # The status of the task set. The following describes each state. PRIMARY The task set is serving
        # production traffic. ACTIVE The task set isn't serving production traffic. DRAINING The tasks in the
        # task set are being stopped, and their corresponding targets are being deregistered from their target
        # group.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The metadata that you apply to the task set to help you categorize and organize them. Each tag
        # consists of a key and an optional value. You define both. The following basic restrictions apply to
        # tags: Maximum number of tags per resource - 50 For each resource, each tag key must be unique, and
        # each tag key can have only one value. Maximum key length - 128 Unicode characters in UTF-8 Maximum
        # value length - 256 Unicode characters in UTF-8 If your tagging schema is used across multiple
        # services and resources, remember that other services may have restrictions on allowed characters.
        # Generally allowed characters are: letters, numbers, and spaces representable in UTF-8, and the
        # following characters: + - = . _ : / @. Tag keys and values are case-sensitive. Do not use aws: ,
        # AWS: , or any upper or lowercase combination of such as a prefix for either keys or values as it is
        # reserved for Amazon Web Services use. You cannot edit or delete tag keys or values with this prefix.
        # Tags with this prefix do not count against your tags per resource limit.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # The task definition that the task set is using.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String?

        # The Amazon Resource Name (ARN) of the task set.
        @[JSON::Field(key: "taskSetArn")]
        getter task_set_arn : String?

        # The Unix timestamp for the time when the task set was last updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @cluster_arn : String? = nil,
          @computed_desired_count : Int32? = nil,
          @created_at : Time? = nil,
          @external_id : String? = nil,
          @fargate_ephemeral_storage : Types::DeploymentEphemeralStorage? = nil,
          @id : String? = nil,
          @launch_type : String? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @pending_count : Int32? = nil,
          @platform_family : String? = nil,
          @platform_version : String? = nil,
          @running_count : Int32? = nil,
          @scale : Types::Scale? = nil,
          @service_arn : String? = nil,
          @service_registries : Array(Types::ServiceRegistry)? = nil,
          @stability_status : String? = nil,
          @stability_status_at : Time? = nil,
          @started_by : String? = nil,
          @status : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_definition : String? = nil,
          @task_set_arn : String? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The specified task set wasn't found. You can view your available task sets with DescribeTaskSets .
      # Task sets are specific to each cluster, service and Region.
      struct TaskSetNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration settings for the task volume that was configuredAtLaunch that weren't set during
      # RegisterTaskDef .
      struct TaskVolumeConfiguration
        include JSON::Serializable

        # The name of the volume. This value must match the volume name from the Volume object in the task
        # definition.
        @[JSON::Field(key: "name")]
        getter name : String

        # The configuration for the Amazon EBS volume that Amazon ECS creates and manages on your behalf.
        # These settings are used to create each Amazon EBS volume, with one volume created for each task. The
        # Amazon EBS volumes are visible in your account in the Amazon EC2 console once they are created.
        @[JSON::Field(key: "managedEBSVolume")]
        getter managed_ebs_volume : Types::TaskManagedEBSVolumeConfiguration?

        def initialize(
          @name : String,
          @managed_ebs_volume : Types::TaskManagedEBSVolumeConfiguration? = nil
        )
        end
      end

      # An object that represents the timeout configurations for Service Connect. If idleTimeout is set to a
      # time that is less than perRequestTimeout , the connection will close when the idleTimeout is reached
      # and not the perRequestTimeout .
      struct TimeoutConfiguration
        include JSON::Serializable

        # The amount of time in seconds a connection will stay active while idle. A value of 0 can be set to
        # disable idleTimeout . The idleTimeout default for HTTP / HTTP2 / GRPC is 5 minutes. The idleTimeout
        # default for TCP is 1 hour.
        @[JSON::Field(key: "idleTimeoutSeconds")]
        getter idle_timeout_seconds : Int32?

        # The amount of time waiting for the upstream to respond with a complete response per request. A value
        # of 0 can be set to disable perRequestTimeout . perRequestTimeout can only be set if Service Connect
        # appProtocol isn't TCP . Only idleTimeout is allowed for TCP appProtocol .
        @[JSON::Field(key: "perRequestTimeoutSeconds")]
        getter per_request_timeout_seconds : Int32?

        def initialize(
          @idle_timeout_seconds : Int32? = nil,
          @per_request_timeout_seconds : Int32? = nil
        )
        end
      end

      # The container path, mount options, and size of the tmpfs mount.
      struct Tmpfs
        include JSON::Serializable

        # The absolute file path where the tmpfs volume is to be mounted.
        @[JSON::Field(key: "containerPath")]
        getter container_path : String

        # The maximum size (in MiB) of the tmpfs volume.
        @[JSON::Field(key: "size")]
        getter size : Int32

        # The list of tmpfs volume mount options. Valid values: "defaults" | "ro" | "rw" | "suid" | "nosuid" |
        # "dev" | "nodev" | "exec" | "noexec" | "sync" | "async" | "dirsync" | "remount" | "mand" | "nomand" |
        # "atime" | "noatime" | "diratime" | "nodiratime" | "bind" | "rbind" | "unbindable" | "runbindable" |
        # "private" | "rprivate" | "shared" | "rshared" | "slave" | "rslave" | "relatime" | "norelatime" |
        # "strictatime" | "nostrictatime" | "mode" | "uid" | "gid" | "nr_inodes" | "nr_blocks" | "mpol"
        @[JSON::Field(key: "mountOptions")]
        getter mount_options : Array(String)?

        def initialize(
          @container_path : String,
          @size : Int32,
          @mount_options : Array(String)? = nil
        )
        end
      end

      # The minimum and maximum total local storage in gigabytes (GB) for instance types with local storage.
      # This is useful for workloads that require local storage for temporary data or caching.
      struct TotalLocalStorageGBRequest
        include JSON::Serializable

        # The maximum total local storage in GB. Instance types with more local storage are excluded from
        # selection.
        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The minimum total local storage in GB. Instance types with less local storage are excluded from
        # selection.
        @[JSON::Field(key: "min")]
        getter min : Float64?

        def initialize(
          @max : Float64? = nil,
          @min : Float64? = nil
        )
        end
      end

      # The ulimit settings to pass to the container. Amazon ECS tasks hosted on Fargate use the default
      # resource limit values set by the operating system with the exception of the nofile resource limit
      # parameter which Fargate overrides. The nofile resource limit sets a restriction on the number of
      # open files that a container can use. The default nofile soft limit is 65535 and the default hard
      # limit is 65535 . You can specify the ulimit settings for a container in a task definition.
      struct Ulimit
        include JSON::Serializable

        # The hard limit for the ulimit type. The value can be specified in bytes, seconds, or as a count,
        # depending on the type of the ulimit .
        @[JSON::Field(key: "hardLimit")]
        getter hard_limit : Int32

        # The type of the ulimit .
        @[JSON::Field(key: "name")]
        getter name : String

        # The soft limit for the ulimit type. The value can be specified in bytes, seconds, or as a count,
        # depending on the type of the ulimit .
        @[JSON::Field(key: "softLimit")]
        getter soft_limit : Int32

        def initialize(
          @hard_limit : Int32,
          @name : String,
          @soft_limit : Int32
        )
        end
      end

      # The specified task isn't supported in this Region.
      struct UnsupportedFeatureException
        include JSON::Serializable

        def initialize
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to delete tags from. Currently, the supported
        # resources are Amazon ECS capacity providers, tasks, services, task definitions, clusters, and
        # container instances.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to be removed.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateCapacityProviderRequest
        include JSON::Serializable

        # The name of the capacity provider to update.
        @[JSON::Field(key: "name")]
        getter name : String

        # An object that represent the parameters to update for the Auto Scaling group capacity provider.
        @[JSON::Field(key: "autoScalingGroupProvider")]
        getter auto_scaling_group_provider : Types::AutoScalingGroupProviderUpdate?

        # The name of the cluster that contains the capacity provider to update. Managed instances capacity
        # providers are cluster-scoped and can only be updated within their associated cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The updated configuration for the Amazon ECS Managed Instances provider. You can modify the
        # infrastructure role, instance launch template, and tag propagation settings. Changes take effect for
        # new instances launched after the update.
        @[JSON::Field(key: "managedInstancesProvider")]
        getter managed_instances_provider : Types::UpdateManagedInstancesProviderConfiguration?

        def initialize(
          @name : String,
          @auto_scaling_group_provider : Types::AutoScalingGroupProviderUpdate? = nil,
          @cluster : String? = nil,
          @managed_instances_provider : Types::UpdateManagedInstancesProviderConfiguration? = nil
        )
        end
      end

      struct UpdateCapacityProviderResponse
        include JSON::Serializable

        # Details about the capacity provider.
        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : Types::CapacityProvider?

        def initialize(
          @capacity_provider : Types::CapacityProvider? = nil
        )
        end
      end

      struct UpdateClusterRequest
        include JSON::Serializable

        # The name of the cluster to modify the settings for.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The execute command configuration for the cluster.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ClusterConfiguration?

        # Use this parameter to set a default Service Connect namespace. After you set a default Service
        # Connect namespace, any new services with Service Connect turned on that are created in the cluster
        # are added as client services in the namespace. This setting only applies to new services that set
        # the enabled parameter to true in the ServiceConnectConfiguration . You can set the namespace of each
        # service individually in the ServiceConnectConfiguration to override this default parameter. Tasks
        # that run in a namespace can use short names to connect to services in the namespace. Tasks can
        # connect to services across all of the clusters in the namespace. Tasks connect through a managed
        # proxy container that collects logs and metrics for increased visibility. Only the tasks that Amazon
        # ECS services create are supported with Service Connect. For more information, see Service Connect in
        # the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "serviceConnectDefaults")]
        getter service_connect_defaults : Types::ClusterServiceConnectDefaultsRequest?

        # The cluster settings for your cluster.
        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::ClusterSetting)?

        def initialize(
          @cluster : String,
          @configuration : Types::ClusterConfiguration? = nil,
          @service_connect_defaults : Types::ClusterServiceConnectDefaultsRequest? = nil,
          @settings : Array(Types::ClusterSetting)? = nil
        )
        end
      end

      struct UpdateClusterResponse
        include JSON::Serializable

        # Details about the cluster.
        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct UpdateClusterSettingsRequest
        include JSON::Serializable

        # The name of the cluster to modify the settings for.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The setting to use by default for a cluster. This parameter is used to turn on CloudWatch Container
        # Insights for a cluster. If this value is specified, it overrides the containerInsights value set
        # with PutAccountSetting or PutAccountSettingDefault . Currently, if you delete an existing cluster
        # that does not have Container Insights turned on, and then create a new cluster with the same name
        # with Container Insights tuned on, Container Insights will not actually be turned on. If you want to
        # preserve the same name for your existing cluster and turn on Container Insights, you must wait 7
        # days before you can re-create it.
        @[JSON::Field(key: "settings")]
        getter settings : Array(Types::ClusterSetting)

        def initialize(
          @cluster : String,
          @settings : Array(Types::ClusterSetting)
        )
        end
      end

      struct UpdateClusterSettingsResponse
        include JSON::Serializable

        # Details about the cluster
        @[JSON::Field(key: "cluster")]
        getter cluster : Types::Cluster?

        def initialize(
          @cluster : Types::Cluster? = nil
        )
        end
      end

      struct UpdateContainerAgentRequest
        include JSON::Serializable

        # The container instance ID or full ARN entries for the container instance where you would like to
        # update the Amazon ECS container agent.
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : String

        # The short name or full Amazon Resource Name (ARN) of the cluster that your container instance is
        # running on. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        def initialize(
          @container_instance : String,
          @cluster : String? = nil
        )
        end
      end

      struct UpdateContainerAgentResponse
        include JSON::Serializable

        # The container instance that the container agent was updated for.
        @[JSON::Field(key: "containerInstance")]
        getter container_instance : Types::ContainerInstance?

        def initialize(
          @container_instance : Types::ContainerInstance? = nil
        )
        end
      end

      struct UpdateContainerInstancesStateRequest
        include JSON::Serializable

        # A list of up to 10 container instance IDs or full ARN entries.
        @[JSON::Field(key: "containerInstances")]
        getter container_instances : Array(String)

        # The container instance state to update the container instance with. The only valid values for this
        # action are ACTIVE and DRAINING . A container instance can only be updated to DRAINING status once it
        # has reached an ACTIVE state. If a container instance is in REGISTERING , DEREGISTERING , or
        # REGISTRATION_FAILED state you can describe the container instance but can't update the container
        # instance state.
        @[JSON::Field(key: "status")]
        getter status : String

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the container instance
        # to update. If you do not specify a cluster, the default cluster is assumed.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        def initialize(
          @container_instances : Array(String),
          @status : String,
          @cluster : String? = nil
        )
        end
      end

      struct UpdateContainerInstancesStateResponse
        include JSON::Serializable

        # The list of container instances.
        @[JSON::Field(key: "containerInstances")]
        getter container_instances : Array(Types::ContainerInstance)?

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        def initialize(
          @container_instances : Array(Types::ContainerInstance)? = nil,
          @failures : Array(Types::Failure)? = nil
        )
        end
      end

      struct UpdateExpressGatewayServiceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Express service to update.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String

        # The number of CPU units used by the task.
        @[JSON::Field(key: "cpu")]
        getter cpu : String?

        # The Amazon Resource Name (ARN) of the task execution role for the Express service.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The path on the container for Application Load Balancer health checks.
        @[JSON::Field(key: "healthCheckPath")]
        getter health_check_path : String?

        # The amount of memory (in MiB) used by the task.
        @[JSON::Field(key: "memory")]
        getter memory : String?

        # The network configuration for the Express service tasks. By default, the network configuration for
        # an Express service uses the default VPC.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::ExpressGatewayServiceNetworkConfiguration?

        # The primary container configuration for the Express service.
        @[JSON::Field(key: "primaryContainer")]
        getter primary_container : Types::ExpressGatewayContainer?

        # The auto-scaling configuration for the Express service.
        @[JSON::Field(key: "scalingTarget")]
        getter scaling_target : Types::ExpressGatewayScalingTarget?

        # The Amazon Resource Name (ARN) of the IAM role for containers in this task.
        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        def initialize(
          @service_arn : String,
          @cpu : String? = nil,
          @execution_role_arn : String? = nil,
          @health_check_path : String? = nil,
          @memory : String? = nil,
          @network_configuration : Types::ExpressGatewayServiceNetworkConfiguration? = nil,
          @primary_container : Types::ExpressGatewayContainer? = nil,
          @scaling_target : Types::ExpressGatewayScalingTarget? = nil,
          @task_role_arn : String? = nil
        )
        end
      end

      struct UpdateExpressGatewayServiceResponse
        include JSON::Serializable

        # The full description of your express gateway service following the update call.
        @[JSON::Field(key: "service")]
        getter service : Types::UpdatedExpressGatewayService?

        def initialize(
          @service : Types::UpdatedExpressGatewayService? = nil
        )
        end
      end

      # There's already a current Amazon ECS container agent update in progress on the container instance
      # that's specified. If the container agent becomes disconnected while it's in a transitional stage,
      # such as PENDING or STAGING , the update process can get stuck in that state. However, when the agent
      # reconnects, it resumes where it stopped previously.
      struct UpdateInProgressException
        include JSON::Serializable

        def initialize
        end
      end

      # The updated configuration for a Amazon ECS Managed Instances provider. You can modify the
      # infrastructure role, instance launch template, and tag propagation settings. Changes apply to new
      # instances launched after the update.
      struct UpdateManagedInstancesProviderConfiguration
        include JSON::Serializable

        # The updated Amazon Resource Name (ARN) of the infrastructure role. The new role must have the
        # necessary permissions to manage instances and access required Amazon Web Services services. For more
        # information, see Amazon ECS infrastructure IAM role in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "infrastructureRoleArn")]
        getter infrastructure_role_arn : String

        # The updated launch template configuration. Changes to the launch template affect new instances
        # launched after the update, while existing instances continue to use their original configuration.
        @[JSON::Field(key: "instanceLaunchTemplate")]
        getter instance_launch_template : Types::InstanceLaunchTemplateUpdate

        # The updated infrastructure optimization configuration. Changes to this setting affect how Amazon ECS
        # optimizes instances going forward.
        @[JSON::Field(key: "infrastructureOptimization")]
        getter infrastructure_optimization : Types::InfrastructureOptimization?

        # The updated tag propagation setting. When changed, this affects only new instances launched after
        # the update.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        def initialize(
          @infrastructure_role_arn : String,
          @instance_launch_template : Types::InstanceLaunchTemplateUpdate,
          @infrastructure_optimization : Types::InfrastructureOptimization? = nil,
          @propagate_tags : String? = nil
        )
        end
      end

      struct UpdateServicePrimaryTaskSetRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the
        # task set exists in.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # The short name or full Amazon Resource Name (ARN) of the task set to set as the primary task set in
        # the deployment.
        @[JSON::Field(key: "primaryTaskSet")]
        getter primary_task_set : String

        # The short name or full Amazon Resource Name (ARN) of the service that the task set exists in.
        @[JSON::Field(key: "service")]
        getter service : String

        def initialize(
          @cluster : String,
          @primary_task_set : String,
          @service : String
        )
        end
      end

      struct UpdateServicePrimaryTaskSetResponse
        include JSON::Serializable

        # The details about the task set.
        @[JSON::Field(key: "taskSet")]
        getter task_set : Types::TaskSet?

        def initialize(
          @task_set : Types::TaskSet? = nil
        )
        end
      end

      struct UpdateServiceRequest
        include JSON::Serializable

        # The name of the service to update.
        @[JSON::Field(key: "service")]
        getter service : String

        # Indicates whether to use Availability Zone rebalancing for the service. For more information, see
        # Balancing an Amazon ECS service across Availability Zones in the Amazon Elastic Container Service
        # Developer Guide . The default behavior of AvailabilityZoneRebalancing differs between create and
        # update requests: For create service requests, when no value is specified for
        # AvailabilityZoneRebalancing , Amazon ECS defaults the value to ENABLED . For update service
        # requests, when no value is specified for AvailabilityZoneRebalancing , Amazon ECS defaults to the
        # existing service’s AvailabilityZoneRebalancing value. If the service never had an
        # AvailabilityZoneRebalancing value set, Amazon ECS treats this as DISABLED . This parameter doesn't
        # trigger a new service deployment.
        @[JSON::Field(key: "availabilityZoneRebalancing")]
        getter availability_zone_rebalancing : String?

        # The details of a capacity provider strategy. You can set a capacity provider when you create a
        # cluster, run a task, or update a service. If you want to use Amazon ECS Managed Instances, you must
        # use the capacityProviderStrategy request parameter. When you use Fargate, the capacity providers are
        # FARGATE or FARGATE_SPOT . When you use Amazon EC2, the capacity providers are Auto Scaling groups.
        # You can change capacity providers for rolling deployments and blue/green deployments. The following
        # list provides the valid transitions: Update the Fargate launch type to an Auto Scaling group
        # capacity provider. Update the Amazon EC2 launch type to a Fargate capacity provider. Update the
        # Fargate capacity provider to an Auto Scaling group capacity provider. Update the Amazon EC2 capacity
        # provider to a Fargate capacity provider. Update the Auto Scaling group or Fargate capacity provider
        # back to the launch type. Pass an empty list in the capacityProviderStrategy parameter. For
        # information about Amazon Web Services CDK considerations, see Amazon Web Services CDK considerations
        # . This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "capacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # The short name or full Amazon Resource Name (ARN) of the cluster that your service runs on. If you
        # do not specify a cluster, the default cluster is assumed. You can't change the cluster name.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # Optional deployment parameters that control how many tasks run during the deployment and the
        # ordering of stopping and starting tasks. This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "deploymentConfiguration")]
        getter deployment_configuration : Types::DeploymentConfiguration?

        @[JSON::Field(key: "deploymentController")]
        getter deployment_controller : Types::DeploymentController?

        # The number of instantiations of the task to place and keep running in your service. This parameter
        # doesn't trigger a new service deployment.
        @[JSON::Field(key: "desiredCount")]
        getter desired_count : Int32?

        # Determines whether to turn on Amazon ECS managed tags for the tasks in the service. For more
        # information, see Tagging Your Amazon ECS Resources in the Amazon Elastic Container Service Developer
        # Guide . Only tasks launched after the update will reflect the update. To update the tags on all
        # tasks, set forceNewDeployment to true , so that Amazon ECS starts new tasks with the updated tags.
        # This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "enableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # If true , this enables execute command functionality on all task containers. If you do not want to
        # override the value that was set when the service was created, you can set this to null when
        # performing this action. This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # Determines whether to force a new deployment of the service. By default, deployments aren't forced.
        # You can use this option to start a new deployment with no service definition changes. For example,
        # you can update a service's tasks to use a newer Docker image with the same image/tag combination (
        # my_image:latest ) or to roll Fargate tasks onto a newer platform version.
        @[JSON::Field(key: "forceNewDeployment")]
        getter force_new_deployment : Bool?

        # The period of time, in seconds, that the Amazon ECS service scheduler ignores unhealthy Elastic Load
        # Balancing, VPC Lattice, and container health checks after a task has first started. If you don't
        # specify a health check grace period value, the default value of 0 is used. If you don't use any of
        # the health checks, then healthCheckGracePeriodSeconds is unused. If your service's tasks take a
        # while to start and respond to health checks, you can specify a health check grace period of up to
        # 2,147,483,647 seconds (about 69 years). During that time, the Amazon ECS service scheduler ignores
        # health check status. This grace period can prevent the service scheduler from marking tasks as
        # unhealthy and stopping them before they have time to come up. If your service has more running tasks
        # than desired, unhealthy tasks in the grace period might be stopped to reach the desired count. This
        # parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "healthCheckGracePeriodSeconds")]
        getter health_check_grace_period_seconds : Int32?

        # You must have a service-linked role when you update this property A list of Elastic Load Balancing
        # load balancer objects. It contains the load balancer name, the container name, and the container
        # port to access from the load balancer. The container name is as it appears in a container
        # definition. When you add, update, or remove a load balancer configuration, Amazon ECS starts new
        # tasks with the updated Elastic Load Balancing configuration, and then stops the old tasks when the
        # new tasks are running. For services that use rolling updates, you can add, update, or remove Elastic
        # Load Balancing target groups. You can update from a single target group to multiple target groups
        # and from multiple target groups to a single target group. For services that use blue/green
        # deployments, you can update Elastic Load Balancing target groups by using CreateDeployment through
        # CodeDeploy. Note that multiple target groups are not supported for blue/green deployments. For more
        # information see Register multiple target groups with a service in the Amazon Elastic Container
        # Service Developer Guide . For services that use the external deployment controller, you can add,
        # update, or remove load balancers by using CreateTaskSet . Note that multiple target groups are not
        # supported for external deployments. For more information see Register multiple target groups with a
        # service in the Amazon Elastic Container Service Developer Guide . You can remove existing
        # loadBalancers by passing an empty list. This parameter triggers a new service deployment.
        @[JSON::Field(key: "loadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # An object representing the network configuration for the service. This parameter triggers a new
        # service deployment.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # An array of task placement constraint objects to update the service to use. If no value is
        # specified, the existing placement constraints for the service will remain unchanged. If this value
        # is specified, it will override any existing placement constraints defined for the service. To remove
        # all existing placement constraints, specify an empty array. You can specify a maximum of 10
        # constraints for each task. This limit includes constraints in the task definition and those
        # specified at runtime. This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "placementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The task placement strategy objects to update the service to use. If no value is specified, the
        # existing placement strategy for the service will remain unchanged. If this value is specified, it
        # will override the existing placement strategy defined for the service. To remove an existing
        # placement strategy, specify an empty object. You can specify a maximum of five strategy rules for
        # each service. This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "placementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # The platform version that your tasks in the service run on. A platform version is only specified for
        # tasks using the Fargate launch type. If a platform version is not specified, the LATEST platform
        # version is used. For more information, see Fargate Platform Versions in the Amazon Elastic Container
        # Service Developer Guide . This parameter triggers a new service deployment.
        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # Determines whether to propagate the tags from the task definition or the service to the task. If no
        # value is specified, the tags aren't propagated. Only tasks launched after the update will reflect
        # the update. To update the tags on all tasks, set forceNewDeployment to true , so that Amazon ECS
        # starts new tasks with the updated tags. This parameter doesn't trigger a new service deployment.
        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : String?

        # The configuration for this service to discover and connect to services, and be discovered by, and
        # connected from, other services within a namespace. Tasks that run in a namespace can use short names
        # to connect to services in the namespace. Tasks can connect to services across all of the clusters in
        # the namespace. Tasks connect through a managed proxy container that collects logs and metrics for
        # increased visibility. Only the tasks that Amazon ECS services create are supported with Service
        # Connect. For more information, see Service Connect in the Amazon Elastic Container Service Developer
        # Guide . This parameter triggers a new service deployment.
        @[JSON::Field(key: "serviceConnectConfiguration")]
        getter service_connect_configuration : Types::ServiceConnectConfiguration?

        # You must have a service-linked role when you update this property. For more information about the
        # role see the CreateService request parameter role . The details for the service discovery registries
        # to assign to this service. For more information, see Service Discovery . When you add, update, or
        # remove the service registries configuration, Amazon ECS starts new tasks with the updated service
        # registries configuration, and then stops the old tasks when the new tasks are running. You can
        # remove existing serviceRegistries by passing an empty list. This parameter triggers a new service
        # deployment.
        @[JSON::Field(key: "serviceRegistries")]
        getter service_registries : Array(Types::ServiceRegistry)?

        # The family and revision ( family:revision ) or full ARN of the task definition to run in your
        # service. If a revision is not specified, the latest ACTIVE revision is used. If you modify the task
        # definition with UpdateService , Amazon ECS spawns a task with the new version of the task definition
        # and then stops an old task after the new version is running. This parameter triggers a new service
        # deployment.
        @[JSON::Field(key: "taskDefinition")]
        getter task_definition : String?

        # The details of the volume that was configuredAtLaunch . You can configure the size, volumeType,
        # IOPS, throughput, snapshot and encryption in ServiceManagedEBSVolumeConfiguration . The name of the
        # volume must match the name from the task definition. If set to null, no new deployment is triggered.
        # Otherwise, if this configuration differs from the existing one, it triggers a new deployment. This
        # parameter triggers a new service deployment.
        @[JSON::Field(key: "volumeConfigurations")]
        getter volume_configurations : Array(Types::ServiceVolumeConfiguration)?

        # An object representing the VPC Lattice configuration for the service being updated. This parameter
        # triggers a new service deployment.
        @[JSON::Field(key: "vpcLatticeConfigurations")]
        getter vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)?

        def initialize(
          @service : String,
          @availability_zone_rebalancing : String? = nil,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @cluster : String? = nil,
          @deployment_configuration : Types::DeploymentConfiguration? = nil,
          @deployment_controller : Types::DeploymentController? = nil,
          @desired_count : Int32? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @force_new_deployment : Bool? = nil,
          @health_check_grace_period_seconds : Int32? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @service_connect_configuration : Types::ServiceConnectConfiguration? = nil,
          @service_registries : Array(Types::ServiceRegistry)? = nil,
          @task_definition : String? = nil,
          @volume_configurations : Array(Types::ServiceVolumeConfiguration)? = nil,
          @vpc_lattice_configurations : Array(Types::VpcLatticeConfiguration)? = nil
        )
        end
      end

      struct UpdateServiceResponse
        include JSON::Serializable

        # The full description of your service following the update call.
        @[JSON::Field(key: "service")]
        getter service : Types::Service?

        def initialize(
          @service : Types::Service? = nil
        )
        end
      end

      struct UpdateTaskProtectionRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the
        # task sets exist in.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # Specify true to mark a task for protection and false to unset protection, making it eligible for
        # termination.
        @[JSON::Field(key: "protectionEnabled")]
        getter protection_enabled : Bool

        # A list of up to 10 task IDs or full ARN entries.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(String)

        # If you set protectionEnabled to true , you can specify the duration for task protection in minutes.
        # You can specify a value from 1 minute to up to 2,880 minutes (48 hours). During this time, your task
        # will not be terminated by scale-in events from Service Auto Scaling or deployments. After this time
        # period lapses, protectionEnabled will be reset to false . If you don’t specify the time, then the
        # task is automatically protected for 120 minutes (2 hours).
        @[JSON::Field(key: "expiresInMinutes")]
        getter expires_in_minutes : Int32?

        def initialize(
          @cluster : String,
          @protection_enabled : Bool,
          @tasks : Array(String),
          @expires_in_minutes : Int32? = nil
        )
        end
      end

      struct UpdateTaskProtectionResponse
        include JSON::Serializable

        # Any failures associated with the call.
        @[JSON::Field(key: "failures")]
        getter failures : Array(Types::Failure)?

        # A list of tasks with the following information. taskArn : The task ARN. protectionEnabled : The
        # protection status of the task. If scale-in protection is turned on for a task, the value is true .
        # Otherwise, it is false . expirationDate : The epoch time when protection for the task will expire.
        @[JSON::Field(key: "protectedTasks")]
        getter protected_tasks : Array(Types::ProtectedTask)?

        def initialize(
          @failures : Array(Types::Failure)? = nil,
          @protected_tasks : Array(Types::ProtectedTask)? = nil
        )
        end
      end

      struct UpdateTaskSetRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the cluster that hosts the service that the
        # task set is found in.
        @[JSON::Field(key: "cluster")]
        getter cluster : String

        # A floating-point percentage of the desired number of tasks to place and keep running in the task
        # set.
        @[JSON::Field(key: "scale")]
        getter scale : Types::Scale

        # The short name or full Amazon Resource Name (ARN) of the service that the task set is found in.
        @[JSON::Field(key: "service")]
        getter service : String

        # The short name or full Amazon Resource Name (ARN) of the task set to update.
        @[JSON::Field(key: "taskSet")]
        getter task_set : String

        def initialize(
          @cluster : String,
          @scale : Types::Scale,
          @service : String,
          @task_set : String
        )
        end
      end

      struct UpdateTaskSetResponse
        include JSON::Serializable

        # Details about the task set.
        @[JSON::Field(key: "taskSet")]
        getter task_set : Types::TaskSet?

        def initialize(
          @task_set : Types::TaskSet? = nil
        )
        end
      end

      # An object that describes an Express service to be updated.
      struct UpdatedExpressGatewayService
        include JSON::Serializable

        # The cluster associated with the Express service that is being updated.
        @[JSON::Field(key: "cluster")]
        getter cluster : String?

        # The Unix timestamp for when the Express service that is being updated was created.
        @[JSON::Field(key: "createdAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The ARN of the Express service that is being updated.
        @[JSON::Field(key: "serviceArn")]
        getter service_arn : String?

        # The name of the Express service that is being updated.
        @[JSON::Field(key: "serviceName")]
        getter service_name : String?

        # The status of the Express service that is being updated.
        @[JSON::Field(key: "status")]
        getter status : Types::ExpressGatewayServiceStatus?

        # The configuration to which the current Express service is being updated to.
        @[JSON::Field(key: "targetConfiguration")]
        getter target_configuration : Types::ExpressGatewayServiceConfiguration?

        # The Unix timestamp for when the Express service that is being updated was most recently updated.
        @[JSON::Field(key: "updatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter updated_at : Time?

        def initialize(
          @cluster : String? = nil,
          @created_at : Time? = nil,
          @service_arn : String? = nil,
          @service_name : String? = nil,
          @status : Types::ExpressGatewayServiceStatus? = nil,
          @target_configuration : Types::ExpressGatewayServiceConfiguration? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The minimum and maximum number of vCPUs for instance type selection. This allows you to specify a
      # range of vCPU counts that meet your workload requirements.
      struct VCpuCountRangeRequest
        include JSON::Serializable

        # The minimum number of vCPUs. Instance types with fewer vCPUs than this value are excluded from
        # selection.
        @[JSON::Field(key: "min")]
        getter min : Int32

        # The maximum number of vCPUs. Instance types with more vCPUs than this value are excluded from
        # selection.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # The Docker and Amazon ECS container agent version information about a container instance.
      struct VersionInfo
        include JSON::Serializable

        # The Git commit hash for the Amazon ECS container agent build on the amazon-ecs-agent GitHub
        # repository.
        @[JSON::Field(key: "agentHash")]
        getter agent_hash : String?

        # The version number of the Amazon ECS container agent.
        @[JSON::Field(key: "agentVersion")]
        getter agent_version : String?

        # The Docker version that's running on the container instance.
        @[JSON::Field(key: "dockerVersion")]
        getter docker_version : String?

        def initialize(
          @agent_hash : String? = nil,
          @agent_version : String? = nil,
          @docker_version : String? = nil
        )
        end
      end

      # The data volume configuration for tasks launched using this task definition. Specifying a volume
      # configuration in a task definition is optional. The volume configuration may contain multiple
      # volumes but only one volume configured at launch is supported. Each volume defined in the volume
      # configuration may only specify a name and one of either configuredAtLaunch ,
      # dockerVolumeConfiguration , efsVolumeConfiguration , fsxWindowsFileServerVolumeConfiguration , or
      # host . If an empty volume configuration is specified, by default Amazon ECS uses a host volume. For
      # more information, see Using data volumes in tasks .
      struct Volume
        include JSON::Serializable

        # Indicates whether the volume should be configured at launch time. This is used to create Amazon EBS
        # volumes for standalone tasks or tasks created as part of a service. Each task definition revision
        # may only have one volume configured at launch in the volume configuration. To configure a volume at
        # launch time, use this task definition revision and specify a volumeConfigurations object when
        # calling the CreateService , UpdateService , RunTask or StartTask APIs.
        @[JSON::Field(key: "configuredAtLaunch")]
        getter configured_at_launch : Bool?

        # This parameter is specified when you use Docker volumes. Windows containers only support the use of
        # the local driver. To use bind mounts, specify the host parameter instead. Docker volumes aren't
        # supported by tasks run on Fargate.
        @[JSON::Field(key: "dockerVolumeConfiguration")]
        getter docker_volume_configuration : Types::DockerVolumeConfiguration?

        # This parameter is specified when you use an Amazon Elastic File System file system for task storage.
        @[JSON::Field(key: "efsVolumeConfiguration")]
        getter efs_volume_configuration : Types::EFSVolumeConfiguration?

        # This parameter is specified when you use Amazon FSx for Windows File Server file system for task
        # storage.
        @[JSON::Field(key: "fsxWindowsFileServerVolumeConfiguration")]
        getter fsx_windows_file_server_volume_configuration : Types::FSxWindowsFileServerVolumeConfiguration?

        # This parameter is specified when you use bind mount host volumes. The contents of the host parameter
        # determine whether your bind mount host volume persists on the host container instance and where it's
        # stored. If the host parameter is empty, then the Docker daemon assigns a host path for your data
        # volume. However, the data isn't guaranteed to persist after the containers that are associated with
        # it stop running. Windows containers can mount whole directories on the same drive as
        # $env:ProgramData . Windows containers can't mount directories on a different drive, and mount point
        # can't be across drives. For example, you can mount C:\my\path:C:\my\path and D:\:D:\ , but not
        # D:\my\path:C:\my\path or D:\:C:\my\path .
        @[JSON::Field(key: "host")]
        getter host : Types::HostVolumeProperties?

        # The name of the volume. Up to 255 letters (uppercase and lowercase), numbers, underscores, and
        # hyphens are allowed. When using a volume configured at launch, the name is required and must also be
        # specified as the volume name in the ServiceVolumeConfiguration or TaskVolumeConfiguration parameter
        # when creating your service or standalone task. For all other types of volumes, this name is
        # referenced in the sourceVolume parameter of the mountPoints object in the container definition. When
        # a volume is using the efsVolumeConfiguration , the name is required.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @configured_at_launch : Bool? = nil,
          @docker_volume_configuration : Types::DockerVolumeConfiguration? = nil,
          @efs_volume_configuration : Types::EFSVolumeConfiguration? = nil,
          @fsx_windows_file_server_volume_configuration : Types::FSxWindowsFileServerVolumeConfiguration? = nil,
          @host : Types::HostVolumeProperties? = nil,
          @name : String? = nil
        )
        end
      end

      # Details on a data volume from another container in the same task definition.
      struct VolumeFrom
        include JSON::Serializable

        # If this value is true , the container has read-only access to the volume. If this value is false ,
        # then the container can write to the volume. The default value is false .
        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool?

        # The name of another container within the same task definition to mount volumes from.
        @[JSON::Field(key: "sourceContainer")]
        getter source_container : String?

        def initialize(
          @read_only : Bool? = nil,
          @source_container : String? = nil
        )
        end
      end

      # The VPC Lattice configuration for your service that holds the information for the target group(s)
      # Amazon ECS tasks will be registered to.
      struct VpcLatticeConfiguration
        include JSON::Serializable

        # The name of the port mapping to register in the VPC Lattice target group. This is the name of the
        # portMapping you defined in your task definition.
        @[JSON::Field(key: "portName")]
        getter port_name : String

        # The ARN of the IAM role to associate with this VPC Lattice configuration. This is the Amazon
        # ECS&#x2028; infrastructure IAM role that is used to manage your VPC Lattice infrastructure.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The full Amazon Resource Name (ARN) of the target group or groups associated with the VPC Lattice
        # configuration that the Amazon ECS tasks will be registered to.
        @[JSON::Field(key: "targetGroupArn")]
        getter target_group_arn : String

        def initialize(
          @port_name : String,
          @role_arn : String,
          @target_group_arn : String
        )
        end
      end
    end
  end
end
