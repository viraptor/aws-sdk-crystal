require "json"
require "time"

module AwsSdk
  module M2
    module Types

      # The account or role doesn't have the right permissions to make the request.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Defines an alternate key. This value is optional. A legacy data set might not have any alternate key
      # defined but if those alternate keys definitions exist, provide them, as some applications will make
      # use of them.

      struct AlternateKey
        include JSON::Serializable

        # A strictly positive integer value representing the length of the alternate key.

        @[JSON::Field(key: "length")]
        getter length : Int32

        # A positive integer value representing the offset to mark the start of the alternate key part in the
        # record byte array.

        @[JSON::Field(key: "offset")]
        getter offset : Int32

        # Indicates whether the alternate key values are supposed to be unique for the given data set.

        @[JSON::Field(key: "allowDuplicates")]
        getter allow_duplicates : Bool?

        # The name of the alternate key.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @length : Int32,
          @offset : Int32,
          @allow_duplicates : Bool? = nil,
          @name : String? = nil
        )
        end
      end

      # A subset of the possible application attributes. Used in the application list.

      struct ApplicationSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The version of the application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The timestamp when the application was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The type of the target platform for this application.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The name of the application.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the application.

        @[JSON::Field(key: "status")]
        getter status : String

        # Indicates either an ongoing deployment or if the application has ever deployed successfully.

        @[JSON::Field(key: "deploymentStatus")]
        getter deployment_status : String?

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The unique identifier of the runtime environment that hosts this application.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The timestamp when you last started the application. Null until the application runs for the first
        # time.

        @[JSON::Field(key: "lastStartTime")]
        getter last_start_time : Time?

        # The Amazon Resource Name (ARN) of the role associated with the application.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Indicates the status of the latest version of the application.

        @[JSON::Field(key: "versionStatus")]
        getter version_status : String?

        def initialize(
          @application_arn : String,
          @application_id : String,
          @application_version : Int32,
          @creation_time : Time,
          @engine_type : String,
          @name : String,
          @status : String,
          @deployment_status : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @last_start_time : Time? = nil,
          @role_arn : String? = nil,
          @version_status : String? = nil
        )
        end
      end

      # Defines an application version summary.

      struct ApplicationVersionSummary
        include JSON::Serializable

        # The application version.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The timestamp when the application version was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The status of the application.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @application_version : Int32,
          @creation_time : Time,
          @status : String,
          @status_reason : String? = nil
        )
        end
      end

      # Defines the details of a batch job.

      struct BatchJobDefinition
        include JSON::Serializable

        # Specifies a file containing a batch job definition.

        @[JSON::Field(key: "fileBatchJobDefinition")]
        getter file_batch_job_definition : Types::FileBatchJobDefinition?

        # A script containing a batch job definition.

        @[JSON::Field(key: "scriptBatchJobDefinition")]
        getter script_batch_job_definition : Types::ScriptBatchJobDefinition?

        def initialize(
          @file_batch_job_definition : Types::FileBatchJobDefinition? = nil,
          @script_batch_job_definition : Types::ScriptBatchJobDefinition? = nil
        )
        end
      end

      # A subset of the possible batch job attributes. Used in the batch job list.

      struct BatchJobExecutionSummary
        include JSON::Serializable

        # The unique identifier of the application that hosts this batch job.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of this execution of the batch job.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The timestamp when a particular batch job execution started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The status of a particular batch job execution.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of this batch job.

        @[JSON::Field(key: "batchJobIdentifier")]
        getter batch_job_identifier : Types::BatchJobIdentifier?

        # The timestamp when this batch job execution ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The unique identifier of a particular batch job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of a particular batch job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The type of a particular batch job execution.

        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # The batch job return code from either the Blu Age or Micro Focus runtime engines. For more
        # information, see Batch return codes in the IBM WebSphere Application Server documentation.

        @[JSON::Field(key: "returnCode")]
        getter return_code : String?

        def initialize(
          @application_id : String,
          @execution_id : String,
          @start_time : Time,
          @status : String,
          @batch_job_identifier : Types::BatchJobIdentifier? = nil,
          @end_time : Time? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_type : String? = nil,
          @return_code : String? = nil
        )
        end
      end

      # Identifies a specific batch job.

      struct BatchJobIdentifier
        include JSON::Serializable

        # Specifies a file associated with a specific batch job.

        @[JSON::Field(key: "fileBatchJobIdentifier")]
        getter file_batch_job_identifier : Types::FileBatchJobIdentifier?

        # Specifies the required information for restart, including executionId and JobStepRestartMarker .

        @[JSON::Field(key: "restartBatchJobIdentifier")]
        getter restart_batch_job_identifier : Types::RestartBatchJobIdentifier?

        # Specifies an Amazon S3 location that identifies the batch jobs that you want to run. Use this
        # identifier to run ad hoc batch jobs.

        @[JSON::Field(key: "s3BatchJobIdentifier")]
        getter s3_batch_job_identifier : Types::S3BatchJobIdentifier?

        # A batch job identifier in which the batch job to run is identified by the script name.

        @[JSON::Field(key: "scriptBatchJobIdentifier")]
        getter script_batch_job_identifier : Types::ScriptBatchJobIdentifier?

        def initialize(
          @file_batch_job_identifier : Types::FileBatchJobIdentifier? = nil,
          @restart_batch_job_identifier : Types::RestartBatchJobIdentifier? = nil,
          @s3_batch_job_identifier : Types::S3BatchJobIdentifier? = nil,
          @script_batch_job_identifier : Types::ScriptBatchJobIdentifier? = nil
        )
        end
      end


      struct CancelBatchJobExecutionRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the batch job execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The Amazon Web Services Secrets Manager containing user's credentials for authentication and
        # authorization for Cancel Batch Job Execution operation.

        @[JSON::Field(key: "authSecretsManagerArn")]
        getter auth_secrets_manager_arn : String?

        def initialize(
          @application_id : String,
          @execution_id : String,
          @auth_secrets_manager_arn : String? = nil
        )
        end
      end


      struct CancelBatchJobExecutionResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The parameters provided in the request conflict with existing resources.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the conflicting resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the conflicting resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct CreateApplicationRequest
        include JSON::Serializable

        # The application definition for this application. You can specify either inline JSON or an S3 bucket
        # location.

        @[JSON::Field(key: "definition")]
        getter definition : Types::Definition

        # The type of the target platform for this application.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The unique identifier of the application.

        @[JSON::Field(key: "name")]
        getter name : String

        # A client token is a unique, case-sensitive string of up to 128 ASCII characters with ASCII values of
        # 33-126 inclusive. It's generated by the client to ensure idempotent operations, allowing for safe
        # retries without unintended side effects.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of a customer managed key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The Amazon Resource Name (ARN) that identifies a role that the application uses to access Amazon Web
        # Services resources that are not part of the application or are in a different Amazon Web Services
        # account.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # A list of tags to apply to the application.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @definition : Types::Definition,
          @engine_type : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @kms_key_id : String? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String

        # The unique application identifier.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The version number of the application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        def initialize(
          @application_arn : String,
          @application_id : String,
          @application_version : Int32
        )
        end
      end


      struct CreateDataSetExportTaskRequest
        include JSON::Serializable

        # The unique identifier of the application for which you want to export data sets.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The data set export task configuration.

        @[JSON::Field(key: "exportConfig")]
        getter export_config : Types::DataSetExportConfig

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request to create a
        # data set export. The service generates the clientToken when the API call is triggered. The token
        # expires after one hour, so if you retry the API within this timeframe with the same clientToken, you
        # will get the same response. The service also handles deleting the clientToken after it expires.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The identifier of a customer managed key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @application_id : String,
          @export_config : Types::DataSetExportConfig,
          @client_token : String? = nil,
          @kms_key_id : String? = nil
        )
        end
      end


      struct CreateDataSetExportTaskResponse
        include JSON::Serializable

        # The task identifier. This operation is asynchronous. Use this identifier with the
        # GetDataSetExportTask operation to obtain the status of this task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct CreateDataSetImportTaskRequest
        include JSON::Serializable

        # The unique identifier of the application for which you want to import data sets.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The data set import task configuration.

        @[JSON::Field(key: "importConfig")]
        getter import_config : Types::DataSetImportConfig

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request to create a
        # data set import. The service generates the clientToken when the API call is triggered. The token
        # expires after one hour, so if you retry the API within this timeframe with the same clientToken, you
        # will get the same response. The service also handles deleting the clientToken after it expires.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @application_id : String,
          @import_config : Types::DataSetImportConfig,
          @client_token : String? = nil
        )
        end
      end


      struct CreateDataSetImportTaskResponse
        include JSON::Serializable

        # The task identifier. This operation is asynchronous. Use this identifier with the
        # GetDataSetImportTask operation to obtain the status of this task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @task_id : String
        )
        end
      end


      struct CreateDeploymentRequest
        include JSON::Serializable

        # The application identifier.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The version of the application to deploy.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The identifier of the runtime environment where you want to deploy this application.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request to create a
        # deployment. The service generates the clientToken when the API call is triggered. The token expires
        # after one hour, so if you retry the API within this timeframe with the same clientToken, you will
        # get the same response. The service also handles deleting the clientToken after it expires.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @application_id : String,
          @application_version : Int32,
          @environment_id : String,
          @client_token : String? = nil
        )
        end
      end


      struct CreateDeploymentResponse
        include JSON::Serializable

        # The unique identifier of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @deployment_id : String
        )
        end
      end


      struct CreateEnvironmentRequest
        include JSON::Serializable

        # The engine type for the runtime environment.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The type of instance for the runtime environment.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The name of the runtime environment. Must be unique within the account.

        @[JSON::Field(key: "name")]
        getter name : String

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request to create an
        # environment. The service generates the clientToken when the API call is triggered. The token expires
        # after one hour, so if you retry the API within this timeframe with the same clientToken, you will
        # get the same response. The service also handles deleting the clientToken after it expires.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the runtime environment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version of the engine type for the runtime environment.

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The details of a high availability configuration for this runtime environment.

        @[JSON::Field(key: "highAvailabilityConfig")]
        getter high_availability_config : Types::HighAvailabilityConfig?

        # The identifier of a customer managed key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The network type required for the runtime environment.

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # Configures the maintenance window that you want for the runtime environment. The maintenance window
        # must have the format ddd:hh24:mi-ddd:hh24:mi and must be less than 24 hours. The following two
        # examples are valid maintenance windows: sun:23:45-mon:00:15 or sat:01:00-sat:03:00 . If you do not
        # provide a value, a random system-generated value will be assigned.

        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Specifies whether the runtime environment is publicly accessible.

        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The list of security groups for the VPC associated with this runtime environment.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # Optional. The storage configurations for this runtime environment.

        @[JSON::Field(key: "storageConfigurations")]
        getter storage_configurations : Array(Types::StorageConfiguration)?

        # The list of subnets associated with the VPC for this runtime environment.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The tags for the runtime environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @engine_type : String,
          @instance_type : String,
          @name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @engine_version : String? = nil,
          @high_availability_config : Types::HighAvailabilityConfig? = nil,
          @kms_key_id : String? = nil,
          @network_type : String? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @storage_configurations : Array(Types::StorageConfiguration)? = nil,
          @subnet_ids : Array(String)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateEnvironmentResponse
        include JSON::Serializable

        # The unique identifier of the runtime environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # Defines a data set.

      struct DataSet
        include JSON::Serializable

        # The logical identifier for a specific data set (in mainframe format).

        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The type of dataset. The only supported value is VSAM.

        @[JSON::Field(key: "datasetOrg")]
        getter dataset_org : Types::DatasetOrgAttributes

        # The length of a record.

        @[JSON::Field(key: "recordLength")]
        getter record_length : Types::RecordLength

        # The relative location of the data set in the database or file system.

        @[JSON::Field(key: "relativePath")]
        getter relative_path : String?

        # The storage type of the data set: database or file system. For Micro Focus, database corresponds to
        # datastore and file system corresponds to EFS/FSX. For Blu Age, there is no support of file system
        # and database corresponds to Blusam.

        @[JSON::Field(key: "storageType")]
        getter storage_type : String?

        def initialize(
          @dataset_name : String,
          @dataset_org : Types::DatasetOrgAttributes,
          @record_length : Types::RecordLength,
          @relative_path : String? = nil,
          @storage_type : String? = nil
        )
        end
      end

      # Identifies one or more data sets you want to import with the CreateDataSetExportTask operation.

      struct DataSetExportConfig
        include JSON::Serializable

        # The data sets.

        @[JSON::Field(key: "dataSets")]
        getter data_sets : Array(Types::DataSetExportItem)?

        # The Amazon S3 location of the data sets.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        def initialize(
          @data_sets : Array(Types::DataSetExportItem)? = nil,
          @s3_location : String? = nil
        )
        end
      end

      # Identifies a specific data set to export from an external location.

      struct DataSetExportItem
        include JSON::Serializable

        # The data set.

        @[JSON::Field(key: "datasetName")]
        getter dataset_name : String

        # The location of the data set.

        @[JSON::Field(key: "externalLocation")]
        getter external_location : Types::ExternalLocation

        def initialize(
          @dataset_name : String,
          @external_location : Types::ExternalLocation
        )
        end
      end

      # Represents a summary of data set exports.

      struct DataSetExportSummary
        include JSON::Serializable

        # The number of data set exports that have failed.

        @[JSON::Field(key: "failed")]
        getter failed : Int32

        # The number of data set exports that are in progress.

        @[JSON::Field(key: "inProgress")]
        getter in_progress : Int32

        # The number of data set exports that are pending.

        @[JSON::Field(key: "pending")]
        getter pending : Int32

        # The number of data set exports that have succeeded.

        @[JSON::Field(key: "succeeded")]
        getter succeeded : Int32

        # The total number of data set exports.

        @[JSON::Field(key: "total")]
        getter total : Int32

        def initialize(
          @failed : Int32,
          @in_progress : Int32,
          @pending : Int32,
          @succeeded : Int32,
          @total : Int32
        )
        end
      end

      # Contains information about a data set export task.

      struct DataSetExportTask
        include JSON::Serializable

        # The status of the data set export task.

        @[JSON::Field(key: "status")]
        getter status : String

        # A summary of the data set export task.

        @[JSON::Field(key: "summary")]
        getter summary : Types::DataSetExportSummary

        # The identifier of the data set export task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # If dataset exports failed, the failure reason will show here.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @summary : Types::DataSetExportSummary,
          @task_id : String,
          @status_reason : String? = nil
        )
        end
      end

      # Identifies one or more data sets you want to import with the CreateDataSetImportTask operation.

      struct DataSetImportConfig
        include JSON::Serializable

        # The data sets.

        @[JSON::Field(key: "dataSets")]
        getter data_sets : Array(Types::DataSetImportItem)?

        # The Amazon S3 location of the data sets.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        def initialize(
          @data_sets : Array(Types::DataSetImportItem)? = nil,
          @s3_location : String? = nil
        )
        end
      end

      # Identifies a specific data set to import from an external location.

      struct DataSetImportItem
        include JSON::Serializable

        # The data set.

        @[JSON::Field(key: "dataSet")]
        getter data_set : Types::DataSet

        # The location of the data set.

        @[JSON::Field(key: "externalLocation")]
        getter external_location : Types::ExternalLocation

        def initialize(
          @data_set : Types::DataSet,
          @external_location : Types::ExternalLocation
        )
        end
      end

      # Represents a summary of data set imports.

      struct DataSetImportSummary
        include JSON::Serializable

        # The number of data set imports that have failed.

        @[JSON::Field(key: "failed")]
        getter failed : Int32

        # The number of data set imports that are in progress.

        @[JSON::Field(key: "inProgress")]
        getter in_progress : Int32

        # The number of data set imports that are pending.

        @[JSON::Field(key: "pending")]
        getter pending : Int32

        # The number of data set imports that have succeeded.

        @[JSON::Field(key: "succeeded")]
        getter succeeded : Int32

        # The total number of data set imports.

        @[JSON::Field(key: "total")]
        getter total : Int32

        def initialize(
          @failed : Int32,
          @in_progress : Int32,
          @pending : Int32,
          @succeeded : Int32,
          @total : Int32
        )
        end
      end

      # Contains information about a data set import task.

      struct DataSetImportTask
        include JSON::Serializable

        # The status of the data set import task.

        @[JSON::Field(key: "status")]
        getter status : String

        # A summary of the data set import task.

        @[JSON::Field(key: "summary")]
        getter summary : Types::DataSetImportSummary

        # The identifier of the data set import task.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # If dataset import failed, the failure reason will show here.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @status : String,
          @summary : Types::DataSetImportSummary,
          @task_id : String,
          @status_reason : String? = nil
        )
        end
      end

      # A subset of the possible data set attributes.

      struct DataSetSummary
        include JSON::Serializable

        # The name of the data set.

        @[JSON::Field(key: "dataSetName")]
        getter data_set_name : String

        # The timestamp when the data set was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The type of data set. The only supported value is VSAM.

        @[JSON::Field(key: "dataSetOrg")]
        getter data_set_org : String?

        # The format of the data set.

        @[JSON::Field(key: "format")]
        getter format : String?

        # The last time the data set was referenced.

        @[JSON::Field(key: "lastReferencedTime")]
        getter last_referenced_time : Time?

        # The last time the data set was updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        def initialize(
          @data_set_name : String,
          @creation_time : Time? = nil,
          @data_set_org : String? = nil,
          @format : String? = nil,
          @last_referenced_time : Time? = nil,
          @last_updated_time : Time? = nil
        )
        end
      end

      # Additional details about the data set. Different attributes correspond to different data set
      # organizations. The values are populated based on datasetOrg, storageType and backend (Blu Age or
      # Micro Focus).

      struct DatasetDetailOrgAttributes
        include JSON::Serializable

        # The generation data group of the data set.

        @[JSON::Field(key: "gdg")]
        getter gdg : Types::GdgDetailAttributes?

        # The details of a PO type data set.

        @[JSON::Field(key: "po")]
        getter po : Types::PoDetailAttributes?

        # The details of a PS type data set.

        @[JSON::Field(key: "ps")]
        getter ps : Types::PsDetailAttributes?

        # The details of a VSAM data set.

        @[JSON::Field(key: "vsam")]
        getter vsam : Types::VsamDetailAttributes?

        def initialize(
          @gdg : Types::GdgDetailAttributes? = nil,
          @po : Types::PoDetailAttributes? = nil,
          @ps : Types::PsDetailAttributes? = nil,
          @vsam : Types::VsamDetailAttributes? = nil
        )
        end
      end

      # Additional details about the data set. Different attributes correspond to different data set
      # organizations. The values are populated based on datasetOrg, storageType and backend (Blu Age or
      # Micro Focus).

      struct DatasetOrgAttributes
        include JSON::Serializable

        # The generation data group of the data set.

        @[JSON::Field(key: "gdg")]
        getter gdg : Types::GdgAttributes?

        # The details of a PO type data set.

        @[JSON::Field(key: "po")]
        getter po : Types::PoAttributes?

        # The details of a PS type data set.

        @[JSON::Field(key: "ps")]
        getter ps : Types::PsAttributes?

        # The details of a VSAM data set.

        @[JSON::Field(key: "vsam")]
        getter vsam : Types::VsamAttributes?

        def initialize(
          @gdg : Types::GdgAttributes? = nil,
          @po : Types::PoAttributes? = nil,
          @ps : Types::PsAttributes? = nil,
          @vsam : Types::VsamAttributes? = nil
        )
        end
      end

      # The application definition for a particular application.

      struct Definition
        include JSON::Serializable

        # The content of the application definition. This is a JSON object that contains the resource
        # configuration/definitions that identify an application.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The S3 bucket that contains the application definition.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        def initialize(
          @content : String? = nil,
          @s3_location : String? = nil
        )
        end
      end


      struct DeleteApplicationFromEnvironmentRequest
        include JSON::Serializable

        # The unique identifier of the application you want to delete.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the runtime environment where the application was previously deployed.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @application_id : String,
          @environment_id : String
        )
        end
      end


      struct DeleteApplicationFromEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteApplicationRequest
        include JSON::Serializable

        # The unique identifier of the application you want to delete.

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


      struct DeleteEnvironmentRequest
        include JSON::Serializable

        # The unique identifier of the runtime environment you want to delete.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end


      struct DeleteEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Contains a summary of a deployed application.

      struct DeployedVersionSummary
        include JSON::Serializable

        # The version of the deployed application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The status of the deployment.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @application_version : Int32,
          @status : String,
          @status_reason : String? = nil
        )
        end
      end

      # A subset of information about a specific deployment.

      struct DeploymentSummary
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The version of the application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The timestamp when the deployment was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The unique identifier of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The unique identifier of the runtime environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The current status of the deployment.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @application_id : String,
          @application_version : Int32,
          @creation_time : Time,
          @deployment_id : String,
          @environment_id : String,
          @status : String,
          @status_reason : String? = nil
        )
        end
      end

      # Defines the storage configuration for an Amazon EFS file system.

      struct EfsStorageConfiguration
        include JSON::Serializable

        # The file system identifier.

        @[JSON::Field(key: "file-system-id")]
        getter file_system_id : String

        # The mount point for the file system.

        @[JSON::Field(key: "mount-point")]
        getter mount_point : String

        def initialize(
          @file_system_id : String,
          @mount_point : String
        )
        end
      end

      # A subset of information about the engine version for a specific application.

      struct EngineVersionsSummary
        include JSON::Serializable

        # The type of target platform for the application.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The version of the engine type used by the application.

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String

        def initialize(
          @engine_type : String,
          @engine_version : String
        )
        end
      end

      # Contains a subset of the possible runtime environment attributes. Used in the environment list.

      struct EnvironmentSummary
        include JSON::Serializable

        # The timestamp when the runtime environment was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The target platform for the runtime environment.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The version of the runtime engine.

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String

        # The Amazon Resource Name (ARN) of a particular runtime environment.

        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String

        # The unique identifier of a particular runtime environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The instance type of the runtime environment.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The name of the runtime environment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the runtime environment

        @[JSON::Field(key: "status")]
        getter status : String

        # The network type supported by the runtime environment.

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        def initialize(
          @creation_time : Time,
          @engine_type : String,
          @engine_version : String,
          @environment_arn : String,
          @environment_id : String,
          @instance_type : String,
          @name : String,
          @status : String,
          @network_type : String? = nil
        )
        end
      end

      # Failed to connect to server, or didn’t receive response within expected time period.

      struct ExecutionTimeoutException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Defines an external storage location.

      struct ExternalLocation
        include JSON::Serializable

        # The URI of the Amazon S3 bucket.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : String?

        def initialize(
          @s3_location : String? = nil
        )
        end
      end

      # A file containing a batch job definition.

      struct FileBatchJobDefinition
        include JSON::Serializable

        # The name of the file containing the batch job definition.

        @[JSON::Field(key: "fileName")]
        getter file_name : String

        # The path to the file containing the batch job definition.

        @[JSON::Field(key: "folderPath")]
        getter folder_path : String?

        def initialize(
          @file_name : String,
          @folder_path : String? = nil
        )
        end
      end

      # A batch job identifier in which the batch job to run is identified by the file name and the relative
      # path to the file name.

      struct FileBatchJobIdentifier
        include JSON::Serializable

        # The file name for the batch job identifier.

        @[JSON::Field(key: "fileName")]
        getter file_name : String

        # The relative path to the file name for the batch job identifier.

        @[JSON::Field(key: "folderPath")]
        getter folder_path : String?

        def initialize(
          @file_name : String,
          @folder_path : String? = nil
        )
        end
      end

      # Defines the storage configuration for an Amazon FSx file system.

      struct FsxStorageConfiguration
        include JSON::Serializable

        # The file system identifier.

        @[JSON::Field(key: "file-system-id")]
        getter file_system_id : String

        # The mount point for the file system.

        @[JSON::Field(key: "mount-point")]
        getter mount_point : String

        def initialize(
          @file_system_id : String,
          @mount_point : String
        )
        end
      end

      # The required attributes for a generation data group data set. A generation data set is one of a
      # collection of successive, historically related, catalogued data sets that together are known as a
      # generation data group (GDG). Use this structure when you want to import a GDG. For more information
      # on GDG, see Generation data sets .

      struct GdgAttributes
        include JSON::Serializable

        # The maximum number of generation data sets, up to 255, in a GDG.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The disposition of the data set in the catalog.

        @[JSON::Field(key: "rollDisposition")]
        getter roll_disposition : String?

        def initialize(
          @limit : Int32? = nil,
          @roll_disposition : String? = nil
        )
        end
      end

      # The required attributes for a generation data group data set. A generation data set is one of a
      # collection of successive, historically related, catalogued data sets that together are known as a
      # generation data group (GDG). Use this structure when you want to import a GDG. For more information
      # on GDG, see Generation data sets .

      struct GdgDetailAttributes
        include JSON::Serializable

        # The maximum number of generation data sets, up to 255, in a GDG.

        @[JSON::Field(key: "limit")]
        getter limit : Int32?

        # The disposition of the data set in the catalog.

        @[JSON::Field(key: "rollDisposition")]
        getter roll_disposition : String?

        def initialize(
          @limit : Int32? = nil,
          @roll_disposition : String? = nil
        )
        end
      end


      struct GetApplicationRequest
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        def initialize(
          @application_id : String
        )
        end
      end


      struct GetApplicationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "applicationArn")]
        getter application_arn : String

        # The identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The timestamp when this application was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The type of the target platform for the application.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The latest version of the application.

        @[JSON::Field(key: "latestVersion")]
        getter latest_version : Types::ApplicationVersionSummary

        # The unique identifier of the application.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the application.

        @[JSON::Field(key: "status")]
        getter status : String

        # The version of the application that is deployed.

        @[JSON::Field(key: "deployedVersion")]
        getter deployed_version : Types::DeployedVersionSummary?

        # The description of the application.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The identifier of the runtime environment where you want to deploy the application.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The identifier of a customer managed key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The timestamp when you last started the application. Null until the application runs for the first
        # time.

        @[JSON::Field(key: "lastStartTime")]
        getter last_start_time : Time?

        # The Amazon Resource Name (ARN) for the network load balancer listener created in your Amazon Web
        # Services account. Amazon Web Services Mainframe Modernization creates this listener for you the
        # first time you deploy an application.

        @[JSON::Field(key: "listenerArns")]
        getter listener_arns : Array(String)?

        # The port associated with the network load balancer listener created in your Amazon Web Services
        # account.

        @[JSON::Field(key: "listenerPorts")]
        getter listener_ports : Array(Int32)?

        # The public DNS name of the load balancer created in your Amazon Web Services account.

        @[JSON::Field(key: "loadBalancerDnsName")]
        getter load_balancer_dns_name : String?

        # The list of log summaries. Each log summary includes the log type as well as the log group
        # identifier. These are CloudWatch logs. Amazon Web Services Mainframe Modernization pushes the
        # application log to CloudWatch under the customer's account.

        @[JSON::Field(key: "logGroups")]
        getter log_groups : Array(Types::LogGroupSummary)?

        # The Amazon Resource Name (ARN) of the role associated with the application.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # A list of tags associated with the application.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Returns the Amazon Resource Names (ARNs) of the target groups that are attached to the network load
        # balancer.

        @[JSON::Field(key: "targetGroupArns")]
        getter target_group_arns : Array(String)?

        def initialize(
          @application_arn : String,
          @application_id : String,
          @creation_time : Time,
          @engine_type : String,
          @latest_version : Types::ApplicationVersionSummary,
          @name : String,
          @status : String,
          @deployed_version : Types::DeployedVersionSummary? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @kms_key_id : String? = nil,
          @last_start_time : Time? = nil,
          @listener_arns : Array(String)? = nil,
          @listener_ports : Array(Int32)? = nil,
          @load_balancer_dns_name : String? = nil,
          @log_groups : Array(Types::LogGroupSummary)? = nil,
          @role_arn : String? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil,
          @target_group_arns : Array(String)? = nil
        )
        end
      end


      struct GetApplicationVersionRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The specific version of the application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        def initialize(
          @application_id : String,
          @application_version : Int32
        )
        end
      end


      struct GetApplicationVersionResponse
        include JSON::Serializable

        # The specific version of the application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The timestamp when the application version was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The content of the application definition. This is a JSON object that contains the resource
        # configuration and definitions that identify an application.

        @[JSON::Field(key: "definitionContent")]
        getter definition_content : String

        # The name of the application version.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the application version.

        @[JSON::Field(key: "status")]
        getter status : String

        # The application description.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @application_version : Int32,
          @creation_time : Time,
          @definition_content : String,
          @name : String,
          @status : String,
          @description : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetBatchJobExecutionRequest
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the batch job execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        def initialize(
          @application_id : String,
          @execution_id : String
        )
        end
      end


      struct GetBatchJobExecutionResponse
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier for this batch job execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The timestamp when the batch job execution started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The status of the batch job execution.

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifier of this batch job.

        @[JSON::Field(key: "batchJobIdentifier")]
        getter batch_job_identifier : Types::BatchJobIdentifier?

        # The timestamp when the batch job execution ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The unique identifier for this batch job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The name of this batch job.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The step/procedure step information for the restart batch job operation.

        @[JSON::Field(key: "jobStepRestartMarker")]
        getter job_step_restart_marker : Types::JobStepRestartMarker?

        # The type of job.

        @[JSON::Field(key: "jobType")]
        getter job_type : String?

        # The user for the job.

        @[JSON::Field(key: "jobUser")]
        getter job_user : String?

        # The batch job return code from either the Blu Age or Micro Focus runtime engines. For more
        # information, see Batch return codes in the IBM WebSphere Application Server documentation.

        @[JSON::Field(key: "returnCode")]
        getter return_code : String?

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @application_id : String,
          @execution_id : String,
          @start_time : Time,
          @status : String,
          @batch_job_identifier : Types::BatchJobIdentifier? = nil,
          @end_time : Time? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @job_step_restart_marker : Types::JobStepRestartMarker? = nil,
          @job_type : String? = nil,
          @job_user : String? = nil,
          @return_code : String? = nil,
          @status_reason : String? = nil
        )
        end
      end


      struct GetDataSetDetailsRequest
        include JSON::Serializable

        # The unique identifier of the application that this data set is associated with.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The name of the data set.

        @[JSON::Field(key: "dataSetName")]
        getter data_set_name : String

        def initialize(
          @application_id : String,
          @data_set_name : String
        )
        end
      end


      struct GetDataSetDetailsResponse
        include JSON::Serializable

        # The name of the data set.

        @[JSON::Field(key: "dataSetName")]
        getter data_set_name : String

        # The size of the block on disk.

        @[JSON::Field(key: "blocksize")]
        getter blocksize : Int32?

        # The timestamp when the data set was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The type of data set. The only supported value is VSAM.

        @[JSON::Field(key: "dataSetOrg")]
        getter data_set_org : Types::DatasetDetailOrgAttributes?

        # File size of the dataset.

        @[JSON::Field(key: "fileSize")]
        getter file_size : Int64?

        # The last time the data set was referenced.

        @[JSON::Field(key: "lastReferencedTime")]
        getter last_referenced_time : Time?

        # The last time the data set was updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time?

        # The location where the data set is stored.

        @[JSON::Field(key: "location")]
        getter location : String?

        # The length of records in the data set.

        @[JSON::Field(key: "recordLength")]
        getter record_length : Int32?

        def initialize(
          @data_set_name : String,
          @blocksize : Int32? = nil,
          @creation_time : Time? = nil,
          @data_set_org : Types::DatasetDetailOrgAttributes? = nil,
          @file_size : Int64? = nil,
          @last_referenced_time : Time? = nil,
          @last_updated_time : Time? = nil,
          @location : String? = nil,
          @record_length : Int32? = nil
        )
        end
      end


      struct GetDataSetExportTaskRequest
        include JSON::Serializable

        # The application identifier.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The task identifier returned by the CreateDataSetExportTask operation.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @application_id : String,
          @task_id : String
        )
        end
      end


      struct GetDataSetExportTaskResponse
        include JSON::Serializable

        # The status of the task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The task identifier.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The identifier of a customer managed key used for exported data set encryption.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # If dataset export failed, the failure reason will show here.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # A summary of the status of the task.

        @[JSON::Field(key: "summary")]
        getter summary : Types::DataSetExportSummary?

        def initialize(
          @status : String,
          @task_id : String,
          @kms_key_arn : String? = nil,
          @status_reason : String? = nil,
          @summary : Types::DataSetExportSummary? = nil
        )
        end
      end


      struct GetDataSetImportTaskRequest
        include JSON::Serializable

        # The application identifier.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The task identifier returned by the CreateDataSetImportTask operation.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @application_id : String,
          @task_id : String
        )
        end
      end


      struct GetDataSetImportTaskResponse
        include JSON::Serializable

        # The status of the task.

        @[JSON::Field(key: "status")]
        getter status : String

        # The task identifier.

        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # A summary of the status of the task.

        @[JSON::Field(key: "summary")]
        getter summary : Types::DataSetImportSummary?

        def initialize(
          @status : String,
          @task_id : String,
          @summary : Types::DataSetImportSummary? = nil
        )
        end
      end


      struct GetDeploymentRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier for the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        def initialize(
          @application_id : String,
          @deployment_id : String
        )
        end
      end


      struct GetDeploymentResponse
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The application version.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        # The timestamp when the deployment was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The unique identifier of the deployment.

        @[JSON::Field(key: "deploymentId")]
        getter deployment_id : String

        # The unique identifier of the runtime environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The status of the deployment.

        @[JSON::Field(key: "status")]
        getter status : String

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        def initialize(
          @application_id : String,
          @application_version : Int32,
          @creation_time : Time,
          @deployment_id : String,
          @environment_id : String,
          @status : String,
          @status_reason : String? = nil
        )
        end
      end


      struct GetEnvironmentRequest
        include JSON::Serializable

        # The unique identifier of the runtime environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end


      struct GetEnvironmentResponse
        include JSON::Serializable

        # The timestamp when the runtime environment was created.

        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time

        # The target platform for the runtime environment.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String

        # The version of the runtime engine.

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String

        # The Amazon Resource Name (ARN) of the runtime environment.

        @[JSON::Field(key: "environmentArn")]
        getter environment_arn : String

        # The unique identifier of the runtime environment.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The type of instance underlying the runtime environment.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The name of the runtime environment. Must be unique within the account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The unique identifiers of the security groups assigned to this runtime environment.

        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The status of the runtime environment. If the Amazon Web Services Mainframe Modernization
        # environment is missing a connection to the customer owned dependent resource, the status will be
        # Unhealthy .

        @[JSON::Field(key: "status")]
        getter status : String

        # The unique identifiers of the subnets assigned to this runtime environment.

        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The unique identifier for the VPC used with this runtime environment.

        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The number of instances included in the runtime environment. A standalone runtime environment has a
        # maximum of one instance. Currently, a high availability runtime environment has a maximum of two
        # instances.

        @[JSON::Field(key: "actualCapacity")]
        getter actual_capacity : Int32?

        # The description of the runtime environment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The desired capacity of the high availability configuration for the runtime environment.

        @[JSON::Field(key: "highAvailabilityConfig")]
        getter high_availability_config : Types::HighAvailabilityConfig?

        # The identifier of a customer managed key.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        # The Amazon Resource Name (ARN) for the load balancer used with the runtime environment.

        @[JSON::Field(key: "loadBalancerArn")]
        getter load_balancer_arn : String?

        # The network type supported by the runtime environment.

        @[JSON::Field(key: "networkType")]
        getter network_type : String?

        # Indicates the pending maintenance scheduled on this environment.

        @[JSON::Field(key: "pendingMaintenance")]
        getter pending_maintenance : Types::PendingMaintenance?

        # The maintenance window for the runtime environment. If you don't provide a value for the maintenance
        # window, the service assigns a random value.

        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        # Whether applications running in this runtime environment are publicly accessible.

        @[JSON::Field(key: "publiclyAccessible")]
        getter publicly_accessible : Bool?

        # The reason for the reported status.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The storage configurations defined for the runtime environment.

        @[JSON::Field(key: "storageConfigurations")]
        getter storage_configurations : Array(Types::StorageConfiguration)?

        # The tags defined for this runtime environment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @creation_time : Time,
          @engine_type : String,
          @engine_version : String,
          @environment_arn : String,
          @environment_id : String,
          @instance_type : String,
          @name : String,
          @security_group_ids : Array(String),
          @status : String,
          @subnet_ids : Array(String),
          @vpc_id : String,
          @actual_capacity : Int32? = nil,
          @description : String? = nil,
          @high_availability_config : Types::HighAvailabilityConfig? = nil,
          @kms_key_id : String? = nil,
          @load_balancer_arn : String? = nil,
          @network_type : String? = nil,
          @pending_maintenance : Types::PendingMaintenance? = nil,
          @preferred_maintenance_window : String? = nil,
          @publicly_accessible : Bool? = nil,
          @status_reason : String? = nil,
          @storage_configurations : Array(Types::StorageConfiguration)? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetSignedBluinsightsUrlResponse
        include JSON::Serializable

        # Single sign-on AWS Blu Insights URL.

        @[JSON::Field(key: "signedBiUrl")]
        getter signed_bi_url : String

        def initialize(
          @signed_bi_url : String
        )
        end
      end

      # Defines the details of a high availability configuration.

      struct HighAvailabilityConfig
        include JSON::Serializable

        # The number of instances in a high availability configuration. The minimum possible value is 1 and
        # the maximum is 100.

        @[JSON::Field(key: "desiredCapacity")]
        getter desired_capacity : Int32

        def initialize(
          @desired_capacity : Int32
        )
        end
      end

      # An unexpected error occurred during the processing of the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # Identifies a specific batch job.

      struct JobIdentifier
        include JSON::Serializable

        # The name of the file that contains the batch job definition.

        @[JSON::Field(key: "fileName")]
        getter file_name : String?

        # The name of the script that contains the batch job definition.

        @[JSON::Field(key: "scriptName")]
        getter script_name : String?

        def initialize(
          @file_name : String? = nil,
          @script_name : String? = nil
        )
        end
      end

      # Provides information related to a job step.

      struct JobStep
        include JSON::Serializable

        # The name of a procedure step.

        @[JSON::Field(key: "procStepName")]
        getter proc_step_name : String?

        # The number of a procedure step.

        @[JSON::Field(key: "procStepNumber")]
        getter proc_step_number : Int32?

        # A registered step-level checkpoint identifier that can be used for restarting an Amazon Web Services
        # Blu Age application batch job.

        @[JSON::Field(key: "stepCheckpoint")]
        getter step_checkpoint : Int32?

        # The step-level checkpoint status for an Amazon Web Services Blu Age application batch job.

        @[JSON::Field(key: "stepCheckpointStatus")]
        getter step_checkpoint_status : String?

        # The step-level checkpoint status for an Amazon Web Services Blu Age application batch job.

        @[JSON::Field(key: "stepCheckpointTime")]
        getter step_checkpoint_time : Time?

        # The condition code of a step.

        @[JSON::Field(key: "stepCondCode")]
        getter step_cond_code : String?

        # The name of a step.

        @[JSON::Field(key: "stepName")]
        getter step_name : String?

        # The number of a step.

        @[JSON::Field(key: "stepNumber")]
        getter step_number : Int32?

        # Specifies if a step can be restarted or not.

        @[JSON::Field(key: "stepRestartable")]
        getter step_restartable : Bool?

        def initialize(
          @proc_step_name : String? = nil,
          @proc_step_number : Int32? = nil,
          @step_checkpoint : Int32? = nil,
          @step_checkpoint_status : String? = nil,
          @step_checkpoint_time : Time? = nil,
          @step_cond_code : String? = nil,
          @step_name : String? = nil,
          @step_number : Int32? = nil,
          @step_restartable : Bool? = nil
        )
        end
      end

      # Provides step/procedure step information for a restart batch job operation.

      struct JobStepRestartMarker
        include JSON::Serializable

        # The step name that a batch job was restarted from.

        @[JSON::Field(key: "fromStep")]
        getter from_step : String

        # The procedure step name that a batch job was restarted from.

        @[JSON::Field(key: "fromProcStep")]
        getter from_proc_step : String?

        # The step-level checkpoint timestamp (creation or last modification) for an Amazon Web Services Blu
        # Age application batch job.

        @[JSON::Field(key: "skip")]
        getter skip : Bool?

        # Skip selected step and issue a restart from immediate successor step for an Amazon Web Services Blu
        # Age application batch job.

        @[JSON::Field(key: "stepCheckpoint")]
        getter step_checkpoint : Int32?

        # The procedure step name that a batch job was restarted to.

        @[JSON::Field(key: "toProcStep")]
        getter to_proc_step : String?

        # The step name that a batch job was restarted to.

        @[JSON::Field(key: "toStep")]
        getter to_step : String?

        def initialize(
          @from_step : String,
          @from_proc_step : String? = nil,
          @skip : Bool? = nil,
          @step_checkpoint : Int32? = nil,
          @to_proc_step : String? = nil,
          @to_step : String? = nil
        )
        end
      end


      struct ListApplicationVersionsRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of application versions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationVersionsResponse
        include JSON::Serializable

        # The list of application versions.

        @[JSON::Field(key: "applicationVersions")]
        getter application_versions : Array(Types::ApplicationVersionSummary)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_versions : Array(Types::ApplicationVersionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsRequest
        include JSON::Serializable

        # The unique identifier of the runtime environment where the applications are deployed.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        # The maximum number of applications to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The names of the applications.

        @[JSON::Field(key: "names")]
        getter names : Array(String)?

        # A pagination token to control the number of applications displayed in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String? = nil,
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListApplicationsResponse
        include JSON::Serializable

        # Returns a list of summary details for all the applications in a runtime environment.

        @[JSON::Field(key: "applications")]
        getter applications : Array(Types::ApplicationSummary)

        # A pagination token that's returned when the response doesn't contain all applications.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @applications : Array(Types::ApplicationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListBatchJobDefinitionsRequest
        include JSON::Serializable

        # The identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of batch job definitions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # If the batch job definition is a FileBatchJobDefinition, the prefix allows you to search on the file
        # names of FileBatchJobDefinitions.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListBatchJobDefinitionsResponse
        include JSON::Serializable

        # The list of batch job definitions.

        @[JSON::Field(key: "batchJobDefinitions")]
        getter batch_job_definitions : Array(Types::BatchJobDefinition)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @batch_job_definitions : Array(Types::BatchJobDefinition),
          @next_token : String? = nil
        )
        end
      end


      struct ListBatchJobExecutionsRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of each batch job execution.

        @[JSON::Field(key: "executionIds")]
        getter execution_ids : Array(String)?

        # The name of each batch job execution.

        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The maximum number of batch job executions to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token to control the number of batch job executions displayed in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The time after which the batch job executions started.

        @[JSON::Field(key: "startedAfter")]
        getter started_after : Time?

        # The time before the batch job executions started.

        @[JSON::Field(key: "startedBefore")]
        getter started_before : Time?

        # The status of the batch job executions.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @application_id : String,
          @execution_ids : Array(String)? = nil,
          @job_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @started_after : Time? = nil,
          @started_before : Time? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListBatchJobExecutionsResponse
        include JSON::Serializable

        # Returns a list of batch job executions for an application.

        @[JSON::Field(key: "batchJobExecutions")]
        getter batch_job_executions : Array(Types::BatchJobExecutionSummary)

        # A pagination token that's returned when the response doesn't contain all batch job executions.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @batch_job_executions : Array(Types::BatchJobExecutionSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListBatchJobRestartPointsRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the batch job execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The Amazon Web Services Secrets Manager containing user's credentials for authentication and
        # authorization for List Batch Job Restart Points operation.

        @[JSON::Field(key: "authSecretsManagerArn")]
        getter auth_secrets_manager_arn : String?

        def initialize(
          @application_id : String,
          @execution_id : String,
          @auth_secrets_manager_arn : String? = nil
        )
        end
      end


      struct ListBatchJobRestartPointsResponse
        include JSON::Serializable

        # Returns all the batch job steps and related information for a batch job that previously ran.

        @[JSON::Field(key: "batchJobSteps")]
        getter batch_job_steps : Array(Types::JobStep)?

        def initialize(
          @batch_job_steps : Array(Types::JobStep)? = nil
        )
        end
      end


      struct ListDataSetExportHistoryRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of objects to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSetExportHistoryResponse
        include JSON::Serializable

        # The data set export tasks.

        @[JSON::Field(key: "dataSetExportTasks")]
        getter data_set_export_tasks : Array(Types::DataSetExportTask)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_set_export_tasks : Array(Types::DataSetExportTask),
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSetImportHistoryRequest
        include JSON::Serializable

        # The unique identifier of the application.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of objects to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSetImportHistoryResponse
        include JSON::Serializable

        # The data set import tasks.

        @[JSON::Field(key: "dataSetImportTasks")]
        getter data_set_import_tasks : Array(Types::DataSetImportTask)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_set_import_tasks : Array(Types::DataSetImportTask),
          @next_token : String? = nil
        )
        end
      end


      struct ListDataSetsRequest
        include JSON::Serializable

        # The unique identifier of the application for which you want to list the associated data sets.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of objects to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Filter dataset name matching the specified pattern. Can use * and % as wild cards.

        @[JSON::Field(key: "nameFilter")]
        getter name_filter : String?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The prefix of the data set name, which you can use to filter the list of data sets.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @name_filter : String? = nil,
          @next_token : String? = nil,
          @prefix : String? = nil
        )
        end
      end


      struct ListDataSetsResponse
        include JSON::Serializable

        # The list of data sets, containing information including the creation time, the data set name, the
        # data set organization, the data set format, and the last time the data set was referenced or
        # updated.

        @[JSON::Field(key: "dataSets")]
        getter data_sets : Array(Types::DataSetSummary)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @data_sets : Array(Types::DataSetSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsRequest
        include JSON::Serializable

        # The application identifier.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The maximum number of objects to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @application_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListDeploymentsResponse
        include JSON::Serializable

        # The list of deployments that is returned.

        @[JSON::Field(key: "deployments")]
        getter deployments : Array(Types::DeploymentSummary)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @deployments : Array(Types::DeploymentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEngineVersionsRequest
        include JSON::Serializable

        # The type of target platform.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        # The maximum number of objects to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # A pagination token returned from a previous call to this operation. This specifies the next item to
        # return. To return to the beginning of the list, exclude this parameter.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @engine_type : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEngineVersionsResponse
        include JSON::Serializable

        # Returns the engine versions.

        @[JSON::Field(key: "engineVersions")]
        getter engine_versions : Array(Types::EngineVersionsSummary)

        # If there are more items to return, this contains a token that is passed to a subsequent call to this
        # operation to retrieve the next set of items.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @engine_versions : Array(Types::EngineVersionsSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsRequest
        include JSON::Serializable

        # The engine type for the runtime environment.

        @[JSON::Field(key: "engineType")]
        getter engine_type : String?

        # The maximum number of runtime environments to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The names of the runtime environments. Must be unique within the account.

        @[JSON::Field(key: "names")]
        getter names : Array(String)?

        # A pagination token to control the number of runtime environments displayed in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @engine_type : String? = nil,
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListEnvironmentsResponse
        include JSON::Serializable

        # Returns a list of summary details for all the runtime environments in your account.

        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::EnvironmentSummary)

        # A pagination token that's returned when the response doesn't contain all the runtime environments.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::EnvironmentSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

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
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end

      # A subset of the attributes that describe a log group. In CloudWatch a log group is a group of log
      # streams that share the same retention, monitoring, and access control settings.

      struct LogGroupSummary
        include JSON::Serializable

        # The name of the log group.

        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        # The type of log.

        @[JSON::Field(key: "logType")]
        getter log_type : String

        def initialize(
          @log_group_name : String,
          @log_type : String
        )
        end
      end

      # The information about the maintenance schedule.

      struct MaintenanceSchedule
        include JSON::Serializable

        # The time the scheduled maintenance is to end.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The time the scheduled maintenance is to start.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @end_time : Time? = nil,
          @start_time : Time? = nil
        )
        end
      end

      # The scheduled maintenance for a runtime engine.

      struct PendingMaintenance
        include JSON::Serializable

        # The specific runtime engine that the maintenance schedule applies to.

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # The maintenance schedule for the runtime engine version.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::MaintenanceSchedule?

        def initialize(
          @engine_version : String? = nil,
          @schedule : Types::MaintenanceSchedule? = nil
        )
        end
      end

      # The supported properties for a PO type data set.

      struct PoAttributes
        include JSON::Serializable

        # The format of the data set records.

        @[JSON::Field(key: "format")]
        getter format : String

        # An array containing one or more filename extensions, allowing you to specify which files to be
        # included as PDS member.

        @[JSON::Field(key: "memberFileExtensions")]
        getter member_file_extensions : Array(String)

        # The character set encoding of the data set.

        @[JSON::Field(key: "encoding")]
        getter encoding : String?

        def initialize(
          @format : String,
          @member_file_extensions : Array(String),
          @encoding : String? = nil
        )
        end
      end

      # The supported properties for a PO type data set.

      struct PoDetailAttributes
        include JSON::Serializable

        # The character set encoding of the data set.

        @[JSON::Field(key: "encoding")]
        getter encoding : String

        # The format of the data set records.

        @[JSON::Field(key: "format")]
        getter format : String

        def initialize(
          @encoding : String,
          @format : String
        )
        end
      end

      # The primary key for a KSDS data set.

      struct PrimaryKey
        include JSON::Serializable

        # A strictly positive integer value representing the length of the primary key.

        @[JSON::Field(key: "length")]
        getter length : Int32

        # A positive integer value representing the offset to mark the start of the primary key in the record
        # byte array.

        @[JSON::Field(key: "offset")]
        getter offset : Int32

        # A name for the Primary Key.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @length : Int32,
          @offset : Int32,
          @name : String? = nil
        )
        end
      end

      # The supported properties for a PS type data set.

      struct PsAttributes
        include JSON::Serializable

        # The format of the data set records.

        @[JSON::Field(key: "format")]
        getter format : String

        # The character set encoding of the data set.

        @[JSON::Field(key: "encoding")]
        getter encoding : String?

        def initialize(
          @format : String,
          @encoding : String? = nil
        )
        end
      end

      # The supported properties for a PS type data set.

      struct PsDetailAttributes
        include JSON::Serializable

        # The character set encoding of the data set.

        @[JSON::Field(key: "encoding")]
        getter encoding : String

        # The format of the data set records.

        @[JSON::Field(key: "format")]
        getter format : String

        def initialize(
          @encoding : String,
          @format : String
        )
        end
      end

      # The length of the records in the data set.

      struct RecordLength
        include JSON::Serializable

        # The maximum record length. In case of fixed, both minimum and maximum are the same.

        @[JSON::Field(key: "max")]
        getter max : Int32

        # The minimum record length of a record.

        @[JSON::Field(key: "min")]
        getter min : Int32

        def initialize(
          @max : Int32,
          @min : Int32
        )
        end
      end

      # The specified resource was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The ID of the missing resource.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the missing resource.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # An identifier for the StartBatchJob API to show that it is a restart operation.

      struct RestartBatchJobIdentifier
        include JSON::Serializable

        # The executionId from the StartBatchJob response when the job ran for the first time.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        # The step/procedure step information for a restart batch job operation.

        @[JSON::Field(key: "jobStepRestartMarker")]
        getter job_step_restart_marker : Types::JobStepRestartMarker

        def initialize(
          @execution_id : String,
          @job_step_restart_marker : Types::JobStepRestartMarker
        )
        end
      end

      # A batch job identifier in which the batch jobs to run are identified by an Amazon S3 location.

      struct S3BatchJobIdentifier
        include JSON::Serializable

        # The Amazon S3 bucket that contains the batch job definitions.

        @[JSON::Field(key: "bucket")]
        getter bucket : String

        # Identifies the batch job definition. This identifier can also point to any batch job definition that
        # already exists in the application or to one of the batch job definitions within the directory that
        # is specified in keyPrefix .

        @[JSON::Field(key: "identifier")]
        getter identifier : Types::JobIdentifier

        # The key prefix that specifies the path to the folder in the S3 bucket that has the batch job
        # definitions.

        @[JSON::Field(key: "keyPrefix")]
        getter key_prefix : String?

        def initialize(
          @bucket : String,
          @identifier : Types::JobIdentifier,
          @key_prefix : String? = nil
        )
        end
      end

      # A batch job definition contained in a script.

      struct ScriptBatchJobDefinition
        include JSON::Serializable

        # The name of the script containing the batch job definition.

        @[JSON::Field(key: "scriptName")]
        getter script_name : String

        def initialize(
          @script_name : String
        )
        end
      end

      # A batch job identifier in which the batch job to run is identified by the script name.

      struct ScriptBatchJobIdentifier
        include JSON::Serializable

        # The name of the script containing the batch job definition.

        @[JSON::Field(key: "scriptName")]
        getter script_name : String

        def initialize(
          @script_name : String
        )
        end
      end

      # One or more quotas for Amazon Web Services Mainframe Modernization exceeds the limit.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the exceeded quota.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The ID of the resource that is exceeding the quota limit.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of resource that is exceeding the quota limit for Amazon Web Services Mainframe
        # Modernization.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # A code that identifies the service that the exceeded quota belongs to.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # Server cannot process the request at the moment.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct StartApplicationRequest
        include JSON::Serializable

        # The unique identifier of the application you want to start.

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


      struct StartBatchJobRequest
        include JSON::Serializable

        # The unique identifier of the application associated with this batch job.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The unique identifier of the batch job.

        @[JSON::Field(key: "batchJobIdentifier")]
        getter batch_job_identifier : Types::BatchJobIdentifier

        # The Amazon Web Services Secrets Manager containing user's credentials for authentication and
        # authorization for Start Batch Job execution operation.

        @[JSON::Field(key: "authSecretsManagerArn")]
        getter auth_secrets_manager_arn : String?

        # The collection of batch job parameters. For details about limits for keys and values, see Coding
        # variables in JCL .

        @[JSON::Field(key: "jobParams")]
        getter job_params : Hash(String, String)?

        def initialize(
          @application_id : String,
          @batch_job_identifier : Types::BatchJobIdentifier,
          @auth_secrets_manager_arn : String? = nil,
          @job_params : Hash(String, String)? = nil
        )
        end
      end


      struct StartBatchJobResponse
        include JSON::Serializable

        # The unique identifier of this execution of the batch job.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String

        def initialize(
          @execution_id : String
        )
        end
      end


      struct StopApplicationRequest
        include JSON::Serializable

        # The unique identifier of the application you want to stop.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # Stopping an application process can take a long time. Setting this parameter to true lets you force
        # stop the application so you don't need to wait until the process finishes to apply another action on
        # the application. The default value is false.

        @[JSON::Field(key: "forceStop")]
        getter force_stop : Bool?

        def initialize(
          @application_id : String,
          @force_stop : Bool? = nil
        )
        end
      end


      struct StopApplicationResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Defines the storage configuration for a runtime environment.

      struct StorageConfiguration
        include JSON::Serializable

        # Defines the storage configuration for an Amazon EFS file system.

        @[JSON::Field(key: "efs")]
        getter efs : Types::EfsStorageConfiguration?

        # Defines the storage configuration for an Amazon FSx file system.

        @[JSON::Field(key: "fsx")]
        getter fsx : Types::FsxStorageConfiguration?

        def initialize(
          @efs : Types::EfsStorageConfiguration? = nil,
          @fsx : Types::FsxStorageConfiguration? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags to add to the resource.

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

      # The number of requests made exceeds the limit.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the throttled request.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds to wait before retrying the request.

        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # The identifier of the service that the throttled request was made to.

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

        # The Amazon Resource Name (ARN) of the resource.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The keys of the tags to remove.

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

        # The unique identifier of the application you want to update.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The current version of the application to update.

        @[JSON::Field(key: "currentApplicationVersion")]
        getter current_application_version : Int32

        # The application definition for this application. You can specify either inline JSON or an S3 bucket
        # location.

        @[JSON::Field(key: "definition")]
        getter definition : Types::Definition?

        # The description of the application to update.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @application_id : String,
          @current_application_version : Int32,
          @definition : Types::Definition? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateApplicationResponse
        include JSON::Serializable

        # The new version of the application.

        @[JSON::Field(key: "applicationVersion")]
        getter application_version : Int32

        def initialize(
          @application_version : Int32
        )
        end
      end


      struct UpdateEnvironmentRequest
        include JSON::Serializable

        # The unique identifier of the runtime environment that you want to update.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # Indicates whether to update the runtime environment during the maintenance window. The default is
        # false. Currently, Amazon Web Services Mainframe Modernization accepts the engineVersion parameter
        # only if applyDuringMaintenanceWindow is true. If any parameter other than engineVersion is provided
        # in UpdateEnvironmentRequest , it will fail if applyDuringMaintenanceWindow is set to true.

        @[JSON::Field(key: "applyDuringMaintenanceWindow")]
        getter apply_during_maintenance_window : Bool?

        # The desired capacity for the runtime environment to update. The minimum possible value is 0 and the
        # maximum is 100.

        @[JSON::Field(key: "desiredCapacity")]
        getter desired_capacity : Int32?

        # The version of the runtime engine for the runtime environment.

        @[JSON::Field(key: "engineVersion")]
        getter engine_version : String?

        # Forces the updates on the environment. This option is needed if the applications in the environment
        # are not stopped or if there are ongoing application-related activities in the environment. If you
        # use this option, be aware that it could lead to data corruption in the applications, and that you
        # might need to perform repair and recovery procedures for the applications. This option is not needed
        # if the attribute being updated is preferredMaintenanceWindow .

        @[JSON::Field(key: "forceUpdate")]
        getter force_update : Bool?

        # The instance type for the runtime environment to update.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # Configures the maintenance window that you want for the runtime environment. The maintenance window
        # must have the format ddd:hh24:mi-ddd:hh24:mi and must be less than 24 hours. The following two
        # examples are valid maintenance windows: sun:23:45-mon:00:15 or sat:01:00-sat:03:00 . If you do not
        # provide a value, a random system-generated value will be assigned.

        @[JSON::Field(key: "preferredMaintenanceWindow")]
        getter preferred_maintenance_window : String?

        def initialize(
          @environment_id : String,
          @apply_during_maintenance_window : Bool? = nil,
          @desired_capacity : Int32? = nil,
          @engine_version : String? = nil,
          @force_update : Bool? = nil,
          @instance_type : String? = nil,
          @preferred_maintenance_window : String? = nil
        )
        end
      end


      struct UpdateEnvironmentResponse
        include JSON::Serializable

        # The unique identifier of the runtime environment that was updated.

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # One or more parameters provided in the request is not valid.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The list of fields that failed service validation.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        # The reason why it failed service validation.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @reason : String? = nil
        )
        end
      end

      # Contains information about a validation exception field.

      struct ValidationExceptionField
        include JSON::Serializable

        # The message of the exception field.

        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the exception field.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The attributes of a VSAM type data set.

      struct VsamAttributes
        include JSON::Serializable

        # The record format of the data set.

        @[JSON::Field(key: "format")]
        getter format : String

        # The alternate key definitions, if any. A legacy dataset might not have any alternate key defined,
        # but if those alternate keys definitions exist, provide them as some applications will make use of
        # them.

        @[JSON::Field(key: "alternateKeys")]
        getter alternate_keys : Array(Types::AlternateKey)?

        # Indicates whether indexes for this dataset are stored as compressed values. If you have a large data
        # set (typically &gt; 100 Mb), consider setting this flag to True.

        @[JSON::Field(key: "compressed")]
        getter compressed : Bool?

        # The character set used by the data set. Can be ASCII, EBCDIC, or unknown.

        @[JSON::Field(key: "encoding")]
        getter encoding : String?

        # The primary key of the data set.

        @[JSON::Field(key: "primaryKey")]
        getter primary_key : Types::PrimaryKey?

        def initialize(
          @format : String,
          @alternate_keys : Array(Types::AlternateKey)? = nil,
          @compressed : Bool? = nil,
          @encoding : String? = nil,
          @primary_key : Types::PrimaryKey? = nil
        )
        end
      end

      # The attributes of a VSAM type data set.

      struct VsamDetailAttributes
        include JSON::Serializable

        # The alternate key definitions, if any. A legacy dataset might not have any alternate key defined,
        # but if those alternate keys definitions exist, provide them as some applications will make use of
        # them.

        @[JSON::Field(key: "alternateKeys")]
        getter alternate_keys : Array(Types::AlternateKey)?

        # If set to True, enforces loading the data set into cache before it’s used by the application.

        @[JSON::Field(key: "cacheAtStartup")]
        getter cache_at_startup : Bool?

        # Indicates whether indexes for this dataset are stored as compressed values. If you have a large data
        # set (typically &gt; 100 Mb), consider setting this flag to True.

        @[JSON::Field(key: "compressed")]
        getter compressed : Bool?

        # The character set used by the data set. Can be ASCII, EBCDIC, or unknown.

        @[JSON::Field(key: "encoding")]
        getter encoding : String?

        # The primary key of the data set.

        @[JSON::Field(key: "primaryKey")]
        getter primary_key : Types::PrimaryKey?

        # The record format of the data set.

        @[JSON::Field(key: "recordFormat")]
        getter record_format : String?

        def initialize(
          @alternate_keys : Array(Types::AlternateKey)? = nil,
          @cache_at_startup : Bool? = nil,
          @compressed : Bool? = nil,
          @encoding : String? = nil,
          @primary_key : Types::PrimaryKey? = nil,
          @record_format : String? = nil
        )
        end
      end
    end
  end
end
