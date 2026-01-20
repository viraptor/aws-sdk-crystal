require "json"

module Aws
  module Batch
    module Types

      # An object that represents an Batch array job.

      struct ArrayProperties
        include JSON::Serializable

        # The size of the array job.

        @[JSON::Field(key: "size")]
        getter size : Int32?

        def initialize(
          @size : Int32? = nil
        )
        end
      end

      # An object that represents the array properties of a job.

      struct ArrayPropertiesDetail
        include JSON::Serializable

        # The job index within the array that's associated with this job. This parameter is returned for array
        # job children.

        @[JSON::Field(key: "index")]
        getter index : Int32?

        # The size of the array job. This parameter is returned for parent array jobs.

        @[JSON::Field(key: "size")]
        getter size : Int32?

        # A summary of the number of array job children in each available job status. This parameter is
        # returned for parent array jobs.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : Hash(String, Int32)?

        def initialize(
          @index : Int32? = nil,
          @size : Int32? = nil,
          @status_summary : Hash(String, Int32)? = nil
        )
        end
      end

      # An object that represents the array properties of a job.

      struct ArrayPropertiesSummary
        include JSON::Serializable

        # The job index within the array that's associated with this job. This parameter is returned for
        # children of array jobs.

        @[JSON::Field(key: "index")]
        getter index : Int32?

        # The size of the array job. This parameter is returned for parent array jobs.

        @[JSON::Field(key: "size")]
        getter size : Int32?

        def initialize(
          @index : Int32? = nil,
          @size : Int32? = nil
        )
        end
      end

      # An object that represents the details of a container that's part of a job attempt.

      struct AttemptContainerDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon ECS container instance that hosts the job attempt.

        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # The exit code for the job attempt. A non-zero exit code is considered failed.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The name of the CloudWatch Logs log stream that's associated with the container. The log group for
        # Batch jobs is /aws/batch/job . Each container attempt receives a log stream name when they reach the
        # RUNNING status.

        @[JSON::Field(key: "logStreamName")]
        getter log_stream_name : String?

        # The network interfaces that are associated with the job attempt.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # A short (255 max characters) human-readable string to provide additional details for a running or
        # stopped container.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The Amazon Resource Name (ARN) of the Amazon ECS task that's associated with the job attempt. Each
        # container attempt receives a task ARN when they reach the STARTING status.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        def initialize(
          @container_instance_arn : String? = nil,
          @exit_code : Int32? = nil,
          @log_stream_name : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @reason : String? = nil,
          @task_arn : String? = nil
        )
        end
      end

      # An object that represents a job attempt.

      struct AttemptDetail
        include JSON::Serializable

        # The details for the container in this job attempt.

        @[JSON::Field(key: "container")]
        getter container : Types::AttemptContainerDetail?

        # The Unix timestamp (in milliseconds) for when the attempt was started (when the attempt transitioned
        # from the STARTING state to the RUNNING state).

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # A short, human-readable string to provide additional details for the current status of the job
        # attempt.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp (in milliseconds) for when the attempt was stopped (when the attempt transitioned
        # from the RUNNING state to a terminal state, such as SUCCEEDED or FAILED ).

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        # The properties for a task definition that describes the container and volume definitions of an
        # Amazon ECS task.

        @[JSON::Field(key: "taskProperties")]
        getter task_properties : Array(Types::AttemptEcsTaskDetails)?

        def initialize(
          @container : Types::AttemptContainerDetail? = nil,
          @started_at : Int64? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil,
          @task_properties : Array(Types::AttemptEcsTaskDetails)? = nil
        )
        end
      end

      # An object that represents the details of a task.

      struct AttemptEcsTaskDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container instance that hosts the task.

        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # A list of containers that are included in the taskProperties list.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::AttemptTaskContainerDetails)?

        # The ARN of the Amazon ECS task.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        def initialize(
          @container_instance_arn : String? = nil,
          @containers : Array(Types::AttemptTaskContainerDetails)? = nil,
          @task_arn : String? = nil
        )
        end
      end

      # An object that represents the details of a container that's part of a job attempt.

      struct AttemptTaskContainerDetails
        include JSON::Serializable

        # The exit code for the container’s attempt. A non-zero exit code is considered failed.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The name of the Amazon CloudWatch Logs log stream that's associated with the container. The log
        # group for Batch jobs is /aws/batch/job . Each container attempt receives a log stream name when they
        # reach the RUNNING status.

        @[JSON::Field(key: "logStreamName")]
        getter log_stream_name : String?

        # The name of a container.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The network interfaces that are associated with the job attempt.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # A short (255 max characters) string that's easy to understand and provides additional details for a
        # running or stopped container.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @exit_code : Int32? = nil,
          @log_stream_name : String? = nil,
          @name : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains the parameters for CancelJob .

      struct CancelJobRequest
        include JSON::Serializable

        # The Batch job ID of the job to cancel.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A message to attach to the job that explains the reason for canceling it. This message is returned
        # by future DescribeJobs operations on the job. It is also recorded in the Batch activity logs. This
        # parameter has as limit of 1024 characters.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @job_id : String,
          @reason : String
        )
        end
      end


      struct CancelJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Defines the capacity limit for a service environment. This structure specifies the maximum amount of
      # resources that can be used by service jobs in the environment.

      struct CapacityLimit
        include JSON::Serializable

        # The unit of measure for the capacity limit. This defines how the maxCapacity value should be
        # interpreted. For SAGEMAKER_TRAINING jobs, use NUM_INSTANCES .

        @[JSON::Field(key: "capacityUnit")]
        getter capacity_unit : String?

        # The maximum capacity available for the service environment. This value represents the maximum amount
        # of resources that can be allocated to service jobs. For example, maxCapacity=50 ,
        # capacityUnit=NUM_INSTANCES . This indicates that the maximum number of instances that can be run on
        # this service environment is 50. You could then run 5 SageMaker Training jobs that each use 10
        # instances. However, if you submit another job that requires 10 instances, it will wait in the queue.

        @[JSON::Field(key: "maxCapacity")]
        getter max_capacity : Int32?

        def initialize(
          @capacity_unit : String? = nil,
          @max_capacity : Int32? = nil
        )
        end
      end

      # These errors are usually caused by a client action. One example cause is using an action or resource
      # on behalf of a user that doesn't have permissions to use the action or resource. Another cause is
      # specifying an identifier that's not valid.

      struct ClientException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents an Batch compute environment.

      struct ComputeEnvironmentDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the compute environment.

        @[JSON::Field(key: "computeEnvironmentArn")]
        getter compute_environment_arn : String

        # The name of the compute environment. It can be up to 128 characters long. It can contain uppercase
        # and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "computeEnvironmentName")]
        getter compute_environment_name : String

        # The compute resources defined for the compute environment. For more information, see Compute
        # environments in the Batch User Guide .

        @[JSON::Field(key: "computeResources")]
        getter compute_resources : Types::ComputeResource?

        # The orchestration type of the compute environment. The valid values are ECS (default) or EKS .

        @[JSON::Field(key: "containerOrchestrationType")]
        getter container_orchestration_type : String?

        # Reserved.

        @[JSON::Field(key: "context")]
        getter context : String?

        # The Amazon Resource Name (ARN) of the underlying Amazon ECS cluster that the compute environment
        # uses.

        @[JSON::Field(key: "ecsClusterArn")]
        getter ecs_cluster_arn : String?

        # The configuration for the Amazon EKS cluster that supports the Batch compute environment. Only
        # specify this parameter if the containerOrchestrationType is EKS .

        @[JSON::Field(key: "eksConfiguration")]
        getter eks_configuration : Types::EksConfiguration?

        # The service role that's associated with the compute environment that allows Batch to make calls to
        # Amazon Web Services API operations on your behalf. For more information, see Batch service IAM role
        # in the Batch User Guide .

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The state of the compute environment. The valid values are ENABLED or DISABLED . If the state is
        # ENABLED , then the Batch scheduler can attempt to place jobs from an associated job queue on the
        # compute resources within the environment. If the compute environment is managed, then it can scale
        # its instances out or in automatically based on the job queue demand. If the state is DISABLED , then
        # the Batch scheduler doesn't attempt to place jobs within the environment. Jobs in a STARTING or
        # RUNNING state continue to progress normally. Managed compute environments in the DISABLED state
        # don't scale out. Compute environments in a DISABLED state may continue to incur billing charges. To
        # prevent additional charges, turn off and then delete the compute environment. For more information,
        # see State in the Batch User Guide . When an instance is idle, the instance scales down to the
        # minvCpus value. However, the instance size doesn't change. For example, consider a c5.8xlarge
        # instance with a minvCpus value of 4 and a desiredvCpus value of 36 . This instance doesn't scale
        # down to a c5.large instance.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The current status of the compute environment (for example, CREATING or VALID ).

        @[JSON::Field(key: "status")]
        getter status : String?

        # A short, human-readable string to provide additional details for the current status of the compute
        # environment.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The tags applied to the compute environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of the compute environment: MANAGED or UNMANAGED . For more information, see Compute
        # environments in the Batch User Guide .

        @[JSON::Field(key: "type")]
        getter type : String?

        # The maximum number of VCPUs expected to be used for an unmanaged compute environment.

        @[JSON::Field(key: "unmanagedvCpus")]
        getter unmanagedv_cpus : Int32?

        # Specifies the infrastructure update policy for the compute environment. For more information about
        # infrastructure updates, see Updating compute environments in the Batch User Guide .

        @[JSON::Field(key: "updatePolicy")]
        getter update_policy : Types::UpdatePolicy?

        # Unique identifier for the compute environment.

        @[JSON::Field(key: "uuid")]
        getter uuid : String?

        def initialize(
          @compute_environment_arn : String,
          @compute_environment_name : String,
          @compute_resources : Types::ComputeResource? = nil,
          @container_orchestration_type : String? = nil,
          @context : String? = nil,
          @ecs_cluster_arn : String? = nil,
          @eks_configuration : Types::EksConfiguration? = nil,
          @service_role : String? = nil,
          @state : String? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @unmanagedv_cpus : Int32? = nil,
          @update_policy : Types::UpdatePolicy? = nil,
          @uuid : String? = nil
        )
        end
      end

      # The order that compute environments are tried in for job placement within a queue. Compute
      # environments are tried in ascending order. For example, if two compute environments are associated
      # with a job queue, the compute environment with a lower order integer value is tried for job
      # placement first. Compute environments must be in the VALID state before you can associate them with
      # a job queue. All of the compute environments must be either EC2 ( EC2 or SPOT ) or Fargate ( FARGATE
      # or FARGATE_SPOT ); Amazon EC2 and Fargate compute environments can't be mixed. All compute
      # environments that are associated with a job queue must share the same architecture. Batch doesn't
      # support mixing compute environment architecture types in a single job queue.

      struct ComputeEnvironmentOrder
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the compute environment.

        @[JSON::Field(key: "computeEnvironment")]
        getter compute_environment : String

        # The order of the compute environment. Compute environments are tried in ascending order. For
        # example, if two compute environments are associated with a job queue, the compute environment with a
        # lower order integer value is tried for job placement first.

        @[JSON::Field(key: "order")]
        getter order : Int32

        def initialize(
          @compute_environment : String,
          @order : Int32
        )
        end
      end

      # An object that represents an Batch compute resource. For more information, see Compute environments
      # in the Batch User Guide .

      struct ComputeResource
        include JSON::Serializable

        # The maximum number of vCPUs that a compute environment can support. With BEST_FIT_PROGRESSIVE ,
        # SPOT_CAPACITY_OPTIMIZED and SPOT_PRICE_CAPACITY_OPTIMIZED (recommended) strategies using On-Demand
        # or Spot Instances, and the BEST_FIT strategy using Spot Instances, Batch might need to exceed
        # maxvCpus to meet your capacity requirements. In this event, Batch never exceeds maxvCpus by more
        # than a single instance.

        @[JSON::Field(key: "maxvCpus")]
        getter maxv_cpus : Int32

        # The VPC subnets where the compute resources are launched. These subnets must be within the same VPC.
        # Fargate compute resources can contain up to 16 subnets. For more information, see VPCs and subnets
        # in the Amazon VPC User Guide . Batch on Amazon EC2 and Batch on Amazon EKS support Local Zones. For
        # more information, see Local Zones in the Amazon EC2 User Guide for Linux Instances , Amazon EKS and
        # Amazon Web Services Local Zones in the Amazon EKS User Guide and Amazon ECS clusters in Local Zones,
        # Wavelength Zones, and Amazon Web Services Outposts in the Amazon ECS Developer Guide . Batch on
        # Fargate doesn't currently support Local Zones.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)

        # The type of compute environment: EC2 , SPOT , FARGATE , or FARGATE_SPOT . For more information, see
        # Compute environments in the Batch User Guide . If you choose SPOT , you must also specify an Amazon
        # EC2 Spot Fleet role with the spotIamFleetRole parameter. For more information, see Amazon EC2 spot
        # fleet role in the Batch User Guide . Multi-node parallel jobs aren't supported on Spot Instances.

        @[JSON::Field(key: "type")]
        getter type : String

        # The allocation strategy to use for the compute resource if not enough instances of the best fitting
        # instance type can be allocated. This might be because of availability of the instance type in the
        # Region or Amazon EC2 service limits . For more information, see Allocation strategies in the Batch
        # User Guide . This parameter isn't applicable to jobs that are running on Fargate resources. Don't
        # specify it. BEST_FIT (default) Batch selects an instance type that best fits the needs of the jobs
        # with a preference for the lowest-cost instance type. If additional instances of the selected
        # instance type aren't available, Batch waits for the additional instances to be available. If there
        # aren't enough instances available or the user is reaching Amazon EC2 service limits , additional
        # jobs aren't run until the currently running jobs are completed. This allocation strategy keeps costs
        # lower but can limit scaling. If you're using Spot Fleets with BEST_FIT , the Spot Fleet IAM Role
        # must be specified. Compute resources that use a BEST_FIT allocation strategy don't support
        # infrastructure updates and can't update some parameters. For more information, see Updating compute
        # environments in the Batch User Guide . BEST_FIT_PROGRESSIVE Batch selects additional instance types
        # that are large enough to meet the requirements of the jobs in the queue. Its preference is for
        # instance types with lower cost vCPUs. If additional instances of the previously selected instance
        # types aren't available, Batch selects new instance types. SPOT_CAPACITY_OPTIMIZED Batch selects one
        # or more instance types that are large enough to meet the requirements of the jobs in the queue. Its
        # preference is for instance types that are less likely to be interrupted. This allocation strategy is
        # only available for Spot Instance compute resources. SPOT_PRICE_CAPACITY_OPTIMIZED The price and
        # capacity optimized allocation strategy looks at both price and capacity to select the Spot Instance
        # pools that are the least likely to be interrupted and have the lowest possible price. This
        # allocation strategy is only available for Spot Instance compute resources. With BEST_FIT_PROGRESSIVE
        # , SPOT_CAPACITY_OPTIMIZED and SPOT_PRICE_CAPACITY_OPTIMIZED (recommended) strategies using On-Demand
        # or Spot Instances, and the BEST_FIT strategy using Spot Instances, Batch might need to exceed
        # maxvCpus to meet your capacity requirements. In this event, Batch never exceeds maxvCpus by more
        # than a single instance.

        @[JSON::Field(key: "allocationStrategy")]
        getter allocation_strategy : String?

        # The maximum percentage that a Spot Instance price can be when compared with the On-Demand price for
        # that instance type before instances are launched. For example, if your maximum percentage is 20%,
        # then the Spot price must be less than 20% of the current On-Demand price for that Amazon EC2
        # instance. You always pay the lowest (market) price and never more than your maximum percentage. If
        # you leave this field empty, the default value is 100% of the On-Demand price. For most use cases, we
        # recommend leaving this field empty. This parameter isn't applicable to jobs that are running on
        # Fargate resources. Don't specify it.

        @[JSON::Field(key: "bidPercentage")]
        getter bid_percentage : Int32?

        # The desired number of vCPUS in the compute environment. Batch modifies this value between the
        # minimum and maximum values based on job queue demand. This parameter isn't applicable to jobs that
        # are running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "desiredvCpus")]
        getter desiredv_cpus : Int32?

        # Provides information that's used to select Amazon Machine Images (AMIs) for Amazon EC2 instances in
        # the compute environment. If Ec2Configuration isn't specified, the default is ECS_AL2 . One or two
        # values can be provided. This parameter isn't applicable to jobs that are running on Fargate
        # resources. Don't specify it.

        @[JSON::Field(key: "ec2Configuration")]
        getter ec2_configuration : Array(Types::Ec2Configuration)?

        # The Amazon EC2 key pair that's used for instances launched in the compute environment. You can use
        # this key pair to log in to your instances with SSH. This parameter isn't applicable to jobs that are
        # running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "ec2KeyPair")]
        getter ec2_key_pair : String?

        # The Amazon Machine Image (AMI) ID used for instances launched in the compute environment. This
        # parameter is overridden by the imageIdOverride member of the Ec2Configuration structure. This
        # parameter isn't applicable to jobs that are running on Fargate resources. Don't specify it. The AMI
        # that you choose for a compute environment must match the architecture of the instance types that you
        # intend to use for that compute environment. For example, if your compute environment uses A1
        # instance types, the compute resource AMI that you choose must support ARM instances. Amazon ECS
        # vends both x86 and ARM versions of the Amazon ECS-optimized Amazon Linux 2 AMI. For more
        # information, see Amazon ECS-optimized Amazon Linux 2 AMI in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The Amazon ECS instance profile applied to Amazon EC2 instances in a compute environment. This
        # parameter is required for Amazon EC2 instances types. You can specify the short name or full Amazon
        # Resource Name (ARN) of an instance profile. For example, ecsInstanceRole or arn:aws:iam::
        # &lt;aws_account_id&gt; :instance-profile/ ecsInstanceRole . For more information, see Amazon ECS
        # instance role in the Batch User Guide . This parameter isn't applicable to jobs that are running on
        # Fargate resources. Don't specify it.

        @[JSON::Field(key: "instanceRole")]
        getter instance_role : String?

        # The instances types that can be launched. You can specify instance families to launch any instance
        # type within those families (for example, c5 or p3 ), or you can specify specific sizes within a
        # family (such as c5.8xlarge ). Batch can select the instance type for you if you choose one of the
        # following: optimal to select instance types (from the c4 , m4 , r4 , c5 , m5 , and r5 instance
        # families) that match the demand of your job queues. default_x86_64 to choose x86 based instance
        # types (from the m6i , c6i , r6i , and c7i instance families) that matches the resource demands of
        # the job queue. default_arm64 to choose ARM based instance types (from the m6g , c6g , r6g , and c7g
        # instance families) that matches the resource demands of the job queue. Starting on 11/01/2025 the
        # behavior of optimal is going to be changed to match default_x86_64 . During the change your instance
        # families could be updated to a newer generation. You do not need to perform any actions for the
        # upgrade to happen. For more information about change, see Optimal instance type configuration to
        # receive automatic instance family updates . Instance family availability varies by Amazon Web
        # Services Region. For example, some Amazon Web Services Regions may not have any fourth generation
        # instance families but have fifth and sixth generation instance families. When using default_x86_64
        # or default_arm64 instance bundles, Batch selects instance families based on a balance of
        # cost-effectiveness and performance. While newer generation instances often provide better
        # price-performance, Batch may choose an earlier generation instance family if it provides the optimal
        # combination of availability, cost, and performance for your workload. For example, in an Amazon Web
        # Services Region where both c6i and c7i instances are available, Batch might select c6i instances if
        # they offer better cost-effectiveness for your specific job requirements. For more information on
        # Batch instance types and Amazon Web Services Region availability, see Instance type compute table in
        # the Batch User Guide . Batch periodically updates your instances in default bundles to newer, more
        # cost-effective options. Updates happen automatically without requiring any action from you. Your
        # workloads continue running during updates with no interruption This parameter isn't applicable to
        # jobs that are running on Fargate resources. Don't specify it. When you create a compute environment,
        # the instance types that you select for the compute environment must share the same architecture. For
        # example, you can't mix x86 and ARM instances in the same compute environment.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The launch template to use for your compute resources. Any other compute resource parameters that
        # you specify in a CreateComputeEnvironment API operation override the same parameters in the launch
        # template. You must specify either the launch template ID or launch template name in the request, but
        # not both. For more information, see Launch template support in the Batch User Guide . This parameter
        # isn't applicable to jobs that are running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "launchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The minimum number of vCPUs that a compute environment should maintain (even if the compute
        # environment is DISABLED ). This parameter isn't applicable to jobs that are running on Fargate
        # resources. Don't specify it.

        @[JSON::Field(key: "minvCpus")]
        getter minv_cpus : Int32?

        # The Amazon EC2 placement group to associate with your compute resources. If you intend to submit
        # multi-node parallel jobs to your compute environment, you should consider creating a cluster
        # placement group and associate it with your compute resources. This keeps your multi-node parallel
        # job on a logical grouping of instances within a single Availability Zone with high network flow
        # potential. For more information, see Placement groups in the Amazon EC2 User Guide for Linux
        # Instances . This parameter isn't applicable to jobs that are running on Fargate resources. Don't
        # specify it.

        @[JSON::Field(key: "placementGroup")]
        getter placement_group : String?

        # The Amazon EC2 security groups that are associated with instances launched in the compute
        # environment. One or more security groups must be specified, either in securityGroupIds or using a
        # launch template referenced in launchTemplate . This parameter is required for jobs that are running
        # on Fargate resources and must contain at least one security group. Fargate doesn't support launch
        # templates. If security groups are specified using both securityGroupIds and launchTemplate , the
        # values in securityGroupIds are used.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The Amazon Resource Name (ARN) of the Amazon EC2 Spot Fleet IAM role applied to a SPOT compute
        # environment. This role is required if the allocation strategy set to BEST_FIT or if the allocation
        # strategy isn't specified. For more information, see Amazon EC2 spot fleet role in the Batch User
        # Guide . This parameter isn't applicable to jobs that are running on Fargate resources. Don't specify
        # it. To tag your Spot Instances on creation, the Spot Fleet IAM role specified here must use the
        # newer AmazonEC2SpotFleetTaggingRole managed policy. The previously recommended
        # AmazonEC2SpotFleetRole managed policy doesn't have the required permissions to tag Spot Instances.
        # For more information, see Spot instances not tagged on creation in the Batch User Guide .

        @[JSON::Field(key: "spotIamFleetRole")]
        getter spot_iam_fleet_role : String?

        # Key-value pair tags to be applied to Amazon EC2 resources that are launched in the compute
        # environment. For Batch, these take the form of "String1": "String2" , where String1 is the tag key
        # and String2 is the tag value (for example, { "Name": "Batch Instance - C4OnDemand" } ). This is
        # helpful for recognizing your Batch instances in the Amazon EC2 console. Updating these tags requires
        # an infrastructure update to the compute environment. For more information, see Updating compute
        # environments in the Batch User Guide . These tags aren't seen when using the Batch
        # ListTagsForResource API operation. This parameter isn't applicable to jobs that are running on
        # Fargate resources. Don't specify it.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @maxv_cpus : Int32,
          @subnets : Array(String),
          @type : String,
          @allocation_strategy : String? = nil,
          @bid_percentage : Int32? = nil,
          @desiredv_cpus : Int32? = nil,
          @ec2_configuration : Array(Types::Ec2Configuration)? = nil,
          @ec2_key_pair : String? = nil,
          @image_id : String? = nil,
          @instance_role : String? = nil,
          @instance_types : Array(String)? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @minv_cpus : Int32? = nil,
          @placement_group : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @spot_iam_fleet_role : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object that represents the attributes of a compute environment that can be updated. For more
      # information, see Updating compute environments in the Batch User Guide .

      struct ComputeResourceUpdate
        include JSON::Serializable

        # The allocation strategy to use for the compute resource if there's not enough instances of the best
        # fitting instance type that can be allocated. This might be because of availability of the instance
        # type in the Region or Amazon EC2 service limits . For more information, see Allocation strategies in
        # the Batch User Guide . When updating a compute environment, changing the allocation strategy
        # requires an infrastructure update of the compute environment. For more information, see Updating
        # compute environments in the Batch User Guide . BEST_FIT isn't supported when updating a compute
        # environment. This parameter isn't applicable to jobs that are running on Fargate resources. Don't
        # specify it. BEST_FIT_PROGRESSIVE Batch selects additional instance types that are large enough to
        # meet the requirements of the jobs in the queue. Its preference is for instance types with lower cost
        # vCPUs. If additional instances of the previously selected instance types aren't available, Batch
        # selects new instance types. SPOT_CAPACITY_OPTIMIZED Batch selects one or more instance types that
        # are large enough to meet the requirements of the jobs in the queue. Its preference is for instance
        # types that are less likely to be interrupted. This allocation strategy is only available for Spot
        # Instance compute resources. SPOT_PRICE_CAPACITY_OPTIMIZED The price and capacity optimized
        # allocation strategy looks at both price and capacity to select the Spot Instance pools that are the
        # least likely to be interrupted and have the lowest possible price. This allocation strategy is only
        # available for Spot Instance compute resources. With BEST_FIT_PROGRESSIVE , SPOT_CAPACITY_OPTIMIZED
        # and SPOT_PRICE_CAPACITY_OPTIMIZED (recommended) strategies using On-Demand or Spot Instances, and
        # the BEST_FIT strategy using Spot Instances, Batch might need to exceed maxvCpus to meet your
        # capacity requirements. In this event, Batch never exceeds maxvCpus by more than a single instance.

        @[JSON::Field(key: "allocationStrategy")]
        getter allocation_strategy : String?

        # The maximum percentage that a Spot Instance price can be when compared with the On-Demand price for
        # that instance type before instances are launched. For example, if your maximum percentage is 20%,
        # the Spot price must be less than 20% of the current On-Demand price for that Amazon EC2 instance.
        # You always pay the lowest (market) price and never more than your maximum percentage. For most use
        # cases, we recommend leaving this field empty. When updating a compute environment, changing the bid
        # percentage requires an infrastructure update of the compute environment. For more information, see
        # Updating compute environments in the Batch User Guide . This parameter isn't applicable to jobs that
        # are running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "bidPercentage")]
        getter bid_percentage : Int32?

        # The desired number of vCPUS in the compute environment. Batch modifies this value between the
        # minimum and maximum values based on job queue demand. This parameter isn't applicable to jobs that
        # are running on Fargate resources. Don't specify it. Batch doesn't support changing the desired
        # number of vCPUs of an existing compute environment. Don't specify this parameter for compute
        # environments using Amazon EKS clusters. When you update the desiredvCpus setting, the value must be
        # between the minvCpus and maxvCpus values. Additionally, the updated desiredvCpus value must be
        # greater than or equal to the current desiredvCpus value. For more information, see Troubleshooting
        # Batch in the Batch User Guide .

        @[JSON::Field(key: "desiredvCpus")]
        getter desiredv_cpus : Int32?

        # Provides information used to select Amazon Machine Images (AMIs) for Amazon EC2 instances in the
        # compute environment. If Ec2Configuration isn't specified, the default is ECS_AL2 . When updating a
        # compute environment, changing this setting requires an infrastructure update of the compute
        # environment. For more information, see Updating compute environments in the Batch User Guide . To
        # remove the Amazon EC2 configuration and any custom AMI ID specified in imageIdOverride , set this
        # value to an empty string. One or two values can be provided. This parameter isn't applicable to jobs
        # that are running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "ec2Configuration")]
        getter ec2_configuration : Array(Types::Ec2Configuration)?

        # The Amazon EC2 key pair that's used for instances launched in the compute environment. You can use
        # this key pair to log in to your instances with SSH. To remove the Amazon EC2 key pair, set this
        # value to an empty string. When updating a compute environment, changing the Amazon EC2 key pair
        # requires an infrastructure update of the compute environment. For more information, see Updating
        # compute environments in the Batch User Guide . This parameter isn't applicable to jobs that are
        # running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "ec2KeyPair")]
        getter ec2_key_pair : String?

        # The Amazon Machine Image (AMI) ID used for instances launched in the compute environment. This
        # parameter is overridden by the imageIdOverride member of the Ec2Configuration structure. To remove
        # the custom AMI ID and use the default AMI ID, set this value to an empty string. When updating a
        # compute environment, changing the AMI ID requires an infrastructure update of the compute
        # environment. For more information, see Updating compute environments in the Batch User Guide . This
        # parameter isn't applicable to jobs that are running on Fargate resources. Don't specify it. The AMI
        # that you choose for a compute environment must match the architecture of the instance types that you
        # intend to use for that compute environment. For example, if your compute environment uses A1
        # instance types, the compute resource AMI that you choose must support ARM instances. Amazon ECS
        # vends both x86 and ARM versions of the Amazon ECS-optimized Amazon Linux 2 AMI. For more
        # information, see Amazon ECS-optimized Amazon Linux 2 AMI in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "imageId")]
        getter image_id : String?

        # The Amazon ECS instance profile applied to Amazon EC2 instances in a compute environment. Required
        # for Amazon EC2 instances. You can specify the short name or full Amazon Resource Name (ARN) of an
        # instance profile. For example, ecsInstanceRole or arn:aws:iam:: &lt;aws_account_id&gt;
        # :instance-profile/ ecsInstanceRole . For more information, see Amazon ECS instance role in the Batch
        # User Guide . When updating a compute environment, changing this setting requires an infrastructure
        # update of the compute environment. For more information, see Updating compute environments in the
        # Batch User Guide . This parameter isn't applicable to jobs that are running on Fargate resources.
        # Don't specify it.

        @[JSON::Field(key: "instanceRole")]
        getter instance_role : String?

        # The instances types that can be launched. You can specify instance families to launch any instance
        # type within those families (for example, c5 or p3 ), or you can specify specific sizes within a
        # family (such as c5.8xlarge ). Batch can select the instance type for you if you choose one of the
        # following: optimal to select instance types (from the c4 , m4 , r4 , c5 , m5 , and r5 instance
        # families) that match the demand of your job queues. default_x86_64 to choose x86 based instance
        # types (from the m6i , c6i , r6i , and c7i instance families) that matches the resource demands of
        # the job queue. default_arm64 to choose x86 based instance types (from the m6g , c6g , r6g , and c7g
        # instance families) that matches the resource demands of the job queue. Starting on 11/01/2025 the
        # behavior of optimal is going to be changed to match default_x86_64 . During the change your instance
        # families could be updated to a newer generation. You do not need to perform any actions for the
        # upgrade to happen. For more information about change, see Optimal instance type configuration to
        # receive automatic instance family updates . Instance family availability varies by Amazon Web
        # Services Region. For example, some Amazon Web Services Regions may not have any fourth generation
        # instance families but have fifth and sixth generation instance families. When using default_x86_64
        # or default_arm64 instance bundles, Batch selects instance families based on a balance of
        # cost-effectiveness and performance. While newer generation instances often provide better
        # price-performance, Batch may choose an earlier generation instance family if it provides the optimal
        # combination of availability, cost, and performance for your workload. For example, in an Amazon Web
        # Services Region where both c6i and c7i instances are available, Batch might select c6i instances if
        # they offer better cost-effectiveness for your specific job requirements. For more information on
        # Batch instance types and Amazon Web Services Region availability, see Instance type compute table in
        # the Batch User Guide . Batch periodically updates your instances in default bundles to newer, more
        # cost-effective options. Updates happen automatically without requiring any action from you. Your
        # workloads continue running during updates with no interruption This parameter isn't applicable to
        # jobs that are running on Fargate resources. Don't specify it. When you create a compute environment,
        # the instance types that you select for the compute environment must share the same architecture. For
        # example, you can't mix x86 and ARM instances in the same compute environment.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        # The updated launch template to use for your compute resources. You must specify either the launch
        # template ID or launch template name in the request, but not both. For more information, see Launch
        # template support in the Batch User Guide . To remove the custom launch template and use the default
        # launch template, set launchTemplateId or launchTemplateName member of the launch template
        # specification to an empty string. Removing the launch template from a compute environment will not
        # remove the AMI specified in the launch template. In order to update the AMI specified in a launch
        # template, the updateToLatestImageVersion parameter must be set to true . When updating a compute
        # environment, changing the launch template requires an infrastructure update of the compute
        # environment. For more information, see Updating compute environments in the Batch User Guide . This
        # parameter isn't applicable to jobs that are running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "launchTemplate")]
        getter launch_template : Types::LaunchTemplateSpecification?

        # The maximum number of Amazon EC2 vCPUs that an environment can reach. With BEST_FIT_PROGRESSIVE ,
        # SPOT_CAPACITY_OPTIMIZED and SPOT_PRICE_CAPACITY_OPTIMIZED (recommended) strategies using On-Demand
        # or Spot Instances, and the BEST_FIT strategy using Spot Instances, Batch might need to exceed
        # maxvCpus to meet your capacity requirements. In this event, Batch never exceeds maxvCpus by more
        # than a single instance.

        @[JSON::Field(key: "maxvCpus")]
        getter maxv_cpus : Int32?

        # The minimum number of vCPUs that an environment should maintain (even if the compute environment is
        # DISABLED ). This parameter isn't applicable to jobs that are running on Fargate resources. Don't
        # specify it.

        @[JSON::Field(key: "minvCpus")]
        getter minv_cpus : Int32?

        # The Amazon EC2 placement group to associate with your compute resources. If you intend to submit
        # multi-node parallel jobs to your compute environment, you should consider creating a cluster
        # placement group and associate it with your compute resources. This keeps your multi-node parallel
        # job on a logical grouping of instances within a single Availability Zone with high network flow
        # potential. For more information, see Placement groups in the Amazon EC2 User Guide for Linux
        # Instances . When updating a compute environment, changing the placement group requires an
        # infrastructure update of the compute environment. For more information, see Updating compute
        # environments in the Batch User Guide . This parameter isn't applicable to jobs that are running on
        # Fargate resources. Don't specify it.

        @[JSON::Field(key: "placementGroup")]
        getter placement_group : String?

        # The Amazon EC2 security groups that are associated with instances launched in the compute
        # environment. This parameter is required for Fargate compute resources, where it can contain up to 5
        # security groups. For Fargate compute resources, providing an empty list is handled as if this
        # parameter wasn't specified and no change is made. For Amazon EC2 compute resources, providing an
        # empty list removes the security groups from the compute resource. When updating a compute
        # environment, changing the Amazon EC2 security groups requires an infrastructure update of the
        # compute environment. For more information, see Updating compute environments in the Batch User Guide
        # .

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The VPC subnets where the compute resources are launched. Fargate compute resources can contain up
        # to 16 subnets. For Fargate compute resources, providing an empty list will be handled as if this
        # parameter wasn't specified and no change is made. For Amazon EC2 compute resources, providing an
        # empty list removes the VPC subnets from the compute resource. For more information, see VPCs and
        # subnets in the Amazon VPC User Guide . When updating a compute environment, changing the VPC subnets
        # requires an infrastructure update of the compute environment. For more information, see Updating
        # compute environments in the Batch User Guide . Batch on Amazon EC2 and Batch on Amazon EKS support
        # Local Zones. For more information, see Local Zones in the Amazon EC2 User Guide for Linux Instances
        # , Amazon EKS and Amazon Web Services Local Zones in the Amazon EKS User Guide and Amazon ECS
        # clusters in Local Zones, Wavelength Zones, and Amazon Web Services Outposts in the Amazon ECS
        # Developer Guide . Batch on Fargate doesn't currently support Local Zones.

        @[JSON::Field(key: "subnets")]
        getter subnets : Array(String)?

        # Key-value pair tags to be applied to Amazon EC2 resources that are launched in the compute
        # environment. For Batch, these take the form of "String1": "String2" , where String1 is the tag key
        # and String2 is the tag value (for example, { "Name": "Batch Instance - C4OnDemand" } ). This is
        # helpful for recognizing your Batch instances in the Amazon EC2 console. These tags aren't seen when
        # using the Batch ListTagsForResource API operation. When updating a compute environment, changing
        # this setting requires an infrastructure update of the compute environment. For more information, see
        # Updating compute environments in the Batch User Guide . This parameter isn't applicable to jobs that
        # are running on Fargate resources. Don't specify it.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The type of compute environment: EC2 , SPOT , FARGATE , or FARGATE_SPOT . For more information, see
        # Compute environments in the Batch User Guide . If you choose SPOT , you must also specify an Amazon
        # EC2 Spot Fleet role with the spotIamFleetRole parameter. For more information, see Amazon EC2 spot
        # fleet role in the Batch User Guide . When updating a compute environment, changing the type of a
        # compute environment requires an infrastructure update of the compute environment. For more
        # information, see Updating compute environments in the Batch User Guide .

        @[JSON::Field(key: "type")]
        getter type : String?

        # Specifies whether the AMI ID is updated to the latest one that's supported by Batch when the compute
        # environment has an infrastructure update. The default value is false . An AMI ID can either be
        # specified in the imageId or imageIdOverride parameters or be determined by the launch template
        # that's specified in the launchTemplate parameter. If an AMI ID is specified any of these ways, this
        # parameter is ignored. For more information about to update AMI IDs during an infrastructure update,
        # see Updating the AMI ID in the Batch User Guide . When updating a compute environment, changing this
        # setting requires an infrastructure update of the compute environment. For more information, see
        # Updating compute environments in the Batch User Guide .

        @[JSON::Field(key: "updateToLatestImageVersion")]
        getter update_to_latest_image_version : Bool?

        def initialize(
          @allocation_strategy : String? = nil,
          @bid_percentage : Int32? = nil,
          @desiredv_cpus : Int32? = nil,
          @ec2_configuration : Array(Types::Ec2Configuration)? = nil,
          @ec2_key_pair : String? = nil,
          @image_id : String? = nil,
          @instance_role : String? = nil,
          @instance_types : Array(String)? = nil,
          @launch_template : Types::LaunchTemplateSpecification? = nil,
          @maxv_cpus : Int32? = nil,
          @minv_cpus : Int32? = nil,
          @placement_group : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnets : Array(String)? = nil,
          @tags : Hash(String, String)? = nil,
          @type : String? = nil,
          @update_to_latest_image_version : Bool? = nil
        )
        end
      end

      # Contains a list of consumable resources required by a job.

      struct ConsumableResourceProperties
        include JSON::Serializable

        # The list of consumable resources required by a job.

        @[JSON::Field(key: "consumableResourceList")]
        getter consumable_resource_list : Array(Types::ConsumableResourceRequirement)?

        def initialize(
          @consumable_resource_list : Array(Types::ConsumableResourceRequirement)? = nil
        )
        end
      end

      # Information about a consumable resource required to run a job.

      struct ConsumableResourceRequirement
        include JSON::Serializable

        # The name or ARN of the consumable resource.

        @[JSON::Field(key: "consumableResource")]
        getter consumable_resource : String?

        # The quantity of the consumable resource that is needed.

        @[JSON::Field(key: "quantity")]
        getter quantity : Int64?

        def initialize(
          @consumable_resource : String? = nil,
          @quantity : Int64? = nil
        )
        end
      end

      # Current information about a consumable resource.

      struct ConsumableResourceSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the consumable resource.

        @[JSON::Field(key: "consumableResourceArn")]
        getter consumable_resource_arn : String

        # The name of the consumable resource.

        @[JSON::Field(key: "consumableResourceName")]
        getter consumable_resource_name : String

        # The amount of the consumable resource that is currently in use.

        @[JSON::Field(key: "inUseQuantity")]
        getter in_use_quantity : Int64?

        # Indicates whether the resource is available to be re-used after a job completes. Can be one of:
        # REPLENISHABLE NON_REPLENISHABLE

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The total amount of the consumable resource that is available.

        @[JSON::Field(key: "totalQuantity")]
        getter total_quantity : Int64?

        def initialize(
          @consumable_resource_arn : String,
          @consumable_resource_name : String,
          @in_use_quantity : Int64? = nil,
          @resource_type : String? = nil,
          @total_quantity : Int64? = nil
        )
        end
      end

      # An object that represents the details of a container that's part of a job.

      struct ContainerDetail
        include JSON::Serializable

        # The command that's passed to the container.

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The Amazon Resource Name (ARN) of the container instance that the container is running on.

        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # Determines whether execute command functionality is turned on for this task. If true , execute
        # command functionality is turned on all the containers in the task.

        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The environment variables to pass to a container. Environment variables cannot start with "
        # AWS_BATCH ". This naming convention is reserved for variables that Batch sets.

        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # The amount of ephemeral storage allocated for the task. This parameter is used to expand the total
        # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate.

        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the execution role that Batch can assume. For more information,
        # see Batch execution IAM role in the Batch User Guide .

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The exit code returned upon completion.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The platform configuration for jobs that are running on Fargate resources. Jobs that are running on
        # Amazon EC2 resources must not specify this parameter.

        @[JSON::Field(key: "fargatePlatformConfiguration")]
        getter fargate_platform_configuration : Types::FargatePlatformConfiguration?

        # The image used to start the container.

        @[JSON::Field(key: "image")]
        getter image : String?

        # The instance type of the underlying host infrastructure of a multi-node parallel job. This parameter
        # isn't applicable to jobs that are running on Fargate resources.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The Amazon Resource Name (ARN) that's associated with the job when run.

        @[JSON::Field(key: "jobRoleArn")]
        getter job_role_arn : String?

        # Linux-specific modifications that are applied to the container, such as details for device mappings.

        @[JSON::Field(key: "linuxParameters")]
        getter linux_parameters : Types::LinuxParameters?

        # The log configuration specification for the container. This parameter maps to LogConfig in the
        # Create a container section of the Docker Remote API and the --log-driver option to docker run . By
        # default, containers use the same logging driver that the Docker daemon uses. However, the container
        # might use a different logging driver than the Docker daemon by specifying a log driver with this
        # parameter in the container definition. To use a different logging driver for a container, the log
        # system must be configured properly on the container instance. Or, alternatively, it must be
        # configured on a different log server for remote logging options. For more information on the options
        # for different supported log drivers, see Configure logging drivers in the Docker documentation.
        # Batch currently supports a subset of the logging drivers available to the Docker daemon (shown in
        # the LogConfiguration data type). Additional log drivers might be available in future releases of the
        # Amazon ECS container agent. This parameter requires version 1.18 of the Docker Remote API or greater
        # on your container instance. To check the Docker Remote API version on your container instance, log
        # in to your container instance and run the following command: sudo docker version | grep "Server API
        # version" The Amazon ECS container agent running on a container instance must register the logging
        # drivers available on that instance with the ECS_AVAILABLE_LOGGING_DRIVERS environment variable
        # before containers placed on that instance can use these log configuration options. For more
        # information, see Amazon ECS container agent configuration in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The name of the Amazon CloudWatch Logs log stream that's associated with the container. The log
        # group for Batch jobs is /aws/batch/job . Each container attempt receives a log stream name when they
        # reach the RUNNING status.

        @[JSON::Field(key: "logStreamName")]
        getter log_stream_name : String?

        # For jobs running on Amazon EC2 resources that didn't specify memory requirements using
        # resourceRequirements , the number of MiB of memory reserved for the job. For other jobs, including
        # all run on Fargate resources, see resourceRequirements .

        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The mount points for data volumes in your container.

        @[JSON::Field(key: "mountPoints")]
        getter mount_points : Array(Types::MountPoint)?

        # The network configuration for jobs that are running on Fargate resources. Jobs that are running on
        # Amazon EC2 resources must not specify this parameter.

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The network interfaces that are associated with the job.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # When this parameter is true, the container is given elevated permissions on the host container
        # instance (similar to the root user). The default value is false . This parameter isn't applicable to
        # jobs that are running on Fargate resources and shouldn't be provided, or specified as false .

        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        # When this parameter is true, the container is given read-only access to its root file system. This
        # parameter maps to ReadonlyRootfs in the Create a container section of the Docker Remote API and the
        # --read-only option to docker run .

        @[JSON::Field(key: "readonlyRootFilesystem")]
        getter readonly_root_filesystem : Bool?

        # A short (255 max characters) human-readable string to provide additional details for a running or
        # stopped container.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The private repository authentication credentials to use.

        @[JSON::Field(key: "repositoryCredentials")]
        getter repository_credentials : Types::RepositoryCredentials?

        # The type and amount of resources to assign to a container. The supported resources include GPU ,
        # MEMORY , and VCPU .

        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        # An object that represents the compute environment architecture for Batch jobs on Fargate.

        @[JSON::Field(key: "runtimePlatform")]
        getter runtime_platform : Types::RuntimePlatform?

        # The secrets to pass to the container. For more information, see Specifying sensitive data in the
        # Batch User Guide .

        @[JSON::Field(key: "secrets")]
        getter secrets : Array(Types::Secret)?

        # The Amazon Resource Name (ARN) of the Amazon ECS task that's associated with the container job. Each
        # container attempt receives a task ARN when they reach the STARTING status.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        # A list of ulimit values to set in the container. This parameter maps to Ulimits in the Create a
        # container section of the Docker Remote API and the --ulimit option to docker run . This parameter
        # isn't applicable to jobs that are running on Fargate resources.

        @[JSON::Field(key: "ulimits")]
        getter ulimits : Array(Types::Ulimit)?

        # The user name to use inside the container. This parameter maps to User in the Create a container
        # section of the Docker Remote API and the --user option to docker run .

        @[JSON::Field(key: "user")]
        getter user : String?

        # The number of vCPUs reserved for the container. For jobs that run on Amazon EC2 resources, you can
        # specify the vCPU requirement for the job using resourceRequirements , but you can't specify the vCPU
        # requirements in both the vcpus and resourceRequirements object. This parameter maps to CpuShares in
        # the Create a container section of the Docker Remote API and the --cpu-shares option to docker run .
        # Each vCPU is equivalent to 1,024 CPU shares. You must specify at least one vCPU. This is required
        # but can be specified in several places. It must be specified for each node at least once. This
        # parameter isn't applicable to jobs that run on Fargate resources. For jobs that run on Fargate
        # resources, you must specify the vCPU requirement for the job using resourceRequirements .

        @[JSON::Field(key: "vcpus")]
        getter vcpus : Int32?

        # A list of volumes that are associated with the job.

        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @command : Array(String)? = nil,
          @container_instance_arn : String? = nil,
          @enable_execute_command : Bool? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @exit_code : Int32? = nil,
          @fargate_platform_configuration : Types::FargatePlatformConfiguration? = nil,
          @image : String? = nil,
          @instance_type : String? = nil,
          @job_role_arn : String? = nil,
          @linux_parameters : Types::LinuxParameters? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @log_stream_name : String? = nil,
          @memory : Int32? = nil,
          @mount_points : Array(Types::MountPoint)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @privileged : Bool? = nil,
          @readonly_root_filesystem : Bool? = nil,
          @reason : String? = nil,
          @repository_credentials : Types::RepositoryCredentials? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil,
          @runtime_platform : Types::RuntimePlatform? = nil,
          @secrets : Array(Types::Secret)? = nil,
          @task_arn : String? = nil,
          @ulimits : Array(Types::Ulimit)? = nil,
          @user : String? = nil,
          @vcpus : Int32? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # The overrides that should be sent to a container. For information about using Batch overrides when
      # you connect event sources to targets, see BatchContainerOverrides .

      struct ContainerOverrides
        include JSON::Serializable

        # The command to send to the container that overrides the default command from the Docker image or the
        # job definition. This parameter can't contain an empty string.

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The environment variables to send to the container. You can add new environment variables, which are
        # added to the container at launch, or you can override the existing environment variables from the
        # Docker image or the job definition. Environment variables cannot start with " AWS_BATCH ". This
        # naming convention is reserved for variables that Batch sets.

        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # The instance type to use for a multi-node parallel job. This parameter isn't applicable to
        # single-node container jobs or jobs that run on Fargate resources, and shouldn't be provided.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # This parameter is deprecated, use resourceRequirements to override the memory requirements specified
        # in the job definition. It's not supported for jobs running on Fargate resources. For jobs that run
        # on Amazon EC2 resources, it overrides the memory parameter set in the job definition, but doesn't
        # override any memory requirement that's specified in the resourceRequirements structure in the job
        # definition. To override memory requirements that are specified in the resourceRequirements structure
        # in the job definition, resourceRequirements must be specified in the SubmitJob request, with type
        # set to MEMORY and value set to the new value. For more information, see Can't override job
        # definition resource requirements in the Batch User Guide .

        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The type and amount of resources to assign to a container. This overrides the settings in the job
        # definition. The supported resources include GPU , MEMORY , and VCPU .

        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        # This parameter is deprecated, use resourceRequirements to override the vcpus parameter that's set in
        # the job definition. It's not supported for jobs running on Fargate resources. For jobs that run on
        # Amazon EC2 resources, it overrides the vcpus parameter set in the job definition, but doesn't
        # override any vCPU requirement specified in the resourceRequirements structure in the job definition.
        # To override vCPU requirements that are specified in the resourceRequirements structure in the job
        # definition, resourceRequirements must be specified in the SubmitJob request, with type set to VCPU
        # and value set to the new value. For more information, see Can't override job definition resource
        # requirements in the Batch User Guide .

        @[JSON::Field(key: "vcpus")]
        getter vcpus : Int32?

        def initialize(
          @command : Array(String)? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @instance_type : String? = nil,
          @memory : Int32? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil,
          @vcpus : Int32? = nil
        )
        end
      end

      # Container properties are used for Amazon ECS based job definitions. These properties to describe the
      # container that's launched as part of a job.

      struct ContainerProperties
        include JSON::Serializable

        # The command that's passed to the container. This parameter maps to Cmd in the Create a container
        # section of the Docker Remote API and the COMMAND parameter to docker run . For more information, see
        # https://docs.docker.com/engine/reference/builder/#cmd .

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # Determines whether execute command functionality is turned on for this task. If true , execute
        # command functionality is turned on all the containers in the task.

        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The environment variables to pass to a container. This parameter maps to Env in the Create a
        # container section of the Docker Remote API and the --env option to docker run . We don't recommend
        # using plaintext environment variables for sensitive information, such as credential data.
        # Environment variables cannot start with " AWS_BATCH ". This naming convention is reserved for
        # variables that Batch sets.

        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total
        # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate.

        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the execution role that Batch can assume. For jobs that run on
        # Fargate resources, you must provide an execution role. For more information, see Batch execution IAM
        # role in the Batch User Guide .

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The platform configuration for jobs that are running on Fargate resources. Jobs that are running on
        # Amazon EC2 resources must not specify this parameter.

        @[JSON::Field(key: "fargatePlatformConfiguration")]
        getter fargate_platform_configuration : Types::FargatePlatformConfiguration?

        # Required. The image used to start a container. This string is passed directly to the Docker daemon.
        # Images in the Docker Hub registry are available by default. Other repositories are specified with
        # repository-url / image : tag . It can be 255 characters long. It can contain uppercase and lowercase
        # letters, numbers, hyphens (-), underscores (_), colons (:), periods (.), forward slashes (/), and
        # number signs (#). This parameter maps to Image in the Create a container section of the Docker
        # Remote API and the IMAGE parameter of docker run . Docker image architecture must match the
        # processor architecture of the compute resources that they're scheduled on. For example, ARM-based
        # Docker images can only run on ARM-based compute resources. Images in Amazon ECR Public repositories
        # use the full registry/repository[:tag] or registry/repository[@digest] naming conventions. For
        # example, public.ecr.aws/ registry_alias / my-web-app : latest . Images in Amazon ECR repositories
        # use the full registry and repository URI (for example,
        # 123456789012.dkr.ecr.&lt;region-name&gt;.amazonaws.com/&lt;repository-name&gt; ). Images in official
        # repositories on Docker Hub use a single name (for example, ubuntu or mongo ). Images in other
        # repositories on Docker Hub are qualified with an organization name (for example,
        # amazon/amazon-ecs-agent ). Images in other online repositories are qualified further by a domain
        # name (for example, quay.io/assemblyline/ubuntu ).

        @[JSON::Field(key: "image")]
        getter image : String?

        # The instance type to use for a multi-node parallel job. All node groups in a multi-node parallel job
        # must use the same instance type. This parameter isn't applicable to single-node container jobs or
        # jobs that run on Fargate resources, and shouldn't be provided.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The Amazon Resource Name (ARN) of the IAM role that the container can assume for Amazon Web Services
        # permissions. For more information, see IAM roles for tasks in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "jobRoleArn")]
        getter job_role_arn : String?

        # Linux-specific modifications that are applied to the container, such as details for device mappings.

        @[JSON::Field(key: "linuxParameters")]
        getter linux_parameters : Types::LinuxParameters?

        # The log configuration specification for the container. This parameter maps to LogConfig in the
        # Create a container section of the Docker Remote API and the --log-driver option to docker run . By
        # default, containers use the same logging driver that the Docker daemon uses. However the container
        # might use a different logging driver than the Docker daemon by specifying a log driver with this
        # parameter in the container definition. To use a different logging driver for a container, the log
        # system must be configured properly on the container instance (or on a different log server for
        # remote logging options). For more information on the options for different supported log drivers,
        # see Configure logging drivers in the Docker documentation. Batch currently supports a subset of the
        # logging drivers available to the Docker daemon (shown in the LogConfiguration data type). This
        # parameter requires version 1.18 of the Docker Remote API or greater on your container instance. To
        # check the Docker Remote API version on your container instance, log in to your container instance
        # and run the following command: sudo docker version | grep "Server API version" The Amazon ECS
        # container agent running on a container instance must register the logging drivers available on that
        # instance with the ECS_AVAILABLE_LOGGING_DRIVERS environment variable before containers placed on
        # that instance can use these log configuration options. For more information, see Amazon ECS
        # container agent configuration in the Amazon Elastic Container Service Developer Guide .

        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # This parameter is deprecated, use resourceRequirements to specify the memory requirements for the
        # job definition. It's not supported for jobs running on Fargate resources. For jobs that run on
        # Amazon EC2 resources, it specifies the memory hard limit (in MiB) for a container. If your container
        # attempts to exceed the specified number, it's terminated. You must specify at least 4 MiB of memory
        # for a job using this parameter. The memory hard limit can be specified in several places. It must be
        # specified for each node at least once.

        @[JSON::Field(key: "memory")]
        getter memory : Int32?

        # The mount points for data volumes in your container. This parameter maps to Volumes in the Create a
        # container section of the Docker Remote API and the --volume option to docker run .

        @[JSON::Field(key: "mountPoints")]
        getter mount_points : Array(Types::MountPoint)?

        # The network configuration for jobs that are running on Fargate resources. Jobs that are running on
        # Amazon EC2 resources must not specify this parameter.

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # When this parameter is true, the container is given elevated permissions on the host container
        # instance (similar to the root user). This parameter maps to Privileged in the Create a container
        # section of the Docker Remote API and the --privileged option to docker run . The default value is
        # false. This parameter isn't applicable to jobs that are running on Fargate resources and shouldn't
        # be provided, or specified as false.

        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        # When this parameter is true, the container is given read-only access to its root file system. This
        # parameter maps to ReadonlyRootfs in the Create a container section of the Docker Remote API and the
        # --read-only option to docker run .

        @[JSON::Field(key: "readonlyRootFilesystem")]
        getter readonly_root_filesystem : Bool?

        # The private repository authentication credentials to use.

        @[JSON::Field(key: "repositoryCredentials")]
        getter repository_credentials : Types::RepositoryCredentials?

        # The type and amount of resources to assign to a container. The supported resources include GPU ,
        # MEMORY , and VCPU .

        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        # An object that represents the compute environment architecture for Batch jobs on Fargate.

        @[JSON::Field(key: "runtimePlatform")]
        getter runtime_platform : Types::RuntimePlatform?

        # The secrets for the container. For more information, see Specifying sensitive data in the Batch User
        # Guide .

        @[JSON::Field(key: "secrets")]
        getter secrets : Array(Types::Secret)?

        # A list of ulimits to set in the container. This parameter maps to Ulimits in the Create a container
        # section of the Docker Remote API and the --ulimit option to docker run . This parameter isn't
        # applicable to jobs that are running on Fargate resources and shouldn't be provided.

        @[JSON::Field(key: "ulimits")]
        getter ulimits : Array(Types::Ulimit)?

        # The user name to use inside the container. This parameter maps to User in the Create a container
        # section of the Docker Remote API and the --user option to docker run .

        @[JSON::Field(key: "user")]
        getter user : String?

        # This parameter is deprecated, use resourceRequirements to specify the vCPU requirements for the job
        # definition. It's not supported for jobs running on Fargate resources. For jobs running on Amazon EC2
        # resources, it specifies the number of vCPUs reserved for the job. Each vCPU is equivalent to 1,024
        # CPU shares. This parameter maps to CpuShares in the Create a container section of the Docker Remote
        # API and the --cpu-shares option to docker run . The number of vCPUs must be specified but can be
        # specified in several places. You must specify it at least once for each node.

        @[JSON::Field(key: "vcpus")]
        getter vcpus : Int32?

        # A list of data volumes used in a job.

        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @command : Array(String)? = nil,
          @enable_execute_command : Bool? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @fargate_platform_configuration : Types::FargatePlatformConfiguration? = nil,
          @image : String? = nil,
          @instance_type : String? = nil,
          @job_role_arn : String? = nil,
          @linux_parameters : Types::LinuxParameters? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @memory : Int32? = nil,
          @mount_points : Array(Types::MountPoint)? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @privileged : Bool? = nil,
          @readonly_root_filesystem : Bool? = nil,
          @repository_credentials : Types::RepositoryCredentials? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil,
          @runtime_platform : Types::RuntimePlatform? = nil,
          @secrets : Array(Types::Secret)? = nil,
          @ulimits : Array(Types::Ulimit)? = nil,
          @user : String? = nil,
          @vcpus : Int32? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # An object that represents summary details of a container within a job.

      struct ContainerSummary
        include JSON::Serializable

        # The exit code to return upon completion.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # A short (255 max characters) human-readable string to provide additional details for a running or
        # stopped container.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @exit_code : Int32? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains the parameters for CreateComputeEnvironment .

      struct CreateComputeEnvironmentRequest
        include JSON::Serializable

        # The name for your compute environment. It can be up to 128 characters long. It can contain uppercase
        # and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "computeEnvironmentName")]
        getter compute_environment_name : String

        # The type of the compute environment: MANAGED or UNMANAGED . For more information, see Compute
        # Environments in the Batch User Guide .

        @[JSON::Field(key: "type")]
        getter type : String

        # Details about the compute resources managed by the compute environment. This parameter is required
        # for managed compute environments. For more information, see Compute Environments in the Batch User
        # Guide .

        @[JSON::Field(key: "computeResources")]
        getter compute_resources : Types::ComputeResource?

        # Reserved.

        @[JSON::Field(key: "context")]
        getter context : String?

        # The details for the Amazon EKS cluster that supports the compute environment. To create a compute
        # environment that uses EKS resources, the caller must have permissions to call eks:DescribeCluster .

        @[JSON::Field(key: "eksConfiguration")]
        getter eks_configuration : Types::EksConfiguration?

        # The full Amazon Resource Name (ARN) of the IAM role that allows Batch to make calls to other Amazon
        # Web Services services on your behalf. For more information, see Batch service IAM role in the Batch
        # User Guide . If your account already created the Batch service-linked role, that role is used by
        # default for your compute environment unless you specify a different role here. If the Batch
        # service-linked role doesn't exist in your account, and no role is specified here, the service
        # attempts to create the Batch service-linked role in your account. If your specified role has a path
        # other than / , then you must specify either the full role ARN (recommended) or prefix the role name
        # with the path. For example, if a role with the name bar has a path of /foo/ , specify /foo/bar as
        # the role name. For more information, see Friendly names and paths in the IAM User Guide . Depending
        # on how you created your Batch service role, its ARN might contain the service-role path prefix. When
        # you only specify the name of the service role, Batch assumes that your ARN doesn't use the
        # service-role path prefix. Because of this, we recommend that you specify the full ARN of your
        # service role when you create compute environments.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The state of the compute environment. If the state is ENABLED , then the compute environment accepts
        # jobs from a queue and can scale out automatically based on queues. If the state is ENABLED , then
        # the Batch scheduler can attempt to place jobs from an associated job queue on the compute resources
        # within the environment. If the compute environment is managed, then it can scale its instances out
        # or in automatically, based on the job queue demand. If the state is DISABLED , then the Batch
        # scheduler doesn't attempt to place jobs within the environment. Jobs in a STARTING or RUNNING state
        # continue to progress normally. Managed compute environments in the DISABLED state don't scale out.
        # Compute environments in a DISABLED state may continue to incur billing charges. To prevent
        # additional charges, turn off and then delete the compute environment. For more information, see
        # State in the Batch User Guide . When an instance is idle, the instance scales down to the minvCpus
        # value. However, the instance size doesn't change. For example, consider a c5.8xlarge instance with a
        # minvCpus value of 4 and a desiredvCpus value of 36 . This instance doesn't scale down to a c5.large
        # instance.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The tags that you apply to the compute environment to help you categorize and organize your
        # resources. Each tag consists of a key and an optional value. For more information, see Tagging
        # Amazon Web Services Resources in Amazon Web Services General Reference . These tags can be updated
        # or removed using the TagResource and UntagResource API operations. These tags don't propagate to the
        # underlying compute resources.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The maximum number of vCPUs for an unmanaged compute environment. This parameter is only used for
        # fair-share scheduling to reserve vCPU capacity for new share identifiers. If this parameter isn't
        # provided for a fair-share job queue, no vCPU capacity is reserved. This parameter is only supported
        # when the type parameter is set to UNMANAGED .

        @[JSON::Field(key: "unmanagedvCpus")]
        getter unmanagedv_cpus : Int32?

        def initialize(
          @compute_environment_name : String,
          @type : String,
          @compute_resources : Types::ComputeResource? = nil,
          @context : String? = nil,
          @eks_configuration : Types::EksConfiguration? = nil,
          @service_role : String? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil,
          @unmanagedv_cpus : Int32? = nil
        )
        end
      end


      struct CreateComputeEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the compute environment.

        @[JSON::Field(key: "computeEnvironmentArn")]
        getter compute_environment_arn : String?

        # The name of the compute environment. It can be up to 128 characters long. It can contain uppercase
        # and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "computeEnvironmentName")]
        getter compute_environment_name : String?

        def initialize(
          @compute_environment_arn : String? = nil,
          @compute_environment_name : String? = nil
        )
        end
      end


      struct CreateConsumableResourceRequest
        include JSON::Serializable

        # The name of the consumable resource. Must be unique.

        @[JSON::Field(key: "consumableResourceName")]
        getter consumable_resource_name : String

        # Indicates whether the resource is available to be re-used after a job completes. Can be one of:
        # REPLENISHABLE (default) NON_REPLENISHABLE

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The tags that you apply to the consumable resource to help you categorize and organize your
        # resources. Each tag consists of a key and an optional value. For more information, see Tagging your
        # Batch resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The total amount of the consumable resource that is available. Must be non-negative.

        @[JSON::Field(key: "totalQuantity")]
        getter total_quantity : Int64?

        def initialize(
          @consumable_resource_name : String,
          @resource_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @total_quantity : Int64? = nil
        )
        end
      end


      struct CreateConsumableResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the consumable resource.

        @[JSON::Field(key: "consumableResourceArn")]
        getter consumable_resource_arn : String

        # The name of the consumable resource.

        @[JSON::Field(key: "consumableResourceName")]
        getter consumable_resource_name : String

        def initialize(
          @consumable_resource_arn : String,
          @consumable_resource_name : String
        )
        end
      end

      # Contains the parameters for CreateJobQueue .

      struct CreateJobQueueRequest
        include JSON::Serializable

        # The name of the job queue. It can be up to 128 letters long. It can contain uppercase and lowercase
        # letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "jobQueueName")]
        getter job_queue_name : String

        # The priority of the job queue. Job queues with a higher priority (or a higher integer value for the
        # priority parameter) are evaluated first when associated with the same compute environment. Priority
        # is determined in descending order. For example, a job queue with a priority value of 10 is given
        # scheduling preference over a job queue with a priority value of 1 . All of the compute environments
        # must be either EC2 ( EC2 or SPOT ) or Fargate ( FARGATE or FARGATE_SPOT ); EC2 and Fargate compute
        # environments can't be mixed.

        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The set of compute environments mapped to a job queue and their order relative to each other. The
        # job scheduler uses this parameter to determine which compute environment runs a specific job.
        # Compute environments must be in the VALID state before you can associate them with a job queue. You
        # can associate up to three compute environments with a job queue. All of the compute environments
        # must be either EC2 ( EC2 or SPOT ) or Fargate ( FARGATE or FARGATE_SPOT ); EC2 and Fargate compute
        # environments can't be mixed. All compute environments that are associated with a job queue must
        # share the same architecture. Batch doesn't support mixing compute environment architecture types in
        # a single job queue.

        @[JSON::Field(key: "computeEnvironmentOrder")]
        getter compute_environment_order : Array(Types::ComputeEnvironmentOrder)?

        # The type of job queue. For service jobs that run on SageMaker Training, this value is
        # SAGEMAKER_TRAINING . For regular container jobs, this value is EKS , ECS , or ECS_FARGATE depending
        # on the compute environment.

        @[JSON::Field(key: "jobQueueType")]
        getter job_queue_type : String?

        # The set of actions that Batch performs on jobs that remain at the head of the job queue in the
        # specified state longer than specified times. Batch will perform each action after maxTimeSeconds has
        # passed. ( Note : The minimum value for maxTimeSeconds is 600 (10 minutes) and its maximum value is
        # 86,400 (24 hours).)

        @[JSON::Field(key: "jobStateTimeLimitActions")]
        getter job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)?

        # The Amazon Resource Name (ARN) of the fair-share scheduling policy. Job queues that don't have a
        # fair-share scheduling policy are scheduled in a first-in, first-out (FIFO) model. After a job queue
        # has a fair-share scheduling policy, it can be replaced but can't be removed. The format is aws:
        # Partition :batch: Region : Account :scheduling-policy/ Name . An example is
        # aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy . A job queue without a
        # fair-share scheduling policy is scheduled as a FIFO job queue and can't have a fair-share scheduling
        # policy added. Jobs queues with a fair-share scheduling policy can have a maximum of 500 active share
        # identifiers. When the limit has been reached, submissions of any jobs that add a new share
        # identifier fail.

        @[JSON::Field(key: "schedulingPolicyArn")]
        getter scheduling_policy_arn : String?

        # A list of service environments that this job queue can use to allocate jobs. All serviceEnvironments
        # must have the same type. A job queue can't have both a serviceEnvironmentOrder and a
        # computeEnvironmentOrder field.

        @[JSON::Field(key: "serviceEnvironmentOrder")]
        getter service_environment_order : Array(Types::ServiceEnvironmentOrder)?

        # The state of the job queue. If the job queue state is ENABLED , it is able to accept jobs. If the
        # job queue state is DISABLED , new jobs can't be added to the queue, but jobs already in the queue
        # can finish.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The tags that you apply to the job queue to help you categorize and organize your resources. Each
        # tag consists of a key and an optional value. For more information, see Tagging your Batch resources
        # in Batch User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @job_queue_name : String,
          @priority : Int32,
          @compute_environment_order : Array(Types::ComputeEnvironmentOrder)? = nil,
          @job_queue_type : String? = nil,
          @job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)? = nil,
          @scheduling_policy_arn : String? = nil,
          @service_environment_order : Array(Types::ServiceEnvironmentOrder)? = nil,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateJobQueueResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the job queue.

        @[JSON::Field(key: "jobQueueArn")]
        getter job_queue_arn : String

        # The name of the job queue.

        @[JSON::Field(key: "jobQueueName")]
        getter job_queue_name : String

        def initialize(
          @job_queue_arn : String,
          @job_queue_name : String
        )
        end
      end

      # Contains the parameters for CreateSchedulingPolicy .

      struct CreateSchedulingPolicyRequest
        include JSON::Serializable

        # The name of the fair-share scheduling policy. It can be up to 128 letters long. It can contain
        # uppercase and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "name")]
        getter name : String

        # The fair-share scheduling policy details.

        @[JSON::Field(key: "fairsharePolicy")]
        getter fairshare_policy : Types::FairsharePolicy?

        # The tags that you apply to the scheduling policy to help you categorize and organize your resources.
        # Each tag consists of a key and an optional value. For more information, see Tagging Amazon Web
        # Services Resources in Amazon Web Services General Reference . These tags can be updated or removed
        # using the TagResource and UntagResource API operations.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @fairshare_policy : Types::FairsharePolicy? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSchedulingPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scheduling policy. The format is aws: Partition :batch: Region
        # : Account :scheduling-policy/ Name . For example,
        # aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the scheduling policy.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @arn : String,
          @name : String
        )
        end
      end


      struct CreateServiceEnvironmentRequest
        include JSON::Serializable

        # The capacity limits for the service environment. The number of instances a job consumes is the total
        # number of instances requested in the submit training job request resource configuration.

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Array(Types::CapacityLimit)

        # The name for the service environment. It can be up to 128 characters long and can contain letters,
        # numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "serviceEnvironmentName")]
        getter service_environment_name : String

        # The type of service environment. For SageMaker Training jobs, specify SAGEMAKER_TRAINING .

        @[JSON::Field(key: "serviceEnvironmentType")]
        getter service_environment_type : String

        # The state of the service environment. Valid values are ENABLED and DISABLED . The default value is
        # ENABLED .

        @[JSON::Field(key: "state")]
        getter state : String?

        # The tags that you apply to the service environment to help you categorize and organize your
        # resources. Each tag consists of a key and an optional value. For more information, see Tagging your
        # Batch resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @capacity_limits : Array(Types::CapacityLimit),
          @service_environment_name : String,
          @service_environment_type : String,
          @state : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateServiceEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service environment.

        @[JSON::Field(key: "serviceEnvironmentArn")]
        getter service_environment_arn : String

        # The name of the service environment.

        @[JSON::Field(key: "serviceEnvironmentName")]
        getter service_environment_name : String

        def initialize(
          @service_environment_arn : String,
          @service_environment_name : String
        )
        end
      end

      # Contains the parameters for DeleteComputeEnvironment .

      struct DeleteComputeEnvironmentRequest
        include JSON::Serializable

        # The name or Amazon Resource Name (ARN) of the compute environment to delete.

        @[JSON::Field(key: "computeEnvironment")]
        getter compute_environment : String

        def initialize(
          @compute_environment : String
        )
        end
      end


      struct DeleteComputeEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteConsumableResourceRequest
        include JSON::Serializable

        # The name or ARN of the consumable resource that will be deleted.

        @[JSON::Field(key: "consumableResource")]
        getter consumable_resource : String

        def initialize(
          @consumable_resource : String
        )
        end
      end


      struct DeleteConsumableResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DeleteJobQueue .

      struct DeleteJobQueueRequest
        include JSON::Serializable

        # The short name or full Amazon Resource Name (ARN) of the queue to delete.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        def initialize(
          @job_queue : String
        )
        end
      end


      struct DeleteJobQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DeleteSchedulingPolicy .

      struct DeleteSchedulingPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scheduling policy to delete.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end


      struct DeleteSchedulingPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteServiceEnvironmentRequest
        include JSON::Serializable

        # The name or ARN of the service environment to delete.

        @[JSON::Field(key: "serviceEnvironment")]
        getter service_environment : String

        def initialize(
          @service_environment : String
        )
        end
      end


      struct DeleteServiceEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeregisterJobDefinitionRequest
        include JSON::Serializable

        # The name and revision ( name:revision ) or full Amazon Resource Name (ARN) of the job definition to
        # deregister.

        @[JSON::Field(key: "jobDefinition")]
        getter job_definition : String

        def initialize(
          @job_definition : String
        )
        end
      end


      struct DeregisterJobDefinitionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains the parameters for DescribeComputeEnvironments .

      struct DescribeComputeEnvironmentsRequest
        include JSON::Serializable

        # A list of up to 100 compute environment names or full Amazon Resource Name (ARN) entries.

        @[JSON::Field(key: "computeEnvironments")]
        getter compute_environments : Array(String)?

        # The maximum number of cluster results returned by DescribeComputeEnvironments in paginated output.
        # When this parameter is used, DescribeComputeEnvironments only returns maxResults results in a single
        # page along with a nextToken response element. The remaining results of the initial request can be
        # seen by sending another DescribeComputeEnvironments request with the returned nextToken value. This
        # value can be between 1 and 100. If this parameter isn't used, then DescribeComputeEnvironments
        # returns up to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeComputeEnvironments request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. Treat this token as an opaque identifier that's only used to retrieve the
        # next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @compute_environments : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeComputeEnvironmentsResponse
        include JSON::Serializable

        # The list of compute environments.

        @[JSON::Field(key: "computeEnvironments")]
        getter compute_environments : Array(Types::ComputeEnvironmentDetail)?

        # The nextToken value to include in a future DescribeComputeEnvironments request. When the results of
        # a DescribeComputeEnvironments request exceed maxResults , this value can be used to retrieve the
        # next page of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @compute_environments : Array(Types::ComputeEnvironmentDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeConsumableResourceRequest
        include JSON::Serializable

        # The name or ARN of the consumable resource whose description will be returned.

        @[JSON::Field(key: "consumableResource")]
        getter consumable_resource : String

        def initialize(
          @consumable_resource : String
        )
        end
      end


      struct DescribeConsumableResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the consumable resource.

        @[JSON::Field(key: "consumableResourceArn")]
        getter consumable_resource_arn : String

        # The name of the consumable resource.

        @[JSON::Field(key: "consumableResourceName")]
        getter consumable_resource_name : String

        # The amount of the consumable resource that is currently available to use.

        @[JSON::Field(key: "availableQuantity")]
        getter available_quantity : Int64?

        # The Unix timestamp (in milliseconds) for when the consumable resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64?

        # The amount of the consumable resource that is currently in use.

        @[JSON::Field(key: "inUseQuantity")]
        getter in_use_quantity : Int64?

        # Indicates whether the resource is available to be re-used after a job completes. Can be one of:
        # REPLENISHABLE NON_REPLENISHABLE

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The tags that you apply to the consumable resource to help you categorize and organize your
        # resources. Each tag consists of a key and an optional value. For more information, see Tagging your
        # Batch resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The total amount of the consumable resource that is available.

        @[JSON::Field(key: "totalQuantity")]
        getter total_quantity : Int64?

        def initialize(
          @consumable_resource_arn : String,
          @consumable_resource_name : String,
          @available_quantity : Int64? = nil,
          @created_at : Int64? = nil,
          @in_use_quantity : Int64? = nil,
          @resource_type : String? = nil,
          @tags : Hash(String, String)? = nil,
          @total_quantity : Int64? = nil
        )
        end
      end

      # Contains the parameters for DescribeJobDefinitions .

      struct DescribeJobDefinitionsRequest
        include JSON::Serializable

        # The name of the job definition to describe.

        @[JSON::Field(key: "jobDefinitionName")]
        getter job_definition_name : String?

        # A list of up to 100 job definitions. Each entry in the list can either be an ARN in the format
        # arn:aws:batch:${Region}:${Account}:job-definition/${JobDefinitionName}:${Revision} or a short
        # version using the form ${JobDefinitionName}:${Revision} . This parameter can't be used with other
        # parameters.

        @[JSON::Field(key: "jobDefinitions")]
        getter job_definitions : Array(String)?

        # The maximum number of results returned by DescribeJobDefinitions in paginated output. When this
        # parameter is used, DescribeJobDefinitions only returns maxResults results in a single page and a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another DescribeJobDefinitions request with the returned nextToken value. This value can be between
        # 1 and 100. If this parameter isn't used, then DescribeJobDefinitions returns up to 100 results and a
        # nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeJobDefinitions request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. Treat this token as an opaque identifier that's only used to retrieve the
        # next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status used to filter job definitions.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @job_definition_name : String? = nil,
          @job_definitions : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct DescribeJobDefinitionsResponse
        include JSON::Serializable

        # The list of job definitions.

        @[JSON::Field(key: "jobDefinitions")]
        getter job_definitions : Array(Types::JobDefinition)?

        # The nextToken value to include in a future DescribeJobDefinitions request. When the results of a
        # DescribeJobDefinitions request exceed maxResults , this value can be used to retrieve the next page
        # of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_definitions : Array(Types::JobDefinition)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the parameters for DescribeJobQueues .

      struct DescribeJobQueuesRequest
        include JSON::Serializable

        # A list of up to 100 queue names or full queue Amazon Resource Name (ARN) entries.

        @[JSON::Field(key: "jobQueues")]
        getter job_queues : Array(String)?

        # The maximum number of results returned by DescribeJobQueues in paginated output. When this parameter
        # is used, DescribeJobQueues only returns maxResults results in a single page and a nextToken response
        # element. The remaining results of the initial request can be seen by sending another
        # DescribeJobQueues request with the returned nextToken value. This value can be between 1 and 100. If
        # this parameter isn't used, then DescribeJobQueues returns up to 100 results and a nextToken value if
        # applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeJobQueues request where maxResults
        # was used and the results exceeded the value of that parameter. Pagination continues from the end of
        # the previous results that returned the nextToken value. This value is null when there are no more
        # results to return. Treat this token as an opaque identifier that's only used to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_queues : Array(String)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeJobQueuesResponse
        include JSON::Serializable

        # The list of job queues.

        @[JSON::Field(key: "jobQueues")]
        getter job_queues : Array(Types::JobQueueDetail)?

        # The nextToken value to include in a future DescribeJobQueues request. When the results of a
        # DescribeJobQueues request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_queues : Array(Types::JobQueueDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Contains the parameters for DescribeJobs .

      struct DescribeJobsRequest
        include JSON::Serializable

        # A list of up to 100 job IDs.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(String)

        def initialize(
          @jobs : Array(String)
        )
        end
      end


      struct DescribeJobsResponse
        include JSON::Serializable

        # The list of jobs.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobDetail)?

        def initialize(
          @jobs : Array(Types::JobDetail)? = nil
        )
        end
      end

      # Contains the parameters for DescribeSchedulingPolicies .

      struct DescribeSchedulingPoliciesRequest
        include JSON::Serializable

        # A list of up to 100 scheduling policy Amazon Resource Name (ARN) entries.

        @[JSON::Field(key: "arns")]
        getter arns : Array(String)

        def initialize(
          @arns : Array(String)
        )
        end
      end


      struct DescribeSchedulingPoliciesResponse
        include JSON::Serializable

        # The list of scheduling policies.

        @[JSON::Field(key: "schedulingPolicies")]
        getter scheduling_policies : Array(Types::SchedulingPolicyDetail)?

        def initialize(
          @scheduling_policies : Array(Types::SchedulingPolicyDetail)? = nil
        )
        end
      end


      struct DescribeServiceEnvironmentsRequest
        include JSON::Serializable

        # The maximum number of results returned by DescribeServiceEnvironments in paginated output. When this
        # parameter is used, DescribeServiceEnvironments only returns maxResults results in a single page and
        # a nextToken response element. The remaining results of the initial request can be seen by sending
        # another DescribeServiceEnvironments request with the returned nextToken value. This value can be
        # between 1 and 100. If this parameter isn't used, then DescribeServiceEnvironments returns up to 100
        # results and a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated DescribeServiceEnvironments request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. Treat this token as an opaque identifier that's only used to retrieve the
        # next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of service environment names or ARN entries.

        @[JSON::Field(key: "serviceEnvironments")]
        getter service_environments : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @service_environments : Array(String)? = nil
        )
        end
      end


      struct DescribeServiceEnvironmentsResponse
        include JSON::Serializable

        # The nextToken value to include in a future DescribeServiceEnvironments request. When the results of
        # a DescribeServiceEnvironments request exceed maxResults , this value can be used to retrieve the
        # next page of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of service environments that match the request.

        @[JSON::Field(key: "serviceEnvironments")]
        getter service_environments : Array(Types::ServiceEnvironmentDetail)?

        def initialize(
          @next_token : String? = nil,
          @service_environments : Array(Types::ServiceEnvironmentDetail)? = nil
        )
        end
      end


      struct DescribeServiceJobRequest
        include JSON::Serializable

        # The job ID for the service job to describe.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end


      struct DescribeServiceJobResponse
        include JSON::Serializable

        # The job ID for the service job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the service job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The ARN of the job queue that the service job is associated with.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        # The type of service job. For SageMaker Training jobs, this value is SAGEMAKER_TRAINING .

        @[JSON::Field(key: "serviceJobType")]
        getter service_job_type : String

        # The Unix timestamp (in milliseconds) for when the service job was started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64

        # The current status of the service job.

        @[JSON::Field(key: "status")]
        getter status : String

        # A list of job attempts associated with the service job.

        @[JSON::Field(key: "attempts")]
        getter attempts : Array(Types::ServiceJobAttemptDetail)?

        # The Unix timestamp (in milliseconds) for when the service job was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64?

        # Indicates whether the service job has been terminated.

        @[JSON::Field(key: "isTerminated")]
        getter is_terminated : Bool?

        # The Amazon Resource Name (ARN) of the service job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The latest attempt associated with the service job.

        @[JSON::Field(key: "latestAttempt")]
        getter latest_attempt : Types::LatestServiceJobAttempt?

        # The retry strategy to use for failed service jobs that are submitted with this service job.

        @[JSON::Field(key: "retryStrategy")]
        getter retry_strategy : Types::ServiceJobRetryStrategy?

        # The scheduling priority of the service job.

        @[JSON::Field(key: "schedulingPriority")]
        getter scheduling_priority : Int32?

        # The request, in JSON, for the service that the SubmitServiceJob operation is queueing.

        @[JSON::Field(key: "serviceRequestPayload")]
        getter service_request_payload : String?

        # The share identifier for the service job. This is used for fair-share scheduling.

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String?

        # A short, human-readable string to provide more details for the current status of the service job.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp (in milliseconds) for when the service job stopped running.

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        # The tags that are associated with the service job. Each tag consists of a key and an optional value.
        # For more information, see Tagging your Batch resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timeout configuration for the service job.

        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::ServiceJobTimeout?

        def initialize(
          @job_id : String,
          @job_name : String,
          @job_queue : String,
          @service_job_type : String,
          @started_at : Int64,
          @status : String,
          @attempts : Array(Types::ServiceJobAttemptDetail)? = nil,
          @created_at : Int64? = nil,
          @is_terminated : Bool? = nil,
          @job_arn : String? = nil,
          @latest_attempt : Types::LatestServiceJobAttempt? = nil,
          @retry_strategy : Types::ServiceJobRetryStrategy? = nil,
          @scheduling_priority : Int32? = nil,
          @service_request_payload : String? = nil,
          @share_identifier : String? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout_config : Types::ServiceJobTimeout? = nil
        )
        end
      end

      # An object that represents a container instance host device. This object isn't applicable to jobs
      # that are running on Fargate resources and shouldn't be provided.

      struct Device
        include JSON::Serializable

        # The path for the device on the host container instance.

        @[JSON::Field(key: "hostPath")]
        getter host_path : String

        # The path inside the container that's used to expose the host device. By default, the hostPath value
        # is used.

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

      # The authorization configuration details for the Amazon EFS file system.

      struct EFSAuthorizationConfig
        include JSON::Serializable

        # The Amazon EFS access point ID to use. If an access point is specified, the root directory value
        # specified in the EFSVolumeConfiguration must either be omitted or set to / which enforces the path
        # set on the EFS access point. If an access point is used, transit encryption must be enabled in the
        # EFSVolumeConfiguration . For more information, see Working with Amazon EFS access points in the
        # Amazon Elastic File System User Guide .

        @[JSON::Field(key: "accessPointId")]
        getter access_point_id : String?

        # Whether or not to use the Batch job IAM role defined in a job definition when mounting the Amazon
        # EFS file system. If enabled, transit encryption must be enabled in the EFSVolumeConfiguration . If
        # this parameter is omitted, the default value of DISABLED is used. For more information, see Using
        # Amazon EFS access points in the Batch User Guide . EFS IAM authorization requires that
        # TransitEncryption be ENABLED and that a JobRoleArn is specified.

        @[JSON::Field(key: "iam")]
        getter iam : String?

        def initialize(
          @access_point_id : String? = nil,
          @iam : String? = nil
        )
        end
      end

      # This is used when you're using an Amazon Elastic File System file system for job storage. For more
      # information, see Amazon EFS Volumes in the Batch User Guide .

      struct EFSVolumeConfiguration
        include JSON::Serializable

        # The Amazon EFS file system ID to use.

        @[JSON::Field(key: "fileSystemId")]
        getter file_system_id : String

        # The authorization configuration details for the Amazon EFS file system.

        @[JSON::Field(key: "authorizationConfig")]
        getter authorization_config : Types::EFSAuthorizationConfig?

        # The directory within the Amazon EFS file system to mount as the root directory inside the host. If
        # this parameter is omitted, the root of the Amazon EFS volume is used instead. Specifying / has the
        # same effect as omitting this parameter. The maximum length is 4,096 characters. If an EFS access
        # point is specified in the authorizationConfig , the root directory parameter must either be omitted
        # or set to / , which enforces the path set on the Amazon EFS access point.

        @[JSON::Field(key: "rootDirectory")]
        getter root_directory : String?

        # Determines whether to enable encryption for Amazon EFS data in transit between the Amazon ECS host
        # and the Amazon EFS server. Transit encryption must be enabled if Amazon EFS IAM authorization is
        # used. If this parameter is omitted, the default value of DISABLED is used. For more information, see
        # Encrypting data in transit in the Amazon Elastic File System User Guide .

        @[JSON::Field(key: "transitEncryption")]
        getter transit_encryption : String?

        # The port to use when sending encrypted data between the Amazon ECS host and the Amazon EFS server.
        # If you don't specify a transit encryption port, it uses the port selection strategy that the Amazon
        # EFS mount helper uses. The value must be between 0 and 65,535. For more information, see EFS mount
        # helper in the Amazon Elastic File System User Guide .

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

      # Provides information used to select Amazon Machine Images (AMIs) for instances in the compute
      # environment. If Ec2Configuration isn't specified, the default is ECS_AL2 ( Amazon Linux 2 ). This
      # object isn't applicable to jobs that are running on Fargate resources.

      struct Ec2Configuration
        include JSON::Serializable

        # The image type to match with the instance type to select an AMI. The supported values are different
        # for ECS and EKS resources. ECS If the imageIdOverride parameter isn't specified, then a recent
        # Amazon ECS-optimized Amazon Linux 2 AMI ( ECS_AL2 ) is used. If a new image type is specified in an
        # update, but neither an imageId nor a imageIdOverride parameter is specified, then the latest Amazon
        # ECS optimized AMI for that image type that's supported by Batch is used. Amazon Web Services will
        # end support for Amazon ECS optimized AL2-optimized and AL2-accelerated AMIs. Starting in January
        # 2026, Batch will change the default AMI for new Amazon ECS compute environments from Amazon Linux 2
        # to Amazon Linux 2023. We recommend migrating Batch Amazon ECS compute environments to Amazon Linux
        # 2023 to maintain optimal performance and security. For more information on upgrading from AL2 to
        # AL2023, see How to migrate from ECS AL2 to ECS AL2023 in the Batch User Guide . ECS_AL2 Amazon Linux
        # 2 : Default for all non-GPU instance families. ECS_AL2_NVIDIA Amazon Linux 2 (GPU) : Default for all
        # GPU instance families (for example P4 and G4 ) and can be used for all non Amazon Web Services
        # Graviton-based instance types. ECS_AL2023 Amazon Linux 2023 : Batch supports Amazon Linux 2023.
        # Amazon Linux 2023 does not support A1 instances. ECS_AL2023_NVIDIA Amazon Linux 2023 (GPU) : For all
        # GPU instance families and can be used for all non Amazon Web Services Graviton-based instance types.
        # ECS_AL2023_NVIDIA doesn't support p3 and g3 instance types. EKS If the imageIdOverride parameter
        # isn't specified, then a recent Amazon EKS-optimized Amazon Linux 2023 AMI ( EKS_AL2023 ) is used. If
        # a new image type is specified in an update, but neither an imageId nor a imageIdOverride parameter
        # is specified, then the latest Amazon EKS optimized AMI for that image type that Batch supports is
        # used. Amazon Linux 2023 AMIs are the default on Batch for Amazon EKS. Amazon Web Services will end
        # support for Amazon EKS AL2-optimized and AL2-accelerated AMIs, starting 11/26/25. You can continue
        # using Batch-provided Amazon EKS optimized Amazon Linux 2 AMIs on your Amazon EKS compute
        # environments beyond the 11/26/25 end-of-support date, these compute environments will no longer
        # receive any new software updates, security patches, or bug fixes from Amazon Web Services. For more
        # information on upgrading from AL2 to AL2023, see How to upgrade from EKS AL2 to EKS AL2023 in the
        # Batch User Guide . EKS_AL2 Amazon Linux 2 : Used for non-GPU instance families. EKS_AL2_NVIDIA
        # Amazon Linux 2 (accelerated) : Used for GPU instance families (for example, P4 and G4 ) and can be
        # used for all non Amazon Web Services Graviton-based instance types. EKS_AL2023 Amazon Linux 2023 :
        # Default for non-GPU instance families. Amazon Linux 2023 does not support A1 instances.
        # EKS_AL2023_NVIDIA Amazon Linux 2023 (accelerated) : Default for GPU instance families and can be
        # used for all non Amazon Web Services Graviton-based instance types.

        @[JSON::Field(key: "imageType")]
        getter image_type : String

        # The AMI ID used for instances launched in the compute environment that match the image type. This
        # setting overrides the imageId set in the computeResource object. The AMI that you choose for a
        # compute environment must match the architecture of the instance types that you intend to use for
        # that compute environment. For example, if your compute environment uses A1 instance types, the
        # compute resource AMI that you choose must support ARM instances. Amazon ECS vends both x86 and ARM
        # versions of the Amazon ECS-optimized Amazon Linux 2 AMI. For more information, see Amazon
        # ECS-optimized Amazon Linux 2 AMI in the Amazon Elastic Container Service Developer Guide .

        @[JSON::Field(key: "imageIdOverride")]
        getter image_id_override : String?

        # The Kubernetes version for the compute environment. If you don't specify a value, the latest version
        # that Batch supports is used.

        @[JSON::Field(key: "imageKubernetesVersion")]
        getter image_kubernetes_version : String?

        def initialize(
          @image_type : String,
          @image_id_override : String? = nil,
          @image_kubernetes_version : String? = nil
        )
        end
      end

      # An object that contains the properties for the Amazon ECS resources of a job.

      struct EcsProperties
        include JSON::Serializable

        # An object that contains the properties for the Amazon ECS task definition of a job. This object is
        # currently limited to one task element. However, the task element can run up to 10 containers.

        @[JSON::Field(key: "taskProperties")]
        getter task_properties : Array(Types::EcsTaskProperties)

        def initialize(
          @task_properties : Array(Types::EcsTaskProperties)
        )
        end
      end

      # An object that contains the details for the Amazon ECS resources of a job.

      struct EcsPropertiesDetail
        include JSON::Serializable

        # The properties for the Amazon ECS task definition of a job.

        @[JSON::Field(key: "taskProperties")]
        getter task_properties : Array(Types::EcsTaskDetails)?

        def initialize(
          @task_properties : Array(Types::EcsTaskDetails)? = nil
        )
        end
      end

      # An object that contains overrides for the Amazon ECS task definition of a job.

      struct EcsPropertiesOverride
        include JSON::Serializable

        # The overrides for the Amazon ECS task definition of a job. This object is currently limited to one
        # element.

        @[JSON::Field(key: "taskProperties")]
        getter task_properties : Array(Types::TaskPropertiesOverride)?

        def initialize(
          @task_properties : Array(Types::TaskPropertiesOverride)? = nil
        )
        end
      end

      # The details of a task definition that describes the container and volume definitions of an Amazon
      # ECS task.

      struct EcsTaskDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the container instance that hosts the task.

        @[JSON::Field(key: "containerInstanceArn")]
        getter container_instance_arn : String?

        # A list of containers that are included in the taskProperties list.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::TaskContainerDetails)?

        # Determines whether execute command functionality is turned on for this task. If true , execute
        # command functionality is turned on all the containers in the task.

        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The amount of ephemeral storage allocated for the task.

        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the execution role that Batch can assume. For more information,
        # see Batch execution IAM role in the Batch User Guide .

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The IPC resource namespace to use for the containers in the task. The valid values are host , task ,
        # or none . For more information see ipcMode in EcsTaskProperties .

        @[JSON::Field(key: "ipcMode")]
        getter ipc_mode : String?

        # The network configuration for jobs that are running on Fargate resources. Jobs that are running on
        # Amazon EC2 resources must not specify this parameter.

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The process namespace to use for the containers in the task. The valid values are host , or task .
        # For more information see pidMode in EcsTaskProperties .

        @[JSON::Field(key: "pidMode")]
        getter pid_mode : String?

        # The Fargate platform version where the jobs are running.

        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # An object that represents the compute environment architecture for Batch jobs on Fargate.

        @[JSON::Field(key: "runtimePlatform")]
        getter runtime_platform : Types::RuntimePlatform?

        # The ARN of the Amazon ECS task.

        @[JSON::Field(key: "taskArn")]
        getter task_arn : String?

        # The Amazon Resource Name (ARN) of the IAM role that the container can assume for Amazon Web Services
        # permissions. For more information, see IAM roles for tasks in the Amazon Elastic Container Service
        # Developer Guide . This is object is comparable to ContainerProperties:jobRoleArn .

        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        # A list of data volumes used in a job.

        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @container_instance_arn : String? = nil,
          @containers : Array(Types::TaskContainerDetails)? = nil,
          @enable_execute_command : Bool? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @ipc_mode : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @pid_mode : String? = nil,
          @platform_version : String? = nil,
          @runtime_platform : Types::RuntimePlatform? = nil,
          @task_arn : String? = nil,
          @task_role_arn : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # The properties for a task definition that describes the container and volume definitions of an
      # Amazon ECS task. You can specify which Docker images to use, the required resources, and other
      # configurations related to launching the task definition through an Amazon ECS service or task.

      struct EcsTaskProperties
        include JSON::Serializable

        # This object is a list of containers.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::TaskContainerProperties)

        # Determines whether execute command functionality is turned on for this task. If true , execute
        # command functionality is turned on all the containers in the task.

        @[JSON::Field(key: "enableExecuteCommand")]
        getter enable_execute_command : Bool?

        # The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total
        # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate.

        @[JSON::Field(key: "ephemeralStorage")]
        getter ephemeral_storage : Types::EphemeralStorage?

        # The Amazon Resource Name (ARN) of the execution role that Batch can assume. For jobs that run on
        # Fargate resources, you must provide an execution role. For more information, see Batch execution IAM
        # role in the Batch User Guide .

        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String?

        # The IPC resource namespace to use for the containers in the task. The valid values are host , task ,
        # or none . If host is specified, all containers within the tasks that specified the host IPC mode on
        # the same container instance share the same IPC resources with the host Amazon EC2 instance. If task
        # is specified, all containers within the specified task share the same IPC resources. If none is
        # specified, the IPC resources within the containers of a task are private, and are not shared with
        # other containers in a task or on the container instance. If no value is specified, then the IPC
        # resource namespace sharing depends on the Docker daemon setting on the container instance. For more
        # information, see IPC settings in the Docker run reference.

        @[JSON::Field(key: "ipcMode")]
        getter ipc_mode : String?

        # The network configuration for jobs that are running on Fargate resources. Jobs that are running on
        # Amazon EC2 resources must not specify this parameter.

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The process namespace to use for the containers in the task. The valid values are host or task . For
        # example, monitoring sidecars might need pidMode to access information about other containers running
        # in the same task. If host is specified, all containers within the tasks that specified the host PID
        # mode on the same container instance share the process namespace with the host Amazon EC2 instance.
        # If task is specified, all containers within the specified task share the same process namespace. If
        # no value is specified, the default is a private namespace for each container. For more information,
        # see PID settings in the Docker run reference.

        @[JSON::Field(key: "pidMode")]
        getter pid_mode : String?

        # The Fargate platform version where the jobs are running. A platform version is specified only for
        # jobs that are running on Fargate resources. If one isn't specified, the LATEST platform version is
        # used by default. This uses a recent, approved version of the Fargate platform for compute resources.
        # For more information, see Fargate platform versions in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        # An object that represents the compute environment architecture for Batch jobs on Fargate.

        @[JSON::Field(key: "runtimePlatform")]
        getter runtime_platform : Types::RuntimePlatform?

        # The Amazon Resource Name (ARN) that's associated with the Amazon ECS task. This is object is
        # comparable to ContainerProperties:jobRoleArn .

        @[JSON::Field(key: "taskRoleArn")]
        getter task_role_arn : String?

        # A list of volumes that are associated with the job.

        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::Volume)?

        def initialize(
          @containers : Array(Types::TaskContainerProperties),
          @enable_execute_command : Bool? = nil,
          @ephemeral_storage : Types::EphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @ipc_mode : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @pid_mode : String? = nil,
          @platform_version : String? = nil,
          @runtime_platform : Types::RuntimePlatform? = nil,
          @task_role_arn : String? = nil,
          @volumes : Array(Types::Volume)? = nil
        )
        end
      end

      # An object that represents the details for an attempt for a job attempt that an Amazon EKS container
      # runs.

      struct EksAttemptContainerDetail
        include JSON::Serializable

        # The ID for the container.

        @[JSON::Field(key: "containerID")]
        getter container_id : String?

        # The exit code returned for the job attempt. A non-zero exit code is considered failed.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The name of a container.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A short (255 max characters) human-readable string to provide additional details for a running or
        # stopped container.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @container_id : String? = nil,
          @exit_code : Int32? = nil,
          @name : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # An object that represents the details of a job attempt for a job attempt by an Amazon EKS container.

      struct EksAttemptDetail
        include JSON::Serializable

        # The details for the final status of the containers for this job attempt.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::EksAttemptContainerDetail)?

        # The Amazon Resource Name (ARN) of the Amazon EKS cluster.

        @[JSON::Field(key: "eksClusterArn")]
        getter eks_cluster_arn : String?

        # The details for the init containers.

        @[JSON::Field(key: "initContainers")]
        getter init_containers : Array(Types::EksAttemptContainerDetail)?

        # The name of the node for this job attempt.

        @[JSON::Field(key: "nodeName")]
        getter node_name : String?

        # The name of the pod for this job attempt.

        @[JSON::Field(key: "podName")]
        getter pod_name : String?

        # The namespace of the Amazon EKS cluster that the pod exists in.

        @[JSON::Field(key: "podNamespace")]
        getter pod_namespace : String?

        # The Unix timestamp (in milliseconds) for when the attempt was started (when the attempt transitioned
        # from the STARTING state to the RUNNING state).

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # A short, human-readable string to provide additional details for the current status of the job
        # attempt.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp (in milliseconds) for when the attempt was stopped. This happens when the attempt
        # transitioned from the RUNNING state to a terminal state, such as SUCCEEDED or FAILED .

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        def initialize(
          @containers : Array(Types::EksAttemptContainerDetail)? = nil,
          @eks_cluster_arn : String? = nil,
          @init_containers : Array(Types::EksAttemptContainerDetail)? = nil,
          @node_name : String? = nil,
          @pod_name : String? = nil,
          @pod_namespace : String? = nil,
          @started_at : Int64? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil
        )
        end
      end

      # Configuration for the Amazon EKS cluster that supports the Batch compute environment. The cluster
      # must exist before the compute environment can be created.

      struct EksConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Amazon EKS cluster. An example is arn: aws :eks: us-east-1 :
        # 123456789012 :cluster/ ClusterForBatch .

        @[JSON::Field(key: "eksClusterArn")]
        getter eks_cluster_arn : String

        # The namespace of the Amazon EKS cluster. Batch manages pods in this namespace. The value can't left
        # empty or null. It must be fewer than 64 characters long, can't be set to default , can't start with
        # " kube- ," and must match this regular expression: ^[a-z0-9]([-a-z0-9]*[a-z0-9])?$ . For more
        # information, see Namespaces in the Kubernetes documentation.

        @[JSON::Field(key: "kubernetesNamespace")]
        getter kubernetes_namespace : String

        def initialize(
          @eks_cluster_arn : String,
          @kubernetes_namespace : String
        )
        end
      end

      # EKS container properties are used in job definitions for Amazon EKS based job definitions to
      # describe the properties for a container node in the pod that's launched as part of a job. This can't
      # be specified for Amazon ECS based job definitions.

      struct EksContainer
        include JSON::Serializable

        # The Docker image used to start the container.

        @[JSON::Field(key: "image")]
        getter image : String

        # An array of arguments to the entrypoint. If this isn't specified, the CMD of the container image is
        # used. This corresponds to the args member in the Entrypoint portion of the Pod in Kubernetes.
        # Environment variable references are expanded using the container's environment. If the referenced
        # environment variable doesn't exist, the reference in the command isn't changed. For example, if the
        # reference is to " $(NAME1) " and the NAME1 environment variable doesn't exist, the command string
        # will remain " $(NAME1) ." $$ is replaced with $ , and the resulting string isn't expanded. For
        # example, $$(VAR_NAME) is passed as $(VAR_NAME) whether or not the VAR_NAME environment variable
        # exists. For more information, see Dockerfile reference: CMD and Define a command and arguments for a
        # pod in the Kubernetes documentation .

        @[JSON::Field(key: "args")]
        getter args : Array(String)?

        # The entrypoint for the container. This isn't run within a shell. If this isn't specified, the
        # ENTRYPOINT of the container image is used. Environment variable references are expanded using the
        # container's environment. If the referenced environment variable doesn't exist, the reference in the
        # command isn't changed. For example, if the reference is to " $(NAME1) " and the NAME1 environment
        # variable doesn't exist, the command string will remain " $(NAME1) ." $$ is replaced with $ and the
        # resulting string isn't expanded. For example, $$(VAR_NAME) will be passed as $(VAR_NAME) whether or
        # not the VAR_NAME environment variable exists. The entrypoint can't be updated. For more information,
        # see ENTRYPOINT in the Dockerfile reference and Define a command and arguments for a container and
        # Entrypoint in the Kubernetes documentation .

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The environment variables to pass to a container. Environment variables cannot start with "
        # AWS_BATCH ". This naming convention is reserved for variables that Batch sets.

        @[JSON::Field(key: "env")]
        getter env : Array(Types::EksContainerEnvironmentVariable)?

        # The image pull policy for the container. Supported values are Always , IfNotPresent , and Never .
        # This parameter defaults to IfNotPresent . However, if the :latest tag is specified, it defaults to
        # Always . For more information, see Updating images in the Kubernetes documentation .

        @[JSON::Field(key: "imagePullPolicy")]
        getter image_pull_policy : String?

        # The name of the container. If the name isn't specified, the default name " Default " is used. Each
        # container in a pod must have a unique name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type and amount of resources to assign to a container. The supported resources include memory ,
        # cpu , and nvidia.com/gpu . For more information, see Resource management for pods and containers in
        # the Kubernetes documentation .

        @[JSON::Field(key: "resources")]
        getter resources : Types::EksContainerResourceRequirements?

        # The security context for a job. For more information, see Configure a security context for a pod or
        # container in the Kubernetes documentation .

        @[JSON::Field(key: "securityContext")]
        getter security_context : Types::EksContainerSecurityContext?

        # The volume mounts for the container. Batch supports emptyDir , hostPath , and secret volume types.
        # For more information about volumes and volume mounts in Kubernetes, see Volumes in the Kubernetes
        # documentation .

        @[JSON::Field(key: "volumeMounts")]
        getter volume_mounts : Array(Types::EksContainerVolumeMount)?

        def initialize(
          @image : String,
          @args : Array(String)? = nil,
          @command : Array(String)? = nil,
          @env : Array(Types::EksContainerEnvironmentVariable)? = nil,
          @image_pull_policy : String? = nil,
          @name : String? = nil,
          @resources : Types::EksContainerResourceRequirements? = nil,
          @security_context : Types::EksContainerSecurityContext? = nil,
          @volume_mounts : Array(Types::EksContainerVolumeMount)? = nil
        )
        end
      end

      # The details for container properties that are returned by DescribeJobs for jobs that use Amazon EKS.

      struct EksContainerDetail
        include JSON::Serializable

        # An array of arguments to the entrypoint. If this isn't specified, the CMD of the container image is
        # used. This corresponds to the args member in the Entrypoint portion of the Pod in Kubernetes.
        # Environment variable references are expanded using the container's environment. If the referenced
        # environment variable doesn't exist, the reference in the command isn't changed. For example, if the
        # reference is to " $(NAME1) " and the NAME1 environment variable doesn't exist, the command string
        # will remain " $(NAME1) ". $$ is replaced with $ and the resulting string isn't expanded. For
        # example, $$(VAR_NAME) is passed as $(VAR_NAME) whether or not the VAR_NAME environment variable
        # exists. For more information, see Dockerfile reference: CMD and Define a command and arguments for a
        # pod in the Kubernetes documentation .

        @[JSON::Field(key: "args")]
        getter args : Array(String)?

        # The entrypoint for the container. For more information, see Entrypoint in the Kubernetes
        # documentation .

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The environment variables to pass to a container. Environment variables cannot start with "
        # AWS_BATCH ". This naming convention is reserved for variables that Batch sets.

        @[JSON::Field(key: "env")]
        getter env : Array(Types::EksContainerEnvironmentVariable)?

        # The exit code returned for the job attempt. A non-zero exit code is considered failed.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The Docker image used to start the container.

        @[JSON::Field(key: "image")]
        getter image : String?

        # The image pull policy for the container. Supported values are Always , IfNotPresent , and Never .
        # This parameter defaults to Always if the :latest tag is specified, IfNotPresent otherwise. For more
        # information, see Updating images in the Kubernetes documentation .

        @[JSON::Field(key: "imagePullPolicy")]
        getter image_pull_policy : String?

        # The name of the container. If the name isn't specified, the default name " Default " is used. Each
        # container in a pod must have a unique name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # A short human-readable string to provide additional details for a running or stopped container. It
        # can be up to 255 characters long.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The type and amount of resources to assign to a container. The supported resources include memory ,
        # cpu , and nvidia.com/gpu . For more information, see Resource management for pods and containers in
        # the Kubernetes documentation .

        @[JSON::Field(key: "resources")]
        getter resources : Types::EksContainerResourceRequirements?

        # The security context for a job. For more information, see Configure a security context for a pod or
        # container in the Kubernetes documentation .

        @[JSON::Field(key: "securityContext")]
        getter security_context : Types::EksContainerSecurityContext?

        # The volume mounts for the container. Batch supports emptyDir , hostPath , and secret volume types.
        # For more information about volumes and volume mounts in Kubernetes, see Volumes in the Kubernetes
        # documentation .

        @[JSON::Field(key: "volumeMounts")]
        getter volume_mounts : Array(Types::EksContainerVolumeMount)?

        def initialize(
          @args : Array(String)? = nil,
          @command : Array(String)? = nil,
          @env : Array(Types::EksContainerEnvironmentVariable)? = nil,
          @exit_code : Int32? = nil,
          @image : String? = nil,
          @image_pull_policy : String? = nil,
          @name : String? = nil,
          @reason : String? = nil,
          @resources : Types::EksContainerResourceRequirements? = nil,
          @security_context : Types::EksContainerSecurityContext? = nil,
          @volume_mounts : Array(Types::EksContainerVolumeMount)? = nil
        )
        end
      end

      # An environment variable.

      struct EksContainerEnvironmentVariable
        include JSON::Serializable

        # The name of the environment variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the environment variable.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @name : String,
          @value : String? = nil
        )
        end
      end

      # Object representing any Kubernetes overrides to a job definition that's used in a SubmitJob API
      # operation.

      struct EksContainerOverride
        include JSON::Serializable

        # The arguments to the entrypoint to send to the container that overrides the default arguments from
        # the Docker image or the job definition. For more information, see Dockerfile reference: CMD and
        # Define a command an arguments for a pod in the Kubernetes documentation .

        @[JSON::Field(key: "args")]
        getter args : Array(String)?

        # The command to send to the container that overrides the default command from the Docker image or the
        # job definition.

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The environment variables to send to the container. You can add new environment variables, which are
        # added to the container at launch. Or, you can override the existing environment variables from the
        # Docker image or the job definition. Environment variables cannot start with " AWS_BATCH ". This
        # naming convention is reserved for variables that Batch sets.

        @[JSON::Field(key: "env")]
        getter env : Array(Types::EksContainerEnvironmentVariable)?

        # The override of the Docker image that's used to start the container.

        @[JSON::Field(key: "image")]
        getter image : String?

        # A pointer to the container that you want to override. The name must match a unique container name
        # that you wish to override.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type and amount of resources to assign to a container. These override the settings in the job
        # definition. The supported resources include memory , cpu , and nvidia.com/gpu . For more
        # information, see Resource management for pods and containers in the Kubernetes documentation .

        @[JSON::Field(key: "resources")]
        getter resources : Types::EksContainerResourceRequirements?

        def initialize(
          @args : Array(String)? = nil,
          @command : Array(String)? = nil,
          @env : Array(Types::EksContainerEnvironmentVariable)? = nil,
          @image : String? = nil,
          @name : String? = nil,
          @resources : Types::EksContainerResourceRequirements? = nil
        )
        end
      end

      # The type and amount of resources to assign to a container. The supported resources include memory ,
      # cpu , and nvidia.com/gpu . For more information, see Resource management for pods and containers in
      # the Kubernetes documentation .

      struct EksContainerResourceRequirements
        include JSON::Serializable

        # The type and quantity of the resources to reserve for the container. The values vary based on the
        # name that's specified. Resources can be requested using either the limits or the requests objects.
        # memory The memory hard limit (in MiB) for the container, using whole integers, with a "Mi" suffix.
        # If your container attempts to exceed the memory specified, the container is terminated. You must
        # specify at least 4 MiB of memory for a job. memory can be specified in limits , requests , or both.
        # If memory is specified in both places, then the value that's specified in limits must be equal to
        # the value that's specified in requests . To maximize your resource utilization, provide your jobs
        # with as much memory as possible for the specific instance type that you are using. To learn how, see
        # Memory management in the Batch User Guide . cpu The number of CPUs that's reserved for the
        # container. Values must be an even multiple of 0.25 . cpu can be specified in limits , requests , or
        # both. If cpu is specified in both places, then the value that's specified in limits must be at least
        # as large as the value that's specified in requests . nvidia.com/gpu The number of GPUs that's
        # reserved for the container. Values must be a whole integer. memory can be specified in limits ,
        # requests , or both. If memory is specified in both places, then the value that's specified in limits
        # must be equal to the value that's specified in requests .

        @[JSON::Field(key: "limits")]
        getter limits : Hash(String, String)?

        # The type and quantity of the resources to request for the container. The values vary based on the
        # name that's specified. Resources can be requested by using either the limits or the requests
        # objects. memory The memory hard limit (in MiB) for the container, using whole integers, with a "Mi"
        # suffix. If your container attempts to exceed the memory specified, the container is terminated. You
        # must specify at least 4 MiB of memory for a job. memory can be specified in limits , requests , or
        # both. If memory is specified in both, then the value that's specified in limits must be equal to the
        # value that's specified in requests . If you're trying to maximize your resource utilization by
        # providing your jobs as much memory as possible for a particular instance type, see Memory management
        # in the Batch User Guide . cpu The number of CPUs that are reserved for the container. Values must be
        # an even multiple of 0.25 . cpu can be specified in limits , requests , or both. If cpu is specified
        # in both, then the value that's specified in limits must be at least as large as the value that's
        # specified in requests . nvidia.com/gpu The number of GPUs that are reserved for the container.
        # Values must be a whole integer. nvidia.com/gpu can be specified in limits , requests , or both. If
        # nvidia.com/gpu is specified in both, then the value that's specified in limits must be equal to the
        # value that's specified in requests .

        @[JSON::Field(key: "requests")]
        getter requests : Hash(String, String)?

        def initialize(
          @limits : Hash(String, String)? = nil,
          @requests : Hash(String, String)? = nil
        )
        end
      end

      # The security context for a job. For more information, see Configure a security context for a pod or
      # container in the Kubernetes documentation .

      struct EksContainerSecurityContext
        include JSON::Serializable

        # Whether or not a container or a Kubernetes pod is allowed to gain more privileges than its parent
        # process. The default value is false .

        @[JSON::Field(key: "allowPrivilegeEscalation")]
        getter allow_privilege_escalation : Bool?

        # When this parameter is true , the container is given elevated permissions on the host container
        # instance. The level of permissions are similar to the root user permissions. The default value is
        # false . This parameter maps to privileged policy in the Privileged pod security policies in the
        # Kubernetes documentation .

        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        # When this parameter is true , the container is given read-only access to its root file system. The
        # default value is false . This parameter maps to ReadOnlyRootFilesystem policy in the Volumes and
        # file systems pod security policies in the Kubernetes documentation .

        @[JSON::Field(key: "readOnlyRootFilesystem")]
        getter read_only_root_filesystem : Bool?

        # When this parameter is specified, the container is run as the specified group ID ( gid ). If this
        # parameter isn't specified, the default is the group that's specified in the image metadata. This
        # parameter maps to RunAsGroup and MustRunAs policy in the Users and groups pod security policies in
        # the Kubernetes documentation .

        @[JSON::Field(key: "runAsGroup")]
        getter run_as_group : Int64?

        # When this parameter is specified, the container is run as a user with a uid other than 0. If this
        # parameter isn't specified, so such rule is enforced. This parameter maps to RunAsUser and
        # MustRunAsNonRoot policy in the Users and groups pod security policies in the Kubernetes
        # documentation .

        @[JSON::Field(key: "runAsNonRoot")]
        getter run_as_non_root : Bool?

        # When this parameter is specified, the container is run as the specified user ID ( uid ). If this
        # parameter isn't specified, the default is the user that's specified in the image metadata. This
        # parameter maps to RunAsUser and MustRanAs policy in the Users and groups pod security policies in
        # the Kubernetes documentation .

        @[JSON::Field(key: "runAsUser")]
        getter run_as_user : Int64?

        def initialize(
          @allow_privilege_escalation : Bool? = nil,
          @privileged : Bool? = nil,
          @read_only_root_filesystem : Bool? = nil,
          @run_as_group : Int64? = nil,
          @run_as_non_root : Bool? = nil,
          @run_as_user : Int64? = nil
        )
        end
      end

      # The volume mounts for a container for an Amazon EKS job. For more information about volumes and
      # volume mounts in Kubernetes, see Volumes in the Kubernetes documentation .

      struct EksContainerVolumeMount
        include JSON::Serializable

        # The path on the container where the volume is mounted.

        @[JSON::Field(key: "mountPath")]
        getter mount_path : String?

        # The name the volume mount. This must match the name of one of the volumes in the pod.

        @[JSON::Field(key: "name")]
        getter name : String?

        # If this value is true , the container has read-only access to the volume. Otherwise, the container
        # can write to the volume. The default value is false .

        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool?

        # A sub-path inside the referenced volume instead of its root.

        @[JSON::Field(key: "subPath")]
        getter sub_path : String?

        def initialize(
          @mount_path : String? = nil,
          @name : String? = nil,
          @read_only : Bool? = nil,
          @sub_path : String? = nil
        )
        end
      end

      # Specifies the configuration of a Kubernetes emptyDir volume. An emptyDir volume is first created
      # when a pod is assigned to a node. It exists as long as that pod is running on that node. The
      # emptyDir volume is initially empty. All containers in the pod can read and write the files in the
      # emptyDir volume. However, the emptyDir volume can be mounted at the same or different paths in each
      # container. When a pod is removed from a node for any reason, the data in the emptyDir is deleted
      # permanently. For more information, see emptyDir in the Kubernetes documentation .

      struct EksEmptyDir
        include JSON::Serializable

        # The medium to store the volume. The default value is an empty string, which uses the storage of the
        # node. "" (Default) Use the disk storage of the node. "Memory" Use the tmpfs volume that's backed by
        # the RAM of the node. Contents of the volume are lost when the node reboots, and any storage on the
        # volume counts against the container's memory limit.

        @[JSON::Field(key: "medium")]
        getter medium : String?

        # The maximum size of the volume. By default, there's no maximum size defined.

        @[JSON::Field(key: "sizeLimit")]
        getter size_limit : String?

        def initialize(
          @medium : String? = nil,
          @size_limit : String? = nil
        )
        end
      end

      # Specifies the configuration of a Kubernetes hostPath volume. A hostPath volume mounts an existing
      # file or directory from the host node's filesystem into your pod. For more information, see hostPath
      # in the Kubernetes documentation .

      struct EksHostPath
        include JSON::Serializable

        # The path of the file or directory on the host to mount into containers on the pod.

        @[JSON::Field(key: "path")]
        getter path : String?

        def initialize(
          @path : String? = nil
        )
        end
      end

      # Describes and uniquely identifies Kubernetes resources. For example, the compute environment that a
      # pod runs in or the jobID for a job running in the pod. For more information, see Understanding
      # Kubernetes Objects in the Kubernetes documentation .

      struct EksMetadata
        include JSON::Serializable

        # Key-value pairs used to attach arbitrary, non-identifying metadata to Kubernetes objects. Valid
        # annotation keys have two segments: an optional prefix and a name, separated by a slash (/). The
        # prefix is optional and must be 253 characters or less. If specified, the prefix must be a DNS
        # subdomain− a series of DNS labels separated by dots (.), and it must end with a slash (/). The name
        # segment is required and must be 63 characters or less. It can include alphanumeric characters
        # ([a-z0-9A-Z]), dashes (-), underscores (_), and dots (.), but must begin and end with an
        # alphanumeric character. Annotation values must be 255 characters or less. Annotations can be added
        # or modified at any time. Each resource can have multiple annotations.

        @[JSON::Field(key: "annotations")]
        getter annotations : Hash(String, String)?

        # Key-value pairs used to identify, sort, and organize cube resources. Can contain up to 63 uppercase
        # letters, lowercase letters, numbers, hyphens (-), and underscores (_). Labels can be added or
        # modified at any time. Each resource can have multiple labels, but each key must be unique for a
        # given object.

        @[JSON::Field(key: "labels")]
        getter labels : Hash(String, String)?

        # The namespace of the Amazon EKS cluster. In Kubernetes, namespaces provide a mechanism for isolating
        # groups of resources within a single cluster. Names of resources need to be unique within a
        # namespace, but not across namespaces. Batch places Batch Job pods in this namespace. If this field
        # is provided, the value can't be empty or null. It must meet the following requirements: 1-63
        # characters long Can't be set to default Can't start with kube Must match the following regular
        # expression: ^[a-z0-9]([-a-z0-9]*[a-z0-9])?$ For more information, see Namespaces in the Kubernetes
        # documentation . This namespace can be different from the kubernetesNamespace set in the compute
        # environment's EksConfiguration , but must have identical role-based access control (RBAC) roles as
        # the compute environment's kubernetesNamespace . For multi-node parallel jobs, the same value must be
        # provided across all the node ranges.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        def initialize(
          @annotations : Hash(String, String)? = nil,
          @labels : Hash(String, String)? = nil,
          @namespace : String? = nil
        )
        end
      end

      # A persistentVolumeClaim volume is used to mount a PersistentVolume into a Pod.
      # PersistentVolumeClaims are a way for users to "claim" durable storage without knowing the details of
      # the particular cloud environment. See the information about PersistentVolumes in the Kubernetes
      # documentation .

      struct EksPersistentVolumeClaim
        include JSON::Serializable

        # The name of the persistentVolumeClaim bounded to a persistentVolume . For more information, see
        # Persistent Volume Claims in the Kubernetes documentation .

        @[JSON::Field(key: "claimName")]
        getter claim_name : String

        # An optional boolean value indicating if the mount is read only. Default is false. For more
        # information, see Read Only Mounts in the Kubernetes documentation .

        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool?

        def initialize(
          @claim_name : String,
          @read_only : Bool? = nil
        )
        end
      end

      # The properties for the pod.

      struct EksPodProperties
        include JSON::Serializable

        # The properties of the container that's used on the Amazon EKS pod. This object is limited to 10
        # elements.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::EksContainer)?

        # The DNS policy for the pod. The default value is ClusterFirst . If the hostNetwork parameter is not
        # specified, the default is ClusterFirstWithHostNet . ClusterFirst indicates that any DNS query that
        # does not match the configured cluster domain suffix is forwarded to the upstream nameserver
        # inherited from the node. For more information, see Pod's DNS policy in the Kubernetes documentation
        # . Valid values: Default | ClusterFirst | ClusterFirstWithHostNet

        @[JSON::Field(key: "dnsPolicy")]
        getter dns_policy : String?

        # Indicates if the pod uses the hosts' network IP address. The default value is true . Setting this to
        # false enables the Kubernetes pod networking model. Most Batch workloads are egress-only and don't
        # require the overhead of IP allocation for each pod for incoming connections. For more information,
        # see Host namespaces and Pod networking in the Kubernetes documentation .

        @[JSON::Field(key: "hostNetwork")]
        getter host_network : Bool?

        # References a Kubernetes secret resource. It holds a list of secrets. These secrets help to gain
        # access to pull an images from a private registry. ImagePullSecret$name is required when this object
        # is used.

        @[JSON::Field(key: "imagePullSecrets")]
        getter image_pull_secrets : Array(Types::ImagePullSecret)?

        # These containers run before application containers, always runs to completion, and must complete
        # successfully before the next container starts. These containers are registered with the Amazon EKS
        # Connector agent and persists the registration information in the Kubernetes backend data store. For
        # more information, see Init Containers in the Kubernetes documentation . This object is limited to 10
        # elements.

        @[JSON::Field(key: "initContainers")]
        getter init_containers : Array(Types::EksContainer)?

        # Metadata about the Kubernetes pod. For more information, see Understanding Kubernetes Objects in the
        # Kubernetes documentation .

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::EksMetadata?

        # The name of the service account that's used to run the pod. For more information, see Kubernetes
        # service accounts and Configure a Kubernetes service account to assume an IAM role in the Amazon EKS
        # User Guide and Configure service accounts for pods in the Kubernetes documentation .

        @[JSON::Field(key: "serviceAccountName")]
        getter service_account_name : String?

        # Indicates if the processes in a container are shared, or visible, to other containers in the same
        # pod. For more information, see Share Process Namespace between Containers in a Pod .

        @[JSON::Field(key: "shareProcessNamespace")]
        getter share_process_namespace : Bool?

        # Specifies the volumes for a job definition that uses Amazon EKS resources.

        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::EksVolume)?

        def initialize(
          @containers : Array(Types::EksContainer)? = nil,
          @dns_policy : String? = nil,
          @host_network : Bool? = nil,
          @image_pull_secrets : Array(Types::ImagePullSecret)? = nil,
          @init_containers : Array(Types::EksContainer)? = nil,
          @metadata : Types::EksMetadata? = nil,
          @service_account_name : String? = nil,
          @share_process_namespace : Bool? = nil,
          @volumes : Array(Types::EksVolume)? = nil
        )
        end
      end

      # The details for the pod.

      struct EksPodPropertiesDetail
        include JSON::Serializable

        # The properties of the container that's used on the Amazon EKS pod.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::EksContainerDetail)?

        # The DNS policy for the pod. The default value is ClusterFirst . If the hostNetwork parameter is not
        # specified, the default is ClusterFirstWithHostNet . ClusterFirst indicates that any DNS query that
        # does not match the configured cluster domain suffix is forwarded to the upstream nameserver
        # inherited from the node. If no value was specified for dnsPolicy in the RegisterJobDefinition API
        # operation, then no value will be returned for dnsPolicy by either of DescribeJobDefinitions or
        # DescribeJobs API operations. The pod spec setting will contain either ClusterFirst or
        # ClusterFirstWithHostNet , depending on the value of the hostNetwork parameter. For more information,
        # see Pod's DNS policy in the Kubernetes documentation . Valid values: Default | ClusterFirst |
        # ClusterFirstWithHostNet

        @[JSON::Field(key: "dnsPolicy")]
        getter dns_policy : String?

        # Indicates if the pod uses the hosts' network IP address. The default value is true . Setting this to
        # false enables the Kubernetes pod networking model. Most Batch workloads are egress-only and don't
        # require the overhead of IP allocation for each pod for incoming connections. For more information,
        # see Host namespaces and Pod networking in the Kubernetes documentation .

        @[JSON::Field(key: "hostNetwork")]
        getter host_network : Bool?

        # Displays the reference pointer to the Kubernetes secret resource. These secrets help to gain access
        # to pull an images from a private registry.

        @[JSON::Field(key: "imagePullSecrets")]
        getter image_pull_secrets : Array(Types::ImagePullSecret)?

        # The container registered with the Amazon EKS Connector agent and persists the registration
        # information in the Kubernetes backend data store.

        @[JSON::Field(key: "initContainers")]
        getter init_containers : Array(Types::EksContainerDetail)?

        # Describes and uniquely identifies Kubernetes resources. For example, the compute environment that a
        # pod runs in or the jobID for a job running in the pod. For more information, see Understanding
        # Kubernetes Objects in the Kubernetes documentation .

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::EksMetadata?

        # The name of the node for this job.

        @[JSON::Field(key: "nodeName")]
        getter node_name : String?

        # The name of the pod for this job.

        @[JSON::Field(key: "podName")]
        getter pod_name : String?

        # The name of the service account that's used to run the pod. For more information, see Kubernetes
        # service accounts and Configure a Kubernetes service account to assume an IAM role in the Amazon EKS
        # User Guide and Configure service accounts for pods in the Kubernetes documentation .

        @[JSON::Field(key: "serviceAccountName")]
        getter service_account_name : String?

        # Indicates if the processes in a container are shared, or visible, to other containers in the same
        # pod. For more information, see Share Process Namespace between Containers in a Pod .

        @[JSON::Field(key: "shareProcessNamespace")]
        getter share_process_namespace : Bool?

        # Specifies the volumes for a job definition using Amazon EKS resources.

        @[JSON::Field(key: "volumes")]
        getter volumes : Array(Types::EksVolume)?

        def initialize(
          @containers : Array(Types::EksContainerDetail)? = nil,
          @dns_policy : String? = nil,
          @host_network : Bool? = nil,
          @image_pull_secrets : Array(Types::ImagePullSecret)? = nil,
          @init_containers : Array(Types::EksContainerDetail)? = nil,
          @metadata : Types::EksMetadata? = nil,
          @node_name : String? = nil,
          @pod_name : String? = nil,
          @service_account_name : String? = nil,
          @share_process_namespace : Bool? = nil,
          @volumes : Array(Types::EksVolume)? = nil
        )
        end
      end

      # An object that contains overrides for the Kubernetes pod properties of a job.

      struct EksPodPropertiesOverride
        include JSON::Serializable

        # The overrides for the container that's used on the Amazon EKS pod.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::EksContainerOverride)?

        # The overrides for the initContainers defined in the Amazon EKS pod. These containers run before
        # application containers, always run to completion, and must complete successfully before the next
        # container starts. These containers are registered with the Amazon EKS Connector agent and persists
        # the registration information in the Kubernetes backend data store. For more information, see Init
        # Containers in the Kubernetes documentation .

        @[JSON::Field(key: "initContainers")]
        getter init_containers : Array(Types::EksContainerOverride)?

        # Metadata about the overrides for the container that's used on the Amazon EKS pod.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::EksMetadata?

        def initialize(
          @containers : Array(Types::EksContainerOverride)? = nil,
          @init_containers : Array(Types::EksContainerOverride)? = nil,
          @metadata : Types::EksMetadata? = nil
        )
        end
      end

      # An object that contains the properties for the Kubernetes resources of a job.

      struct EksProperties
        include JSON::Serializable

        # The properties for the Kubernetes pod resources of a job.

        @[JSON::Field(key: "podProperties")]
        getter pod_properties : Types::EksPodProperties?

        def initialize(
          @pod_properties : Types::EksPodProperties? = nil
        )
        end
      end

      # An object that contains the details for the Kubernetes resources of a job.

      struct EksPropertiesDetail
        include JSON::Serializable

        # The properties for the Kubernetes pod resources of a job.

        @[JSON::Field(key: "podProperties")]
        getter pod_properties : Types::EksPodPropertiesDetail?

        def initialize(
          @pod_properties : Types::EksPodPropertiesDetail? = nil
        )
        end
      end

      # An object that contains overrides for the Kubernetes resources of a job.

      struct EksPropertiesOverride
        include JSON::Serializable

        # The overrides for the Kubernetes pod resources of a job.

        @[JSON::Field(key: "podProperties")]
        getter pod_properties : Types::EksPodPropertiesOverride?

        def initialize(
          @pod_properties : Types::EksPodPropertiesOverride? = nil
        )
        end
      end

      # Specifies the configuration of a Kubernetes secret volume. For more information, see secret in the
      # Kubernetes documentation .

      struct EksSecret
        include JSON::Serializable

        # The name of the secret. The name must be allowed as a DNS subdomain name. For more information, see
        # DNS subdomain names in the Kubernetes documentation .

        @[JSON::Field(key: "secretName")]
        getter secret_name : String

        # Specifies whether the secret or the secret's keys must be defined.

        @[JSON::Field(key: "optional")]
        getter optional : Bool?

        def initialize(
          @secret_name : String,
          @optional : Bool? = nil
        )
        end
      end

      # Specifies an Amazon EKS volume for a job definition.

      struct EksVolume
        include JSON::Serializable

        # The name of the volume. The name must be allowed as a DNS subdomain name. For more information, see
        # DNS subdomain names in the Kubernetes documentation .

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the configuration of a Kubernetes emptyDir volume. For more information, see emptyDir in
        # the Kubernetes documentation .

        @[JSON::Field(key: "emptyDir")]
        getter empty_dir : Types::EksEmptyDir?

        # Specifies the configuration of a Kubernetes hostPath volume. For more information, see hostPath in
        # the Kubernetes documentation .

        @[JSON::Field(key: "hostPath")]
        getter host_path : Types::EksHostPath?

        # Specifies the configuration of a Kubernetes persistentVolumeClaim bounded to a persistentVolume .
        # For more information, see Persistent Volume Claims in the Kubernetes documentation .

        @[JSON::Field(key: "persistentVolumeClaim")]
        getter persistent_volume_claim : Types::EksPersistentVolumeClaim?

        # Specifies the configuration of a Kubernetes secret volume. For more information, see secret in the
        # Kubernetes documentation .

        @[JSON::Field(key: "secret")]
        getter secret : Types::EksSecret?

        def initialize(
          @name : String,
          @empty_dir : Types::EksEmptyDir? = nil,
          @host_path : Types::EksHostPath? = nil,
          @persistent_volume_claim : Types::EksPersistentVolumeClaim? = nil,
          @secret : Types::EksSecret? = nil
        )
        end
      end

      # The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total
      # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate.

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

      # Specifies an array of up to 5 conditions to be met, and an action to take ( RETRY or EXIT ) if all
      # conditions are met. If none of the EvaluateOnExit conditions in a RetryStrategy match, then the job
      # is retried.

      struct EvaluateOnExit
        include JSON::Serializable

        # Specifies the action to take if all of the specified conditions ( onStatusReason , onReason , and
        # onExitCode ) are met. The values aren't case sensitive.

        @[JSON::Field(key: "action")]
        getter action : String

        # Contains a glob pattern to match against the decimal representation of the ExitCode returned for a
        # job. The pattern can be up to 512 characters long. It can contain only numbers, and can end with an
        # asterisk (*) so that only the start of the string needs to be an exact match. The string can contain
        # up to 512 characters.

        @[JSON::Field(key: "onExitCode")]
        getter on_exit_code : String?

        # Contains a glob pattern to match against the Reason returned for a job. The pattern can contain up
        # to 512 characters. It can contain letters, numbers, periods (.), colons (:), and white space
        # (including spaces and tabs). It can optionally end with an asterisk (*) so that only the start of
        # the string needs to be an exact match.

        @[JSON::Field(key: "onReason")]
        getter on_reason : String?

        # Contains a glob pattern to match against the StatusReason returned for a job. The pattern can
        # contain up to 512 characters. It can contain letters, numbers, periods (.), colons (:), and white
        # spaces (including spaces or tabs). It can optionally end with an asterisk (*) so that only the start
        # of the string needs to be an exact match.

        @[JSON::Field(key: "onStatusReason")]
        getter on_status_reason : String?

        def initialize(
          @action : String,
          @on_exit_code : String? = nil,
          @on_reason : String? = nil,
          @on_status_reason : String? = nil
        )
        end
      end

      # The fair-share scheduling policy details.

      struct FairsharePolicy
        include JSON::Serializable

        # A value used to reserve some of the available maximum vCPU for share identifiers that aren't already
        # used. The reserved ratio is ( computeReservation /100)^ ActiveFairShares where ActiveFairShares is
        # the number of active share identifiers. For example, a computeReservation value of 50 indicates that
        # Batch reserves 50% of the maximum available vCPU if there's only one share identifier. It reserves
        # 25% if there are two share identifiers. It reserves 12.5% if there are three share identifiers. A
        # computeReservation value of 25 indicates that Batch should reserve 25% of the maximum available vCPU
        # if there's only one share identifier, 6.25% if there are two fair share identifiers, and 1.56% if
        # there are three share identifiers. The minimum value is 0 and the maximum value is 99.

        @[JSON::Field(key: "computeReservation")]
        getter compute_reservation : Int32?

        # The amount of time (in seconds) to use to calculate a fair-share percentage for each share
        # identifier in use. A value of zero (0) indicates the default minimum time window (600 seconds). The
        # maximum supported value is 604800 (1 week). The decay allows for more recently run jobs to have more
        # weight than jobs that ran earlier. Consider adjusting this number if you have jobs that (on average)
        # run longer than ten minutes, or a large difference in job count or job run times between share
        # identifiers, and the allocation of resources doesn't meet your needs.

        @[JSON::Field(key: "shareDecaySeconds")]
        getter share_decay_seconds : Int32?

        # An array of SharedIdentifier objects that contain the weights for the share identifiers for the
        # fair-share policy. Share identifiers that aren't included have a default weight of 1.0 .

        @[JSON::Field(key: "shareDistribution")]
        getter share_distribution : Array(Types::ShareAttributes)?

        def initialize(
          @compute_reservation : Int32? = nil,
          @share_decay_seconds : Int32? = nil,
          @share_distribution : Array(Types::ShareAttributes)? = nil
        )
        end
      end

      # The platform configuration for jobs that are running on Fargate resources. Jobs that run on Amazon
      # EC2 resources must not specify this parameter.

      struct FargatePlatformConfiguration
        include JSON::Serializable

        # The Fargate platform version where the jobs are running. A platform version is specified only for
        # jobs that are running on Fargate resources. If one isn't specified, the LATEST platform version is
        # used by default. This uses a recent, approved version of the Fargate platform for compute resources.
        # For more information, see Fargate platform versions in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "platformVersion")]
        getter platform_version : String?

        def initialize(
          @platform_version : String? = nil
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
        # Amazon Elastic Container Service Developer Guide .

        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        def initialize(
          @type : String,
          @options : Hash(String, String)? = nil
        )
        end
      end

      # Contains a list of the first 100 RUNNABLE jobs associated to a single job queue.

      struct FrontOfQueueDetail
        include JSON::Serializable

        # The Amazon Resource Names (ARNs) of the first 100 RUNNABLE jobs in a named job queue. For
        # first-in-first-out (FIFO) job queues, jobs are ordered based on their submission time. For
        # fair-share scheduling (FSS) job queues, jobs are ordered based on their job priority and share
        # usage.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::FrontOfQueueJobSummary)?

        # The Unix timestamp (in milliseconds) for when each of the first 100 RUNNABLE jobs were last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Int64?

        def initialize(
          @jobs : Array(Types::FrontOfQueueJobSummary)? = nil,
          @last_updated_at : Int64? = nil
        )
        end
      end

      # An object that represents summary details for the first 100 RUNNABLE jobs in a job queue.

      struct FrontOfQueueJobSummary
        include JSON::Serializable

        # The Unix timestamp (in milliseconds) for when the job transitioned to its current position in the
        # job queue.

        @[JSON::Field(key: "earliestTimeAtPosition")]
        getter earliest_time_at_position : Int64?

        # The ARN for a job in a named job queue.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        def initialize(
          @earliest_time_at_position : Int64? = nil,
          @job_arn : String? = nil
        )
        end
      end


      struct GetJobQueueSnapshotRequest
        include JSON::Serializable

        # The job queue’s name or full queue Amazon Resource Name (ARN).

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        def initialize(
          @job_queue : String
        )
        end
      end


      struct GetJobQueueSnapshotResponse
        include JSON::Serializable

        # The list of the first 100 RUNNABLE jobs in each job queue. For first-in-first-out (FIFO) job queues,
        # jobs are ordered based on their submission time. For fair-share scheduling (FSS) job queues, jobs
        # are ordered based on their job priority and share usage.

        @[JSON::Field(key: "frontOfQueue")]
        getter front_of_queue : Types::FrontOfQueueDetail?

        def initialize(
          @front_of_queue : Types::FrontOfQueueDetail? = nil
        )
        end
      end

      # Determine whether your data volume persists on the host container instance and where it's stored. If
      # this parameter is empty, then the Docker daemon assigns a host path for your data volume. However,
      # the data isn't guaranteed to persist after the containers that are associated with it stop running.

      struct Host
        include JSON::Serializable

        # The path on the host container instance that's presented to the container. If this parameter is
        # empty, then the Docker daemon has assigned a host path for you. If this parameter contains a file
        # location, then the data volume persists at the specified location on the host container instance
        # until you delete it manually. If the source path location doesn't exist on the host container
        # instance, the Docker daemon creates it. If the location does exist, the contents of the source path
        # folder are exported. This parameter isn't applicable to jobs that run on Fargate resources. Don't
        # provide this for these jobs.

        @[JSON::Field(key: "sourcePath")]
        getter source_path : String?

        def initialize(
          @source_path : String? = nil
        )
        end
      end

      # References a Kubernetes secret resource. This name of the secret must start and end with an
      # alphanumeric character, is required to be lowercase, can include periods (.) and hyphens (-), and
      # can't contain more than 253 characters.

      struct ImagePullSecret
        include JSON::Serializable

        # Provides a unique identifier for the ImagePullSecret . This object is required when
        # EksPodProperties$imagePullSecrets is used.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # An object that represents an Batch job definition.

      struct JobDefinition
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the job definition.

        @[JSON::Field(key: "jobDefinitionArn")]
        getter job_definition_arn : String

        # The name of the job definition.

        @[JSON::Field(key: "jobDefinitionName")]
        getter job_definition_name : String

        # The revision of the job definition.

        @[JSON::Field(key: "revision")]
        getter revision : Int32

        # The type of job definition. It's either container or multinode . If the job is run on Fargate
        # resources, then multinode isn't supported. For more information about multi-node parallel jobs, see
        # Creating a multi-node parallel job definition in the Batch User Guide .

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains a list of consumable resources required by the job.

        @[JSON::Field(key: "consumableResourceProperties")]
        getter consumable_resource_properties : Types::ConsumableResourceProperties?

        # The orchestration type of the compute environment. The valid values are ECS (default) or EKS .

        @[JSON::Field(key: "containerOrchestrationType")]
        getter container_orchestration_type : String?

        # An object with properties specific to Amazon ECS-based jobs. When containerProperties is used in the
        # job definition, it can't be used in addition to eksProperties , ecsProperties , or nodeProperties .

        @[JSON::Field(key: "containerProperties")]
        getter container_properties : Types::ContainerProperties?

        # An object that contains the properties for the Amazon ECS resources of a job.When ecsProperties is
        # used in the job definition, it can't be used in addition to containerProperties , eksProperties , or
        # nodeProperties .

        @[JSON::Field(key: "ecsProperties")]
        getter ecs_properties : Types::EcsProperties?

        # An object with properties that are specific to Amazon EKS-based jobs. When eksProperties is used in
        # the job definition, it can't be used in addition to containerProperties , ecsProperties , or
        # nodeProperties .

        @[JSON::Field(key: "eksProperties")]
        getter eks_properties : Types::EksProperties?

        # An object with properties that are specific to multi-node parallel jobs. When nodeProperties is used
        # in the job definition, it can't be used in addition to containerProperties , ecsProperties , or
        # eksProperties . If the job runs on Fargate resources, don't specify nodeProperties . Use
        # containerProperties instead.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Types::NodeProperties?

        # Default parameters or parameter substitution placeholders that are set in the job definition.
        # Parameters are specified as a key-value pair mapping. Parameters in a SubmitJob request override any
        # corresponding parameter defaults from the job definition. For more information about specifying
        # parameters, see Job definition parameters in the Batch User Guide .

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The platform capabilities required by the job definition. If no value is specified, it defaults to
        # EC2 . Jobs run on Fargate resources specify FARGATE .

        @[JSON::Field(key: "platformCapabilities")]
        getter platform_capabilities : Array(String)?

        # Specifies whether to propagate the tags from the job or job definition to the corresponding Amazon
        # ECS task. If no value is specified, the tags aren't propagated. Tags can only be propagated to the
        # tasks when the tasks are created. For tags with the same name, job tags are given priority over job
        # definitions tags. If the total number of combined tags from the job and job definition is over 50,
        # the job is moved to the FAILED state.

        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : Bool?

        # The retry strategy to use for failed jobs that are submitted with this job definition.

        @[JSON::Field(key: "retryStrategy")]
        getter retry_strategy : Types::RetryStrategy?

        # The scheduling priority of the job definition. This only affects jobs in job queues with a
        # fair-share policy. Jobs with a higher scheduling priority are scheduled before jobs with a lower
        # scheduling priority.

        @[JSON::Field(key: "schedulingPriority")]
        getter scheduling_priority : Int32?

        # The status of the job definition.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags that are applied to the job definition.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timeout time for jobs that are submitted with this job definition. After the amount of time you
        # specify passes, Batch terminates your jobs if they aren't finished.

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::JobTimeout?

        def initialize(
          @job_definition_arn : String,
          @job_definition_name : String,
          @revision : Int32,
          @type : String,
          @consumable_resource_properties : Types::ConsumableResourceProperties? = nil,
          @container_orchestration_type : String? = nil,
          @container_properties : Types::ContainerProperties? = nil,
          @ecs_properties : Types::EcsProperties? = nil,
          @eks_properties : Types::EksProperties? = nil,
          @node_properties : Types::NodeProperties? = nil,
          @parameters : Hash(String, String)? = nil,
          @platform_capabilities : Array(String)? = nil,
          @propagate_tags : Bool? = nil,
          @retry_strategy : Types::RetryStrategy? = nil,
          @scheduling_priority : Int32? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Types::JobTimeout? = nil
        )
        end
      end

      # An object that represents an Batch job dependency.

      struct JobDependency
        include JSON::Serializable

        # The job ID of the Batch job that's associated with this dependency.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The type of the job dependency.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @job_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # An object that represents an Batch job.

      struct JobDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the job definition that this job uses.

        @[JSON::Field(key: "jobDefinition")]
        getter job_definition : String

        # The job ID.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The job name.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The Amazon Resource Name (ARN) of the job queue that the job is associated with.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        # The Unix timestamp (in milliseconds) for when the job was started. More specifically, it's when the
        # job transitioned from the STARTING state to the RUNNING state.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64

        # The current status for the job. If your jobs don't progress to STARTING , see Jobs stuck in RUNNABLE
        # status in the troubleshooting section of the Batch User Guide .

        @[JSON::Field(key: "status")]
        getter status : String

        # The array properties of the job, if it's an array job.

        @[JSON::Field(key: "arrayProperties")]
        getter array_properties : Types::ArrayPropertiesDetail?

        # A list of job attempts that are associated with this job.

        @[JSON::Field(key: "attempts")]
        getter attempts : Array(Types::AttemptDetail)?

        # Contains a list of consumable resources required by the job.

        @[JSON::Field(key: "consumableResourceProperties")]
        getter consumable_resource_properties : Types::ConsumableResourceProperties?

        # An object that represents the details for the container that's associated with the job. If the
        # details are for a multiple-container job, this object will be empty.

        @[JSON::Field(key: "container")]
        getter container : Types::ContainerDetail?

        # The Unix timestamp (in milliseconds) for when the job was created. For non-array jobs and parent
        # array jobs, this is when the job entered the SUBMITTED state. This is specifically at the time
        # SubmitJob was called. For array child jobs, this is when the child job was spawned by its parent and
        # entered the PENDING state.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64?

        # A list of job IDs that this job depends on.

        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(Types::JobDependency)?

        # An object with properties that are specific to Amazon ECS-based jobs.

        @[JSON::Field(key: "ecsProperties")]
        getter ecs_properties : Types::EcsPropertiesDetail?

        # A list of job attempts that are associated with this job.

        @[JSON::Field(key: "eksAttempts")]
        getter eks_attempts : Array(Types::EksAttemptDetail)?

        # An object with various properties that are specific to Amazon EKS based jobs.

        @[JSON::Field(key: "eksProperties")]
        getter eks_properties : Types::EksPropertiesDetail?

        # Indicates whether the job is canceled.

        @[JSON::Field(key: "isCancelled")]
        getter is_cancelled : Bool?

        # Indicates whether the job is terminated.

        @[JSON::Field(key: "isTerminated")]
        getter is_terminated : Bool?

        # The Amazon Resource Name (ARN) of the job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # An object that represents the details of a node that's associated with a multi-node parallel job.

        @[JSON::Field(key: "nodeDetails")]
        getter node_details : Types::NodeDetails?

        # An object that represents the node properties of a multi-node parallel job. This isn't applicable to
        # jobs that are running on Fargate resources.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Types::NodeProperties?

        # Additional parameters that are passed to the job that replace parameter substitution placeholders or
        # override any corresponding parameter defaults from the job definition.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The platform capabilities required by the job definition. If no value is specified, it defaults to
        # EC2 . Jobs run on Fargate resources specify FARGATE .

        @[JSON::Field(key: "platformCapabilities")]
        getter platform_capabilities : Array(String)?

        # Specifies whether to propagate the tags from the job or job definition to the corresponding Amazon
        # ECS task. If no value is specified, the tags aren't propagated. Tags can only be propagated to the
        # tasks when the tasks are created. For tags with the same name, job tags are given priority over job
        # definitions tags. If the total number of combined tags from the job and job definition is over 50,
        # the job is moved to the FAILED state.

        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : Bool?

        # The retry strategy to use for this job if an attempt fails.

        @[JSON::Field(key: "retryStrategy")]
        getter retry_strategy : Types::RetryStrategy?

        # The scheduling policy of the job definition. This only affects jobs in job queues with a fair-share
        # policy. Jobs with a higher scheduling priority are scheduled before jobs with a lower scheduling
        # priority.

        @[JSON::Field(key: "schedulingPriority")]
        getter scheduling_priority : Int32?

        # The share identifier for the job.

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String?

        # A short, human-readable string to provide more details for the current status of the job.
        # CAPACITY:INSUFFICIENT_INSTANCE_CAPACITY - All compute environments have insufficient capacity to
        # service the job. MISCONFIGURATION:COMPUTE_ENVIRONMENT_MAX_RESOURCE - All compute environments have a
        # maxVcpu setting that is smaller than the job requirements. MISCONFIGURATION:JOB_RESOURCE_REQUIREMENT
        # - All compute environments have no connected instances that meet the job requirements.
        # MISCONFIGURATION:SERVICE_ROLE_PERMISSIONS - All compute environments have problems with the service
        # role permissions.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp (in milliseconds) for when the job was stopped. More specifically, it's when the
        # job transitioned from the RUNNING state to a terminal state, such as SUCCEEDED or FAILED .

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        # The tags that are applied to the job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timeout configuration for the job.

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::JobTimeout?

        def initialize(
          @job_definition : String,
          @job_id : String,
          @job_name : String,
          @job_queue : String,
          @started_at : Int64,
          @status : String,
          @array_properties : Types::ArrayPropertiesDetail? = nil,
          @attempts : Array(Types::AttemptDetail)? = nil,
          @consumable_resource_properties : Types::ConsumableResourceProperties? = nil,
          @container : Types::ContainerDetail? = nil,
          @created_at : Int64? = nil,
          @depends_on : Array(Types::JobDependency)? = nil,
          @ecs_properties : Types::EcsPropertiesDetail? = nil,
          @eks_attempts : Array(Types::EksAttemptDetail)? = nil,
          @eks_properties : Types::EksPropertiesDetail? = nil,
          @is_cancelled : Bool? = nil,
          @is_terminated : Bool? = nil,
          @job_arn : String? = nil,
          @node_details : Types::NodeDetails? = nil,
          @node_properties : Types::NodeProperties? = nil,
          @parameters : Hash(String, String)? = nil,
          @platform_capabilities : Array(String)? = nil,
          @propagate_tags : Bool? = nil,
          @retry_strategy : Types::RetryStrategy? = nil,
          @scheduling_priority : Int32? = nil,
          @share_identifier : String? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Types::JobTimeout? = nil
        )
        end
      end

      # An object that represents the details for an Batch job queue.

      struct JobQueueDetail
        include JSON::Serializable

        # The compute environments that are attached to the job queue and the order that job placement is
        # preferred. Compute environments are selected for job placement in ascending order.

        @[JSON::Field(key: "computeEnvironmentOrder")]
        getter compute_environment_order : Array(Types::ComputeEnvironmentOrder)

        # The Amazon Resource Name (ARN) of the job queue.

        @[JSON::Field(key: "jobQueueArn")]
        getter job_queue_arn : String

        # The job queue name.

        @[JSON::Field(key: "jobQueueName")]
        getter job_queue_name : String

        # The priority of the job queue. Job queue priority determines the order that job queues are evaluated
        # when multiple queues dispatch jobs within a shared compute environment. A higher value for priority
        # indicates a higher priority. Queues are evaluated in cycles, in descending order by priority. For
        # example, a job queue with a priority value of 10 is evaluated before a queue with a priority value
        # of 1 . All of the compute environments must be either Amazon EC2 ( EC2 or SPOT ) or Fargate (
        # FARGATE or FARGATE_SPOT ). Amazon EC2 and Fargate compute environments can't be mixed. Job queue
        # priority doesn't guarantee that a particular job executes before a job in a lower priority queue.
        # Jobs added to higher priority queues during the queue evaluation cycle might not be evaluated until
        # the next cycle. A job is dispatched from a queue only if resources are available when the queue is
        # evaluated. If there are insufficient resources available at that time, the cycle proceeds to the
        # next queue. This means that jobs added to higher priority queues might have to wait for jobs in
        # multiple lower priority queues to complete before they are dispatched. You can use job dependencies
        # to control the order for jobs from queues with different priorities. For more information, see Job
        # Dependencies in the Batch User Guide .

        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # Describes the ability of the queue to accept new jobs. If the job queue state is ENABLED , it can
        # accept jobs. If the job queue state is DISABLED , new jobs can't be added to the queue, but jobs
        # already in the queue can finish.

        @[JSON::Field(key: "state")]
        getter state : String

        # The type of job queue. For service jobs that run on SageMaker Training, this value is
        # SAGEMAKER_TRAINING . For regular container jobs, this value is EKS , ECS , or ECS_FARGATE depending
        # on the compute environment.

        @[JSON::Field(key: "jobQueueType")]
        getter job_queue_type : String?

        # The set of actions that Batch perform on jobs that remain at the head of the job queue in the
        # specified state longer than specified times. Batch will perform each action after maxTimeSeconds has
        # passed.

        @[JSON::Field(key: "jobStateTimeLimitActions")]
        getter job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)?

        # The Amazon Resource Name (ARN) of the scheduling policy. The format is aws: Partition :batch: Region
        # : Account :scheduling-policy/ Name . For example,
        # aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy .

        @[JSON::Field(key: "schedulingPolicyArn")]
        getter scheduling_policy_arn : String?

        # The order of the service environment associated with the job queue. Job queues with a higher
        # priority are evaluated first when associated with the same service environment.

        @[JSON::Field(key: "serviceEnvironmentOrder")]
        getter service_environment_order : Array(Types::ServiceEnvironmentOrder)?

        # The status of the job queue (for example, CREATING or VALID ).

        @[JSON::Field(key: "status")]
        getter status : String?

        # A short, human-readable string to provide additional details for the current status of the job
        # queue.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The tags that are applied to the job queue. For more information, see Tagging your Batch resources
        # in Batch User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @compute_environment_order : Array(Types::ComputeEnvironmentOrder),
          @job_queue_arn : String,
          @job_queue_name : String,
          @priority : Int32,
          @state : String,
          @job_queue_type : String? = nil,
          @job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)? = nil,
          @scheduling_policy_arn : String? = nil,
          @service_environment_order : Array(Types::ServiceEnvironmentOrder)? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies an action that Batch will take after the job has remained at the head of the queue in the
      # specified state for longer than the specified time.

      struct JobStateTimeLimitAction
        include JSON::Serializable

        # The action to take when a job is at the head of the job queue in the specified state for the
        # specified period of time. The only supported value is CANCEL , which will cancel the job.

        @[JSON::Field(key: "action")]
        getter action : String

        # The approximate amount of time, in seconds, that must pass with the job in the specified state
        # before the action is taken. The minimum value is 600 (10 minutes) and the maximum value is 86,400
        # (24 hours).

        @[JSON::Field(key: "maxTimeSeconds")]
        getter max_time_seconds : Int32

        # The reason to log for the action being taken.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The state of the job needed to trigger the action. The only supported value is RUNNABLE .

        @[JSON::Field(key: "state")]
        getter state : String

        def initialize(
          @action : String,
          @max_time_seconds : Int32,
          @reason : String,
          @state : String
        )
        end
      end

      # An object that represents summary details of a job.

      struct JobSummary
        include JSON::Serializable

        # The job ID.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The job name.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The array properties of the job, if it's an array job.

        @[JSON::Field(key: "arrayProperties")]
        getter array_properties : Types::ArrayPropertiesSummary?

        # An object that represents the details of the container that's associated with the job.

        @[JSON::Field(key: "container")]
        getter container : Types::ContainerSummary?

        # The Unix timestamp (in milliseconds) for when the job was created. For non-array jobs and parent
        # array jobs, this is when the job entered the SUBMITTED state (at the time SubmitJob was called). For
        # array child jobs, this is when the child job was spawned by its parent and entered the PENDING
        # state.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64?

        # The Amazon Resource Name (ARN) of the job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The Amazon Resource Name (ARN) of the job definition.

        @[JSON::Field(key: "jobDefinition")]
        getter job_definition : String?

        # The node properties for a single node in a job summary list. This isn't applicable to jobs that are
        # running on Fargate resources.

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Types::NodePropertiesSummary?

        # The Unix timestamp for when the job was started. More specifically, it's when the job transitioned
        # from the STARTING state to the RUNNING state.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # The current status for the job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A short, human-readable string to provide more details for the current status of the job.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp for when the job was stopped. More specifically, it's when the job transitioned
        # from the RUNNING state to a terminal state, such as SUCCEEDED or FAILED .

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        def initialize(
          @job_id : String,
          @job_name : String,
          @array_properties : Types::ArrayPropertiesSummary? = nil,
          @container : Types::ContainerSummary? = nil,
          @created_at : Int64? = nil,
          @job_arn : String? = nil,
          @job_definition : String? = nil,
          @node_properties : Types::NodePropertiesSummary? = nil,
          @started_at : Int64? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil
        )
        end
      end

      # An object that represents a job timeout configuration.

      struct JobTimeout
        include JSON::Serializable

        # The job timeout time (in seconds) that's measured from the job attempt's startedAt timestamp. After
        # this time passes, Batch terminates your jobs if they aren't finished. The minimum value for the
        # timeout is 60 seconds. For array jobs, the timeout applies to the child jobs, not to the parent
        # array job. For multi-node parallel (MNP) jobs, the timeout applies to the whole job, not to the
        # individual nodes.

        @[JSON::Field(key: "attemptDurationSeconds")]
        getter attempt_duration_seconds : Int32?

        def initialize(
          @attempt_duration_seconds : Int32? = nil
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

      # A filter name and value pair that's used to return a more specific list of results from a ListJobs
      # or ListJobsByConsumableResource API operation.

      struct KeyValuesPair
        include JSON::Serializable

        # The name of the filter. Filter names are case sensitive.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The filter values.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Information about the latest attempt of a service job. A Service job can transition from SCHEDULED
      # back to RUNNABLE state when they encounter capacity constraints.

      struct LatestServiceJobAttempt
        include JSON::Serializable

        # The service resource identifier associated with the service job attempt.

        @[JSON::Field(key: "serviceResourceId")]
        getter service_resource_id : Types::ServiceResourceId?

        def initialize(
          @service_resource_id : Types::ServiceResourceId? = nil
        )
        end
      end

      # An object that represents a launch template that's associated with a compute resource. You must
      # specify either the launch template ID or launch template name in the request, but not both. If
      # security groups are specified using both the securityGroupIds parameter of CreateComputeEnvironment
      # and the launch template, the values in the securityGroupIds parameter of CreateComputeEnvironment
      # will be used. This object isn't applicable to jobs that are running on Fargate resources.

      struct LaunchTemplateSpecification
        include JSON::Serializable

        # The ID of the launch template.

        @[JSON::Field(key: "launchTemplateId")]
        getter launch_template_id : String?

        # The name of the launch template.

        @[JSON::Field(key: "launchTemplateName")]
        getter launch_template_name : String?

        # A launch template to use in place of the default launch template. You must specify either the launch
        # template ID or launch template name in the request, but not both. You can specify up to ten (10)
        # launch template overrides that are associated to unique instance types or families for each compute
        # environment. To unset all override templates for a compute environment, you can pass an empty array
        # to the UpdateComputeEnvironment.overrides parameter, or not include the overrides parameter when
        # submitting the UpdateComputeEnvironment API operation.

        @[JSON::Field(key: "overrides")]
        getter overrides : Array(Types::LaunchTemplateSpecificationOverride)?

        # The EKS node initialization process to use. You only need to specify this value if you are using a
        # custom AMI. The default value is EKS_BOOTSTRAP_SH . If imageType is a custom AMI based on EKS_AL2023
        # or EKS_AL2023_NVIDIA then you must choose EKS_NODEADM .

        @[JSON::Field(key: "userdataType")]
        getter userdata_type : String?

        # The version number of the launch template, $Default , or $Latest . If the value is $Default , the
        # default version of the launch template is used. If the value is $Latest , the latest version of the
        # launch template is used. If the AMI ID that's used in a compute environment is from the launch
        # template, the AMI isn't changed when the compute environment is updated. It's only changed if the
        # updateToLatestImageVersion parameter for the compute environment is set to true . During an
        # infrastructure update, if either $Default or $Latest is specified, Batch re-evaluates the launch
        # template version, and it might use a different version of the launch template. This is the case even
        # if the launch template isn't specified in the update. When updating a compute environment, changing
        # the launch template requires an infrastructure update of the compute environment. For more
        # information, see Updating compute environments in the Batch User Guide . Default: $Default Latest:
        # $Latest

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @launch_template_id : String? = nil,
          @launch_template_name : String? = nil,
          @overrides : Array(Types::LaunchTemplateSpecificationOverride)? = nil,
          @userdata_type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # An object that represents a launch template to use in place of the default launch template. You must
      # specify either the launch template ID or launch template name in the request, but not both. If
      # security groups are specified using both the securityGroupIds parameter of CreateComputeEnvironment
      # and the launch template, the values in the securityGroupIds parameter of CreateComputeEnvironment
      # will be used. You can define up to ten (10) overrides for each compute environment. This object
      # isn't applicable to jobs that are running on Fargate resources. To unset all override templates for
      # a compute environment, you can pass an empty array to the UpdateComputeEnvironment.overrides
      # parameter, or not include the overrides parameter when submitting the UpdateComputeEnvironment API
      # operation.

      struct LaunchTemplateSpecificationOverride
        include JSON::Serializable

        # The ID of the launch template. Note: If you specify the launchTemplateId you can't specify the
        # launchTemplateName as well.

        @[JSON::Field(key: "launchTemplateId")]
        getter launch_template_id : String?

        # The name of the launch template. Note: If you specify the launchTemplateName you can't specify the
        # launchTemplateId as well.

        @[JSON::Field(key: "launchTemplateName")]
        getter launch_template_name : String?

        # The instance type or family that this override launch template should be applied to. This parameter
        # is required when defining a launch template override. Information included in this parameter must
        # meet the following requirements: Must be a valid Amazon EC2 instance type or family. The following
        # Batch InstanceTypes are not allowed: optimal , default_x86_64 , and default_arm64 .
        # targetInstanceTypes can target only instance types and families that are included within the
        # ComputeResource.instanceTypes set. targetInstanceTypes doesn't need to include all of the instances
        # from the instanceType set, but at least a subset. For example, if ComputeResource.instanceTypes
        # includes [m5, g5] , targetInstanceTypes can include [m5.2xlarge] and [m5.large] but not [c5.large] .
        # targetInstanceTypes included within the same launch template override or across launch template
        # overrides can't overlap for the same compute environment. For example, you can't define one launch
        # template override to target an instance family and another define an instance type within this same
        # family.

        @[JSON::Field(key: "targetInstanceTypes")]
        getter target_instance_types : Array(String)?

        # The EKS node initialization process to use. You only need to specify this value if you are using a
        # custom AMI. The default value is EKS_BOOTSTRAP_SH . If imageType is a custom AMI based on EKS_AL2023
        # or EKS_AL2023_NVIDIA then you must choose EKS_NODEADM .

        @[JSON::Field(key: "userdataType")]
        getter userdata_type : String?

        # The version number of the launch template, $Default , or $Latest . If the value is $Default , the
        # default version of the launch template is used. If the value is $Latest , the latest version of the
        # launch template is used. If the AMI ID that's used in a compute environment is from the launch
        # template, the AMI isn't changed when the compute environment is updated. It's only changed if the
        # updateToLatestImageVersion parameter for the compute environment is set to true . During an
        # infrastructure update, if either $Default or $Latest is specified, Batch re-evaluates the launch
        # template version, and it might use a different version of the launch template. This is the case even
        # if the launch template isn't specified in the update. When updating a compute environment, changing
        # the launch template requires an infrastructure update of the compute environment. For more
        # information, see Updating compute environments in the Batch User Guide . Default: $Default Latest:
        # $Latest

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @launch_template_id : String? = nil,
          @launch_template_name : String? = nil,
          @target_instance_types : Array(String)? = nil,
          @userdata_type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Linux-specific modifications that are applied to the container, such as details for device mappings.

      struct LinuxParameters
        include JSON::Serializable

        # Any of the host devices to expose to the container. This parameter maps to Devices in the Create a
        # container section of the Docker Remote API and the --device option to docker run . This parameter
        # isn't applicable to jobs that are running on Fargate resources. Don't provide it for these jobs.

        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::Device)?

        # If true, run an init process inside the container that forwards signals and reaps processes. This
        # parameter maps to the --init option to docker run . This parameter requires version 1.25 of the
        # Docker Remote API or greater on your container instance. To check the Docker Remote API version on
        # your container instance, log in to your container instance and run the following command: sudo
        # docker version | grep "Server API version"

        @[JSON::Field(key: "initProcessEnabled")]
        getter init_process_enabled : Bool?

        # The total amount of swap memory (in MiB) a container can use. This parameter is translated to the
        # --memory-swap option to docker run where the value is the sum of the container memory plus the
        # maxSwap value. For more information, see --memory-swap details in the Docker documentation. If a
        # maxSwap value of 0 is specified, the container doesn't use swap. Accepted values are 0 or any
        # positive integer. If the maxSwap parameter is omitted, the container doesn't use the swap
        # configuration for the container instance on which it runs. A maxSwap value must be set for the
        # swappiness parameter to be used. This parameter isn't applicable to jobs that are running on Fargate
        # resources. Don't provide it for these jobs.

        @[JSON::Field(key: "maxSwap")]
        getter max_swap : Int32?

        # The value for the size (in MiB) of the /dev/shm volume. This parameter maps to the --shm-size option
        # to docker run . This parameter isn't applicable to jobs that are running on Fargate resources. Don't
        # provide it for these jobs.

        @[JSON::Field(key: "sharedMemorySize")]
        getter shared_memory_size : Int32?

        # You can use this parameter to tune a container's memory swappiness behavior. A swappiness value of 0
        # causes swapping to not occur unless absolutely necessary. A swappiness value of 100 causes pages to
        # be swapped aggressively. Valid values are whole numbers between 0 and 100 . If the swappiness
        # parameter isn't specified, a default value of 60 is used. If a value isn't specified for maxSwap ,
        # then this parameter is ignored. If maxSwap is set to 0, the container doesn't use swap. This
        # parameter maps to the --memory-swappiness option to docker run . Consider the following when you use
        # a per-container swap configuration. Swap space must be enabled and allocated on the container
        # instance for the containers to use. By default, the Amazon ECS optimized AMIs don't have swap
        # enabled. You must enable swap on the instance to use this feature. For more information, see
        # Instance store swap volumes in the Amazon EC2 User Guide for Linux Instances or How do I allocate
        # memory to work as swap space in an Amazon EC2 instance by using a swap file? The swap space
        # parameters are only supported for job definitions using EC2 resources. If the maxSwap and swappiness
        # parameters are omitted from a job definition, each container has a default swappiness value of 60.
        # Moreover, the total swap usage is limited to two times the memory reservation of the container. This
        # parameter isn't applicable to jobs that are running on Fargate resources. Don't provide it for these
        # jobs.

        @[JSON::Field(key: "swappiness")]
        getter swappiness : Int32?

        # The container path, mount options, and size (in MiB) of the tmpfs mount. This parameter maps to the
        # --tmpfs option to docker run . This parameter isn't applicable to jobs that are running on Fargate
        # resources. Don't provide this parameter for this resource type.

        @[JSON::Field(key: "tmpfs")]
        getter tmpfs : Array(Types::Tmpfs)?

        def initialize(
          @devices : Array(Types::Device)? = nil,
          @init_process_enabled : Bool? = nil,
          @max_swap : Int32? = nil,
          @shared_memory_size : Int32? = nil,
          @swappiness : Int32? = nil,
          @tmpfs : Array(Types::Tmpfs)? = nil
        )
        end
      end


      struct ListConsumableResourcesRequest
        include JSON::Serializable

        # The filters to apply to the consumable resource list query. If used, only those consumable resources
        # that match the filter are listed. Filter names and values can be: name: CONSUMABLE_RESOURCE_NAME
        # values: case-insensitive matches for the consumable resource name. If a filter value ends with an
        # asterisk (*), it matches any consumable resource name that begins with the string before the '*'.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::KeyValuesPair)?

        # The maximum number of results returned by ListConsumableResources in paginated output. When this
        # parameter is used, ListConsumableResources only returns maxResults results in a single page and a
        # nextToken response element. The remaining results of the initial request can be seen by sending
        # another ListConsumableResources request with the returned nextToken value. This value can be between
        # 1 and 100. If this parameter isn't used, then ListConsumableResources returns up to 100 results and
        # a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListConsumableResources request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. Treat this token as an opaque identifier that's only used to retrieve the
        # next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::KeyValuesPair)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConsumableResourcesResponse
        include JSON::Serializable

        # A list of consumable resources that match the request.

        @[JSON::Field(key: "consumableResources")]
        getter consumable_resources : Array(Types::ConsumableResourceSummary)

        # The nextToken value to include in a future ListConsumableResources request. When the results of a
        # ListConsumableResources request exceed maxResults , this value can be used to retrieve the next page
        # of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @consumable_resources : Array(Types::ConsumableResourceSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListJobsByConsumableResourceRequest
        include JSON::Serializable

        # The name or ARN of the consumable resource.

        @[JSON::Field(key: "consumableResource")]
        getter consumable_resource : String

        # The filters to apply to the job list query. If used, only those jobs requiring the specified
        # consumable resource ( consumableResource ) and that match the value of the filters are listed. The
        # filter names and values can be: name: JOB_STATUS values: SUBMITTED | PENDING | RUNNABLE | STARTING |
        # RUNNING | SUCCEEDED | FAILED name: JOB_NAME The values are case-insensitive matches for the job
        # name. If a filter value ends with an asterisk (*), it matches any job name that begins with the
        # string before the '*'.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::KeyValuesPair)?

        # The maximum number of results returned by ListJobsByConsumableResource in paginated output. When
        # this parameter is used, ListJobsByConsumableResource only returns maxResults results in a single
        # page and a nextToken response element. The remaining results of the initial request can be seen by
        # sending another ListJobsByConsumableResource request with the returned nextToken value. This value
        # can be between 1 and 100. If this parameter isn't used, then ListJobsByConsumableResource returns up
        # to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListJobsByConsumableResource request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. Treat this token as an opaque identifier that's only used to retrieve the
        # next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @consumable_resource : String,
          @filters : Array(Types::KeyValuesPair)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListJobsByConsumableResourceResponse
        include JSON::Serializable

        # The list of jobs that require the specified consumable resources.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::ListJobsByConsumableResourceSummary)

        # The nextToken value to include in a future ListJobsByConsumableResource request. When the results of
        # a ListJobsByConsumableResource request exceed maxResults , this value can be used to retrieve the
        # next page of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::ListJobsByConsumableResourceSummary),
          @next_token : String? = nil
        )
        end
      end

      # Current information about a consumable resource required by a job.

      struct ListJobsByConsumableResourceSummary
        include JSON::Serializable

        # Contains a list of consumable resources required by the job.

        @[JSON::Field(key: "consumableResourceProperties")]
        getter consumable_resource_properties : Types::ConsumableResourceProperties

        # The Unix timestamp (in milliseconds) for when the consumable resource was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64

        # The Amazon Resource Name (ARN) of the job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name of the job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The Amazon Resource Name (ARN) of the job queue.

        @[JSON::Field(key: "jobQueueArn")]
        getter job_queue_arn : String

        # The status of the job. Can be one of: SUBMITTED PENDING RUNNABLE STARTING RUNNING SUCCEEDED FAILED

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String

        # The total amount of the consumable resource that is available.

        @[JSON::Field(key: "quantity")]
        getter quantity : Int64

        # The Amazon Resource Name (ARN) of the job definition.

        @[JSON::Field(key: "jobDefinitionArn")]
        getter job_definition_arn : String?

        # The fair-share scheduling policy identifier for the job.

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String?

        # The Unix timestamp for when the job was started. More specifically, it's when the job transitioned
        # from the STARTING state to the RUNNING state.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # A short, human-readable string to provide more details for the current status of the job.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @consumable_resource_properties : Types::ConsumableResourceProperties,
          @created_at : Int64,
          @job_arn : String,
          @job_name : String,
          @job_queue_arn : String,
          @job_status : String,
          @quantity : Int64,
          @job_definition_arn : String? = nil,
          @share_identifier : String? = nil,
          @started_at : Int64? = nil,
          @status_reason : String? = nil
        )
        end
      end

      # Contains the parameters for ListJobs .

      struct ListJobsRequest
        include JSON::Serializable

        # The job ID for an array job. Specifying an array job ID with this parameter lists all child jobs
        # from within the specified array.

        @[JSON::Field(key: "arrayJobId")]
        getter array_job_id : String?

        # The filter to apply to the query. Only one filter can be used at a time. When the filter is used,
        # jobStatus is ignored. The filter doesn't apply to child jobs in an array or multi-node parallel
        # (MNP) jobs. The results are sorted by the createdAt field, with the most recent jobs being first.
        # JOB_NAME The value of the filter is a case-insensitive match for the job name. If the value ends
        # with an asterisk (*), the filter matches any job name that begins with the string before the '*'.
        # This corresponds to the jobName value. For example, test1 matches both Test1 and test1 , and test1*
        # matches both test1 and Test10 . When the JOB_NAME filter is used, the results are grouped by the job
        # name and version. JOB_DEFINITION The value for the filter is the name or Amazon Resource Name (ARN)
        # of the job definition. This corresponds to the jobDefinition value. The value is case sensitive.
        # When the value for the filter is the job definition name, the results include all the jobs that used
        # any revision of that job definition name. If the value ends with an asterisk (*), the filter matches
        # any job definition name that begins with the string before the '*'. For example, jd1 matches only
        # jd1 , and jd1* matches both jd1 and jd1A . The version of the job definition that's used doesn't
        # affect the sort order. When the JOB_DEFINITION filter is used and the ARN is used (which is in the
        # form arn:${Partition}:batch:${Region}:${Account}:job-definition/${JobDefinitionName}:${Revision} ),
        # the results include jobs that used the specified revision of the job definition. Asterisk (*) isn't
        # supported when the ARN is used. BEFORE_CREATED_AT The value for the filter is the time that's before
        # the job was created. This corresponds to the createdAt value. The value is a string representation
        # of the number of milliseconds since 00:00:00 UTC (midnight) on January 1, 1970. AFTER_CREATED_AT The
        # value for the filter is the time that's after the job was created. This corresponds to the createdAt
        # value. The value is a string representation of the number of milliseconds since 00:00:00 UTC
        # (midnight) on January 1, 1970.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::KeyValuesPair)?

        # The name or full Amazon Resource Name (ARN) of the job queue used to list jobs.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String?

        # The job status used to filter jobs in the specified queue. If the filters parameter is specified,
        # the jobStatus parameter is ignored and jobs with any status are returned. If you don't specify a
        # status, only RUNNING jobs are returned.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String?

        # The maximum number of results returned by ListJobs in a paginated output. When this parameter is
        # used, ListJobs returns up to maxResults results in a single page and a nextToken response element,
        # if applicable. The remaining results of the initial request can be seen by sending another ListJobs
        # request with the returned nextToken value. The following outlines key parameters and limitations:
        # The minimum value is 1. When --job-status is used, Batch returns up to 1000 values. When --filters
        # is used, Batch returns up to 100 values. If neither parameter is used, then ListJobs returns up to
        # 1000 results (jobs that are in the RUNNING status) and a nextToken value, if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The job ID for a multi-node parallel job. Specifying a multi-node parallel job ID with this
        # parameter lists all nodes that are associated with the specified job.

        @[JSON::Field(key: "multiNodeJobId")]
        getter multi_node_job_id : String?

        # The nextToken value returned from a previous paginated ListJobs request where maxResults was used
        # and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value. This value is null when there are no more
        # results to return. Treat this token as an opaque identifier that's only used to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @array_job_id : String? = nil,
          @filters : Array(Types::KeyValuesPair)? = nil,
          @job_queue : String? = nil,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @multi_node_job_id : String? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListJobsResponse
        include JSON::Serializable

        # A list of job summaries that match the request.

        @[JSON::Field(key: "jobSummaryList")]
        getter job_summary_list : Array(Types::JobSummary)

        # The nextToken value to include in a future ListJobs request. When the results of a ListJobs request
        # exceed maxResults , this value can be used to retrieve the next page of results. This value is null
        # when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_summary_list : Array(Types::JobSummary),
          @next_token : String? = nil
        )
        end
      end

      # Contains the parameters for ListSchedulingPolicies .

      struct ListSchedulingPoliciesRequest
        include JSON::Serializable

        # The maximum number of results that's returned by ListSchedulingPolicies in paginated output. When
        # this parameter is used, ListSchedulingPolicies only returns maxResults results in a single page and
        # a nextToken response element. You can see the remaining results of the initial request by sending
        # another ListSchedulingPolicies request with the returned nextToken value. This value can be between
        # 1 and 100. If this parameter isn't used, ListSchedulingPolicies returns up to 100 results and a
        # nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value that's returned from a previous paginated ListSchedulingPolicies request where
        # maxResults was used and the results exceeded the value of that parameter. Pagination continues from
        # the end of the previous results that returned the nextToken value. This value is null when there are
        # no more results to return. Treat this token as an opaque identifier that's only used to retrieve the
        # next items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSchedulingPoliciesResponse
        include JSON::Serializable

        # The nextToken value to include in a future ListSchedulingPolicies request. When the results of a
        # ListSchedulingPolicies request exceed maxResults , this value can be used to retrieve the next page
        # of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of scheduling policies that match the request.

        @[JSON::Field(key: "schedulingPolicies")]
        getter scheduling_policies : Array(Types::SchedulingPolicyListingDetail)?

        def initialize(
          @next_token : String? = nil,
          @scheduling_policies : Array(Types::SchedulingPolicyListingDetail)? = nil
        )
        end
      end


      struct ListServiceJobsRequest
        include JSON::Serializable

        # The filter to apply to the query. Only one filter can be used at a time. When the filter is used,
        # jobStatus is ignored. The results are sorted by the createdAt field, with the most recent jobs being
        # first. JOB_NAME The value of the filter is a case-insensitive match for the job name. If the value
        # ends with an asterisk (*), the filter matches any job name that begins with the string before the
        # '*'. This corresponds to the jobName value. For example, test1 matches both Test1 and test1 , and
        # test1* matches both test1 and Test10 . When the JOB_NAME filter is used, the results are grouped by
        # the job name and version. BEFORE_CREATED_AT The value for the filter is the time that's before the
        # job was created. This corresponds to the createdAt value. The value is a string representation of
        # the number of milliseconds since 00:00:00 UTC (midnight) on January 1, 1970. AFTER_CREATED_AT The
        # value for the filter is the time that's after the job was created. This corresponds to the createdAt
        # value. The value is a string representation of the number of milliseconds since 00:00:00 UTC
        # (midnight) on January 1, 1970.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::KeyValuesPair)?

        # The name or ARN of the job queue with which to list service jobs.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String?

        # The job status with which to filter service jobs.

        @[JSON::Field(key: "jobStatus")]
        getter job_status : String?

        # The maximum number of results returned by ListServiceJobs in paginated output. When this parameter
        # is used, ListServiceJobs only returns maxResults results in a single page and a nextToken response
        # element. The remaining results of the initial request can be seen by sending another ListServiceJobs
        # request with the returned nextToken value. This value can be between 1 and 100. If this parameter
        # isn't used, then ListServiceJobs returns up to 100 results and a nextToken value if applicable.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The nextToken value returned from a previous paginated ListServiceJobs request where maxResults was
        # used and the results exceeded the value of that parameter. Pagination continues from the end of the
        # previous results that returned the nextToken value. This value is null when there are no more
        # results to return. Treat this token as an opaque identifier that's only used to retrieve the next
        # items in a list and not for other programmatic purposes.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::KeyValuesPair)? = nil,
          @job_queue : String? = nil,
          @job_status : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListServiceJobsResponse
        include JSON::Serializable

        # A list of service job summaries.

        @[JSON::Field(key: "jobSummaryList")]
        getter job_summary_list : Array(Types::ServiceJobSummary)

        # The nextToken value to include in a future ListServiceJobs request. When the results of a
        # ListServiceJobs request exceed maxResults , this value can be used to retrieve the next page of
        # results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_summary_list : Array(Types::ServiceJobSummary),
          @next_token : String? = nil
        )
        end
      end

      # Contains the parameters for ListTagsForResource .

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource that tags are listed for. Batch
        # resources that support tags are compute environments, jobs, job definitions, job queues, and
        # scheduling policies. ARNs for child jobs of array and multi-node parallel (MNP) jobs aren't
        # supported.

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
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Log configuration options to send to a custom log driver for the container.

      struct LogConfiguration
        include JSON::Serializable

        # The log driver to use for the container. The valid values that are listed for this parameter are log
        # drivers that the Amazon ECS container agent can communicate with by default. The supported log
        # drivers are awsfirelens , awslogs , fluentd , gelf , json-file , journald , logentries , syslog ,
        # and splunk . Jobs that are running on Fargate resources are restricted to the awslogs and splunk log
        # drivers. awsfirelens Specifies the firelens logging driver. For more information on configuring
        # Firelens, see Send Amazon ECS logs to an Amazon Web Services service or Amazon Web Services Partner
        # in the Amazon Elastic Container Service Developer Guide . awslogs Specifies the Amazon CloudWatch
        # Logs logging driver. For more information, see Using the awslogs log driver in the Batch User Guide
        # and Amazon CloudWatch Logs logging driver in the Docker documentation. fluentd Specifies the Fluentd
        # logging driver. For more information including usage and options, see Fluentd logging driver in the
        # Docker documentation . gelf Specifies the Graylog Extended Format (GELF) logging driver. For more
        # information including usage and options, see Graylog Extended Format logging driver in the Docker
        # documentation . journald Specifies the journald logging driver. For more information including usage
        # and options, see Journald logging driver in the Docker documentation . json-file Specifies the JSON
        # file logging driver. For more information including usage and options, see JSON File logging driver
        # in the Docker documentation . splunk Specifies the Splunk logging driver. For more information
        # including usage and options, see Splunk logging driver in the Docker documentation . syslog
        # Specifies the syslog logging driver. For more information including usage and options, see Syslog
        # logging driver in the Docker documentation . If you have a custom driver that's not listed earlier
        # that you want to work with the Amazon ECS container agent, you can fork the Amazon ECS container
        # agent project that's available on GitHub and customize it to work with that driver. We encourage you
        # to submit pull requests for changes that you want to have included. However, Amazon Web Services
        # doesn't currently support running modified copies of this software. This parameter requires version
        # 1.18 of the Docker Remote API or greater on your container instance. To check the Docker Remote API
        # version on your container instance, log in to your container instance and run the following command:
        # sudo docker version | grep "Server API version"

        @[JSON::Field(key: "logDriver")]
        getter log_driver : String

        # The configuration options to send to the log driver. This parameter requires version 1.19 of the
        # Docker Remote API or greater on your container instance. To check the Docker Remote API version on
        # your container instance, log in to your container instance and run the following command: sudo
        # docker version | grep "Server API version"

        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        # The secrets to pass to the log configuration. For more information, see Specifying sensitive data in
        # the Batch User Guide .

        @[JSON::Field(key: "secretOptions")]
        getter secret_options : Array(Types::Secret)?

        def initialize(
          @log_driver : String,
          @options : Hash(String, String)? = nil,
          @secret_options : Array(Types::Secret)? = nil
        )
        end
      end

      # Details for a Docker volume mount point that's used in a job's container properties. This parameter
      # maps to Volumes in the Create a container section of the Docker Remote API and the --volume option
      # to docker run.

      struct MountPoint
        include JSON::Serializable

        # The path on the container where the host volume is mounted.

        @[JSON::Field(key: "containerPath")]
        getter container_path : String?

        # If this value is true , the container has read-only access to the volume. Otherwise, the container
        # can write to the volume. The default value is false .

        @[JSON::Field(key: "readOnly")]
        getter read_only : Bool?

        # The name of the volume to mount.

        @[JSON::Field(key: "sourceVolume")]
        getter source_volume : String?

        def initialize(
          @container_path : String? = nil,
          @read_only : Bool? = nil,
          @source_volume : String? = nil
        )
        end
      end

      # The network configuration for jobs that are running on Fargate resources. Jobs that are running on
      # Amazon EC2 resources must not specify this parameter.

      struct NetworkConfiguration
        include JSON::Serializable

        # Indicates whether the job has a public IP address. For a job that's running on Fargate resources in
        # a private subnet to send outbound traffic to the internet (for example, to pull container images),
        # the private subnet requires a NAT gateway be attached to route requests to the internet. For more
        # information, see Amazon ECS task networking in the Amazon Elastic Container Service Developer Guide
        # . The default value is " DISABLED ".

        @[JSON::Field(key: "assignPublicIp")]
        getter assign_public_ip : String?

        def initialize(
          @assign_public_ip : String? = nil
        )
        end
      end

      # An object that represents the elastic network interface for a multi-node parallel job node.

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

      # An object that represents the details of a multi-node parallel job node.

      struct NodeDetails
        include JSON::Serializable

        # Specifies whether the current node is the main node for a multi-node parallel job.

        @[JSON::Field(key: "isMainNode")]
        getter is_main_node : Bool?

        # The node index for the node. Node index numbering starts at zero. This index is also available on
        # the node with the AWS_BATCH_JOB_NODE_INDEX environment variable.

        @[JSON::Field(key: "nodeIndex")]
        getter node_index : Int32?

        def initialize(
          @is_main_node : Bool? = nil,
          @node_index : Int32? = nil
        )
        end
      end

      # An object that represents any node overrides to a job definition that's used in a SubmitJob API
      # operation. This parameter isn't applicable to jobs that are running on Fargate resources. Don't
      # provide it for these jobs. Rather, use containerOverrides instead.

      struct NodeOverrides
        include JSON::Serializable

        # The node property overrides for the job.

        @[JSON::Field(key: "nodePropertyOverrides")]
        getter node_property_overrides : Array(Types::NodePropertyOverride)?

        # The number of nodes to use with a multi-node parallel job. This value overrides the number of nodes
        # that are specified in the job definition. To use this override, you must meet the following
        # conditions: There must be at least one node range in your job definition that has an open upper
        # boundary, such as : or n: . The lower boundary of the node range that's specified in the job
        # definition must be fewer than the number of nodes specified in the override. The main node index
        # that's specified in the job definition must be fewer than the number of nodes specified in the
        # override.

        @[JSON::Field(key: "numNodes")]
        getter num_nodes : Int32?

        def initialize(
          @node_property_overrides : Array(Types::NodePropertyOverride)? = nil,
          @num_nodes : Int32? = nil
        )
        end
      end

      # An object that represents the node properties of a multi-node parallel job. Node properties can't be
      # specified for Amazon EKS based job definitions.

      struct NodeProperties
        include JSON::Serializable

        # Specifies the node index for the main node of a multi-node parallel job. This node index value must
        # be fewer than the number of nodes.

        @[JSON::Field(key: "mainNode")]
        getter main_node : Int32

        # A list of node ranges and their properties that are associated with a multi-node parallel job.

        @[JSON::Field(key: "nodeRangeProperties")]
        getter node_range_properties : Array(Types::NodeRangeProperty)

        # The number of nodes that are associated with a multi-node parallel job.

        @[JSON::Field(key: "numNodes")]
        getter num_nodes : Int32

        def initialize(
          @main_node : Int32,
          @node_range_properties : Array(Types::NodeRangeProperty),
          @num_nodes : Int32
        )
        end
      end

      # An object that represents the properties of a node that's associated with a multi-node parallel job.

      struct NodePropertiesSummary
        include JSON::Serializable

        # Specifies whether the current node is the main node for a multi-node parallel job.

        @[JSON::Field(key: "isMainNode")]
        getter is_main_node : Bool?

        # The node index for the node. Node index numbering begins at zero. This index is also available on
        # the node with the AWS_BATCH_JOB_NODE_INDEX environment variable.

        @[JSON::Field(key: "nodeIndex")]
        getter node_index : Int32?

        # The number of nodes that are associated with a multi-node parallel job.

        @[JSON::Field(key: "numNodes")]
        getter num_nodes : Int32?

        def initialize(
          @is_main_node : Bool? = nil,
          @node_index : Int32? = nil,
          @num_nodes : Int32? = nil
        )
        end
      end

      # The object that represents any node overrides to a job definition that's used in a SubmitJob API
      # operation.

      struct NodePropertyOverride
        include JSON::Serializable

        # The range of nodes, using node index values, that's used to override. A range of 0:3 indicates nodes
        # with index values of 0 through 3 . If the starting range value is omitted ( :n ), then 0 is used to
        # start the range. If the ending range value is omitted ( n: ), then the highest possible node index
        # is used to end the range.

        @[JSON::Field(key: "targetNodes")]
        getter target_nodes : String

        # An object that contains overrides for the consumable resources of a job.

        @[JSON::Field(key: "consumableResourcePropertiesOverride")]
        getter consumable_resource_properties_override : Types::ConsumableResourceProperties?

        # The overrides that are sent to a node range.

        @[JSON::Field(key: "containerOverrides")]
        getter container_overrides : Types::ContainerOverrides?

        # An object that contains the properties that you want to replace for the existing Amazon ECS
        # resources of a job.

        @[JSON::Field(key: "ecsPropertiesOverride")]
        getter ecs_properties_override : Types::EcsPropertiesOverride?

        # An object that contains the properties that you want to replace for the existing Amazon EKS
        # resources of a job.

        @[JSON::Field(key: "eksPropertiesOverride")]
        getter eks_properties_override : Types::EksPropertiesOverride?

        # An object that contains the instance types that you want to replace for the existing resources of a
        # job.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        def initialize(
          @target_nodes : String,
          @consumable_resource_properties_override : Types::ConsumableResourceProperties? = nil,
          @container_overrides : Types::ContainerOverrides? = nil,
          @ecs_properties_override : Types::EcsPropertiesOverride? = nil,
          @eks_properties_override : Types::EksPropertiesOverride? = nil,
          @instance_types : Array(String)? = nil
        )
        end
      end

      # This is an object that represents the properties of the node range for a multi-node parallel job.

      struct NodeRangeProperty
        include JSON::Serializable

        # The range of nodes, using node index values. A range of 0:3 indicates nodes with index values of 0
        # through 3 . If the starting range value is omitted ( :n ), then 0 is used to start the range. If the
        # ending range value is omitted ( n: ), then the highest possible node index is used to end the range.
        # Your accumulative node ranges must account for all nodes ( 0:n ). You can nest node ranges (for
        # example, 0:10 and 4:5 ). In this case, the 4:5 range properties override the 0:10 properties.

        @[JSON::Field(key: "targetNodes")]
        getter target_nodes : String

        # Contains a list of consumable resources required by a job.

        @[JSON::Field(key: "consumableResourceProperties")]
        getter consumable_resource_properties : Types::ConsumableResourceProperties?

        # The container details for the node range.

        @[JSON::Field(key: "container")]
        getter container : Types::ContainerProperties?

        # This is an object that represents the properties of the node range for a multi-node parallel job.

        @[JSON::Field(key: "ecsProperties")]
        getter ecs_properties : Types::EcsProperties?

        # This is an object that represents the properties of the node range for a multi-node parallel job.

        @[JSON::Field(key: "eksProperties")]
        getter eks_properties : Types::EksProperties?

        # The instance types of the underlying host infrastructure of a multi-node parallel job. This
        # parameter isn't applicable to jobs that are running on Fargate resources. In addition, this list
        # object is currently limited to one element.

        @[JSON::Field(key: "instanceTypes")]
        getter instance_types : Array(String)?

        def initialize(
          @target_nodes : String,
          @consumable_resource_properties : Types::ConsumableResourceProperties? = nil,
          @container : Types::ContainerProperties? = nil,
          @ecs_properties : Types::EcsProperties? = nil,
          @eks_properties : Types::EksProperties? = nil,
          @instance_types : Array(String)? = nil
        )
        end
      end

      # Contains the parameters for RegisterJobDefinition .

      struct RegisterJobDefinitionRequest
        include JSON::Serializable

        # The name of the job definition to register. It can be up to 128 letters long. It can contain
        # uppercase and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "jobDefinitionName")]
        getter job_definition_name : String

        # The type of job definition. For more information about multi-node parallel jobs, see Creating a
        # multi-node parallel job definition in the Batch User Guide . If the value is container , then one of
        # the following is required: containerProperties , ecsProperties , or eksProperties . If the value is
        # multinode , then nodeProperties is required. If the job is run on Fargate resources, then multinode
        # isn't supported.

        @[JSON::Field(key: "type")]
        getter type : String

        # Contains a list of consumable resources required by the job.

        @[JSON::Field(key: "consumableResourceProperties")]
        getter consumable_resource_properties : Types::ConsumableResourceProperties?

        # An object with properties specific to Amazon ECS-based single-node container-based jobs. If the job
        # definition's type parameter is container , then you must specify either containerProperties or
        # nodeProperties . This must not be specified for Amazon EKS-based job definitions. If the job runs on
        # Fargate resources, then you must not specify nodeProperties ; use only containerProperties .

        @[JSON::Field(key: "containerProperties")]
        getter container_properties : Types::ContainerProperties?

        # An object with properties that are specific to Amazon ECS-based jobs. This must not be specified for
        # Amazon EKS-based job definitions.

        @[JSON::Field(key: "ecsProperties")]
        getter ecs_properties : Types::EcsProperties?

        # An object with properties that are specific to Amazon EKS-based jobs. This must not be specified for
        # Amazon ECS based job definitions.

        @[JSON::Field(key: "eksProperties")]
        getter eks_properties : Types::EksProperties?

        # An object with properties specific to multi-node parallel jobs. If you specify node properties for a
        # job, it becomes a multi-node parallel job. For more information, see Multi-node Parallel Jobs in the
        # Batch User Guide . If the job runs on Fargate resources, then you must not specify nodeProperties ;
        # use containerProperties instead. If the job runs on Amazon EKS resources, then you must not specify
        # nodeProperties .

        @[JSON::Field(key: "nodeProperties")]
        getter node_properties : Types::NodeProperties?

        # Default parameter substitution placeholders to set in the job definition. Parameters are specified
        # as a key-value pair mapping. Parameters in a SubmitJob request override any corresponding parameter
        # defaults from the job definition.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The platform capabilities required by the job definition. If no value is specified, it defaults to
        # EC2 . To run the job on Fargate resources, specify FARGATE . If the job runs on Amazon EKS
        # resources, then you must not specify platformCapabilities .

        @[JSON::Field(key: "platformCapabilities")]
        getter platform_capabilities : Array(String)?

        # Specifies whether to propagate the tags from the job or job definition to the corresponding Amazon
        # ECS task. If no value is specified, the tags are not propagated. Tags can only be propagated to the
        # tasks during task creation. For tags with the same name, job tags are given priority over job
        # definitions tags. If the total number of combined tags from the job and job definition is over 50,
        # the job is moved to the FAILED state. If the job runs on Amazon EKS resources, then you must not
        # specify propagateTags .

        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : Bool?

        # The retry strategy to use for failed jobs that are submitted with this job definition. Any retry
        # strategy that's specified during a SubmitJob operation overrides the retry strategy defined here. If
        # a job is terminated due to a timeout, it isn't retried.

        @[JSON::Field(key: "retryStrategy")]
        getter retry_strategy : Types::RetryStrategy?

        # The scheduling priority for jobs that are submitted with this job definition. This only affects jobs
        # in job queues with a fair-share policy. Jobs with a higher scheduling priority are scheduled before
        # jobs with a lower scheduling priority. The minimum supported value is 0 and the maximum supported
        # value is 9999.

        @[JSON::Field(key: "schedulingPriority")]
        getter scheduling_priority : Int32?

        # The tags that you apply to the job definition to help you categorize and organize your resources.
        # Each tag consists of a key and an optional value. For more information, see Tagging Amazon Web
        # Services Resources in Batch User Guide .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timeout configuration for jobs that are submitted with this job definition, after which Batch
        # terminates your jobs if they have not finished. If a job is terminated due to a timeout, it isn't
        # retried. The minimum value for the timeout is 60 seconds. Any timeout configuration that's specified
        # during a SubmitJob operation overrides the timeout configuration defined here. For more information,
        # see Job Timeouts in the Batch User Guide .

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::JobTimeout?

        def initialize(
          @job_definition_name : String,
          @type : String,
          @consumable_resource_properties : Types::ConsumableResourceProperties? = nil,
          @container_properties : Types::ContainerProperties? = nil,
          @ecs_properties : Types::EcsProperties? = nil,
          @eks_properties : Types::EksProperties? = nil,
          @node_properties : Types::NodeProperties? = nil,
          @parameters : Hash(String, String)? = nil,
          @platform_capabilities : Array(String)? = nil,
          @propagate_tags : Bool? = nil,
          @retry_strategy : Types::RetryStrategy? = nil,
          @scheduling_priority : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Types::JobTimeout? = nil
        )
        end
      end


      struct RegisterJobDefinitionResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the job definition.

        @[JSON::Field(key: "jobDefinitionArn")]
        getter job_definition_arn : String

        # The name of the job definition.

        @[JSON::Field(key: "jobDefinitionName")]
        getter job_definition_name : String

        # The revision of the job definition.

        @[JSON::Field(key: "revision")]
        getter revision : Int32

        def initialize(
          @job_definition_arn : String,
          @job_definition_name : String,
          @revision : Int32
        )
        end
      end

      # The repository credentials for private registry authentication.

      struct RepositoryCredentials
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the secret containing the private repository credentials.

        @[JSON::Field(key: "credentialsParameter")]
        getter credentials_parameter : String

        def initialize(
          @credentials_parameter : String
        )
        end
      end

      # The type and amount of a resource to assign to a container. The supported resources include GPU ,
      # MEMORY , and VCPU .

      struct ResourceRequirement
        include JSON::Serializable

        # The type of resource to assign to a container. The supported resources include GPU , MEMORY , and
        # VCPU .

        @[JSON::Field(key: "type")]
        getter type : String

        # The quantity of the specified resource to reserve for the container. The values vary based on the
        # type specified. type="GPU" The number of physical GPUs to reserve for the container. Make sure that
        # the number of GPUs reserved for all containers in a job doesn't exceed the number of available GPUs
        # on the compute resource that the job is launched on. GPUs aren't available for jobs that are running
        # on Fargate resources. type="MEMORY" The memory hard limit (in MiB) present to the container. This
        # parameter is supported for jobs that are running on Amazon EC2 resources. If your container attempts
        # to exceed the memory specified, the container is terminated. This parameter maps to Memory in the
        # Create a container section of the Docker Remote API and the --memory option to docker run . You must
        # specify at least 4 MiB of memory for a job. This is required but can be specified in several places
        # for multi-node parallel (MNP) jobs. It must be specified for each node at least once. This parameter
        # maps to Memory in the Create a container section of the Docker Remote API and the --memory option to
        # docker run . If you're trying to maximize your resource utilization by providing your jobs as much
        # memory as possible for a particular instance type, see Memory management in the Batch User Guide .
        # For jobs that are running on Fargate resources, then value is the hard limit (in MiB), and must
        # match one of the supported values and the VCPU values must be one of the values supported for that
        # memory value. value = 512 VCPU = 0.25 value = 1024 VCPU = 0.25 or 0.5 value = 2048 VCPU = 0.25, 0.5,
        # or 1 value = 3072 VCPU = 0.5, or 1 value = 4096 VCPU = 0.5, 1, or 2 value = 5120, 6144, or 7168 VCPU
        # = 1 or 2 value = 8192 VCPU = 1, 2, or 4 value = 9216, 10240, 11264, 12288, 13312, 14336, or 15360
        # VCPU = 2 or 4 value = 16384 VCPU = 2, 4, or 8 value = 17408, 18432, 19456, 21504, 22528, 23552,
        # 25600, 26624, 27648, 29696, or 30720 VCPU = 4 value = 20480, 24576, or 28672 VCPU = 4 or 8 value =
        # 36864, 45056, 53248, or 61440 VCPU = 8 value = 32768, 40960, 49152, or 57344 VCPU = 8 or 16 value =
        # 65536, 73728, 81920, 90112, 98304, 106496, 114688, or 122880 VCPU = 16 type="VCPU" The number of
        # vCPUs reserved for the container. This parameter maps to CpuShares in the Create a container section
        # of the Docker Remote API and the --cpu-shares option to docker run . Each vCPU is equivalent to
        # 1,024 CPU shares. For Amazon EC2 resources, you must specify at least one vCPU. This is required but
        # can be specified in several places; it must be specified for each node at least once. The default
        # for the Fargate On-Demand vCPU resource count quota is 6 vCPUs. For more information about Fargate
        # quotas, see Fargate quotas in the Amazon Web Services General Reference . For jobs that are running
        # on Fargate resources, then value must match one of the supported values and the MEMORY values must
        # be one of the values supported for that VCPU value. The supported values are 0.25, 0.5, 1, 2, 4, 8,
        # and 16 value = 0.25 MEMORY = 512, 1024, or 2048 value = 0.5 MEMORY = 1024, 2048, 3072, or 4096 value
        # = 1 MEMORY = 2048, 3072, 4096, 5120, 6144, 7168, or 8192 value = 2 MEMORY = 4096, 5120, 6144, 7168,
        # 8192, 9216, 10240, 11264, 12288, 13312, 14336, 15360, or 16384 value = 4 MEMORY = 8192, 9216, 10240,
        # 11264, 12288, 13312, 14336, 15360, 16384, 17408, 18432, 19456, 20480, 21504, 22528, 23552, 24576,
        # 25600, 26624, 27648, 28672, 29696, or 30720 value = 8 MEMORY = 16384, 20480, 24576, 28672, 32768,
        # 36864, 40960, 45056, 49152, 53248, 57344, or 61440 value = 16 MEMORY = 32768, 40960, 49152, 57344,
        # 65536, 73728, 81920, 90112, 98304, 106496, 114688, or 122880

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # The retry strategy that's associated with a job. For more information, see Automated job retries in
      # the Batch User Guide .

      struct RetryStrategy
        include JSON::Serializable

        # The number of times to move a job to the RUNNABLE status. You can specify between 1 and 10 attempts.
        # If the value of attempts is greater than one, the job is retried on failure the same number of
        # attempts as the value.

        @[JSON::Field(key: "attempts")]
        getter attempts : Int32?

        # Array of up to 5 objects that specify the conditions where jobs are retried or failed. If this
        # parameter is specified, then the attempts parameter must also be specified. If none of the listed
        # conditions match, then the job is retried.

        @[JSON::Field(key: "evaluateOnExit")]
        getter evaluate_on_exit : Array(Types::EvaluateOnExit)?

        def initialize(
          @attempts : Int32? = nil,
          @evaluate_on_exit : Array(Types::EvaluateOnExit)? = nil
        )
        end
      end

      # An object that represents the compute environment architecture for Batch jobs on Fargate.

      struct RuntimePlatform
        include JSON::Serializable

        # The vCPU architecture. The default value is X86_64 . Valid values are X86_64 and ARM64 . This
        # parameter must be set to X86_64 for Windows containers. Fargate Spot is not supported on
        # Windows-based containers on Fargate. A job queue will be blocked if a Windows job is submitted to a
        # job queue with only Fargate Spot compute environments. However, you can attach both FARGATE and
        # FARGATE_SPOT compute environments to the same job queue.

        @[JSON::Field(key: "cpuArchitecture")]
        getter cpu_architecture : String?

        # The operating system for the compute environment. Valid values are: LINUX (default),
        # WINDOWS_SERVER_2019_CORE , WINDOWS_SERVER_2019_FULL , WINDOWS_SERVER_2022_CORE , and
        # WINDOWS_SERVER_2022_FULL . The following parameters can’t be set for Windows containers:
        # linuxParameters , privileged , user , ulimits , readonlyRootFilesystem , and efsVolumeConfiguration
        # . The Batch Scheduler checks the compute environments that are attached to the job queue before
        # registering a task definition with Fargate. In this scenario, the job queue is where the job is
        # submitted. If the job requires a Windows container and the first compute environment is LINUX , the
        # compute environment is skipped and the next compute environment is checked until a Windows-based
        # compute environment is found. Fargate Spot is not supported on Windows-based containers on Fargate.
        # A job queue will be blocked if a Windows job is submitted to a job queue with only Fargate Spot
        # compute environments. However, you can attach both FARGATE and FARGATE_SPOT compute environments to
        # the same job queue.

        @[JSON::Field(key: "operatingSystemFamily")]
        getter operating_system_family : String?

        def initialize(
          @cpu_architecture : String? = nil,
          @operating_system_family : String? = nil
        )
        end
      end

      # An object that represents a scheduling policy.

      struct SchedulingPolicyDetail
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scheduling policy. An example is arn: aws :batch: us-east-1 :
        # 123456789012 :scheduling-policy/ HighPriority .

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The name of the fair-share scheduling policy.

        @[JSON::Field(key: "name")]
        getter name : String

        # The fair-share scheduling policy details.

        @[JSON::Field(key: "fairsharePolicy")]
        getter fairshare_policy : Types::FairsharePolicy?

        # The tags that you apply to the fair-share scheduling policy to categorize and organize your
        # resources. Each tag consists of a key and an optional value. For more information, see Tagging
        # Amazon Web Services resources in Amazon Web Services General Reference .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @name : String,
          @fairshare_policy : Types::FairsharePolicy? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # An object that contains the details of a scheduling policy that's returned in a ListSchedulingPolicy
      # action.

      struct SchedulingPolicyListingDetail
        include JSON::Serializable

        # Amazon Resource Name (ARN) of the scheduling policy.

        @[JSON::Field(key: "arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # An object that represents the secret to expose to your container. Secrets can be exposed to a
      # container in the following ways: To inject sensitive data into your containers as environment
      # variables, use the secrets container definition parameter. To reference sensitive information in the
      # log configuration of a container, use the secretOptions container definition parameter. For more
      # information, see Specifying sensitive data in the Batch User Guide .

      struct Secret
        include JSON::Serializable

        # The name of the secret.

        @[JSON::Field(key: "name")]
        getter name : String

        # The secret to expose to the container. The supported values are either the full Amazon Resource Name
        # (ARN) of the Secrets Manager secret or the full ARN of the parameter in the Amazon Web Services
        # Systems Manager Parameter Store. If the Amazon Web Services Systems Manager Parameter Store
        # parameter exists in the same Region as the job you're launching, then you can use either the full
        # Amazon Resource Name (ARN) or name of the parameter. If the parameter exists in a different Region,
        # then the full ARN must be specified.

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


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Detailed information about a service environment, including its configuration, state, and capacity
      # limits.

      struct ServiceEnvironmentDetail
        include JSON::Serializable

        # The capacity limits for the service environment. This defines the maximum resources that can be used
        # by service jobs in this environment.

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Array(Types::CapacityLimit)

        # The Amazon Resource Name (ARN) of the service environment.

        @[JSON::Field(key: "serviceEnvironmentArn")]
        getter service_environment_arn : String

        # The name of the service environment.

        @[JSON::Field(key: "serviceEnvironmentName")]
        getter service_environment_name : String

        # The type of service environment. For SageMaker Training jobs, this value is SAGEMAKER_TRAINING .

        @[JSON::Field(key: "serviceEnvironmentType")]
        getter service_environment_type : String

        # The state of the service environment. Valid values are ENABLED and DISABLED .

        @[JSON::Field(key: "state")]
        getter state : String?

        # The current status of the service environment.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The tags associated with the service environment. Each tag consists of a key and an optional value.
        # For more information, see Tagging your Batch resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @capacity_limits : Array(Types::CapacityLimit),
          @service_environment_arn : String,
          @service_environment_name : String,
          @service_environment_type : String,
          @state : String? = nil,
          @status : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies the order of a service environment for a job queue. This determines the priority order
      # when multiple service environments are associated with the same job queue.

      struct ServiceEnvironmentOrder
        include JSON::Serializable

        # The order of the service environment. Job queues with a higher priority are evaluated first when
        # associated with the same service environment.

        @[JSON::Field(key: "order")]
        getter order : Int32

        # The name or ARN of the service environment.

        @[JSON::Field(key: "serviceEnvironment")]
        getter service_environment : String

        def initialize(
          @order : Int32,
          @service_environment : String
        )
        end
      end

      # Detailed information about an attempt to run a service job.

      struct ServiceJobAttemptDetail
        include JSON::Serializable

        # The service resource identifier associated with the service job attempt.

        @[JSON::Field(key: "serviceResourceId")]
        getter service_resource_id : Types::ServiceResourceId?

        # The Unix timestamp (in milliseconds) for when the service job attempt was started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # A string that provides additional details for the current status of the service job attempt.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp (in milliseconds) for when the service job attempt stopped running.

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        def initialize(
          @service_resource_id : Types::ServiceResourceId? = nil,
          @started_at : Int64? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil
        )
        end
      end

      # Specifies conditions for when to exit or retry a service job based on the exit status or status
      # reason.

      struct ServiceJobEvaluateOnExit
        include JSON::Serializable

        # The action to take if the service job exits with the specified condition. Valid values are RETRY and
        # EXIT .

        @[JSON::Field(key: "action")]
        getter action : String?

        # Contains a glob pattern to match against the StatusReason returned for a job. The pattern can
        # contain up to 512 characters and can contain all printable characters. It can optionally end with an
        # asterisk (*) so that only the start of the string needs to be an exact match.

        @[JSON::Field(key: "onStatusReason")]
        getter on_status_reason : String?

        def initialize(
          @action : String? = nil,
          @on_status_reason : String? = nil
        )
        end
      end

      # The retry strategy for service jobs. This defines how many times to retry a failed service job and
      # under what conditions. For more information, see Service job retry strategies in the Batch User
      # Guide .

      struct ServiceJobRetryStrategy
        include JSON::Serializable

        # The number of times to move a service job to RUNNABLE status. You can specify between 1 and 10
        # attempts.

        @[JSON::Field(key: "attempts")]
        getter attempts : Int32

        # Array of ServiceJobEvaluateOnExit objects that specify conditions under which the service job should
        # be retried or failed.

        @[JSON::Field(key: "evaluateOnExit")]
        getter evaluate_on_exit : Array(Types::ServiceJobEvaluateOnExit)?

        def initialize(
          @attempts : Int32,
          @evaluate_on_exit : Array(Types::ServiceJobEvaluateOnExit)? = nil
        )
        end
      end

      # Summary information about a service job.

      struct ServiceJobSummary
        include JSON::Serializable

        # The job ID for the service job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the service job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The type of service job. For SageMaker Training jobs, this value is SAGEMAKER_TRAINING .

        @[JSON::Field(key: "serviceJobType")]
        getter service_job_type : String

        # The Unix timestamp (in milliseconds) for when the service job was created.

        @[JSON::Field(key: "createdAt")]
        getter created_at : Int64?

        # The Amazon Resource Name (ARN) of the service job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # Information about the latest attempt for the service job.

        @[JSON::Field(key: "latestAttempt")]
        getter latest_attempt : Types::LatestServiceJobAttempt?

        # The share identifier for the job.

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String?

        # The Unix timestamp (in milliseconds) for when the service job was started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # The current status of the service job.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A short string to provide more details on the current status of the service job.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The Unix timestamp (in milliseconds) for when the service job stopped running.

        @[JSON::Field(key: "stoppedAt")]
        getter stopped_at : Int64?

        def initialize(
          @job_id : String,
          @job_name : String,
          @service_job_type : String,
          @created_at : Int64? = nil,
          @job_arn : String? = nil,
          @latest_attempt : Types::LatestServiceJobAttempt? = nil,
          @share_identifier : String? = nil,
          @started_at : Int64? = nil,
          @status : String? = nil,
          @status_reason : String? = nil,
          @stopped_at : Int64? = nil
        )
        end
      end

      # The timeout configuration for service jobs.

      struct ServiceJobTimeout
        include JSON::Serializable

        # The maximum duration in seconds that a service job attempt can run. After this time is reached,
        # Batch terminates the service job attempt.

        @[JSON::Field(key: "attemptDurationSeconds")]
        getter attempt_duration_seconds : Int32?

        def initialize(
          @attempt_duration_seconds : Int32? = nil
        )
        end
      end

      # The Batch unique identifier.

      struct ServiceResourceId
        include JSON::Serializable

        # The name of the resource identifier.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the resource identifier.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # Specifies the weights for the share identifiers for the fair-share policy. Share identifiers that
      # aren't included have a default weight of 1.0 .

      struct ShareAttributes
        include JSON::Serializable

        # A share identifier or share identifier prefix. If the string ends with an asterisk (*), this entry
        # specifies the weight factor to use for share identifiers that start with that prefix. The list of
        # share identifiers in a fair-share policy can't overlap. For example, you can't have one that
        # specifies a shareIdentifier of UserA* and another that specifies a shareIdentifier of UserA1 . There
        # can be no more than 500 share identifiers active in a job queue. The string is limited to 255
        # alphanumeric characters, and can be followed by an asterisk (*).

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String

        # The weight factor for the share identifier. The default value is 1.0. A lower value has a higher
        # priority for compute resources. For example, jobs that use a share identifier with a weight factor
        # of 0.125 (1/8) get 8 times the compute resources of jobs that use a share identifier with a weight
        # factor of 1. The smallest supported value is 0.0001, and the largest supported value is 999.9999.

        @[JSON::Field(key: "weightFactor")]
        getter weight_factor : Float64?

        def initialize(
          @share_identifier : String,
          @weight_factor : Float64? = nil
        )
        end
      end

      # Contains the parameters for SubmitJob .

      struct SubmitJobRequest
        include JSON::Serializable

        # The job definition used by this job. This value can be one of definition-name ,
        # definition-name:revision , or the Amazon Resource Name (ARN) for the job definition, with or without
        # the revision ( arn:aws:batch: region : account :job-definition/ definition-name : revision , or
        # arn:aws:batch: region : account :job-definition/ definition-name ). If the revision is not
        # specified, then the latest active revision is used.

        @[JSON::Field(key: "jobDefinition")]
        getter job_definition : String

        # The name of the job. It can be up to 128 letters long. The first character must be alphanumeric, can
        # contain uppercase and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The job queue where the job is submitted. You can specify either the name or the Amazon Resource
        # Name (ARN) of the queue.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        # The array properties for the submitted job, such as the size of the array. The array size can be
        # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. For more
        # information, see Array Jobs in the Batch User Guide .

        @[JSON::Field(key: "arrayProperties")]
        getter array_properties : Types::ArrayProperties?

        # An object that contains overrides for the consumable resources of a job.

        @[JSON::Field(key: "consumableResourcePropertiesOverride")]
        getter consumable_resource_properties_override : Types::ConsumableResourceProperties?

        # An object with properties that override the defaults for the job definition that specify the name of
        # a container in the specified job definition and the overrides it should receive. You can override
        # the default command for a container, which is specified in the job definition or the Docker image,
        # with a command override. You can also override existing environment variables on a container or add
        # new environment variables to it with an environment override.

        @[JSON::Field(key: "containerOverrides")]
        getter container_overrides : Types::ContainerOverrides?

        # A list of dependencies for the job. A job can depend upon a maximum of 20 jobs. You can specify a
        # SEQUENTIAL type dependency without specifying a job ID for array jobs so that each child array job
        # completes sequentially, starting at index 0. You can also specify an N_TO_N type dependency with a
        # job ID for array jobs. In that case, each index child of this job must wait for the corresponding
        # index child of each dependency to complete before it can begin.

        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(Types::JobDependency)?

        # An object, with properties that override defaults for the job definition, can only be specified for
        # jobs that are run on Amazon ECS resources.

        @[JSON::Field(key: "ecsPropertiesOverride")]
        getter ecs_properties_override : Types::EcsPropertiesOverride?

        # An object, with properties that override defaults for the job definition, can only be specified for
        # jobs that are run on Amazon EKS resources.

        @[JSON::Field(key: "eksPropertiesOverride")]
        getter eks_properties_override : Types::EksPropertiesOverride?

        # A list of node overrides in JSON format that specify the node range to target and the container
        # overrides for that node range. This parameter isn't applicable to jobs that are running on Fargate
        # resources; use containerOverrides instead.

        @[JSON::Field(key: "nodeOverrides")]
        getter node_overrides : Types::NodeOverrides?

        # Additional parameters passed to the job that replace parameter substitution placeholders that are
        # set in the job definition. Parameters are specified as a key and value pair mapping. Parameters in a
        # SubmitJob request override any corresponding parameter defaults from the job definition.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # Specifies whether to propagate the tags from the job or job definition to the corresponding Amazon
        # ECS task. If no value is specified, the tags aren't propagated. Tags can only be propagated to the
        # tasks during task creation. For tags with the same name, job tags are given priority over job
        # definitions tags. If the total number of combined tags from the job and job definition is over 50,
        # the job is moved to the FAILED state. When specified, this overrides the tag propagation setting in
        # the job definition.

        @[JSON::Field(key: "propagateTags")]
        getter propagate_tags : Bool?

        # The retry strategy to use for failed jobs from this SubmitJob operation. When a retry strategy is
        # specified here, it overrides the retry strategy defined in the job definition.

        @[JSON::Field(key: "retryStrategy")]
        getter retry_strategy : Types::RetryStrategy?

        # The scheduling priority for the job. This only affects jobs in job queues with a fair-share policy.
        # Jobs with a higher scheduling priority are scheduled before jobs with a lower scheduling priority.
        # This overrides any scheduling priority in the job definition and works only within a single share
        # identifier. The minimum supported value is 0 and the maximum supported value is 9999.

        @[JSON::Field(key: "schedulingPriorityOverride")]
        getter scheduling_priority_override : Int32?

        # The share identifier for the job. Don't specify this parameter if the job queue doesn't have a
        # fair-share scheduling policy. If the job queue has a fair-share scheduling policy, then this
        # parameter must be specified. This string is limited to 255 alphanumeric characters, and can be
        # followed by an asterisk (*).

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String?

        # The tags that you apply to the job request to help you categorize and organize your resources. Each
        # tag consists of a key and an optional value. For more information, see Tagging Amazon Web Services
        # Resources in Amazon Web Services General Reference .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timeout configuration for this SubmitJob operation. You can specify a timeout duration after
        # which Batch terminates your jobs if they haven't finished. If a job is terminated due to a timeout,
        # it isn't retried. The minimum value for the timeout is 60 seconds. This configuration overrides any
        # timeout configuration specified in the job definition. For array jobs, child jobs have the same
        # timeout configuration as the parent job. For more information, see Job Timeouts in the Amazon
        # Elastic Container Service Developer Guide .

        @[JSON::Field(key: "timeout")]
        getter timeout : Types::JobTimeout?

        def initialize(
          @job_definition : String,
          @job_name : String,
          @job_queue : String,
          @array_properties : Types::ArrayProperties? = nil,
          @consumable_resource_properties_override : Types::ConsumableResourceProperties? = nil,
          @container_overrides : Types::ContainerOverrides? = nil,
          @depends_on : Array(Types::JobDependency)? = nil,
          @ecs_properties_override : Types::EcsPropertiesOverride? = nil,
          @eks_properties_override : Types::EksPropertiesOverride? = nil,
          @node_overrides : Types::NodeOverrides? = nil,
          @parameters : Hash(String, String)? = nil,
          @propagate_tags : Bool? = nil,
          @retry_strategy : Types::RetryStrategy? = nil,
          @scheduling_priority_override : Int32? = nil,
          @share_identifier : String? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout : Types::JobTimeout? = nil
        )
        end
      end


      struct SubmitJobResponse
        include JSON::Serializable

        # The unique identifier for the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The Amazon Resource Name (ARN) for the job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        def initialize(
          @job_id : String,
          @job_name : String,
          @job_arn : String? = nil
        )
        end
      end


      struct SubmitServiceJobRequest
        include JSON::Serializable

        # The name of the service job. It can be up to 128 characters long. It can contain uppercase and
        # lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The job queue into which the service job is submitted. You can specify either the name or the ARN of
        # the queue. The job queue must have the type SAGEMAKER_TRAINING .

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        # The type of service job. For SageMaker Training jobs, specify SAGEMAKER_TRAINING .

        @[JSON::Field(key: "serviceJobType")]
        getter service_job_type : String

        # The request, in JSON, for the service that the SubmitServiceJob operation is queueing.

        @[JSON::Field(key: "serviceRequestPayload")]
        getter service_request_payload : String

        # A unique identifier for the request. This token is used to ensure idempotency of requests. If this
        # parameter is specified and two submit requests with identical payloads and clientToken s are
        # received, these requests are considered the same request and the second request is rejected.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The retry strategy to use for failed service jobs that are submitted with this service job request.

        @[JSON::Field(key: "retryStrategy")]
        getter retry_strategy : Types::ServiceJobRetryStrategy?

        # The scheduling priority of the service job. Valid values are integers between 0 and 9999.

        @[JSON::Field(key: "schedulingPriority")]
        getter scheduling_priority : Int32?

        # The share identifier for the service job. Don't specify this parameter if the job queue doesn't have
        # a fair-share scheduling policy. If the job queue has a fair-share scheduling policy, then this
        # parameter must be specified.

        @[JSON::Field(key: "shareIdentifier")]
        getter share_identifier : String?

        # The tags that you apply to the service job request. Each tag consists of a key and an optional
        # value. For more information, see Tagging your Batch resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The timeout configuration for the service job. If none is specified, Batch defers to the default
        # timeout of the underlying service handling the job.

        @[JSON::Field(key: "timeoutConfig")]
        getter timeout_config : Types::ServiceJobTimeout?

        def initialize(
          @job_name : String,
          @job_queue : String,
          @service_job_type : String,
          @service_request_payload : String,
          @client_token : String? = nil,
          @retry_strategy : Types::ServiceJobRetryStrategy? = nil,
          @scheduling_priority : Int32? = nil,
          @share_identifier : String? = nil,
          @tags : Hash(String, String)? = nil,
          @timeout_config : Types::ServiceJobTimeout? = nil
        )
        end
      end


      struct SubmitServiceJobResponse
        include JSON::Serializable

        # The unique identifier for the service job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The name of the service job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The Amazon Resource Name (ARN) for the service job.

        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        def initialize(
          @job_id : String,
          @job_name : String,
          @job_arn : String? = nil
        )
        end
      end

      # Contains the parameters for TagResource .

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that tags are added to. Batch resources that support
        # tags are compute environments, jobs, job definitions, job queues, and scheduling policies. ARNs for
        # child jobs of array and multi-node parallel (MNP) jobs aren't supported.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags that you apply to the resource to help you categorize and organize your resources. Each tag
        # consists of a key and an optional value. For more information, see Tagging Amazon Web Services
        # Resources in Amazon Web Services General Reference .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)
        )
        end
      end


      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A list of containers that this task depends on.

      struct TaskContainerDependency
        include JSON::Serializable

        # The dependency condition of the container. The following are the available conditions and their
        # behavior: START - This condition emulates the behavior of links and volumes today. It validates that
        # a dependent container is started before permitting other containers to start. COMPLETE - This
        # condition validates that a dependent container runs to completion (exits) before permitting other
        # containers to start. This can be useful for nonessential containers that run a script and then exit.
        # This condition can't be set on an essential container. SUCCESS - This condition is the same as
        # COMPLETE , but it also requires that the container exits with a zero status. This condition can't be
        # set on an essential container.

        @[JSON::Field(key: "condition")]
        getter condition : String?

        # A unique identifier for the container.

        @[JSON::Field(key: "containerName")]
        getter container_name : String?

        def initialize(
          @condition : String? = nil,
          @container_name : String? = nil
        )
        end
      end

      # The details for the container in this task attempt.

      struct TaskContainerDetails
        include JSON::Serializable

        # The command that's passed to the container. This parameter maps to Cmd in the Create a container
        # section of the Docker Remote API and the COMMAND parameter to docker run . For more information, see
        # https://docs.docker.com/engine/reference/builder/#cmd .

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # A list of containers that this container depends on.

        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(Types::TaskContainerDependency)?

        # The environment variables to pass to a container. This parameter maps to Env in the Create a
        # container section of the Docker Remote API and the --env option to docker run . We don't recommend
        # using plaintext environment variables for sensitive information, such as credential data.

        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # If the essential parameter of a container is marked as true , and that container fails or stops for
        # any reason, all other containers that are part of the task are stopped. If the essential parameter
        # of a container is marked as false, its failure doesn't affect the rest of the containers in a task.
        # If this parameter is omitted, a container is assumed to be essential. All jobs must have at least
        # one essential container. If you have an application that's composed of multiple containers, group
        # containers that are used for a common purpose into components, and separate the different components
        # into multiple task definitions. For more information, see Application Architecture in the Amazon
        # Elastic Container Service Developer Guide .

        @[JSON::Field(key: "essential")]
        getter essential : Bool?

        # The exit code returned upon completion.

        @[JSON::Field(key: "exitCode")]
        getter exit_code : Int32?

        # The FireLens configuration for the container. This is used to specify and configure a log router for
        # container logs. For more information, see Custom log routing in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "firelensConfiguration")]
        getter firelens_configuration : Types::FirelensConfiguration?

        # The image used to start a container. This string is passed directly to the Docker daemon. By
        # default, images in the Docker Hub registry are available. Other repositories are specified with
        # either repository-url/image:tag or repository-url/image@digest . Up to 255 letters (uppercase and
        # lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs are
        # allowed. This parameter maps to Image in the Create a container section of the Docker Remote API and
        # the IMAGE parameter of the docker run .

        @[JSON::Field(key: "image")]
        getter image : String?

        # Linux-specific modifications that are applied to the container, such as Linux kernel capabilities.
        # For more information, see KernelCapabilities . This parameter is not supported for Windows
        # containers.

        @[JSON::Field(key: "linuxParameters")]
        getter linux_parameters : Types::LinuxParameters?

        # The log configuration specification for the container. This parameter maps to LogConfig in the
        # Create a container section of the Docker Remote API and the --log-driver option to docker run . By
        # default, containers use the same logging driver that the Docker daemon uses. However the container
        # can use a different logging driver than the Docker daemon by specifying a log driver with this
        # parameter in the container definition. To use a different logging driver for a container, the log
        # system must be configured properly on the container instance (or on a different log server for
        # remote logging options). For more information about the options for different supported log drivers,
        # see Configure logging drivers in the Docker documentation . Amazon ECS currently supports a subset
        # of the logging drivers available to the Docker daemon (shown in the LogConfiguration data type).
        # Additional log drivers may be available in future releases of the Amazon ECS container agent. This
        # parameter requires version 1.18 of the Docker Remote API or greater on your container instance. To
        # check the Docker Remote API version on your container instance, log in to your container instance
        # and run the following command: sudo docker version --format '{{.Server.APIVersion}}' The Amazon ECS
        # container agent running on a container instance must register the logging drivers available on that
        # instance with the ECS_AVAILABLE_LOGGING_DRIVERS environment variable before containers placed on
        # that instance can use these log configuration options. For more information, see Amazon ECS
        # container agent configuration in the Amazon Elastic Container Service Developer Guide .

        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The name of the CloudWatch Logs log stream that's associated with the container. The log group for
        # Batch jobs is /aws/batch/job. Each container attempt receives a log stream name when they reach the
        # RUNNING status.

        @[JSON::Field(key: "logStreamName")]
        getter log_stream_name : String?

        # The mount points for data volumes in your container. This parameter maps to Volumes in the Create a
        # container section of the Docker Remote API and the --volume option to docker run . Windows
        # containers can mount whole directories on the same drive as $env:ProgramData . Windows containers
        # can't mount directories on a different drive, and mount point can't be across drives.

        @[JSON::Field(key: "mountPoints")]
        getter mount_points : Array(Types::MountPoint)?

        # The name of a container.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The network interfaces that are associated with the job.

        @[JSON::Field(key: "networkInterfaces")]
        getter network_interfaces : Array(Types::NetworkInterface)?

        # When this parameter is true , the container is given elevated privileges on the host container
        # instance (similar to the root user). This parameter maps to Privileged in the Create a container
        # section of the Docker Remote API and the --privileged option to docker run . This parameter is not
        # supported for Windows containers or tasks run on Fargate.

        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        # When this parameter is true, the container is given read-only access to its root file system. This
        # parameter maps to ReadonlyRootfs in the Create a container section of the Docker Remote API and the
        # --read-only option to docker run . This parameter is not supported for Windows containers.

        @[JSON::Field(key: "readonlyRootFilesystem")]
        getter readonly_root_filesystem : Bool?

        # A short (255 max characters) human-readable string to provide additional details for a running or
        # stopped container.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The private repository authentication credentials to use.

        @[JSON::Field(key: "repositoryCredentials")]
        getter repository_credentials : Types::RepositoryCredentials?

        # The type and amount of a resource to assign to a container. The only supported resource is a GPU.

        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        # The secrets to pass to the container. For more information, see Specifying Sensitive Data in the
        # Amazon Elastic Container Service Developer Guide.

        @[JSON::Field(key: "secrets")]
        getter secrets : Array(Types::Secret)?

        # A list of ulimits to set in the container. If a ulimit value is specified in a task definition, it
        # overrides the default values set by Docker. This parameter maps to Ulimits in the Create a container
        # section of the Docker Remote API and the --ulimit option to docker run . Amazon ECS tasks hosted on
        # Fargate use the default resource limit values set by the operating system with the exception of the
        # nofile resource limit parameter which Fargate overrides. The nofile resource limit sets a
        # restriction on the number of open files that a container can use. The default nofile soft limit is
        # 1024 and the default hard limit is 65535 . This parameter requires version 1.18 of the Docker Remote
        # API or greater on your container instance. To check the Docker Remote API version on your container
        # instance, log in to your container instance and run the following command: sudo docker version
        # --format '{{.Server.APIVersion}}' This parameter is not supported for Windows containers.

        @[JSON::Field(key: "ulimits")]
        getter ulimits : Array(Types::Ulimit)?

        # The user to use inside the container. This parameter maps to User in the Create a container section
        # of the Docker Remote API and the --user option to docker run. When running tasks using the host
        # network mode, don't run containers using the root user (UID 0) . We recommend using a non-root user
        # for better security. You can specify the user using the following formats. If specifying a UID or
        # GID, you must specify it as a positive integer. user user:group uid uid:gid user:gi uid:group This
        # parameter is not supported for Windows containers.

        @[JSON::Field(key: "user")]
        getter user : String?

        def initialize(
          @command : Array(String)? = nil,
          @depends_on : Array(Types::TaskContainerDependency)? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @essential : Bool? = nil,
          @exit_code : Int32? = nil,
          @firelens_configuration : Types::FirelensConfiguration? = nil,
          @image : String? = nil,
          @linux_parameters : Types::LinuxParameters? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @log_stream_name : String? = nil,
          @mount_points : Array(Types::MountPoint)? = nil,
          @name : String? = nil,
          @network_interfaces : Array(Types::NetworkInterface)? = nil,
          @privileged : Bool? = nil,
          @readonly_root_filesystem : Bool? = nil,
          @reason : String? = nil,
          @repository_credentials : Types::RepositoryCredentials? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil,
          @secrets : Array(Types::Secret)? = nil,
          @ulimits : Array(Types::Ulimit)? = nil,
          @user : String? = nil
        )
        end
      end

      # The overrides that should be sent to a container. For information about using Batch overrides when
      # you connect event sources to targets, see BatchContainerOverrides .

      struct TaskContainerOverrides
        include JSON::Serializable

        # The command to send to the container that overrides the default command from the Docker image or the
        # job definition. This parameter can't contain an empty string.

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # The environment variables to send to the container. You can add new environment variables, which are
        # added to the container at launch, or you can override the existing environment variables from the
        # Docker image or the job definition. Environment variables cannot start with AWS_BATCH . This naming
        # convention is reserved for variables that Batch sets.

        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # A pointer to the container that you want to override. The container's name provides a unique
        # identifier for the container being used.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The type and amount of resources to assign to a container. This overrides the settings in the job
        # definition. The supported resources include GPU , MEMORY , and VCPU .

        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        def initialize(
          @command : Array(String)? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @name : String? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil
        )
        end
      end

      # Container properties are used for Amazon ECS-based job definitions. These properties to describe the
      # container that's launched as part of a job.

      struct TaskContainerProperties
        include JSON::Serializable

        # The image used to start a container. This string is passed directly to the Docker daemon. By
        # default, images in the Docker Hub registry are available. Other repositories are specified with
        # either repository-url/image:tag or repository-url/image@digest . Up to 255 letters (uppercase and
        # lowercase), numbers, hyphens, underscores, colons, periods, forward slashes, and number signs are
        # allowed. This parameter maps to Image in the Create a container section of the Docker Remote API and
        # the IMAGE parameter of the docker run .

        @[JSON::Field(key: "image")]
        getter image : String

        # The command that's passed to the container. This parameter maps to Cmd in the Create a container
        # section of the Docker Remote API and the COMMAND parameter to docker run . For more information, see
        # Dockerfile reference: CMD .

        @[JSON::Field(key: "command")]
        getter command : Array(String)?

        # A list of containers that this container depends on.

        @[JSON::Field(key: "dependsOn")]
        getter depends_on : Array(Types::TaskContainerDependency)?

        # The environment variables to pass to a container. This parameter maps to Env in the Create a
        # container section of the Docker Remote API and the --env parameter to docker run . We don't
        # recommend using plaintext environment variables for sensitive information, such as credential data.
        # Environment variables cannot start with AWS_BATCH . This naming convention is reserved for variables
        # that Batch sets.

        @[JSON::Field(key: "environment")]
        getter environment : Array(Types::KeyValuePair)?

        # If the essential parameter of a container is marked as true , and that container fails or stops for
        # any reason, all other containers that are part of the task are stopped. If the essential parameter
        # of a container is marked as false, its failure doesn't affect the rest of the containers in a task.
        # If this parameter is omitted, a container is assumed to be essential. All jobs must have at least
        # one essential container. If you have an application that's composed of multiple containers, group
        # containers that are used for a common purpose into components, and separate the different components
        # into multiple task definitions. For more information, see Application Architecture in the Amazon
        # Elastic Container Service Developer Guide .

        @[JSON::Field(key: "essential")]
        getter essential : Bool?

        # The FireLens configuration for the container. This is used to specify and configure a log router for
        # container logs. For more information, see Custom log routing in the Amazon Elastic Container Service
        # Developer Guide .

        @[JSON::Field(key: "firelensConfiguration")]
        getter firelens_configuration : Types::FirelensConfiguration?

        # Linux-specific modifications that are applied to the container, such as Linux kernel capabilities.
        # For more information, see KernelCapabilities .

        @[JSON::Field(key: "linuxParameters")]
        getter linux_parameters : Types::LinuxParameters?

        # The log configuration specification for the container. This parameter maps to LogConfig in the
        # Create a container section of the Docker Remote API and the --log-driver option to docker run . By
        # default, containers use the same logging driver that the Docker daemon uses. However the container
        # can use a different logging driver than the Docker daemon by specifying a log driver with this
        # parameter in the container definition. To use a different logging driver for a container, the log
        # system must be configured properly on the container instance (or on a different log server for
        # remote logging options). For more information about the options for different supported log drivers,
        # see Configure logging drivers in the Docker documentation . Amazon ECS currently supports a subset
        # of the logging drivers available to the Docker daemon (shown in the LogConfiguration data type).
        # Additional log drivers may be available in future releases of the Amazon ECS container agent. This
        # parameter requires version 1.18 of the Docker Remote API or greater on your container instance. To
        # check the Docker Remote API version on your container instance, log in to your container instance
        # and run the following command: sudo docker version --format '{{.Server.APIVersion}}' The Amazon ECS
        # container agent running on a container instance must register the logging drivers available on that
        # instance with the ECS_AVAILABLE_LOGGING_DRIVERS environment variable before containers placed on
        # that instance can use these log configuration options. For more information, see Amazon ECS
        # container agent configuration in the Amazon Elastic Container Service Developer Guide .

        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration?

        # The mount points for data volumes in your container. This parameter maps to Volumes in the Create a
        # container section of the Docker Remote API and the --volume option to docker run . Windows
        # containers can mount whole directories on the same drive as $env:ProgramData . Windows containers
        # can't mount directories on a different drive, and mount point can't be across drives.

        @[JSON::Field(key: "mountPoints")]
        getter mount_points : Array(Types::MountPoint)?

        # The name of a container. The name can be used as a unique identifier to target your dependsOn and
        # Overrides objects.

        @[JSON::Field(key: "name")]
        getter name : String?

        # When this parameter is true , the container is given elevated privileges on the host container
        # instance (similar to the root user). This parameter maps to Privileged in the Create a container
        # section of the Docker Remote API and the --privileged option to docker run . This parameter is not
        # supported for Windows containers or tasks run on Fargate.

        @[JSON::Field(key: "privileged")]
        getter privileged : Bool?

        # When this parameter is true, the container is given read-only access to its root file system. This
        # parameter maps to ReadonlyRootfs in the Create a container section of the Docker Remote API and the
        # --read-only option to docker run . This parameter is not supported for Windows containers.

        @[JSON::Field(key: "readonlyRootFilesystem")]
        getter readonly_root_filesystem : Bool?

        # The private repository authentication credentials to use.

        @[JSON::Field(key: "repositoryCredentials")]
        getter repository_credentials : Types::RepositoryCredentials?

        # The type and amount of a resource to assign to a container. The only supported resource is a GPU.

        @[JSON::Field(key: "resourceRequirements")]
        getter resource_requirements : Array(Types::ResourceRequirement)?

        # The secrets to pass to the container. For more information, see Specifying Sensitive Data in the
        # Amazon Elastic Container Service Developer Guide.

        @[JSON::Field(key: "secrets")]
        getter secrets : Array(Types::Secret)?

        # A list of ulimits to set in the container. If a ulimit value is specified in a task definition, it
        # overrides the default values set by Docker. This parameter maps to Ulimits in the Create a container
        # section of the Docker Remote API and the --ulimit option to docker run . Amazon ECS tasks hosted on
        # Fargate use the default resource limit values set by the operating system with the exception of the
        # nofile resource limit parameter which Fargate overrides. The nofile resource limit sets a
        # restriction on the number of open files that a container can use. The default nofile soft limit is
        # 1024 and the default hard limit is 65535 . This parameter requires version 1.18 of the Docker Remote
        # API or greater on your container instance. To check the Docker Remote API version on your container
        # instance, log in to your container instance and run the following command: sudo docker version
        # --format '{{.Server.APIVersion}}' This parameter is not supported for Windows containers.

        @[JSON::Field(key: "ulimits")]
        getter ulimits : Array(Types::Ulimit)?

        # The user to use inside the container. This parameter maps to User in the Create a container section
        # of the Docker Remote API and the --user option to docker run. When running tasks using the host
        # network mode, don't run containers using the root user (UID 0) . We recommend using a non-root user
        # for better security. You can specify the user using the following formats. If specifying a UID or
        # GID, you must specify it as a positive integer. user user:group uid uid:gid user:gi uid:group This
        # parameter is not supported for Windows containers.

        @[JSON::Field(key: "user")]
        getter user : String?

        def initialize(
          @image : String,
          @command : Array(String)? = nil,
          @depends_on : Array(Types::TaskContainerDependency)? = nil,
          @environment : Array(Types::KeyValuePair)? = nil,
          @essential : Bool? = nil,
          @firelens_configuration : Types::FirelensConfiguration? = nil,
          @linux_parameters : Types::LinuxParameters? = nil,
          @log_configuration : Types::LogConfiguration? = nil,
          @mount_points : Array(Types::MountPoint)? = nil,
          @name : String? = nil,
          @privileged : Bool? = nil,
          @readonly_root_filesystem : Bool? = nil,
          @repository_credentials : Types::RepositoryCredentials? = nil,
          @resource_requirements : Array(Types::ResourceRequirement)? = nil,
          @secrets : Array(Types::Secret)? = nil,
          @ulimits : Array(Types::Ulimit)? = nil,
          @user : String? = nil
        )
        end
      end

      # An object that contains overrides for the task definition of a job.

      struct TaskPropertiesOverride
        include JSON::Serializable

        # The overrides for the container definition of a job.

        @[JSON::Field(key: "containers")]
        getter containers : Array(Types::TaskContainerOverrides)?

        def initialize(
          @containers : Array(Types::TaskContainerOverrides)? = nil
        )
        end
      end

      # Contains the parameters for TerminateJob .

      struct TerminateJobRequest
        include JSON::Serializable

        # The Batch job ID of the job to terminate.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A message to attach to the job that explains the reason for canceling it. This message is returned
        # by future DescribeJobs operations on the job. It is also recorded in the Batch activity logs. This
        # parameter has as limit of 1024 characters.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @job_id : String,
          @reason : String
        )
        end
      end


      struct TerminateJobResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct TerminateServiceJobRequest
        include JSON::Serializable

        # The service job ID of the service job to terminate.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A message to attach to the service job that explains the reason for canceling it. This message is
        # returned by DescribeServiceJob operations on the service job.

        @[JSON::Field(key: "reason")]
        getter reason : String

        def initialize(
          @job_id : String,
          @reason : String
        )
        end
      end


      struct TerminateServiceJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The container path, mount options, and size of the tmpfs mount. This object isn't applicable to jobs
      # that are running on Fargate resources.

      struct Tmpfs
        include JSON::Serializable

        # The absolute file path in the container where the tmpfs volume is mounted.

        @[JSON::Field(key: "containerPath")]
        getter container_path : String

        # The size (in MiB) of the tmpfs volume.

        @[JSON::Field(key: "size")]
        getter size : Int32

        # The list of tmpfs volume mount options. Valid values: " defaults " | " ro " | " rw " | " suid " | "
        # nosuid " | " dev " | " nodev " | " exec " | " noexec " | " sync " | " async " | " dirsync " | "
        # remount " | " mand " | " nomand " | " atime " | " noatime " | " diratime " | " nodiratime " | " bind
        # " | " rbind" | "unbindable" | "runbindable" | "private" | "rprivate" | "shared" | "rshared" |
        # "slave" | "rslave" | "relatime " | " norelatime " | " strictatime " | " nostrictatime " | " mode " |
        # " uid " | " gid " | " nr_inodes " | " nr_blocks " | " mpol "

        @[JSON::Field(key: "mountOptions")]
        getter mount_options : Array(String)?

        def initialize(
          @container_path : String,
          @size : Int32,
          @mount_options : Array(String)? = nil
        )
        end
      end

      # The ulimit settings to pass to the container. For more information, see Ulimit . This object isn't
      # applicable to jobs that are running on Fargate resources.

      struct Ulimit
        include JSON::Serializable

        # The hard limit for the ulimit type.

        @[JSON::Field(key: "hardLimit")]
        getter hard_limit : Int32

        # The type of the ulimit . Valid values are: core | cpu | data | fsize | locks | memlock | msgqueue |
        # nice | nofile | nproc | rss | rtprio | rttime | sigpending | stack .

        @[JSON::Field(key: "name")]
        getter name : String

        # The soft limit for the ulimit type.

        @[JSON::Field(key: "softLimit")]
        getter soft_limit : Int32

        def initialize(
          @hard_limit : Int32,
          @name : String,
          @soft_limit : Int32
        )
        end
      end

      # Contains the parameters for UntagResource .

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which to delete tags. Batch resources that
        # support tags are compute environments, jobs, job definitions, job queues, and scheduling policies.
        # ARNs for child jobs of array and multi-node parallel (MNP) jobs aren't supported.

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

      # Contains the parameters for UpdateComputeEnvironment .

      struct UpdateComputeEnvironmentRequest
        include JSON::Serializable

        # The name or full Amazon Resource Name (ARN) of the compute environment to update.

        @[JSON::Field(key: "computeEnvironment")]
        getter compute_environment : String

        # Details of the compute resources managed by the compute environment. Required for a managed compute
        # environment. For more information, see Compute Environments in the Batch User Guide .

        @[JSON::Field(key: "computeResources")]
        getter compute_resources : Types::ComputeResourceUpdate?

        # Reserved.

        @[JSON::Field(key: "context")]
        getter context : String?

        # The full Amazon Resource Name (ARN) of the IAM role that allows Batch to make calls to other Amazon
        # Web Services services on your behalf. For more information, see Batch service IAM role in the Batch
        # User Guide . If the compute environment has a service-linked role, it can't be changed to use a
        # regular IAM role. Likewise, if the compute environment has a regular IAM role, it can't be changed
        # to use a service-linked role. To update the parameters for the compute environment that require an
        # infrastructure update to change, the AWSServiceRoleForBatch service-linked role must be used. For
        # more information, see Updating compute environments in the Batch User Guide . If your specified role
        # has a path other than / , then you must either specify the full role ARN (recommended) or prefix the
        # role name with the path. Depending on how you created your Batch service role, its ARN might contain
        # the service-role path prefix. When you only specify the name of the service role, Batch assumes that
        # your ARN doesn't use the service-role path prefix. Because of this, we recommend that you specify
        # the full ARN of your service role when you create compute environments.

        @[JSON::Field(key: "serviceRole")]
        getter service_role : String?

        # The state of the compute environment. Compute environments in the ENABLED state can accept jobs from
        # a queue and scale in or out automatically based on the workload demand of its associated queues. If
        # the state is ENABLED , then the Batch scheduler can attempt to place jobs from an associated job
        # queue on the compute resources within the environment. If the compute environment is managed, then
        # it can scale its instances out or in automatically, based on the job queue demand. If the state is
        # DISABLED , then the Batch scheduler doesn't attempt to place jobs within the environment. Jobs in a
        # STARTING or RUNNING state continue to progress normally. Managed compute environments in the
        # DISABLED state don't scale out. Compute environments in a DISABLED state may continue to incur
        # billing charges. To prevent additional charges, turn off and then delete the compute environment.
        # For more information, see State in the Batch User Guide . When an instance is idle, the instance
        # scales down to the minvCpus value. However, the instance size doesn't change. For example, consider
        # a c5.8xlarge instance with a minvCpus value of 4 and a desiredvCpus value of 36 . This instance
        # doesn't scale down to a c5.large instance.

        @[JSON::Field(key: "state")]
        getter state : String?

        # The maximum number of vCPUs expected to be used for an unmanaged compute environment. Don't specify
        # this parameter for a managed compute environment. This parameter is only used for fair-share
        # scheduling to reserve vCPU capacity for new share identifiers. If this parameter isn't provided for
        # a fair-share job queue, no vCPU capacity is reserved.

        @[JSON::Field(key: "unmanagedvCpus")]
        getter unmanagedv_cpus : Int32?

        # Specifies the updated infrastructure update policy for the compute environment. For more information
        # about infrastructure updates, see Updating compute environments in the Batch User Guide .

        @[JSON::Field(key: "updatePolicy")]
        getter update_policy : Types::UpdatePolicy?

        def initialize(
          @compute_environment : String,
          @compute_resources : Types::ComputeResourceUpdate? = nil,
          @context : String? = nil,
          @service_role : String? = nil,
          @state : String? = nil,
          @unmanagedv_cpus : Int32? = nil,
          @update_policy : Types::UpdatePolicy? = nil
        )
        end
      end


      struct UpdateComputeEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the compute environment.

        @[JSON::Field(key: "computeEnvironmentArn")]
        getter compute_environment_arn : String?

        # The name of the compute environment. It can be up to 128 characters long. It can contain uppercase
        # and lowercase letters, numbers, hyphens (-), and underscores (_).

        @[JSON::Field(key: "computeEnvironmentName")]
        getter compute_environment_name : String?

        def initialize(
          @compute_environment_arn : String? = nil,
          @compute_environment_name : String? = nil
        )
        end
      end


      struct UpdateConsumableResourceRequest
        include JSON::Serializable

        # The name or ARN of the consumable resource to be updated.

        @[JSON::Field(key: "consumableResource")]
        getter consumable_resource : String

        # If this parameter is specified and two update requests with identical payloads and clientToken s are
        # received, these requests are considered the same request. Both requests will succeed, but the update
        # will only happen once. A clientToken is valid for 8 hours.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Indicates how the quantity of the consumable resource will be updated. Must be one of: SET Sets the
        # quantity of the resource to the value specified by the quantity parameter. ADD Increases the
        # quantity of the resource by the value specified by the quantity parameter. REMOVE Reduces the
        # quantity of the resource by the value specified by the quantity parameter.

        @[JSON::Field(key: "operation")]
        getter operation : String?

        # The change in the total quantity of the consumable resource. The operation parameter determines
        # whether the value specified here will be the new total quantity, or the amount by which the total
        # quantity will be increased or reduced. Must be a non-negative value.

        @[JSON::Field(key: "quantity")]
        getter quantity : Int64?

        def initialize(
          @consumable_resource : String,
          @client_token : String? = nil,
          @operation : String? = nil,
          @quantity : Int64? = nil
        )
        end
      end


      struct UpdateConsumableResourceResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the consumable resource.

        @[JSON::Field(key: "consumableResourceArn")]
        getter consumable_resource_arn : String

        # The name of the consumable resource to be updated.

        @[JSON::Field(key: "consumableResourceName")]
        getter consumable_resource_name : String

        # The total amount of the consumable resource that is available.

        @[JSON::Field(key: "totalQuantity")]
        getter total_quantity : Int64?

        def initialize(
          @consumable_resource_arn : String,
          @consumable_resource_name : String,
          @total_quantity : Int64? = nil
        )
        end
      end

      # Contains the parameters for UpdateJobQueue .

      struct UpdateJobQueueRequest
        include JSON::Serializable

        # The name or the Amazon Resource Name (ARN) of the job queue.

        @[JSON::Field(key: "jobQueue")]
        getter job_queue : String

        # Details the set of compute environments mapped to a job queue and their order relative to each
        # other. This is one of the parameters used by the job scheduler to determine which compute
        # environment runs a given job. Compute environments must be in the VALID state before you can
        # associate them with a job queue. All of the compute environments must be either EC2 ( EC2 or SPOT )
        # or Fargate ( FARGATE or FARGATE_SPOT ). EC2 and Fargate compute environments can't be mixed. All
        # compute environments that are associated with a job queue must share the same architecture. Batch
        # doesn't support mixing compute environment architecture types in a single job queue.

        @[JSON::Field(key: "computeEnvironmentOrder")]
        getter compute_environment_order : Array(Types::ComputeEnvironmentOrder)?

        # The set of actions that Batch perform on jobs that remain at the head of the job queue in the
        # specified state longer than specified times. Batch will perform each action after maxTimeSeconds has
        # passed. ( Note : The minimum value for maxTimeSeconds is 600 (10 minutes) and its maximum value is
        # 86,400 (24 hours).)

        @[JSON::Field(key: "jobStateTimeLimitActions")]
        getter job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)?

        # The priority of the job queue. Job queues with a higher priority (or a higher integer value for the
        # priority parameter) are evaluated first when associated with the same compute environment. Priority
        # is determined in descending order. For example, a job queue with a priority value of 10 is given
        # scheduling preference over a job queue with a priority value of 1 . All of the compute environments
        # must be either EC2 ( EC2 or SPOT ) or Fargate ( FARGATE or FARGATE_SPOT ). EC2 and Fargate compute
        # environments can't be mixed.

        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # Amazon Resource Name (ARN) of the fair-share scheduling policy. Once a job queue is created, the
        # fair-share scheduling policy can be replaced but not removed. The format is aws: Partition :batch:
        # Region : Account :scheduling-policy/ Name . For example,
        # aws:aws:batch:us-west-2:123456789012:scheduling-policy/MySchedulingPolicy .

        @[JSON::Field(key: "schedulingPolicyArn")]
        getter scheduling_policy_arn : String?

        # The order of the service environment associated with the job queue. Job queues with a higher
        # priority are evaluated first when associated with the same service environment.

        @[JSON::Field(key: "serviceEnvironmentOrder")]
        getter service_environment_order : Array(Types::ServiceEnvironmentOrder)?

        # Describes the queue's ability to accept new jobs. If the job queue state is ENABLED , it can accept
        # jobs. If the job queue state is DISABLED , new jobs can't be added to the queue, but jobs already in
        # the queue can finish.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @job_queue : String,
          @compute_environment_order : Array(Types::ComputeEnvironmentOrder)? = nil,
          @job_state_time_limit_actions : Array(Types::JobStateTimeLimitAction)? = nil,
          @priority : Int32? = nil,
          @scheduling_policy_arn : String? = nil,
          @service_environment_order : Array(Types::ServiceEnvironmentOrder)? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateJobQueueResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the job queue.

        @[JSON::Field(key: "jobQueueArn")]
        getter job_queue_arn : String?

        # The name of the job queue.

        @[JSON::Field(key: "jobQueueName")]
        getter job_queue_name : String?

        def initialize(
          @job_queue_arn : String? = nil,
          @job_queue_name : String? = nil
        )
        end
      end

      # Specifies the infrastructure update policy for the Amazon EC2 compute environment. For more
      # information about infrastructure updates, see Updating compute environments in the Batch User Guide
      # .

      struct UpdatePolicy
        include JSON::Serializable

        # Specifies the job timeout (in minutes) when the compute environment infrastructure is updated. The
        # default value is 30.

        @[JSON::Field(key: "jobExecutionTimeoutMinutes")]
        getter job_execution_timeout_minutes : Int64?

        # Specifies whether jobs are automatically terminated when the compute environment infrastructure is
        # updated. The default value is false .

        @[JSON::Field(key: "terminateJobsOnUpdate")]
        getter terminate_jobs_on_update : Bool?

        def initialize(
          @job_execution_timeout_minutes : Int64? = nil,
          @terminate_jobs_on_update : Bool? = nil
        )
        end
      end

      # Contains the parameters for UpdateSchedulingPolicy .

      struct UpdateSchedulingPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scheduling policy to update.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The fair-share policy scheduling details.

        @[JSON::Field(key: "fairsharePolicy")]
        getter fairshare_policy : Types::FairsharePolicy?

        def initialize(
          @arn : String,
          @fairshare_policy : Types::FairsharePolicy? = nil
        )
        end
      end


      struct UpdateSchedulingPolicyResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateServiceEnvironmentRequest
        include JSON::Serializable

        # The name or ARN of the service environment to update.

        @[JSON::Field(key: "serviceEnvironment")]
        getter service_environment : String

        # The capacity limits for the service environment. This defines the maximum resources that can be used
        # by service jobs in this environment.

        @[JSON::Field(key: "capacityLimits")]
        getter capacity_limits : Array(Types::CapacityLimit)?

        # The state of the service environment.

        @[JSON::Field(key: "state")]
        getter state : String?

        def initialize(
          @service_environment : String,
          @capacity_limits : Array(Types::CapacityLimit)? = nil,
          @state : String? = nil
        )
        end
      end


      struct UpdateServiceEnvironmentResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service environment that was updated.

        @[JSON::Field(key: "serviceEnvironmentArn")]
        getter service_environment_arn : String

        # The name of the service environment that was updated.

        @[JSON::Field(key: "serviceEnvironmentName")]
        getter service_environment_name : String

        def initialize(
          @service_environment_arn : String,
          @service_environment_name : String
        )
        end
      end

      # A data volume that's used in a job's container properties.

      struct Volume
        include JSON::Serializable

        # This parameter is specified when you're using an Amazon Elastic File System file system for job
        # storage. Jobs that are running on Fargate resources must specify a platformVersion of at least 1.4.0
        # .

        @[JSON::Field(key: "efsVolumeConfiguration")]
        getter efs_volume_configuration : Types::EFSVolumeConfiguration?

        # The contents of the host parameter determine whether your data volume persists on the host container
        # instance and where it's stored. If the host parameter is empty, then the Docker daemon assigns a
        # host path for your data volume. However, the data isn't guaranteed to persist after the containers
        # that are associated with it stop running. This parameter isn't applicable to jobs that are running
        # on Fargate resources and shouldn't be provided.

        @[JSON::Field(key: "host")]
        getter host : Types::Host?

        # The name of the volume. It can be up to 255 characters long. It can contain uppercase and lowercase
        # letters, numbers, hyphens (-), and underscores (_). This name is referenced in the sourceVolume
        # parameter of container definition mountPoints .

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @efs_volume_configuration : Types::EFSVolumeConfiguration? = nil,
          @host : Types::Host? = nil,
          @name : String? = nil
        )
        end
      end
    end
  end
end
