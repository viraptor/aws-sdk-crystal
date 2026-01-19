require "json"
require "time"

module AwsSdk
  module Deadline
    module Types

      # Provides information about the GPU accelerators used for jobs processed by a fleet. Accelerator
      # capabilities cannot be used with wait-and-save fleets. If you specify accelerator capabilities, you
      # must use either spot or on-demand instance market options. Each accelerator type maps to specific
      # EC2 instance families: t4 : Uses G4dn instance family a10g : Uses G5 instance family l4 : Uses G6
      # and Gr6 instance families l40s : Uses G6e instance family
      struct AcceleratorCapabilities
        include JSON::Serializable

        # A list of accelerator capabilities requested for this fleet. Only Amazon Elastic Compute Cloud
        # instances that provide these capabilities will be used. For example, if you specify both L4 and T4
        # chips, Amazon Web Services Deadline Cloud will use Amazon EC2 instances that have either the L4 or
        # the T4 chip installed. You must specify at least one accelerator selection. You cannot specify the
        # same accelerator name multiple times in the selections list. All accelerators in the selections must
        # use the same runtime version.
        @[JSON::Field(key: "selections")]
        getter selections : Array(Types::AcceleratorSelection)

        # The number of GPU accelerators specified for worker hosts in this fleet. You must specify either
        # acceleratorCapabilities.count.max or allowedInstanceTypes when using accelerator capabilities. If
        # you don't specify a maximum count, Amazon Web Services Deadline Cloud uses the instance types you
        # specify in allowedInstanceTypes to determine the maximum number of accelerators.
        @[JSON::Field(key: "count")]
        getter count : Types::AcceleratorCountRange?

        def initialize(
          @selections : Array(Types::AcceleratorSelection),
          @count : Types::AcceleratorCountRange? = nil
        )
        end
      end

      # Defines the maximum and minimum number of GPU accelerators required for a worker instance..
      struct AcceleratorCountRange
        include JSON::Serializable

        # The minimum number of GPU accelerators in the worker host.
        @[JSON::Field(key: "min")]
        getter min : Int32

        # The maximum number of GPU accelerators in the worker host.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # Describes a specific GPU accelerator required for an Amazon Elastic Compute Cloud worker host.
      struct AcceleratorSelection
        include JSON::Serializable

        # The name of the chip used by the GPU accelerator. The available GPU accelerators are: t4 - NVIDIA T4
        # Tensor Core GPU (16 GiB memory) a10g - NVIDIA A10G Tensor Core GPU (24 GiB memory) l4 - NVIDIA L4
        # Tensor Core GPU (24 GiB memory) l40s - NVIDIA L40S Tensor Core GPU (48 GiB memory)
        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies the runtime driver to use for the GPU accelerator. You must use the same runtime for all
        # GPUs in a fleet. You can choose from the following runtimes: latest - Use the latest runtime
        # available for the chip. If you specify latest and a new version of the runtime is released, the new
        # version of the runtime is used. grid:r570 - NVIDIA vGPU software 18 grid:r535 - NVIDIA vGPU software
        # 16 If you don't specify a runtime, Amazon Web Services Deadline Cloud uses latest as the default.
        # However, if you have multiple accelerators and specify latest for some and leave others blank,
        # Amazon Web Services Deadline Cloud raises an exception. Not all runtimes are compatible with all
        # accelerator types: t4 and a10g : Support all runtimes ( grid:r570 , grid:r535 ) l4 and l40s : Only
        # support grid:r570 and newer All accelerators in a fleet must use the same runtime version. You
        # cannot mix different runtime versions within a single fleet. When you specify latest , it resolves
        # to grid:r570 for all currently supported accelerators.
        @[JSON::Field(key: "runtime")]
        getter runtime : String?

        def initialize(
          @name : String,
          @runtime : String? = nil
        )
        end
      end

      # Defines the maximum and minimum amount of memory, in MiB, to use for the accelerator.
      struct AcceleratorTotalMemoryMiBRange
        include JSON::Serializable

        # The minimum amount of memory to use for the accelerator, measured in MiB.
        @[JSON::Field(key: "min")]
        getter min : Int32

        # The maximum amount of memory to use for the accelerator, measured in MiB.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # You don't have permission to perform the action.
      struct AccessDeniedException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Information about the resources in use when the exception was thrown.
        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        def initialize(
          @message : String,
          @context : Hash(String, String)? = nil
        )
        end
      end

      # Provides information about the number of resources used.
      struct AcquiredLimit
        include JSON::Serializable

        # The number of limit resources used.
        @[JSON::Field(key: "count")]
        getter count : Int32

        # The unique identifier of the limit.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        def initialize(
          @count : Int32,
          @limit_id : String
        )
        end
      end

      # The assigned starting environment for a worker during session.
      struct AssignedEnvironmentEnterSessionActionDefinition
        include JSON::Serializable

        # The environment ID of the assigned environment at the start of a session.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # The assigned environment when a worker exits a session.
      struct AssignedEnvironmentExitSessionActionDefinition
        include JSON::Serializable

        # The environment ID of the assigned environment when exiting a session.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # The assigned session for the worker.
      struct AssignedSession
        include JSON::Serializable

        # The job ID for the assigned session.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The log configuration for the worker's assigned session.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::LogConfiguration

        # The queue ID of the assigned session.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The session actions to apply to the assigned session.
        @[JSON::Field(key: "sessionActions")]
        getter session_actions : Array(Types::AssignedSessionAction)

        def initialize(
          @job_id : String,
          @log_configuration : Types::LogConfiguration,
          @queue_id : String,
          @session_actions : Array(Types::AssignedSessionAction)
        )
        end
      end

      # The action for a session defined by the session action ID.
      struct AssignedSessionAction
        include JSON::Serializable

        # The definition of the assigned session action.
        @[JSON::Field(key: "definition")]
        getter definition : Types::AssignedSessionActionDefinition

        # The session action ID for the assigned session.
        @[JSON::Field(key: "sessionActionId")]
        getter session_action_id : String

        def initialize(
          @definition : Types::AssignedSessionActionDefinition,
          @session_action_id : String
        )
        end
      end

      # The definition of the assigned session action.
      struct AssignedSessionActionDefinition
        include JSON::Serializable

        # The environment a session starts on.
        @[JSON::Field(key: "envEnter")]
        getter env_enter : Types::AssignedEnvironmentEnterSessionActionDefinition?

        # The environment a session exits from.
        @[JSON::Field(key: "envExit")]
        getter env_exit : Types::AssignedEnvironmentExitSessionActionDefinition?

        # The job attachments to sync for the assigned session action.
        @[JSON::Field(key: "syncInputJobAttachments")]
        getter sync_input_job_attachments : Types::AssignedSyncInputJobAttachmentsSessionActionDefinition?

        # The task run.
        @[JSON::Field(key: "taskRun")]
        getter task_run : Types::AssignedTaskRunSessionActionDefinition?

        def initialize(
          @env_enter : Types::AssignedEnvironmentEnterSessionActionDefinition? = nil,
          @env_exit : Types::AssignedEnvironmentExitSessionActionDefinition? = nil,
          @sync_input_job_attachments : Types::AssignedSyncInputJobAttachmentsSessionActionDefinition? = nil,
          @task_run : Types::AssignedTaskRunSessionActionDefinition? = nil
        )
        end
      end

      # The assigned session action definition for syncing input job attachments.
      struct AssignedSyncInputJobAttachmentsSessionActionDefinition
        include JSON::Serializable

        # The step ID for the assigned sync input job attachments session action.
        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        def initialize(
          @step_id : String? = nil
        )
        end
      end

      # The specific task, step, and parameters to include.
      struct AssignedTaskRunSessionActionDefinition
        include JSON::Serializable

        # The parameters to include.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TaskParameterValue)

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @parameters : Hash(String, Types::TaskParameterValue),
          @step_id : String,
          @task_id : String? = nil
        )
        end
      end

      struct AssociateMemberToFarmRequest
        include JSON::Serializable

        # The ID of the farm to associate with the member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The identity store ID of the member to associate with the farm.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The principal's membership level for the associated farm.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The member's principal ID to associate with the farm.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The principal type of the member to associate with the farm.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        def initialize(
          @farm_id : String,
          @identity_store_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end

      struct AssociateMemberToFarmResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateMemberToFleetRequest
        include JSON::Serializable

        # The farm ID of the fleet to associate with the member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The ID of the fleet to associate with a member.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The member's identity store ID to associate with the fleet.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The principal's membership level for the associated fleet.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The member's principal ID to associate with a fleet.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The member's principal type to associate with the fleet.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @identity_store_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end

      struct AssociateMemberToFleetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateMemberToJobRequest
        include JSON::Serializable

        # The farm ID of the job to associate with the member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The member's identity store ID to associate with the job.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The job ID to associate with the member.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The principal's membership level for the associated job.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The member's principal ID to associate with the job.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The member's principal type to associate with the job.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        # The queue ID to associate to the member.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @identity_store_id : String,
          @job_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String,
          @queue_id : String
        )
        end
      end

      struct AssociateMemberToJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssociateMemberToQueueRequest
        include JSON::Serializable

        # The farm ID of the queue to associate with the member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The member's identity store ID to associate with the queue.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The principal's membership level for the associated queue.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The member's principal ID to associate with the queue.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The member's principal type to associate with the queue.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        # The ID of the queue to associate to the member.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @identity_store_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String,
          @queue_id : String
        )
        end
      end

      struct AssociateMemberToQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct AssumeFleetRoleForReadRequest
        include JSON::Serializable

        # The farm ID for the fleet's farm.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String
        )
        end
      end

      struct AssumeFleetRoleForReadResponse
        include JSON::Serializable

        # The credentials for the fleet role.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::AwsCredentials

        def initialize(
          @credentials : Types::AwsCredentials
        )
        end
      end

      struct AssumeFleetRoleForWorkerRequest
        include JSON::Serializable

        # The farm ID for the fleet's farm.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID that contains the worker.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The ID of the worker assuming the fleet role.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @worker_id : String
        )
        end
      end

      struct AssumeFleetRoleForWorkerResponse
        include JSON::Serializable

        # The credentials for the worker.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::AwsCredentials

        def initialize(
          @credentials : Types::AwsCredentials
        )
        end
      end

      struct AssumeQueueRoleForReadRequest
        include JSON::Serializable

        # The farm ID of the farm containing the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @queue_id : String
        )
        end
      end

      struct AssumeQueueRoleForReadResponse
        include JSON::Serializable

        # The credentials for the queue role.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::AwsCredentials

        def initialize(
          @credentials : Types::AwsCredentials
        )
        end
      end

      struct AssumeQueueRoleForUserRequest
        include JSON::Serializable

        # The farm ID of the queue that the user assumes the role for.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID of the queue that the user assumes the role for.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @queue_id : String
        )
        end
      end

      struct AssumeQueueRoleForUserResponse
        include JSON::Serializable

        # The credentials for the queue role that a user has access to.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::AwsCredentials

        def initialize(
          @credentials : Types::AwsCredentials
        )
        end
      end

      struct AssumeQueueRoleForWorkerRequest
        include JSON::Serializable

        # The farm ID of the worker assuming the queue role.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the worker assuming the queue role.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID of the worker assuming the queue role.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The worker ID of the worker assuming the queue role.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @queue_id : String,
          @worker_id : String
        )
        end
      end

      struct AssumeQueueRoleForWorkerResponse
        include JSON::Serializable

        # The Amazon Web Services credentials for the role that the worker is assuming.
        @[JSON::Field(key: "credentials")]
        getter credentials : Types::AwsCredentials?

        def initialize(
          @credentials : Types::AwsCredentials? = nil
        )
        end
      end

      # The job attachments.
      struct Attachments
        include JSON::Serializable

        # The manifest properties for the attachments.
        @[JSON::Field(key: "manifests")]
        getter manifests : Array(Types::ManifestProperties)

        # The file system location for the attachments.
        @[JSON::Field(key: "fileSystem")]
        getter file_system : String?

        def initialize(
          @manifests : Array(Types::ManifestProperties),
          @file_system : String? = nil
        )
        end
      end

      # The Identity and Access Management credentials.
      struct AwsCredentials
        include JSON::Serializable

        # The IAM access key ID.
        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String

        # The expiration date and time of the IAM credentials.
        @[JSON::Field(key: "expiration")]
        getter expiration : Time

        # The IAM secret access key.
        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String

        # The IAM session token
        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @access_key_id : String,
          @expiration : Time,
          @secret_access_key : String,
          @session_token : String
        )
        end
      end

      struct BatchGetJobEntityRequest
        include JSON::Serializable

        # The farm ID of the worker that's fetching job details. The worker must have an assignment on a job
        # to fetch job details.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the worker that's fetching job details. The worker must have an assignment on a job
        # to fetch job details.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The job identifiers to include within the job entity batch details.
        @[JSON::Field(key: "identifiers")]
        getter identifiers : Array(Types::JobEntityIdentifiersUnion)

        # The worker ID of the worker containing the job details to get.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @identifiers : Array(Types::JobEntityIdentifiersUnion),
          @worker_id : String
        )
        end
      end

      struct BatchGetJobEntityResponse
        include JSON::Serializable

        # A list of the job entities, or details, in the batch.
        @[JSON::Field(key: "entities")]
        getter entities : Array(Types::JobEntity)

        # A list of errors from the job error logs for the batch.
        @[JSON::Field(key: "errors")]
        getter errors : Array(Types::GetJobEntityError)

        def initialize(
          @entities : Array(Types::JobEntity),
          @errors : Array(Types::GetJobEntityError)
        )
        end
      end

      # The budget action to add.
      struct BudgetActionToAdd
        include JSON::Serializable

        # The percentage threshold for the budget action to add.
        @[JSON::Field(key: "thresholdPercentage")]
        getter threshold_percentage : Float64

        # The type of budget action to add.
        @[JSON::Field(key: "type")]
        getter type : String

        # A description for the budget action to add. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @threshold_percentage : Float64,
          @type : String,
          @description : String? = nil
        )
        end
      end

      # The budget action to remove.
      struct BudgetActionToRemove
        include JSON::Serializable

        # The percentage threshold for the budget action to remove.
        @[JSON::Field(key: "thresholdPercentage")]
        getter threshold_percentage : Float64

        # The type of budget action to remove.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @threshold_percentage : Float64,
          @type : String
        )
        end
      end

      # The start and end time of the budget.
      struct BudgetSchedule
        include JSON::Serializable

        # The fixed start and end time of the budget's schedule.
        @[JSON::Field(key: "fixed")]
        getter fixed : Types::FixedBudgetSchedule?

        def initialize(
          @fixed : Types::FixedBudgetSchedule? = nil
        )
        end
      end

      # The budget summary.
      struct BudgetSummary
        include JSON::Serializable

        # The approximate dollar limit of the budget.
        @[JSON::Field(key: "approximateDollarLimit")]
        getter approximate_dollar_limit : Float64

        # The budget ID.
        @[JSON::Field(key: "budgetId")]
        getter budget_id : String

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the budget summary to update. This field can store any content. Escape or encode
        # this content before displaying it on a webpage or any other system that might interpret the content
        # of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The status of the budget. ACTIVE –The budget is being evaluated. INACTIVE –The budget is inactive.
        # This can include Expired, Canceled, or deleted Deleted statuses.
        @[JSON::Field(key: "status")]
        getter status : String

        # The resource used to track expenditure in the budget.
        @[JSON::Field(key: "usageTrackingResource")]
        getter usage_tracking_resource : Types::UsageTrackingResource

        # The consumed usage for the budget.
        @[JSON::Field(key: "usages")]
        getter usages : Types::ConsumedUsages

        # The description of the budget summary. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @approximate_dollar_limit : Float64,
          @budget_id : String,
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @status : String,
          @usage_tracking_resource : Types::UsageTrackingResource,
          @usages : Types::ConsumedUsages,
          @description : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Your request has conflicting operations. This can occur if you're trying to perform more than one
      # operation on the same resource at the same time.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # A description of the error.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The identifier of the resource in use.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource in use.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Information about the resources in use when the exception was thrown.
        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        def initialize(
          @message : String,
          @reason : String,
          @resource_id : String,
          @resource_type : String,
          @context : Hash(String, String)? = nil
        )
        end
      end

      # The consumed usage for the resource.
      struct ConsumedUsages
        include JSON::Serializable

        # The amount of the budget consumed.
        @[JSON::Field(key: "approximateDollarUsage")]
        getter approximate_dollar_usage : Float64

        def initialize(
          @approximate_dollar_usage : Float64
        )
        end
      end

      struct CopyJobTemplateRequest
        include JSON::Serializable

        # The farm ID to copy.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to copy.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to copy.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The Amazon S3 bucket name and key where you would like to add a copy of the job template.
        @[JSON::Field(key: "targetS3Location")]
        getter target_s3_location : Types::S3Location

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @target_s3_location : Types::S3Location
        )
        end
      end

      struct CopyJobTemplateResponse
        include JSON::Serializable

        # The format of the job template, either JSON or YAML .
        @[JSON::Field(key: "templateType")]
        getter template_type : String

        def initialize(
          @template_type : String
        )
        end
      end

      struct CreateBudgetRequest
        include JSON::Serializable

        # The budget actions to specify what happens when the budget runs out.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::BudgetActionToAdd)

        # The dollar limit based on consumed usage.
        @[JSON::Field(key: "approximateDollarLimit")]
        getter approximate_dollar_limit : Float64

        # The display name of the budget. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID to include in this budget.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The schedule to associate with this budget.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::BudgetSchedule

        # The queue ID provided to this budget to track usage.
        @[JSON::Field(key: "usageTrackingResource")]
        getter usage_tracking_resource : Types::UsageTrackingResource

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The description of the budget. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @actions : Array(Types::BudgetActionToAdd),
          @approximate_dollar_limit : Float64,
          @display_name : String,
          @farm_id : String,
          @schedule : Types::BudgetSchedule,
          @usage_tracking_resource : Types::UsageTrackingResource,
          @client_token : String? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateBudgetResponse
        include JSON::Serializable

        # The budget ID.
        @[JSON::Field(key: "budgetId")]
        getter budget_id : String

        def initialize(
          @budget_id : String
        )
        end
      end

      struct CreateFarmRequest
        include JSON::Serializable

        # The display name of the farm. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The description of the farm. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the KMS key to use on the farm.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The tags to add to your farm. Each tag consists of a tag key and a tag value. Tag keys and values
        # are both required, but tag values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateFarmResponse
        include JSON::Serializable

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        def initialize(
          @farm_id : String
        )
        end
      end

      struct CreateFleetRequest
        include JSON::Serializable

        # The configuration settings for the fleet. Customer managed fleets are self-managed. Service managed
        # Amazon EC2 fleets are managed by Deadline Cloud.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::FleetConfiguration

        # The display name of the fleet. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID of the farm to connect to the fleet.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of workers for the fleet. Deadline Cloud limits the number of workers to less
        # than or equal to the fleet's maximum worker count. The service maintains eventual consistency for
        # the worker count. If you make multiple rapid calls to CreateWorker before the field updates, you
        # might exceed your fleet's maximum worker count. For example, if your maxWorkerCount is 10 and you
        # currently have 9 workers, making two quick CreateWorker calls might successfully create 2 workers
        # instead of 1, resulting in 11 total workers.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32

        # The IAM role ARN for the role that the fleet's workers will use.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The description of the fleet. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Provides a script that runs as a worker is starting up that you can use to provide additional
        # configuration for workers in your fleet.
        @[JSON::Field(key: "hostConfiguration")]
        getter host_configuration : Types::HostConfiguration?

        # The minimum number of workers for the fleet.
        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32?

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configuration : Types::FleetConfiguration,
          @display_name : String,
          @farm_id : String,
          @max_worker_count : Int32,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil,
          @host_configuration : Types::HostConfiguration? = nil,
          @min_worker_count : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateFleetResponse
        include JSON::Serializable

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        def initialize(
          @fleet_id : String
        )
        end
      end

      struct CreateJobRequest
        include JSON::Serializable

        # The farm ID of the farm to connect to the job.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The priority of the job. The highest priority (first scheduled) is 100. When two jobs have the same
        # priority, the oldest job is scheduled first.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The ID of the queue that the job is submitted to.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The attachments for the job. Attach files required for the job to run to a render job.
        @[JSON::Field(key: "attachments")]
        getter attachments : Types::Attachments?

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The number of task failures before the job stops running and is marked as FAILED .
        @[JSON::Field(key: "maxFailedTasksCount")]
        getter max_failed_tasks_count : Int32?

        # The maximum number of retries for each task.
        @[JSON::Field(key: "maxRetriesPerTask")]
        getter max_retries_per_task : Int32?

        # The maximum number of worker hosts that can concurrently process a job. When the maxWorkerCount is
        # reached, no more workers will be assigned to process the job, even if the fleets assigned to the
        # job's queue has available workers. You can't set the maxWorkerCount to 0. If you set it to -1, there
        # is no maximum number of workers. If you don't specify the maxWorkerCount , Deadline Cloud won't
        # throttle the number of workers used to process the job.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The parameters for the job.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::JobParameter)?

        # The job ID for the source job.
        @[JSON::Field(key: "sourceJobId")]
        getter source_job_id : String?

        # The storage profile ID for the storage profile to connect to the job.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String?

        # The initial job status when it is created. Jobs that are created with a SUSPENDED status will not
        # run until manually requeued.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The job template to use for this job.
        @[JSON::Field(key: "template")]
        getter template : String?

        # The file type for the job template.
        @[JSON::Field(key: "templateType")]
        getter template_type : String?

        def initialize(
          @farm_id : String,
          @priority : Int32,
          @queue_id : String,
          @attachments : Types::Attachments? = nil,
          @client_token : String? = nil,
          @max_failed_tasks_count : Int32? = nil,
          @max_retries_per_task : Int32? = nil,
          @max_worker_count : Int32? = nil,
          @parameters : Hash(String, Types::JobParameter)? = nil,
          @source_job_id : String? = nil,
          @storage_profile_id : String? = nil,
          @target_task_run_status : String? = nil,
          @template : String? = nil,
          @template_type : String? = nil
        )
        end
      end

      struct CreateJobResponse
        include JSON::Serializable

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      struct CreateLicenseEndpointRequest
        include JSON::Serializable

        # The security group IDs.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)

        # The subnet IDs.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)

        # The VPC (virtual private cloud) ID to use with the license endpoint.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @security_group_ids : Array(String),
          @subnet_ids : Array(String),
          @vpc_id : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateLicenseEndpointResponse
        include JSON::Serializable

        # The license endpoint ID.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        def initialize(
          @license_endpoint_id : String
        )
        end
      end

      struct CreateLimitRequest
        include JSON::Serializable

        # The value that you specify as the name in the amounts field of the hostRequirements in a step of a
        # job template to declare the limit requirement.
        @[JSON::Field(key: "amountRequirementName")]
        getter amount_requirement_name : String

        # The display name of the limit. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID of the farm that contains the limit.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of resources constrained by this limit. When all of the resources are in use,
        # steps that require the limit won't be scheduled until the resource is available. The maxCount must
        # not be 0. If the value is -1, there is no restriction on the number of resources that can be
        # acquired for this limit.
        @[JSON::Field(key: "maxCount")]
        getter max_count : Int32

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # A description of the limit. A description helps you identify the purpose of the limit. This field
        # can store any content. Escape or encode this content before displaying it on a webpage or any other
        # system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @amount_requirement_name : String,
          @display_name : String,
          @farm_id : String,
          @max_count : Int32,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateLimitResponse
        include JSON::Serializable

        # A unique identifier for the limit. Use this identifier in other operations, such as
        # CreateQueueLimitAssociation and DeleteLimit .
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        def initialize(
          @limit_id : String
        )
        end
      end

      struct CreateMonitorRequest
        include JSON::Serializable

        # The name that you give the monitor that is displayed in the Deadline Cloud console. This field can
        # store any content. Escape or encode this content before displaying it on a webpage or any other
        # system that might interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The Amazon Resource Name of the IAM Identity Center instance that authenticates monitor users.
        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String

        # The Amazon Resource Name of the IAM role that the monitor uses to connect to Deadline Cloud. Every
        # user that signs in to the monitor using IAM Identity Center uses this role to access Deadline Cloud
        # resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The subdomain to use when creating the monitor URL. The full URL of the monitor is
        # subdomain.Region.deadlinecloud.amazonaws.com.
        @[JSON::Field(key: "subdomain")]
        getter subdomain : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The tags to add to your monitor. Each tag consists of a tag key and a tag value. Tag keys and values
        # are both required, but tag values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @identity_center_instance_arn : String,
          @role_arn : String,
          @subdomain : String,
          @client_token : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateMonitorResponse
        include JSON::Serializable

        # The Amazon Resource Name that IAM Identity Center assigns to the monitor.
        @[JSON::Field(key: "identityCenterApplicationArn")]
        getter identity_center_application_arn : String

        # The unique identifier of the monitor.
        @[JSON::Field(key: "monitorId")]
        getter monitor_id : String

        def initialize(
          @identity_center_application_arn : String,
          @monitor_id : String
        )
        end
      end

      struct CreateQueueEnvironmentRequest
        include JSON::Serializable

        # The farm ID of the farm to connect to the environment.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # Sets the priority of the environments in the queue from 0 to 10,000, where 0 is the highest priority
        # (activated first and deactivated last). If two environments share the same priority value, the
        # environment created first takes higher priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The queue ID to connect the queue and environment.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The environment template to use in the queue.
        @[JSON::Field(key: "template")]
        getter template : String

        # The template's file type, JSON or YAML .
        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        def initialize(
          @farm_id : String,
          @priority : Int32,
          @queue_id : String,
          @template : String,
          @template_type : String,
          @client_token : String? = nil
        )
        end
      end

      struct CreateQueueEnvironmentResponse
        include JSON::Serializable

        # The queue environment ID.
        @[JSON::Field(key: "queueEnvironmentId")]
        getter queue_environment_id : String

        def initialize(
          @queue_environment_id : String
        )
        end
      end

      struct CreateQueueFleetAssociationRequest
        include JSON::Serializable

        # The ID of the farm that the queue and fleet belong to.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @queue_id : String
        )
        end
      end

      struct CreateQueueFleetAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateQueueLimitAssociationRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the queue and limit to associate.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit to associate with the queue.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The unique identifier of the queue to associate with the limit.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @limit_id : String,
          @queue_id : String
        )
        end
      end

      struct CreateQueueLimitAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct CreateQueueRequest
        include JSON::Serializable

        # The display name of the queue. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID of the farm to connect to the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The storage profile IDs to include in the queue.
        @[JSON::Field(key: "allowedStorageProfileIds")]
        getter allowed_storage_profile_ids : Array(String)?

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The default action to take on a queue if a budget isn't configured.
        @[JSON::Field(key: "defaultBudgetAction")]
        getter default_budget_action : String?

        # The description of the queue. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The job attachment settings for the queue. These are the Amazon S3 bucket name and the Amazon S3
        # prefix.
        @[JSON::Field(key: "jobAttachmentSettings")]
        getter job_attachment_settings : Types::JobAttachmentSettings?

        # The jobs in the queue run as the specified POSIX user.
        @[JSON::Field(key: "jobRunAsUser")]
        getter job_run_as_user : Types::JobRunAsUser?

        # The file system location name to include in the queue.
        @[JSON::Field(key: "requiredFileSystemLocationNames")]
        getter required_file_system_location_names : Array(String)?

        # The IAM role ARN that workers will use while running jobs for this queue.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @display_name : String,
          @farm_id : String,
          @allowed_storage_profile_ids : Array(String)? = nil,
          @client_token : String? = nil,
          @default_budget_action : String? = nil,
          @description : String? = nil,
          @job_attachment_settings : Types::JobAttachmentSettings? = nil,
          @job_run_as_user : Types::JobRunAsUser? = nil,
          @required_file_system_location_names : Array(String)? = nil,
          @role_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateQueueResponse
        include JSON::Serializable

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @queue_id : String
        )
        end
      end

      struct CreateStorageProfileRequest
        include JSON::Serializable

        # The display name of the storage profile. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID of the farm to connect to the storage profile.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The type of operating system (OS) for the storage profile.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # File system paths to include in the storage profile.
        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::FileSystemLocation)?

        def initialize(
          @display_name : String,
          @farm_id : String,
          @os_family : String,
          @client_token : String? = nil,
          @file_system_locations : Array(Types::FileSystemLocation)? = nil
        )
        end
      end

      struct CreateStorageProfileResponse
        include JSON::Serializable

        # The storage profile ID.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        def initialize(
          @storage_profile_id : String
        )
        end
      end

      struct CreateWorkerRequest
        include JSON::Serializable

        # The farm ID of the farm to connect to the worker.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID to connect to the worker.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The IP address and host name of the worker.
        @[JSON::Field(key: "hostProperties")]
        getter host_properties : Types::HostPropertiesRequest?

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @client_token : String? = nil,
          @host_properties : Types::HostPropertiesRequest? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateWorkerResponse
        include JSON::Serializable

        # The worker ID.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        def initialize(
          @worker_id : String
        )
        end
      end

      # The configuration details for a customer managed fleet.
      struct CustomerManagedFleetConfiguration
        include JSON::Serializable

        # The Auto Scaling mode for the customer managed fleet.
        @[JSON::Field(key: "mode")]
        getter mode : String

        # The worker capabilities for the customer managed fleet.
        @[JSON::Field(key: "workerCapabilities")]
        getter worker_capabilities : Types::CustomerManagedWorkerCapabilities

        # The storage profile ID for the customer managed fleet.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String?

        # The tag propagation mode for the customer managed fleet.
        @[JSON::Field(key: "tagPropagationMode")]
        getter tag_propagation_mode : String?

        def initialize(
          @mode : String,
          @worker_capabilities : Types::CustomerManagedWorkerCapabilities,
          @storage_profile_id : String? = nil,
          @tag_propagation_mode : String? = nil
        )
        end
      end

      # The worker capabilities for a customer managed workflow.
      struct CustomerManagedWorkerCapabilities
        include JSON::Serializable

        # The CPU architecture type for the customer managed worker capabilities.
        @[JSON::Field(key: "cpuArchitectureType")]
        getter cpu_architecture_type : String

        # The memory (MiB).
        @[JSON::Field(key: "memoryMiB")]
        getter memory_mi_b : Types::MemoryMiBRange

        # The operating system (OS) family.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String

        # The vCPU count for the customer manged worker capabilities.
        @[JSON::Field(key: "vCpuCount")]
        getter v_cpu_count : Types::VCpuCountRange

        # The range of the accelerator.
        @[JSON::Field(key: "acceleratorCount")]
        getter accelerator_count : Types::AcceleratorCountRange?

        # The total memory (MiB) for the customer managed worker capabilities.
        @[JSON::Field(key: "acceleratorTotalMemoryMiB")]
        getter accelerator_total_memory_mi_b : Types::AcceleratorTotalMemoryMiBRange?

        # The accelerator types for the customer managed worker capabilities.
        @[JSON::Field(key: "acceleratorTypes")]
        getter accelerator_types : Array(String)?

        # Custom requirement ranges for customer managed worker capabilities.
        @[JSON::Field(key: "customAmounts")]
        getter custom_amounts : Array(Types::FleetAmountCapability)?

        # Custom attributes for the customer manged worker capabilities.
        @[JSON::Field(key: "customAttributes")]
        getter custom_attributes : Array(Types::FleetAttributeCapability)?

        def initialize(
          @cpu_architecture_type : String,
          @memory_mi_b : Types::MemoryMiBRange,
          @os_family : String,
          @v_cpu_count : Types::VCpuCountRange,
          @accelerator_count : Types::AcceleratorCountRange? = nil,
          @accelerator_total_memory_mi_b : Types::AcceleratorTotalMemoryMiBRange? = nil,
          @accelerator_types : Array(String)? = nil,
          @custom_amounts : Array(Types::FleetAmountCapability)? = nil,
          @custom_attributes : Array(Types::FleetAttributeCapability)? = nil
        )
        end
      end

      # The time stamp in date-time format.
      struct DateTimeFilterExpression
        include JSON::Serializable

        # The date and time.
        @[JSON::Field(key: "dateTime")]
        getter date_time : Time

        # The name of the date-time field to filter on.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of comparison to use to filter the results.
        @[JSON::Field(key: "operator")]
        getter operator : String

        def initialize(
          @date_time : Time,
          @name : String,
          @operator : String
        )
        end
      end

      struct DeleteBudgetRequest
        include JSON::Serializable

        # The budget ID of the budget to delete.
        @[JSON::Field(key: "budgetId")]
        getter budget_id : String

        # The farm ID of the farm to remove from the budget.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        def initialize(
          @budget_id : String,
          @farm_id : String
        )
        end
      end

      struct DeleteBudgetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteFarmRequest
        include JSON::Serializable

        # The farm ID of the farm to delete.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        def initialize(
          @farm_id : String
        )
        end
      end

      struct DeleteFarmResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteFleetRequest
        include JSON::Serializable

        # The farm ID of the farm to remove from the fleet.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the fleet to delete.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteFleetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteLicenseEndpointRequest
        include JSON::Serializable

        # The license endpoint ID of the license endpoint to delete.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        def initialize(
          @license_endpoint_id : String
        )
        end
      end

      struct DeleteLicenseEndpointResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteLimitRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the limit to delete.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit to delete.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        def initialize(
          @farm_id : String,
          @limit_id : String
        )
        end
      end

      struct DeleteLimitResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteMeteredProductRequest
        include JSON::Serializable

        # The ID of the license endpoint from which to remove the metered product.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        # The product ID to remove from the license endpoint.
        @[JSON::Field(key: "productId")]
        getter product_id : String

        def initialize(
          @license_endpoint_id : String,
          @product_id : String
        )
        end
      end

      struct DeleteMeteredProductResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteMonitorRequest
        include JSON::Serializable

        # The unique identifier of the monitor to delete. This ID is returned by the CreateMonitor operation,
        # and is included in the response to the GetMonitor operation.
        @[JSON::Field(key: "monitorId")]
        getter monitor_id : String

        def initialize(
          @monitor_id : String
        )
        end
      end

      struct DeleteMonitorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteQueueEnvironmentRequest
        include JSON::Serializable

        # The farm ID of the farm from which to remove the queue environment.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue environment ID of the queue environment to delete.
        @[JSON::Field(key: "queueEnvironmentId")]
        getter queue_environment_id : String

        # The queue ID of the queue environment to delete.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @queue_environment_id : String,
          @queue_id : String
        )
        end
      end

      struct DeleteQueueEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteQueueFleetAssociationRequest
        include JSON::Serializable

        # The farm ID of the farm that holds the queue-fleet association.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the queue-fleet association.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID of the queue-fleet association.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @queue_id : String
        )
        end
      end

      struct DeleteQueueFleetAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteQueueLimitAssociationRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the queue and limit to disassociate.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit to disassociate.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The unique identifier of the queue to disassociate.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @limit_id : String,
          @queue_id : String
        )
        end
      end

      struct DeleteQueueLimitAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteQueueRequest
        include JSON::Serializable

        # The ID of the farm from which to remove the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID of the queue to delete.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @queue_id : String
        )
        end
      end

      struct DeleteQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteStorageProfileRequest
        include JSON::Serializable

        # The farm ID of the farm from which to remove the storage profile.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The storage profile ID of the storage profile to delete.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        def initialize(
          @farm_id : String,
          @storage_profile_id : String
        )
        end
      end

      struct DeleteStorageProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteWorkerRequest
        include JSON::Serializable

        # The farm ID of the worker to delete.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the worker to delete.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The worker ID of the worker to delete.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @worker_id : String
        )
        end
      end

      struct DeleteWorkerResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The number of dependencies for the consumer.
      struct DependencyCounts
        include JSON::Serializable

        # The number of consumers resolved.
        @[JSON::Field(key: "consumersResolved")]
        getter consumers_resolved : Int32

        # The number of unresolved consumers.
        @[JSON::Field(key: "consumersUnresolved")]
        getter consumers_unresolved : Int32

        # The number of resolved dependencies.
        @[JSON::Field(key: "dependenciesResolved")]
        getter dependencies_resolved : Int32

        # The number of unresolved dependencies.
        @[JSON::Field(key: "dependenciesUnresolved")]
        getter dependencies_unresolved : Int32

        def initialize(
          @consumers_resolved : Int32,
          @consumers_unresolved : Int32,
          @dependencies_resolved : Int32,
          @dependencies_unresolved : Int32
        )
        end
      end

      struct DisassociateMemberFromFarmRequest
        include JSON::Serializable

        # The farm ID of the farm to disassociate from the member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # A member's principal ID to disassociate from a farm.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        def initialize(
          @farm_id : String,
          @principal_id : String
        )
        end
      end

      struct DisassociateMemberFromFarmResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateMemberFromFleetRequest
        include JSON::Serializable

        # The farm ID of the fleet to disassociate a member from.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the fleet to from which to disassociate a member.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # A member's principal ID to disassociate from a fleet.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @principal_id : String
        )
        end
      end

      struct DisassociateMemberFromFleetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateMemberFromJobRequest
        include JSON::Serializable

        # The farm ID for the job to disassociate from the member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to disassociate from a member in a job.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A member's principal ID to disassociate from a job.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The queue ID connected to a job for which you're disassociating a member.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @job_id : String,
          @principal_id : String,
          @queue_id : String
        )
        end
      end

      struct DisassociateMemberFromJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct DisassociateMemberFromQueueRequest
        include JSON::Serializable

        # The farm ID for the queue to disassociate from a member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # A member's principal ID to disassociate from a queue.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The queue ID of the queue in which you're disassociating from a member.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @principal_id : String,
          @queue_id : String
        )
        end
      end

      struct DisassociateMemberFromQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct Document
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies the EBS volume.
      struct Ec2EbsVolume
        include JSON::Serializable

        # The IOPS per volume.
        @[JSON::Field(key: "iops")]
        getter iops : Int32?

        # The EBS volume size in GiB.
        @[JSON::Field(key: "sizeGiB")]
        getter size_gi_b : Int32?

        # The throughput per volume in MiB.
        @[JSON::Field(key: "throughputMiB")]
        getter throughput_mi_b : Int32?

        def initialize(
          @iops : Int32? = nil,
          @size_gi_b : Int32? = nil,
          @throughput_mi_b : Int32? = nil
        )
        end
      end

      # The details of a specified environment.
      struct EnvironmentDetailsEntity
        include JSON::Serializable

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The schema version in the environment.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The template used for the environment.
        @[JSON::Field(key: "template")]
        getter template : Types::Document

        def initialize(
          @environment_id : String,
          @job_id : String,
          @schema_version : String,
          @template : Types::Document
        )
        end
      end

      # The error details for the environment.
      struct EnvironmentDetailsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The error message detailing the error's cause.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @environment_id : String,
          @job_id : String,
          @message : String
        )
        end
      end

      # The IDs of the job and environment.
      struct EnvironmentDetailsIdentifiers
        include JSON::Serializable

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @environment_id : String,
          @job_id : String
        )
        end
      end

      # The environment ID to use to enter a session action.
      struct EnvironmentEnterSessionActionDefinition
        include JSON::Serializable

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # Defines the environment a session action enters in.
      struct EnvironmentEnterSessionActionDefinitionSummary
        include JSON::Serializable

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # Defines the environment a session action exits from.
      struct EnvironmentExitSessionActionDefinition
        include JSON::Serializable

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # A summary of the environment details for which a session action to exits.
      struct EnvironmentExitSessionActionDefinitionSummary
        include JSON::Serializable

        # The environment ID.
        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @environment_id : String
        )
        end
      end

      # The member of a farm.
      struct FarmMember
        include JSON::Serializable

        # The farm ID of the farm member.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The identity store ID of the farm member.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The farm member's membership level.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The principal ID of the farm member.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The principal type of the farm member.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        def initialize(
          @farm_id : String,
          @identity_store_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end

      # The summary of details for a farm.
      struct FarmSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the farm. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The ARN for the KMS key.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @farm_id : String,
          @kms_key_arn : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The field sorting order and name of the field.
      struct FieldSortExpression
        include JSON::Serializable

        # The name of the field.
        @[JSON::Field(key: "name")]
        getter name : String

        # The sort order for the field.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @name : String,
          @sort_order : String
        )
        end
      end

      # The details of the file system location for the resource.
      struct FileSystemLocation
        include JSON::Serializable

        # The location name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The file path.
        @[JSON::Field(key: "path")]
        getter path : String

        # The type of file.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @path : String,
          @type : String
        )
        end
      end

      # The details of a fixed budget schedule.
      struct FixedBudgetSchedule
        include JSON::Serializable

        # When the budget ends.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # When the budget starts.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        def initialize(
          @end_time : Time,
          @start_time : Time
        )
        end
      end

      # The fleet amount and attribute capabilities.
      struct FleetAmountCapability
        include JSON::Serializable

        # The minimum amount of fleet worker capability.
        @[JSON::Field(key: "min")]
        getter min : Float64

        # The name of the fleet capability.
        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum amount of the fleet worker capability.
        @[JSON::Field(key: "max")]
        getter max : Float64?

        def initialize(
          @min : Float64,
          @name : String,
          @max : Float64? = nil
        )
        end
      end

      # Defines the fleet's capability name, minimum, and maximum.
      struct FleetAttributeCapability
        include JSON::Serializable

        # The name of the fleet attribute capability for the worker.
        @[JSON::Field(key: "name")]
        getter name : String

        # The number of fleet attribute capabilities.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The amounts and attributes of fleets.
      struct FleetCapabilities
        include JSON::Serializable

        # Amount capabilities of the fleet.
        @[JSON::Field(key: "amounts")]
        getter amounts : Array(Types::FleetAmountCapability)?

        # Attribute capabilities of the fleet.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::FleetAttributeCapability)?

        def initialize(
          @amounts : Array(Types::FleetAmountCapability)? = nil,
          @attributes : Array(Types::FleetAttributeCapability)? = nil
        )
        end
      end

      # Fleet configuration details.
      struct FleetConfiguration
        include JSON::Serializable

        # The customer managed fleets within a fleet configuration.
        @[JSON::Field(key: "customerManaged")]
        getter customer_managed : Types::CustomerManagedFleetConfiguration?

        # The service managed Amazon EC2 instances for a fleet configuration.
        @[JSON::Field(key: "serviceManagedEc2")]
        getter service_managed_ec2 : Types::ServiceManagedEc2FleetConfiguration?

        def initialize(
          @customer_managed : Types::CustomerManagedFleetConfiguration? = nil,
          @service_managed_ec2 : Types::ServiceManagedEc2FleetConfiguration? = nil
        )
        end
      end

      # The fleet member.
      struct FleetMember
        include JSON::Serializable

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The identity store ID.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The fleet member's membership level.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The principal ID of the fleet member.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The principal type of the fleet member.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @identity_store_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String
        )
        end
      end

      # The details of a fleet.
      struct FleetSummary
        include JSON::Serializable

        # The configuration details for the fleet.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::FleetConfiguration

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the fleet summary to update. This field can store any content. Escape or encode
        # this content before displaying it on a webpage or any other system that might interpret the content
        # of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The maximum number of workers specified in the fleet.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32

        # The minimum number of workers in the fleet.
        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32

        # The status of the fleet.
        @[JSON::Field(key: "status")]
        getter status : String

        # The number of workers in the fleet summary.
        @[JSON::Field(key: "workerCount")]
        getter worker_count : Int32

        # The Auto Scaling status of a fleet.
        @[JSON::Field(key: "autoScalingStatus")]
        getter auto_scaling_status : String?

        # A message that communicates a suspended status of the fleet.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The target number of workers in a fleet.
        @[JSON::Field(key: "targetWorkerCount")]
        getter target_worker_count : Int32?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @configuration : Types::FleetConfiguration,
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @farm_id : String,
          @fleet_id : String,
          @max_worker_count : Int32,
          @min_worker_count : Int32,
          @status : String,
          @worker_count : Int32,
          @auto_scaling_status : String? = nil,
          @status_message : String? = nil,
          @target_worker_count : Int32? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetBudgetRequest
        include JSON::Serializable

        # The budget ID.
        @[JSON::Field(key: "budgetId")]
        getter budget_id : String

        # The farm ID of the farm connected to the budget.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        def initialize(
          @budget_id : String,
          @farm_id : String
        )
        end
      end

      struct GetBudgetResponse
        include JSON::Serializable

        # The budget actions for the budget.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ResponseBudgetAction)

        # The consumed usage limit for the budget.
        @[JSON::Field(key: "approximateDollarLimit")]
        getter approximate_dollar_limit : Float64

        # The budget ID.
        @[JSON::Field(key: "budgetId")]
        getter budget_id : String

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the budget. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The budget schedule.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::BudgetSchedule

        # The status of the budget. ACTIVE –Get a budget being evaluated. INACTIVE –Get an inactive budget.
        # This can include expired, canceled, or deleted statuses.
        @[JSON::Field(key: "status")]
        getter status : String

        # The resource that the budget is tracking usage for.
        @[JSON::Field(key: "usageTrackingResource")]
        getter usage_tracking_resource : Types::UsageTrackingResource

        # The usages of the budget.
        @[JSON::Field(key: "usages")]
        getter usages : Types::ConsumedUsages

        # The description of the budget. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time the queue stopped.
        @[JSON::Field(key: "queueStoppedAt")]
        getter queue_stopped_at : Time?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @actions : Array(Types::ResponseBudgetAction),
          @approximate_dollar_limit : Float64,
          @budget_id : String,
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @schedule : Types::BudgetSchedule,
          @status : String,
          @usage_tracking_resource : Types::UsageTrackingResource,
          @usages : Types::ConsumedUsages,
          @description : String? = nil,
          @queue_stopped_at : Time? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetFarmRequest
        include JSON::Serializable

        # The farm ID of the farm.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        def initialize(
          @farm_id : String
        )
        end
      end

      struct GetFarmResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the farm. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID of the farm to get.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The description of the farm. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ARN of the KMS key used on the farm.
        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @farm_id : String,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetFleetRequest
        include JSON::Serializable

        # The farm ID of the farm in the fleet.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the fleet to get.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String
        )
        end
      end

      struct GetFleetResponse
        include JSON::Serializable

        # The configuration setting for the fleet.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::FleetConfiguration

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the fleet. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID of the farm in the fleet.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The maximum number of workers specified in the fleet.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32

        # The minimum number of workers specified in the fleet.
        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32

        # The IAM role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The status of the fleet.
        @[JSON::Field(key: "status")]
        getter status : String

        # The number of workers in the fleet.
        @[JSON::Field(key: "workerCount")]
        getter worker_count : Int32

        # The Auto Scaling status of the fleet. Either GROWING , STEADY , or SHRINKING .
        @[JSON::Field(key: "autoScalingStatus")]
        getter auto_scaling_status : String?

        # Outlines what the fleet is capable of for minimums, maximums, and naming, in addition to attribute
        # names and values.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Types::FleetCapabilities?

        # The description of the fleet. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The script that runs as a worker is starting up that you can use to provide additional configuration
        # for workers in your fleet.
        @[JSON::Field(key: "hostConfiguration")]
        getter host_configuration : Types::HostConfiguration?

        # A message that communicates a suspended status of the fleet.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The number of target workers in the fleet.
        @[JSON::Field(key: "targetWorkerCount")]
        getter target_worker_count : Int32?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @configuration : Types::FleetConfiguration,
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @farm_id : String,
          @fleet_id : String,
          @max_worker_count : Int32,
          @min_worker_count : Int32,
          @role_arn : String,
          @status : String,
          @worker_count : Int32,
          @auto_scaling_status : String? = nil,
          @capabilities : Types::FleetCapabilities? = nil,
          @description : String? = nil,
          @host_configuration : Types::HostConfiguration? = nil,
          @status_message : String? = nil,
          @target_worker_count : Int32? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The error for the job entity.
      struct GetJobEntityError
        include JSON::Serializable

        # The environment details for the failed job entity.
        @[JSON::Field(key: "environmentDetails")]
        getter environment_details : Types::EnvironmentDetailsError?

        # The job attachment details for the failed job entity.
        @[JSON::Field(key: "jobAttachmentDetails")]
        getter job_attachment_details : Types::JobAttachmentDetailsError?

        # The job details for the failed job entity.
        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::JobDetailsError?

        # The step details for the failed job entity.
        @[JSON::Field(key: "stepDetails")]
        getter step_details : Types::StepDetailsError?

        def initialize(
          @environment_details : Types::EnvironmentDetailsError? = nil,
          @job_attachment_details : Types::JobAttachmentDetailsError? = nil,
          @job_details : Types::JobDetailsError? = nil,
          @step_details : Types::StepDetailsError? = nil
        )
        end
      end

      struct GetJobRequest
        include JSON::Serializable

        # The farm ID of the farm in the job.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID associated with the job.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String
        )
        end
      end

      struct GetJobResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The life cycle status for the job.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # A message that communicates the status of the life cycle for the job.
        @[JSON::Field(key: "lifecycleStatusMessage")]
        getter lifecycle_status_message : String

        # The name of the job.
        @[JSON::Field(key: "name")]
        getter name : String

        # The job priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The attachments for the job.
        @[JSON::Field(key: "attachments")]
        getter attachments : Types::Attachments?

        # The description of the job. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The number of task failures before the job stops running and is marked as FAILED .
        @[JSON::Field(key: "maxFailedTasksCount")]
        getter max_failed_tasks_count : Int32?

        # The maximum number of retries per failed tasks.
        @[JSON::Field(key: "maxRetriesPerTask")]
        getter max_retries_per_task : Int32?

        # The maximum number of worker hosts that can concurrently process a job. When the maxWorkerCount is
        # reached, no more workers will be assigned to process the job, even if the fleets assigned to the
        # job's queue has available workers. If you don't set the maxWorkerCount when you create a job, this
        # value is not returned in the response.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The parameters for the job.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::JobParameter)?

        # The job ID for the source job.
        @[JSON::Field(key: "sourceJobId")]
        getter source_job_id : String?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The storage profile ID associated with the job.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String?

        # The task status with which the job started.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The total number of times tasks from the job failed and were retried.
        @[JSON::Field(key: "taskFailureRetryCount")]
        getter task_failure_retry_count : Int32?

        # The task run status for the job.
        @[JSON::Field(key: "taskRunStatus")]
        getter task_run_status : String?

        # The number of tasks running on the job.
        @[JSON::Field(key: "taskRunStatusCounts")]
        getter task_run_status_counts : Hash(String, Int32)?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @job_id : String,
          @lifecycle_status : String,
          @lifecycle_status_message : String,
          @name : String,
          @priority : Int32,
          @attachments : Types::Attachments? = nil,
          @description : String? = nil,
          @ended_at : Time? = nil,
          @max_failed_tasks_count : Int32? = nil,
          @max_retries_per_task : Int32? = nil,
          @max_worker_count : Int32? = nil,
          @parameters : Hash(String, Types::JobParameter)? = nil,
          @source_job_id : String? = nil,
          @started_at : Time? = nil,
          @storage_profile_id : String? = nil,
          @target_task_run_status : String? = nil,
          @task_failure_retry_count : Int32? = nil,
          @task_run_status : String? = nil,
          @task_run_status_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetLicenseEndpointRequest
        include JSON::Serializable

        # The license endpoint ID.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        def initialize(
          @license_endpoint_id : String
        )
        end
      end

      struct GetLicenseEndpointResponse
        include JSON::Serializable

        # The license endpoint ID.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        # The status of the license endpoint.
        @[JSON::Field(key: "status")]
        getter status : String

        # The status message of the license endpoint.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String

        # The DNS name.
        @[JSON::Field(key: "dnsName")]
        getter dns_name : String?

        # The security group IDs for the license endpoint.
        @[JSON::Field(key: "securityGroupIds")]
        getter security_group_ids : Array(String)?

        # The subnet IDs.
        @[JSON::Field(key: "subnetIds")]
        getter subnet_ids : Array(String)?

        # The VPC (virtual private cloud) ID associated with the license endpoint.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @license_endpoint_id : String,
          @status : String,
          @status_message : String,
          @dns_name : String? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      struct GetLimitRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the limit.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit to return.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        def initialize(
          @farm_id : String,
          @limit_id : String
        )
        end
      end

      struct GetLimitResponse
        include JSON::Serializable

        # The value that you specify as the name in the amounts field of the hostRequirements in a step of a
        # job template to declare the limit requirement.
        @[JSON::Field(key: "amountRequirementName")]
        getter amount_requirement_name : String

        # The Unix timestamp of the date and time that the limit was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user identifier of the person that created the limit.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The number of resources from the limit that are being used by jobs. The result is delayed and may
        # not be the count at the time that you called the operation.
        @[JSON::Field(key: "currentCount")]
        getter current_count : Int32

        # The display name of the limit. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The unique identifier of the farm that contains the limit.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The maximum number of resources constrained by this limit. When all of the resources are in use,
        # steps that require the limit won't be scheduled until the resource is available. The maxValue must
        # not be 0. If the value is -1, there is no restriction on the number of resources that can be
        # acquired for this limit.
        @[JSON::Field(key: "maxCount")]
        getter max_count : Int32

        # The description of the limit that helps identify what the limit is used for. This field can store
        # any content. Escape or encode this content before displaying it on a webpage or any other system
        # that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Unix timestamp of the date and time that the limit was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user identifier of the person that last updated the limit.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @amount_requirement_name : String,
          @created_at : Time,
          @created_by : String,
          @current_count : Int32,
          @display_name : String,
          @farm_id : String,
          @limit_id : String,
          @max_count : Int32,
          @description : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetMonitorRequest
        include JSON::Serializable

        # The unique identifier for the monitor. This ID is returned by the CreateMonitor operation.
        @[JSON::Field(key: "monitorId")]
        getter monitor_id : String

        def initialize(
          @monitor_id : String
        )
        end
      end

      struct GetMonitorResponse
        include JSON::Serializable

        # The UNIX timestamp of the date and time that the monitor was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user name of the person that created the monitor.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The name used to identify the monitor on the Deadline Cloud console. This field can store any
        # content. Escape or encode this content before displaying it on a webpage or any other system that
        # might interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The Amazon Resource Name that the IAM Identity Center assigned to the monitor when it was created.
        @[JSON::Field(key: "identityCenterApplicationArn")]
        getter identity_center_application_arn : String

        # The Amazon Resource Name of the IAM Identity Center instance responsible for authenticating monitor
        # users.
        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String

        # The unique identifier for the monitor.
        @[JSON::Field(key: "monitorId")]
        getter monitor_id : String

        # The Amazon Resource Name of the IAM role for the monitor. Users of the monitor use this role to
        # access Deadline Cloud resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The subdomain used for the monitor URL. The full URL of the monitor is
        # subdomain.Region.deadlinecloud.amazonaws.com.
        @[JSON::Field(key: "subdomain")]
        getter subdomain : String

        # The complete URL of the monitor. The full URL of the monitor is
        # subdomain.Region.deadlinecloud.amazonaws.com.
        @[JSON::Field(key: "url")]
        getter url : String

        # The UNIX timestamp of the last date and time that the monitor was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user name of the person that last updated the monitor.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @identity_center_application_arn : String,
          @identity_center_instance_arn : String,
          @monitor_id : String,
          @role_arn : String,
          @subdomain : String,
          @url : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetQueueEnvironmentRequest
        include JSON::Serializable

        # The farm ID for the queue environment.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue environment ID.
        @[JSON::Field(key: "queueEnvironmentId")]
        getter queue_environment_id : String

        # The queue ID for the queue environment.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @queue_environment_id : String,
          @queue_id : String
        )
        end
      end

      struct GetQueueEnvironmentResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.&gt;
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The name of the queue environment.
        @[JSON::Field(key: "name")]
        getter name : String

        # The priority of the queue environment.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The queue environment ID.
        @[JSON::Field(key: "queueEnvironmentId")]
        getter queue_environment_id : String

        # The template for the queue environment.
        @[JSON::Field(key: "template")]
        getter template : String

        # The type of template for the queue environment.
        @[JSON::Field(key: "templateType")]
        getter template_type : String

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @name : String,
          @priority : Int32,
          @queue_environment_id : String,
          @template : String,
          @template_type : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetQueueFleetAssociationRequest
        include JSON::Serializable

        # The farm ID of the farm that contains the queue-fleet association.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID for the queue-fleet association.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID for the queue-fleet association.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @queue_id : String
        )
        end
      end

      struct GetQueueFleetAssociationResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The fleet ID for the queue-fleet association.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID for the queue-fleet association.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The status of the queue-fleet association.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @fleet_id : String,
          @queue_id : String,
          @status : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetQueueLimitAssociationRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the associated queue and limit.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit associated with the queue.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The unique identifier of the queue associated with the limit.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @limit_id : String,
          @queue_id : String
        )
        end
      end

      struct GetQueueLimitAssociationResponse
        include JSON::Serializable

        # The Unix timestamp of the date and time that the association was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user identifier of the person that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the limit associated with the queue.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The unique identifier of the queue associated with the limit.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The current status of the limit.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp of the date and time that the association was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user identifier of the person that last updated the association.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @limit_id : String,
          @queue_id : String,
          @status : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetQueueRequest
        include JSON::Serializable

        # The farm ID of the farm in the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID for the queue to retrieve.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @queue_id : String
        )
        end
      end

      struct GetQueueResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The default action taken on a queue if a budget wasn't configured.
        @[JSON::Field(key: "defaultBudgetAction")]
        getter default_budget_action : String

        # The display name of the queue. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID for the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The status of the queue. ACTIVE –The queue is active. SCHEDULING –The queue is scheduling.
        # SCHEDULING_BLOCKED –The queue scheduling is blocked. See the provided reason.
        @[JSON::Field(key: "status")]
        getter status : String

        # The storage profile IDs for the queue.
        @[JSON::Field(key: "allowedStorageProfileIds")]
        getter allowed_storage_profile_ids : Array(String)?

        # The reason the queue was blocked.
        @[JSON::Field(key: "blockedReason")]
        getter blocked_reason : String?

        # The description of the queue. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The job attachment settings for the queue.
        @[JSON::Field(key: "jobAttachmentSettings")]
        getter job_attachment_settings : Types::JobAttachmentSettings?

        # The jobs in the queue ran as this specified POSIX user.
        @[JSON::Field(key: "jobRunAsUser")]
        getter job_run_as_user : Types::JobRunAsUser?

        # A list of the required file system location names in the queue.
        @[JSON::Field(key: "requiredFileSystemLocationNames")]
        getter required_file_system_location_names : Array(String)?

        # The IAM role ARN.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @default_budget_action : String,
          @display_name : String,
          @farm_id : String,
          @queue_id : String,
          @status : String,
          @allowed_storage_profile_ids : Array(String)? = nil,
          @blocked_reason : String? = nil,
          @description : String? = nil,
          @job_attachment_settings : Types::JobAttachmentSettings? = nil,
          @job_run_as_user : Types::JobRunAsUser? = nil,
          @required_file_system_location_names : Array(String)? = nil,
          @role_arn : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetSessionActionRequest
        include JSON::Serializable

        # The farm ID for the session action.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the session.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the session action.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The session action ID for the session.
        @[JSON::Field(key: "sessionActionId")]
        getter session_action_id : String

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @session_action_id : String
        )
        end
      end

      struct GetSessionActionResponse
        include JSON::Serializable

        # The session action definition.
        @[JSON::Field(key: "definition")]
        getter definition : Types::SessionActionDefinition

        # The session action ID.
        @[JSON::Field(key: "sessionActionId")]
        getter session_action_id : String

        # The session ID for the session action.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The status of the session action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The limits and their amounts acquired during a session action. If no limits were acquired during the
        # session, this field isn't returned.
        @[JSON::Field(key: "acquiredLimits")]
        getter acquired_limits : Array(Types::AcquiredLimit)?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The list of manifest properties that describe file attachments for the task run.
        @[JSON::Field(key: "manifests")]
        getter manifests : Array(Types::TaskRunManifestPropertiesResponse)?

        # The process exit code. The default Deadline Cloud worker agent converts unsigned 32-bit exit codes
        # to signed 32-bit exit codes.
        @[JSON::Field(key: "processExitCode")]
        getter process_exit_code : Int32?

        # The message that communicates the progress of the session action.
        @[JSON::Field(key: "progressMessage")]
        getter progress_message : String?

        # The percentage completed for a session action.
        @[JSON::Field(key: "progressPercent")]
        getter progress_percent : Float64?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The Linux timestamp of the date and time the session action was last updated.
        @[JSON::Field(key: "workerUpdatedAt")]
        getter worker_updated_at : Time?

        def initialize(
          @definition : Types::SessionActionDefinition,
          @session_action_id : String,
          @session_id : String,
          @status : String,
          @acquired_limits : Array(Types::AcquiredLimit)? = nil,
          @ended_at : Time? = nil,
          @manifests : Array(Types::TaskRunManifestPropertiesResponse)? = nil,
          @process_exit_code : Int32? = nil,
          @progress_message : String? = nil,
          @progress_percent : Float64? = nil,
          @started_at : Time? = nil,
          @worker_updated_at : Time? = nil
        )
        end
      end

      struct GetSessionRequest
        include JSON::Serializable

        # The farm ID for the session.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the session.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the session.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The session ID.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @session_id : String
        )
        end
      end

      struct GetSessionResponse
        include JSON::Serializable

        # The fleet ID for the session.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The life cycle status of the session.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # The session log.
        @[JSON::Field(key: "log")]
        getter log : Types::LogConfiguration

        # The session ID.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The worker ID for the session.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # Provides the Amazon EC2 properties of the host.
        @[JSON::Field(key: "hostProperties")]
        getter host_properties : Types::HostPropertiesResponse?

        # The life cycle status with which the session started.
        @[JSON::Field(key: "targetLifecycleStatus")]
        getter target_lifecycle_status : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The worker log for the session.
        @[JSON::Field(key: "workerLog")]
        getter worker_log : Types::LogConfiguration?

        def initialize(
          @fleet_id : String,
          @lifecycle_status : String,
          @log : Types::LogConfiguration,
          @session_id : String,
          @started_at : Time,
          @worker_id : String,
          @ended_at : Time? = nil,
          @host_properties : Types::HostPropertiesResponse? = nil,
          @target_lifecycle_status : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @worker_log : Types::LogConfiguration? = nil
        )
        end
      end

      struct GetSessionsStatisticsAggregationRequest
        include JSON::Serializable

        # The identifier returned by the StartSessionsStatisticsAggregation operation that identifies the
        # aggregated statistics.
        @[JSON::Field(key: "aggregationId")]
        getter aggregation_id : String

        # The identifier of the farm to include in the statistics. This should be the same as the farm ID used
        # in the call to the StartSessionsStatisticsAggregation operation.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @aggregation_id : String,
          @farm_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct GetSessionsStatisticsAggregationResponse
        include JSON::Serializable

        # The status of the aggregated results. An aggregation may fail or time out if the results are too
        # large. If this happens, you can call the StartSessionsStatisticsAggregation operation after you
        # reduce the aggregation time frame, reduce the number of queues or fleets in the aggregation, or
        # increase the period length. If you call the StartSessionsStatisticsAggregation operation when the
        # status is IN_PROGRESS , you will receive a ThrottlingException .
        @[JSON::Field(key: "status")]
        getter status : String

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The statistics for the specified fleets or queues.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(Types::Statistics)?

        # A message that describes the status.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @status : String,
          @next_token : String? = nil,
          @statistics : Array(Types::Statistics)? = nil,
          @status_message : String? = nil
        )
        end
      end

      struct GetStepRequest
        include JSON::Serializable

        # The farm ID for the step.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the step.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the step.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String
        )
        end
      end

      struct GetStepResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The life cycle status of the step.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # The name of the step.
        @[JSON::Field(key: "name")]
        getter name : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The task run status for the job.
        @[JSON::Field(key: "taskRunStatus")]
        getter task_run_status : String

        # The number of tasks running on the job.
        @[JSON::Field(key: "taskRunStatusCounts")]
        getter task_run_status_counts : Hash(String, Int32)

        # The number of dependencies in the step.
        @[JSON::Field(key: "dependencyCounts")]
        getter dependency_counts : Types::DependencyCounts?

        # The description of the step. This field can store any content. Escape or encode this content before
        # displaying it on a webpage or any other system that might interpret the content of this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # A message that describes the lifecycle status of the step.
        @[JSON::Field(key: "lifecycleStatusMessage")]
        getter lifecycle_status_message : String?

        # A list of step parameters and the combination expression for the step.
        @[JSON::Field(key: "parameterSpace")]
        getter parameter_space : Types::ParameterSpace?

        # The required capabilities of the step.
        @[JSON::Field(key: "requiredCapabilities")]
        getter required_capabilities : Types::StepRequiredCapabilities?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The task status with which the job started.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The total number of times tasks from the step failed and were retried.
        @[JSON::Field(key: "taskFailureRetryCount")]
        getter task_failure_retry_count : Int32?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @lifecycle_status : String,
          @name : String,
          @step_id : String,
          @task_run_status : String,
          @task_run_status_counts : Hash(String, Int32),
          @dependency_counts : Types::DependencyCounts? = nil,
          @description : String? = nil,
          @ended_at : Time? = nil,
          @lifecycle_status_message : String? = nil,
          @parameter_space : Types::ParameterSpace? = nil,
          @required_capabilities : Types::StepRequiredCapabilities? = nil,
          @started_at : Time? = nil,
          @target_task_run_status : String? = nil,
          @task_failure_retry_count : Int32? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetStorageProfileForQueueRequest
        include JSON::Serializable

        # The farm ID for the queue in storage profile.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID the queue in the storage profile.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The storage profile ID for the storage profile in the queue.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        def initialize(
          @farm_id : String,
          @queue_id : String,
          @storage_profile_id : String
        )
        end
      end

      struct GetStorageProfileForQueueResponse
        include JSON::Serializable

        # The display name of the storage profile connected to a queue. This field can store any content.
        # Escape or encode this content before displaying it on a webpage or any other system that might
        # interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The operating system of the storage profile in the queue.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String

        # The storage profile ID.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        # The location of the files for the storage profile within the queue.
        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::FileSystemLocation)?

        def initialize(
          @display_name : String,
          @os_family : String,
          @storage_profile_id : String,
          @file_system_locations : Array(Types::FileSystemLocation)? = nil
        )
        end
      end

      struct GetStorageProfileRequest
        include JSON::Serializable

        # The farm ID for the storage profile.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The storage profile ID.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        def initialize(
          @farm_id : String,
          @storage_profile_id : String
        )
        end
      end

      struct GetStorageProfileResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The display name of the storage profile. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The operating system (OS) for the storage profile.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String

        # The storage profile ID.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        # The location of the files for the storage profile.
        @[JSON::Field(key: "fileSystemLocations")]
        getter file_system_locations : Array(Types::FileSystemLocation)?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @os_family : String,
          @storage_profile_id : String,
          @file_system_locations : Array(Types::FileSystemLocation)? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetTaskRequest
        include JSON::Serializable

        # The farm ID of the farm connected to the task.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID of the job connected to the task.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the queue connected to the task.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID for the step connected to the task.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String,
          @task_id : String
        )
        end
      end

      struct GetTaskResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The run status for the task.
        @[JSON::Field(key: "runStatus")]
        getter run_status : String

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The number of times that the task failed and was retried.
        @[JSON::Field(key: "failureRetryCount")]
        getter failure_retry_count : Int32?

        # The latest session action ID for the task.
        @[JSON::Field(key: "latestSessionActionId")]
        getter latest_session_action_id : String?

        # The parameters for the task.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TaskParameterValue)?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The run status with which to start the task.
        @[JSON::Field(key: "targetRunStatus")]
        getter target_run_status : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @run_status : String,
          @task_id : String,
          @ended_at : Time? = nil,
          @failure_retry_count : Int32? = nil,
          @latest_session_action_id : String? = nil,
          @parameters : Hash(String, Types::TaskParameterValue)? = nil,
          @started_at : Time? = nil,
          @target_run_status : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct GetWorkerRequest
        include JSON::Serializable

        # The farm ID for the worker.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the worker.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The worker ID.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @worker_id : String
        )
        end
      end

      struct GetWorkerResponse
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The status of the worker.
        @[JSON::Field(key: "status")]
        getter status : String

        # The worker ID.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The host properties for the worker.
        @[JSON::Field(key: "hostProperties")]
        getter host_properties : Types::HostPropertiesResponse?

        # The logs for the associated worker.
        @[JSON::Field(key: "log")]
        getter log : Types::LogConfiguration?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @farm_id : String,
          @fleet_id : String,
          @status : String,
          @worker_id : String,
          @host_properties : Types::HostPropertiesResponse? = nil,
          @log : Types::LogConfiguration? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Provides a script that runs as a worker is starting up that you can use to provide additional
      # configuration for workers in your fleet. To remove a script from a fleet, use the UpdateFleet
      # operation with the hostConfiguration scriptBody parameter set to an empty string ("").
      struct HostConfiguration
        include JSON::Serializable

        # The text of the script that runs as a worker is starting up that you can use to provide additional
        # configuration for workers in your fleet. The script runs after a worker enters the STARTING state
        # and before the worker processes tasks. For more information about using the script, see Run scripts
        # as an administrator to configure workers in the Deadline Cloud Developer Guide . The script runs as
        # an administrative user ( sudo root on Linux, as an Administrator on Windows).
        @[JSON::Field(key: "scriptBody")]
        getter script_body : String

        # The maximum time that the host configuration can run. If the timeout expires, the worker enters the
        # NOT RESPONDING state and shuts down. You are charged for the time that the worker is running the
        # host configuration script. You should configure your fleet for a maximum of one worker while testing
        # your host configuration script to avoid starting additional workers. The default is 300 seconds (5
        # minutes).
        @[JSON::Field(key: "scriptTimeoutSeconds")]
        getter script_timeout_seconds : Int32?

        def initialize(
          @script_body : String,
          @script_timeout_seconds : Int32? = nil
        )
        end
      end

      # The host property details.
      struct HostPropertiesRequest
        include JSON::Serializable

        # The host name.
        @[JSON::Field(key: "hostName")]
        getter host_name : String?

        # The IP address of the host.
        @[JSON::Field(key: "ipAddresses")]
        getter ip_addresses : Types::IpAddresses?

        def initialize(
          @host_name : String? = nil,
          @ip_addresses : Types::IpAddresses? = nil
        )
        end
      end

      # The host property details.
      struct HostPropertiesResponse
        include JSON::Serializable

        # The ARN of the host EC2 instance.
        @[JSON::Field(key: "ec2InstanceArn")]
        getter ec2_instance_arn : String?

        # The instance type of the host EC2 instance.
        @[JSON::Field(key: "ec2InstanceType")]
        getter ec2_instance_type : String?

        # The host name.
        @[JSON::Field(key: "hostName")]
        getter host_name : String?

        # The IP address of the host.
        @[JSON::Field(key: "ipAddresses")]
        getter ip_addresses : Types::IpAddresses?

        def initialize(
          @ec2_instance_arn : String? = nil,
          @ec2_instance_type : String? = nil,
          @host_name : String? = nil,
          @ip_addresses : Types::IpAddresses? = nil
        )
        end
      end

      # Deadline Cloud can't process your request right now. Try again later.
      struct InternalServerErrorException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The number of seconds a client should wait before retrying the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        def initialize(
          @message : String,
          @retry_after_seconds : Int32? = nil
        )
        end
      end

      # The IP addresses for a host.
      struct IpAddresses
        include JSON::Serializable

        # The IpV4 address of the network.
        @[JSON::Field(key: "ipV4Addresses")]
        getter ip_v4_addresses : Array(String)?

        # The IpV6 address for the network and node component.
        @[JSON::Field(key: "ipV6Addresses")]
        getter ip_v6_addresses : Array(String)?

        def initialize(
          @ip_v4_addresses : Array(String)? = nil,
          @ip_v6_addresses : Array(String)? = nil
        )
        end
      end

      # The job attachments.
      struct JobAttachmentDetailsEntity
        include JSON::Serializable

        # The job attachments.
        @[JSON::Field(key: "attachments")]
        getter attachments : Types::Attachments

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @attachments : Types::Attachments,
          @job_id : String
        )
        end
      end

      # The error details for job attachments.
      struct JobAttachmentDetailsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The error message detailing the error's cause.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @job_id : String,
          @message : String
        )
        end
      end

      # Identifier details for job attachments.
      struct JobAttachmentDetailsIdentifiers
        include JSON::Serializable

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # The job attachment settings. These are the Amazon S3 bucket name and the Amazon S3 prefix.
      struct JobAttachmentSettings
        include JSON::Serializable

        # The root prefix.
        @[JSON::Field(key: "rootPrefix")]
        getter root_prefix : String

        # The Amazon S3 bucket name.
        @[JSON::Field(key: "s3BucketName")]
        getter s3_bucket_name : String

        def initialize(
          @root_prefix : String,
          @s3_bucket_name : String
        )
        end
      end

      # The job details for a specific job.
      struct JobDetailsEntity
        include JSON::Serializable

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The log group name.
        @[JSON::Field(key: "logGroupName")]
        getter log_group_name : String

        # The schema version.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The job attachment settings.
        @[JSON::Field(key: "jobAttachmentSettings")]
        getter job_attachment_settings : Types::JobAttachmentSettings?

        # The user name and group that the job uses when run.
        @[JSON::Field(key: "jobRunAsUser")]
        getter job_run_as_user : Types::JobRunAsUser?

        # The parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::JobParameter)?

        # The path mapping rules.
        @[JSON::Field(key: "pathMappingRules")]
        getter path_mapping_rules : Array(Types::PathMappingRule)?

        # The queue role ARN.
        @[JSON::Field(key: "queueRoleArn")]
        getter queue_role_arn : String?

        def initialize(
          @job_id : String,
          @log_group_name : String,
          @schema_version : String,
          @job_attachment_settings : Types::JobAttachmentSettings? = nil,
          @job_run_as_user : Types::JobRunAsUser? = nil,
          @parameters : Hash(String, Types::JobParameter)? = nil,
          @path_mapping_rules : Array(Types::PathMappingRule)? = nil,
          @queue_role_arn : String? = nil
        )
        end
      end

      # The details of a job error.
      struct JobDetailsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The error message detailing the error's cause.
        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @code : String,
          @job_id : String,
          @message : String
        )
        end
      end

      # The identifiers for a job.
      struct JobDetailsIdentifiers
        include JSON::Serializable

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # The details of a job entity.
      struct JobEntity
        include JSON::Serializable

        # The environment details for the job entity.
        @[JSON::Field(key: "environmentDetails")]
        getter environment_details : Types::EnvironmentDetailsEntity?

        # The job attachment details.
        @[JSON::Field(key: "jobAttachmentDetails")]
        getter job_attachment_details : Types::JobAttachmentDetailsEntity?

        # The job details.
        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::JobDetailsEntity?

        # The step details.
        @[JSON::Field(key: "stepDetails")]
        getter step_details : Types::StepDetailsEntity?

        def initialize(
          @environment_details : Types::EnvironmentDetailsEntity? = nil,
          @job_attachment_details : Types::JobAttachmentDetailsEntity? = nil,
          @job_details : Types::JobDetailsEntity? = nil,
          @step_details : Types::StepDetailsEntity? = nil
        )
        end
      end

      # The details of a job entity identifier.
      struct JobEntityIdentifiersUnion
        include JSON::Serializable

        # The environment details.
        @[JSON::Field(key: "environmentDetails")]
        getter environment_details : Types::EnvironmentDetailsIdentifiers?

        # The job attachment details.
        @[JSON::Field(key: "jobAttachmentDetails")]
        getter job_attachment_details : Types::JobAttachmentDetailsIdentifiers?

        # The job details.
        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::JobDetailsIdentifiers?

        # The step details.
        @[JSON::Field(key: "stepDetails")]
        getter step_details : Types::StepDetailsIdentifiers?

        def initialize(
          @environment_details : Types::EnvironmentDetailsIdentifiers? = nil,
          @job_attachment_details : Types::JobAttachmentDetailsIdentifiers? = nil,
          @job_details : Types::JobDetailsIdentifiers? = nil,
          @step_details : Types::StepDetailsIdentifiers? = nil
        )
        end
      end

      # The details for a job member.
      struct JobMember
        include JSON::Serializable

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The identity store ID.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The job member's membership level.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The principal ID of the job member.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The principal type of the job member.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @identity_store_id : String,
          @job_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String,
          @queue_id : String
        )
        end
      end

      # The details of job parameters.
      struct JobParameter
        include JSON::Serializable

        # A double precision IEEE-754 floating point number represented as a string.
        @[JSON::Field(key: "float")]
        getter float : String?

        # A signed integer represented as a string.
        @[JSON::Field(key: "int")]
        getter int : String?

        # A file system path represented as a string.
        @[JSON::Field(key: "path")]
        getter path : String?

        # A UTF-8 string.
        @[JSON::Field(key: "string")]
        getter string : String?

        def initialize(
          @float : String? = nil,
          @int : String? = nil,
          @path : String? = nil,
          @string : String? = nil
        )
        end
      end

      struct JobParameterDefinition
        include JSON::Serializable

        def initialize
        end
      end

      # Identifies the user for a job.
      struct JobRunAsUser
        include JSON::Serializable

        # Specifies whether the job should run using the queue's system user or if the job should run using
        # the worker agent system user.
        @[JSON::Field(key: "runAs")]
        getter run_as : String

        # The user and group that the jobs in the queue run as.
        @[JSON::Field(key: "posix")]
        getter posix : Types::PosixUser?

        # Identifies a Microsoft Windows user.
        @[JSON::Field(key: "windows")]
        getter windows : Types::WindowsUser?

        def initialize(
          @run_as : String,
          @posix : Types::PosixUser? = nil,
          @windows : Types::WindowsUser? = nil
        )
        end
      end

      # The details of a job search.
      struct JobSearchSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The job parameters.
        @[JSON::Field(key: "jobParameters")]
        getter job_parameters : Hash(String, Types::JobParameter)?

        # The life cycle status.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String?

        # The life cycle status message.
        @[JSON::Field(key: "lifecycleStatusMessage")]
        getter lifecycle_status_message : String?

        # The number of task failures before the job stops running and is marked as FAILED .
        @[JSON::Field(key: "maxFailedTasksCount")]
        getter max_failed_tasks_count : Int32?

        # The maximum number of retries for a job.
        @[JSON::Field(key: "maxRetriesPerTask")]
        getter max_retries_per_task : Int32?

        # The maximum number of worker hosts that can concurrently process a job. When the maxWorkerCount is
        # reached, no more workers will be assigned to process the job, even if the fleets assigned to the
        # job's queue has available workers. You can't set the maxWorkerCount to 0. If you set it to -1, there
        # is no maximum number of workers. If you don't specify the maxWorkerCount , the default is -1.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The job name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The job priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        # The job ID for the source job.
        @[JSON::Field(key: "sourceJobId")]
        getter source_job_id : String?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The task status to update the job's tasks to.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The total number of times tasks from the job failed and were retried.
        @[JSON::Field(key: "taskFailureRetryCount")]
        getter task_failure_retry_count : Int32?

        # The task run status for the job. PENDING –pending and waiting for resources. READY –ready to be
        # processed. ASSIGNED –assigned and will run next on a worker. SCHEDULED –scheduled to be run on a
        # worker. INTERRUPTING –being interrupted. RUNNING –running on a worker. SUSPENDED –the task is
        # suspended. CANCELED –the task has been canceled. FAILED –the task has failed. SUCCEEDED –the task
        # has succeeded.
        @[JSON::Field(key: "taskRunStatus")]
        getter task_run_status : String?

        # The number of tasks running on the job.
        @[JSON::Field(key: "taskRunStatusCounts")]
        getter task_run_status_counts : Hash(String, Int32)?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @ended_at : Time? = nil,
          @job_id : String? = nil,
          @job_parameters : Hash(String, Types::JobParameter)? = nil,
          @lifecycle_status : String? = nil,
          @lifecycle_status_message : String? = nil,
          @max_failed_tasks_count : Int32? = nil,
          @max_retries_per_task : Int32? = nil,
          @max_worker_count : Int32? = nil,
          @name : String? = nil,
          @priority : Int32? = nil,
          @queue_id : String? = nil,
          @source_job_id : String? = nil,
          @started_at : Time? = nil,
          @target_task_run_status : String? = nil,
          @task_failure_retry_count : Int32? = nil,
          @task_run_status : String? = nil,
          @task_run_status_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # A summary of job details.
      struct JobSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The life cycle status.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # The life cycle status message.
        @[JSON::Field(key: "lifecycleStatusMessage")]
        getter lifecycle_status_message : String

        # The job name.
        @[JSON::Field(key: "name")]
        getter name : String

        # The job priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The number of task failures before the job stops running and is marked as FAILED .
        @[JSON::Field(key: "maxFailedTasksCount")]
        getter max_failed_tasks_count : Int32?

        # The maximum number of retries for a job.
        @[JSON::Field(key: "maxRetriesPerTask")]
        getter max_retries_per_task : Int32?

        # The maximum number of worker hosts that can concurrently process a job. When the maxWorkerCount is
        # reached, no more workers will be assigned to process the job, even if the fleets assigned to the
        # job's queue has available workers. You can't set the maxWorkerCount to 0. If you set it to -1, there
        # is no maximum number of workers. If you don't specify the maxWorkerCount , the default is -1.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The job ID for the source job.
        @[JSON::Field(key: "sourceJobId")]
        getter source_job_id : String?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The task status to update the job's tasks to.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The total number of times tasks from the job failed and were retried.
        @[JSON::Field(key: "taskFailureRetryCount")]
        getter task_failure_retry_count : Int32?

        # The task run status for the job. PENDING –pending and waiting for resources. READY –ready to be
        # processed. ASSIGNED –assigned and will run next on a worker. SCHEDULED –scheduled to be run on a
        # worker. INTERRUPTING –being interrupted. RUNNING –running on a worker. SUSPENDED –the task is
        # suspended. CANCELED –the task has been canceled. FAILED –the task has failed. SUCCEEDED –the task
        # has succeeded.
        @[JSON::Field(key: "taskRunStatus")]
        getter task_run_status : String?

        # The number of tasks running on the job.
        @[JSON::Field(key: "taskRunStatusCounts")]
        getter task_run_status_counts : Hash(String, Int32)?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @job_id : String,
          @lifecycle_status : String,
          @lifecycle_status_message : String,
          @name : String,
          @priority : Int32,
          @ended_at : Time? = nil,
          @max_failed_tasks_count : Int32? = nil,
          @max_retries_per_task : Int32? = nil,
          @max_worker_count : Int32? = nil,
          @source_job_id : String? = nil,
          @started_at : Time? = nil,
          @target_task_run_status : String? = nil,
          @task_failure_retry_count : Int32? = nil,
          @task_run_status : String? = nil,
          @task_run_status_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details for a license endpoint.
      struct LicenseEndpointSummary
        include JSON::Serializable

        # The license endpoint ID.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String?

        # The status of the license endpoint.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The status message of the license endpoint.
        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        # The VPC (virtual private cloud) ID associated with the license endpoint.
        @[JSON::Field(key: "vpcId")]
        getter vpc_id : String?

        def initialize(
          @license_endpoint_id : String? = nil,
          @status : String? = nil,
          @status_message : String? = nil,
          @vpc_id : String? = nil
        )
        end
      end

      # Provides information about a specific limit.
      struct LimitSummary
        include JSON::Serializable

        # The value that you specify as the name in the amounts field of the hostRequirements in a step of a
        # job template to declare the limit requirement.
        @[JSON::Field(key: "amountRequirementName")]
        getter amount_requirement_name : String

        # The Unix timestamp of the date and time that the limit was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user identifier of the person that created the limit.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The number of resources from the limit that are being used by jobs. The result is delayed and may
        # not be the count at the time that you called the operation.
        @[JSON::Field(key: "currentCount")]
        getter current_count : Int32

        # The name of the limit used in lists to identify the limit. This field can store any content. Escape
        # or encode this content before displaying it on a webpage or any other system that might interpret
        # the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The unique identifier of the farm that contains the limit.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The maximum number of resources constrained by this limit. When all of the resources are in use,
        # steps that require the limit won't be scheduled until the resource is available. The maxValue must
        # not be 0. If the value is -1, there is no restriction on the number of resources that can be
        # acquired for this limit.
        @[JSON::Field(key: "maxCount")]
        getter max_count : Int32

        # The Unix timestamp of the date and time that the limit was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user identifier of the person that last updated the limit.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @amount_requirement_name : String,
          @created_at : Time,
          @created_by : String,
          @current_count : Int32,
          @display_name : String,
          @farm_id : String,
          @limit_id : String,
          @max_count : Int32,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      struct ListAvailableMeteredProductsRequest
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListAvailableMeteredProductsResponse
        include JSON::Serializable

        # The metered products.
        @[JSON::Field(key: "meteredProducts")]
        getter metered_products : Array(Types::MeteredProductSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metered_products : Array(Types::MeteredProductSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListBudgetsRequest
        include JSON::Serializable

        # The farm ID associated with the budgets.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The status to list for the budgets.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @farm_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListBudgetsResponse
        include JSON::Serializable

        # The budgets to include on the list.
        @[JSON::Field(key: "budgets")]
        getter budgets : Array(Types::BudgetSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @budgets : Array(Types::BudgetSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListFarmMembersRequest
        include JSON::Serializable

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFarmMembersResponse
        include JSON::Serializable

        # The members on the list.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::FarmMember)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::FarmMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListFarmsRequest
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The principal ID of the member to list on the farm.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      struct ListFarmsResponse
        include JSON::Serializable

        # Farms on the list.
        @[JSON::Field(key: "farms")]
        getter farms : Array(Types::FarmSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farms : Array(Types::FarmSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListFleetMembersRequest
        include JSON::Serializable

        # The farm ID of the fleet.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID to include on the list.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListFleetMembersResponse
        include JSON::Serializable

        # The members on the list.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::FleetMember)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::FleetMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListFleetsRequest
        include JSON::Serializable

        # The farm ID of the fleets.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The display names of a list of fleets. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The principal ID of the members to include in the fleet.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        # The status of the fleet.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @farm_id : String,
          @display_name : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListFleetsResponse
        include JSON::Serializable

        # The fleets on the list.
        @[JSON::Field(key: "fleets")]
        getter fleets : Array(Types::FleetSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @fleets : Array(Types::FleetSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobMembersRequest
        include JSON::Serializable

        # The farm ID of the job to list.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to include on the list.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to include on the list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobMembersResponse
        include JSON::Serializable

        # The members on the list.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::JobMember)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::JobMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobParameterDefinitionsRequest
        include JSON::Serializable

        # The farm ID of the job to list.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to include on the list.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to include on the list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListJobParameterDefinitionsResponse
        include JSON::Serializable

        # Lists parameter definitions of a job.
        @[JSON::Field(key: "jobParameterDefinitions")]
        getter job_parameter_definitions : Array(Types::JobParameterDefinition)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @job_parameter_definitions : Array(Types::JobParameterDefinition),
          @next_token : String? = nil
        )
        end
      end

      struct ListJobsRequest
        include JSON::Serializable

        # The farm ID for the jobs.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID for the job.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The principal ID of the members on the jobs.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        def initialize(
          @farm_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal_id : String? = nil
        )
        end
      end

      struct ListJobsResponse
        include JSON::Serializable

        # The jobs on the list.
        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @jobs : Array(Types::JobSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListLicenseEndpointsRequest
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLicenseEndpointsResponse
        include JSON::Serializable

        # The license endpoints.
        @[JSON::Field(key: "licenseEndpoints")]
        getter license_endpoints : Array(Types::LicenseEndpointSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @license_endpoints : Array(Types::LicenseEndpointSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListLimitsRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the limits.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of limits to return in each page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListLimitsResponse
        include JSON::Serializable

        # A list of limits that the farm contains.
        @[JSON::Field(key: "limits")]
        getter limits : Array(Types::LimitSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @limits : Array(Types::LimitSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListMeteredProductsRequest
        include JSON::Serializable

        # The license endpoint ID to include on the list of metered products.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @license_endpoint_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMeteredProductsResponse
        include JSON::Serializable

        # The metered products to list.
        @[JSON::Field(key: "meteredProducts")]
        getter metered_products : Array(Types::MeteredProductSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @metered_products : Array(Types::MeteredProductSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListMonitorsRequest
        include JSON::Serializable

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListMonitorsResponse
        include JSON::Serializable

        # A list of MonitorSummary objects that describe your monitors in the Deadline Cloud.
        @[JSON::Field(key: "monitors")]
        getter monitors : Array(Types::MonitorSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @monitors : Array(Types::MonitorSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListQueueEnvironmentsRequest
        include JSON::Serializable

        # The farm ID for the queue environment list.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID for the queue environment list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListQueueEnvironmentsResponse
        include JSON::Serializable

        # The environments to include in the queue environments list.
        @[JSON::Field(key: "environments")]
        getter environments : Array(Types::QueueEnvironmentSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::QueueEnvironmentSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListQueueFleetAssociationsRequest
        include JSON::Serializable

        # The farm ID for the queue-fleet association list.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID for the queue-fleet association list.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String?

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The queue ID for the queue-fleet association list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @queue_id : String? = nil
        )
        end
      end

      struct ListQueueFleetAssociationsResponse
        include JSON::Serializable

        # The queue-fleet associations on the list.
        @[JSON::Field(key: "queueFleetAssociations")]
        getter queue_fleet_associations : Array(Types::QueueFleetAssociationSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @queue_fleet_associations : Array(Types::QueueFleetAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListQueueLimitAssociationsRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the limits and associations.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # Specifies that the operation should return only the queue limit associations for the specified
        # limit. If you specify both the queueId and the limitId , only the specified limit is returned if it
        # exists.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String?

        # The maximum number of associations to return in each page of results.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Specifies that the operation should return only the queue limit associations for the specified
        # queue. If you specify both the queueId and the limitId , only the specified limit is returned if it
        # exists.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        def initialize(
          @farm_id : String,
          @limit_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @queue_id : String? = nil
        )
        end
      end

      struct ListQueueLimitAssociationsResponse
        include JSON::Serializable

        # A list of associations between limits and queues in the farm specified in the request.
        @[JSON::Field(key: "queueLimitAssociations")]
        getter queue_limit_associations : Array(Types::QueueLimitAssociationSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @queue_limit_associations : Array(Types::QueueLimitAssociationSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListQueueMembersRequest
        include JSON::Serializable

        # The farm ID for the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID to include on the list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListQueueMembersResponse
        include JSON::Serializable

        # The members on the list.
        @[JSON::Field(key: "members")]
        getter members : Array(Types::QueueMember)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @members : Array(Types::QueueMember),
          @next_token : String? = nil
        )
        end
      end

      struct ListQueuesRequest
        include JSON::Serializable

        # The farm ID of the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The principal IDs to include in the list of queues.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String?

        # The status of the queues listed. ACTIVE –The queues are active. SCHEDULING –The queues are
        # scheduling. SCHEDULING_BLOCKED –The queue scheduling is blocked for these queues.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @farm_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @principal_id : String? = nil,
          @status : String? = nil
        )
        end
      end

      struct ListQueuesResponse
        include JSON::Serializable

        # The queues on the list.
        @[JSON::Field(key: "queues")]
        getter queues : Array(Types::QueueSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @queues : Array(Types::QueueSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionActionsRequest
        include JSON::Serializable

        # The farm ID for the session actions list.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the session actions list.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the session actions list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The session ID to include on the sessions action list.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String?

        # The task ID for the session actions list.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @session_id : String? = nil,
          @task_id : String? = nil
        )
        end
      end

      struct ListSessionActionsResponse
        include JSON::Serializable

        # The session actions.
        @[JSON::Field(key: "sessionActions")]
        getter session_actions : Array(Types::SessionActionSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @session_actions : Array(Types::SessionActionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionsForWorkerRequest
        include JSON::Serializable

        # The farm ID for the session.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID for the session.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The worker ID for the session.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @worker_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionsForWorkerResponse
        include JSON::Serializable

        # The sessions in the response.
        @[JSON::Field(key: "sessions")]
        getter sessions : Array(Types::WorkerSessionSummary)

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sessions : Array(Types::WorkerSessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionsRequest
        include JSON::Serializable

        # The farm ID for the list of sessions.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the list of sessions.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the list of sessions
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListSessionsResponse
        include JSON::Serializable

        # The sessions on the list.
        @[JSON::Field(key: "sessions")]
        getter sessions : Array(Types::SessionSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @sessions : Array(Types::SessionSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStepConsumersRequest
        include JSON::Serializable

        # The farm ID for the list of step consumers.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the step consumer.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the step consumer.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID to include on the list.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStepConsumersResponse
        include JSON::Serializable

        # The consumers on the list.
        @[JSON::Field(key: "consumers")]
        getter consumers : Array(Types::StepConsumer)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @consumers : Array(Types::StepConsumer),
          @next_token : String? = nil
        )
        end
      end

      struct ListStepDependenciesRequest
        include JSON::Serializable

        # The farm ID for the step dependencies list.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the step dependencies list.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID for the step dependencies list.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID to include on the list.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStepDependenciesResponse
        include JSON::Serializable

        # The dependencies on the list.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(Types::StepDependency)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @dependencies : Array(Types::StepDependency),
          @next_token : String? = nil
        )
        end
      end

      struct ListStepsRequest
        include JSON::Serializable

        # The farm ID to include on the list of steps.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to include on the list of steps.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to include on the list of steps.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStepsResponse
        include JSON::Serializable

        # The steps on the list.
        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::StepSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @steps : Array(Types::StepSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStorageProfilesForQueueRequest
        include JSON::Serializable

        # The farm ID of the queue's storage profile.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID for the storage profile.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @queue_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStorageProfilesForQueueResponse
        include JSON::Serializable

        # The storage profiles in the queue.
        @[JSON::Field(key: "storageProfiles")]
        getter storage_profiles : Array(Types::StorageProfileSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @storage_profiles : Array(Types::StorageProfileSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListStorageProfilesRequest
        include JSON::Serializable

        # The farm ID of the storage profile.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListStorageProfilesResponse
        include JSON::Serializable

        # The storage profiles.
        @[JSON::Field(key: "storageProfiles")]
        getter storage_profiles : Array(Types::StorageProfileSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @storage_profiles : Array(Types::StorageProfileSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The resource ARN to list tags for.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceResponse
        include JSON::Serializable

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTasksRequest
        include JSON::Serializable

        # The farm ID connected to the tasks.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID for the tasks.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID connected to the tasks.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID for the tasks.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTasksResponse
        include JSON::Serializable

        # Tasks for the job.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::TaskSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @tasks : Array(Types::TaskSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkersRequest
        include JSON::Serializable

        # The farm ID connected to the workers.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the workers.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The maximum number of results to return. Use this parameter with NextToken to get results as a set
        # of sequential pages.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next set of results, or null to start from the beginning.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListWorkersResponse
        include JSON::Serializable

        # The workers on the list.
        @[JSON::Field(key: "workers")]
        getter workers : Array(Types::WorkerSummary)

        # If Deadline Cloud returns nextToken , then there are more results available. The value of nextToken
        # is a unique pagination token for each page. To retrieve the next page, call the operation again
        # using the returned token. Keep all other arguments unchanged. If no results remain, then nextToken
        # is set to null . Each pagination token expires after 24 hours. If you provide a token that isn't
        # valid, then you receive an HTTP 400 ValidationException error.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @workers : Array(Types::WorkerSummary),
          @next_token : String? = nil
        )
        end
      end

      # Log configuration details.
      struct LogConfiguration
        include JSON::Serializable

        # The log drivers for worker related logs.
        @[JSON::Field(key: "logDriver")]
        getter log_driver : String

        # The log configuration error details.
        @[JSON::Field(key: "error")]
        getter error : String?

        # The options for a log driver.
        @[JSON::Field(key: "options")]
        getter options : Hash(String, String)?

        # The parameters for the log configuration.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        def initialize(
          @log_driver : String,
          @error : String? = nil,
          @options : Hash(String, String)? = nil,
          @parameters : Hash(String, String)? = nil
        )
        end
      end

      # The details of the manifest that links a job's source information.
      struct ManifestProperties
        include JSON::Serializable

        # The file's root path.
        @[JSON::Field(key: "rootPath")]
        getter root_path : String

        # The format of the root path.
        @[JSON::Field(key: "rootPathFormat")]
        getter root_path_format : String

        # The file system location name.
        @[JSON::Field(key: "fileSystemLocationName")]
        getter file_system_location_name : String?

        # The hash value of the file.
        @[JSON::Field(key: "inputManifestHash")]
        getter input_manifest_hash : String?

        # The file path.
        @[JSON::Field(key: "inputManifestPath")]
        getter input_manifest_path : String?

        # The file path relative to the directory.
        @[JSON::Field(key: "outputRelativeDirectories")]
        getter output_relative_directories : Array(String)?

        def initialize(
          @root_path : String,
          @root_path_format : String,
          @file_system_location_name : String? = nil,
          @input_manifest_hash : String? = nil,
          @input_manifest_path : String? = nil,
          @output_relative_directories : Array(String)? = nil
        )
        end
      end

      # The range of memory in MiB.
      struct MemoryMiBRange
        include JSON::Serializable

        # The minimum amount of memory (in MiB).
        @[JSON::Field(key: "min")]
        getter min : Int32

        # The maximum amount of memory (in MiB).
        @[JSON::Field(key: "max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # The details of a metered product.
      struct MeteredProductSummary
        include JSON::Serializable

        # The family to which the metered product belongs.
        @[JSON::Field(key: "family")]
        getter family : String

        # The port on which the metered product should run.
        @[JSON::Field(key: "port")]
        getter port : Int32

        # The product ID.
        @[JSON::Field(key: "productId")]
        getter product_id : String

        # The vendor.
        @[JSON::Field(key: "vendor")]
        getter vendor : String

        def initialize(
          @family : String,
          @port : Int32,
          @product_id : String,
          @vendor : String
        )
        end
      end

      # Provides information about a monitor in Deadline Cloud.
      struct MonitorSummary
        include JSON::Serializable

        # The UNIX timestamp of the date and time that the monitor was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user name of the person that created the monitor.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The name of the monitor that displays on the Deadline Cloud console. This field can store any
        # content. Escape or encode this content before displaying it on a webpage or any other system that
        # might interpret the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The Amazon Resource Name that the IAM Identity Center assigned to the monitor when it was created.
        @[JSON::Field(key: "identityCenterApplicationArn")]
        getter identity_center_application_arn : String

        # The Amazon Resource Name of the IAM Identity Center instance responsible for authenticating monitor
        # users.
        @[JSON::Field(key: "identityCenterInstanceArn")]
        getter identity_center_instance_arn : String

        # The unique identifier for the monitor.
        @[JSON::Field(key: "monitorId")]
        getter monitor_id : String

        # The Amazon Resource Name of the IAM role for the monitor. Users of the monitor use this role to
        # access Deadline Cloud resources.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The subdomain used for the monitor URL. The full URL of the monitor is
        # subdomain.Region.deadlinecloud.amazonaws.com.
        @[JSON::Field(key: "subdomain")]
        getter subdomain : String

        # The complete URL of the monitor. The full URL of the monitor is
        # subdomain.Region.deadlinecloud.amazonaws.com.
        @[JSON::Field(key: "url")]
        getter url : String

        # The UNIX timestamp of the date and time that the monitor was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user name of the person that last updated the monitor.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @display_name : String,
          @identity_center_application_arn : String,
          @identity_center_instance_arn : String,
          @monitor_id : String,
          @role_arn : String,
          @subdomain : String,
          @url : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of a filtered search for parameters.
      struct ParameterFilterExpression
        include JSON::Serializable

        # The name of the parameter to filter on.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of comparison to use to filter results.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The parameter's value.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @operator : String,
          @value : String
        )
        end
      end

      # Organizes parameters according to your specifications.
      struct ParameterSortExpression
        include JSON::Serializable

        # The parameter name to sort by.
        @[JSON::Field(key: "name")]
        getter name : String

        # The sort order for the parameter.
        @[JSON::Field(key: "sortOrder")]
        getter sort_order : String

        def initialize(
          @name : String,
          @sort_order : String
        )
        end
      end

      # The details of a search for two or more step parameters.
      struct ParameterSpace
        include JSON::Serializable

        # The parameters to search for.
        @[JSON::Field(key: "parameters")]
        getter parameters : Array(Types::StepParameter)

        # The combination expression to use in the search.
        @[JSON::Field(key: "combination")]
        getter combination : String?

        def initialize(
          @parameters : Array(Types::StepParameter),
          @combination : String? = nil
        )
        end
      end

      # The details of a source and destination path.
      struct PathMappingRule
        include JSON::Serializable

        # The destination path.
        @[JSON::Field(key: "destinationPath")]
        getter destination_path : String

        # The source path.
        @[JSON::Field(key: "sourcePath")]
        getter source_path : String

        # The source path format.
        @[JSON::Field(key: "sourcePathFormat")]
        getter source_path_format : String

        def initialize(
          @destination_path : String,
          @source_path : String,
          @source_path_format : String
        )
        end
      end

      # The POSIX user.
      struct PosixUser
        include JSON::Serializable

        # The name of the POSIX user's group.
        @[JSON::Field(key: "group")]
        getter group : String

        # The name of the POSIX user.
        @[JSON::Field(key: "user")]
        getter user : String

        def initialize(
          @group : String,
          @user : String
        )
        end
      end

      struct PutMeteredProductRequest
        include JSON::Serializable

        # The license endpoint ID to add to the metered product.
        @[JSON::Field(key: "licenseEndpointId")]
        getter license_endpoint_id : String

        # The product ID to add to the metered product.
        @[JSON::Field(key: "productId")]
        getter product_id : String

        def initialize(
          @license_endpoint_id : String,
          @product_id : String
        )
        end
      end

      struct PutMeteredProductResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The summary of a queue environment.
      struct QueueEnvironmentSummary
        include JSON::Serializable

        # The name of the queue environment.
        @[JSON::Field(key: "name")]
        getter name : String

        # The queue environment's priority.
        @[JSON::Field(key: "priority")]
        getter priority : Int32

        # The queue environment ID.
        @[JSON::Field(key: "queueEnvironmentId")]
        getter queue_environment_id : String

        def initialize(
          @name : String,
          @priority : Int32,
          @queue_environment_id : String
        )
        end
      end

      # The details of a queue-fleet association.
      struct QueueFleetAssociationSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The status of task scheduling in the queue-fleet association. ACTIVE –Association is active.
        # STOP_SCHEDULING_AND_COMPLETE_TASKS –Association has stopped scheduling new tasks and is completing
        # current tasks. STOP_SCHEDULING_AND_CANCEL_TASKS –Association has stopped scheduling new tasks and is
        # canceling current tasks. STOPPED –Association has been stopped.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @fleet_id : String,
          @queue_id : String,
          @status : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Provides information about the association between a queue and a limit.
      struct QueueLimitAssociationSummary
        include JSON::Serializable

        # The Unix timestamp of the date and time that the association was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user identifier of the person that created the association.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The unique identifier of the limit in the association.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The unique identifier of the queue in the association.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The status of task scheduling in the queue-limit association. ACTIVE - Association is active.
        # STOP_LIMIT_USAGE_AND_COMPLETE_TASKS - Association has stopped scheduling new tasks and is completing
        # current tasks. STOP_LIMIT_USAGE_AND_CANCEL_TASKS - Association has stopped scheduling new tasks and
        # is canceling current tasks. STOPPED - Association has been stopped.
        @[JSON::Field(key: "status")]
        getter status : String

        # The Unix timestamp of the date and time that the association was last updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user identifier of the person that updated the association.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @limit_id : String,
          @queue_id : String,
          @status : String,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of a queue member.
      struct QueueMember
        include JSON::Serializable

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The identity store ID.
        @[JSON::Field(key: "identityStoreId")]
        getter identity_store_id : String

        # The queue member's membership level.
        @[JSON::Field(key: "membershipLevel")]
        getter membership_level : String

        # The principal ID of the queue member.
        @[JSON::Field(key: "principalId")]
        getter principal_id : String

        # The principal type of the queue member.
        @[JSON::Field(key: "principalType")]
        getter principal_type : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        def initialize(
          @farm_id : String,
          @identity_store_id : String,
          @membership_level : String,
          @principal_id : String,
          @principal_type : String,
          @queue_id : String
        )
        end
      end

      # The details of a queue summary.
      struct QueueSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The default action taken on a queue summary if a budget wasn't configured.
        @[JSON::Field(key: "defaultBudgetAction")]
        getter default_budget_action : String

        # The display name of the queue summary to update. This field can store any content. Escape or encode
        # this content before displaying it on a webpage or any other system that might interpret the content
        # of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # That status of the queue.
        @[JSON::Field(key: "status")]
        getter status : String

        # The reason the queue is blocked, if applicable.
        @[JSON::Field(key: "blockedReason")]
        getter blocked_reason : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @default_budget_action : String,
          @display_name : String,
          @farm_id : String,
          @queue_id : String,
          @status : String,
          @blocked_reason : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The requested resource can't be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The identifier of the resource that couldn't be found.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String

        # The type of the resource that couldn't be found.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Information about the resources in use when the exception was thrown.
        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        def initialize(
          @message : String,
          @resource_id : String,
          @resource_type : String,
          @context : Hash(String, String)? = nil
        )
        end
      end

      # The details of a budget action.
      struct ResponseBudgetAction
        include JSON::Serializable

        # The percentage threshold for the budget.
        @[JSON::Field(key: "thresholdPercentage")]
        getter threshold_percentage : Float64

        # The action taken on the budget once scheduling stops.
        @[JSON::Field(key: "type")]
        getter type : String

        # The budget action description. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @threshold_percentage : Float64,
          @type : String,
          @description : String? = nil
        )
        end
      end

      # The Amazon S3 location information.
      struct S3Location
        include JSON::Serializable

        # The name of the Amazon S3 bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The Amazon S3 object key that uniquely identifies the Amazon S3 bucket.
        @[JSON::Field(key: "key")]
        getter key : String

        def initialize(
          @bucket_name : String,
          @key : String
        )
        end
      end

      # The type of search filter to apply.
      struct SearchFilterExpression
        include JSON::Serializable

        # Filters based on date and time.
        @[JSON::Field(key: "dateTimeFilter")]
        getter date_time_filter : Types::DateTimeFilterExpression?

        # Filters by group.
        @[JSON::Field(key: "groupFilter")]
        getter group_filter : Types::SearchGroupedFilterExpressions?

        # Filters by parameter.
        @[JSON::Field(key: "parameterFilter")]
        getter parameter_filter : Types::ParameterFilterExpression?

        # Filters by a specified search term.
        @[JSON::Field(key: "searchTermFilter")]
        getter search_term_filter : Types::SearchTermFilterExpression?

        # Filters by a string.
        @[JSON::Field(key: "stringFilter")]
        getter string_filter : Types::StringFilterExpression?

        # Filters by a list of string values.
        @[JSON::Field(key: "stringListFilter")]
        getter string_list_filter : Types::StringListFilterExpression?

        def initialize(
          @date_time_filter : Types::DateTimeFilterExpression? = nil,
          @group_filter : Types::SearchGroupedFilterExpressions? = nil,
          @parameter_filter : Types::ParameterFilterExpression? = nil,
          @search_term_filter : Types::SearchTermFilterExpression? = nil,
          @string_filter : Types::StringFilterExpression? = nil,
          @string_list_filter : Types::StringListFilterExpression? = nil
        )
        end
      end

      # The search terms for a resource.
      struct SearchGroupedFilterExpressions
        include JSON::Serializable

        # The filters to use for the search.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::SearchFilterExpression)

        # The operators to include in the search.
        @[JSON::Field(key: "operator")]
        getter operator : String

        def initialize(
          @filters : Array(Types::SearchFilterExpression),
          @operator : String
        )
        end
      end

      struct SearchJobsRequest
        include JSON::Serializable

        # The farm ID of the job.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The offset for the search results.
        @[JSON::Field(key: "itemOffset")]
        getter item_offset : Int32

        # The queue ID to use in the job search.
        @[JSON::Field(key: "queueIds")]
        getter queue_ids : Array(String)

        # The search terms for a resource.
        @[JSON::Field(key: "filterExpressions")]
        getter filter_expressions : Types::SearchGroupedFilterExpressions?

        # Specifies the number of results to return.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The search terms for a resource.
        @[JSON::Field(key: "sortExpressions")]
        getter sort_expressions : Array(Types::SearchSortExpression)?

        def initialize(
          @farm_id : String,
          @item_offset : Int32,
          @queue_ids : Array(String),
          @filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
          @page_size : Int32? = nil,
          @sort_expressions : Array(Types::SearchSortExpression)? = nil
        )
        end
      end

      struct SearchJobsResponse
        include JSON::Serializable

        # The jobs in the search.
        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::JobSearchSummary)

        # The total number of results in the search.
        @[JSON::Field(key: "totalResults")]
        getter total_results : Int32

        # The next item offset for the search results.
        @[JSON::Field(key: "nextItemOffset")]
        getter next_item_offset : Int32?

        def initialize(
          @jobs : Array(Types::JobSearchSummary),
          @total_results : Int32,
          @next_item_offset : Int32? = nil
        )
        end
      end

      # The resources to search.
      struct SearchSortExpression
        include JSON::Serializable

        # Options for sorting by a field.
        @[JSON::Field(key: "fieldSort")]
        getter field_sort : Types::FieldSortExpression?

        # Options for sorting by a parameter.
        @[JSON::Field(key: "parameterSort")]
        getter parameter_sort : Types::ParameterSortExpression?

        # Options for sorting a particular user's jobs first.
        @[JSON::Field(key: "userJobsFirst")]
        getter user_jobs_first : Types::UserJobsFirst?

        def initialize(
          @field_sort : Types::FieldSortExpression? = nil,
          @parameter_sort : Types::ParameterSortExpression? = nil,
          @user_jobs_first : Types::UserJobsFirst? = nil
        )
        end
      end

      struct SearchStepsRequest
        include JSON::Serializable

        # The farm ID to use for the step search.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The offset for the search results.
        @[JSON::Field(key: "itemOffset")]
        getter item_offset : Int32

        # The queue IDs in the step search.
        @[JSON::Field(key: "queueIds")]
        getter queue_ids : Array(String)

        # The search terms for a resource.
        @[JSON::Field(key: "filterExpressions")]
        getter filter_expressions : Types::SearchGroupedFilterExpressions?

        # The job ID to use in the step search.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # Specifies the number of results to return.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The search terms for a resource.
        @[JSON::Field(key: "sortExpressions")]
        getter sort_expressions : Array(Types::SearchSortExpression)?

        def initialize(
          @farm_id : String,
          @item_offset : Int32,
          @queue_ids : Array(String),
          @filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
          @job_id : String? = nil,
          @page_size : Int32? = nil,
          @sort_expressions : Array(Types::SearchSortExpression)? = nil
        )
        end
      end

      struct SearchStepsResponse
        include JSON::Serializable

        # The steps in the search.
        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::StepSearchSummary)

        # The total number of results in the search.
        @[JSON::Field(key: "totalResults")]
        getter total_results : Int32

        # The next item offset for the search results.
        @[JSON::Field(key: "nextItemOffset")]
        getter next_item_offset : Int32?

        def initialize(
          @steps : Array(Types::StepSearchSummary),
          @total_results : Int32,
          @next_item_offset : Int32? = nil
        )
        end
      end

      struct SearchTasksRequest
        include JSON::Serializable

        # The farm ID of the task.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The offset for the search results.
        @[JSON::Field(key: "itemOffset")]
        getter item_offset : Int32

        # The queue IDs to include in the search.
        @[JSON::Field(key: "queueIds")]
        getter queue_ids : Array(String)

        # The search terms for a resource.
        @[JSON::Field(key: "filterExpressions")]
        getter filter_expressions : Types::SearchGroupedFilterExpressions?

        # The job ID for the task search.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # Specifies the number of results to return.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The search terms for a resource.
        @[JSON::Field(key: "sortExpressions")]
        getter sort_expressions : Array(Types::SearchSortExpression)?

        def initialize(
          @farm_id : String,
          @item_offset : Int32,
          @queue_ids : Array(String),
          @filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
          @job_id : String? = nil,
          @page_size : Int32? = nil,
          @sort_expressions : Array(Types::SearchSortExpression)? = nil
        )
        end
      end

      struct SearchTasksResponse
        include JSON::Serializable

        # Tasks in the search.
        @[JSON::Field(key: "tasks")]
        getter tasks : Array(Types::TaskSearchSummary)

        # The total number of results in the search.
        @[JSON::Field(key: "totalResults")]
        getter total_results : Int32

        # The next item offset for the search results.
        @[JSON::Field(key: "nextItemOffset")]
        getter next_item_offset : Int32?

        def initialize(
          @tasks : Array(Types::TaskSearchSummary),
          @total_results : Int32,
          @next_item_offset : Int32? = nil
        )
        end
      end

      # Searches for a particular search term.
      struct SearchTermFilterExpression
        include JSON::Serializable

        # The term to search for.
        @[JSON::Field(key: "searchTerm")]
        getter search_term : String

        # Specifies how Deadline Cloud matches your search term in the results. If you don't specify a
        # matchType the default is FUZZY_MATCH . FUZZY_MATCH - Matches if a portion of the search term is
        # found in the result. CONTAINS - Matches if the exact search term is contained in the result.
        @[JSON::Field(key: "matchType")]
        getter match_type : String?

        def initialize(
          @search_term : String,
          @match_type : String? = nil
        )
        end
      end

      struct SearchWorkersRequest
        include JSON::Serializable

        # The farm ID in the workers search.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID of the workers to search for.
        @[JSON::Field(key: "fleetIds")]
        getter fleet_ids : Array(String)

        # The offset for the search results.
        @[JSON::Field(key: "itemOffset")]
        getter item_offset : Int32

        # The search terms for a resource.
        @[JSON::Field(key: "filterExpressions")]
        getter filter_expressions : Types::SearchGroupedFilterExpressions?

        # Specifies the number of results to return.
        @[JSON::Field(key: "pageSize")]
        getter page_size : Int32?

        # The search terms for a resource.
        @[JSON::Field(key: "sortExpressions")]
        getter sort_expressions : Array(Types::SearchSortExpression)?

        def initialize(
          @farm_id : String,
          @fleet_ids : Array(String),
          @item_offset : Int32,
          @filter_expressions : Types::SearchGroupedFilterExpressions? = nil,
          @page_size : Int32? = nil,
          @sort_expressions : Array(Types::SearchSortExpression)? = nil
        )
        end
      end

      struct SearchWorkersResponse
        include JSON::Serializable

        # The total number of results in the search.
        @[JSON::Field(key: "totalResults")]
        getter total_results : Int32

        # The workers for the search.
        @[JSON::Field(key: "workers")]
        getter workers : Array(Types::WorkerSearchSummary)

        # The next item offset for the search results.
        @[JSON::Field(key: "nextItemOffset")]
        getter next_item_offset : Int32?

        def initialize(
          @total_results : Int32,
          @workers : Array(Types::WorkerSearchSummary),
          @next_item_offset : Int32? = nil
        )
        end
      end

      # The configuration details for a service managed EC2 fleet.
      struct ServiceManagedEc2FleetConfiguration
        include JSON::Serializable

        # The instance capabilities for the service managed EC2 fleet.
        @[JSON::Field(key: "instanceCapabilities")]
        getter instance_capabilities : Types::ServiceManagedEc2InstanceCapabilities

        # The instance market options for the service managed EC2 fleet.
        @[JSON::Field(key: "instanceMarketOptions")]
        getter instance_market_options : Types::ServiceManagedEc2InstanceMarketOptions

        # The storage profile ID for the service managed EC2 fleet.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String?

        # The VPC configuration for the service managed EC2 fleet.
        @[JSON::Field(key: "vpcConfiguration")]
        getter vpc_configuration : Types::VpcConfiguration?

        def initialize(
          @instance_capabilities : Types::ServiceManagedEc2InstanceCapabilities,
          @instance_market_options : Types::ServiceManagedEc2InstanceMarketOptions,
          @storage_profile_id : String? = nil,
          @vpc_configuration : Types::VpcConfiguration? = nil
        )
        end
      end

      # The Amazon EC2 instance capabilities.
      struct ServiceManagedEc2InstanceCapabilities
        include JSON::Serializable

        # The CPU architecture type.
        @[JSON::Field(key: "cpuArchitectureType")]
        getter cpu_architecture_type : String

        # The memory, as MiB, for the Amazon EC2 instance type.
        @[JSON::Field(key: "memoryMiB")]
        getter memory_mi_b : Types::MemoryMiBRange

        # The operating system (OS) family.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String

        # The amount of vCPU to require for instances in this fleet.
        @[JSON::Field(key: "vCpuCount")]
        getter v_cpu_count : Types::VCpuCountRange

        # Describes the GPU accelerator capabilities required for worker host instances in this fleet.
        @[JSON::Field(key: "acceleratorCapabilities")]
        getter accelerator_capabilities : Types::AcceleratorCapabilities?

        # The allowable Amazon EC2 instance types.
        @[JSON::Field(key: "allowedInstanceTypes")]
        getter allowed_instance_types : Array(String)?

        # The custom capability amounts to require for instances in this fleet.
        @[JSON::Field(key: "customAmounts")]
        getter custom_amounts : Array(Types::FleetAmountCapability)?

        # The custom capability attributes to require for instances in this fleet.
        @[JSON::Field(key: "customAttributes")]
        getter custom_attributes : Array(Types::FleetAttributeCapability)?

        # The instance types to exclude from the fleet.
        @[JSON::Field(key: "excludedInstanceTypes")]
        getter excluded_instance_types : Array(String)?

        # The root EBS volume.
        @[JSON::Field(key: "rootEbsVolume")]
        getter root_ebs_volume : Types::Ec2EbsVolume?

        def initialize(
          @cpu_architecture_type : String,
          @memory_mi_b : Types::MemoryMiBRange,
          @os_family : String,
          @v_cpu_count : Types::VCpuCountRange,
          @accelerator_capabilities : Types::AcceleratorCapabilities? = nil,
          @allowed_instance_types : Array(String)? = nil,
          @custom_amounts : Array(Types::FleetAmountCapability)? = nil,
          @custom_attributes : Array(Types::FleetAttributeCapability)? = nil,
          @excluded_instance_types : Array(String)? = nil,
          @root_ebs_volume : Types::Ec2EbsVolume? = nil
        )
        end
      end

      # The details of the Amazon EC2 instance market options for a service managed fleet.
      struct ServiceManagedEc2InstanceMarketOptions
        include JSON::Serializable

        # The Amazon EC2 instance type.
        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @type : String
        )
        end
      end

      # You exceeded your service quota. Service quotas, also referred to as limits, are the maximum number
      # of service resources or operations for your Amazon Web Services account.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Identifies the quota that has been exceeded.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String

        # A string that describes the reason the quota was exceeded.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The type of the affected resource
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Identifies the service that exceeded the quota.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String

        # Information about the resources in use when the exception was thrown.
        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        # The identifier of the affected resource.
        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String,
          @quota_code : String,
          @reason : String,
          @resource_type : String,
          @service_code : String,
          @context : Hash(String, String)? = nil,
          @resource_id : String? = nil
        )
        end
      end

      # The definition of the session action.
      struct SessionActionDefinition
        include JSON::Serializable

        # The environment to enter into.
        @[JSON::Field(key: "envEnter")]
        getter env_enter : Types::EnvironmentEnterSessionActionDefinition?

        # The environment to exit from.
        @[JSON::Field(key: "envExit")]
        getter env_exit : Types::EnvironmentExitSessionActionDefinition?

        # The session action definition for syncing input job attachments.
        @[JSON::Field(key: "syncInputJobAttachments")]
        getter sync_input_job_attachments : Types::SyncInputJobAttachmentsSessionActionDefinition?

        # The task run in the session.
        @[JSON::Field(key: "taskRun")]
        getter task_run : Types::TaskRunSessionActionDefinition?

        def initialize(
          @env_enter : Types::EnvironmentEnterSessionActionDefinition? = nil,
          @env_exit : Types::EnvironmentExitSessionActionDefinition? = nil,
          @sync_input_job_attachments : Types::SyncInputJobAttachmentsSessionActionDefinition? = nil,
          @task_run : Types::TaskRunSessionActionDefinition? = nil
        )
        end
      end

      # The details of a session action definition.
      struct SessionActionDefinitionSummary
        include JSON::Serializable

        # The environment to enter into.
        @[JSON::Field(key: "envEnter")]
        getter env_enter : Types::EnvironmentEnterSessionActionDefinitionSummary?

        # The environment to exit from.
        @[JSON::Field(key: "envExit")]
        getter env_exit : Types::EnvironmentExitSessionActionDefinitionSummary?

        # The session action definition summary for syncing input job attachments.
        @[JSON::Field(key: "syncInputJobAttachments")]
        getter sync_input_job_attachments : Types::SyncInputJobAttachmentsSessionActionDefinitionSummary?

        # The task run.
        @[JSON::Field(key: "taskRun")]
        getter task_run : Types::TaskRunSessionActionDefinitionSummary?

        def initialize(
          @env_enter : Types::EnvironmentEnterSessionActionDefinitionSummary? = nil,
          @env_exit : Types::EnvironmentExitSessionActionDefinitionSummary? = nil,
          @sync_input_job_attachments : Types::SyncInputJobAttachmentsSessionActionDefinitionSummary? = nil,
          @task_run : Types::TaskRunSessionActionDefinitionSummary? = nil
        )
        end
      end

      # The details of a session action.
      struct SessionActionSummary
        include JSON::Serializable

        # The session action definition.
        @[JSON::Field(key: "definition")]
        getter definition : Types::SessionActionDefinitionSummary

        # The session action ID.
        @[JSON::Field(key: "sessionActionId")]
        getter session_action_id : String

        # The status of the session action.
        @[JSON::Field(key: "status")]
        getter status : String

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The list of manifest properties that describe file attachments for the task run.
        @[JSON::Field(key: "manifests")]
        getter manifests : Array(Types::TaskRunManifestPropertiesResponse)?

        # The completion percentage for the session action.
        @[JSON::Field(key: "progressPercent")]
        getter progress_percent : Float64?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The Linux timestamp of the last date and time that the session action was updated.
        @[JSON::Field(key: "workerUpdatedAt")]
        getter worker_updated_at : Time?

        def initialize(
          @definition : Types::SessionActionDefinitionSummary,
          @session_action_id : String,
          @status : String,
          @ended_at : Time? = nil,
          @manifests : Array(Types::TaskRunManifestPropertiesResponse)? = nil,
          @progress_percent : Float64? = nil,
          @started_at : Time? = nil,
          @worker_updated_at : Time? = nil
        )
        end
      end

      # The summary of a session.
      struct SessionSummary
        include JSON::Serializable

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The life cycle status for the session.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # The session ID.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The worker ID.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The target life cycle status for the session.
        @[JSON::Field(key: "targetLifecycleStatus")]
        getter target_lifecycle_status : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @fleet_id : String,
          @lifecycle_status : String,
          @session_id : String,
          @started_at : Time,
          @worker_id : String,
          @ended_at : Time? = nil,
          @target_lifecycle_status : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Specifies the fleet IDs or queue IDs to return statistics. You can specify only fleet IDs or queue
      # IDS, not both.
      struct SessionsStatisticsResources
        include JSON::Serializable

        # One to 10 fleet IDs that specify the fleets to return statistics for. If you specify the fleetIds
        # field, you can't specify the queueIds field.
        @[JSON::Field(key: "fleetIds")]
        getter fleet_ids : Array(String)?

        # One to 10 queue IDs that specify the queues to return statistics for. If you specify the queueIds
        # field, you can't specify the fleetIds field.
        @[JSON::Field(key: "queueIds")]
        getter queue_ids : Array(String)?

        def initialize(
          @fleet_ids : Array(String)? = nil,
          @queue_ids : Array(String)? = nil
        )
        end
      end

      struct StartSessionsStatisticsAggregationRequest
        include JSON::Serializable

        # The Linux timestamp of the date and time that the statistics end.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time

        # The identifier of the farm that contains queues or fleets to return statistics for.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The field to use to group the statistics.
        @[JSON::Field(key: "groupBy")]
        getter group_by : Array(String)

        # A list of fleet IDs or queue IDs to gather statistics for.
        @[JSON::Field(key: "resourceIds")]
        getter resource_ids : Types::SessionsStatisticsResources

        # The Linux timestamp of the date and time that the statistics start.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # One to four statistics to return.
        @[JSON::Field(key: "statistics")]
        getter statistics : Array(String)

        # The period to aggregate the statistics.
        @[JSON::Field(key: "period")]
        getter period : String?

        # The timezone to use for the statistics. Use UTC notation such as "UTC+8."
        @[JSON::Field(key: "timezone")]
        getter timezone : String?

        def initialize(
          @end_time : Time,
          @farm_id : String,
          @group_by : Array(String),
          @resource_ids : Types::SessionsStatisticsResources,
          @start_time : Time,
          @statistics : Array(String),
          @period : String? = nil,
          @timezone : String? = nil
        )
        end
      end

      struct StartSessionsStatisticsAggregationResponse
        include JSON::Serializable

        # A unique identifier for the aggregated statistics. Use this identifier with the
        # GetAggregatedStatisticsForSessions operation to return the statistics.
        @[JSON::Field(key: "aggregationId")]
        getter aggregation_id : String

        def initialize(
          @aggregation_id : String
        )
        end
      end

      # A list of statistics for a session.
      struct Statistics
        include JSON::Serializable

        # How the statistics should appear in USD. Options include: minimum, maximum, average or sum.
        @[JSON::Field(key: "costInUsd")]
        getter cost_in_usd : Types::Stats

        # The number of instances in a list of statistics.
        @[JSON::Field(key: "count")]
        getter count : Int32

        # The total aggregated runtime.
        @[JSON::Field(key: "runtimeInSeconds")]
        getter runtime_in_seconds : Types::Stats

        # The end time for the aggregation.
        @[JSON::Field(key: "aggregationEndTime")]
        getter aggregation_end_time : Time?

        # The start time for the aggregation.
        @[JSON::Field(key: "aggregationStartTime")]
        getter aggregation_start_time : Time?

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String?

        # The type of instance.
        @[JSON::Field(key: "instanceType")]
        getter instance_type : String?

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The job name.
        @[JSON::Field(key: "jobName")]
        getter job_name : String?

        # The licensed product.
        @[JSON::Field(key: "licenseProduct")]
        getter license_product : String?

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        # The type of usage for the statistics.
        @[JSON::Field(key: "usageType")]
        getter usage_type : String?

        # The user ID.
        @[JSON::Field(key: "userId")]
        getter user_id : String?

        def initialize(
          @cost_in_usd : Types::Stats,
          @count : Int32,
          @runtime_in_seconds : Types::Stats,
          @aggregation_end_time : Time? = nil,
          @aggregation_start_time : Time? = nil,
          @fleet_id : String? = nil,
          @instance_type : String? = nil,
          @job_id : String? = nil,
          @job_name : String? = nil,
          @license_product : String? = nil,
          @queue_id : String? = nil,
          @usage_type : String? = nil,
          @user_id : String? = nil
        )
        end
      end

      # The minimum, maximum, average, and sum.
      struct Stats
        include JSON::Serializable

        # The average of the usage statistics.
        @[JSON::Field(key: "avg")]
        getter avg : Float64?

        # The maximum among the usage statistics.
        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The minimum of the usage statistics.
        @[JSON::Field(key: "min")]
        getter min : Float64?

        # The sum of the usage statistics.
        @[JSON::Field(key: "sum")]
        getter sum : Float64?

        def initialize(
          @avg : Float64? = nil,
          @max : Float64? = nil,
          @min : Float64? = nil,
          @sum : Float64? = nil
        )
        end
      end

      # The details outlining the minimum and maximum capability of a step.
      struct StepAmountCapability
        include JSON::Serializable

        # The name of the step.
        @[JSON::Field(key: "name")]
        getter name : String

        # The maximum amount.
        @[JSON::Field(key: "max")]
        getter max : Float64?

        # The minimum amount.
        @[JSON::Field(key: "min")]
        getter min : Float64?

        # The amount value.
        @[JSON::Field(key: "value")]
        getter value : Float64?

        def initialize(
          @name : String,
          @max : Float64? = nil,
          @min : Float64? = nil,
          @value : Float64? = nil
        )
        end
      end

      # The list of step attributes.
      struct StepAttributeCapability
        include JSON::Serializable

        # The name of the step attribute.
        @[JSON::Field(key: "name")]
        getter name : String

        # Requires all of the step attribute values.
        @[JSON::Field(key: "allOf")]
        getter all_of : Array(String)?

        # Requires any of the step attributes in a given list.
        @[JSON::Field(key: "anyOf")]
        getter any_of : Array(String)?

        def initialize(
          @name : String,
          @all_of : Array(String)? = nil,
          @any_of : Array(String)? = nil
        )
        end
      end

      # The details of a step consumer.
      struct StepConsumer
        include JSON::Serializable

        # The step consumer status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        def initialize(
          @status : String,
          @step_id : String
        )
        end
      end

      # The details of step dependency.
      struct StepDependency
        include JSON::Serializable

        # The step dependency status.
        @[JSON::Field(key: "status")]
        getter status : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        def initialize(
          @status : String,
          @step_id : String
        )
        end
      end

      # The details of a step entity.
      struct StepDetailsEntity
        include JSON::Serializable

        # The dependencies for a step.
        @[JSON::Field(key: "dependencies")]
        getter dependencies : Array(String)

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The schema version for a step template.
        @[JSON::Field(key: "schemaVersion")]
        getter schema_version : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The template for a step.
        @[JSON::Field(key: "template")]
        getter template : Types::Document

        def initialize(
          @dependencies : Array(String),
          @job_id : String,
          @schema_version : String,
          @step_id : String,
          @template : Types::Document
        )
        end
      end

      # The details of the step error.
      struct StepDetailsError
        include JSON::Serializable

        # The error code.
        @[JSON::Field(key: "code")]
        getter code : String

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The error message detailing the error's cause.
        @[JSON::Field(key: "message")]
        getter message : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        def initialize(
          @code : String,
          @job_id : String,
          @message : String,
          @step_id : String
        )
        end
      end

      # The details of identifiers for a step.
      struct StepDetailsIdentifiers
        include JSON::Serializable

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        def initialize(
          @job_id : String,
          @step_id : String
        )
        end
      end

      # The details of a step parameter.
      struct StepParameter
        include JSON::Serializable

        # The name of the parameter.
        @[JSON::Field(key: "name")]
        getter name : String

        # The data type of the parameter.
        @[JSON::Field(key: "type")]
        getter type : String

        # The configuration for task chunking.
        @[JSON::Field(key: "chunks")]
        getter chunks : Types::StepParameterChunks?

        def initialize(
          @name : String,
          @type : String,
          @chunks : Types::StepParameterChunks? = nil
        )
        end
      end

      # Defines how a step parameter range should be divided into chunks.
      struct StepParameterChunks
        include JSON::Serializable

        # The number of tasks to combine into a single chunk by default.
        @[JSON::Field(key: "defaultTaskCount")]
        getter default_task_count : Int32

        # Specifies whether the chunked ranges must be contiguous or can have gaps between them.
        @[JSON::Field(key: "rangeConstraint")]
        getter range_constraint : String

        # The number of seconds to aim for when forming chunks.
        @[JSON::Field(key: "targetRuntimeSeconds")]
        getter target_runtime_seconds : Int32?

        def initialize(
          @default_task_count : Int32,
          @range_constraint : String,
          @target_runtime_seconds : Int32? = nil
        )
        end
      end

      # The details of required step capabilities.
      struct StepRequiredCapabilities
        include JSON::Serializable

        # The capability amounts that the step requires.
        @[JSON::Field(key: "amounts")]
        getter amounts : Array(Types::StepAmountCapability)

        # The capability attributes that the step requires.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::StepAttributeCapability)

        def initialize(
          @amounts : Array(Types::StepAmountCapability),
          @attributes : Array(Types::StepAttributeCapability)
        )
        end
      end

      # The details of a step search.
      struct StepSearchSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The life cycle status.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String?

        # The life cycle status message.
        @[JSON::Field(key: "lifecycleStatusMessage")]
        getter lifecycle_status_message : String?

        # The step name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # The parameters and combination expressions for the search.
        @[JSON::Field(key: "parameterSpace")]
        getter parameter_space : Types::ParameterSpace?

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        # The task status to update the job's tasks to.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The total number of times tasks from the step failed and were retried.
        @[JSON::Field(key: "taskFailureRetryCount")]
        getter task_failure_retry_count : Int32?

        # The task run status for the job. PENDING –pending and waiting for resources. READY –ready to be
        # processed. ASSIGNED –assigned and will run next on a worker. SCHEDULED –scheduled to be run on a
        # worker. INTERRUPTING –being interrupted. RUNNING –running on a worker. SUSPENDED –the task is
        # suspended. CANCELED –the task has been canceled. FAILED –the task has failed. SUCCEEDED –the task
        # has succeeded.
        @[JSON::Field(key: "taskRunStatus")]
        getter task_run_status : String?

        # The number of tasks running on the job.
        @[JSON::Field(key: "taskRunStatusCounts")]
        getter task_run_status_counts : Hash(String, Int32)?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @ended_at : Time? = nil,
          @job_id : String? = nil,
          @lifecycle_status : String? = nil,
          @lifecycle_status_message : String? = nil,
          @name : String? = nil,
          @parameter_space : Types::ParameterSpace? = nil,
          @queue_id : String? = nil,
          @started_at : Time? = nil,
          @step_id : String? = nil,
          @target_task_run_status : String? = nil,
          @task_failure_retry_count : Int32? = nil,
          @task_run_status : String? = nil,
          @task_run_status_counts : Hash(String, Int32)? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details for a step.
      struct StepSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The life cycle status.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # The name of the step.
        @[JSON::Field(key: "name")]
        getter name : String

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The task run status for the job. PENDING –pending and waiting for resources. READY –ready to
        # process. ASSIGNED –assigned and will run next on a worker. SCHEDULED –scheduled to run on a worker.
        # INTERRUPTING –being interrupted. RUNNING –running on a worker. SUSPENDED –the task is suspended.
        # CANCELED –the task has been canceled. FAILED –the task has failed. SUCCEEDED –the task has
        # succeeded.
        @[JSON::Field(key: "taskRunStatus")]
        getter task_run_status : String

        # The number of tasks running on the job.
        @[JSON::Field(key: "taskRunStatusCounts")]
        getter task_run_status_counts : Hash(String, Int32)

        # The number of dependencies for the step.
        @[JSON::Field(key: "dependencyCounts")]
        getter dependency_counts : Types::DependencyCounts?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # A message that describes the lifecycle of the step.
        @[JSON::Field(key: "lifecycleStatusMessage")]
        getter lifecycle_status_message : String?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The task status to update the job's tasks to.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        # The total number of times tasks from the step failed and were retried.
        @[JSON::Field(key: "taskFailureRetryCount")]
        getter task_failure_retry_count : Int32?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @lifecycle_status : String,
          @name : String,
          @step_id : String,
          @task_run_status : String,
          @task_run_status_counts : Hash(String, Int32),
          @dependency_counts : Types::DependencyCounts? = nil,
          @ended_at : Time? = nil,
          @lifecycle_status_message : String? = nil,
          @started_at : Time? = nil,
          @target_task_run_status : String? = nil,
          @task_failure_retry_count : Int32? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of a storage profile.
      struct StorageProfileSummary
        include JSON::Serializable

        # The display name of the storage profile summary to update. This field can store any content. Escape
        # or encode this content before displaying it on a webpage or any other system that might interpret
        # the content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String

        # The operating system (OS) family.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String

        # The storage profile ID.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        def initialize(
          @display_name : String,
          @os_family : String,
          @storage_profile_id : String
        )
        end
      end

      # Searches for a particular string.
      struct StringFilterExpression
        include JSON::Serializable

        # The field name to search.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of comparison to use for this search.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The string to search for.
        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @operator : String,
          @value : String
        )
        end
      end

      # Searches for a match within a list of strings.
      struct StringListFilterExpression
        include JSON::Serializable

        # The field name to search.
        @[JSON::Field(key: "name")]
        getter name : String

        # The type of comparison to use for this search. ANY_EQUALS and ALL_NOT_EQUALS are supported.
        @[JSON::Field(key: "operator")]
        getter operator : String

        # The list of string values to search for.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @operator : String,
          @values : Array(String)
        )
        end
      end

      # The session action definition for syncing input job attachments.
      struct SyncInputJobAttachmentsSessionActionDefinition
        include JSON::Serializable

        # The step ID for the sync input job attachments session action.
        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        def initialize(
          @step_id : String? = nil
        )
        end
      end

      # The summary of the session action definition for syncing input job attachments.
      struct SyncInputJobAttachmentsSessionActionDefinitionSummary
        include JSON::Serializable

        # The step ID for the sync input job attachments session action summary.
        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        def initialize(
          @step_id : String? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to apply tags to.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Each tag consists of a tag key and a tag value. Tag keys and values are both required, but tag
        # values can be empty strings.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @resource_arn : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct TagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The data types for the task parameters.
      struct TaskParameterValue
        include JSON::Serializable

        # A range (for example 1-10) or selection of specific (for example 1,3,7,8,10) integers represented as
        # a string.
        @[JSON::Field(key: "chunkInt")]
        getter chunk_int : String?

        # A double precision IEEE-754 floating point number represented as a string.
        @[JSON::Field(key: "float")]
        getter float : String?

        # A signed integer represented as a string.
        @[JSON::Field(key: "int")]
        getter int : String?

        # A file system path represented as a string.
        @[JSON::Field(key: "path")]
        getter path : String?

        # A UTF-8 string.
        @[JSON::Field(key: "string")]
        getter string : String?

        def initialize(
          @chunk_int : String? = nil,
          @float : String? = nil,
          @int : String? = nil,
          @path : String? = nil,
          @string : String? = nil
        )
        end
      end

      # The output manifest properties reported by the worker agent for a completed task run.
      struct TaskRunManifestPropertiesRequest
        include JSON::Serializable

        # The hash value of the file.
        @[JSON::Field(key: "outputManifestHash")]
        getter output_manifest_hash : String?

        # The manifest file path.
        @[JSON::Field(key: "outputManifestPath")]
        getter output_manifest_path : String?

        def initialize(
          @output_manifest_hash : String? = nil,
          @output_manifest_path : String? = nil
        )
        end
      end

      # The manifest properties for a task run, corresponding to the manifest properties in the job.
      struct TaskRunManifestPropertiesResponse
        include JSON::Serializable

        # The hash value of the file.
        @[JSON::Field(key: "outputManifestHash")]
        getter output_manifest_hash : String?

        # The manifest file path.
        @[JSON::Field(key: "outputManifestPath")]
        getter output_manifest_path : String?

        def initialize(
          @output_manifest_hash : String? = nil,
          @output_manifest_path : String? = nil
        )
        end
      end

      # The task, step, and parameters for the task run in the session action.
      struct TaskRunSessionActionDefinition
        include JSON::Serializable

        # The task parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TaskParameterValue)

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @parameters : Hash(String, Types::TaskParameterValue),
          @step_id : String,
          @task_id : String? = nil
        )
        end
      end

      # The details of a task run in a session action.
      struct TaskRunSessionActionDefinitionSummary
        include JSON::Serializable

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The parameters of a task run in a session action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TaskParameterValue)?

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        def initialize(
          @step_id : String,
          @parameters : Hash(String, Types::TaskParameterValue)? = nil,
          @task_id : String? = nil
        )
        end
      end

      # The details of a task search.
      struct TaskSearchSummary
        include JSON::Serializable

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The number of times that the task failed and was retried.
        @[JSON::Field(key: "failureRetryCount")]
        getter failure_retry_count : Int32?

        # The job ID.
        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The latest session action ID for the task.
        @[JSON::Field(key: "latestSessionActionId")]
        getter latest_session_action_id : String?

        # The parameters to search for.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TaskParameterValue)?

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        # The run status of the task.
        @[JSON::Field(key: "runStatus")]
        getter run_status : String?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The step ID.
        @[JSON::Field(key: "stepId")]
        getter step_id : String?

        # The run status that the task is being updated to.
        @[JSON::Field(key: "targetRunStatus")]
        getter target_run_status : String?

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @ended_at : Time? = nil,
          @failure_retry_count : Int32? = nil,
          @job_id : String? = nil,
          @latest_session_action_id : String? = nil,
          @parameters : Hash(String, Types::TaskParameterValue)? = nil,
          @queue_id : String? = nil,
          @run_status : String? = nil,
          @started_at : Time? = nil,
          @step_id : String? = nil,
          @target_run_status : String? = nil,
          @task_id : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # The details of a task.
      struct TaskSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The run status of the task.
        @[JSON::Field(key: "runStatus")]
        getter run_status : String

        # The task ID.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The number of times that the task failed and was retried.
        @[JSON::Field(key: "failureRetryCount")]
        getter failure_retry_count : Int32?

        # The latest session action ID for the task.
        @[JSON::Field(key: "latestSessionActionId")]
        getter latest_session_action_id : String?

        # The task parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TaskParameterValue)?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The run status on which the started.
        @[JSON::Field(key: "targetRunStatus")]
        getter target_run_status : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @run_status : String,
          @task_id : String,
          @ended_at : Time? = nil,
          @failure_retry_count : Int32? = nil,
          @latest_session_action_id : String? = nil,
          @parameters : Hash(String, Types::TaskParameterValue)? = nil,
          @started_at : Time? = nil,
          @target_run_status : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Your request exceeded a request rate quota.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # Information about the resources in use when the exception was thrown.
        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        # Identifies the quota that is being throttled.
        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The number of seconds a client should wait before retrying the request.
        @[JSON::Field(key: "Retry-After")]
        getter retry_after_seconds : Int32?

        # Identifies the service that is being throttled.
        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String,
          @context : Hash(String, String)? = nil,
          @quota_code : String? = nil,
          @retry_after_seconds : Int32? = nil,
          @service_code : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the resource to remove the tag from.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # They keys of the tag.
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

      struct UpdateBudgetRequest
        include JSON::Serializable

        # The budget ID to update.
        @[JSON::Field(key: "budgetId")]
        getter budget_id : String

        # The farm ID of the budget to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The budget actions to add. Budget actions specify what happens when the budget runs out.
        @[JSON::Field(key: "actionsToAdd")]
        getter actions_to_add : Array(Types::BudgetActionToAdd)?

        # The budget actions to remove from the budget.
        @[JSON::Field(key: "actionsToRemove")]
        getter actions_to_remove : Array(Types::BudgetActionToRemove)?

        # The dollar limit to update on the budget. Based on consumed usage.
        @[JSON::Field(key: "approximateDollarLimit")]
        getter approximate_dollar_limit : Float64?

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The description of the budget to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the budget to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The schedule to update.
        @[JSON::Field(key: "schedule")]
        getter schedule : Types::BudgetSchedule?

        # Updates the status of the budget. ACTIVE –The budget is being evaluated. INACTIVE –The budget is
        # inactive. This can include Expired, Canceled, or deleted Deleted statuses.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @budget_id : String,
          @farm_id : String,
          @actions_to_add : Array(Types::BudgetActionToAdd)? = nil,
          @actions_to_remove : Array(Types::BudgetActionToRemove)? = nil,
          @approximate_dollar_limit : Float64? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @schedule : Types::BudgetSchedule? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateBudgetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateFarmRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The description of the farm to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the farm to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        def initialize(
          @farm_id : String,
          @description : String? = nil,
          @display_name : String? = nil
        )
        end
      end

      struct UpdateFarmResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateFleetRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID to update.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The fleet configuration to update.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::FleetConfiguration?

        # The description of the fleet to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the fleet to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # Provides a script that runs as a worker is starting up that you can use to provide additional
        # configuration for workers in your fleet.
        @[JSON::Field(key: "hostConfiguration")]
        getter host_configuration : Types::HostConfiguration?

        # The maximum number of workers in the fleet. Deadline Cloud limits the number of workers to less than
        # or equal to the fleet's maximum worker count. The service maintains eventual consistency for the
        # worker count. If you make multiple rapid calls to CreateWorker before the field updates, you might
        # exceed your fleet's maximum worker count. For example, if your maxWorkerCount is 10 and you
        # currently have 9 workers, making two quick CreateWorker calls might successfully create 2 workers
        # instead of 1, resulting in 11 total workers.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The minimum number of workers in the fleet.
        @[JSON::Field(key: "minWorkerCount")]
        getter min_worker_count : Int32?

        # The IAM role ARN that the fleet's workers assume while running jobs.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @client_token : String? = nil,
          @configuration : Types::FleetConfiguration? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @host_configuration : Types::HostConfiguration? = nil,
          @max_worker_count : Int32? = nil,
          @min_worker_count : Int32? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateFleetResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateJobRequest
        include JSON::Serializable

        # The farm ID of the job to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to update.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID of the job to update.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The status of a job in its lifecycle. When you change the status of the job to ARCHIVED , the job
        # can't be scheduled or archived. An archived jobs and its steps and tasks are deleted after 120 days.
        # The job can't be recovered.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String?

        # The number of task failures before the job stops running and is marked as FAILED .
        @[JSON::Field(key: "maxFailedTasksCount")]
        getter max_failed_tasks_count : Int32?

        # The maximum number of retries for a job.
        @[JSON::Field(key: "maxRetriesPerTask")]
        getter max_retries_per_task : Int32?

        # The maximum number of worker hosts that can concurrently process a job. When the maxWorkerCount is
        # reached, no more workers will be assigned to process the job, even if the fleets assigned to the
        # job's queue has available workers. You can't set the maxWorkerCount to 0. If you set it to -1, there
        # is no maximum number of workers. If you don't specify the maxWorkerCount , the default is -1. The
        # maximum number of workers that can process tasks in the job.
        @[JSON::Field(key: "maxWorkerCount")]
        getter max_worker_count : Int32?

        # The job priority to update.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The task status to update the job's tasks to.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @client_token : String? = nil,
          @lifecycle_status : String? = nil,
          @max_failed_tasks_count : Int32? = nil,
          @max_retries_per_task : Int32? = nil,
          @max_worker_count : Int32? = nil,
          @priority : Int32? = nil,
          @target_task_run_status : String? = nil
        )
        end
      end

      struct UpdateJobResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateLimitRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the limit.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit to update.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The new description of the limit. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The new display name of the limit. This field can store any content. Escape or encode this content
        # before displaying it on a webpage or any other system that might interpret the content of this
        # field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The maximum number of resources constrained by this limit. When all of the resources are in use,
        # steps that require the limit won't be scheduled until the resource is available. If more than the
        # new maximum number is currently in use, running jobs finish but no new jobs are started until the
        # number of resources in use is below the new maximum number. The maxCount must not be 0. If the value
        # is -1, there is no restriction on the number of resources that can be acquired for this limit.
        @[JSON::Field(key: "maxCount")]
        getter max_count : Int32?

        def initialize(
          @farm_id : String,
          @limit_id : String,
          @description : String? = nil,
          @display_name : String? = nil,
          @max_count : Int32? = nil
        )
        end
      end

      struct UpdateLimitResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateMonitorRequest
        include JSON::Serializable

        # The unique identifier of the monitor to update.
        @[JSON::Field(key: "monitorId")]
        getter monitor_id : String

        # The new value to use for the monitor's display name. This field can store any content. Escape or
        # encode this content before displaying it on a webpage or any other system that might interpret the
        # content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The Amazon Resource Name of the new IAM role to use with the monitor.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The new value of the subdomain to use when forming the monitor URL.
        @[JSON::Field(key: "subdomain")]
        getter subdomain : String?

        def initialize(
          @monitor_id : String,
          @display_name : String? = nil,
          @role_arn : String? = nil,
          @subdomain : String? = nil
        )
        end
      end

      struct UpdateMonitorResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateQueueEnvironmentRequest
        include JSON::Serializable

        # The farm ID of the queue environment to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue environment ID to update.
        @[JSON::Field(key: "queueEnvironmentId")]
        getter queue_environment_id : String

        # The queue ID of the queue environment to update.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The priority to update.
        @[JSON::Field(key: "priority")]
        getter priority : Int32?

        # The template to update.
        @[JSON::Field(key: "template")]
        getter template : String?

        # The template type to update.
        @[JSON::Field(key: "templateType")]
        getter template_type : String?

        def initialize(
          @farm_id : String,
          @queue_environment_id : String,
          @queue_id : String,
          @client_token : String? = nil,
          @priority : Int32? = nil,
          @template : String? = nil,
          @template_type : String? = nil
        )
        end
      end

      struct UpdateQueueEnvironmentResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateQueueFleetAssociationRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID to update.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The queue ID to update.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The status to update.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @queue_id : String,
          @status : String
        )
        end
      end

      struct UpdateQueueFleetAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateQueueLimitAssociationRequest
        include JSON::Serializable

        # The unique identifier of the farm that contains the associated queues and limits.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The unique identifier of the limit associated to the queue.
        @[JSON::Field(key: "limitId")]
        getter limit_id : String

        # The unique identifier of the queue associated to the limit.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # Sets the status of the limit. You can mark the limit active, or you can stop usage of the limit and
        # either complete existing tasks or cancel any existing tasks immediately.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @farm_id : String,
          @limit_id : String,
          @queue_id : String,
          @status : String
        )
        end
      end

      struct UpdateQueueLimitAssociationResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateQueueRequest
        include JSON::Serializable

        # The farm ID to update in the queue.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The queue ID to update.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The storage profile IDs to add.
        @[JSON::Field(key: "allowedStorageProfileIdsToAdd")]
        getter allowed_storage_profile_ids_to_add : Array(String)?

        # The storage profile ID to remove.
        @[JSON::Field(key: "allowedStorageProfileIdsToRemove")]
        getter allowed_storage_profile_ids_to_remove : Array(String)?

        # The idempotency token to update in the queue.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The default action to take for a queue update if a budget isn't configured.
        @[JSON::Field(key: "defaultBudgetAction")]
        getter default_budget_action : String?

        # The description of the queue to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The display name of the queue to update. This field can store any content. Escape or encode this
        # content before displaying it on a webpage or any other system that might interpret the content of
        # this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The job attachment settings to update for the queue.
        @[JSON::Field(key: "jobAttachmentSettings")]
        getter job_attachment_settings : Types::JobAttachmentSettings?

        # Update the jobs in the queue to run as a specified POSIX user.
        @[JSON::Field(key: "jobRunAsUser")]
        getter job_run_as_user : Types::JobRunAsUser?

        # The required file system location names to add to the queue.
        @[JSON::Field(key: "requiredFileSystemLocationNamesToAdd")]
        getter required_file_system_location_names_to_add : Array(String)?

        # The required file system location names to remove from the queue.
        @[JSON::Field(key: "requiredFileSystemLocationNamesToRemove")]
        getter required_file_system_location_names_to_remove : Array(String)?

        # The IAM role ARN that's used to run jobs from this queue.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @farm_id : String,
          @queue_id : String,
          @allowed_storage_profile_ids_to_add : Array(String)? = nil,
          @allowed_storage_profile_ids_to_remove : Array(String)? = nil,
          @client_token : String? = nil,
          @default_budget_action : String? = nil,
          @description : String? = nil,
          @display_name : String? = nil,
          @job_attachment_settings : Types::JobAttachmentSettings? = nil,
          @job_run_as_user : Types::JobRunAsUser? = nil,
          @required_file_system_location_names_to_add : Array(String)? = nil,
          @required_file_system_location_names_to_remove : Array(String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateQueueResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateSessionRequest
        include JSON::Serializable

        # The farm ID to update in the session.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to update in the session.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to update in the session.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The session ID to update.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The life cycle status to update in the session.
        @[JSON::Field(key: "targetLifecycleStatus")]
        getter target_lifecycle_status : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @session_id : String,
          @target_lifecycle_status : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateSessionResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateStepRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to update.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to update.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID to update.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The task status to update the step's tasks to.
        @[JSON::Field(key: "targetTaskRunStatus")]
        getter target_task_run_status : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String,
          @target_task_run_status : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateStepResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateStorageProfileRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The storage profile ID to update.
        @[JSON::Field(key: "storageProfileId")]
        getter storage_profile_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        # The display name of the storage profile to update. This field can store any content. Escape or
        # encode this content before displaying it on a webpage or any other system that might interpret the
        # content of this field.
        @[JSON::Field(key: "displayName")]
        getter display_name : String?

        # The file system location names to add.
        @[JSON::Field(key: "fileSystemLocationsToAdd")]
        getter file_system_locations_to_add : Array(Types::FileSystemLocation)?

        # The file system location names to remove.
        @[JSON::Field(key: "fileSystemLocationsToRemove")]
        getter file_system_locations_to_remove : Array(Types::FileSystemLocation)?

        # The OS system to update.
        @[JSON::Field(key: "osFamily")]
        getter os_family : String?

        def initialize(
          @farm_id : String,
          @storage_profile_id : String,
          @client_token : String? = nil,
          @display_name : String? = nil,
          @file_system_locations_to_add : Array(Types::FileSystemLocation)? = nil,
          @file_system_locations_to_remove : Array(Types::FileSystemLocation)? = nil,
          @os_family : String? = nil
        )
        end
      end

      struct UpdateStorageProfileResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateTaskRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The job ID to update.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The queue ID to update.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The step ID to update.
        @[JSON::Field(key: "stepId")]
        getter step_id : String

        # The run status with which to start the task.
        @[JSON::Field(key: "targetRunStatus")]
        getter target_run_status : String

        # The task ID to update.
        @[JSON::Field(key: "taskId")]
        getter task_id : String

        # The unique token which the server uses to recognize retries of the same request.
        @[JSON::Field(key: "X-Amz-Client-Token")]
        getter client_token : String?

        def initialize(
          @farm_id : String,
          @job_id : String,
          @queue_id : String,
          @step_id : String,
          @target_run_status : String,
          @task_id : String,
          @client_token : String? = nil
        )
        end
      end

      struct UpdateTaskResponse
        include JSON::Serializable

        def initialize
        end
      end

      struct UpdateWorkerRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID to update.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The worker ID to update.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The worker capabilities to update.
        @[JSON::Field(key: "capabilities")]
        getter capabilities : Types::WorkerCapabilities?

        # The host properties to update.
        @[JSON::Field(key: "hostProperties")]
        getter host_properties : Types::HostPropertiesRequest?

        # The worker status to update.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @worker_id : String,
          @capabilities : Types::WorkerCapabilities? = nil,
          @host_properties : Types::HostPropertiesRequest? = nil,
          @status : String? = nil
        )
        end
      end

      struct UpdateWorkerResponse
        include JSON::Serializable

        # The script that runs as a worker is starting up that you can use to provide additional configuration
        # for workers in your fleet.
        @[JSON::Field(key: "hostConfiguration")]
        getter host_configuration : Types::HostConfiguration?

        # The worker log to update.
        @[JSON::Field(key: "log")]
        getter log : Types::LogConfiguration?

        def initialize(
          @host_configuration : Types::HostConfiguration? = nil,
          @log : Types::LogConfiguration? = nil
        )
        end
      end

      struct UpdateWorkerScheduleRequest
        include JSON::Serializable

        # The farm ID to update.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID to update.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The worker ID to update.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The session actions associated with the worker schedule to update.
        @[JSON::Field(key: "updatedSessionActions")]
        getter updated_session_actions : Hash(String, Types::UpdatedSessionActionInfo)?

        def initialize(
          @farm_id : String,
          @fleet_id : String,
          @worker_id : String,
          @updated_session_actions : Hash(String, Types::UpdatedSessionActionInfo)? = nil
        )
        end
      end

      struct UpdateWorkerScheduleResponse
        include JSON::Serializable

        # The assigned sessions to update.
        @[JSON::Field(key: "assignedSessions")]
        getter assigned_sessions : Hash(String, Types::AssignedSession)

        # The session actions associated with the worker schedule to cancel.
        @[JSON::Field(key: "cancelSessionActions")]
        getter cancel_session_actions : Hash(String, Array(String))

        # Updates the time interval (in seconds) for the schedule.
        @[JSON::Field(key: "updateIntervalSeconds")]
        getter update_interval_seconds : Int32

        # The status to update the worker to.
        @[JSON::Field(key: "desiredWorkerStatus")]
        getter desired_worker_status : String?

        def initialize(
          @assigned_sessions : Hash(String, Types::AssignedSession),
          @cancel_session_actions : Hash(String, Array(String)),
          @update_interval_seconds : Int32,
          @desired_worker_status : String? = nil
        )
        end
      end

      # The updated session action information as it relates to completion and progress of the session.
      struct UpdatedSessionActionInfo
        include JSON::Serializable

        # The status of the session upon completion.
        @[JSON::Field(key: "completedStatus")]
        getter completed_status : String?

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # A list of output manifest properties reported by the worker agent, with each entry corresponding to
        # a manifest property in the job.
        @[JSON::Field(key: "manifests")]
        getter manifests : Array(Types::TaskRunManifestPropertiesRequest)?

        # The process exit code. The default Deadline Cloud worker agent converts unsigned 32-bit exit codes
        # to signed 32-bit exit codes.
        @[JSON::Field(key: "processExitCode")]
        getter process_exit_code : Int32?

        # A message to indicate the progress of the updated session action.
        @[JSON::Field(key: "progressMessage")]
        getter progress_message : String?

        # The percentage completed.
        @[JSON::Field(key: "progressPercent")]
        getter progress_percent : Float64?

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time?

        # The updated time.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        def initialize(
          @completed_status : String? = nil,
          @ended_at : Time? = nil,
          @manifests : Array(Types::TaskRunManifestPropertiesRequest)? = nil,
          @process_exit_code : Int32? = nil,
          @progress_message : String? = nil,
          @progress_percent : Float64? = nil,
          @started_at : Time? = nil,
          @updated_at : Time? = nil
        )
        end
      end

      # The usage details of the allotted budget.
      struct UsageTrackingResource
        include JSON::Serializable

        # The queue ID.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String?

        def initialize(
          @queue_id : String? = nil
        )
        end
      end

      # Allows setting a specific user's job to run first.
      struct UserJobsFirst
        include JSON::Serializable

        # The user's ID.
        @[JSON::Field(key: "userIdentityId")]
        getter user_identity_id : String

        def initialize(
          @user_identity_id : String
        )
        end
      end

      # The allowable range of vCPU processing power for the fleet.
      struct VCpuCountRange
        include JSON::Serializable

        # The minimum amount of vCPU.
        @[JSON::Field(key: "min")]
        getter min : Int32

        # The maximum amount of vCPU.
        @[JSON::Field(key: "max")]
        getter max : Int32?

        def initialize(
          @min : Int32,
          @max : Int32? = nil
        )
        end
      end

      # The request isn't valid. This can occur if your request contains malformed JSON or unsupported
      # characters.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String

        # The reason that the request failed validation.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # Information about the resources in use when the exception was thrown.
        @[JSON::Field(key: "context")]
        getter context : Hash(String, String)?

        # A list of fields that failed validation.
        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?

        def initialize(
          @message : String,
          @reason : String,
          @context : Hash(String, String)? = nil,
          @field_list : Array(Types::ValidationExceptionField)? = nil
        )
        end
      end

      # The details of a validation exception.
      struct ValidationExceptionField
        include JSON::Serializable

        # The error message for the validation exception.
        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the validation exception.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The configuration options for a service managed fleet's VPC.
      struct VpcConfiguration
        include JSON::Serializable

        # The ARNs of the VPC Lattice resource configurations attached to the fleet.
        @[JSON::Field(key: "resourceConfigurationArns")]
        getter resource_configuration_arns : Array(String)?

        def initialize(
          @resource_configuration_arns : Array(String)? = nil
        )
        end
      end

      # The Windows user details.
      struct WindowsUser
        include JSON::Serializable

        # The password ARN for the Windows user.
        @[JSON::Field(key: "passwordArn")]
        getter password_arn : String

        # The user.
        @[JSON::Field(key: "user")]
        getter user : String

        def initialize(
          @password_arn : String,
          @user : String
        )
        end
      end

      # The details of the worker amount capability.
      struct WorkerAmountCapability
        include JSON::Serializable

        # The name of the worker amount capability.
        @[JSON::Field(key: "name")]
        getter name : String

        # The value of the worker amount capability.
        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @name : String,
          @value : Float64
        )
        end
      end

      # The details of the worker attribute capability.
      struct WorkerAttributeCapability
        include JSON::Serializable

        # The name of the worker attribute capability.
        @[JSON::Field(key: "name")]
        getter name : String

        # The values of the worker amount capability.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @name : String,
          @values : Array(String)
        )
        end
      end

      # The details for worker capabilities.
      struct WorkerCapabilities
        include JSON::Serializable

        # The worker capabilities amounts on a list of worker capabilities.
        @[JSON::Field(key: "amounts")]
        getter amounts : Array(Types::WorkerAmountCapability)

        # The worker attribute capabilities in the list of attribute capabilities.
        @[JSON::Field(key: "attributes")]
        getter attributes : Array(Types::WorkerAttributeCapability)

        def initialize(
          @amounts : Array(Types::WorkerAmountCapability),
          @attributes : Array(Types::WorkerAttributeCapability)
        )
        end
      end

      # The details of a worker search.
      struct WorkerSearchSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time?

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String?

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String?

        # Provides the Amazon EC2 instance properties of the worker host.
        @[JSON::Field(key: "hostProperties")]
        getter host_properties : Types::HostPropertiesResponse?

        # The status of the worker search.
        @[JSON::Field(key: "status")]
        getter status : String?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        # The worker ID.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String?

        def initialize(
          @created_at : Time? = nil,
          @created_by : String? = nil,
          @fleet_id : String? = nil,
          @host_properties : Types::HostPropertiesResponse? = nil,
          @status : String? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil,
          @worker_id : String? = nil
        )
        end
      end

      # Summarizes the session for a particular worker.
      struct WorkerSessionSummary
        include JSON::Serializable

        # The job ID for the job associated with the worker's session.
        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The life cycle status for the worker's session.
        @[JSON::Field(key: "lifecycleStatus")]
        getter lifecycle_status : String

        # The queue ID for the queue associated to the worker.
        @[JSON::Field(key: "queueId")]
        getter queue_id : String

        # The session ID for the session action.
        @[JSON::Field(key: "sessionId")]
        getter session_id : String

        # The date and time the resource started running.
        @[JSON::Field(key: "startedAt")]
        getter started_at : Time

        # The date and time the resource ended running.
        @[JSON::Field(key: "endedAt")]
        getter ended_at : Time?

        # The life cycle status
        @[JSON::Field(key: "targetLifecycleStatus")]
        getter target_lifecycle_status : String?

        def initialize(
          @job_id : String,
          @lifecycle_status : String,
          @queue_id : String,
          @session_id : String,
          @started_at : Time,
          @ended_at : Time? = nil,
          @target_lifecycle_status : String? = nil
        )
        end
      end

      # The summary of details for a worker.
      struct WorkerSummary
        include JSON::Serializable

        # The date and time the resource was created.
        @[JSON::Field(key: "createdAt")]
        getter created_at : Time

        # The user or system that created this resource.
        @[JSON::Field(key: "createdBy")]
        getter created_by : String

        # The farm ID.
        @[JSON::Field(key: "farmId")]
        getter farm_id : String

        # The fleet ID.
        @[JSON::Field(key: "fleetId")]
        getter fleet_id : String

        # The status of the worker.
        @[JSON::Field(key: "status")]
        getter status : String

        # The worker ID.
        @[JSON::Field(key: "workerId")]
        getter worker_id : String

        # The host properties of the worker.
        @[JSON::Field(key: "hostProperties")]
        getter host_properties : Types::HostPropertiesResponse?

        # The log configuration for the worker.
        @[JSON::Field(key: "log")]
        getter log : Types::LogConfiguration?

        # The date and time the resource was updated.
        @[JSON::Field(key: "updatedAt")]
        getter updated_at : Time?

        # The user or system that updated this resource.
        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @created_at : Time,
          @created_by : String,
          @farm_id : String,
          @fleet_id : String,
          @status : String,
          @worker_id : String,
          @host_properties : Types::HostPropertiesResponse? = nil,
          @log : Types::LogConfiguration? = nil,
          @updated_at : Time? = nil,
          @updated_by : String? = nil
        )
        end
      end
    end
  end
end
