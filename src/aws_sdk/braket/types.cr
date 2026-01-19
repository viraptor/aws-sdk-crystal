require "json"
require "time"

module AwsSdk
  module Braket
    module Types

      # You do not have sufficient permissions to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains metadata about the quantum task action, including the action type and program statistics.
      struct ActionMetadata
        include JSON::Serializable

        # The type of action associated with the quantum task.
        @[JSON::Field(key: "actionType")]
        getter action_type : String

        # The number of executables in a program set. This is only available for a program set.
        @[JSON::Field(key: "executableCount")]
        getter executable_count : Int64?

        # The number of programs in a program set. This is only available for a program set.
        @[JSON::Field(key: "programCount")]
        getter program_count : Int64?

        def initialize(
          @action_type : String,
          @executable_count : Int64? = nil,
          @program_count : Int64? = nil
        )
        end
      end

      # Defines the Amazon Braket hybrid job to be created. Specifies the container image the job uses and
      # the paths to the Python scripts used for entry and training.
      struct AlgorithmSpecification
        include JSON::Serializable

        # The container image used to create an Amazon Braket hybrid job.
        @[JSON::Field(key: "containerImage")]
        getter container_image : Types::ContainerImage?

        # Configures the paths to the Python scripts used for entry and training.
        @[JSON::Field(key: "scriptModeConfig")]
        getter script_mode_config : Types::ScriptModeConfig?

        def initialize(
          @container_image : Types::ContainerImage? = nil,
          @script_mode_config : Types::ScriptModeConfig? = nil
        )
        end
      end

      # The Amazon Braket resource and the association type.
      struct Association
        include JSON::Serializable

        # The Amazon Braket resource arn.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The association type for the specified Amazon Braket resource arn.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @arn : String,
          @type : String
        )
        end
      end

      struct CancelJobRequest
        include JSON::Serializable

        # The ARN of the Amazon Braket hybrid job to cancel.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end

      struct CancelJobResponse
        include JSON::Serializable

        # The status of the hybrid job.
        @[JSON::Field(key: "cancellationStatus")]
        getter cancellation_status : String

        # The ARN of the Amazon Braket job.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @cancellation_status : String,
          @job_arn : String
        )
        end
      end

      struct CancelQuantumTaskRequest
        include JSON::Serializable

        # The client token associated with the cancellation request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ARN of the quantum task to cancel.
        @[JSON::Field(key: "quantumTaskArn")]
        getter quantum_task_arn : String

        def initialize(
          @client_token : String,
          @quantum_task_arn : String
        )
        end
      end

      struct CancelQuantumTaskResponse
        include JSON::Serializable

        # The status of the quantum task.
        @[JSON::Field(key: "cancellationStatus")]
        getter cancellation_status : String

        # The ARN of the quantum task.
        @[JSON::Field(key: "quantumTaskArn")]
        getter quantum_task_arn : String

        def initialize(
          @cancellation_status : String,
          @quantum_task_arn : String
        )
        end
      end

      # An error occurred due to a conflict.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The container image used to create an Amazon Braket hybrid job.
      struct ContainerImage
        include JSON::Serializable

        # The URI locating the container image.
        @[JSON::Field(key: "uri")]
        getter uri : String

        def initialize(
          @uri : String
        )
        end
      end

      struct CreateJobRequest
        include JSON::Serializable

        # Definition of the Amazon Braket job to be created. Specifies the container image the job uses and
        # information about the Python scripts used for entry and training.
        @[JSON::Field(key: "algorithmSpecification")]
        getter algorithm_specification : Types::AlgorithmSpecification

        # The client token associated with this request that guarantees that the request is idempotent.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The quantum processing unit (QPU) or simulator used to create an Amazon Braket hybrid job.
        @[JSON::Field(key: "deviceConfig")]
        getter device_config : Types::DeviceConfig

        # Configuration of the resource instances to use while running the hybrid job on Amazon Braket.
        @[JSON::Field(key: "instanceConfig")]
        getter instance_config : Types::InstanceConfig

        # The name of the Amazon Braket hybrid job.
        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The path to the S3 location where you want to store hybrid job artifacts and the encryption key used
        # to store them.
        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::JobOutputDataConfig

        # The Amazon Resource Name (ARN) of an IAM role that Amazon Braket can assume to perform tasks on
        # behalf of a user. It can access user resources, run an Amazon Braket job container on behalf of
        # user, and output results and hybrid job details to the users' s3 buckets.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The list of Amazon Braket resources associated with the hybrid job.
        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::Association)?

        # Information about the output locations for hybrid job checkpoint data.
        @[JSON::Field(key: "checkpointConfig")]
        getter checkpoint_config : Types::JobCheckpointConfig?

        # Algorithm-specific parameters used by an Amazon Braket hybrid job that influence the quality of the
        # training job. The values are set with a map of JSON key:value pairs, where the key is the name of
        # the hyperparameter and the value is the value of the hyperparameter. Do not include any
        # security-sensitive information including account access IDs, secrets, or tokens in any
        # hyperparameter fields. As part of the shared responsibility model, you are responsible for any
        # potential exposure, unauthorized access, or compromise of your sensitive data if caused by
        # security-sensitive information included in the request hyperparameter variable or plain text fields.
        @[JSON::Field(key: "hyperParameters")]
        getter hyper_parameters : Hash(String, String)?

        # A list of parameters that specify the name and type of input data and where it is located.
        @[JSON::Field(key: "inputDataConfig")]
        getter input_data_config : Array(Types::InputFileConfig)?

        # The user-defined criteria that specifies when a hybrid job stops running.
        @[JSON::Field(key: "stoppingCondition")]
        getter stopping_condition : Types::JobStoppingCondition?

        # Tags to be added to the hybrid job you're creating.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @algorithm_specification : Types::AlgorithmSpecification,
          @client_token : String,
          @device_config : Types::DeviceConfig,
          @instance_config : Types::InstanceConfig,
          @job_name : String,
          @output_data_config : Types::JobOutputDataConfig,
          @role_arn : String,
          @associations : Array(Types::Association)? = nil,
          @checkpoint_config : Types::JobCheckpointConfig? = nil,
          @hyper_parameters : Hash(String, String)? = nil,
          @input_data_config : Array(Types::InputFileConfig)? = nil,
          @stopping_condition : Types::JobStoppingCondition? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateJobResponse
        include JSON::Serializable

        # The ARN of the Amazon Braket hybrid job created.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        def initialize(
          @job_arn : String
        )
        end
      end

      struct CreateQuantumTaskRequest
        include JSON::Serializable

        # The action associated with the quantum task.
        @[JSON::Field(key: "action")]
        getter action : String

        # The client token associated with the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ARN of the device to run the quantum task on.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # The S3 bucket to store quantum task result files in.
        @[JSON::Field(key: "outputS3Bucket")]
        getter output_s3_bucket : String

        # The key prefix for the location in the S3 bucket to store quantum task results in.
        @[JSON::Field(key: "outputS3KeyPrefix")]
        getter output_s3_key_prefix : String

        # The number of shots to use for the quantum task.
        @[JSON::Field(key: "shots")]
        getter shots : Int64

        # The list of Amazon Braket resources associated with the quantum task.
        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::Association)?

        # The parameters for the device to run the quantum task on.
        @[JSON::Field(key: "deviceParameters")]
        getter device_parameters : String?

        # Enable experimental capabilities for the quantum task.
        @[JSON::Field(key: "experimentalCapabilities")]
        getter experimental_capabilities : Types::ExperimentalCapabilities?

        # The token for an Amazon Braket hybrid job that associates it with the quantum task.
        @[JSON::Field(key: "jobToken")]
        getter job_token : String?

        # Tags to be added to the quantum task you're creating.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @action : String,
          @client_token : String,
          @device_arn : String,
          @output_s3_bucket : String,
          @output_s3_key_prefix : String,
          @shots : Int64,
          @associations : Array(Types::Association)? = nil,
          @device_parameters : String? = nil,
          @experimental_capabilities : Types::ExperimentalCapabilities? = nil,
          @job_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateQuantumTaskResponse
        include JSON::Serializable

        # The ARN of the quantum task created by the request.
        @[JSON::Field(key: "quantumTaskArn")]
        getter quantum_task_arn : String

        def initialize(
          @quantum_task_arn : String
        )
        end
      end

      struct CreateSpendingLimitRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Braket ignores the request, but does not return an
        # error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the quantum device to apply the spending limit to.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # The maximum amount that can be spent on the specified device, in USD.
        @[JSON::Field(key: "spendingLimit")]
        getter spending_limit : String

        # The tags to apply to the spending limit. Each tag consists of a key and an optional value.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The time period during which the spending limit is active, including start and end dates.
        @[JSON::Field(key: "timePeriod")]
        getter time_period : Types::TimePeriod?

        def initialize(
          @client_token : String,
          @device_arn : String,
          @spending_limit : String,
          @tags : Hash(String, String)? = nil,
          @time_period : Types::TimePeriod? = nil
        )
        end
      end

      struct CreateSpendingLimitResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the created spending limit.
        @[JSON::Field(key: "spendingLimitArn")]
        getter spending_limit_arn : String

        def initialize(
          @spending_limit_arn : String
        )
        end
      end

      # Information about the source of the input data used by the Amazon Braket hybrid job.
      struct DataSource
        include JSON::Serializable

        # Amazon S3 path of the input data used by the hybrid job.
        @[JSON::Field(key: "s3DataSource")]
        getter s3_data_source : Types::S3DataSource

        def initialize(
          @s3_data_source : Types::S3DataSource
        )
        end
      end

      struct DeleteSpendingLimitRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the spending limit to delete.
        @[JSON::Field(key: "spendingLimitArn")]
        getter spending_limit_arn : String

        def initialize(
          @spending_limit_arn : String
        )
        end
      end

      struct DeleteSpendingLimitResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Configures the primary device used to create and run an Amazon Braket hybrid job.
      struct DeviceConfig
        include JSON::Serializable

        # The primary device ARN used to create and run an Amazon Braket hybrid job.
        @[JSON::Field(key: "device")]
        getter device : String

        def initialize(
          @device : String
        )
        end
      end

      # The specified device is currently offline.
      struct DeviceOfflineException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about quantum tasks and hybrid jobs queued on a device.
      struct DeviceQueueInfo
        include JSON::Serializable

        # The name of the queue.
        @[JSON::Field(key: "queue")]
        getter queue : String

        # The number of hybrid jobs or quantum tasks in the queue for a given device.
        @[JSON::Field(key: "queueSize")]
        getter queue_size : String

        # Optional. Specifies the priority of the queue. Quantum tasks in a priority queue are processed
        # before the quantum tasks in a normal queue.
        @[JSON::Field(key: "queuePriority")]
        getter queue_priority : String?

        def initialize(
          @queue : String,
          @queue_size : String,
          @queue_priority : String? = nil
        )
        end
      end

      # The specified device has been retired.
      struct DeviceRetiredException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Includes information about the device.
      struct DeviceSummary
        include JSON::Serializable

        # The ARN of the device.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # The name of the device.
        @[JSON::Field(key: "deviceName")]
        getter device_name : String

        # The status of the device.
        @[JSON::Field(key: "deviceStatus")]
        getter device_status : String

        # The type of the device.
        @[JSON::Field(key: "deviceType")]
        getter device_type : String

        # The provider of the device.
        @[JSON::Field(key: "providerName")]
        getter provider_name : String

        def initialize(
          @device_arn : String,
          @device_name : String,
          @device_status : String,
          @device_type : String,
          @provider_name : String
        )
        end
      end

      # Enabled experimental capabilities for quantum hardware. Note that the use of these features may
      # impact device capabilities and performance beyond its standard specifications.
      struct ExperimentalCapabilities
        include JSON::Serializable

        # Enabled experimental capabilities.
        @[JSON::Field(key: "enabled")]
        getter enabled : String?

        def initialize(
          @enabled : String? = nil
        )
        end
      end

      struct GetDeviceRequest
        include JSON::Serializable

        # The ARN of the device to retrieve.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        def initialize(
          @device_arn : String
        )
        end
      end

      struct GetDeviceResponse
        include JSON::Serializable

        # The ARN of the device.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # Details about the capabilities of the device.
        @[JSON::Field(key: "deviceCapabilities")]
        getter device_capabilities : String

        # The name of the device.
        @[JSON::Field(key: "deviceName")]
        getter device_name : String

        # The status of the device.
        @[JSON::Field(key: "deviceStatus")]
        getter device_status : String

        # The type of the device.
        @[JSON::Field(key: "deviceType")]
        getter device_type : String

        # The name of the partner company for the device.
        @[JSON::Field(key: "providerName")]
        getter provider_name : String

        # The number of quantum tasks and hybrid jobs currently queued on the device.
        @[JSON::Field(key: "deviceQueueInfo")]
        getter device_queue_info : Array(Types::DeviceQueueInfo)?

        def initialize(
          @device_arn : String,
          @device_capabilities : String,
          @device_name : String,
          @device_status : String,
          @device_type : String,
          @provider_name : String,
          @device_queue_info : Array(Types::DeviceQueueInfo)? = nil
        )
        end
      end

      struct GetJobRequest
        include JSON::Serializable

        # The ARN of the hybrid job to retrieve.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # A list of attributes to return additional information for. Only the QueueInfo additional attribute
        # name is currently supported.
        @[JSON::Field(key: "additionalAttributeNames")]
        getter additional_attribute_names : Array(String)?

        def initialize(
          @job_arn : String,
          @additional_attribute_names : Array(String)? = nil
        )
        end
      end

      struct GetJobResponse
        include JSON::Serializable

        # Definition of the Amazon Braket hybrid job created. Provides information about the container image
        # used, and the Python scripts used for training.
        @[JSON::Field(key: "algorithmSpecification")]
        getter algorithm_specification : Types::AlgorithmSpecification

        # The time at which the Amazon Braket hybrid job was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The resource instances to use while running the hybrid job on Amazon Braket.
        @[JSON::Field(key: "instanceConfig")]
        getter instance_config : Types::InstanceConfig

        # The ARN of the Amazon Braket hybrid job.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name of the Amazon Braket hybrid job.
        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The path to the S3 location where hybrid job artifacts are stored and the encryption key used to
        # store them there.
        @[JSON::Field(key: "outputDataConfig")]
        getter output_data_config : Types::JobOutputDataConfig

        # The Amazon Resource Name (ARN) of an IAM role that Amazon Braket can assume to perform tasks on
        # behalf of a user. It can access user resources, run an Amazon Braket job container on behalf of
        # user, and output results and other hybrid job details to the s3 buckets of a user.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The status of the Amazon Braket hybrid job.
        @[JSON::Field(key: "status")]
        getter status : String

        # The list of Amazon Braket resources associated with the hybrid job.
        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::Association)?

        # The billable time for which the Amazon Braket hybrid job used to complete.
        @[JSON::Field(key: "billableDuration")]
        getter billable_duration : Int32?

        # Information about the output locations for hybrid job checkpoint data.
        @[JSON::Field(key: "checkpointConfig")]
        getter checkpoint_config : Types::JobCheckpointConfig?

        # The primary device used by the Amazon Braket hybrid job.
        @[JSON::Field(key: "deviceConfig")]
        getter device_config : Types::DeviceConfig?

        # The time at which the Amazon Braket hybrid job ended.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # Details about the time and type of events occurred related to the Amazon Braket hybrid job.
        @[JSON::Field(key: "events")]
        getter events : Array(Types::JobEventDetails)?

        # A description of the reason why an Amazon Braket hybrid job failed, if it failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # Algorithm-specific parameters used by an Amazon Braket hybrid job that influence the quality of the
        # traiing job. The values are set with a map of JSON key:value pairs, where the key is the name of the
        # hyperparameter and the value is the value of th hyperparameter.
        @[JSON::Field(key: "hyperParameters")]
        getter hyper_parameters : Hash(String, String)?

        # A list of parameters that specify the name and type of input data and where it is located.
        @[JSON::Field(key: "inputDataConfig")]
        getter input_data_config : Array(Types::InputFileConfig)?

        # Queue information for the requested hybrid job. Only returned if QueueInfo is specified in the
        # additionalAttributeNames" field in the GetJob API request.
        @[JSON::Field(key: "queueInfo")]
        getter queue_info : Types::HybridJobQueueInfo?

        # The time at which the Amazon Braket hybrid job was started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The user-defined criteria that specifies when to stop a running hybrid job.
        @[JSON::Field(key: "stoppingCondition")]
        getter stopping_condition : Types::JobStoppingCondition?

        # The tags associated with this hybrid job.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @algorithm_specification : Types::AlgorithmSpecification,
          @created_at : Time,
          @instance_config : Types::InstanceConfig,
          @job_arn : String,
          @job_name : String,
          @output_data_config : Types::JobOutputDataConfig,
          @role_arn : String,
          @status : String,
          @associations : Array(Types::Association)? = nil,
          @billable_duration : Int32? = nil,
          @checkpoint_config : Types::JobCheckpointConfig? = nil,
          @device_config : Types::DeviceConfig? = nil,
          @ended_at : Time? = nil,
          @events : Array(Types::JobEventDetails)? = nil,
          @failure_reason : String? = nil,
          @hyper_parameters : Hash(String, String)? = nil,
          @input_data_config : Array(Types::InputFileConfig)? = nil,
          @queue_info : Types::HybridJobQueueInfo? = nil,
          @started_at : Time? = nil,
          @stopping_condition : Types::JobStoppingCondition? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct GetQuantumTaskRequest
        include JSON::Serializable

        # The ARN of the quantum task to retrieve.
        @[JSON::Field(key: "quantumTaskArn")]
        getter quantum_task_arn : String

        # A list of attributes to return additional information for. Only the QueueInfo additional attribute
        # name is currently supported.
        @[JSON::Field(key: "additionalAttributeNames")]
        getter additional_attribute_names : Array(String)?

        def initialize(
          @quantum_task_arn : String,
          @additional_attribute_names : Array(String)? = nil
        )
        end
      end

      struct GetQuantumTaskResponse
        include JSON::Serializable

        # The time at which the quantum task was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ARN of the device the quantum task was run on.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # The parameters for the device on which the quantum task ran.
        @[JSON::Field(key: "deviceParameters")]
        getter device_parameters : String

        # The S3 bucket where quantum task results are stored.
        @[JSON::Field(key: "outputS3Bucket")]
        getter output_s3_bucket : String

        # The folder in the S3 bucket where quantum task results are stored.
        @[JSON::Field(key: "outputS3Directory")]
        getter output_s3_directory : String

        # The ARN of the quantum task.
        @[JSON::Field(key: "quantumTaskArn")]
        getter quantum_task_arn : String

        # The number of shots used in the quantum task.
        @[JSON::Field(key: "shots")]
        getter shots : Int64

        # The status of the quantum task.
        @[JSON::Field(key: "status")]
        getter status : String

        # Metadata about the action performed by the quantum task, including information about the type of
        # action and program counts.
        @[JSON::Field(key: "actionMetadata")]
        getter action_metadata : Types::ActionMetadata?

        # The list of Amazon Braket resources associated with the quantum task.
        @[JSON::Field(key: "associations")]
        getter associations : Array(Types::Association)?

        # The time at which the quantum task ended.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # Enabled experimental capabilities for the quantum task, if any.
        @[JSON::Field(key: "experimentalCapabilities")]
        getter experimental_capabilities : Types::ExperimentalCapabilities?

        # The reason that a quantum task failed.
        @[JSON::Field(key: "failureReason")]
        getter failure_reason : String?

        # The ARN of the Amazon Braket job associated with the quantum task.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String?

        # The number of successful shots for the quantum task. This is available after a successfully
        # completed quantum task.
        @[JSON::Field(key: "numSuccessfulShots")]
        getter num_successful_shots : Int64?

        # Queue information for the requested quantum task. Only returned if QueueInfo is specified in the
        # additionalAttributeNames" field in the GetQuantumTask API request.
        @[JSON::Field(key: "queueInfo")]
        getter queue_info : Types::QuantumTaskQueueInfo?

        # The tags that belong to this quantum task.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @device_arn : String,
          @device_parameters : String,
          @output_s3_bucket : String,
          @output_s3_directory : String,
          @quantum_task_arn : String,
          @shots : Int64,
          @status : String,
          @action_metadata : Types::ActionMetadata? = nil,
          @associations : Array(Types::Association)? = nil,
          @ended_at : Time? = nil,
          @experimental_capabilities : Types::ExperimentalCapabilities? = nil,
          @failure_reason : String? = nil,
          @job_arn : String? = nil,
          @num_successful_shots : Int64? = nil,
          @queue_info : Types::QuantumTaskQueueInfo? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Information about the queue for a specified hybrid job.
      struct HybridJobQueueInfo
        include JSON::Serializable

        # Current position of the hybrid job in the jobs queue.
        @[JSON::Field(key: "position")]
        getter position : String

        # The name of the queue.
        @[JSON::Field(key: "queue")]
        getter queue : String

        # Optional. Provides more information about the queue position. For example, if the hybrid job is
        # complete and no longer in the queue, the message field contains that information.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @position : String,
          @queue : String,
          @message : String? = nil
        )
        end
      end

      # A list of parameters that specify the input channels, type of input data, and where it is located.
      struct InputFileConfig
        include JSON::Serializable

        # A named input source that an Amazon Braket hybrid job can consume.
        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The location of the input data.
        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        # The MIME type of the data.
        @[JSON::Field(key: "contentType")]
        getter content_type : String?

        def initialize(
          @channel_name : String,
          @data_source : Types::DataSource,
          @content_type : String? = nil
        )
        end
      end

      # Configures the resource instances to use while running the Amazon Braket hybrid job on Amazon
      # Braket.
      struct InstanceConfig
        include JSON::Serializable

        # Configures the type of resource instances to use while running an Amazon Braket hybrid job.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The size of the storage volume, in GB, to provision.
        @[JSON::Field(key: "volumeSizeInGb")]
        getter volume_size_in_gb : Int32

        # Configures the number of resource instances to use while running an Amazon Braket hybrid job on
        # Amazon Braket. The default value is 1.
        @[JSON::Field(key: "instanceCount")]
        getter instance_count : Int32?

        def initialize(
          @instance_type : String,
          @volume_size_in_gb : Int32,
          @instance_count : Int32? = nil
        )
        end
      end

      # The request failed because of an unknown error.
      struct InternalServiceException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains information about the output locations for hybrid job checkpoint data.
      struct JobCheckpointConfig
        include JSON::Serializable

        # Identifies the S3 path where you want Amazon Braket to store checkpoint data. For example,
        # s3://bucket-name/key-name-prefix .
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # (Optional) The local directory where checkpoint data is stored. The default directory is
        # /opt/braket/checkpoints/ .
        @[JSON::Field(key: "localPath")]
        getter local_path : String?

        def initialize(
          @s3_uri : String,
          @local_path : String? = nil
        )
        end
      end

      # Details about the type and time events that occurred related to the Amazon Braket hybrid job.
      struct JobEventDetails
        include JSON::Serializable

        # The type of event that occurred related to the Amazon Braket hybrid job.
        @[JSON::Field(key: "eventType")]
        getter event_type : String?

        # A message describing the event that occurred related to the Amazon Braket hybrid job.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The time of the event that occurred related to the Amazon Braket hybrid job.
        @[JSON::Field(key: "timeOfEvent")]
        getter time_of_event : Time?

        def initialize(
          @event_type : String? = nil,
          @message : String? = nil,
          @time_of_event : Time? = nil
        )
        end
      end

      # Specifies the path to the S3 location where you want to store hybrid job artifacts and the
      # encryption key used to store them.
      struct JobOutputDataConfig
        include JSON::Serializable

        # Identifies the S3 path where you want Amazon Braket to store the hybrid job training artifacts. For
        # example, s3://bucket-name/key-name-prefix .
        @[JSON::Field(key: "s3Path")]
        getter s3_path : String

        # The AWS Key Management Service (AWS KMS) key that Amazon Braket uses to encrypt the hybrid job
        # training artifacts at rest using Amazon S3 server-side encryption.
        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @s3_path : String,
          @kms_key_id : String? = nil
        )
        end
      end

      # Specifies limits for how long an Amazon Braket hybrid job can run.
      struct JobStoppingCondition
        include JSON::Serializable

        # The maximum length of time, in seconds, that an Amazon Braket hybrid job can run.
        @[JSON::Field(key: "maxRuntimeInSeconds")]
        getter max_runtime_in_seconds : Int32?

        def initialize(
          @max_runtime_in_seconds : Int32? = nil
        )
        end
      end

      # Provides summary information about an Amazon Braket hybrid job.
      struct JobSummary
        include JSON::Serializable

        # The time at which the Amazon Braket hybrid job was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The primary device used by an Amazon Braket hybrid job.
        @[JSON::Field(key: "device")]
        getter device : String

        # The ARN of the Amazon Braket hybrid job.
        @[JSON::Field(key: "jobArn")]
        getter job_arn : String

        # The name of the Amazon Braket hybrid job.
        @[JSON::Field(key: "jobName")]
        getter job_name : String

        # The status of the Amazon Braket hybrid job.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the Amazon Braket hybrid job ended.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The time at which the Amazon Braket hybrid job was started.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # Displays the key, value pairs of tags associated with this hybrid job.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @device : String,
          @job_arn : String,
          @job_name : String,
          @status : String,
          @ended_at : Time? = nil,
          @started_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # Specify the resourceArn for the resource whose tags to display.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Displays the key, value pairs of tags associated with this resource.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Contains information about validation failures that occurred during the processing of a program set
      # in a quantum task.
      struct ProgramSetValidationFailure
        include JSON::Serializable

        # The index of the program within the program set that failed validation.
        @[JSON::Field(key: "programIndex")]
        getter program_index : Int64

        # A list of error messages describing the validation failures that occurred.
        @[JSON::Field(key: "errors")]
        getter errors : Array(String)?

        # The index of the input within the program set that failed validation.
        @[JSON::Field(key: "inputsIndex")]
        getter inputs_index : Int64?

        def initialize(
          @program_index : Int64,
          @errors : Array(String)? = nil,
          @inputs_index : Int64? = nil
        )
        end
      end

      # The queue information for the specified quantum task.
      struct QuantumTaskQueueInfo
        include JSON::Serializable

        # Current position of the quantum task in the quantum tasks queue.
        @[JSON::Field(key: "position")]
        getter position : String

        # The name of the queue.
        @[JSON::Field(key: "queue")]
        getter queue : String

        # Optional. Provides more information about the queue position. For example, if the quantum task is
        # complete and no longer in the queue, the message field contains that information.
        @[JSON::Field(key: "message")]
        getter message : String?

        # Optional. Specifies the priority of the queue. Quantum tasks in a priority queue are processed
        # before the quantum tasks in a normal queue.
        @[JSON::Field(key: "queuePriority")]
        getter queue_priority : String?

        def initialize(
          @position : String,
          @queue : String,
          @message : String? = nil,
          @queue_priority : String? = nil
        )
        end
      end

      # Includes information about a quantum task.
      struct QuantumTaskSummary
        include JSON::Serializable

        # The time at which the quantum task was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ARN of the device the quantum task ran on.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # The S3 bucket where the quantum task result file is stored.
        @[JSON::Field(key: "outputS3Bucket")]
        getter output_s3_bucket : String

        # The folder in the S3 bucket where the quantum task result file is stored.
        @[JSON::Field(key: "outputS3Directory")]
        getter output_s3_directory : String

        # The ARN of the quantum task.
        @[JSON::Field(key: "quantumTaskArn")]
        getter quantum_task_arn : String

        # The shots used for the quantum task.
        @[JSON::Field(key: "shots")]
        getter shots : Int64

        # The status of the quantum task.
        @[JSON::Field(key: "status")]
        getter status : String

        # The time at which the quantum task finished.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # Displays the key, value pairs of tags associated with this quantum task.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @device_arn : String,
          @output_s3_bucket : String,
          @output_s3_directory : String,
          @quantum_task_arn : String,
          @shots : Int64,
          @status : String,
          @ended_at : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The specified resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the Amazon S3 storage used by the Amazon Braket hybrid job.
      struct S3DataSource
        include JSON::Serializable

        # Depending on the value specified for the S3DataType , identifies either a key name prefix or a
        # manifest that locates the S3 data source.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # Contains information about algorithm scripts used for the Amazon Braket hybrid job.
      struct ScriptModeConfig
        include JSON::Serializable

        # The entry point in the algorithm scripts from where the execution begins in the hybrid job.
        @[JSON::Field(key: "entryPoint")]
        getter entry_point : String

        # The URI that specifies the S3 path to the algorithm scripts used by an Amazon Braket hybrid job.
        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        # The type of compression used to store the algorithm scripts in Amazon S3 storage.
        @[JSON::Field(key: "compressionType")]
        getter compression_type : String?

        def initialize(
          @entry_point : String,
          @s3_uri : String,
          @compression_type : String? = nil
        )
        end
      end

      # The filter used to search for devices.
      struct SearchDevicesFilter
        include JSON::Serializable

        # The name of the device parameter to filter based on. Only deviceArn filter name is currently
        # supported.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values used to filter devices based on the filter name.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      struct SearchDevicesRequest
        include JSON::Serializable

        # Array of SearchDevicesFilter objects to use when searching for devices.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SearchDevicesFilter)

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination of results returned in the response. Use the token returned from the
        # previous request to continue search where the previous request ended.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SearchDevicesFilter),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchDevicesResponse
        include JSON::Serializable

        # An array of DeviceSummary objects for devices that match the specified filter values.
        @[JSON::Field(key: "devices")]
        getter devices : Array(Types::DeviceSummary)

        # A token used for pagination of results, or null if there are no additional results. Use the token
        # value in a subsequent request to continue search where the previous request ended.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @devices : Array(Types::DeviceSummary),
          @next_token : String? = nil
        )
        end
      end

      # A filter used to search for Amazon Braket hybrid jobs.
      struct SearchJobsFilter
        include JSON::Serializable

        # The name of the hybrid job parameter to filter based on. Filter name can be either jobArn or
        # createdAt .
        @[JSON::Field(key: "name")]
        getter name : String

        # An operator to use for the filter.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values used to filter hybrid jobs based on the filter name and operator.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      struct SearchJobsRequest
        include JSON::Serializable

        # Array of SearchJobsFilter objects to use when searching for hybrid jobs.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SearchJobsFilter)

        # The maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination of results returned in the response. Use the token returned from the
        # previous request to continue search where the previous request ended.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SearchJobsFilter),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchJobsResponse
        include JSON::Serializable

        # An array of JobSummary objects for devices that match the specified filter values.
        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobSummary)

        # A token used for pagination of results, or null if there are no additional results. Use the token
        # value in a subsequent request to continue search where the previous request ended.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobSummary),
          @next_token : String? = nil
        )
        end
      end

      # A filter used to search for quantum tasks.
      struct SearchQuantumTasksFilter
        include JSON::Serializable

        # The name of the quantum task parameter to filter based on. Filter name can be either quantumTaskArn
        # , deviceArn , jobArn , status or createdAt .
        @[JSON::Field(key: "name")]
        getter name : String

        # An operator to use for the filter.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The values used to filter quantum tasks based on the filter name and operator.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      struct SearchQuantumTasksRequest
        include JSON::Serializable

        # Array of SearchQuantumTasksFilter objects to use when searching for quantum tasks.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SearchQuantumTasksFilter)

        # Maximum number of results to return in the response.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A token used for pagination of results returned in the response. Use the token returned from the
        # previous request to continue search where the previous request ended.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SearchQuantumTasksFilter),
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchQuantumTasksResponse
        include JSON::Serializable

        # An array of QuantumTaskSummary objects for quantum tasks that match the specified filters.
        @[JSON::Field(key: "quantumTasks")]
        getter quantum_tasks : Array(Types::QuantumTaskSummary)

        # A token used for pagination of results, or null if there are no additional results. Use the token
        # value in a subsequent request to continue search where the previous request ended.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @quantum_tasks : Array(Types::QuantumTaskSummary),
          @next_token : String? = nil
        )
        end
      end

      # Specifies filter criteria for searching spending limits. Use filters to narrow down results based on
      # specific attributes.
      struct SearchSpendingLimitsFilter
        include JSON::Serializable

        # The name of the field to filter on. Currently only supports deviceArn .
        @[JSON::Field(key: "name")]
        getter name : String

        # The comparison operator to use when filtering.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # An array of values to match against the specified field.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      struct SearchSpendingLimitsRequest
        include JSON::Serializable

        # The filters to apply when searching for spending limits. Use filters to narrow down the results
        # based on specific criteria.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SearchSpendingLimitsFilter)?

        # The maximum number of results to return in a single call. Minimum value of 1, maximum value of 100.
        # Default is 20.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to retrieve the next page of results. This value is returned from a previous call to
        # SearchSpendingLimits when there are more results available.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SearchSpendingLimitsFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct SearchSpendingLimitsResponse
        include JSON::Serializable

        # An array of spending limit summaries that match the specified filters.
        @[JSON::Field(key: "spendingLimits")]
        getter spending_limits : Array(Types::SpendingLimitSummary)

        # The token to retrieve the next page of results. This value is null when there are no more results to
        # return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @spending_limits : Array(Types::SpendingLimitSummary),
          @next_token : String? = nil
        )
        end
      end

      # The request failed because a service quota is exceeded.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains summary information about a spending limit, including current spending status and
      # configuration details.
      struct SpendingLimitSummary
        include JSON::Serializable

        # The date and time when the spending limit was created, in epoch seconds.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon Resource Name (ARN) of the quantum device associated with this spending limit.
        @[JSON::Field(key: "deviceArn")]
        getter device_arn : String

        # The amount currently queued for spending on the device, in USD.
        @[JSON::Field(key: "queuedSpend")]
        getter queued_spend : String

        # The maximum spending amount allowed for the device during the specified time period, in USD.
        @[JSON::Field(key: "spendingLimit")]
        getter spending_limit : String

        # The Amazon Resource Name (ARN) that uniquely identifies the spending limit.
        @[JSON::Field(key: "spendingLimitArn")]
        getter spending_limit_arn : String

        # The time period during which the spending limit is active.
        @[JSON::Field(key: "timePeriod")]
        getter time_period : Types::TimePeriod

        # The total amount spent on the device so far during the current time period, in USD.
        @[JSON::Field(key: "totalSpend")]
        getter total_spend : String

        # The date and time when the spending limit was last modified, in epoch seconds.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The tags associated with the spending limit. Each tag consists of a key and an optional value.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @created_at : Time,
          @device_arn : String,
          @queued_spend : String,
          @spending_limit : String,
          @spending_limit_arn : String,
          @time_period : Types::TimePeriod,
          @total_spend : String,
          @updated_at : Time,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # Specify the resourceArn of the resource to which a tag will be added.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specify the tags to add to the resource. Tags can be specified as a key-value map.
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

      # The API throttling rate limit is exceeded.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Defines a time range for spending limits, specifying when the limit is active.
      struct TimePeriod
        include JSON::Serializable

        # The end date and time for the spending limit period, in epoch seconds.
        @[JSON::Field(key: "endAt")]
        getter end_at : Time

        # The start date and time for the spending limit period, in epoch seconds.
        @[JSON::Field(key: "startAt")]
        getter start_at : Time

        def initialize(
          @end_at : Time,
          @start_at : Time
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # Specify the resourceArn for the resource from which to remove the tags.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specify the keys for the tags to remove from the resource.
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

      struct UpdateSpendingLimitRequest
        include JSON::Serializable

        # A unique, case-sensitive identifier to ensure that the operation completes no more than one time. If
        # this token matches a previous request, Amazon Braket ignores the request, but does not return an
        # error.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon Resource Name (ARN) of the spending limit to update.
        @[JSON::Field(key: "spendingLimitArn")]
        getter spending_limit_arn : String

        # The new maximum amount that can be spent on the specified device, in USD.
        @[JSON::Field(key: "spendingLimit")]
        getter spending_limit : String?

        # The new time period during which the spending limit is active, including start and end dates.
        @[JSON::Field(key: "timePeriod")]
        getter time_period : Types::TimePeriod?

        def initialize(
          @client_token : String,
          @spending_limit_arn : String,
          @spending_limit : String? = nil,
          @time_period : Types::TimePeriod? = nil
        )
        end
      end

      struct UpdateSpendingLimitResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The input request failed to satisfy constraints expected by Amazon Braket.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        # The validation failures in the program set submitted in the request.
        @[JSON::Field(key: "programSetValidationFailures")]
        getter program_set_validation_failures : Array(Types::ProgramSetValidationFailure)?

        # The reason for validation failure.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @program_set_validation_failures : Array(Types::ProgramSetValidationFailure)? = nil,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
