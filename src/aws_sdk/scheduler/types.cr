require "json"
require "time"

module AwsSdk
  module Scheduler
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

      # The details of a capacity provider strategy.
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

      # Updating or deleting the resource can cause an inconsistent state.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct CreateScheduleGroupInput
        include JSON::Serializable

        # The name of the schedule group that you are creating.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you do
        # not specify a client token, EventBridge Scheduler uses a randomly generated token for the request to
        # ensure idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The list of tags to associate with the schedule group.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      struct CreateScheduleGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule group.
        @[JSON::Field(key: "ScheduleGroupArn")]
        getter schedule_group_arn : String

        def initialize(
          @schedule_group_arn : String
        )
        end
      end

      struct CreateScheduleInput
        include JSON::Serializable

        # Allows you to configure a time window during which EventBridge Scheduler invokes the schedule.
        @[JSON::Field(key: "FlexibleTimeWindow")]
        getter flexible_time_window : Types::FlexibleTimeWindow

        # The name of the schedule that you are creating.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The expression that defines when the schedule runs. The following formats are supported. at
        # expression - at(yyyy-mm-ddThh:mm:ss) rate expression - rate(value unit) cron expression -
        # cron(fields) You can use at expressions to create one-time schedules that invoke a target once, at
        # the time and in the time zone, that you specify. You can use rate and cron expressions to create
        # recurring schedules. Rate-based schedules are useful when you want to invoke a target at regular
        # intervals, such as every 15 minutes or every five days. Cron-based schedules are useful when you
        # want to invoke a target periodically at a specific time, such as at 8:00 am (UTC+0) every 1st day of
        # the month. A cron expression consists of six fields separated by white spaces: (minutes hours
        # day_of_month month day_of_week year) . A rate expression consists of a value as a positive integer,
        # and a unit with the following options: minute | minutes | hour | hours | day | days For more
        # information and examples, see Schedule types on EventBridge Scheduler in the EventBridge Scheduler
        # User Guide .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # The schedule's target.
        @[JSON::Field(key: "Target")]
        getter target : Types::Target

        # Specifies the action that EventBridge Scheduler applies to the schedule after the schedule completes
        # invoking the target.
        @[JSON::Field(key: "ActionAfterCompletion")]
        getter action_after_completion : String?

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you do
        # not specify a client token, EventBridge Scheduler uses a randomly generated token for the request to
        # ensure idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description you specify for the schedule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date, in UTC, before which the schedule can invoke its target. Depending on the schedule's
        # recurrence expression, invocations might stop on, or before, the EndDate you specify. EventBridge
        # Scheduler ignores EndDate for one-time schedules.
        @[JSON::Field(key: "EndDate")]
        getter end_date : Time?

        # The name of the schedule group to associate with this schedule. If you omit this, the default
        # schedule group is used.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The Amazon Resource Name (ARN) for the customer managed KMS key that EventBridge Scheduler will use
        # to encrypt and decrypt your data.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The timezone in which the scheduling expression is evaluated.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # The date, in UTC, after which the schedule can begin invoking its target. Depending on the
        # schedule's recurrence expression, invocations might occur on, or after, the StartDate you specify.
        # EventBridge Scheduler ignores StartDate for one-time schedules.
        @[JSON::Field(key: "StartDate")]
        getter start_date : Time?

        # Specifies whether the schedule is enabled or disabled.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @flexible_time_window : Types::FlexibleTimeWindow,
          @name : String,
          @schedule_expression : String,
          @target : Types::Target,
          @action_after_completion : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @end_date : Time? = nil,
          @group_name : String? = nil,
          @kms_key_arn : String? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_date : Time? = nil,
          @state : String? = nil
        )
        end
      end

      struct CreateScheduleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule.
        @[JSON::Field(key: "ScheduleArn")]
        getter schedule_arn : String

        def initialize(
          @schedule_arn : String
        )
        end
      end

      # An object that contains information about an Amazon SQS queue that EventBridge Scheduler uses as a
      # dead-letter queue for your schedule. If specified, EventBridge Scheduler delivers failed events that
      # could not be successfully delivered to a target to the queue.
      struct DeadLetterConfig
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the SQS queue specified as the destination for the dead-letter
        # queue.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      struct DeleteScheduleGroupInput
        include JSON::Serializable

        # The name of the schedule group to delete.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you do
        # not specify a client token, EventBridge Scheduler uses a randomly generated token for the request to
        # ensure idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @name : String,
          @client_token : String? = nil
        )
        end
      end

      struct DeleteScheduleGroupOutput
        include JSON::Serializable

        def initialize
        end
      end

      struct DeleteScheduleInput
        include JSON::Serializable

        # The name of the schedule to delete.
        @[JSON::Field(key: "Name")]
        getter name : String

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you do
        # not specify a client token, EventBridge Scheduler uses a randomly generated token for the request to
        # ensure idempotency.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The name of the schedule group associated with this schedule. If you omit this, the default schedule
        # group is used.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @name : String,
          @client_token : String? = nil,
          @group_name : String? = nil
        )
        end
      end

      struct DeleteScheduleOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The templated target type for the Amazon ECS RunTask API operation.
      struct EcsParameters
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the task definition to use if the event target is an Amazon ECS
        # task.
        @[JSON::Field(key: "TaskDefinitionArn")]
        getter task_definition_arn : String

        # The capacity provider strategy to use for the task.
        @[JSON::Field(key: "CapacityProviderStrategy")]
        getter capacity_provider_strategy : Array(Types::CapacityProviderStrategyItem)?

        # Specifies whether to enable Amazon ECS managed tags for the task. For more information, see Tagging
        # Your Amazon ECS Resources in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "EnableECSManagedTags")]
        getter enable_ecs_managed_tags : Bool?

        # Whether or not to enable the execute command functionality for the containers in this task. If true,
        # this enables execute command functionality on all containers in the task.
        @[JSON::Field(key: "EnableExecuteCommand")]
        getter enable_execute_command : Bool?

        # Specifies an ECS task group for the task. The maximum length is 255 characters.
        @[JSON::Field(key: "Group")]
        getter group : String?

        # Specifies the launch type on which your task is running. The launch type that you specify here must
        # match one of the launch type (compatibilities) of the target task. The FARGATE value is supported
        # only in the Regions where Fargate with Amazon ECS is supported. For more information, see AWS
        # Fargate on Amazon ECS in the Amazon ECS Developer Guide .
        @[JSON::Field(key: "LaunchType")]
        getter launch_type : String?

        # This structure specifies the network configuration for an ECS task.
        @[JSON::Field(key: "NetworkConfiguration")]
        getter network_configuration : Types::NetworkConfiguration?

        # An array of placement constraint objects to use for the task. You can specify up to 10 constraints
        # per task (including constraints in the task definition and those specified at runtime).
        @[JSON::Field(key: "PlacementConstraints")]
        getter placement_constraints : Array(Types::PlacementConstraint)?

        # The task placement strategy for a task or service.
        @[JSON::Field(key: "PlacementStrategy")]
        getter placement_strategy : Array(Types::PlacementStrategy)?

        # Specifies the platform version for the task. Specify only the numeric portion of the platform
        # version, such as 1.1.0 .
        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # Specifies whether to propagate the tags from the task definition to the task. If no value is
        # specified, the tags are not propagated. Tags can only be propagated to the task during task
        # creation. To add tags to a task after task creation, use Amazon ECS's TagResource API action.
        @[JSON::Field(key: "PropagateTags")]
        getter propagate_tags : String?

        # The reference ID to use for the task.
        @[JSON::Field(key: "ReferenceId")]
        getter reference_id : String?

        # The metadata that you apply to the task to help you categorize and organize them. Each tag consists
        # of a key and an optional value, both of which you define. For more information, see RunTask in the
        # Amazon ECS API Reference .
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Hash(String, String))?

        # The number of tasks to create based on TaskDefinition . The default is 1 .
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
          @placement_constraints : Array(Types::PlacementConstraint)? = nil,
          @placement_strategy : Array(Types::PlacementStrategy)? = nil,
          @platform_version : String? = nil,
          @propagate_tags : String? = nil,
          @reference_id : String? = nil,
          @tags : Array(Hash(String, String))? = nil,
          @task_count : Int32? = nil
        )
        end
      end

      # The templated target type for the EventBridge PutEvents API operation.
      struct EventBridgeParameters
        include JSON::Serializable

        # A free-form string, with a maximum of 128 characters, used to decide what fields to expect in the
        # event detail.
        @[JSON::Field(key: "DetailType")]
        getter detail_type : String

        # The source of the event.
        @[JSON::Field(key: "Source")]
        getter source : String

        def initialize(
          @detail_type : String,
          @source : String
        )
        end
      end

      # Allows you to configure a time window during which EventBridge Scheduler invokes the schedule.
      struct FlexibleTimeWindow
        include JSON::Serializable

        # Determines whether the schedule is invoked within a flexible time window.
        @[JSON::Field(key: "Mode")]
        getter mode : String

        # The maximum time window during which a schedule can be invoked.
        @[JSON::Field(key: "MaximumWindowInMinutes")]
        getter maximum_window_in_minutes : Int32?

        def initialize(
          @mode : String,
          @maximum_window_in_minutes : Int32? = nil
        )
        end
      end

      struct GetScheduleGroupInput
        include JSON::Serializable

        # The name of the schedule group to retrieve.
        @[JSON::Field(key: "Name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct GetScheduleGroupOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule group.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the schedule group was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The time at which the schedule group was last modified.
        @[JSON::Field(key: "LastModificationDate")]
        getter last_modification_date : Time?

        # The name of the schedule group.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the state of the schedule group.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @last_modification_date : Time? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct GetScheduleInput
        include JSON::Serializable

        # The name of the schedule to retrieve.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The name of the schedule group associated with this schedule. If you omit this, EventBridge
        # Scheduler assumes that the schedule is associated with the default group.
        @[JSON::Field(key: "groupName")]
        getter group_name : String?

        def initialize(
          @name : String,
          @group_name : String? = nil
        )
        end
      end

      struct GetScheduleOutput
        include JSON::Serializable

        # Indicates the action that EventBridge Scheduler applies to the schedule after the schedule completes
        # invoking the target.
        @[JSON::Field(key: "ActionAfterCompletion")]
        getter action_after_completion : String?

        # The Amazon Resource Name (ARN) of the schedule.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the schedule was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The description of the schedule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date, in UTC, before which the schedule can invoke its target. Depending on the schedule's
        # recurrence expression, invocations might stop on, or before, the EndDate you specify. EventBridge
        # Scheduler ignores EndDate for one-time schedules.
        @[JSON::Field(key: "EndDate")]
        getter end_date : Time?

        # Allows you to configure a time window during which EventBridge Scheduler invokes the schedule.
        @[JSON::Field(key: "FlexibleTimeWindow")]
        getter flexible_time_window : Types::FlexibleTimeWindow?

        # The name of the schedule group associated with this schedule.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The ARN for a customer managed KMS Key that is be used to encrypt and decrypt your data.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The time at which the schedule was last modified.
        @[JSON::Field(key: "LastModificationDate")]
        getter last_modification_date : Time?

        # The name of the schedule.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # The expression that defines when the schedule runs. The following formats are supported. at
        # expression - at(yyyy-mm-ddThh:mm:ss) rate expression - rate(value unit) cron expression -
        # cron(fields) You can use at expressions to create one-time schedules that invoke a target once, at
        # the time and in the time zone, that you specify. You can use rate and cron expressions to create
        # recurring schedules. Rate-based schedules are useful when you want to invoke a target at regular
        # intervals, such as every 15 minutes or every five days. Cron-based schedules are useful when you
        # want to invoke a target periodically at a specific time, such as at 8:00 am (UTC+0) every 1st day of
        # the month. A cron expression consists of six fields separated by white spaces: (minutes hours
        # day_of_month month day_of_week year) . A rate expression consists of a value as a positive integer,
        # and a unit with the following options: minute | minutes | hour | hours | day | days For more
        # information and examples, see Schedule types on EventBridge Scheduler in the EventBridge Scheduler
        # User Guide .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String?

        # The timezone in which the scheduling expression is evaluated.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # The date, in UTC, after which the schedule can begin invoking its target. Depending on the
        # schedule's recurrence expression, invocations might occur on, or after, the StartDate you specify.
        # EventBridge Scheduler ignores StartDate for one-time schedules.
        @[JSON::Field(key: "StartDate")]
        getter start_date : Time?

        # Specifies whether the schedule is enabled or disabled.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The schedule target.
        @[JSON::Field(key: "Target")]
        getter target : Types::Target?

        def initialize(
          @action_after_completion : String? = nil,
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @description : String? = nil,
          @end_date : Time? = nil,
          @flexible_time_window : Types::FlexibleTimeWindow? = nil,
          @group_name : String? = nil,
          @kms_key_arn : String? = nil,
          @last_modification_date : Time? = nil,
          @name : String? = nil,
          @schedule_expression : String? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_date : Time? = nil,
          @state : String? = nil,
          @target : Types::Target? = nil
        )
        end
      end

      # Unexpected error encountered while processing the request.
      struct InternalServerException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The templated target type for the Amazon Kinesis PutRecord API operation.
      struct KinesisParameters
        include JSON::Serializable

        # Specifies the shard to which EventBridge Scheduler sends the event. For more information, see Amazon
        # Kinesis Data Streams terminology and concepts in the Amazon Kinesis Streams Developer Guide .
        @[JSON::Field(key: "PartitionKey")]
        getter partition_key : String

        def initialize(
          @partition_key : String
        )
        end
      end

      struct ListScheduleGroupsInput
        include JSON::Serializable

        # If specified, limits the number of results returned by this operation. The operation also returns a
        # NextToken which you can use in a subsequent operation to retrieve the next set of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The name prefix that you can use to return a filtered list of your schedule groups.
        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListScheduleGroupsOutput
        include JSON::Serializable

        # The schedule groups that match the specified criteria.
        @[JSON::Field(key: "ScheduleGroups")]
        getter schedule_groups : Array(Types::ScheduleGroupSummary)

        # Indicates whether there are additional results to retrieve. If the value is null, there are no more
        # results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @schedule_groups : Array(Types::ScheduleGroupSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListSchedulesInput
        include JSON::Serializable

        # If specified, only lists the schedules whose associated schedule group matches the given filter.
        @[JSON::Field(key: "ScheduleGroup")]
        getter group_name : String?

        # If specified, limits the number of results returned by this operation. The operation also returns a
        # NextToken which you can use in a subsequent operation to retrieve the next set of results.
        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Schedule name prefix to return the filtered list of resources.
        @[JSON::Field(key: "NamePrefix")]
        getter name_prefix : String?

        # The token returned by a previous call to retrieve the next set of results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If specified, only lists the schedules whose current state matches the given filter.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @group_name : String? = nil,
          @max_results : Int32? = nil,
          @name_prefix : String? = nil,
          @next_token : String? = nil,
          @state : String? = nil
        )
        end
      end

      struct ListSchedulesOutput
        include JSON::Serializable

        # The schedules that match the specified criteria.
        @[JSON::Field(key: "Schedules")]
        getter schedules : Array(Types::ScheduleSummary)

        # Indicates whether there are additional results to retrieve. If the value is null, there are no more
        # results.
        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @schedules : Array(Types::ScheduleSummary),
          @next_token : String? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The ARN of the EventBridge Scheduler resource for which you want to view tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # The list of tags associated with the specified resource.
        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Specifies the network configuration for an ECS task.
      struct NetworkConfiguration
        include JSON::Serializable

        # Specifies the Amazon VPC subnets and security groups for the task, and whether a public IP address
        # is to be used. This structure is relevant only for ECS tasks that use the awsvpc network mode.
        @[JSON::Field(key: "awsvpcConfiguration")]
        getter awsvpc_configuration : Types::AwsVpcConfiguration?

        def initialize(
          @awsvpc_configuration : Types::AwsVpcConfiguration? = nil
        )
        end
      end

      # An object representing a constraint on task placement.
      struct PlacementConstraint
        include JSON::Serializable

        # A cluster query language expression to apply to the constraint. You cannot specify an expression if
        # the constraint type is distinctInstance . For more information, see Cluster query language in the
        # Amazon ECS Developer Guide .
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

      # The task placement strategy for a task or service.
      struct PlacementStrategy
        include JSON::Serializable

        # The field to apply the placement strategy against. For the spread placement strategy, valid values
        # are instanceId (or instanceId , which has the same effect), or any platform or custom attribute that
        # is applied to a container instance, such as attribute:ecs.availability-zone . For the binpack
        # placement strategy, valid values are cpu and memory . For the random placement strategy, this field
        # is not used.
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

      # The request references a resource which does not exist.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # A RetryPolicy object that includes information about the retry policy settings, including the
      # maximum age of an event, and the maximum number of times EventBridge Scheduler will try to deliver
      # the event to a target.
      struct RetryPolicy
        include JSON::Serializable

        # The maximum amount of time, in seconds, to continue to make retry attempts.
        @[JSON::Field(key: "MaximumEventAgeInSeconds")]
        getter maximum_event_age_in_seconds : Int32?

        # The maximum number of retry attempts to make before the request fails. Retry attempts with
        # exponential backoff continue until either the maximum number of attempts is made or until the
        # duration of the MaximumEventAgeInSeconds is reached.
        @[JSON::Field(key: "MaximumRetryAttempts")]
        getter maximum_retry_attempts : Int32?

        def initialize(
          @maximum_event_age_in_seconds : Int32? = nil,
          @maximum_retry_attempts : Int32? = nil
        )
        end
      end

      # The name and value pair of a parameter to use to start execution of a SageMaker Model Building
      # Pipeline.
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

      # The templated target type for the Amazon SageMaker StartPipelineExecution API operation.
      struct SageMakerPipelineParameters
        include JSON::Serializable

        # List of parameter names and values to use when executing the SageMaker Model Building Pipeline.
        @[JSON::Field(key: "PipelineParameterList")]
        getter pipeline_parameter_list : Array(Types::SageMakerPipelineParameter)?

        def initialize(
          @pipeline_parameter_list : Array(Types::SageMakerPipelineParameter)? = nil
        )
        end
      end

      # The details of a schedule group.
      struct ScheduleGroupSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule group.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the schedule group was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The time at which the schedule group was last modified.
        @[JSON::Field(key: "LastModificationDate")]
        getter last_modification_date : Time?

        # The name of the schedule group.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies the state of the schedule group.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @last_modification_date : Time? = nil,
          @name : String? = nil,
          @state : String? = nil
        )
        end
      end

      # The details of a schedule.
      struct ScheduleSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule.
        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The time at which the schedule was created.
        @[JSON::Field(key: "CreationDate")]
        getter creation_date : Time?

        # The name of the schedule group associated with this schedule.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The time at which the schedule was last modified.
        @[JSON::Field(key: "LastModificationDate")]
        getter last_modification_date : Time?

        # The name of the schedule.
        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies whether the schedule is enabled or disabled.
        @[JSON::Field(key: "State")]
        getter state : String?

        # The schedule's target details.
        @[JSON::Field(key: "Target")]
        getter target : Types::TargetSummary?

        def initialize(
          @arn : String? = nil,
          @creation_date : Time? = nil,
          @group_name : String? = nil,
          @last_modification_date : Time? = nil,
          @name : String? = nil,
          @state : String? = nil,
          @target : Types::TargetSummary? = nil
        )
        end
      end

      # The request exceeds a service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # The templated target type for the Amazon SQS SendMessage API operation. Contains the message group
      # ID to use when the target is a FIFO queue. If you specify an Amazon SQS FIFO queue as a target, the
      # queue must have content-based deduplication enabled. For more information, see Using the Amazon SQS
      # message deduplication ID in the Amazon SQS Developer Guide .
      struct SqsParameters
        include JSON::Serializable

        # The FIFO message group ID to use as the target.
        @[JSON::Field(key: "MessageGroupId")]
        getter message_group_id : String?

        def initialize(
          @message_group_id : String? = nil
        )
        end
      end

      # Tag to associate with a schedule group.
      struct Tag
        include JSON::Serializable

        # The key for the tag.
        @[JSON::Field(key: "Key")]
        getter key : String

        # The value for the tag.
        @[JSON::Field(key: "Value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule group that you are adding tags to.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tags to associate with the schedule group.
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

      # The schedule's target. EventBridge Scheduler supports templated target that invoke common API
      # operations, as well as universal targets that you can customize to invoke over 6,000 API operations
      # across more than 270 services. You can only specify one templated or universal target for a
      # schedule.
      struct Target
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        # The Amazon Resource Name (ARN) of the IAM role that EventBridge Scheduler will use for this target
        # when the schedule is invoked.
        @[JSON::Field(key: "RoleArn")]
        getter role_arn : String

        # An object that contains information about an Amazon SQS queue that EventBridge Scheduler uses as a
        # dead-letter queue for your schedule. If specified, EventBridge Scheduler delivers failed events that
        # could not be successfully delivered to a target to the queue.
        @[JSON::Field(key: "DeadLetterConfig")]
        getter dead_letter_config : Types::DeadLetterConfig?

        # The templated target type for the Amazon ECS RunTask API operation.
        @[JSON::Field(key: "EcsParameters")]
        getter ecs_parameters : Types::EcsParameters?

        # The templated target type for the EventBridge PutEvents API operation.
        @[JSON::Field(key: "EventBridgeParameters")]
        getter event_bridge_parameters : Types::EventBridgeParameters?

        # The text, or well-formed JSON, passed to the target. If you are configuring a templated Lambda, AWS
        # Step Functions, or Amazon EventBridge target, the input must be a well-formed JSON. For all other
        # target types, a JSON is not required. If you do not specify anything for this field, EventBridge
        # Scheduler delivers a default notification to the target.
        @[JSON::Field(key: "Input")]
        getter input : String?

        # The templated target type for the Amazon Kinesis PutRecord API operation.
        @[JSON::Field(key: "KinesisParameters")]
        getter kinesis_parameters : Types::KinesisParameters?

        # A RetryPolicy object that includes information about the retry policy settings, including the
        # maximum age of an event, and the maximum number of times EventBridge Scheduler will try to deliver
        # the event to a target.
        @[JSON::Field(key: "RetryPolicy")]
        getter retry_policy : Types::RetryPolicy?

        # The templated target type for the Amazon SageMaker StartPipelineExecution API operation.
        @[JSON::Field(key: "SageMakerPipelineParameters")]
        getter sage_maker_pipeline_parameters : Types::SageMakerPipelineParameters?

        # The templated target type for the Amazon SQS SendMessage API operation. Contains the message group
        # ID to use when the target is a FIFO queue. If you specify an Amazon SQS FIFO queue as a target, the
        # queue must have content-based deduplication enabled. For more information, see Using the Amazon SQS
        # message deduplication ID in the Amazon SQS Developer Guide .
        @[JSON::Field(key: "SqsParameters")]
        getter sqs_parameters : Types::SqsParameters?

        def initialize(
          @arn : String,
          @role_arn : String,
          @dead_letter_config : Types::DeadLetterConfig? = nil,
          @ecs_parameters : Types::EcsParameters? = nil,
          @event_bridge_parameters : Types::EventBridgeParameters? = nil,
          @input : String? = nil,
          @kinesis_parameters : Types::KinesisParameters? = nil,
          @retry_policy : Types::RetryPolicy? = nil,
          @sage_maker_pipeline_parameters : Types::SageMakerPipelineParameters? = nil,
          @sqs_parameters : Types::SqsParameters? = nil
        )
        end
      end

      # The details of a target.
      struct TargetSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the target.
        @[JSON::Field(key: "Arn")]
        getter arn : String

        def initialize(
          @arn : String
        )
        end
      end

      # The request was denied due to request throttling.
      struct ThrottlingException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule group from which you are removing tags.
        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.
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

      struct UpdateScheduleInput
        include JSON::Serializable

        # Allows you to configure a time window during which EventBridge Scheduler invokes the schedule.
        @[JSON::Field(key: "FlexibleTimeWindow")]
        getter flexible_time_window : Types::FlexibleTimeWindow

        # The name of the schedule that you are updating.
        @[JSON::Field(key: "Name")]
        getter name : String

        # The expression that defines when the schedule runs. The following formats are supported. at
        # expression - at(yyyy-mm-ddThh:mm:ss) rate expression - rate(value unit) cron expression -
        # cron(fields) You can use at expressions to create one-time schedules that invoke a target once, at
        # the time and in the time zone, that you specify. You can use rate and cron expressions to create
        # recurring schedules. Rate-based schedules are useful when you want to invoke a target at regular
        # intervals, such as every 15 minutes or every five days. Cron-based schedules are useful when you
        # want to invoke a target periodically at a specific time, such as at 8:00 am (UTC+0) every 1st day of
        # the month. A cron expression consists of six fields separated by white spaces: (minutes hours
        # day_of_month month day_of_week year) . A rate expression consists of a value as a positive integer,
        # and a unit with the following options: minute | minutes | hour | hours | day | days For more
        # information and examples, see Schedule types on EventBridge Scheduler in the EventBridge Scheduler
        # User Guide .
        @[JSON::Field(key: "ScheduleExpression")]
        getter schedule_expression : String

        # The schedule target. You can use this operation to change the target that your schedule invokes.
        @[JSON::Field(key: "Target")]
        getter target : Types::Target

        # Specifies the action that EventBridge Scheduler applies to the schedule after the schedule completes
        # invoking the target.
        @[JSON::Field(key: "ActionAfterCompletion")]
        getter action_after_completion : String?

        # Unique, case-sensitive identifier you provide to ensure the idempotency of the request. If you do
        # not specify a client token, EventBridge Scheduler uses a randomly generated token for the request to
        # ensure idempotency.
        @[JSON::Field(key: "ClientToken")]
        getter client_token : String?

        # The description you specify for the schedule.
        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date, in UTC, before which the schedule can invoke its target. Depending on the schedule's
        # recurrence expression, invocations might stop on, or before, the EndDate you specify. EventBridge
        # Scheduler ignores EndDate for one-time schedules.
        @[JSON::Field(key: "EndDate")]
        getter end_date : Time?

        # The name of the schedule group with which the schedule is associated. You must provide this value in
        # order for EventBridge Scheduler to find the schedule you want to update. If you omit this value,
        # EventBridge Scheduler assumes the group is associated to the default group.
        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The ARN for the customer managed KMS key that that you want EventBridge Scheduler to use to encrypt
        # and decrypt your data.
        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        # The timezone in which the scheduling expression is evaluated.
        @[JSON::Field(key: "ScheduleExpressionTimezone")]
        getter schedule_expression_timezone : String?

        # The date, in UTC, after which the schedule can begin invoking its target. Depending on the
        # schedule's recurrence expression, invocations might occur on, or after, the StartDate you specify.
        # EventBridge Scheduler ignores StartDate for one-time schedules.
        @[JSON::Field(key: "StartDate")]
        getter start_date : Time?

        # Specifies whether the schedule is enabled or disabled.
        @[JSON::Field(key: "State")]
        getter state : String?

        def initialize(
          @flexible_time_window : Types::FlexibleTimeWindow,
          @name : String,
          @schedule_expression : String,
          @target : Types::Target,
          @action_after_completion : String? = nil,
          @client_token : String? = nil,
          @description : String? = nil,
          @end_date : Time? = nil,
          @group_name : String? = nil,
          @kms_key_arn : String? = nil,
          @schedule_expression_timezone : String? = nil,
          @start_date : Time? = nil,
          @state : String? = nil
        )
        end
      end

      struct UpdateScheduleOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the schedule that you updated.
        @[JSON::Field(key: "ScheduleArn")]
        getter schedule_arn : String

        def initialize(
          @schedule_arn : String
        )
        end
      end

      # The input fails to satisfy the constraints specified by an AWS service.
      struct ValidationException
        include JSON::Serializable

        @[JSON::Field(key: "Message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end
    end
  end
end
