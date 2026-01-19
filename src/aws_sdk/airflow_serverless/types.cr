require "json"
require "time"

module AwsSdk
  module MWAAServerless
    module Types

      # You do not have sufficient permission to perform this action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # You cannot create a resource that already exists, or the resource is in a state that prevents the
      # requested operation.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The unique identifier of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      struct CreateWorkflowRequest
        include JSON::Serializable

        # The Amazon S3 location where the workflow definition file is stored. This must point to a valid YAML
        # file that defines the workflow structure using supported Amazon Web Services operators and tasks.
        # Amazon Managed Workflows for Apache Airflow Serverless takes a snapshot of the definition at
        # creation time, so subsequent changes to the Amazon S3 object will not affect the workflow unless you
        # create a new version. In your YAML definition, include task dependencies, scheduling information,
        # and operator configurations that are compatible with the Amazon Managed Workflows for Apache Airflow
        # Serverless execution environment.
        @[JSON::Field(key: "DefinitionS3Location")]
        getter definition_s3_location : Types::DefinitionS3Location

        # The name of the workflow. You must use unique workflow names within your Amazon Web Services
        # account. The service generates a unique identifier that is appended to ensure temporal uniqueness
        # across the account lifecycle.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role that Amazon Managed Workflows for Apache Airflow
        # Serverless assumes when executing the workflow. This role must have the necessary permissions to
        # access the required Amazon Web Services services and resources that your workflow tasks will
        # interact with. The role is used for task execution in the isolated, multi-tenant environment and
        # should follow the principle of least privilege. Amazon Managed Workflows for Apache Airflow
        # Serverless validates role access during workflow creation but runtime permission checks are
        # performed by the target services.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # token prevents duplicate workflow creation requests.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # An optional description of the workflow that you can use to provide additional context about the
        # workflow's purpose and functionality.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The configuration for encrypting workflow data at rest and in transit. Specifies the encryption type
        # and optional KMS key for customer-managed encryption.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The version of the Amazon Managed Workflows for Apache Airflow Serverless engine that you want to
        # use for this workflow. This determines the feature set, supported operators, and execution
        # environment capabilities available to your workflow. Amazon Managed Workflows for Apache Airflow
        # Serverless maintains backward compatibility across versions while introducing new features and
        # improvements. Currently supports version 1 with plans for additional versions as the service
        # evolves.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Int32?

        # The configuration for workflow logging. Specifies the CloudWatch log group where workflow execution
        # logs are stored. Amazon Managed Workflows for Apache Airflow Serverless automatically exports worker
        # logs and task-level information to the specified log group in your account using remote logging
        # functionality. This provides comprehensive observability for debugging and monitoring workflow
        # execution across the distributed, serverless environment.
        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # Network configuration for the workflow execution environment, including VPC security groups and
        # subnets for secure network access. When specified, Amazon Managed Workflows for Apache Airflow
        # Serverless deploys ECS worker tasks in your customer VPC to provide secure connectivity to your
        # resources. If not specified, tasks run in the service's default worker VPC with network isolation
        # from other customers. This configuration enables secure access to VPC-only resources like RDS
        # databases or private endpoints.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # A map of tags to assign to the workflow resource. Tags are key-value pairs that are used for
        # resource organization and cost allocation.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # The trigger mode for the workflow execution.
        @[JSON::Field(key: "TriggerMode")]
        getter trigger_mode : String?

        def initialize(
          @definition_s3_location : Types::DefinitionS3Location,
          @name : String,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @engine_version : Int32? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @tags : Hash(String, String)? = nil,
          @trigger_mode : String? = nil
        )
        end
      end

      struct CreateWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the newly created workflow. This ARN uniquely identifies the
        # workflow resource.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The timestamp when the workflow was created, in ISO 8601 date-time format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # A Boolean flag that indicates whether this workflow version is the latest version of the workflow.
        @[JSON::Field(key: "IsLatestVersion")]
        getter is_latest_version : Bool?

        # A unique identifier for this revision of the workflow configuration. This ID changes when the
        # workflow is updated and you can use it for optimistic concurrency control in update operations. The
        # revision ID helps prevent conflicting updates and ensures that updates are applied to the expected
        # version of the workflow configuration.
        @[JSON::Field(key: "RevisionId")]
        getter revision_id : String?

        # Warning messages generated during workflow creation.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(String)?

        # The current status of the workflow. Possible values are READY (workflow is ready to run) and
        # DELETING (workflow is being deleted).
        @[JSON::Field(key: "WorkflowStatus")]
        getter workflow_status : String?

        # The version identifier of the workflow. This is a service-generated alphanumeric string that
        # uniquely identifies this version of the workflow. Amazon Managed Workflows for Apache Airflow
        # Serverless uses a version-first approach where each workflow can have multiple immutable versions,
        # which allows you to maintain different configurations and roll back to previous versions as needed.
        # The version identifier is used in ARNs and API operations to reference specific workflow versions.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @created_at : Time? = nil,
          @is_latest_version : Bool? = nil,
          @revision_id : String? = nil,
          @warnings : Array(String)? = nil,
          @workflow_status : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # Specifies the Amazon S3 location of a workflow definition file. This structure contains the bucket
      # name, object key, and optional version ID for the workflow definition. Amazon Managed Workflows for
      # Apache Airflow Serverless takes a snapshot of the definition file at the time of workflow creation
      # or update, ensuring that the workflow behavior remains consistent even if the source file is
      # modified. The definition must be a valid YAML file that uses supported Amazon Web Services operators
      # and Amazon Managed Workflows for Apache Airflow Serverless syntax.
      struct DefinitionS3Location
        include JSON::Serializable

        # The name of the Amazon S3 bucket that contains the workflow definition file.
        @[JSON::Field(key: "Bucket")]
        getter bucket : String

        # The key (name) of the workflow definition file within the S3 bucket.
        @[JSON::Field(key: "ObjectKey")]
        getter object_key : String

        # Optional. The version ID of the workflow definition file in Amazon S3. If not specified, the latest
        # version is used.
        @[JSON::Field(key: "VersionId")]
        getter version_id : String?

        def initialize(
          @bucket : String,
          @object_key : String,
          @version_id : String? = nil
        )
        end
      end

      struct DeleteWorkflowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow you want to delete.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # Optional. The specific version of the workflow to delete. If not specified, all versions of the
        # workflow are deleted.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @workflow_version : String? = nil
        )
        end
      end

      struct DeleteWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the deleted workflow.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The version of the workflow that was deleted.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @workflow_version : String? = nil
        )
        end
      end

      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Configuration for encrypting workflow data at rest and in transit. Amazon Managed Workflows for
      # Apache Airflow Serverless provides comprehensive encryption capabilities to protect sensitive
      # workflow data, parameters, and execution logs. When using customer-managed keys, the service
      # integrates with Amazon Web Services KMS to provide fine-grained access control and audit
      # capabilities. Encryption is applied consistently across the distributed execution environment
      # including task containers, metadata storage, and log streams.
      struct EncryptionConfiguration
        include JSON::Serializable

        # The type of encryption to use. Values are AWS_MANAGED_KEY (Amazon Web Services manages the
        # encryption key) or CUSTOMER_MANAGED_KEY (you provide a KMS key).
        @[JSON::Field(key: "Type")]
        getter type : String

        # The ID or ARN of the Amazon Web Services KMS key to use for encryption. Required when Type is
        # CUSTOMER_MANAGED_KEY .
        @[JSON::Field(key: "KmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @type : String,
          @kms_key_id : String? = nil
        )
        end
      end

      struct GetTaskInstanceRequest
        include JSON::Serializable

        # The unique identifier of the workflow run that contains the task instance.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        # The unique identifier of the task instance to retrieve.
        @[JSON::Field(key: "TaskInstanceId")]
        getter task_instance_id : String

        # The Amazon Resource Name (ARN) of the workflow that contains the task instance.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        def initialize(
          @run_id : String,
          @task_instance_id : String,
          @workflow_arn : String
        )
        end
      end

      struct GetTaskInstanceResponse
        include JSON::Serializable

        # The unique identifier of the workflow run that contains this task instance.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        # The unique identifier of this task instance.
        @[JSON::Field(key: "TaskInstanceId")]
        getter task_instance_id : String

        # The Amazon Resource Name (ARN) of the workflow that contains this task instance.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The attempt number for this task instance.
        @[JSON::Field(key: "AttemptNumber")]
        getter attempt_number : Int32?

        # The duration of the task instance execution in seconds. This value is null if the task is not
        # complete.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        # The timestamp when the task instance completed execution, in ISO 8601 date-time format. This value
        # is null if the task is not complete.
        @[JSON::Field(key: "EndedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # The error message if the task instance failed. This value is null if the task completed
        # successfully.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The CloudWatch log stream name for this task instance execution.
        @[JSON::Field(key: "LogStream")]
        getter log_stream : String?

        # The timestamp when the task instance was last modified, in ISO 8601 date-time format.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The name of the Apache Airflow operator used for this task instance.
        @[JSON::Field(key: "OperatorName")]
        getter operator_name : String?

        # The timestamp when the task instance started execution, in ISO 8601 date-time format. This value is
        # null if the task has not started.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current status of the task instance.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier of the task definition within the workflow.
        @[JSON::Field(key: "TaskId")]
        getter task_id : String?

        # The version of the workflow that contains this task instance.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        # Cross-communication data exchanged between tasks in the workflow execution.
        @[JSON::Field(key: "Xcom")]
        getter xcom : Hash(String, String)?

        def initialize(
          @run_id : String,
          @task_instance_id : String,
          @workflow_arn : String,
          @attempt_number : Int32? = nil,
          @duration_in_seconds : Int32? = nil,
          @ended_at : Time? = nil,
          @error_message : String? = nil,
          @log_stream : String? = nil,
          @modified_at : Time? = nil,
          @operator_name : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil,
          @task_id : String? = nil,
          @workflow_version : String? = nil,
          @xcom : Hash(String, String)? = nil
        )
        end
      end

      struct GetWorkflowRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow you want to retrieve.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # Optional. The specific version of the workflow to retrieve. If not specified, the latest version is
        # returned.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @workflow_version : String? = nil
        )
        end
      end

      struct GetWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The timestamp when the workflow was created, in ISO 8601 date-time format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon S3 location of the workflow definition file.
        @[JSON::Field(key: "DefinitionS3Location")]
        getter definition_s3_location : Types::DefinitionS3Location?

        # The description of the workflow.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The encryption configuration for the workflow.
        @[JSON::Field(key: "EncryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The version of the Amazon Managed Workflows for Apache Airflow Serverless engine that this workflow
        # uses.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Int32?

        # The logging configuration for the workflow.
        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # The timestamp when the workflow was last modified, in ISO 8601 date-time format.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The name of the workflow.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The network configuration for the workflow execution environment.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The Amazon Resource Name (ARN) of the IAM role used for workflow execution.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String?

        # The schedule configuration for the workflow, including cron expressions for automated execution.
        # Amazon Managed Workflows for Apache Airflow Serverless uses EventBridge Scheduler for
        # cost-effective, timezone-aware scheduling. When a workflow includes schedule information in its YAML
        # definition, the service automatically configures the appropriate triggers for automated execution.
        # Only one version of a workflow can have an active schedule at any given time.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration?

        # The trigger mode for the workflow execution.
        @[JSON::Field(key: "TriggerMode")]
        getter trigger_mode : String?

        # The workflow definition content.
        @[JSON::Field(key: "WorkflowDefinition")]
        getter workflow_definition : String?

        # The current status of the workflow.
        @[JSON::Field(key: "WorkflowStatus")]
        getter workflow_status : String?

        # The version identifier of the workflow.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @created_at : Time? = nil,
          @definition_s3_location : Types::DefinitionS3Location? = nil,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @engine_version : Int32? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @role_arn : String? = nil,
          @schedule_configuration : Types::ScheduleConfiguration? = nil,
          @trigger_mode : String? = nil,
          @workflow_definition : String? = nil,
          @workflow_status : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      struct GetWorkflowRunRequest
        include JSON::Serializable

        # The unique identifier of the workflow run to retrieve.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        # The Amazon Resource Name (ARN) of the workflow that contains the run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        def initialize(
          @run_id : String,
          @workflow_arn : String
        )
        end
      end

      struct GetWorkflowRunResponse
        include JSON::Serializable

        # Parameters that were overridden for this specific workflow run.
        @[JSON::Field(key: "OverrideParameters")]
        getter override_parameters : Hash(String, Types::Document)?

        # Detailed information about the workflow run execution, including timing, status, and task instances.
        @[JSON::Field(key: "RunDetail")]
        getter run_detail : Types::WorkflowRunDetail?

        # The unique identifier of this workflow run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The type of workflow run. Values are ON_DEMAND (manually triggered) or SCHEDULED (automatically
        # triggered by schedule).
        @[JSON::Field(key: "RunType")]
        getter run_type : String?

        # The Amazon Resource Name (ARN) of the workflow that contains this run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String?

        # The version of the workflow that is used for this run.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @override_parameters : Hash(String, Types::Document)? = nil,
          @run_detail : Types::WorkflowRunDetail? = nil,
          @run_id : String? = nil,
          @run_type : String? = nil,
          @workflow_arn : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # An unexpected server-side error occurred during request processing.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The number of seconds to wait before retrying the operation.
        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which to list tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # A map of tags that are associated with the resource, where each tag consists of a key-value pair.
        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTaskInstancesRequest
        include JSON::Serializable

        # The unique identifier of the workflow run for which you want a list of task instances.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        # The Amazon Resource Name (ARN) of the workflow that contains the run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The maximum number of task instances to return in a single response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token you need to use to retrieve the next set of results. This value is returned
        # from a previous call to ListTaskInstances .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @run_id : String,
          @workflow_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTaskInstancesResponse
        include JSON::Serializable

        # The pagination token you need to use to retrieve the next set of results. This value is null if
        # there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of task instance summaries for the specified workflow run.
        @[JSON::Field(key: "TaskInstances")]
        getter task_instances : Array(Types::TaskInstanceSummary)?

        def initialize(
          @next_token : String? = nil,
          @task_instances : Array(Types::TaskInstanceSummary)? = nil
        )
        end
      end

      struct ListWorkflowRunsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow for which you want a list of runs.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The maximum number of workflow runs to return in a single response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token you need to use to retrieve the next set of results. This value is returned
        # from a previous call to ListWorkflowRuns .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Optional. The specific version of the workflow for which you want a list of runs. If not specified,
        # runs for all versions are returned.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      struct ListWorkflowRunsResponse
        include JSON::Serializable

        # The pagination token you need to use to retrieve the next set of results. This value is null if
        # there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of workflow run summaries for the specified workflow.
        @[JSON::Field(key: "WorkflowRuns")]
        getter workflow_runs : Array(Types::WorkflowRunSummary)?

        def initialize(
          @next_token : String? = nil,
          @workflow_runs : Array(Types::WorkflowRunSummary)? = nil
        )
        end
      end

      struct ListWorkflowVersionsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow for which you want to list versions.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The maximum number of workflow versions to return in a single response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token you need to use to retrieve the next set of results. This value is returned
        # from a previous call to ListWorkflowVersions .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workflow_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowVersionsResponse
        include JSON::Serializable

        # The pagination token you need to use to retrieve the next set of results. This value is null if
        # there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # A list of workflow version summaries for the specified workflow.
        @[JSON::Field(key: "WorkflowVersions")]
        getter workflow_versions : Array(Types::WorkflowVersionSummary)?

        def initialize(
          @next_token : String? = nil,
          @workflow_versions : Array(Types::WorkflowVersionSummary)? = nil
        )
        end
      end

      struct ListWorkflowsRequest
        include JSON::Serializable

        # The maximum number of workflows you want to return in a single response.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The pagination token you need to use to retrieve the next set of results. This value is returned
        # from a previous call to ListWorkflows .
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkflowsResponse
        include JSON::Serializable

        # A list of workflow summaries for all workflows in your account.
        @[JSON::Field(key: "Workflows")]
        getter workflows : Array(Types::WorkflowSummary)

        # The pagination token you need to use to retrieve the next set of results. This value is null if
        # there are no more results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @workflows : Array(Types::WorkflowSummary),
          @next_token : String? = nil
        )
        end
      end

      # Configuration for workflow logging that specifies where you should store your workflow execution
      # logs. Amazon Managed Workflows for Apache Airflow Serverless provides comprehensive logging
      # capabilities that capture workflow execution details, task-level information, and system events.
      # Logs are automatically exported to your specified CloudWatch log group using remote logging
      # functionality, providing centralized observability across the distributed, multi-tenant execution
      # environment. This enables effective debugging, monitoring, and compliance auditing of workflow
      # executions.
      struct LoggingConfiguration
        include JSON::Serializable

        # The name of the CloudWatch log group where workflow execution logs are stored.
        @[JSON::Field(key: "LogGroupName")]
        getter log_group_name : String

        def initialize(
          @log_group_name : String
        )
        end
      end

      # Network configuration for workflow execution. Specifies VPC security groups and subnets for secure
      # network access. When provided, Amazon Managed Workflows for Apache Airflow Serverless deploys ECS
      # worker tasks in your specified VPC configuration, enabling secure access to VPC-only resources. The
      # service uses a proxy API container architecture where one container handles external communication
      # while the worker container connects to your VPC for task execution. This design provides both
      # security isolation and connectivity flexibility.
      struct NetworkConfiguration
        include JSON::Serializable

        # A list of VPC security group IDs to associate with the workflow execution environment.
        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # A list of VPC subnet IDs where the workflow execution environment is deployed.
        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # The operation timed out.
      struct OperationTimeoutException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified resource was not found. You can only access or modify a resource that already exists.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The unique identifier of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of the resource.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String
        )
        end
      end

      # Summary information about a workflow run's execution details, including status and timing
      # information.
      struct RunDetailSummary
        include JSON::Serializable

        # The timestamp when the workflow run was created, in ISO 8601 date-time format.
        @[JSON::Field(key: "CreatedOn", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_on : Time?

        # The timestamp when the workflow run completed execution, in ISO 8601 date-time format. This value is
        # null if the run is not complete.
        @[JSON::Field(key: "EndedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter ended_at : Time?

        # The timestamp when the workflow run started execution, in ISO 8601 date-time format.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The current status of the workflow run.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @created_on : Time? = nil,
          @ended_at : Time? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The configuration to use to schedule automated workflow execution using cron expressions. Amazon
      # Managed Workflows for Apache Airflow Serverless integrates with EventBridge Scheduler to provide
      # cost-effective, timezone-aware scheduling capabilities. The service supports both time-based and
      # event-based scheduling (event-based scheduling available post-GA). When a workflow definition
      # includes scheduling information, Amazon Managed Workflows for Apache Airflow Serverless
      # automatically configures the appropriate triggers and ensures only one version of a workflow has an
      # active schedule at any time.
      struct ScheduleConfiguration
        include JSON::Serializable

        # A cron expression that defines when the workflow is automatically executed. Uses standard cron
        # syntax.
        @[JSON::Field(key: "CronExpression")]
        getter cron_expression : String?

        def initialize(
          @cron_expression : String? = nil
        )
        end
      end

      # The request exceeds the service quota for Amazon Managed Workflows for Apache Airflow Serverless
      # resources. This can occur when you attempt to create more workflows than allowed, exceed concurrent
      # workflow run limits, or surpass task execution limits. Amazon Managed Workflows for Apache Airflow
      # Serverless implements admission control using DynamoDB-based counters to manage resource utilization
      # across the multi-tenant environment. Contact Amazon Web Services Support to request quota increases
      # if you need higher limits for your use case.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The code of the quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The unique identifier of the resource.
        @[JSON::Field(key: "ResourceId")]
        getter resource_id : String

        # The type of resource affected.
        @[JSON::Field(key: "ResourceType")]
        getter resource_type : String

        # The code for the service.
        @[JSON::Field(key: "ServiceCode")]
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

      struct StartWorkflowRunRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow you want to run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. This
        # token prevents duplicate workflow run requests.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # Optional parameters to override default workflow parameters for this specific run. These parameters
        # are passed to the workflow during execution and can be used to customize behavior without modifying
        # the workflow definition. Parameters are made available as environment variables to tasks and you can
        # reference them within the YAML workflow definition using standard parameter substitution syntax.
        @[JSON::Field(key: "OverrideParameters")]
        getter override_parameters : Hash(String, Types::Document)?

        # Optional. The specific version of the workflow to execute. If not specified, the latest version is
        # used.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @client_token : String? = nil,
          @override_parameters : Hash(String, Types::Document)? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      struct StartWorkflowRunResponse
        include JSON::Serializable

        # The unique identifier of the newly started workflow run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The timestamp when the workflow run was started, in ISO 8601 date-time format.
        @[JSON::Field(key: "StartedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_at : Time?

        # The initial status of the workflow run. This is typically STARTING when you first create the run.
        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @run_id : String? = nil,
          @started_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      struct StopWorkflowRunRequest
        include JSON::Serializable

        # The unique identifier of the workflow run to stop.
        @[JSON::Field(key: "RunId")]
        getter run_id : String

        # The Amazon Resource Name (ARN) of the workflow that contains the run you want to stop.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        def initialize(
          @run_id : String,
          @workflow_arn : String
        )
        end
      end

      struct StopWorkflowRunResponse
        include JSON::Serializable

        # The unique identifier of the stopped workflow run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The status of the workflow run after the stop operation. This is typically STOPPING or STOPPED .
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The Amazon Resource Name (ARN) of the workflow that contains the stopped run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String?

        # The version of the workflow that was stopped.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @run_id : String? = nil,
          @status : String? = nil,
          @workflow_arn : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to which to add tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A map of tags to add to the resource. Each tag consists of a key-value pair.
        @[JSON::Field(key: "Tags")]
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

      # Summary information about a task instance within a workflow run, including its status and execution
      # details.
      struct TaskInstanceSummary
        include JSON::Serializable

        # The duration of the task instance execution in seconds. This value is null if the task is not
        # complete.
        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int32?

        # The name of the Apache Airflow operator used for this task instance.
        @[JSON::Field(key: "OperatorName")]
        getter operator_name : String?

        # The unique identifier of the workflow run that contains this task instance.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The current status of the task instance.
        @[JSON::Field(key: "Status")]
        getter status : String?

        # The unique identifier of this task instance.
        @[JSON::Field(key: "TaskInstanceId")]
        getter task_instance_id : String?

        # The Amazon Resource Name (ARN) of the workflow that contains this task instance.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String?

        # The version of the workflow that contains this task instance.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @duration_in_seconds : Int32? = nil,
          @operator_name : String? = nil,
          @run_id : String? = nil,
          @status : String? = nil,
          @task_instance_id : String? = nil,
          @workflow_arn : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # The request was denied because too many requests were made in a short period, exceeding the service
      # rate limits. Amazon Managed Workflows for Apache Airflow Serverless implements throttling controls
      # to ensure fair resource allocation across all customers in the multi-tenant environment. This helps
      # maintain service stability and performance. If you encounter throttling, implement exponential
      # backoff and retry logic in your applications, or consider distributing your API calls over a longer
      # time period.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The code of the quota.
        @[JSON::Field(key: "QuotaCode")]
        getter quota_code : String

        # The code for the service.
        @[JSON::Field(key: "ServiceCode")]
        getter service_code : String

        # The number of seconds to wait before retrying the operation.
        @[JSON::Field(key: "RetryAfterSeconds")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @quota_code : String,
          @service_code : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource from which to remove tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tag keys to remove from the resource. Only the keys are required; the values are ignored.
        @[JSON::Field(key: "TagKeys")]
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

      struct UpdateWorkflowRequest
        include JSON::Serializable

        # The Amazon S3 location where the updated workflow definition file is stored.
        @[JSON::Field(key: "DefinitionS3Location")]
        getter definition_s3_location : Types::DefinitionS3Location

        # The Amazon Resource Name (ARN) of the IAM role that Amazon Managed Workflows for Apache Airflow
        # Serverless assumes when it executes the updated workflow.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of the workflow you want to update.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # An updated description for the workflow.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The version of the Amazon Managed Workflows for Apache Airflow Serverless engine that you want to
        # use for the updated workflow.
        @[JSON::Field(key: "EngineVersion")]
        getter engine_version : Int32?

        # Updated logging configuration for the workflow.
        @[JSON::Field(key: "LoggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # Updated network configuration for the workflow execution environment.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # The trigger mode for the workflow execution.
        @[JSON::Field(key: "TriggerMode")]
        getter trigger_mode : String?

        def initialize(
          @definition_s3_location : Types::DefinitionS3Location,
          @role_arn : String,
          @workflow_arn : String,
          @description : String? = nil,
          @engine_version : Int32? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @network_configuration : Types::NetworkConfiguration? = nil,
          @trigger_mode : String? = nil
        )
        end
      end

      struct UpdateWorkflowResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the updated workflow.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The timestamp when the workflow was last modified, in ISO 8601 date-time format.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # Warning messages generated during workflow update.
        @[JSON::Field(key: "Warnings")]
        getter warnings : Array(String)?

        # The version identifier of the updated workflow.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @modified_at : Time? = nil,
          @warnings : Array(String)? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # The specified request parameters are invalid, missing, or inconsistent with Amazon Managed Workflows
      # for Apache Airflow Serverless service requirements. This can occur when workflow definitions contain
      # unsupported operators, when required IAM permissions are missing, when S3 locations are
      # inaccessible, or when network configurations are invalid. The service validates workflow
      # definitions, execution roles, and resource configurations to ensure compatibility with the managed
      # Airflow environment and security requirements.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        # The reason the request failed validation.
        @[JSON::Field(key: "Reason")]
        getter reason : String

        # The fields that failed validation.
        @[JSON::Field(key: "FieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # Contains information about a field that failed validation, including the field name and a
      # descriptive error message.
      struct ValidationExceptionField
        include JSON::Serializable

        # A message that describes why the field failed validation.
        @[JSON::Field(key: "Message")]
        getter message : String

        # The name of the field that failed validation.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # Detailed information about a workflow run execution, including timing, status, error information,
      # and associated task instances. This structure provides comprehensive visibility into the workflow
      # execution lifecycle within the Amazon Managed Workflows for Apache Airflow Serverless serverless
      # environment. The service tracks execution across distributed ECS worker tasks and provides detailed
      # timing information, error diagnostics, and task instance relationships to support effective
      # monitoring and troubleshooting of complex workflow executions.
      struct WorkflowRunDetail
        include JSON::Serializable

        # The timestamp when the workflow run completed execution, in ISO 8601 date-time format. This value is
        # null if the run is not complete.
        @[JSON::Field(key: "CompletedOn", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter completed_on : Time?

        # The timestamp when the workflow run was created, in ISO 8601 date-time format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The total duration of the workflow run execution in seconds. This value is null if the run is not
        # complete.
        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # The error message if the workflow run failed. This value is null if the run completed successfully.
        @[JSON::Field(key: "ErrorMessage")]
        getter error_message : String?

        # The timestamp when the workflow run was last modified, in ISO 8601 date-time format.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The unique identifier of this workflow run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The current execution state of the workflow run.
        @[JSON::Field(key: "RunState")]
        getter run_state : String?

        # The type of workflow run.
        @[JSON::Field(key: "RunType")]
        getter run_type : String?

        # The timestamp when the workflow run started execution, in ISO 8601 date-time format.
        @[JSON::Field(key: "StartedOn", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter started_on : Time?

        # A list of task instance IDs that are part of this workflow run.
        @[JSON::Field(key: "TaskInstances")]
        getter task_instances : Array(String)?

        # The Amazon Resource Name (ARN) of the workflow that contains this run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String?

        # The version of the workflow used for this run.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @completed_on : Time? = nil,
          @created_at : Time? = nil,
          @duration : Int32? = nil,
          @error_message : String? = nil,
          @modified_at : Time? = nil,
          @run_id : String? = nil,
          @run_state : String? = nil,
          @run_type : String? = nil,
          @started_on : Time? = nil,
          @task_instances : Array(String)? = nil,
          @workflow_arn : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # Summary information about a workflow run, including basic identification and status information.
      struct WorkflowRunSummary
        include JSON::Serializable

        # Summary details about the workflow run execution.
        @[JSON::Field(key: "RunDetailSummary")]
        getter run_detail_summary : Types::RunDetailSummary?

        # The unique identifier of the workflow run.
        @[JSON::Field(key: "RunId")]
        getter run_id : String?

        # The type of workflow run.
        @[JSON::Field(key: "RunType")]
        getter run_type : String?

        # The Amazon Resource Name (ARN) of the workflow that contains this run.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String?

        # The version of the workflow used for this run.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @run_detail_summary : Types::RunDetailSummary? = nil,
          @run_id : String? = nil,
          @run_type : String? = nil,
          @workflow_arn : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # Summary information about a workflow, including basic identification and metadata.
      struct WorkflowSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The timestamp when the workflow was created, in ISO 8601 date-time format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The description of the workflow.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The timestamp when the workflow was last modified, in ISO 8601 date-time format.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The name of the workflow.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The trigger mode for the workflow execution.
        @[JSON::Field(key: "TriggerMode")]
        getter trigger_mode : String?

        # The current status of the workflow.
        @[JSON::Field(key: "WorkflowStatus")]
        getter workflow_status : String?

        # The version identifier of the workflow.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String?

        def initialize(
          @workflow_arn : String,
          @created_at : Time? = nil,
          @description : String? = nil,
          @modified_at : Time? = nil,
          @name : String? = nil,
          @trigger_mode : String? = nil,
          @workflow_status : String? = nil,
          @workflow_version : String? = nil
        )
        end
      end

      # Summary information about a workflow version, including identification and configuration details.
      struct WorkflowVersionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the workflow that contains this version.
        @[JSON::Field(key: "WorkflowArn")]
        getter workflow_arn : String

        # The version identifier of the workflow version.
        @[JSON::Field(key: "WorkflowVersion")]
        getter workflow_version : String

        # The timestamp when the workflow version was created, in ISO 8601 date-time format.
        @[JSON::Field(key: "CreatedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter created_at : Time?

        # The Amazon S3 location of the workflow definition file for this version.
        @[JSON::Field(key: "DefinitionS3Location")]
        getter definition_s3_location : Types::DefinitionS3Location?

        # Boolean flag that indicates whether this is the latest version of the workflow.
        @[JSON::Field(key: "IsLatestVersion")]
        getter is_latest_version : Bool?

        # The timestamp when the workflow version was last modified, in ISO 8601 date-time format.
        @[JSON::Field(key: "ModifiedAt", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter modified_at : Time?

        # The schedule configuration for this workflow version.
        @[JSON::Field(key: "ScheduleConfiguration")]
        getter schedule_configuration : Types::ScheduleConfiguration?

        # The trigger mode for the workflow execution.
        @[JSON::Field(key: "TriggerMode")]
        getter trigger_mode : String?

        def initialize(
          @workflow_arn : String,
          @workflow_version : String,
          @created_at : Time? = nil,
          @definition_s3_location : Types::DefinitionS3Location? = nil,
          @is_latest_version : Bool? = nil,
          @modified_at : Time? = nil,
          @schedule_configuration : Types::ScheduleConfiguration? = nil,
          @trigger_mode : String? = nil
        )
        end
      end
    end
  end
end
