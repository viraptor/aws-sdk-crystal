require "json"
require "time"

module AwsSdk
  module Pipes
    module Types

      # This structure specifies the VPC subnets and security groups for the task, and whether a public IP
      # address is to be used. This structure is relevant only for ECS tasks that use the awsvpc network
      # mode.
      struct AwsVpcConfiguration
        include JSON::Serializable

        # Specifies the subnets associated with the task. These subnets must all be in the same VPC. You can
        # specify as many as 16 subnets.
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)

        # Specifies whether the task's elastic network interface receives a public IP address. You can specify
        # ENABLED only when LaunchType in EcsParameters is set to FARGATE .
        @[JSON::Field(key: "AssignPublicIp")]
        getter assign_public_ip : String?

        # Specifies the security groups associated with the task. These security groups must all be in the
        # same VPC. You can specify as many as five security groups. If you do not specify a security group,
        # the default security group for the VPC is used.
        @[JSON::Field(key: "SecurityGroups")]
        getter security_groups : Array(String)?

        def initialize(
          @subnets : Array(String),
          @assign_public_ip : String? = nil,
          @security_groups : Array(String)? = nil
        )
        end
      end

      # The array properties for the submitted job, such as the size of the array. The array size can be
      # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This
      # parameter is used only if the target is an Batch job.
      struct BatchArrayProperties
        include JSON::Serializable

        # The size of the array, if this is an array batch job.
        @[JSON::Field(key: "Size")]
        getter size : Int32?

        def initialize(
          @size : Int32? = nil
        )
        end
      end

      # The overrides that are sent to a container.
      struct BatchContainerOverrides
        include JSON::Serializable

        # The command to send to the container that overrides the default command from the Docker image or the
        # task definition.
        @[JSON::Field(key: "Command")]
        getter command : Array(String)?

        # The environment variables to send to the container. You can add new environment variables, which are
        # added to the container at launch, or you can override the existing environment variables from the
        # Docker image or the task definition. Environment variables cannot start with " Batch ". This naming
        # convention is reserved for variables that Batch sets.
        @[JSON::Field(key: "Environment")]
        getter environment : Array(Types::BatchEnvironmentVariable)?

        # The instance type to use for a multi-node parallel job. This parameter isn't applicable to
        # single-node container jobs or jobs that run on Fargate resources, and shouldn't be provided.
        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The type and amount of resources to assign to a container. This overrides the settings in the job
        # definition. The supported resources include GPU , MEMORY , and VCPU .
        @[JSON::Field(key: "ResourceRequirements")]
        getter resource_requirements : Array(Types::BatchResourceRequirement)?

        def initialize(
          @command : Array(String)? = nil,
          @environment : Array(Types::BatchEnvironmentVariable)? = nil,
          @instance_type : String? = nil,
          @resource_requirements : Array(Types::BatchResourceRequirement)? = nil
        )
        end
      end

      # The environment variables to send to the container. You can add new environment variables, which are
      # added to the container at launch, or you can override the existing environment variables from the
      # Docker image or the task definition. Environment variables cannot start with " Batch ". This naming
      # convention is reserved for variables that Batch sets.
      struct BatchEnvironmentVariable
        include JSON::Serializable

        # The name of the key-value pair. For environment variables, this is the name of the environment
        # variable.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The value of the key-value pair. For environment variables, this is the value of the environment
        # variable.
        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # An object that represents an Batch job dependency.
      struct BatchJobDependency
        include JSON::Serializable

        # The job ID of the Batch job that's associated with this dependency.
        @[JSON::Field(key: "JobId")]
        getter job_id : String?

        # The type of the job dependency.
        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @job_id : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The type and amount of a resource to assign to a container. The supported resources include GPU ,
      # MEMORY , and VCPU .
      struct BatchResourceRequirement
        include JSON::Serializable

        # The type of resource to assign to a container. The supported resources include GPU , MEMORY , and
        # VCPU .
        @[JSON::Field(key: "Type")]
        getter type : String

        # The quantity of the specified resource to reserve for the container. The values vary based on the
        # type specified. type="GPU" The number of physical GPUs to reserve for the container. Make sure that
        # the number of GPUs reserved for all containers in a job doesn't exceed the number of available GPUs
        # on the compute resource that the job is launched on. GPUs aren't available for jobs that are running
        # on Fargate resources. type="MEMORY" The memory hard limit (in MiB) present to the container. This
        # parameter is supported for jobs that are running on EC2 resources. If your container attempts to
        # exceed the memory specified, the container is terminated. This parameter maps to Memory in the
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
        # = 1 or 2 value = 8192 VCPU = 1, 2, 4, or 8 value = 9216, 10240, 11264, 12288, 13312, 14336, or 15360
        # VCPU = 2 or 4 value = 16384 VCPU = 2, 4, or 8 value = 17408, 18432, 19456, 21504, 22528, 23552,
        # 25600, 26624, 27648, 29696, or 30720 VCPU = 4 value = 20480, 24576, or 28672 VCPU = 4 or 8 value =
        # 36864, 45056, 53248, or 61440 VCPU = 8 value = 32768, 40960, 49152, or 57344 VCPU = 8 or 16 value =
        # 65536, 73728, 81920, 90112, 98304, 106496, 114688, or 122880 VCPU = 16 type="VCPU" The number of
        # vCPUs reserved for the container. This parameter maps to CpuShares in the Create a container section
        # of the Docker Remote API and the --cpu-shares option to docker run . Each vCPU is equivalent to
        # 1,024 CPU shares. For EC2 resources, you must specify at least one vCPU. This is required but can be
        # specified in several places; it must be specified for each node at least once. The default for the
        # Fargate On-Demand vCPU resource count quota is 6 vCPUs. For more information about Fargate quotas,
        # see Fargate quotas in the Amazon Web Services General Reference . For jobs that are running on
        # Fargate resources, then value must match one of the supported values and the MEMORY values must be
        # one of the values supported for that VCPU value. The supported values are 0.25, 0.5, 1, 2, 4, 8, and
        # 16 value = 0.25 MEMORY = 512, 1024, or 2048 value = 0.5 MEMORY = 1024, 2048, 3072, or 4096 value = 1
        # MEMORY = 2048, 3072, 4096, 5120, 6144, 7168, or 8192 value = 2 MEMORY = 4096, 5120, 6144, 7168,
        # 8192, 9216, 10240, 11264, 12288, 13312, 14336, 15360, or 16384 value = 4 MEMORY = 8192, 9216, 10240,
        # 11264, 12288, 13312, 14336, 15360, 16384, 17408, 18432, 19456, 20480, 21504, 22528, 23552, 24576,
        # 25600, 26624, 27648, 28672, 29696, or 30720 value = 8 MEMORY = 16384, 20480, 24576, 28672, 32768,
        # 36864, 40960, 45056, 49152, 53248, 57344, or 61440 value = 16 MEMORY = 32768, 40960, 49152, 57344,
        # 65536, 73728, 81920, 90112, 98304, 106496, 114688, or 122880
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # The retry strategy that's associated with a job. For more information, see Automated job retries in
      # the Batch User Guide .
      struct BatchRetryStrategy
        include JSON::Serializable

        # The number of times to move a job to the RUNNABLE status. If the value of attempts is greater than
        # one, the job is retried on failure the same number of attempts as the value.
        @[JSON::Field(key: "Attempts")]
        getter attempts : Int32?

        def initialize(
          @attempts : Int32? = nil
        )
        end
      end

      # The details of a capacity provider strategy. To learn more, see CapacityProviderStrategyItem in the
      # Amazon ECS API Reference.
      struct CapacityProviderStrategyItem
        include JSON::Serializable

        # The short name of the capacity provider.
        @[JSON::Field(key: "capacityProvider")]
        getter capacity_provider : String

        # The base value designates how many tasks, at a minimum, to run on the specified capacity provider.
        # Only one capacity provider in a capacity provider strategy can have a base defined. If no value is
        # specified, the default value of 0 is used.
        @[JSON::Field(key: "base")]
        getter base : Int32?

        # The weight value designates the relative percentage of the total number of tasks launched that
        # should use the specified capacity provider. The weight value is taken into consideration after the
        # base value, if defined, is satisfied.
        @[JSON::Field(key: "weight")]
        getter weight : Int32?

        def initialize(
          @capacity_provider : String,
          @base : Int32? = nil,
          @weight : Int32? = nil
        )
        end
      end

      # The Amazon CloudWatch Logs logging configuration settings for the pipe.
      struct CloudwatchLogsLogDestination
        include JSON::Serializable

        # The Amazon Web Services Resource Name (ARN) for the CloudWatch log group to which EventBridge sends
        # the log records.
        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @log_group_arn : String? = nil
        )
        end
      end

      # The Amazon CloudWatch Logs logging configuration settings for the pipe.
      struct CloudwatchLogsLogDestinationParameters
        include JSON::Serializable

        # The Amazon Web Services Resource Name (ARN) for the CloudWatch log group to which EventBridge sends
        # the log records.
        @[JSON::Field(key: "LogGroupArn")]
        getter log_group_arn : String

        def initialize(
          @log_group_arn : String
        )
        end
      end

      # An action you attempted resulted in an exception.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the resource that caused the exception.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that caused the exception.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreatePipeRequest
        include JSON::Serializable

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN of the role that allows the pipe to send data to the target.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The ARN of the source resource.
        @[JSON::Field(key: "Source")]
        getter source : String

        # The ARN of the target resource.
        @[JSON::Field(key: "Target")]
        getter target : String

        # A description of the pipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # The ARN of the enrichment resource.
        @[JSON::Field(key: "Enrichment")]
        getter enrichment : String?

        # The parameters required to set up enrichment on your pipe.
        @[JSON::Field(key: "EnrichmentParameters")]
        getter enrichment_parameters : Types::PipeEnrichmentParameters?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt pipe data. The identifier can be the key Amazon Resource Name (ARN),
        # KeyId, key alias, or key alias ARN. If you do not specify a customer managed key identifier,
        # EventBridge uses an Amazon Web Services owned key to encrypt pipe data. For more information, see
        # Managing keys in the Key Management Service Developer Guide .
        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The logging configuration settings for the pipe.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::PipeLogConfigurationParameters?

        # The parameters required to set up a source for your pipe.
        @[JSON::Field(key: "SourceParameters")]
        getter source_parameters : Types::PipeSourceParameters?

        # The list of key-value pairs to associate with the pipe.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The parameters required to set up a target for your pipe. For more information about pipe target
        # parameters, including how to use dynamic path parameters, see Target parameters in the Amazon
        # EventBridge User Guide .
        @[JSON::Field(key: "TargetParameters")]
        getter target_parameters : Types::PipeTargetParameters?

        def initialize(
          @name : String,
          @role_arn : String,
          @source : String,
          @target : String,
          @description : String? = nil,
          @desired_state : String? = nil,
          @enrichment : String? = nil,
          @enrichment_parameters : Types::PipeEnrichmentParameters? = nil,
          @kms_key_identifier : String? = nil,
          @log_configuration : Types::PipeLogConfigurationParameters? = nil,
          @source_parameters : Types::PipeSourceParameters? = nil,
          @tags : Hash(String, String)? = nil,
          @target_parameters : Types::PipeTargetParameters? = nil
        )
        end
      end

      struct CreatePipeResponse
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # A DeadLetterConfig object that contains information about a dead-letter queue configuration.
      struct DeadLetterConfig
        include JSON::Serializable

        # The ARN of the specified target for the dead-letter queue. For Amazon Kinesis stream and Amazon
        # DynamoDB stream sources, specify either an Amazon SNS topic or Amazon SQS queue ARN.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      struct DeletePipeRequest
        include JSON::Serializable

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeletePipeResponse
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      struct DescribePipeRequest
        include JSON::Serializable

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribePipeResponse
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # A description of the pipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # The ARN of the enrichment resource.
        @[JSON::Field(key: "Enrichment")]
        getter enrichment : String?

        # The parameters required to set up enrichment on your pipe.
        @[JSON::Field(key: "EnrichmentParameters")]
        getter enrichment_parameters : Types::PipeEnrichmentParameters?

        # The identifier of the KMS customer managed key for EventBridge to use to encrypt pipe data, if one
        # has been specified. For more information, see Data encryption in EventBridge in the Amazon
        # EventBridge User Guide .
        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The logging configuration settings for the pipe.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::PipeLogConfiguration?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the role that allows the pipe to send data to the target.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The ARN of the source resource.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # The parameters required to set up a source for your pipe.
        @[JSON::Field(key: "SourceParameters")]
        getter source_parameters : Types::PipeSourceParameters?

        # The reason the pipe is in its current state.
        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # The list of key-value pairs to associate with the pipe.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The ARN of the target resource.
        @[JSON::Field(key: "Target")]
        getter target : String?

        # The parameters required to set up a target for your pipe. For more information about pipe target
        # parameters, including how to use dynamic path parameters, see Target parameters in the Amazon
        # EventBridge User Guide .
        @[JSON::Field(key: "TargetParameters")]
        getter target_parameters : Types::PipeTargetParameters?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @description : String? = nil,
          @desired_state : String? = nil,
          @enrichment : String? = nil,
          @enrichment_parameters : Types::PipeEnrichmentParameters? = nil,
          @kms_key_identifier : String? = nil,
          @last_modified_time : Time? = nil,
          @log_configuration : Types::PipeLogConfiguration? = nil,
          @name : String? = nil,
          @role_arn : String? = nil,
          @source : String? = nil,
          @source_parameters : Types::PipeSourceParameters? = nil,
          @state_reason : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target : String? = nil,
          @target_parameters : Types::PipeTargetParameters? = nil
        )
        end
      end

      # Maps source data to a dimension in the target Timestream for LiveAnalytics table. For more
      # information, see Amazon Timestream for LiveAnalytics concepts
      struct DimensionMapping
        include JSON::Serializable

        # The metadata attributes of the time series. For example, the name and Availability Zone of an Amazon
        # EC2 instance or the name of the manufacturer of a wind turbine are dimensions.
        @[JSON::Field(key: "DimensionName")]
        getter dimension_name : String

        # Dynamic path to the dimension value in the source event.
        @[JSON::Field(key: "DimensionValue")]
        getter dimension_value : String

        # The data type of the dimension for the time-series data.
        @[JSON::Field(key: "DimensionValueType")]
        getter dimension_value_type : String

        def initialize(
          @dimension_name : String,
          @dimension_value : String,
          @dimension_value_type : String
        )
        end
      end

      # The overrides that are sent to a container. An empty container override can be passed in. An example
      # of an empty container override is {"containerOverrides": [ ] } . If a non-empty container override
      # is specified, the name parameter must be included.
      struct EcsContainerOverride
        include JSON::Serializable

        # The command to send to the container that overrides the default command from the Docker image or the
        # task definition. You must also specify a container name.
        @[JSON::Field(key: "Command")]
        getter command : Array(String)?

        # The number of cpu units reserved for the container, instead of the default value from the task
        # definition. You must also specify a container name.
        @[JSON::Field(key: "Cpu")]
        getter cpu : Int32?

        # The environment variables to send to the container. You can add new environment variables, which are
        # added to the container at launch, or you can override the existing environment variables from the
        # Docker image or the task definition. You must also specify a container name.
        @[JSON::Field(key: "Environment")]
        getter environment : Array(Types::EcsEnvironmentVariable)?

        # A list of files containing the environment variables to pass to a container, instead of the value
        # from the container definition.
        @[JSON::Field(key: "EnvironmentFiles")]
        getter environment_files : Array(Types::EcsEnvironmentFile)?

        # The hard limit (in MiB) of memory to present to the container, instead of the default value from the
        # task definition. If your container attempts to exceed the memory specified here, the container is
        # killed. You must also specify a container name.
        @[JSON::Field(key: "Memory")]
        getter memory : Int32?

        # The soft limit (in MiB) of memory to reserve for the container, instead of the default value from
        # the task definition. You must also specify a container name.
        @[JSON::Field(key: "MemoryReservation")]
        getter memory_reservation : Int32?

        # The name of the container that receives the override. This parameter is required if any override is
        # specified.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type and amount of a resource to assign to a container, instead of the default value from the
        # task definition. The only supported resource is a GPU.
        @[JSON::Field(key: "ResourceRequirements")]
        getter resource_requirements : Array(Types::EcsResourceRequirement)?

        def initialize(
          @command : Array(String)? = nil,
          @cpu : Int32? = nil,
          @environment : Array(Types::EcsEnvironmentVariable)? = nil,
          @environment_files : Array(Types::EcsEnvironmentFile)? = nil,
          @memory : Int32? = nil,
          @memory_reservation : Int32? = nil,
          @name : String? = nil,
          @resource_requirements : Array(Types::EcsResourceRequirement)? = nil
        )
        end
      end

      # A list of files containing the environment variables to pass to a container. You can specify up to
      # ten environment files. The file must have a .env file extension. Each line in an environment file
      # should contain an environment variable in VARIABLE=VALUE format. Lines beginning with # are treated
      # as comments and are ignored. For more information about the environment variable file syntax, see
      # Declare default environment variables in file . If there are environment variables specified using
      # the environment parameter in a container definition, they take precedence over the variables
      # contained within an environment file. If multiple environment files are specified that contain the
      # same variable, they're processed from the top down. We recommend that you use unique variable names.
      # For more information, see Specifying environment variables in the Amazon Elastic Container Service
      # Developer Guide . This parameter is only supported for tasks hosted on Fargate using the following
      # platform versions: Linux platform version 1.4.0 or later. Windows platform version 1.0.0 or later.
      struct EcsEnvironmentFile
        include JSON::Serializable

        # The file type to use. The only supported value is s3 .
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

      # The environment variables to send to the container. You can add new environment variables, which are
      # added to the container at launch, or you can override the existing environment variables from the
      # Docker image or the task definition. You must also specify a container name.
      struct EcsEnvironmentVariable
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

      # The amount of ephemeral storage to allocate for the task. This parameter is used to expand the total
      # amount of ephemeral storage available, beyond the default amount, for tasks hosted on Fargate. For
      # more information, see Fargate task storage in the Amazon ECS User Guide for Fargate . This parameter
      # is only supported for tasks hosted on Fargate using Linux platform version 1.4.0 or later. This
      # parameter is not supported for Windows containers on Fargate.
      struct EcsEphemeralStorage
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

      # Details on an Elastic Inference accelerator task override. This parameter is used to override the
      # Elastic Inference accelerator specified in the task definition. For more information, see Working
      # with Amazon Elastic Inference on Amazon ECS in the Amazon Elastic Container Service Developer Guide
      # .
      struct EcsInferenceAcceleratorOverride
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

      # The type and amount of a resource to assign to a container. The supported resource types are GPUs
      # and Elastic Inference accelerators. For more information, see Working with GPUs on Amazon ECS or
      # Working with Amazon Elastic Inference on Amazon ECS in the Amazon Elastic Container Service
      # Developer Guide
      struct EcsResourceRequirement
        include JSON::Serializable

        # The type of resource to assign to a container. The supported values are GPU or InferenceAccelerator
        # .
        @[JSON::Field(key: "type")]
        getter type : String

        # The value for the specified resource type. If the GPU type is used, the value is the number of
        # physical GPUs the Amazon ECS container agent reserves for the container. The number of GPUs that's
        # reserved for all containers in a task can't exceed the number of available GPUs on the container
        # instance that the task is launched on. If the InferenceAccelerator type is used, the value matches
        # the deviceName for an InferenceAccelerator specified in a task definition.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @type : String,
          @value : String
        )
        end
      end

      # The overrides that are associated with a task.
      struct EcsTaskOverride
        include JSON::Serializable

        # One or more container overrides that are sent to a task.
        @[JSON::Field(key: "ContainerOverrides")]
        getter container_overrides : Array(Types::EcsContainerOverride)?

        # The cpu override for the task.
        @[JSON::Field(key: "Cpu")]
        getter cpu : String?

        # The ephemeral storage setting override for the task. This parameter is only supported for tasks
        # hosted on Fargate that use the following platform versions: Linux platform version 1.4.0 or later.
        # Windows platform version 1.0.0 or later.
        @[JSON::Field(key: "EphemeralStorage")]
        getter ephemeral_storage : Types::EcsEphemeralStorage?

        # The Amazon Resource Name (ARN) of the task execution IAM role override for the task. For more
        # information, see Amazon ECS task execution IAM role in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The Elastic Inference accelerator override for the task.
        @[JSON::Field(key: "InferenceAcceleratorOverrides")]
        getter inference_accelerator_overrides : Array(Types::EcsInferenceAcceleratorOverride)?

        # The memory override for the task.
        @[JSON::Field(key: "Memory")]
        getter memory : String?

        # The Amazon Resource Name (ARN) of the IAM role that containers in this task can assume. All
        # containers in this task are granted the permissions that are specified in this role. For more
        # information, see IAM Role for Tasks in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "TaskRoleArn")]
        getter task_role_arn : String?

        def initialize(
          @container_overrides : Array(Types::EcsContainerOverride)? = nil,
          @cpu : String? = nil,
          @ephemeral_storage : Types::EcsEphemeralStorage? = nil,
          @execution_role_arn : String? = nil,
          @inference_accelerator_overrides : Array(Types::EcsInferenceAcceleratorOverride)? = nil,
          @memory : String? = nil,
          @task_role_arn : String? = nil
        )
        end
      end

      # Filter events using an event pattern. For more information, see Events and Event Patterns in the
      # Amazon EventBridge User Guide .
      struct Filter
        include JSON::Serializable

        # The event pattern.
        @[JSON::Field(key: "Pattern")]
        getter pattern : String?

        def initialize(
          @pattern : String? = nil
        )
        end
      end

      # The collection of event patterns used to filter events. To remove a filter, specify a FilterCriteria
      # object with an empty array of Filter objects. For more information, see Events and Event Patterns in
      # the Amazon EventBridge User Guide .
      struct FilterCriteria
        include JSON::Serializable

        # The event patterns.
        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::Filter)?

        def initialize(
          @filters : Array(Types::Filter)? = nil
        )
        end
      end

      # The Amazon Data Firehose logging configuration settings for the pipe.
      struct FirehoseLogDestination
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Firehose delivery stream to which EventBridge delivers the
        # pipe log records.
        @[JSON::Field(key: "DeliveryStreamArn")]
        getter delivery_stream_arn : String?

        def initialize(
          @delivery_stream_arn : String? = nil
        )
        end
      end

      # The Amazon Data Firehose logging configuration settings for the pipe.
      struct FirehoseLogDestinationParameters
        include JSON::Serializable

        # Specifies the Amazon Resource Name (ARN) of the Firehose delivery stream to which EventBridge
        # delivers the pipe log records.
        @[JSON::Field(key: "DeliveryStreamArn")]
        getter delivery_stream_arn : String

        def initialize(
          @delivery_stream_arn : String
        )
        end
      end

      # This exception occurs due to unexpected causes.
      struct InternalException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the action that caused the exception.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListPipesRequest
        include JSON::Serializable

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # The maximum number of pipes to include in the response.
        @[JSON::Field(key: "Limit")]
        getter limit : Int32?

        # A value that will return a subset of the pipes associated with this account. For example,
        # "NamePrefix": "ABC" will return all endpoints with "ABC" in the name.
        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The prefix matching the pipe source.
        @[JSON::Field(key: "SourcePrefix")]
        getter source_prefix : String?

        # The prefix matching the pipe target.
        @[JSON::Field(key: "TargetPrefix")]
        getter target_prefix : String?

        def initialize(
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @limit : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil,
          @source_prefix : String? = nil,
          @target_prefix : String? = nil
        )
        end
      end

      struct ListPipesResponse
        include JSON::Serializable

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The pipes returned by the call.
        @[JSON::Field(key: "Pipes")]
        getter pipes : Array(Types::Pipe)?

        def initialize(
          @next_token : String? = nil,
          @pipes : Array(Types::Pipe)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the pipe for which you want to view tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of key-value pairs to associate with the pipe.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The Secrets Manager secret that stores your broker credentials.
      struct MQBrokerAccessCredentials
        include JSON::Serializable

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "BasicAuth")]
        getter basic_auth : String?

        def initialize(
          @basic_auth : String? = nil
        )
        end
      end

      # The Secrets Manager secret that stores your stream credentials.
      struct MSKAccessCredentials
        include JSON::Serializable

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "ClientCertificateTlsAuth")]
        getter client_certificate_tls_auth : String?

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "SaslScram512Auth")]
        getter sasl_scram512_auth : String?

        def initialize(
          @client_certificate_tls_auth : String? = nil,
          @sasl_scram512_auth : String? = nil
        )
        end
      end

      # A mapping of a source event data field to a measure in a Timestream for LiveAnalytics record.
      struct MultiMeasureAttributeMapping
        include JSON::Serializable

        # Dynamic path to the measurement attribute in the source event.
        @[JSON::Field(key: "MeasureValue")]
        getter measure_value : String

        # Data type of the measurement attribute in the source event.
        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String

        # Target measure name to be used.
        @[JSON::Field(key: "MultiMeasureAttributeName")]
        getter multi_measure_attribute_name : String

        def initialize(
          @measure_value : String,
          @measure_value_type : String,
          @multi_measure_attribute_name : String
        )
        end
      end

      # Maps multiple measures from the source event to the same Timestream for LiveAnalytics record. For
      # more information, see Amazon Timestream for LiveAnalytics concepts
      struct MultiMeasureMapping
        include JSON::Serializable

        # Mappings that represent multiple source event fields mapped to measures in the same Timestream for
        # LiveAnalytics record.
        @[JSON::Field(key: "MultiMeasureAttributeMappings")]
        getter multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping)

        # The name of the multiple measurements per record (multi-measure).
        @[JSON::Field(key: "MultiMeasureName")]
        getter multi_measure_name : String

        def initialize(
          @multi_measure_attribute_mappings : Array(Types::MultiMeasureAttributeMapping),
          @multi_measure_name : String
        )
        end
      end

      # This structure specifies the network configuration for an Amazon ECS task.
      struct NetworkConfiguration
        include JSON::Serializable

        # Use this structure to specify the VPC subnets and security groups for the task, and whether a public
        # IP address is to be used. This structure is relevant only for ECS tasks that use the awsvpc network
        # mode.
        @[JSON::Field(key: "awsvpcConfiguration")]
        getter awsvpc_configuration : Types::AwsVpcConfiguration?

        def initialize(
          @awsvpc_configuration : Types::AwsVpcConfiguration? = nil
        )
        end
      end

      # An entity that you specified does not exist.
      struct NotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that represents a pipe. Amazon EventBridgePipes connect event sources to targets and
      # reduces the need for specialized knowledge and integration code.
      struct Pipe
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # The ARN of the enrichment resource.
        @[JSON::Field(key: "Enrichment")]
        getter enrichment : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The ARN of the source resource.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # The reason the pipe is in its current state.
        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # The ARN of the target resource.
        @[JSON::Field(key: "Target")]
        getter target : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @enrichment : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @source : String? = nil,
          @state_reason : String? = nil,
          @target : String? = nil
        )
        end
      end

      # These are custom parameter to be used when the target is an API Gateway REST APIs or EventBridge
      # ApiDestinations. In the latter case, these are merged with any InvocationParameters specified on the
      # Connection, with any values from the Connection taking precedence.
      struct PipeEnrichmentHttpParameters
        include JSON::Serializable

        # The headers that need to be sent as part of request invoking the API Gateway REST API or EventBridge
        # ApiDestination.
        @[JSON::Field(key: "HeaderParameters")]
        getter header_parameters : Hash(String, String)?

        # The path parameter values to be used to populate API Gateway REST API or EventBridge ApiDestination
        # path wildcards ("*").
        @[JSON::Field(key: "PathParameterValues")]
        getter path_parameter_values : Array(String)?

        # The query string keys/values that need to be sent as part of request invoking the API Gateway REST
        # API or EventBridge ApiDestination.
        @[JSON::Field(key: "QueryStringParameters")]
        getter query_string_parameters : Hash(String, String)?

        def initialize(
          @header_parameters : Hash(String, String)? = nil,
          @path_parameter_values : Array(String)? = nil,
          @query_string_parameters : Hash(String, String)? = nil
        )
        end
      end

      # The parameters required to set up enrichment on your pipe.
      struct PipeEnrichmentParameters
        include JSON::Serializable

        # Contains the HTTP parameters to use when the target is a API Gateway REST endpoint or EventBridge
        # ApiDestination. If you specify an API Gateway REST API or EventBridge ApiDestination as a target,
        # you can use this parameter to specify headers, path parameters, and query string keys/values as part
        # of your target invoking request. If you're using ApiDestinations, the corresponding Connection can
        # also have these values configured. In case of any conflicting keys, values from the Connection take
        # precedence.
        @[JSON::Field(key: "HttpParameters")]
        getter http_parameters : Types::PipeEnrichmentHttpParameters?

        # Valid JSON text passed to the enrichment. In this case, nothing from the event itself is passed to
        # the enrichment. For more information, see The JavaScript Object Notation (JSON) Data Interchange
        # Format . To remove an input template, specify an empty string.
        @[JSON::Field(key: "InputTemplate")]
        getter input_template : String?

        def initialize(
          @http_parameters : Types::PipeEnrichmentHttpParameters? = nil,
          @input_template : String? = nil
        )
        end
      end

      # The logging configuration settings for the pipe.
      struct PipeLogConfiguration
        include JSON::Serializable

        # The Amazon CloudWatch Logs logging configuration settings for the pipe.
        @[JSON::Field(key: "CloudwatchLogsLogDestination")]
        getter cloudwatch_logs_log_destination : Types::CloudwatchLogsLogDestination?

        # The Amazon Data Firehose logging configuration settings for the pipe.
        @[JSON::Field(key: "FirehoseLogDestination")]
        getter firehose_log_destination : Types::FirehoseLogDestination?

        # Whether the execution data (specifically, the payload , awsRequest , and awsResponse fields) is
        # included in the log messages for this pipe. This applies to all log destinations for the pipe. For
        # more information, see Including execution data in logs in the Amazon EventBridge User Guide .
        @[JSON::Field(key: "IncludeExecutionData")]
        getter include_execution_data : Array(String)?

        # The level of logging detail to include. This applies to all log destinations for the pipe.
        @[JSON::Field(key: "Level")]
        getter level : String?

        # The Amazon S3 logging configuration settings for the pipe.
        @[JSON::Field(key: "S3LogDestination")]
        getter s3_log_destination : Types::S3LogDestination?

        def initialize(
          @cloudwatch_logs_log_destination : Types::CloudwatchLogsLogDestination? = nil,
          @firehose_log_destination : Types::FirehoseLogDestination? = nil,
          @include_execution_data : Array(String)? = nil,
          @level : String? = nil,
          @s3_log_destination : Types::S3LogDestination? = nil
        )
        end
      end

      # Specifies the logging configuration settings for the pipe. When you call UpdatePipe , EventBridge
      # updates the fields in the PipeLogConfigurationParameters object atomically as one and overrides
      # existing values. This is by design. If you don't specify an optional field in any of the Amazon Web
      # Services service parameters objects ( CloudwatchLogsLogDestinationParameters ,
      # FirehoseLogDestinationParameters , or S3LogDestinationParameters ), EventBridge sets that field to
      # its system-default value during the update. For example, suppose when you created the pipe you
      # specified a Firehose stream log destination. You then update the pipe to add an Amazon S3 log
      # destination. In addition to specifying the S3LogDestinationParameters for the new log destination,
      # you must also specify the fields in the FirehoseLogDestinationParameters object in order to retain
      # the Firehose stream log destination. For more information on generating pipe log records, see Log
      # EventBridge Pipes in the Amazon EventBridge User Guide .
      struct PipeLogConfigurationParameters
        include JSON::Serializable

        # The level of logging detail to include. This applies to all log destinations for the pipe. For more
        # information, see Specifying EventBridge Pipes log level in the Amazon EventBridge User Guide .
        @[JSON::Field(key: "Level")]
        getter level : String

        # The Amazon CloudWatch Logs logging configuration settings for the pipe.
        @[JSON::Field(key: "CloudwatchLogsLogDestination")]
        getter cloudwatch_logs_log_destination : Types::CloudwatchLogsLogDestinationParameters?

        # The Amazon Data Firehose logging configuration settings for the pipe.
        @[JSON::Field(key: "FirehoseLogDestination")]
        getter firehose_log_destination : Types::FirehoseLogDestinationParameters?

        # Specify ALL to include the execution data (specifically, the payload , awsRequest , and awsResponse
        # fields) in the log messages for this pipe. This applies to all log destinations for the pipe. For
        # more information, see Including execution data in logs in the Amazon EventBridge User Guide . By
        # default, execution data is not included.
        @[JSON::Field(key: "IncludeExecutionData")]
        getter include_execution_data : Array(String)?

        # The Amazon S3 logging configuration settings for the pipe.
        @[JSON::Field(key: "S3LogDestination")]
        getter s3_log_destination : Types::S3LogDestinationParameters?

        def initialize(
          @level : String,
          @cloudwatch_logs_log_destination : Types::CloudwatchLogsLogDestinationParameters? = nil,
          @firehose_log_destination : Types::FirehoseLogDestinationParameters? = nil,
          @include_execution_data : Array(String)? = nil,
          @s3_log_destination : Types::S3LogDestinationParameters? = nil
        )
        end
      end

      # The parameters for using an Active MQ broker as a source.
      struct PipeSourceActiveMQBrokerParameters
        include JSON::Serializable

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::MQBrokerAccessCredentials

        # The name of the destination queue to consume.
        @[JSON::Field(key: "QueueName")]
        getter queue_name : String

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        def initialize(
          @credentials : Types::MQBrokerAccessCredentials,
          @queue_name : String,
          @batch_size : Int32? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil
        )
        end
      end

      # The parameters for using a DynamoDB stream as a source.
      struct PipeSourceDynamoDBStreamParameters
        include JSON::Serializable

        # The position in a stream from which to start reading.
        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : String

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # Define the target queue to send dead-letter queue events to.
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # Discard records older than the specified age. The default value is -1, which sets the maximum age to
        # infinite. When the value is set to infinite, EventBridge never discards old records.
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # Discard records after the specified number of retries. The default value is -1, which sets the
        # maximum number of retries to infinite. When MaximumRetryAttempts is infinite, EventBridge retries
        # failed records until the record expires in the event source.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # Define how to handle item process failures. AUTOMATIC_BISECT halves each batch and retry each half
        # until all the records are processed or there is one failed message left in the batch.
        @[JSON::Field(key: "OnPartialBatchItemFailure")]
        getter on_partial_batch_item_failure : String?

        # The number of batches to process concurrently from each shard. The default value is 1.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        def initialize(
          @starting_position : String,
          @batch_size : Int32? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @on_partial_batch_item_failure : String? = nil,
          @parallelization_factor : Int32? = nil
        )
        end
      end

      # The parameters for using a Kinesis stream as a source.
      struct PipeSourceKinesisStreamParameters
        include JSON::Serializable

        # The position in a stream from which to start reading.
        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : String

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # Define the target queue to send dead-letter queue events to.
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # Discard records older than the specified age. The default value is -1, which sets the maximum age to
        # infinite. When the value is set to infinite, EventBridge never discards old records.
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # Discard records after the specified number of retries. The default value is -1, which sets the
        # maximum number of retries to infinite. When MaximumRetryAttempts is infinite, EventBridge retries
        # failed records until the record expires in the event source.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # Define how to handle item process failures. AUTOMATIC_BISECT halves each batch and retry each half
        # until all the records are processed or there is one failed message left in the batch.
        @[JSON::Field(key: "OnPartialBatchItemFailure")]
        getter on_partial_batch_item_failure : String?

        # The number of batches to process concurrently from each shard. The default value is 1.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        # With StartingPosition set to AT_TIMESTAMP , the time from which to start reading, in Unix time
        # seconds.
        @[JSON::Field(key: "StartingPositionTimestamp")]
        getter starting_position_timestamp : Time?

        def initialize(
          @starting_position : String,
          @batch_size : Int32? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @on_partial_batch_item_failure : String? = nil,
          @parallelization_factor : Int32? = nil,
          @starting_position_timestamp : Time? = nil
        )
        end
      end

      # The parameters for using an MSK stream as a source.
      struct PipeSourceManagedStreamingKafkaParameters
        include JSON::Serializable

        # The name of the topic that the pipe will read from.
        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The name of the destination queue to consume.
        @[JSON::Field(key: "ConsumerGroupID")]
        getter consumer_group_id : String?

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::MSKAccessCredentials?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # The position in a stream from which to start reading.
        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : String?

        def initialize(
          @topic_name : String,
          @batch_size : Int32? = nil,
          @consumer_group_id : String? = nil,
          @credentials : Types::MSKAccessCredentials? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @starting_position : String? = nil
        )
        end
      end

      # The parameters required to set up a source for your pipe.
      struct PipeSourceParameters
        include JSON::Serializable

        # The parameters for using an Active MQ broker as a source.
        @[JSON::Field(key: "ActiveMQBrokerParameters")]
        getter active_mq_broker_parameters : Types::PipeSourceActiveMQBrokerParameters?

        # The parameters for using a DynamoDB stream as a source.
        @[JSON::Field(key: "DynamoDBStreamParameters")]
        getter dynamo_db_stream_parameters : Types::PipeSourceDynamoDBStreamParameters?

        # The collection of event patterns used to filter events. To remove a filter, specify a FilterCriteria
        # object with an empty array of Filter objects. For more information, see Events and Event Patterns in
        # the Amazon EventBridge User Guide .
        @[JSON::Field(key: "FilterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # The parameters for using a Kinesis stream as a source.
        @[JSON::Field(key: "KinesisStreamParameters")]
        getter kinesis_stream_parameters : Types::PipeSourceKinesisStreamParameters?

        # The parameters for using an MSK stream as a source.
        @[JSON::Field(key: "ManagedStreamingKafkaParameters")]
        getter managed_streaming_kafka_parameters : Types::PipeSourceManagedStreamingKafkaParameters?

        # The parameters for using a Rabbit MQ broker as a source.
        @[JSON::Field(key: "RabbitMQBrokerParameters")]
        getter rabbit_mq_broker_parameters : Types::PipeSourceRabbitMQBrokerParameters?

        # The parameters for using a self-managed Apache Kafka stream as a source. A self managed cluster
        # refers to any Apache Kafka cluster not hosted by Amazon Web Services. This includes both clusters
        # you manage yourself, as well as those hosted by a third-party provider, such as Confluent Cloud ,
        # CloudKarafka , or Redpanda . For more information, see Apache Kafka streams as a source in the
        # Amazon EventBridge User Guide .
        @[JSON::Field(key: "SelfManagedKafkaParameters")]
        getter self_managed_kafka_parameters : Types::PipeSourceSelfManagedKafkaParameters?

        # The parameters for using a Amazon SQS stream as a source.
        @[JSON::Field(key: "SqsQueueParameters")]
        getter sqs_queue_parameters : Types::PipeSourceSqsQueueParameters?

        def initialize(
          @active_mq_broker_parameters : Types::PipeSourceActiveMQBrokerParameters? = nil,
          @dynamo_db_stream_parameters : Types::PipeSourceDynamoDBStreamParameters? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @kinesis_stream_parameters : Types::PipeSourceKinesisStreamParameters? = nil,
          @managed_streaming_kafka_parameters : Types::PipeSourceManagedStreamingKafkaParameters? = nil,
          @rabbit_mq_broker_parameters : Types::PipeSourceRabbitMQBrokerParameters? = nil,
          @self_managed_kafka_parameters : Types::PipeSourceSelfManagedKafkaParameters? = nil,
          @sqs_queue_parameters : Types::PipeSourceSqsQueueParameters? = nil
        )
        end
      end

      # The parameters for using a Rabbit MQ broker as a source.
      struct PipeSourceRabbitMQBrokerParameters
        include JSON::Serializable

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::MQBrokerAccessCredentials

        # The name of the destination queue to consume.
        @[JSON::Field(key: "QueueName")]
        getter queue_name : String

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # The name of the virtual host associated with the source broker.
        @[JSON::Field(key: "VirtualHost")]
        getter virtual_host : String?

        def initialize(
          @credentials : Types::MQBrokerAccessCredentials,
          @queue_name : String,
          @batch_size : Int32? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @virtual_host : String? = nil
        )
        end
      end

      # The parameters for using a self-managed Apache Kafka stream as a source. A self managed cluster
      # refers to any Apache Kafka cluster not hosted by Amazon Web Services. This includes both clusters
      # you manage yourself, as well as those hosted by a third-party provider, such as Confluent Cloud ,
      # CloudKarafka , or Redpanda . For more information, see Apache Kafka streams as a source in the
      # Amazon EventBridge User Guide .
      struct PipeSourceSelfManagedKafkaParameters
        include JSON::Serializable

        # The name of the topic that the pipe will read from.
        @[JSON::Field(key: "TopicName")]
        getter topic_name : String

        # An array of server URLs.
        @[JSON::Field(key: "AdditionalBootstrapServers")]
        getter additional_bootstrap_servers : Array(String)?

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The name of the destination queue to consume.
        @[JSON::Field(key: "ConsumerGroupID")]
        getter consumer_group_id : String?

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::SelfManagedKafkaAccessConfigurationCredentials?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # The ARN of the Secrets Manager secret used for certification.
        @[JSON::Field(key: "ServerRootCaCertificate")]
        getter server_root_ca_certificate : String?

        # The position in a stream from which to start reading.
        @[JSON::Field(key: "StartingPosition")]
        getter starting_position : String?

        # This structure specifies the VPC subnets and security groups for the stream, and whether a public IP
        # address is to be used.
        @[JSON::Field(key: "Vpc")]
        getter vpc : Types::SelfManagedKafkaAccessConfigurationVpc?

        def initialize(
          @topic_name : String,
          @additional_bootstrap_servers : Array(String)? = nil,
          @batch_size : Int32? = nil,
          @consumer_group_id : String? = nil,
          @credentials : Types::SelfManagedKafkaAccessConfigurationCredentials? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @server_root_ca_certificate : String? = nil,
          @starting_position : String? = nil,
          @vpc : Types::SelfManagedKafkaAccessConfigurationVpc? = nil
        )
        end
      end

      # The parameters for using a Amazon SQS stream as a source.
      struct PipeSourceSqsQueueParameters
        include JSON::Serializable

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        def initialize(
          @batch_size : Int32? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil
        )
        end
      end

      # The parameters for using an Batch job as a target.
      struct PipeTargetBatchJobParameters
        include JSON::Serializable

        # The job definition used by this job. This value can be one of name , name:revision , or the Amazon
        # Resource Name (ARN) for the job definition. If name is specified without a revision then the latest
        # active revision is used.
        @[JSON::Field(key: "JobDefinition")]
        getter job_definition : String

        # The name of the job. It can be up to 128 letters long. The first character must be alphanumeric, can
        # contain uppercase and lowercase letters, numbers, hyphens (-), and underscores (_).
        @[JSON::Field(key: "JobName")]
        getter job_name : String

        # The array properties for the submitted job, such as the size of the array. The array size can be
        # between 2 and 10,000. If you specify array properties for a job, it becomes an array job. This
        # parameter is used only if the target is an Batch job.
        @[JSON::Field(key: "ArrayProperties")]
        getter array_properties : Types::BatchArrayProperties?

        # The overrides that are sent to a container.
        @[JSON::Field(key: "ContainerOverrides")]
        getter container_overrides : Types::BatchContainerOverrides?

        # A list of dependencies for the job. A job can depend upon a maximum of 20 jobs. You can specify a
        # SEQUENTIAL type dependency without specifying a job ID for array jobs so that each child array job
        # completes sequentially, starting at index 0. You can also specify an N_TO_N type dependency with a
        # job ID for array jobs. In that case, each index child of this job must wait for the corresponding
        # index child of each dependency to complete before it can begin.
        @[JSON::Field(key: "DependsOn")]
        getter depends_on : Array(Types::BatchJobDependency)?

        # Additional parameters passed to the job that replace parameter substitution placeholders that are
        # set in the job definition. Parameters are specified as a key and value pair mapping. Parameters
        # included here override any corresponding parameter defaults from the job definition.
        @[JSON::Field(key: "Parameters")]
        getter parameters : Hash(String, String)?

        # The retry strategy to use for failed jobs. When a retry strategy is specified here, it overrides the
        # retry strategy defined in the job definition.
        @[JSON::Field(key: "RetryStrategy")]
        getter retry_strategy : Types::BatchRetryStrategy?

        def initialize(
          @job_definition : String,
          @job_name : String,
          @array_properties : Types::BatchArrayProperties? = nil,
          @container_overrides : Types::BatchContainerOverrides? = nil,
          @depends_on : Array(Types::BatchJobDependency)? = nil,
          @parameters : Hash(String, String)? = nil,
          @retry_strategy : Types::BatchRetryStrategy? = nil
        )
        end
      end

      # The parameters for using an CloudWatch Logs log stream as a target.
      struct PipeTargetCloudWatchLogsParameters
        include JSON::Serializable

        # The name of the log stream.
        @[JSON::Field(key: "LogStreamName")]
        getter log_stream_name : String?

        # The time the event occurred, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.
        @[JSON::Field(key: "Timestamp")]
        getter timestamp : String?

        def initialize(
          @log_stream_name : String? = nil,
          @timestamp : String? = nil
        )
        end
      end

      # The parameters for using an Amazon ECS task as a target.
      struct PipeTargetEcsTaskParameters
        include JSON::Serializable

        # The ARN of the task definition to use if the event target is an Amazon ECS task.
        @[JSON::Field(key: "TaskDefinitionArn")]
        getter task_definition_arn : String

        # The capacity provider strategy to use for the task. If a capacityProviderStrategy is specified, the
        # launchType parameter must be omitted. If no capacityProviderStrategy or launchType is specified, the
        # defaultCapacityProviderStrategy for the cluster is used.
        @[JSON::Field(key: "CapacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # Specifies whether to enable Amazon ECS managed tags for the task. For more information, see Tagging
        # Your Amazon ECS Resources in the Amazon Elastic Container Service Developer Guide.
        @[JSON::Field(key: "EnableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Whether or not to enable the execute command functionality for the containers in this task. If true,
        # this enables execute command functionality on all containers in the task.
        @[JSON::Field(key: "EnableExecuteCommand")]
        getter enable_execute_command : Bool?

        # Specifies an Amazon ECS task group for the task. The maximum length is 255 characters.
        @[JSON::Field(key: "Group")]
        getter group : String?

        # Specifies the launch type on which your task is running. The launch type that you specify here must
        # match one of the launch type (compatibilities) of the target task. The FARGATE value is supported
        # only in the Regions where Fargate with Amazon ECS is supported. For more information, see Fargate on
        # Amazon ECS in the Amazon Elastic Container Service Developer Guide .
        @[JSON::Field(key: "LaunchType")]
        getter launch_type : String?

        # Use this structure if the Amazon ECS task uses the awsvpc network mode. This structure specifies the
        # VPC subnets and security groups associated with the task, and whether a public IP address is to be
        # used. This structure is required if LaunchType is FARGATE because the awsvpc mode is required for
        # Fargate tasks. If you specify NetworkConfiguration when the target ECS task does not use the awsvpc
        # network mode, the task fails.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The overrides that are associated with a task.
        @[JSON::Field(key: "Overrides")]
        getter overrides : Types::EcsTaskOverride?

        # An array of placement constraint objects to use for the task. You can specify up to 10 constraints
        # per task (including constraints in the task definition and those specified at runtime).
        @[JSON::Field(key: "PlacementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The placement strategy objects to use for the task. You can specify a maximum of five strategy rules
        # per task.
        @[JSON::Field(key: "PlacementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # Specifies the platform version for the task. Specify only the numeric portion of the platform
        # version, such as 1.1.0 . This structure is used only if LaunchType is FARGATE . For more information
        # about valid platform versions, see Fargate Platform Versions in the Amazon Elastic Container Service
        # Developer Guide .
        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # Specifies whether to propagate the tags from the task definition to the task. If no value is
        # specified, the tags are not propagated. Tags can only be propagated to the task during task
        # creation. To add tags to a task after task creation, use the TagResource API action.
        @[JSON::Field(key: "PropagateTags")]
        getter propagate_tags : String?

        # The reference ID to use for the task.
        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String?

        # The metadata that you apply to the task to help you categorize and organize them. Each tag consists
        # of a key and an optional value, both of which you define. To learn more, see RunTask in the Amazon
        # ECS API Reference.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The number of tasks to create based on TaskDefinition . The default is 1.
        @[JSON::Field(key: "TaskCount")]
        getter task_count : Int32?

        def initialize(
          @task_definition_arn : String,
          @capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)? = nil,
          @enable_ecs_managed_tags : Bool? = nil,
          @enable_execute_command : Bool? = nil,
          @group : String? = nil,
          @launch_type : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @overrides : Types::EcsTaskOverride? = nil,
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @reference_id : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @task_count : Int32? = nil
        )
        end
      end

      # The parameters for using an EventBridge event bus as a target.
      struct PipeTargetEventBridgeEventBusParameters
        include JSON::Serializable

        # A free-form string, with a maximum of 128 characters, used to decide what fields to expect in the
        # event detail.
        @[JSON::Field(key: "DetailType")]
        getter detail_type : String?

        # The URL subdomain of the endpoint. For example, if the URL for Endpoint is
        # https://abcde.veo.endpoints.event.amazonaws.com, then the EndpointId is abcde.veo .
        @[JSON::Field(key: "EndpointId")]
        getter endpoint_id : String?

        # Amazon Web Services resources, identified by Amazon Resource Name (ARN), which the event primarily
        # concerns. Any number, including zero, may be present.
        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        # The source of the event.
        @[JSON::Field(key: "Source")]
        getter source : String?

        # The time stamp of the event, per RFC3339 . If no time stamp is provided, the time stamp of the
        # PutEvents call is used.
        @[JSON::Field(key: "Time")]
        getter time : String?

        def initialize(
          @detail_type : String? = nil,
          @endpoint_id : String? = nil,
          @resources : Array(String)? = nil,
          @source : String? = nil,
          @time : String? = nil
        )
        end
      end

      # These are custom parameter to be used when the target is an API Gateway REST APIs or EventBridge
      # ApiDestinations.
      struct PipeTargetHttpParameters
        include JSON::Serializable

        # The headers that need to be sent as part of request invoking the API Gateway REST API or EventBridge
        # ApiDestination.
        @[JSON::Field(key: "HeaderParameters")]
        getter header_parameters : Hash(String, String)?

        # The path parameter values to be used to populate API Gateway REST API or EventBridge ApiDestination
        # path wildcards ("*").
        @[JSON::Field(key: "PathParameterValues")]
        getter path_parameter_values : Array(String)?

        # The query string keys/values that need to be sent as part of request invoking the API Gateway REST
        # API or EventBridge ApiDestination.
        @[JSON::Field(key: "QueryStringParameters")]
        getter query_string_parameters : Hash(String, String)?

        def initialize(
          @header_parameters : Hash(String, String)? = nil,
          @path_parameter_values : Array(String)? = nil,
          @query_string_parameters : Hash(String, String)? = nil
        )
        end
      end

      # The parameters for using a Kinesis stream as a target.
      struct PipeTargetKinesisStreamParameters
        include JSON::Serializable

        # Determines which shard in the stream the data record is assigned to. Partition keys are Unicode
        # strings with a maximum length limit of 256 characters for each key. Amazon Kinesis Data Streams uses
        # the partition key as input to a hash function that maps the partition key and associated data to a
        # specific shard. Specifically, an MD5 hash function is used to map partition keys to 128-bit integer
        # values and to map associated data records to shards. As a result of this hashing mechanism, all data
        # records with the same partition key map to the same shard within the stream.
        @[JSON::Field(key: "PartitionKey")]
        getter partition_key : String

        def initialize(
          @partition_key : String
        )
        end
      end

      # The parameters for using a Lambda function as a target.
      struct PipeTargetLambdaFunctionParameters
        include JSON::Serializable

        # Specify whether to invoke the function synchronously or asynchronously. REQUEST_RESPONSE (default) -
        # Invoke synchronously. This corresponds to the RequestResponse option in the InvocationType parameter
        # for the Lambda Invoke API. FIRE_AND_FORGET - Invoke asynchronously. This corresponds to the Event
        # option in the InvocationType parameter for the Lambda Invoke API. For more information, see
        # Invocation types in the Amazon EventBridge User Guide .
        @[JSON::Field(key: "InvocationType")]
        getter invocation_type : String?

        def initialize(
          @invocation_type : String? = nil
        )
        end
      end

      # The parameters required to set up a target for your pipe. For more information about pipe target
      # parameters, including how to use dynamic path parameters, see Target parameters in the Amazon
      # EventBridge User Guide .
      struct PipeTargetParameters
        include JSON::Serializable

        # The parameters for using an Batch job as a target.
        @[JSON::Field(key: "BatchJobParameters")]
        getter batch_job_parameters : Types::PipeTargetBatchJobParameters?

        # The parameters for using an CloudWatch Logs log stream as a target.
        @[JSON::Field(key: "CloudWatchLogsParameters")]
        getter cloud_watch_logs_parameters : Types::PipeTargetCloudWatchLogsParameters?

        # The parameters for using an Amazon ECS task as a target.
        @[JSON::Field(key: "EcsTaskParameters")]
        getter ecs_task_parameters : Types::PipeTargetEcsTaskParameters?

        # The parameters for using an EventBridge event bus as a target.
        @[JSON::Field(key: "EventBridgeEventBusParameters")]
        getter event_bridge_event_bus_parameters : Types::PipeTargetEventBridgeEventBusParameters?

        # These are custom parameter to be used when the target is an API Gateway REST APIs or EventBridge
        # ApiDestinations.
        @[JSON::Field(key: "HttpParameters")]
        getter http_parameters : Types::PipeTargetHttpParameters?

        # Valid JSON text passed to the target. In this case, nothing from the event itself is passed to the
        # target. For more information, see The JavaScript Object Notation (JSON) Data Interchange Format . To
        # remove an input template, specify an empty string.
        @[JSON::Field(key: "InputTemplate")]
        getter input_template : String?

        # The parameters for using a Kinesis stream as a target.
        @[JSON::Field(key: "KinesisStreamParameters")]
        getter kinesis_stream_parameters : Types::PipeTargetKinesisStreamParameters?

        # The parameters for using a Lambda function as a target.
        @[JSON::Field(key: "LambdaFunctionParameters")]
        getter lambda_function_parameters : Types::PipeTargetLambdaFunctionParameters?

        # These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke the
        # Amazon Redshift Data API BatchExecuteStatement.
        @[JSON::Field(key: "RedshiftDataParameters")]
        getter redshift_data_parameters : Types::PipeTargetRedshiftDataParameters?

        # The parameters for using a SageMaker pipeline as a target.
        @[JSON::Field(key: "SageMakerPipelineParameters")]
        getter sage_maker_pipeline_parameters : Types::PipeTargetSageMakerPipelineParameters?

        # The parameters for using a Amazon SQS stream as a target.
        @[JSON::Field(key: "SqsQueueParameters")]
        getter sqs_queue_parameters : Types::PipeTargetSqsQueueParameters?

        # The parameters for using a Step Functions state machine as a target.
        @[JSON::Field(key: "StepFunctionStateMachineParameters")]
        getter step_function_state_machine_parameters : Types::PipeTargetStateMachineParameters?

        # The parameters for using a Timestream for LiveAnalytics table as a target.
        @[JSON::Field(key: "TimestreamParameters")]
        getter timestream_parameters : Types::PipeTargetTimestreamParameters?

        def initialize(
          @batch_job_parameters : Types::PipeTargetBatchJobParameters? = nil,
          @cloud_watch_logs_parameters : Types::PipeTargetCloudWatchLogsParameters? = nil,
          @ecs_task_parameters : Types::PipeTargetEcsTaskParameters? = nil,
          @event_bridge_event_bus_parameters : Types::PipeTargetEventBridgeEventBusParameters? = nil,
          @http_parameters : Types::PipeTargetHttpParameters? = nil,
          @input_template : String? = nil,
          @kinesis_stream_parameters : Types::PipeTargetKinesisStreamParameters? = nil,
          @lambda_function_parameters : Types::PipeTargetLambdaFunctionParameters? = nil,
          @redshift_data_parameters : Types::PipeTargetRedshiftDataParameters? = nil,
          @sage_maker_pipeline_parameters : Types::PipeTargetSageMakerPipelineParameters? = nil,
          @sqs_queue_parameters : Types::PipeTargetSqsQueueParameters? = nil,
          @step_function_state_machine_parameters : Types::PipeTargetStateMachineParameters? = nil,
          @timestream_parameters : Types::PipeTargetTimestreamParameters? = nil
        )
        end
      end

      # These are custom parameters to be used when the target is a Amazon Redshift cluster to invoke the
      # Amazon Redshift Data API BatchExecuteStatement.
      struct PipeTargetRedshiftDataParameters
        include JSON::Serializable

        # The name of the database. Required when authenticating using temporary credentials.
        @[JSON::Field(key: "Database")]
        getter database : String

        # The SQL statement text to run.
        @[JSON::Field(key: "Sqls")]
        getter sqls : Array(String)

        # The database user name. Required when authenticating using temporary credentials.
        @[JSON::Field(key: "DbUser")]
        getter db_user : String?

        # The name or ARN of the secret that enables access to the database. Required when authenticating
        # using Secrets Manager.
        @[JSON::Field(key: "SecretManagerArn")]
        getter secret_manager_arn : String?

        # The name of the SQL statement. You can name the SQL statement when you create it to identify the
        # query.
        @[JSON::Field(key: "StatementName")]
        getter statement_name : String?

        # Indicates whether to send an event back to EventBridge after the SQL statement runs.
        @[JSON::Field(key: "WithEvent")]
        getter with_event : Bool?

        def initialize(
          @database : String,
          @sqls : Array(String),
          @db_user : String? = nil,
          @secret_manager_arn : String? = nil,
          @statement_name : String? = nil,
          @with_event : Bool? = nil
        )
        end
      end

      # The parameters for using a SageMaker pipeline as a target.
      struct PipeTargetSageMakerPipelineParameters
        include JSON::Serializable

        # List of Parameter names and values for SageMaker Model Building Pipeline execution.
        @[JSON::Field(key: "PipelineParameterList")]
        getter pipeline_parameter_list : Array(Types::SageMakerPipelineParameter)?

        def initialize(
          @pipeline_parameter_list : Array(Types::SageMakerPipelineParameter)? = nil
        )
        end
      end

      # The parameters for using a Amazon SQS stream as a target.
      struct PipeTargetSqsQueueParameters
        include JSON::Serializable

        # This parameter applies only to FIFO (first-in-first-out) queues. The token used for deduplication of
        # sent messages.
        @[JSON::Field(key: "MessageDeduplicationId")]
        getter message_deduplication_id : String?

        # The FIFO message group ID to use as the target.
        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        def initialize(
          @message_deduplication_id : String? = nil,
          @message_group_id : String? = nil
        )
        end
      end

      # The parameters for using a Step Functions state machine as a target.
      struct PipeTargetStateMachineParameters
        include JSON::Serializable

        # Specify whether to invoke the Step Functions state machine synchronously or asynchronously.
        # REQUEST_RESPONSE (default) - Invoke synchronously. For more information, see StartSyncExecution in
        # the Step Functions API Reference . REQUEST_RESPONSE is not supported for STANDARD state machine
        # workflows. FIRE_AND_FORGET - Invoke asynchronously. For more information, see StartExecution in the
        # Step Functions API Reference . For more information, see Invocation types in the Amazon EventBridge
        # User Guide .
        @[JSON::Field(key: "InvocationType")]
        getter invocation_type : String?

        def initialize(
          @invocation_type : String? = nil
        )
        end
      end

      # The parameters for using a Timestream for LiveAnalytics table as a target.
      struct PipeTargetTimestreamParameters
        include JSON::Serializable

        # Map source data to dimensions in the target Timestream for LiveAnalytics table. For more
        # information, see Amazon Timestream for LiveAnalytics concepts
        @[JSON::Field(key: "DimensionMappings")]
        getter dimension_mappings : Array(Types::DimensionMapping)

        # Dynamic path to the source data field that represents the time value for your data.
        @[JSON::Field(key: "TimeValue")]
        getter time_value : String

        # 64 bit version value or source data field that represents the version value for your data. Write
        # requests with a higher version number will update the existing measure values of the record and
        # version. In cases where the measure value is the same, the version will still be updated. Default
        # value is 1. Timestream for LiveAnalytics does not support updating partial measure values in a
        # record. Write requests for duplicate data with a higher version number will update the existing
        # measure value and version. In cases where the measure value is the same, Version will still be
        # updated. Default value is 1 . Version must be 1 or greater, or you will receive a
        # ValidationException error.
        @[JSON::Field(key: "VersionValue")]
        getter version_value : String

        # The granularity of the time units used. Default is MILLISECONDS . Required if TimeFieldType is
        # specified as EPOCH .
        @[JSON::Field(key: "EpochTimeUnit")]
        getter epoch_time_unit : String?

        # Maps multiple measures from the source event to the same record in the specified Timestream for
        # LiveAnalytics table.
        @[JSON::Field(key: "MultiMeasureMappings")]
        getter multi_measure_mappings : Array(Types::MultiMeasureMapping)?

        # Mappings of single source data fields to individual records in the specified Timestream for
        # LiveAnalytics table.
        @[JSON::Field(key: "SingleMeasureMappings")]
        getter single_measure_mappings : Array(Types::SingleMeasureMapping)?

        # The type of time value used. The default is EPOCH .
        @[JSON::Field(key: "TimeFieldType")]
        getter time_field_type : String?

        # How to format the timestamps. For example, yyyy-MM-dd'T'HH:mm:ss'Z' . Required if TimeFieldType is
        # specified as TIMESTAMP_FORMAT .
        @[JSON::Field(key: "TimestampFormat")]
        getter timestamp_format : String?

        def initialize(
          @dimension_mappings : Array(Types::DimensionMapping),
          @time_value : String,
          @version_value : String,
          @epoch_time_unit : String? = nil,
          @multi_measure_mappings : Array(Types::MultiMeasureMapping)? = nil,
          @single_measure_mappings : Array(Types::SingleMeasureMapping)? = nil,
          @time_field_type : String? = nil,
          @timestamp_format : String? = nil
        )
        end
      end

      # An object representing a constraint on task placement. To learn more, see Task Placement Constraints
      # in the Amazon Elastic Container Service Developer Guide.
      struct PlacementConstraint
        include JSON::Serializable

        # A cluster query language expression to apply to the constraint. You cannot specify an expression if
        # the constraint type is distinctInstance . To learn more, see Cluster Query Language in the Amazon
        # Elastic Container Service Developer Guide.
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

      # The task placement strategy for a task or service. To learn more, see Task Placement Strategies in
      # the Amazon Elastic Container Service Service Developer Guide.
      struct PlacementStrategy
        include JSON::Serializable

        # The field to apply the placement strategy against. For the spread placement strategy, valid values
        # are instanceId (or host, which has the same effect), or any platform or custom attribute that is
        # applied to a container instance, such as attribute:ecs.availability-zone. For the binpack placement
        # strategy, valid values are cpu and memory. For the random placement strategy, this field is not
        # used.
        @[JSON::Field(key: "field")]
        getter field : String?

        # The type of placement strategy. The random placement strategy randomly places tasks on available
        # candidates. The spread placement strategy spreads placement across available candidates evenly based
        # on the field parameter. The binpack strategy places tasks on available candidates that have the
        # least available amount of the resource that is specified with the field parameter. For example, if
        # you binpack on memory, a task is placed on the instance with the least amount of remaining memory
        # (but still enough to run the task).
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @field : String? = nil,
          @type : String? = nil
        )
        end
      end

      # The Amazon S3 logging configuration settings for the pipe.
      struct S3LogDestination
        include JSON::Serializable

        # The name of the Amazon S3 bucket to which EventBridge delivers the log records for the pipe.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String?

        # The Amazon Web Services account that owns the Amazon S3 bucket to which EventBridge delivers the log
        # records for the pipe.
        @[JSON::Field(key: "BucketOwner")]
        getter bucket_owner : String?

        # The format EventBridge uses for the log records. EventBridge currently only supports json
        # formatting.
        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String?

        # The prefix text with which to begin Amazon S3 log object names. For more information, see Organizing
        # objects using prefixes in the Amazon Simple Storage Service User Guide .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @bucket_owner : String? = nil,
          @output_format : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # The Amazon S3 logging configuration settings for the pipe.
      struct S3LogDestinationParameters
        include JSON::Serializable

        # Specifies the name of the Amazon S3 bucket to which EventBridge delivers the log records for the
        # pipe.
        @[JSON::Field(key: "BucketName")]
        getter bucket_name : String

        # Specifies the Amazon Web Services account that owns the Amazon S3 bucket to which EventBridge
        # delivers the log records for the pipe.
        @[JSON::Field(key: "BucketOwner")]
        getter bucket_owner : String

        # How EventBridge should format the log records. EventBridge currently only supports json formatting.
        @[JSON::Field(key: "OutputFormat")]
        getter output_format : String?

        # Specifies any prefix text with which to begin Amazon S3 log object names. You can use prefixes to
        # organize the data that you store in Amazon S3 buckets. A prefix is a string of characters at the
        # beginning of the object key name. A prefix can be any length, subject to the maximum length of the
        # object key name (1,024 bytes). For more information, see Organizing objects using prefixes in the
        # Amazon Simple Storage Service User Guide .
        @[JSON::Field(key: "Prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String,
          @bucket_owner : String,
          @output_format : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Name/Value pair of a parameter to start execution of a SageMaker Model Building Pipeline.
      struct SageMakerPipelineParameter
        include JSON::Serializable

        # Name of parameter to start execution of a SageMaker Model Building Pipeline.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Value of parameter to start execution of a SageMaker Model Building Pipeline.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # The Secrets Manager secret that stores your stream credentials.
      struct SelfManagedKafkaAccessConfigurationCredentials
        include JSON::Serializable

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "BasicAuth")]
        getter basic_auth : String?

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "ClientCertificateTlsAuth")]
        getter client_certificate_tls_auth : String?

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "SaslScram256Auth")]
        getter sasl_scram256_auth : String?

        # The ARN of the Secrets Manager secret.
        @[JSON::Field(key: "SaslScram512Auth")]
        getter sasl_scram512_auth : String?

        def initialize(
          @basic_auth : String? = nil,
          @client_certificate_tls_auth : String? = nil,
          @sasl_scram256_auth : String? = nil,
          @sasl_scram512_auth : String? = nil
        )
        end
      end

      # This structure specifies the VPC subnets and security groups for the stream, and whether a public IP
      # address is to be used.
      struct SelfManagedKafkaAccessConfigurationVpc
        include JSON::Serializable

        # Specifies the security groups associated with the stream. These security groups must all be in the
        # same VPC. You can specify as many as five security groups.
        @[JSON::Field(key: "SecurityGroup")]
        getter security_group : Array(String)?

        # Specifies the subnets associated with the stream. These subnets must all be in the same VPC. You can
        # specify as many as 16 subnets.
        @[JSON::Field(key: "Subnets")]
        getter subnets : Array(String)?

        def initialize(
          @security_group : Array(String)? = nil,
          @subnets : Array(String)? = nil
        )
        end
      end

      # A quota has been exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the quota that caused the exception.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # The ID of the resource that caused the exception.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of resource that caused the exception.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The identifier of the service that caused the exception.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        def initialize(
          @message : String,
          @quota_code : String,
          @resource_id : String,
          @resource_type : String,
          @service_code : String
        )
        end
      end

      # Maps a single source data field to a single record in the specified Timestream for LiveAnalytics
      # table. For more information, see Amazon Timestream for LiveAnalytics concepts
      struct SingleMeasureMapping
        include JSON::Serializable

        # Target measure name for the measurement attribute in the Timestream table.
        @[JSON::Field(key: "MeasureName")]
        getter measure_name : String

        # Dynamic path of the source field to map to the measure in the record.
        @[JSON::Field(key: "MeasureValue")]
        getter measure_value : String

        # Data type of the source field.
        @[JSON::Field(key: "MeasureValueType")]
        getter measure_value_type : String

        def initialize(
          @measure_name : String,
          @measure_value : String,
          @measure_value_type : String
        )
        end
      end

      struct StartPipeRequest
        include JSON::Serializable

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct StartPipeResponse
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      struct StopPipeRequest
        include JSON::Serializable

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct StopPipeResponse
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # A key-value pair associated with an Amazon Web Services resource. In EventBridge, rules and event
      # buses support tagging.
      struct Tag
        include JSON::Serializable

        # A string you can use to assign a value. The combination of tag keys and values can help you organize
        # and categorize your resources.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the specified tag key.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of key-value pairs associated with the pipe.
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

      # An action was throttled.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the quota that caused the exception.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying the action that caused the exception.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The identifier of the service that caused the exception.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the pipe.
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

      struct UpdatePipeRequest
        include JSON::Serializable

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The ARN of the role that allows the pipe to send data to the target.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A description of the pipe.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # The ARN of the enrichment resource.
        @[JSON::Field(key: "Enrichment")]
        getter enrichment : String?

        # The parameters required to set up enrichment on your pipe.
        @[JSON::Field(key: "EnrichmentParameters")]
        getter enrichment_parameters : Types::PipeEnrichmentParameters?

        # The identifier of the KMS customer managed key for EventBridge to use, if you choose to use a
        # customer managed key to encrypt pipe data. The identifier can be the key Amazon Resource Name (ARN),
        # KeyId, key alias, or key alias ARN. To update a pipe that is using the default Amazon Web Services
        # owned key to use a customer managed key instead, or update a pipe that is using a customer managed
        # key to use a different customer managed key, specify a customer managed key identifier. To update a
        # pipe that is using a customer managed key to use the default Amazon Web Services owned key, specify
        # an empty string. For more information, see Managing keys in the Key Management Service Developer
        # Guide .
        @[JSON::Field(key: "KmsKeyIdentifier")]
        getter kms_key_identifier : String?

        # The logging configuration settings for the pipe.
        @[JSON::Field(key: "LogConfiguration")]
        getter log_configuration : Types::PipeLogConfigurationParameters?

        # The parameters required to set up a source for your pipe.
        @[JSON::Field(key: "SourceParameters")]
        getter source_parameters : Types::UpdatePipeSourceParameters?

        # The ARN of the target resource.
        @[JSON::Field(key: "Target")]
        getter target : String?

        # The parameters required to set up a target for your pipe. For more information about pipe target
        # parameters, including how to use dynamic path parameters, see Target parameters in the Amazon
        # EventBridge User Guide .
        @[JSON::Field(key: "TargetParameters")]
        getter target_parameters : Types::PipeTargetParameters?

        def initialize(
          @name : String,
          @role_arn : String,
          @description : String? = nil,
          @desired_state : String? = nil,
          @enrichment : String? = nil,
          @enrichment_parameters : Types::PipeEnrichmentParameters? = nil,
          @kms_key_identifier : String? = nil,
          @log_configuration : Types::PipeLogConfigurationParameters? = nil,
          @source_parameters : Types::UpdatePipeSourceParameters? = nil,
          @target : String? = nil,
          @target_parameters : Types::PipeTargetParameters? = nil
        )
        end
      end

      struct UpdatePipeResponse
        include JSON::Serializable

        # The ARN of the pipe.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time the pipe was created.
        @[JSON::Field(key: "CreationTime")]
        getter creation_time : Time?

        # The state the pipe is in.
        @[JSON::Field(key: "CurrentState")]
        getter current_state : String?

        # The state the pipe should be in.
        @[JSON::Field(key: "DesiredState")]
        getter desired_state : String?

        # When the pipe was last updated, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the pipe.
        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @current_state : String? = nil,
          @desired_state : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil
        )
        end
      end

      # The parameters for using an Active MQ broker as a source.
      struct UpdatePipeSourceActiveMQBrokerParameters
        include JSON::Serializable

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::MQBrokerAccessCredentials

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        def initialize(
          @credentials : Types::MQBrokerAccessCredentials,
          @batch_size : Int32? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil
        )
        end
      end

      # The parameters for using a DynamoDB stream as a source.
      struct UpdatePipeSourceDynamoDBStreamParameters
        include JSON::Serializable

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # Define the target queue to send dead-letter queue events to.
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # Discard records older than the specified age. The default value is -1, which sets the maximum age to
        # infinite. When the value is set to infinite, EventBridge never discards old records.
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # Discard records after the specified number of retries. The default value is -1, which sets the
        # maximum number of retries to infinite. When MaximumRetryAttempts is infinite, EventBridge retries
        # failed records until the record expires in the event source.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # Define how to handle item process failures. AUTOMATIC_BISECT halves each batch and retry each half
        # until all the records are processed or there is one failed message left in the batch.
        @[JSON::Field(key: "OnPartialBatchItemFailure")]
        getter on_partial_batch_item_failure : String?

        # The number of batches to process concurrently from each shard. The default value is 1.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        def initialize(
          @batch_size : Int32? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @on_partial_batch_item_failure : String? = nil,
          @parallelization_factor : Int32? = nil
        )
        end
      end

      # The parameters for using a Kinesis stream as a source.
      struct UpdatePipeSourceKinesisStreamParameters
        include JSON::Serializable

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # Define the target queue to send dead-letter queue events to.
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # Discard records older than the specified age. The default value is -1, which sets the maximum age to
        # infinite. When the value is set to infinite, EventBridge never discards old records.
        @[JSON::Field(key: "MaximumRecordAgeInSeconds")]
        getter maximum_record_age_in_seconds : Int32?

        # Discard records after the specified number of retries. The default value is -1, which sets the
        # maximum number of retries to infinite. When MaximumRetryAttempts is infinite, EventBridge retries
        # failed records until the record expires in the event source.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        # Define how to handle item process failures. AUTOMATIC_BISECT halves each batch and retry each half
        # until all the records are processed or there is one failed message left in the batch.
        @[JSON::Field(key: "OnPartialBatchItemFailure")]
        getter on_partial_batch_item_failure : String?

        # The number of batches to process concurrently from each shard. The default value is 1.
        @[JSON::Field(key: "ParallelizationFactor")]
        getter parallelization_factor : Int32?

        def initialize(
          @batch_size : Int32? = nil,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @maximum_record_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil,
          @on_partial_batch_item_failure : String? = nil,
          @parallelization_factor : Int32? = nil
        )
        end
      end

      # The parameters for using an MSK stream as a source.
      struct UpdatePipeSourceManagedStreamingKafkaParameters
        include JSON::Serializable

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::MSKAccessCredentials?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        def initialize(
          @batch_size : Int32? = nil,
          @credentials : Types::MSKAccessCredentials? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil
        )
        end
      end

      # The parameters required to set up a source for your pipe.
      struct UpdatePipeSourceParameters
        include JSON::Serializable

        # The parameters for using an Active MQ broker as a source.
        @[JSON::Field(key: "ActiveMQBrokerParameters")]
        getter active_mq_broker_parameters : Types::UpdatePipeSourceActiveMQBrokerParameters?

        # The parameters for using a DynamoDB stream as a source.
        @[JSON::Field(key: "DynamoDBStreamParameters")]
        getter dynamo_db_stream_parameters : Types::UpdatePipeSourceDynamoDBStreamParameters?

        # The collection of event patterns used to filter events. To remove a filter, specify a FilterCriteria
        # object with an empty array of Filter objects. For more information, see Events and Event Patterns in
        # the Amazon EventBridge User Guide .
        @[JSON::Field(key: "FilterCriteria")]
        getter filter_criteria : Types::FilterCriteria?

        # The parameters for using a Kinesis stream as a source.
        @[JSON::Field(key: "KinesisStreamParameters")]
        getter kinesis_stream_parameters : Types::UpdatePipeSourceKinesisStreamParameters?

        # The parameters for using an MSK stream as a source.
        @[JSON::Field(key: "ManagedStreamingKafkaParameters")]
        getter managed_streaming_kafka_parameters : Types::UpdatePipeSourceManagedStreamingKafkaParameters?

        # The parameters for using a Rabbit MQ broker as a source.
        @[JSON::Field(key: "RabbitMQBrokerParameters")]
        getter rabbit_mq_broker_parameters : Types::UpdatePipeSourceRabbitMQBrokerParameters?

        # The parameters for using a self-managed Apache Kafka stream as a source. A self managed cluster
        # refers to any Apache Kafka cluster not hosted by Amazon Web Services. This includes both clusters
        # you manage yourself, as well as those hosted by a third-party provider, such as Confluent Cloud ,
        # CloudKarafka , or Redpanda . For more information, see Apache Kafka streams as a source in the
        # Amazon EventBridge User Guide .
        @[JSON::Field(key: "SelfManagedKafkaParameters")]
        getter self_managed_kafka_parameters : Types::UpdatePipeSourceSelfManagedKafkaParameters?

        # The parameters for using a Amazon SQS stream as a source.
        @[JSON::Field(key: "SqsQueueParameters")]
        getter sqs_queue_parameters : Types::UpdatePipeSourceSqsQueueParameters?

        def initialize(
          @active_mq_broker_parameters : Types::UpdatePipeSourceActiveMQBrokerParameters? = nil,
          @dynamo_db_stream_parameters : Types::UpdatePipeSourceDynamoDBStreamParameters? = nil,
          @filter_criteria : Types::FilterCriteria? = nil,
          @kinesis_stream_parameters : Types::UpdatePipeSourceKinesisStreamParameters? = nil,
          @managed_streaming_kafka_parameters : Types::UpdatePipeSourceManagedStreamingKafkaParameters? = nil,
          @rabbit_mq_broker_parameters : Types::UpdatePipeSourceRabbitMQBrokerParameters? = nil,
          @self_managed_kafka_parameters : Types::UpdatePipeSourceSelfManagedKafkaParameters? = nil,
          @sqs_queue_parameters : Types::UpdatePipeSourceSqsQueueParameters? = nil
        )
        end
      end

      # The parameters for using a Rabbit MQ broker as a source.
      struct UpdatePipeSourceRabbitMQBrokerParameters
        include JSON::Serializable

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::MQBrokerAccessCredentials

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        def initialize(
          @credentials : Types::MQBrokerAccessCredentials,
          @batch_size : Int32? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil
        )
        end
      end

      # The parameters for using a self-managed Apache Kafka stream as a source. A self managed cluster
      # refers to any Apache Kafka cluster not hosted by Amazon Web Services. This includes both clusters
      # you manage yourself, as well as those hosted by a third-party provider, such as Confluent Cloud ,
      # CloudKarafka , or Redpanda . For more information, see Apache Kafka streams as a source in the
      # Amazon EventBridge User Guide .
      struct UpdatePipeSourceSelfManagedKafkaParameters
        include JSON::Serializable

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The credentials needed to access the resource.
        @[JSON::Field(key: "Credentials")]
        getter credentials : Types::SelfManagedKafkaAccessConfigurationCredentials?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        # The ARN of the Secrets Manager secret used for certification.
        @[JSON::Field(key: "ServerRootCaCertificate")]
        getter server_root_ca_certificate : String?

        # This structure specifies the VPC subnets and security groups for the stream, and whether a public IP
        # address is to be used.
        @[JSON::Field(key: "Vpc")]
        getter vpc : Types::SelfManagedKafkaAccessConfigurationVpc?

        def initialize(
          @batch_size : Int32? = nil,
          @credentials : Types::SelfManagedKafkaAccessConfigurationCredentials? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil,
          @server_root_ca_certificate : String? = nil,
          @vpc : Types::SelfManagedKafkaAccessConfigurationVpc? = nil
        )
        end
      end

      # The parameters for using a Amazon SQS stream as a source.
      struct UpdatePipeSourceSqsQueueParameters
        include JSON::Serializable

        # The maximum number of records to include in each batch.
        @[JSON::Field(key: "BatchSize")]
        getter batch_size : Int32?

        # The maximum length of a time to wait for events.
        @[JSON::Field(key: "MaximumBatchingWindowInSeconds")]
        getter maximum_batching_window_in_seconds : Int32?

        def initialize(
          @batch_size : Int32? = nil,
          @maximum_batching_window_in_seconds : Int32? = nil
        )
        end
      end

      # Indicates that an error has occurred while performing a validate operation.
      struct ValidationException
        include JSON::Serializable

        # The list of fields for which validation failed and the corresponding failure messages.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil
        )
        end
      end

      # Indicates that an error has occurred while performing a validate operation.
      struct ValidationExceptionField
        include JSON::Serializable

        # The message of the exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the exception.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end
    end
  end
end
