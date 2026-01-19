require "json"
require "time"

module AwsSdk
  module EMRServerless
    module Types

      # Information about an application. Amazon EMR Serverless uses applications to run jobs.
      struct Application
        include JSON::Serializable

        # The ID of the application.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ARN of the application.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the application run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The Amazon EMR release associated with the application.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The state of the application.
        @[JSON::Field(key: "state")]
        getter state : String

        # The type of application, such as Spark or Hive.
        @[JSON::Field(key: "type")]
        getter type : String

        # The date and time when the application run was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The CPU architecture of an application.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The configuration for an application to automatically start on job submission.
        @[JSON::Field(key: "autoStartConfiguration")]
        getter auto_start_configuration : Types::AutoStartConfig?

        # The configuration for an application to automatically stop after a certain amount of time being
        # idle.
        @[JSON::Field(key: "autoStopConfiguration")]
        getter auto_stop_configuration : Types::AutoStopConfig?

        # The configuration object that allows encrypting local disks.
        @[JSON::Field(key: "diskEncryptionConfiguration")]
        getter disk_encryption_configuration : Types::DiskEncryptionConfiguration?

        # The IAM Identity Center configuration applied to enable trusted identity propagation.
        @[JSON::Field(key: "identityCenterConfiguration")]
        getter identity_center_configuration : Types::IdentityCenterConfiguration?

        # The image configuration applied to all worker types.
        @[JSON::Field(key: "imageConfiguration")]
        getter image_configuration : Types::ImageConfiguration?

        # The initial capacity of the application.
        @[JSON::Field(key: "initialCapacity")]
        getter initial_capacity : Hash(String, Types::InitialCapacityConfig)?

        # The interactive configuration object that enables the interactive use cases for an application.
        @[JSON::Field(key: "interactiveConfiguration")]
        getter interactive_configuration : Types::InteractiveConfiguration?

        # The configuration object that enables job level cost allocation.
        @[JSON::Field(key: "jobLevelCostAllocationConfiguration")]
        getter job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration?

        # The maximum capacity of the application. This is cumulative across all workers at any given point in
        # time during the lifespan of the application is created. No new resources will be created once any
        # one of the defined limits is hit.
        @[JSON::Field(key: "maximumCapacity")]
        getter maximum_capacity : Types::MaximumAllowedResources?

        @[JSON::Field(key: "monitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # The name of the application.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The network configuration for customer VPC connectivity for the application.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The Configuration specifications of an application. Each configuration consists of a classification
        # and properties. You use this parameter when creating or updating an application. To see the
        # runtimeConfiguration object of an application, run the GetApplication API operation.
        @[JSON::Field(key: "runtimeConfiguration")]
        getter runtime_configuration : Array(Types::Configuration)?

        # The scheduler configuration for batch and streaming jobs running on this application. Supported with
        # release labels emr-7.0.0 and above.
        @[JSON::Field(key: "schedulerConfiguration")]
        getter scheduler_configuration : Types::SchedulerConfiguration?

        # The state details of the application.
        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        # The tags assigned to the application.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The specification applied to each worker type.
        @[JSON::Field(key: "workerTypeSpecifications")]
        getter worker_type_specifications : Hash(String, Types::WorkerTypeSpecification)?

        def initialize(
          @application_id : String,
          @arn : String,
          @created_at : Time,
          @release_label : String,
          @state : String,
          @type : String,
          @updated_at : Time,
          @architecture : String? = nil,
          @auto_start_configuration : Types::AutoStartConfig? = nil,
          @auto_stop_configuration : Types::AutoStopConfig? = nil,
          @disk_encryption_configuration : Types::DiskEncryptionConfiguration? = nil,
          @identity_center_configuration : Types::IdentityCenterConfiguration? = nil,
          @image_configuration : Types::ImageConfiguration? = nil,
          @initial_capacity : Hash(String, Types::InitialCapacityConfig)? = nil,
          @interactive_configuration : Types::InteractiveConfiguration? = nil,
          @job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration? = nil,
          @maximum_capacity : Types::MaximumAllowedResources? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @name : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @runtime_configuration : Array(Types::Configuration)? = nil,
          @scheduler_configuration : Types::SchedulerConfiguration? = nil,
          @state_details : String? = nil,
          @tags : Hash(String, String)? = nil,
          @worker_type_specifications : Hash(String, Types::WorkerTypeSpecification)? = nil
        )
        end
      end

      # The summary of attributes associated with an application.
      struct ApplicationSummary
        include JSON::Serializable

        # The ARN of the application.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the application was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The ID of the application.
        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon EMR release associated with the application.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The state of the application.
        @[JSON::Field(key: "state")]
        getter state : String

        # The type of application, such as Spark or Hive.
        @[JSON::Field(key: "type")]
        getter type : String

        # The date and time when the application was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The CPU architecture of an application.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The name of the application.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The state details of the application.
        @[JSON::Field(key: "stateDetails")]
        getter state_details : String?

        def initialize(
          @arn : String,
          @created_at : Time,
          @id : String,
          @release_label : String,
          @state : String,
          @type : String,
          @updated_at : Time,
          @architecture : String? = nil,
          @name : String? = nil,
          @state_details : String? = nil
        )
        end
      end

      # The configuration for an application to automatically start on job submission.
      struct AutoStartConfig
        include JSON::Serializable

        # Enables the application to automatically start on job submission. Defaults to true.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # The configuration for an application to automatically stop after a certain amount of time being
      # idle.
      struct AutoStopConfig
        include JSON::Serializable

        # Enables the application to automatically stop after a certain amount of time being idle. Defaults to
        # true.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The amount of idle time in minutes after which your application will automatically stop. Defaults to
        # 15 minutes.
        @[JSON::Field(key: "idleTimeoutMinutes")]
        getter idle_timeout_minutes : Int32?

        def initialize(
          @enabled : Bool? = nil,
          @idle_timeout_minutes : Int32? = nil
        )
        end
      end

      struct CancelJobRunRequest
        include JSON::Serializable

        # The ID of the application on which the job run will be canceled.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ID of the job run to cancel.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        # The duration in seconds to wait before forcefully terminating the job after cancellation is
        # requested.
        @[JSON::Field(key: "shutdownGracePeriodInSeconds")]
        getter shutdown_grace_period_in_seconds : Int32?

        def initialize(
          @application_id : String,
          @job_run_id : String,
          @shutdown_grace_period_in_seconds : Int32? = nil
        )
        end
      end

      struct CancelJobRunResponse
        include JSON::Serializable

        # The output contains the application ID on which the job run is cancelled.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The output contains the ID of the cancelled job run.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        def initialize(
          @application_id : String,
          @job_run_id : String
        )
        end
      end

      # The Amazon CloudWatch configuration for monitoring logs. You can configure your jobs to send log
      # information to CloudWatch.
      struct CloudWatchLoggingConfiguration
        include JSON::Serializable

        # Enables CloudWatch logging.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool

        # The Key Management Service (KMS) key ARN to encrypt the logs that you store in CloudWatch Logs.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The name of the log group in Amazon CloudWatch Logs where you want to publish your logs.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String?

        # Prefix for the CloudWatch log stream name.
        @[JSON::Field(key: "logStreamNamePrefix")]
        getter log_stream_name_prefix : String?

        # The types of logs that you want to publish to CloudWatch. If you don't specify any log types, driver
        # STDOUT and STDERR logs will be published to CloudWatch Logs by default. For more information
        # including the supported worker types for Hive and Spark, see Logging for EMR Serverless with
        # CloudWatch . Key Valid Values : SPARK_DRIVER , SPARK_EXECUTOR , HIVE_DRIVER , TEZ_TASK Array Members
        # Valid Values : STDOUT , STDERR , HIVE_LOG , TEZ_AM , SYSTEM_LOGS
        @[JSON::Field(key: "logTypes")]
        getter log_types : Hash(String, Array(String))?

        def initialize(
          @enabled : Bool,
          @encryption_key_arn : String? = nil,
          @log_group_name : String? = nil,
          @log_stream_name_prefix : String? = nil,
          @log_types : Hash(String, Array(String))? = nil
        )
        end
      end

      # A configuration specification to be used when provisioning an application. A configuration consists
      # of a classification, properties, and optional nested configurations. A classification refers to an
      # application-specific configuration file. Properties are the settings you want to change in that
      # file.
      struct Configuration
        include JSON::Serializable

        # The classification within a configuration.
        @[JSON::Field(key: "classification")]
        getter classification : String

        # A list of additional configurations to apply within a configuration object.
        @[JSON::Field(key: "configurations")]
        getter configurations : Array(Types::Configuration)?

        # A set of properties specified within a configuration classification.
        @[JSON::Field(key: "properties")]
        getter properties : Hash(String, String)?

        def initialize(
          @classification : String,
          @configurations : Array(Types::Configuration)? = nil,
          @properties : Hash(String, String)? = nil
        )
        end
      end

      # A configuration specification to be used to override existing configurations.
      struct ConfigurationOverrides
        include JSON::Serializable

        # The override configurations for the application.
        @[JSON::Field(key: "applicationConfiguration")]
        getter application_configuration : Array(Types::Configuration)?

        # The override configuration to encrypt local disks.
        @[JSON::Field(key: "diskEncryptionConfiguration")]
        getter disk_encryption_configuration : Types::DiskEncryptionConfiguration?

        # The override configurations for monitoring.
        @[JSON::Field(key: "monitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        def initialize(
          @application_configuration : Array(Types::Configuration)? = nil,
          @disk_encryption_configuration : Types::DiskEncryptionConfiguration? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil
        )
        end
      end

      # The request could not be processed because of conflict in the current state of the resource.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateApplicationRequest
        include JSON::Serializable

        # The client idempotency token of the application to create. Its value must be unique for each
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The Amazon EMR release associated with the application.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The type of application you want to start, such as Spark or Hive.
        @[JSON::Field(key: "type")]
        getter type : String

        # The CPU architecture of an application.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The configuration for an application to automatically start on job submission.
        @[JSON::Field(key: "autoStartConfiguration")]
        getter auto_start_configuration : Types::AutoStartConfig?

        # The configuration for an application to automatically stop after a certain amount of time being
        # idle.
        @[JSON::Field(key: "autoStopConfiguration")]
        getter auto_stop_configuration : Types::AutoStopConfig?

        # The configuration object that allows encrypting local disks.
        @[JSON::Field(key: "diskEncryptionConfiguration")]
        getter disk_encryption_configuration : Types::DiskEncryptionConfiguration?

        # The IAM Identity Center Configuration accepts the Identity Center instance parameter required to
        # enable trusted identity propagation. This configuration allows identity propagation between
        # integrated services and the Identity Center instance.
        @[JSON::Field(key: "identityCenterConfiguration")]
        getter identity_center_configuration : Types::IdentityCenterConfigurationInput?

        # The image configuration for all worker types. You can either set this parameter or
        # imageConfiguration for each worker type in workerTypeSpecifications .
        @[JSON::Field(key: "imageConfiguration")]
        getter image_configuration : Types::ImageConfigurationInput?

        # The capacity to initialize when the application is created.
        @[JSON::Field(key: "initialCapacity")]
        getter initial_capacity : Hash(String, Types::InitialCapacityConfig)?

        # The interactive configuration object that enables the interactive use cases to use when running an
        # application.
        @[JSON::Field(key: "interactiveConfiguration")]
        getter interactive_configuration : Types::InteractiveConfiguration?

        # The configuration object that enables job level cost allocation.
        @[JSON::Field(key: "jobLevelCostAllocationConfiguration")]
        getter job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration?

        # The maximum capacity to allocate when the application is created. This is cumulative across all
        # workers at any given point in time, not just when an application is created. No new resources will
        # be created once any one of the defined limits is hit.
        @[JSON::Field(key: "maximumCapacity")]
        getter maximum_capacity : Types::MaximumAllowedResources?

        # The configuration setting for monitoring.
        @[JSON::Field(key: "monitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        # The name of the application.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The network configuration for customer VPC connectivity.
        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The Configuration specifications to use when creating an application. Each configuration consists of
        # a classification and properties. This configuration is applied to all the job runs submitted under
        # the application.
        @[JSON::Field(key: "runtimeConfiguration")]
        getter runtime_configuration : Array(Types::Configuration)?

        # The scheduler configuration for batch and streaming jobs running on this application. Supported with
        # release labels emr-7.0.0 and above.
        @[JSON::Field(key: "schedulerConfiguration")]
        getter scheduler_configuration : Types::SchedulerConfiguration?

        # The tags assigned to the application.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The key-value pairs that specify worker type to WorkerTypeSpecificationInput . This parameter must
        # contain all valid worker types for a Spark or Hive application. Valid worker types include Driver
        # and Executor for Spark applications and HiveDriver and TezTask for Hive applications. You can either
        # set image details in this parameter for each worker type, or in imageConfiguration for all worker
        # types.
        @[JSON::Field(key: "workerTypeSpecifications")]
        getter worker_type_specifications : Hash(String, Types::WorkerTypeSpecificationInput)?

        def initialize(
          @client_token : String,
          @release_label : String,
          @type : String,
          @architecture : String? = nil,
          @auto_start_configuration : Types::AutoStartConfig? = nil,
          @auto_stop_configuration : Types::AutoStopConfig? = nil,
          @disk_encryption_configuration : Types::DiskEncryptionConfiguration? = nil,
          @identity_center_configuration : Types::IdentityCenterConfigurationInput? = nil,
          @image_configuration : Types::ImageConfigurationInput? = nil,
          @initial_capacity : Hash(String, Types::InitialCapacityConfig)? = nil,
          @interactive_configuration : Types::InteractiveConfiguration? = nil,
          @job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration? = nil,
          @maximum_capacity : Types::MaximumAllowedResources? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @name : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @runtime_configuration : Array(Types::Configuration)? = nil,
          @scheduler_configuration : Types::SchedulerConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @worker_type_specifications : Hash(String, Types::WorkerTypeSpecificationInput)? = nil
        )
        end
      end

      struct CreateApplicationResponse
        include JSON::Serializable

        # The output contains the application ID.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The output contains the ARN of the application.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The output contains the name of the application.
        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @application_id : String,
          @arn : String,
          @name : String? = nil
        )
        end
      end

      struct DeleteApplicationRequest
        include JSON::Serializable

        # The ID of the application that will be deleted.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      struct DeleteApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The configuration object that allows encrypting local disks.
      struct DiskEncryptionConfiguration
        include JSON::Serializable

        # Specifies the optional encryption context that will be used when encrypting the data. An encryption
        # context is a collection of non-secret key-value pairs that represent additional authenticated data.
        @[JSON::Field(key: "encryptionContext")]
        getter encryption_context : Hash(String, String)?

        # The KMS key ARN to encrypt local disks.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @encryption_context : Hash(String, String)? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end

      struct GetApplicationRequest
        include JSON::Serializable

        # The ID of the application that will be described.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      struct GetApplicationResponse
        include JSON::Serializable

        # The output displays information about the specified application.
        @[JSON::Field(key: "application")]
        getter application : Types::Application

        def initialize(
          @application : Types::Application
        )
        end
      end

      struct GetDashboardForJobRunRequest
        include JSON::Serializable

        # The ID of the application.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ID of the job run.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        # Allows access to system profile logs for Lake Formation-enabled jobs. Default is false.
        @[JSON::Field(key: "accessSystemProfileLogs")]
        getter access_system_profile_logs : Bool?

        # An optimal parameter that indicates the amount of attempts for the job. If not specified, this value
        # defaults to the attempt of the latest job.
        @[JSON::Field(key: "attempt")]
        getter attempt : Int32?

        def initialize(
          @application_id : String,
          @job_run_id : String,
          @access_system_profile_logs : Bool? = nil,
          @attempt : Int32? = nil
        )
        end
      end

      struct GetDashboardForJobRunResponse
        include JSON::Serializable

        # The URL to view job run's dashboard.
        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @url : String? = nil
        )
        end
      end

      struct GetJobRunRequest
        include JSON::Serializable

        # The ID of the application on which the job run is submitted.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ID of the job run.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        # An optimal parameter that indicates the amount of attempts for the job. If not specified, this value
        # defaults to the attempt of the latest job.
        @[JSON::Field(key: "attempt")]
        getter attempt : Int32?

        def initialize(
          @application_id : String,
          @job_run_id : String,
          @attempt : Int32? = nil
        )
        end
      end

      struct GetJobRunResponse
        include JSON::Serializable

        # The output displays information about the job run.
        @[JSON::Field(key: "jobRun")]
        getter job_run : Types::JobRun

        def initialize(
          @job_run : Types::JobRun
        )
        end
      end

      # The configurations for the Hive job driver.
      struct Hive
        include JSON::Serializable

        # The query for the Hive job run.
        @[JSON::Field(key: "query")]
        getter query : String

        # The query file for the Hive job run.
        @[JSON::Field(key: "initQueryFile")]
        getter init_query_file : String?

        # The parameters for the Hive job run.
        @[JSON::Field(key: "parameters")]
        getter parameters : String?

        def initialize(
          @query : String,
          @init_query_file : String? = nil,
          @parameters : String? = nil
        )
        end
      end

      # The IAM Identity Center Configuration accepts the Identity Center instance parameter required to
      # enable trusted identity propagation. This configuration allows identity propagation between
      # integrated services and the Identity Center instance.
      struct IdentityCenterConfiguration
        include JSON::Serializable

        # The ARN of the EMR Serverless created IAM Identity Center Application that provides trusted-identity
        # propagation.
        @[JSON::Field(key: "identityCenterApplicationArn")]
        getter identity_center_application_arn : String?

        # The ARN of the IAM Identity Center instance.
        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        # Enables user background sessions for this application so Livy sessions can continue running after
        # users log out of their interactive notebook or their Identity Center sessions expire.
        @[JSON::Field(key: "userBackgroundSessionsEnabled")]
        getter user_background_sessions_enabled : Bool?

        def initialize(
          @identity_center_application_arn : String? = nil,
          @identity_center_instance_arn : String? = nil,
          @user_background_sessions_enabled : Bool? = nil
        )
        end
      end

      # The IAM Identity Center Configuration accepts the Identity Center instance parameter required to
      # enable trusted identity propagation. This configuration allows identity propagation between
      # integrated services and the Identity Center instance.
      struct IdentityCenterConfigurationInput
        include JSON::Serializable

        # The ARN of the IAM Identity Center instance.
        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String?

        # Enables user background sessions for this application so Livy sessions can continue running after
        # users log out of their interactive notebook or their Identity Center sessions expire.
        @[JSON::Field(key: "userBackgroundSessionsEnabled")]
        getter user_background_sessions_enabled : Bool?

        def initialize(
          @identity_center_instance_arn : String? = nil,
          @user_background_sessions_enabled : Bool? = nil
        )
        end
      end

      # The applied image configuration.
      struct ImageConfiguration
        include JSON::Serializable

        # The image URI.
        @[JSON::Field(key: "imageUri")]
        getter image_uri : String

        # The SHA256 digest of the image URI. This indicates which specific image the application is
        # configured for. The image digest doesn't exist until an application has started.
        @[JSON::Field(key: "resolvedImageDigest")]
        getter resolved_image_digest : String?

        def initialize(
          @image_uri : String,
          @resolved_image_digest : String? = nil
        )
        end
      end

      # The image configuration.
      struct ImageConfigurationInput
        include JSON::Serializable

        # The URI of an image in the Amazon ECR registry. This field is required when you create a new
        # application. If you leave this field blank in an update, Amazon EMR will remove the image
        # configuration.
        @[JSON::Field(key: "imageUri")]
        getter image_uri : String?

        def initialize(
          @image_uri : String? = nil
        )
        end
      end

      # The initial capacity configuration per worker.
      struct InitialCapacityConfig
        include JSON::Serializable

        # The number of workers in the initial capacity configuration.
        @[JSON::Field(key: "workerCount")]
        getter worker_count : Int64

        # The resource configuration of the initial capacity configuration.
        @[JSON::Field(key: "workerConfiguration")]
        getter worker_configuration : Types::WorkerResourceConfig?

        def initialize(
          @worker_count : Int64,
          @worker_configuration : Types::WorkerResourceConfig? = nil
        )
        end
      end

      # The configuration to use to enable the different types of interactive use cases in an application.
      struct InteractiveConfiguration
        include JSON::Serializable

        # Enables an Apache Livy endpoint that you can connect to and run interactive jobs.
        @[JSON::Field(key: "livyEndpointEnabled")]
        getter livy_endpoint_enabled : Bool?

        # Enables you to connect an application to Amazon EMR Studio to run interactive workloads in a
        # notebook.
        @[JSON::Field(key: "studioEnabled")]
        getter studio_enabled : Bool?

        def initialize(
          @livy_endpoint_enabled : Bool? = nil,
          @studio_enabled : Bool? = nil
        )
        end
      end

      # Request processing failed because of an error or failure with the service.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The driver that the job runs on.
      struct JobDriver
        include JSON::Serializable

        # The job driver parameters specified for Hive.
        @[JSON::Field(key: "hive")]
        getter hive : Types::Hive?

        # The job driver parameters specified for Spark.
        @[JSON::Field(key: "sparkSubmit")]
        getter spark_submit : Types::SparkSubmit?

        def initialize(
          @hive : Types::Hive? = nil,
          @spark_submit : Types::SparkSubmit? = nil
        )
        end
      end

      # The configuration object that enables job level cost allocation.
      struct JobLevelCostAllocationConfiguration
        include JSON::Serializable

        # Enables job level cost allocation for the application.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end

      # Information about a job run. A job run is a unit of work, such as a Spark JAR, Hive query, or
      # SparkSQL query, that you submit to an Amazon EMR Serverless application.
      struct JobRun
        include JSON::Serializable

        # The ID of the application the job is running on.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The execution role ARN of the job run.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the job run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the job run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The execution role ARN of the job run.
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The job driver for the job run.
        @[JSON::Field(key: "jobDriver")]
        getter job_driver : Types::JobDriver

        # The ID of the job run.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        # The Amazon EMR release associated with the application your job is running on.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The state of the job run.
        @[JSON::Field(key: "state")]
        getter state : String

        # The state details of the job run.
        @[JSON::Field(key: "stateDetails")]
        getter state_details : String

        # The date and time when the job run was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The attempt of the job run.
        @[JSON::Field(key: "attempt")]
        getter attempt : Int32?

        # The date and time of when the job run attempt was created.
        @[JSON::Field(key: "attemptCreatedAt")]
        getter attempt_created_at : Time?

        # The date and time of when the job run attempt was last updated.
        @[JSON::Field(key: "attemptUpdatedAt")]
        getter attempt_updated_at : Time?

        # The aggregate vCPU, memory, and storage that Amazon Web Services has billed for the job run. The
        # billed resources include a 1-minute minimum usage for workers, plus additional storage over 20 GB
        # per worker. Note that billed resources do not include usage for idle pre-initialized workers.
        @[JSON::Field(key: "billedResourceUtilization")]
        getter billed_resource_utilization : Types::ResourceUtilization?

        # The configuration settings that are used to override default configuration.
        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ConfigurationOverrides?

        # The date and time when the job was terminated.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        @[JSON::Field(key: "executionIamPolicy")]
        getter execution_iam_policy : Types::JobRunExecutionIamPolicy?

        # Returns the job run timeout value from the StartJobRun call. If no timeout was specified, then it
        # returns the default timeout of 720 minutes.
        @[JSON::Field(key: "executionTimeoutMinutes")]
        getter execution_timeout_minutes : Int64?

        # The mode of the job run.
        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The optional job run name. This doesn't have to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The total time for a job in the QUEUED state in milliseconds.
        @[JSON::Field(key: "queuedDurationMilliseconds")]
        getter queued_duration_milliseconds : Int64?

        # The retry policy of the job run.
        @[JSON::Field(key: "retryPolicy")]
        getter retry_policy : Types::RetryPolicy?

        # The date and time when the job moved to the RUNNING state.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The tags assigned to the job run.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The job run total execution duration in seconds. This field is only available for job runs in a
        # COMPLETED , FAILED , or CANCELLED state.
        @[JSON::Field(key: "totalExecutionDurationSeconds")]
        getter total_execution_duration_seconds : Int32?

        # The aggregate vCPU, memory, and storage resources used from the time the job starts to execute,
        # until the time the job terminates, rounded up to the nearest second.
        @[JSON::Field(key: "totalResourceUtilization")]
        getter total_resource_utilization : Types::TotalResourceUtilization?

        def initialize(
          @application_id : String,
          @arn : String,
          @created_at : Time,
          @created_by : String,
          @execution_role : String,
          @job_driver : Types::JobDriver,
          @job_run_id : String,
          @release_label : String,
          @state : String,
          @state_details : String,
          @updated_at : Time,
          @attempt : Int32? = nil,
          @attempt_created_at : Time? = nil,
          @attempt_updated_at : Time? = nil,
          @billed_resource_utilization : Types::ResourceUtilization? = nil,
          @configuration_overrides : Types::ConfigurationOverrides? = nil,
          @ended_at : Time? = nil,
          @execution_iam_policy : Types::JobRunExecutionIamPolicy? = nil,
          @execution_timeout_minutes : Int64? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @queued_duration_milliseconds : Int64? = nil,
          @retry_policy : Types::RetryPolicy? = nil,
          @started_at : Time? = nil,
          @tags : Hash(String, String)? = nil,
          @total_execution_duration_seconds : Int32? = nil,
          @total_resource_utilization : Types::TotalResourceUtilization? = nil
        )
        end
      end

      # The summary of attributes associated with a job run attempt.
      struct JobRunAttemptSummary
        include JSON::Serializable

        # The ID of the application the job is running on.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The Amazon Resource Name (ARN) of the job run.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the job run attempt was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the job run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The Amazon Resource Name (ARN) of the execution role of the job run..
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The ID of the job run attempt.
        @[JSON::Field(key: "id")]
        getter id : String

        # The date and time of when the job run was created.
        @[JSON::Field(key: "jobCreatedAt")]
        getter job_created_at : Time

        # The Amazon EMR release label of the job run attempt.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The state of the job run attempt.
        @[JSON::Field(key: "state")]
        getter state : String

        # The state details of the job run attempt.
        @[JSON::Field(key: "stateDetails")]
        getter state_details : String

        # The date and time of when the job run attempt was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The attempt number of the job run execution.
        @[JSON::Field(key: "attempt")]
        getter attempt : Int32?

        # The mode of the job run attempt.
        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The name of the job run attempt.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of the job run, such as Spark or Hive.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @application_id : String,
          @arn : String,
          @created_at : Time,
          @created_by : String,
          @execution_role : String,
          @id : String,
          @job_created_at : Time,
          @release_label : String,
          @state : String,
          @state_details : String,
          @updated_at : Time,
          @attempt : Int32? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      # Optional IAM policy. The resulting job IAM role permissions will be an intersection of the policies
      # passed and the policy associated with your job execution role.
      struct JobRunExecutionIamPolicy
        include JSON::Serializable

        # An IAM inline policy to use as an execution IAM policy.
        @[JSON::Field(key: "policy")]
        getter policy : String?

        # A list of Amazon Resource Names (ARNs) to use as an execution IAM policy.
        @[JSON::Field(key: "policyArns")]
        getter policy_arns : Array(String)?

        def initialize(
          @policy : String? = nil,
          @policy_arns : Array(String)? = nil
        )
        end
      end

      # The summary of attributes associated with a job run.
      struct JobRunSummary
        include JSON::Serializable

        # The ID of the application the job is running on.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ARN of the job run.
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time when the job run was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user who created the job run.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The execution role ARN of the job run.
        @[JSON::Field(key: "executionRole")]
        getter execution_role : String

        # The ID of the job run.
        @[JSON::Field(key: "id")]
        getter id : String

        # The Amazon EMR release associated with the application your job is running on.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String

        # The state of the job run.
        @[JSON::Field(key: "state")]
        getter state : String

        # The state details of the job run.
        @[JSON::Field(key: "stateDetails")]
        getter state_details : String

        # The date and time when the job run was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time

        # The attempt number of the job run execution.
        @[JSON::Field(key: "attempt")]
        getter attempt : Int32?

        # The date and time of when the job run attempt was created.
        @[JSON::Field(key: "attemptCreatedAt")]
        getter attempt_created_at : Time?

        # The date and time of when the job run attempt was last updated.
        @[JSON::Field(key: "attemptUpdatedAt")]
        getter attempt_updated_at : Time?

        # The mode of the job run.
        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The optional job run name. This doesn't have to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The type of job run, such as Spark or Hive.
        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @application_id : String,
          @arn : String,
          @created_at : Time,
          @created_by : String,
          @execution_role : String,
          @id : String,
          @release_label : String,
          @state : String,
          @state_details : String,
          @updated_at : Time,
          @attempt : Int32? = nil,
          @attempt_created_at : Time? = nil,
          @attempt_updated_at : Time? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @type : String? = nil
        )
        end
      end

      struct ListApplicationsRequest
        include JSON::Serializable

        # The maximum number of applications that can be listed.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of application results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional filter for application states. Note that if this filter contains multiple states, the
        # resulting list will be grouped by the state.
        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil
        )
        end
      end

      struct ListApplicationsResponse
        include JSON::Serializable

        # The output lists the specified applications.
        @[JSON::Field(key: "applications")]
        getter applications : Array(Types::ApplicationSummary)

        # The output displays the token for the next set of application results. This is required for
        # pagination and is available as a response of the previous request.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobRunAttemptsRequest
        include JSON::Serializable

        # The ID of the application for which to list job runs.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ID of the job run to list.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        # The maximum number of job run attempts to list.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of job run attempt results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @job_run_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobRunAttemptsResponse
        include JSON::Serializable

        # The array of the listed job run attempt objects.
        @[JSON::Field(key: "jobRunAttempts")]
        getter job_run_attempts : Array(Types::JobRunAttemptSummary)

        # The output displays the token for the next set of application results. This is required for
        # pagination and is available as a response of the previous request.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_run_attempts : Array(Types::JobRunAttemptSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobRunsRequest
        include JSON::Serializable

        # The ID of the application for which to list the job run.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The lower bound of the option to filter by creation date and time.
        @[JSON::Field(key: "createdAtAfter")]
        getter created_at_after : Time?

        # The upper bound of the option to filter by creation date and time.
        @[JSON::Field(key: "createdAtBefore")]
        getter created_at_before : Time?

        # The maximum number of job runs that can be listed.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The mode of the job runs to list.
        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The token for the next set of job run results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An optional filter for job run states. Note that if this filter contains multiple states, the
        # resulting list will be grouped by the state.
        @[JSON::Field(key: "states")]
        getter states : Array(String)?

        def initialize(
          @application_id : String,
          @created_at_after : Time? = nil,
          @created_at_before : Time? = nil,
          @max_results : Int32? = nil,
          @mode : String? = nil,
          @next_token : String? = nil,
          @states : Array(String)? = nil
        )
        end
      end

      struct ListJobRunsResponse
        include JSON::Serializable

        # The output lists information about the specified job runs.
        @[JSON::Field(key: "jobRuns")]
        getter job_runs : Array(Types::JobRunSummary)

        # The output displays the token for the next set of job run results. This is required for pagination
        # and is available as a response of the previous request.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_runs : Array(Types::JobRunSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags for. Currently, the
        # supported resources are Amazon EMR Serverless applications and job runs.
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

      # The managed log persistence configuration for a job run.
      struct ManagedPersistenceMonitoringConfiguration
        include JSON::Serializable

        # Enables managed logging and defaults to true. If set to false, managed logging will be turned off.
        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The KMS key ARN to encrypt the logs stored in managed log persistence.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        def initialize(
          @enabled : Bool? = nil,
          @encryption_key_arn : String? = nil
        )
        end
      end

      # The maximum allowed cumulative resources for an application. No new resources will be created once
      # the limit is hit.
      struct MaximumAllowedResources
        include JSON::Serializable

        # The maximum allowed CPU for an application.
        @[JSON::Field(key: "cpu")]
        getter cpu : String

        # The maximum allowed resources for an application.
        @[JSON::Field(key: "memory")]
        getter memory : String

        # The maximum allowed disk for an application.
        @[JSON::Field(key: "disk")]
        getter disk : String?

        def initialize(
          @cpu : String,
          @memory : String,
          @disk : String? = nil
        )
        end
      end

      # The configuration setting for monitoring.
      struct MonitoringConfiguration
        include JSON::Serializable

        # The Amazon CloudWatch configuration for monitoring logs. You can configure your jobs to send log
        # information to CloudWatch.
        @[JSON::Field(key: "cloudWatchLoggingConfiguration")]
        getter cloud_watch_logging_configuration : Types::CloudWatchLoggingConfiguration?

        # The managed log persistence configuration for a job run.
        @[JSON::Field(key: "managedPersistenceMonitoringConfiguration")]
        getter managed_persistence_monitoring_configuration : Types::ManagedPersistenceMonitoringConfiguration?

        # The monitoring configuration object you can configure to send metrics to Amazon Managed Service for
        # Prometheus for a job run.
        @[JSON::Field(key: "prometheusMonitoringConfiguration")]
        getter prometheus_monitoring_configuration : Types::PrometheusMonitoringConfiguration?

        # The Amazon S3 configuration for monitoring log publishing.
        @[JSON::Field(key: "s3MonitoringConfiguration")]
        getter s3_monitoring_configuration : Types::S3MonitoringConfiguration?

        def initialize(
          @cloud_watch_logging_configuration : Types::CloudWatchLoggingConfiguration? = nil,
          @managed_persistence_monitoring_configuration : Types::ManagedPersistenceMonitoringConfiguration? = nil,
          @prometheus_monitoring_configuration : Types::PrometheusMonitoringConfiguration? = nil,
          @s3_monitoring_configuration : Types::S3MonitoringConfiguration? = nil
        )
        end
      end

      # The network configuration for customer VPC connectivity.
      struct NetworkConfiguration
        include JSON::Serializable

        # The array of security group Ids for customer VPC connectivity.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The array of subnet Ids for customer VPC connectivity.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # The monitoring configuration object you can configure to send metrics to Amazon Managed Service for
      # Prometheus for a job run.
      struct PrometheusMonitoringConfiguration
        include JSON::Serializable

        # The remote write URL in the Amazon Managed Service for Prometheus workspace to send metrics to.
        @[JSON::Field(key: "remoteWriteUrl")]
        getter remote_write_url : String?

        def initialize(
          @remote_write_url : String? = nil
        )
        end
      end

      # The specified resource was not found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The resource utilization for memory, storage, and vCPU for jobs.
      struct ResourceUtilization
        include JSON::Serializable

        # The aggregated memory used per hour from the time the job starts executing until the job is
        # terminated.
        @[JSON::Field(key: "memoryGBHour")]
        getter memory_gb_hour : Float64?

        # The aggregated storage used per hour from the time the job starts executing until the job is
        # terminated.
        @[JSON::Field(key: "storageGBHour")]
        getter storage_gb_hour : Float64?

        # The aggregated vCPU used per hour from the time the job starts executing until the job is
        # terminated.
        @[JSON::Field(key: "vCPUHour")]
        getter v_cpu_hour : Float64?

        def initialize(
          @memory_gb_hour : Float64? = nil,
          @storage_gb_hour : Float64? = nil,
          @v_cpu_hour : Float64? = nil
        )
        end
      end

      # The retry policy to use for a job run.
      struct RetryPolicy
        include JSON::Serializable

        # Maximum number of attempts for the job run. This parameter is only applicable for BATCH mode.
        @[JSON::Field(key: "maxAttempts")]
        getter max_attempts : Int32?

        # Maximum number of failed attempts per hour. This [arameter is only applicable for STREAMING mode.
        @[JSON::Field(key: "maxFailedAttemptsPerHour")]
        getter max_failed_attempts_per_hour : Int32?

        def initialize(
          @max_attempts : Int32? = nil,
          @max_failed_attempts_per_hour : Int32? = nil
        )
        end
      end

      # The Amazon S3 configuration for monitoring log publishing. You can configure your jobs to send log
      # information to Amazon S3.
      struct S3MonitoringConfiguration
        include JSON::Serializable

        # The KMS key ARN to encrypt the logs published to the given Amazon S3 destination.
        @[JSON::Field(key: "encryptionKeyArn")]
        getter encryption_key_arn : String?

        # The Amazon S3 destination URI for log publishing.
        @[JSON::Field(key: "logUri")]
        getter log_uri : String?

        def initialize(
          @encryption_key_arn : String? = nil,
          @log_uri : String? = nil
        )
        end
      end

      # The scheduler configuration for batch and streaming jobs running on this application. Supported with
      # release labels emr-7.0.0 and above.
      struct SchedulerConfiguration
        include JSON::Serializable

        # The maximum concurrent job runs on this application. If scheduler configuration is enabled on your
        # application, the default value is 15. The valid range is 1 to 1000.
        @[JSON::Field(key: "maxConcurrentRuns")]
        getter max_concurrent_runs : Int32?

        # The maximum duration in minutes for the job in QUEUED state. If scheduler configuration is enabled
        # on your application, the default value is 360 minutes (6 hours). The valid range is from 15 to 720.
        @[JSON::Field(key: "queueTimeoutMinutes")]
        getter queue_timeout_minutes : Int32?

        def initialize(
          @max_concurrent_runs : Int32? = nil,
          @queue_timeout_minutes : Int32? = nil
        )
        end
      end

      # The maximum number of resources per account has been reached.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The configurations for the Spark submit job driver.
      struct SparkSubmit
        include JSON::Serializable

        # The entry point for the Spark submit job run.
        @[JSON::Field(key: "entryPoint")]
        getter entry_point : String

        # The arguments for the Spark submit job run.
        @[JSON::Field(key: "entryPointArguments")]
        getter entry_point_arguments : Array(String)?

        # The parameters for the Spark submit job run.
        @[JSON::Field(key: "sparkSubmitParameters")]
        getter spark_submit_parameters : String?

        def initialize(
          @entry_point : String,
          @entry_point_arguments : Array(String)? = nil,
          @spark_submit_parameters : String? = nil
        )
        end
      end

      struct StartApplicationRequest
        include JSON::Serializable

        # The ID of the application to start.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      struct StartApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct StartJobRunRequest
        include JSON::Serializable

        # The ID of the application on which to run the job.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The client idempotency token of the job run to start. Its value must be unique for each request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The execution role ARN for the job run.
        @[JSON::Field(key: "executionRoleArn")]
        getter execution_role_arn : String

        # The configuration overrides for the job run.
        @[JSON::Field(key: "configurationOverrides")]
        getter configuration_overrides : Types::ConfigurationOverrides?

        # You can pass an optional IAM policy. The resulting job IAM role permissions will be an intersection
        # of this policy and the policy associated with your job execution role.
        @[JSON::Field(key: "executionIamPolicy")]
        getter execution_iam_policy : Types::JobRunExecutionIamPolicy?

        # The maximum duration for the job run to run. If the job run runs beyond this duration, it will be
        # automatically cancelled.
        @[JSON::Field(key: "executionTimeoutMinutes")]
        getter execution_timeout_minutes : Int64?

        # The job driver for the job run.
        @[JSON::Field(key: "jobDriver")]
        getter job_driver : Types::JobDriver?

        # The mode of the job run when it starts.
        @[JSON::Field(key: "mode")]
        getter mode : String?

        # The optional job run name. This doesn't have to be unique.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The retry policy when job run starts.
        @[JSON::Field(key: "retryPolicy")]
        getter retry_policy : Types::RetryPolicy?

        # The tags assigned to the job run.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @application_id : String,
          @client_token : String,
          @execution_role_arn : String,
          @configuration_overrides : Types::ConfigurationOverrides? = nil,
          @execution_iam_policy : Types::JobRunExecutionIamPolicy? = nil,
          @execution_timeout_minutes : Int64? = nil,
          @job_driver : Types::JobDriver? = nil,
          @mode : String? = nil,
          @name : String? = nil,
          @retry_policy : Types::RetryPolicy? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartJobRunResponse
        include JSON::Serializable

        # This output displays the application ID on which the job run was submitted.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # This output displays the ARN of the job run..
        @[JSON::Field(key: "arn")]
        getter arn : String

        # The output contains the ID of the started job run.
        @[JSON::Field(key: "jobRunId")]
        getter job_run_id : String

        def initialize(
          @application_id : String,
          @arn : String,
          @job_run_id : String
        )
        end
      end

      struct StopApplicationRequest
        include JSON::Serializable

        # The ID of the application to stop.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end

      struct StopApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags for. Currently, the
        # supported resources are Amazon EMR Serverless applications and job runs.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource. A tag is an array of key-value pairs.
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

      # The aggregate vCPU, memory, and storage resources used from the time job start executing till the
      # time job is terminated, rounded up to the nearest second.
      struct TotalResourceUtilization
        include JSON::Serializable

        # The aggregated memory used per hour from the time job start executing till the time job is
        # terminated.
        @[JSON::Field(key: "memoryGBHour")]
        getter memory_gb_hour : Float64?

        # The aggregated storage used per hour from the time job start executing till the time job is
        # terminated.
        @[JSON::Field(key: "storageGBHour")]
        getter storage_gb_hour : Float64?

        # The aggregated vCPU used per hour from the time job start executing till the time job is terminated.
        @[JSON::Field(key: "vCPUHour")]
        getter v_cpu_hour : Float64?

        def initialize(
          @memory_gb_hour : Float64? = nil,
          @storage_gb_hour : Float64? = nil,
          @v_cpu_hour : Float64? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the resource to list the tags for. Currently, the
        # supported resources are Amazon EMR Serverless applications and job runs.
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

      struct UpdateApplicationRequest
        include JSON::Serializable

        # The ID of the application to update.
        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The client idempotency token of the application to update. Its value must be unique for each
        # request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The CPU architecture of an application.
        @[JSON::Field(key: "architecture")]
        getter architecture : String?

        # The configuration for an application to automatically start on job submission.
        @[JSON::Field(key: "autoStartConfiguration")]
        getter auto_start_configuration : Types::AutoStartConfig?

        # The configuration for an application to automatically stop after a certain amount of time being
        # idle.
        @[JSON::Field(key: "autoStopConfiguration")]
        getter auto_stop_configuration : Types::AutoStopConfig?

        # The configuration object that allows encrypting local disks.
        @[JSON::Field(key: "diskEncryptionConfiguration")]
        getter disk_encryption_configuration : Types::DiskEncryptionConfiguration?

        # Specifies the IAM Identity Center configuration used to enable or disable trusted identity
        # propagation. When provided, this configuration determines how the application interacts with IAM
        # Identity Center for user authentication and access control.
        @[JSON::Field(key: "identityCenterConfiguration")]
        getter identity_center_configuration : Types::IdentityCenterConfigurationInput?

        # The image configuration to be used for all worker types. You can either set this parameter or
        # imageConfiguration for each worker type in WorkerTypeSpecificationInput .
        @[JSON::Field(key: "imageConfiguration")]
        getter image_configuration : Types::ImageConfigurationInput?

        # The capacity to initialize when the application is updated.
        @[JSON::Field(key: "initialCapacity")]
        getter initial_capacity : Hash(String, Types::InitialCapacityConfig)?

        # The interactive configuration object that contains new interactive use cases when the application is
        # updated.
        @[JSON::Field(key: "interactiveConfiguration")]
        getter interactive_configuration : Types::InteractiveConfiguration?

        # The configuration object that enables job level cost allocation.
        @[JSON::Field(key: "jobLevelCostAllocationConfiguration")]
        getter job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration?

        # The maximum capacity to allocate when the application is updated. This is cumulative across all
        # workers at any given point in time during the lifespan of the application. No new resources will be
        # created once any one of the defined limits is hit.
        @[JSON::Field(key: "maximumCapacity")]
        getter maximum_capacity : Types::MaximumAllowedResources?

        # The configuration setting for monitoring.
        @[JSON::Field(key: "monitoringConfiguration")]
        getter monitoring_configuration : Types::MonitoringConfiguration?

        @[JSON::Field(key: "networkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The Amazon EMR release label for the application. You can change the release label to use a
        # different release of Amazon EMR.
        @[JSON::Field(key: "releaseLabel")]
        getter release_label : String?

        # The Configuration specifications to use when updating an application. Each configuration consists of
        # a classification and properties. This configuration is applied across all the job runs submitted
        # under the application.
        @[JSON::Field(key: "runtimeConfiguration")]
        getter runtime_configuration : Array(Types::Configuration)?

        # The scheduler configuration for batch and streaming jobs running on this application. Supported with
        # release labels emr-7.0.0 and above.
        @[JSON::Field(key: "schedulerConfiguration")]
        getter scheduler_configuration : Types::SchedulerConfiguration?

        # The key-value pairs that specify worker type to WorkerTypeSpecificationInput . This parameter must
        # contain all valid worker types for a Spark or Hive application. Valid worker types include Driver
        # and Executor for Spark applications and HiveDriver and TezTask for Hive applications. You can either
        # set image details in this parameter for each worker type, or in imageConfiguration for all worker
        # types.
        @[JSON::Field(key: "workerTypeSpecifications")]
        getter worker_type_specifications : Hash(String, Types::WorkerTypeSpecificationInput)?

        def initialize(
          @application_id : String,
          @client_token : String,
          @architecture : String? = nil,
          @auto_start_configuration : Types::AutoStartConfig? = nil,
          @auto_stop_configuration : Types::AutoStopConfig? = nil,
          @disk_encryption_configuration : Types::DiskEncryptionConfiguration? = nil,
          @identity_center_configuration : Types::IdentityCenterConfigurationInput? = nil,
          @image_configuration : Types::ImageConfigurationInput? = nil,
          @initial_capacity : Hash(String, Types::InitialCapacityConfig)? = nil,
          @interactive_configuration : Types::InteractiveConfiguration? = nil,
          @job_level_cost_allocation_configuration : Types::JobLevelCostAllocationConfiguration? = nil,
          @maximum_capacity : Types::MaximumAllowedResources? = nil,
          @monitoring_configuration : Types::MonitoringConfiguration? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @release_label : String? = nil,
          @runtime_configuration : Array(Types::Configuration)? = nil,
          @scheduler_configuration : Types::SchedulerConfiguration? = nil,
          @worker_type_specifications : Hash(String, Types::WorkerTypeSpecificationInput)? = nil
        )
        end
      end

      struct UpdateApplicationResponse
        include JSON::Serializable

        # Information about the updated application.
        @[JSON::Field(key: "application")]
        getter application : Types::Application

        def initialize(
          @application : Types::Application
        )
        end
      end

      # The input fails to satisfy the constraints specified by an Amazon Web Services service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The cumulative configuration requirements for every worker instance of the worker type.
      struct WorkerResourceConfig
        include JSON::Serializable

        # The CPU requirements for every worker instance of the worker type.
        @[JSON::Field(key: "cpu")]
        getter cpu : String

        # The memory requirements for every worker instance of the worker type.
        @[JSON::Field(key: "memory")]
        getter memory : String

        # The disk requirements for every worker instance of the worker type.
        @[JSON::Field(key: "disk")]
        getter disk : String?

        # The disk type for every worker instance of the work type. Shuffle optimized disks have higher
        # performance characteristics and are better for shuffle heavy workloads. Default is STANDARD .
        @[JSON::Field(key: "diskType")]
        getter disk_type : String?

        def initialize(
          @cpu : String,
          @memory : String,
          @disk : String? = nil,
          @disk_type : String? = nil
        )
        end
      end

      # The specifications for a worker type.
      struct WorkerTypeSpecification
        include JSON::Serializable

        # The image configuration for a worker type.
        @[JSON::Field(key: "imageConfiguration")]
        getter image_configuration : Types::ImageConfiguration?

        def initialize(
          @image_configuration : Types::ImageConfiguration? = nil
        )
        end
      end

      # The specifications for a worker type.
      struct WorkerTypeSpecificationInput
        include JSON::Serializable

        # The image configuration for a worker type.
        @[JSON::Field(key: "imageConfiguration")]
        getter image_configuration : Types::ImageConfigurationInput?

        def initialize(
          @image_configuration : Types::ImageConfigurationInput? = nil
        )
        end
      end
    end
  end
end
