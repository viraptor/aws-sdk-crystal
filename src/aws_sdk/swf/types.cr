require "json"
require "time"

module AwsSdk
  module SWF
    module Types

      # Unit of work sent to an activity worker.
      struct ActivityTask
        include JSON::Serializable

        # The unique ID of the task.
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The type of this activity task.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The ID of the ActivityTaskStarted event recorded in the history.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The opaque string used as a handle on the task. This token is used by workers to communicate
        # progress and response information back to the system about the task.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # The workflow execution that started this activity task.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The inputs provided when the activity task was scheduled. The form of the input is user defined and
        # should be meaningful to the activity implementation.
        @[JSON::Field(key: "input")]
        getter input : String?

        def initialize(
          @activity_id : String,
          @activity_type : Types::ActivityType,
          @started_event_id : Int64,
          @task_token : String,
          @workflow_execution : Types::WorkflowExecution,
          @input : String? = nil
        )
        end
      end

      # Provides the details of the ActivityTaskCancelRequested event.
      struct ActivityTaskCancelRequestedEventAttributes
        include JSON::Serializable

        # The unique ID of the task.
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # RequestCancelActivityTask decision for this cancellation request. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @activity_id : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      # Provides the details of the ActivityTaskCanceled event.
      struct ActivityTaskCanceledEventAttributes
        include JSON::Serializable

        # The ID of the ActivityTaskScheduled event that was recorded when this activity task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the ActivityTaskStarted event recorded when this activity task was started. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # Details of the cancellation.
        @[JSON::Field(key: "details")]
        getter details : String?

        # If set, contains the ID of the last ActivityTaskCancelRequested event recorded for this activity
        # task. This information can be useful for diagnosing problems by tracing back the chain of events
        # leading up to this event.
        @[JSON::Field(key: "latestCancelRequestedEventId")]
        getter latest_cancel_requested_event_id : Int64?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @details : String? = nil,
          @latest_cancel_requested_event_id : Int64? = nil
        )
        end
      end

      # Provides the details of the ActivityTaskCompleted event.
      struct ActivityTaskCompletedEventAttributes
        include JSON::Serializable

        # The ID of the ActivityTaskScheduled event that was recorded when this activity task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the ActivityTaskStarted event recorded when this activity task was started. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The results of the activity task.
        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @result : String? = nil
        )
        end
      end

      # Provides the details of the ActivityTaskFailed event.
      struct ActivityTaskFailedEventAttributes
        include JSON::Serializable

        # The ID of the ActivityTaskScheduled event that was recorded when this activity task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the ActivityTaskStarted event recorded when this activity task was started. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The details of the failure.
        @[JSON::Field(key: "details")]
        getter details : String?

        # The reason provided for the failure.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides the details of the ActivityTaskScheduled event.
      struct ActivityTaskScheduledEventAttributes
        include JSON::Serializable

        # The unique ID of the activity task.
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The type of the activity task.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The ID of the DecisionTaskCompleted event corresponding to the decision that resulted in the
        # scheduling of this activity task. This information can be useful for diagnosing problems by tracing
        # back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The task list in which the activity task has been scheduled.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # Data attached to the event that can be used by the decider in subsequent workflow tasks. This data
        # isn't sent to the activity.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The maximum time before which the worker processing this task must report progress by calling
        # RecordActivityTaskHeartbeat . If the timeout is exceeded, the activity task is automatically timed
        # out. If the worker subsequently attempts to record a heartbeat or return a result, it is ignored.
        @[JSON::Field(key: "heartbeatTimeout")]
        getter heartbeat_timeout : String?

        # The input provided to the activity task.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The maximum amount of time for this activity task.
        @[JSON::Field(key: "scheduleToCloseTimeout")]
        getter schedule_to_close_timeout : String?

        # The maximum amount of time the activity task can wait to be assigned to a worker.
        @[JSON::Field(key: "scheduleToStartTimeout")]
        getter schedule_to_start_timeout : String?

        # The maximum amount of time a worker may take to process the activity task.
        @[JSON::Field(key: "startToCloseTimeout")]
        getter start_to_close_timeout : String?

        # The priority to assign to the scheduled activity task. If set, this overrides any default priority
        # value that was assigned when the activity type was registered. Valid values are integers that range
        # from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE (2147483647). Higher numbers
        # indicate higher priority. For more information about setting task priority, see Setting Task
        # Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        def initialize(
          @activity_id : String,
          @activity_type : Types::ActivityType,
          @decision_task_completed_event_id : Int64,
          @task_list : Types::TaskList,
          @control : String? = nil,
          @heartbeat_timeout : String? = nil,
          @input : String? = nil,
          @schedule_to_close_timeout : String? = nil,
          @schedule_to_start_timeout : String? = nil,
          @start_to_close_timeout : String? = nil,
          @task_priority : String? = nil
        )
        end
      end

      # Provides the details of the ActivityTaskStarted event.
      struct ActivityTaskStartedEventAttributes
        include JSON::Serializable

        # The ID of the ActivityTaskScheduled event that was recorded when this activity task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # Identity of the worker that was assigned this task. This aids diagnostics when problems arise. The
        # form of this identity is user defined.
        @[JSON::Field(key: "identity")]
        getter identity : String?

        def initialize(
          @scheduled_event_id : Int64,
          @identity : String? = nil
        )
        end
      end

      # Status information about an activity task.
      struct ActivityTaskStatus
        include JSON::Serializable

        # Set to true if cancellation of the task is requested.
        @[JSON::Field(key: "cancelRequested")]
        getter cancel_requested : Bool

        def initialize(
          @cancel_requested : Bool
        )
        end
      end

      # Provides the details of the ActivityTaskTimedOut event.
      struct ActivityTaskTimedOutEventAttributes
        include JSON::Serializable

        # The ID of the ActivityTaskScheduled event that was recorded when this activity task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the ActivityTaskStarted event recorded when this activity task was started. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The type of the timeout that caused this event.
        @[JSON::Field(key: "timeoutType")]
        getter timeout_type : String

        # Contains the content of the details parameter for the last call made by the activity to
        # RecordActivityTaskHeartbeat .
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @timeout_type : String,
          @details : String? = nil
        )
        end
      end

      # Represents an activity type.
      struct ActivityType
        include JSON::Serializable

        # The name of this activity. The combination of activity type name and version must be unique within a
        # domain.
        @[JSON::Field(key: "name")]
        getter name : String

        # The version of this activity. The combination of activity type name and version must be unique with
        # in a domain.
        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end

      # Configuration settings registered with the activity type.
      struct ActivityTypeConfiguration
        include JSON::Serializable

        # The default maximum time, in seconds, before which a worker processing a task must report progress
        # by calling RecordActivityTaskHeartbeat . You can specify this value only when registering an
        # activity type. The registered default value can be overridden when you schedule a task through the
        # ScheduleActivityTask Decision . If the activity worker subsequently attempts to record a heartbeat
        # or returns a result, the activity worker receives an UnknownResource fault. In this case, Amazon SWF
        # no longer considers the activity task to be valid; the activity worker should clean up the activity
        # task. The duration is specified in seconds, an integer greater than or equal to 0 . You can use NONE
        # to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskHeartbeatTimeout")]
        getter default_task_heartbeat_timeout : String?

        # The default task list specified for this activity type at registration. This default is used if a
        # task list isn't provided when a task is scheduled through the ScheduleActivityTask Decision . You
        # can override the default registered task list when scheduling a task through the
        # ScheduleActivityTask Decision .
        @[JSON::Field(key: "defaultTaskList")]
        getter default_task_list : Types::TaskList?

        # The default task priority for tasks of this activity type, specified at registration. If not set,
        # then 0 is used as the default priority. This default can be overridden when scheduling an activity
        # task. Valid values are integers that range from Java's Integer.MIN_VALUE (-2147483648) to
        # Integer.MAX_VALUE (2147483647). Higher numbers indicate higher priority. For more information about
        # setting task priority, see Setting Task Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "defaultTaskPriority")]
        getter default_task_priority : String?

        # The default maximum duration, specified when registering the activity type, for tasks of this
        # activity type. You can override this default when scheduling a task through the ScheduleActivityTask
        # Decision . The duration is specified in seconds, an integer greater than or equal to 0 . You can use
        # NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskScheduleToCloseTimeout")]
        getter default_task_schedule_to_close_timeout : String?

        # The default maximum duration, specified when registering the activity type, that a task of an
        # activity type can wait before being assigned to a worker. You can override this default when
        # scheduling a task through the ScheduleActivityTask Decision . The duration is specified in seconds,
        # an integer greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskScheduleToStartTimeout")]
        getter default_task_schedule_to_start_timeout : String?

        # The default maximum duration for tasks of an activity type specified when registering the activity
        # type. You can override this default when scheduling a task through the ScheduleActivityTask Decision
        # . The duration is specified in seconds, an integer greater than or equal to 0 . You can use NONE to
        # specify unlimited duration.
        @[JSON::Field(key: "defaultTaskStartToCloseTimeout")]
        getter default_task_start_to_close_timeout : String?

        def initialize(
          @default_task_heartbeat_timeout : String? = nil,
          @default_task_list : Types::TaskList? = nil,
          @default_task_priority : String? = nil,
          @default_task_schedule_to_close_timeout : String? = nil,
          @default_task_schedule_to_start_timeout : String? = nil,
          @default_task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Detailed information about an activity type.
      struct ActivityTypeDetail
        include JSON::Serializable

        # The configuration settings registered with the activity type.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ActivityTypeConfiguration

        # General information about the activity type. The status of activity type (returned in the
        # ActivityTypeInfo structure) can be one of the following. REGISTERED – The type is registered and
        # available. Workers supporting this type should be running. DEPRECATED – The type was deprecated
        # using DeprecateActivityType , but is still in use. You should keep workers supporting this type
        # running. You cannot create new tasks of this type.
        @[JSON::Field(key: "typeInfo")]
        getter type_info : Types::ActivityTypeInfo

        def initialize(
          @configuration : Types::ActivityTypeConfiguration,
          @type_info : Types::ActivityTypeInfo
        )
        end
      end

      # Detailed information about an activity type.
      struct ActivityTypeInfo
        include JSON::Serializable

        # The ActivityType type structure representing the activity type.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The date and time this activity type was created through RegisterActivityType .
        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The current status of the activity type.
        @[JSON::Field(key: "status")]
        getter status : String

        # If DEPRECATED, the date and time DeprecateActivityType was called.
        @[JSON::Field(key: "deprecationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deprecation_date : Time?

        # The description of the activity type provided in RegisterActivityType .
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @activity_type : Types::ActivityType,
          @creation_date : Time,
          @status : String,
          @deprecation_date : Time? = nil,
          @description : String? = nil
        )
        end
      end

      # Contains a paginated list of activity type information structures.
      struct ActivityTypeInfos
        include JSON::Serializable

        # List of activity type information.
        @[JSON::Field(key: "typeInfos")]
        getter type_infos : Array(Types::ActivityTypeInfo)

        # If a NextPageToken was returned by a previous call, there are more results available. To retrieve
        # the next page of results, make the call again using the returned token in nextPageToken . Keep all
        # other arguments unchanged. The configured maximumPageSize determines how many results can be
        # returned in a single call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @type_infos : Array(Types::ActivityTypeInfo),
          @next_page_token : String? = nil
        )
        end
      end

      # Provides the details of the CancelTimer decision. Access Control You can use IAM policies to control
      # this decision's access to Amazon SWF resources as follows: Use a Resource element with the domain
      # name to limit the action to only specified domains. Use an Action element to allow or deny
      # permission to call this action. You cannot use an IAM policy to constrain this action's parameters.
      # If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall
      # outside the specified constraints, the action fails. The associated event attribute's cause
      # parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to
      # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct CancelTimerDecisionAttributes
        include JSON::Serializable

        # The unique ID of the timer to cancel.
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        def initialize(
          @timer_id : String
        )
        end
      end

      # Provides the details of the CancelTimerFailed event.
      struct CancelTimerFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # CancelTimer decision to cancel this timer. This information can be useful for diagnosing problems by
        # tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The timerId provided in the CancelTimer decision that failed.
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @timer_id : String
        )
        end
      end

      # Provides the details of the CancelWorkflowExecution decision. Access Control You can use IAM
      # policies to control this decision's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. You cannot use an IAM policy to constrain this
      # action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or the
      # parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct CancelWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # Details of the cancellation.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @details : String? = nil
        )
        end
      end

      # Provides the details of the CancelWorkflowExecutionFailed event.
      struct CancelWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # CancelWorkflowExecution decision for this cancellation request. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      # Provide details of the ChildWorkflowExecutionCanceled event.
      struct ChildWorkflowExecutionCanceledEventAttributes
        include JSON::Serializable

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this child workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The ID of the ChildWorkflowExecutionStarted event recorded when this child workflow execution was
        # started. This information can be useful for diagnosing problems by tracing back the chain of events
        # leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The child workflow execution that was canceled.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # Details of the cancellation (if provided).
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @initiated_event_id : Int64,
          @started_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType,
          @details : String? = nil
        )
        end
      end

      # Provides the details of the ChildWorkflowExecutionCompleted event.
      struct ChildWorkflowExecutionCompletedEventAttributes
        include JSON::Serializable

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this child workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The ID of the ChildWorkflowExecutionStarted event recorded when this child workflow execution was
        # started. This information can be useful for diagnosing problems by tracing back the chain of events
        # leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The child workflow execution that was completed.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # The result of the child workflow execution.
        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @initiated_event_id : Int64,
          @started_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType,
          @result : String? = nil
        )
        end
      end

      # Provides the details of the ChildWorkflowExecutionFailed event.
      struct ChildWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this child workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The ID of the ChildWorkflowExecutionStarted event recorded when this child workflow execution was
        # started. This information can be useful for diagnosing problems by tracing back the chain of events
        # leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The child workflow execution that failed.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # The details of the failure (if provided).
        @[JSON::Field(key: "details")]
        getter details : String?

        # The reason for the failure (if provided).
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @initiated_event_id : Int64,
          @started_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType,
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides the details of the ChildWorkflowExecutionStarted event.
      struct ChildWorkflowExecutionStartedEventAttributes
        include JSON::Serializable

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this child workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The child workflow execution that was started.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @initiated_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      # Provides the details of the ChildWorkflowExecutionTerminated event.
      struct ChildWorkflowExecutionTerminatedEventAttributes
        include JSON::Serializable

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this child workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The ID of the ChildWorkflowExecutionStarted event recorded when this child workflow execution was
        # started. This information can be useful for diagnosing problems by tracing back the chain of events
        # leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The child workflow execution that was terminated.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @initiated_event_id : Int64,
          @started_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      # Provides the details of the ChildWorkflowExecutionTimedOut event.
      struct ChildWorkflowExecutionTimedOutEventAttributes
        include JSON::Serializable

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this child workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The ID of the ChildWorkflowExecutionStarted event recorded when this child workflow execution was
        # started. This information can be useful for diagnosing problems by tracing back the chain of events
        # leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The type of the timeout that caused the child workflow execution to time out.
        @[JSON::Field(key: "timeoutType")]
        getter timeout_type : String

        # The child workflow execution that timed out.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @initiated_event_id : Int64,
          @started_event_id : Int64,
          @timeout_type : String,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      # Used to filter the closed workflow executions in visibility APIs by their close status.
      struct CloseStatusFilter
        include JSON::Serializable

        # The close status that must match the close status of an execution for it to meet the criteria of
        # this filter.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @status : String
        )
        end
      end

      # Provides the details of the CompleteWorkflowExecution decision. Access Control You can use IAM
      # policies to control this decision's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. You cannot use an IAM policy to constrain this
      # action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or the
      # parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct CompleteWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # The result of the workflow execution. The form of the result is implementation defined.
        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @result : String? = nil
        )
        end
      end

      # Provides the details of the CompleteWorkflowExecutionFailed event.
      struct CompleteWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # CompleteWorkflowExecution decision to complete this execution. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      # Provides the details of the ContinueAsNewWorkflowExecution decision. Access Control You can use IAM
      # policies to control this decision's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. Constrain the following parameters by using a
      # Condition element with the appropriate keys. tag – A tag used to identify the workflow execution
      # taskList – String constraint. The key is swf:taskList.name . workflowType.version – String
      # constraint. The key is swf:workflowType.version . If the caller doesn't have sufficient permissions
      # to invoke the action, or the parameter values fall outside the specified constraints, the action
      # fails. The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For
      # details and example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the
      # Amazon SWF Developer Guide .
      struct ContinueAsNewWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # If set, specifies the policy to use for the child workflow executions of the new execution if it is
        # terminated by calling the TerminateWorkflowExecution action explicitly or due to an expired timeout.
        # This policy overrides the default child policy specified when registering the workflow type using
        # RegisterWorkflowType . The supported child policies are: TERMINATE – The child executions are
        # terminated. REQUEST_CANCEL – A request to cancel is attempted for each child execution by recording
        # a WorkflowExecutionCancelRequested event in its history. It is up to the decider to take appropriate
        # actions when it receives an execution history with this event. ABANDON – No action is taken. The
        # child executions continue to run. A child policy for this workflow execution must be specified
        # either as a default for the workflow type or through this parameter. If neither this parameter is
        # set nor a default child policy was specified at registration time then a fault is returned.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String?

        # If set, specifies the total duration for this workflow execution. This overrides the
        # defaultExecutionStartToCloseTimeout specified when registering the workflow type. The duration is
        # specified in seconds, an integer greater than or equal to 0 . You can use NONE to specify unlimited
        # duration. An execution start-to-close timeout for this workflow execution must be specified either
        # as a default for the workflow type or through this field. If neither this field is set nor a default
        # execution start-to-close timeout was specified at registration time then a fault is returned.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String?

        # The input provided to the new workflow execution.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The IAM role to attach to the new (continued) execution.
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The list of tags to associate with the new workflow execution. A maximum of 5 tags can be specified.
        # You can list workflow executions with a specific tag by calling ListOpenWorkflowExecutions or
        # ListClosedWorkflowExecutions and specifying a TagFilter .
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        # The task list to use for the decisions of the new (continued) workflow execution.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList?

        # The task priority that, if set, specifies the priority for the decision tasks for this workflow
        # execution. This overrides the defaultTaskPriority specified when registering the workflow type.
        # Valid values are integers that range from Java's Integer.MIN_VALUE (-2147483648) to
        # Integer.MAX_VALUE (2147483647). Higher numbers indicate higher priority. For more information about
        # setting task priority, see Setting Task Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        # Specifies the maximum duration of decision tasks for the new workflow execution. This parameter
        # overrides the defaultTaskStartToCloseTimout specified when registering the workflow type using
        # RegisterWorkflowType . The duration is specified in seconds, an integer greater than or equal to 0 .
        # You can use NONE to specify unlimited duration. A task start-to-close timeout for the new workflow
        # execution must be specified either as a default for the workflow type or through this parameter. If
        # neither this parameter is set nor a default task start-to-close timeout was specified at
        # registration time then a fault is returned.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String?

        # The version of the workflow to start.
        @[JSON::Field(key: "workflowTypeVersion")]
        getter workflow_type_version : String?

        def initialize(
          @child_policy : String? = nil,
          @execution_start_to_close_timeout : String? = nil,
          @input : String? = nil,
          @lambda_role : String? = nil,
          @tag_list : Array(String)? = nil,
          @task_list : Types::TaskList? = nil,
          @task_priority : String? = nil,
          @task_start_to_close_timeout : String? = nil,
          @workflow_type_version : String? = nil
        )
        end
      end

      # Provides the details of the ContinueAsNewWorkflowExecutionFailed event.
      struct ContinueAsNewWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # ContinueAsNewWorkflowExecution decision that started this execution. This information can be useful
        # for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      struct CountClosedWorkflowExecutionsInput
        include JSON::Serializable

        # The name of the domain containing the workflow executions to count.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # If specified, only workflow executions that match this close status are counted. This filter has an
        # affect only if executionStatus is specified as CLOSED . closeStatusFilter , executionFilter ,
        # typeFilter and tagFilter are mutually exclusive. You can specify at most one of these in a request.
        @[JSON::Field(key: "closeStatusFilter")]
        getter close_status_filter : Types::CloseStatusFilter?

        # If specified, only workflow executions that meet the close time criteria of the filter are counted.
        # startTimeFilter and closeTimeFilter are mutually exclusive. You must specify one of these in a
        # request but not both.
        @[JSON::Field(key: "closeTimeFilter")]
        getter close_time_filter : Types::ExecutionTimeFilter?

        # If specified, only workflow executions matching the WorkflowId in the filter are counted.
        # closeStatusFilter , executionFilter , typeFilter and tagFilter are mutually exclusive. You can
        # specify at most one of these in a request.
        @[JSON::Field(key: "executionFilter")]
        getter execution_filter : Types::WorkflowExecutionFilter?

        # If specified, only workflow executions that meet the start time criteria of the filter are counted.
        # startTimeFilter and closeTimeFilter are mutually exclusive. You must specify one of these in a
        # request but not both.
        @[JSON::Field(key: "startTimeFilter")]
        getter start_time_filter : Types::ExecutionTimeFilter?

        # If specified, only executions that have a tag that matches the filter are counted. closeStatusFilter
        # , executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most one of
        # these in a request.
        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        # If specified, indicates the type of the workflow executions to be counted. closeStatusFilter ,
        # executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most one of
        # these in a request.
        @[JSON::Field(key: "typeFilter")]
        getter type_filter : Types::WorkflowTypeFilter?

        def initialize(
          @domain : String,
          @close_status_filter : Types::CloseStatusFilter? = nil,
          @close_time_filter : Types::ExecutionTimeFilter? = nil,
          @execution_filter : Types::WorkflowExecutionFilter? = nil,
          @start_time_filter : Types::ExecutionTimeFilter? = nil,
          @tag_filter : Types::TagFilter? = nil,
          @type_filter : Types::WorkflowTypeFilter? = nil
        )
        end
      end

      struct CountOpenWorkflowExecutionsInput
        include JSON::Serializable

        # The name of the domain containing the workflow executions to count.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Specifies the start time criteria that workflow executions must meet in order to be counted.
        @[JSON::Field(key: "startTimeFilter")]
        getter start_time_filter : Types::ExecutionTimeFilter

        # If specified, only workflow executions matching the WorkflowId in the filter are counted.
        # executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most one of
        # these in a request.
        @[JSON::Field(key: "executionFilter")]
        getter execution_filter : Types::WorkflowExecutionFilter?

        # If specified, only executions that have a tag that matches the filter are counted. executionFilter ,
        # typeFilter and tagFilter are mutually exclusive. You can specify at most one of these in a request.
        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        # Specifies the type of the workflow executions to be counted. executionFilter , typeFilter and
        # tagFilter are mutually exclusive. You can specify at most one of these in a request.
        @[JSON::Field(key: "typeFilter")]
        getter type_filter : Types::WorkflowTypeFilter?

        def initialize(
          @domain : String,
          @start_time_filter : Types::ExecutionTimeFilter,
          @execution_filter : Types::WorkflowExecutionFilter? = nil,
          @tag_filter : Types::TagFilter? = nil,
          @type_filter : Types::WorkflowTypeFilter? = nil
        )
        end
      end

      struct CountPendingActivityTasksInput
        include JSON::Serializable

        # The name of the domain that contains the task list.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the task list.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        def initialize(
          @domain : String,
          @task_list : Types::TaskList
        )
        end
      end

      struct CountPendingDecisionTasksInput
        include JSON::Serializable

        # The name of the domain that contains the task list.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the task list.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        def initialize(
          @domain : String,
          @task_list : Types::TaskList
        )
        end
      end

      # Specifies a decision made by the decider. A decision can be one of these types: CancelTimer –
      # Cancels a previously started timer and records a TimerCanceled event in the history.
      # CancelWorkflowExecution – Closes the workflow execution and records a WorkflowExecutionCanceled
      # event in the history. CompleteWorkflowExecution – Closes the workflow execution and records a
      # WorkflowExecutionCompleted event in the history . ContinueAsNewWorkflowExecution – Closes the
      # workflow execution and starts a new workflow execution of the same type using the same workflow ID
      # and a unique run Id. A WorkflowExecutionContinuedAsNew event is recorded in the history.
      # FailWorkflowExecution – Closes the workflow execution and records a WorkflowExecutionFailed event in
      # the history. RecordMarker – Records a MarkerRecorded event in the history. Markers can be used for
      # adding custom information in the history for instance to let deciders know that they don't need to
      # look at the history beyond the marker event. RequestCancelActivityTask – Attempts to cancel a
      # previously scheduled activity task. If the activity task was scheduled but has not been assigned to
      # a worker, then it is canceled. If the activity task was already assigned to a worker, then the
      # worker is informed that cancellation has been requested in the response to
      # RecordActivityTaskHeartbeat . RequestCancelExternalWorkflowExecution – Requests that a request be
      # made to cancel the specified external workflow execution and records a
      # RequestCancelExternalWorkflowExecutionInitiated event in the history. ScheduleActivityTask –
      # Schedules an activity task. SignalExternalWorkflowExecution – Requests a signal to be delivered to
      # the specified external workflow execution and records a SignalExternalWorkflowExecutionInitiated
      # event in the history. StartChildWorkflowExecution – Requests that a child workflow execution be
      # started and records a StartChildWorkflowExecutionInitiated event in the history. The child workflow
      # execution is a separate workflow execution with its own history. StartTimer – Starts a timer for
      # this workflow execution and records a TimerStarted event in the history. This timer fires after the
      # specified delay and record a TimerFired event. Access Control If you grant permission to use
      # RespondDecisionTaskCompleted , you can use IAM policies to express permissions for the list of
      # decisions returned by this action as if they were members of the API. Treating decisions as a pseudo
      # API maintains a uniform conceptual model and helps keep policies readable. For details and example
      # IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer
      # Guide . Decision Failure Decisions can fail for several reasons The ordering of decisions should
      # follow a logical flow. Some decisions might not make sense in the current context of the workflow
      # execution and therefore fails. A limit on your account was reached. The decision lacks sufficient
      # permissions. One of the following events might be added to the history to indicate an error. The
      # event attribute's cause parameter indicates the cause. If cause is set to OPERATION_NOT_PERMITTED ,
      # the decision failed because it lacked sufficient permissions. For details and example IAM policies,
      # see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      # ScheduleActivityTaskFailed – A ScheduleActivityTask decision failed. This could happen if the
      # activity type specified in the decision isn't registered, is in a deprecated state, or the decision
      # isn't properly configured. RequestCancelActivityTaskFailed – A RequestCancelActivityTask decision
      # failed. This could happen if there is no open activity task with the specified activityId.
      # StartTimerFailed – A StartTimer decision failed. This could happen if there is another open timer
      # with the same timerId. CancelTimerFailed – A CancelTimer decision failed. This could happen if there
      # is no open timer with the specified timerId. StartChildWorkflowExecutionFailed – A
      # StartChildWorkflowExecution decision failed. This could happen if the workflow type specified isn't
      # registered, is deprecated, or the decision isn't properly configured.
      # SignalExternalWorkflowExecutionFailed – A SignalExternalWorkflowExecution decision failed. This
      # could happen if the workflowID specified in the decision was incorrect.
      # RequestCancelExternalWorkflowExecutionFailed – A RequestCancelExternalWorkflowExecution decision
      # failed. This could happen if the workflowID specified in the decision was incorrect.
      # CancelWorkflowExecutionFailed – A CancelWorkflowExecution decision failed. This could happen if
      # there is an unhandled decision task pending in the workflow execution.
      # CompleteWorkflowExecutionFailed – A CompleteWorkflowExecution decision failed. This could happen if
      # there is an unhandled decision task pending in the workflow execution.
      # ContinueAsNewWorkflowExecutionFailed – A ContinueAsNewWorkflowExecution decision failed. This could
      # happen if there is an unhandled decision task pending in the workflow execution or the
      # ContinueAsNewWorkflowExecution decision was not configured correctly. FailWorkflowExecutionFailed –
      # A FailWorkflowExecution decision failed. This could happen if there is an unhandled decision task
      # pending in the workflow execution. The preceding error events might occur due to an error in the
      # decider logic, which might put the workflow execution in an unstable state The cause field in the
      # event structure for the error event indicates the cause of the error. A workflow execution may be
      # closed by the decider by returning one of the following decisions when completing a decision task:
      # CompleteWorkflowExecution , FailWorkflowExecution , CancelWorkflowExecution and
      # ContinueAsNewWorkflowExecution . An UnhandledDecision fault is returned if a workflow closing
      # decision is specified and a signal or activity event had been added to the history while the
      # decision task was being performed by the decider. Unlike the above situations which are logic
      # issues, this fault is always possible because of race conditions in a distributed system. The right
      # action here is to call RespondDecisionTaskCompleted without any decisions. This would result in
      # another decision task with these new events included in the history. The decider should handle the
      # new events and may decide to close the workflow execution. How to Code a Decision You code a
      # decision by first setting the decision type field to one of the above decision values, and then set
      # the corresponding attributes field shown below: ScheduleActivityTaskDecisionAttributes
      # RequestCancelActivityTaskDecisionAttributes CompleteWorkflowExecutionDecisionAttributes
      # FailWorkflowExecutionDecisionAttributes CancelWorkflowExecutionDecisionAttributes
      # ContinueAsNewWorkflowExecutionDecisionAttributes RecordMarkerDecisionAttributes
      # StartTimerDecisionAttributes CancelTimerDecisionAttributes
      # SignalExternalWorkflowExecutionDecisionAttributes
      # RequestCancelExternalWorkflowExecutionDecisionAttributes
      # StartChildWorkflowExecutionDecisionAttributes
      struct Decision
        include JSON::Serializable

        # Specifies the type of the decision.
        @[JSON::Field(key: "decisionType")]
        getter decision_type : String

        # Provides the details of the CancelTimer decision. It isn't set for other decision types.
        @[JSON::Field(key: "cancelTimerDecisionAttributes")]
        getter cancel_timer_decision_attributes : Types::CancelTimerDecisionAttributes?

        # Provides the details of the CancelWorkflowExecution decision. It isn't set for other decision types.
        @[JSON::Field(key: "cancelWorkflowExecutionDecisionAttributes")]
        getter cancel_workflow_execution_decision_attributes : Types::CancelWorkflowExecutionDecisionAttributes?

        # Provides the details of the CompleteWorkflowExecution decision. It isn't set for other decision
        # types.
        @[JSON::Field(key: "completeWorkflowExecutionDecisionAttributes")]
        getter complete_workflow_execution_decision_attributes : Types::CompleteWorkflowExecutionDecisionAttributes?

        # Provides the details of the ContinueAsNewWorkflowExecution decision. It isn't set for other decision
        # types.
        @[JSON::Field(key: "continueAsNewWorkflowExecutionDecisionAttributes")]
        getter continue_as_new_workflow_execution_decision_attributes : Types::ContinueAsNewWorkflowExecutionDecisionAttributes?

        # Provides the details of the FailWorkflowExecution decision. It isn't set for other decision types.
        @[JSON::Field(key: "failWorkflowExecutionDecisionAttributes")]
        getter fail_workflow_execution_decision_attributes : Types::FailWorkflowExecutionDecisionAttributes?

        # Provides the details of the RecordMarker decision. It isn't set for other decision types.
        @[JSON::Field(key: "recordMarkerDecisionAttributes")]
        getter record_marker_decision_attributes : Types::RecordMarkerDecisionAttributes?

        # Provides the details of the RequestCancelActivityTask decision. It isn't set for other decision
        # types.
        @[JSON::Field(key: "requestCancelActivityTaskDecisionAttributes")]
        getter request_cancel_activity_task_decision_attributes : Types::RequestCancelActivityTaskDecisionAttributes?

        # Provides the details of the RequestCancelExternalWorkflowExecution decision. It isn't set for other
        # decision types.
        @[JSON::Field(key: "requestCancelExternalWorkflowExecutionDecisionAttributes")]
        getter request_cancel_external_workflow_execution_decision_attributes : Types::RequestCancelExternalWorkflowExecutionDecisionAttributes?

        # Provides the details of the ScheduleActivityTask decision. It isn't set for other decision types.
        @[JSON::Field(key: "scheduleActivityTaskDecisionAttributes")]
        getter schedule_activity_task_decision_attributes : Types::ScheduleActivityTaskDecisionAttributes?

        # Provides the details of the ScheduleLambdaFunction decision. It isn't set for other decision types.
        @[JSON::Field(key: "scheduleLambdaFunctionDecisionAttributes")]
        getter schedule_lambda_function_decision_attributes : Types::ScheduleLambdaFunctionDecisionAttributes?

        # Provides the details of the SignalExternalWorkflowExecution decision. It isn't set for other
        # decision types.
        @[JSON::Field(key: "signalExternalWorkflowExecutionDecisionAttributes")]
        getter signal_external_workflow_execution_decision_attributes : Types::SignalExternalWorkflowExecutionDecisionAttributes?

        # Provides the details of the StartChildWorkflowExecution decision. It isn't set for other decision
        # types.
        @[JSON::Field(key: "startChildWorkflowExecutionDecisionAttributes")]
        getter start_child_workflow_execution_decision_attributes : Types::StartChildWorkflowExecutionDecisionAttributes?

        # Provides the details of the StartTimer decision. It isn't set for other decision types.
        @[JSON::Field(key: "startTimerDecisionAttributes")]
        getter start_timer_decision_attributes : Types::StartTimerDecisionAttributes?

        def initialize(
          @decision_type : String,
          @cancel_timer_decision_attributes : Types::CancelTimerDecisionAttributes? = nil,
          @cancel_workflow_execution_decision_attributes : Types::CancelWorkflowExecutionDecisionAttributes? = nil,
          @complete_workflow_execution_decision_attributes : Types::CompleteWorkflowExecutionDecisionAttributes? = nil,
          @continue_as_new_workflow_execution_decision_attributes : Types::ContinueAsNewWorkflowExecutionDecisionAttributes? = nil,
          @fail_workflow_execution_decision_attributes : Types::FailWorkflowExecutionDecisionAttributes? = nil,
          @record_marker_decision_attributes : Types::RecordMarkerDecisionAttributes? = nil,
          @request_cancel_activity_task_decision_attributes : Types::RequestCancelActivityTaskDecisionAttributes? = nil,
          @request_cancel_external_workflow_execution_decision_attributes : Types::RequestCancelExternalWorkflowExecutionDecisionAttributes? = nil,
          @schedule_activity_task_decision_attributes : Types::ScheduleActivityTaskDecisionAttributes? = nil,
          @schedule_lambda_function_decision_attributes : Types::ScheduleLambdaFunctionDecisionAttributes? = nil,
          @signal_external_workflow_execution_decision_attributes : Types::SignalExternalWorkflowExecutionDecisionAttributes? = nil,
          @start_child_workflow_execution_decision_attributes : Types::StartChildWorkflowExecutionDecisionAttributes? = nil,
          @start_timer_decision_attributes : Types::StartTimerDecisionAttributes? = nil
        )
        end
      end

      # A structure that represents a decision task. Decision tasks are sent to deciders in order for them
      # to make decisions.
      struct DecisionTask
        include JSON::Serializable

        # A paginated list of history events of the workflow execution. The decider uses this during the
        # processing of the decision task.
        @[JSON::Field(key: "events")]
        getter events : Array(Types::HistoryEvent)

        # The ID of the DecisionTaskStarted event recorded in the history.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The opaque string used as a handle on the task. This token is used by workers to communicate
        # progress and response information back to the system about the task.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # The workflow execution for which this decision task was created.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        # The type of the workflow execution for which this decision task was created.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # If a NextPageToken was returned by a previous call, there are more results available. To retrieve
        # the next page of results, make the call again using the returned token in nextPageToken . Keep all
        # other arguments unchanged. The configured maximumPageSize determines how many results can be
        # returned in a single call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # The ID of the DecisionTaskStarted event of the previous decision task of this workflow execution
        # that was processed by the decider. This can be used to determine the events in the history new since
        # the last decision task received by the decider.
        @[JSON::Field(key: "previousStartedEventId")]
        getter previous_started_event_id : Int64?

        def initialize(
          @events : Array(Types::HistoryEvent),
          @started_event_id : Int64,
          @task_token : String,
          @workflow_execution : Types::WorkflowExecution,
          @workflow_type : Types::WorkflowType,
          @next_page_token : String? = nil,
          @previous_started_event_id : Int64? = nil
        )
        end
      end

      # Provides the details of the DecisionTaskCompleted event.
      struct DecisionTaskCompletedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskScheduled event that was recorded when this decision task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the DecisionTaskStarted event recorded when this decision task was started. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # User defined context for the workflow execution.
        @[JSON::Field(key: "executionContext")]
        getter execution_context : String?

        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList?

        # The maximum amount of time the decision task can wait to be assigned to a worker.
        @[JSON::Field(key: "taskListScheduleToStartTimeout")]
        getter task_list_schedule_to_start_timeout : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @execution_context : String? = nil,
          @task_list : Types::TaskList? = nil,
          @task_list_schedule_to_start_timeout : String? = nil
        )
        end
      end

      # Provides details about the DecisionTaskScheduled event.
      struct DecisionTaskScheduledEventAttributes
        include JSON::Serializable

        # The name of the task list in which the decision task was scheduled.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # The maximum amount of time the decision task can wait to be assigned to a worker.
        @[JSON::Field(key: "scheduleToStartTimeout")]
        getter schedule_to_start_timeout : String?

        # The maximum duration for this decision task. The task is considered timed out if it doesn't
        # completed within this duration. The duration is specified in seconds, an integer greater than or
        # equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "startToCloseTimeout")]
        getter start_to_close_timeout : String?

        # A task priority that, if set, specifies the priority for this decision task. Valid values are
        # integers that range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE (2147483647).
        # Higher numbers indicate higher priority. For more information about setting task priority, see
        # Setting Task Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        def initialize(
          @task_list : Types::TaskList,
          @schedule_to_start_timeout : String? = nil,
          @start_to_close_timeout : String? = nil,
          @task_priority : String? = nil
        )
        end
      end

      # Provides the details of the DecisionTaskStarted event.
      struct DecisionTaskStartedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskScheduled event that was recorded when this decision task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # Identity of the decider making the request. This enables diagnostic tracing when problems arise. The
        # form of this identity is user defined.
        @[JSON::Field(key: "identity")]
        getter identity : String?

        def initialize(
          @scheduled_event_id : Int64,
          @identity : String? = nil
        )
        end
      end

      # Provides the details of the DecisionTaskTimedOut event.
      struct DecisionTaskTimedOutEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskScheduled event that was recorded when this decision task was scheduled.
        # This information can be useful for diagnosing problems by tracing back the chain of events leading
        # up to this event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the DecisionTaskStarted event recorded when this decision task was started. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The type of timeout that expired before the decision task could be completed.
        @[JSON::Field(key: "timeoutType")]
        getter timeout_type : String

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @timeout_type : String
        )
        end
      end

      # The StartWorkflowExecution API action was called without the required parameters set. Some workflow
      # execution parameters, such as the decision taskList , must be set to start the execution. However,
      # these parameters might have been set as defaults when the workflow type was registered. In this
      # case, you can omit these parameters from the StartWorkflowExecution call and Amazon SWF uses the
      # values defined in the workflow type. If these parameters aren't set and no default parameters were
      # defined in the workflow type, this error is displayed.
      struct DefaultUndefinedFault
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct DeleteActivityTypeInput
        include JSON::Serializable

        # The activity type to delete.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The name of the domain in which the activity type is registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        def initialize(
          @activity_type : Types::ActivityType,
          @domain : String
        )
        end
      end

      struct DeleteWorkflowTypeInput
        include JSON::Serializable

        # The name of the domain in which the workflow type is registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The workflow type to delete.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @domain : String,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      struct DeprecateActivityTypeInput
        include JSON::Serializable

        # The activity type to deprecate.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The name of the domain in which the activity type is registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        def initialize(
          @activity_type : Types::ActivityType,
          @domain : String
        )
        end
      end

      struct DeprecateDomainInput
        include JSON::Serializable

        # The name of the domain to deprecate.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DeprecateWorkflowTypeInput
        include JSON::Serializable

        # The name of the domain in which the workflow type is registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The workflow type to deprecate.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @domain : String,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      struct DescribeActivityTypeInput
        include JSON::Serializable

        # The activity type to get information about. Activity types are identified by the name and version
        # that were supplied when the activity was registered.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The name of the domain in which the activity type is registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        def initialize(
          @activity_type : Types::ActivityType,
          @domain : String
        )
        end
      end

      struct DescribeDomainInput
        include JSON::Serializable

        # The name of the domain to describe.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct DescribeWorkflowExecutionInput
        include JSON::Serializable

        # The name of the domain containing the workflow execution.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The workflow execution to describe.
        @[JSON::Field(key: "execution")]
        getter execution : Types::WorkflowExecution

        def initialize(
          @domain : String,
          @execution : Types::WorkflowExecution
        )
        end
      end

      struct DescribeWorkflowTypeInput
        include JSON::Serializable

        # The name of the domain in which this workflow type is registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The workflow type to describe.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @domain : String,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      # Returned if the domain already exists. You may get this fault if you are registering a domain that
      # is either already registered or deprecated, or if you undeprecate a domain that is currently
      # registered.
      struct DomainAlreadyExistsFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the configuration settings of a domain.
      struct DomainConfiguration
        include JSON::Serializable

        # The retention period for workflow executions in this domain.
        @[JSON::Field(key: "workflowExecutionRetentionPeriodInDays")]
        getter workflow_execution_retention_period_in_days : String

        def initialize(
          @workflow_execution_retention_period_in_days : String
        )
        end
      end

      # Returned when the specified domain has been deprecated.
      struct DomainDeprecatedFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details of a domain.
      struct DomainDetail
        include JSON::Serializable

        # The domain configuration. Currently, this includes only the domain's retention period.
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::DomainConfiguration

        # The basic information about a domain, such as its name, status, and description.
        @[JSON::Field(key: "domainInfo")]
        getter domain_info : Types::DomainInfo

        def initialize(
          @configuration : Types::DomainConfiguration,
          @domain_info : Types::DomainInfo
        )
        end
      end

      # Contains general information about a domain.
      struct DomainInfo
        include JSON::Serializable

        # The name of the domain. This name is unique within the account.
        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the domain: REGISTERED – The domain is properly registered and available. You can use
        # this domain for registering types and creating new workflow executions. DEPRECATED – The domain was
        # deprecated using DeprecateDomain , but is still in use. You should not create new workflow
        # executions in this domain.
        @[JSON::Field(key: "status")]
        getter status : String

        # The ARN of the domain.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The description of the domain provided through RegisterDomain .
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @status : String,
          @arn : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Contains a paginated collection of DomainInfo structures.
      struct DomainInfos
        include JSON::Serializable

        # A list of DomainInfo structures.
        @[JSON::Field(key: "domainInfos")]
        getter domain_infos : Array(Types::DomainInfo)

        # If a NextPageToken was returned by a previous call, there are more results available. To retrieve
        # the next page of results, make the call again using the returned token in nextPageToken . Keep all
        # other arguments unchanged. The configured maximumPageSize determines how many results can be
        # returned in a single call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @domain_infos : Array(Types::DomainInfo),
          @next_page_token : String? = nil
        )
        end
      end

      # Used to filter the workflow executions in visibility APIs by various time-based rules. Each
      # parameter, if specified, defines a rule that must be satisfied by each returned query result. The
      # parameter values are in the Unix Time format . For example: "oldestDate": 1325376070.
      struct ExecutionTimeFilter
        include JSON::Serializable

        # Specifies the oldest start or close date and time to return.
        @[JSON::Field(key: "oldestDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter oldest_date : Time

        # Specifies the latest start or close date and time to return.
        @[JSON::Field(key: "latestDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_date : Time?

        def initialize(
          @oldest_date : Time,
          @latest_date : Time? = nil
        )
        end
      end

      # Provides the details of the ExternalWorkflowExecutionCancelRequested event.
      struct ExternalWorkflowExecutionCancelRequestedEventAttributes
        include JSON::Serializable

        # The ID of the RequestCancelExternalWorkflowExecutionInitiated event corresponding to the
        # RequestCancelExternalWorkflowExecution decision to cancel this external workflow execution. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The external workflow execution to which the cancellation request was delivered.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        def initialize(
          @initiated_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution
        )
        end
      end

      # Provides the details of the ExternalWorkflowExecutionSignaled event.
      struct ExternalWorkflowExecutionSignaledEventAttributes
        include JSON::Serializable

        # The ID of the SignalExternalWorkflowExecutionInitiated event corresponding to the
        # SignalExternalWorkflowExecution decision to request this signal. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The external workflow execution that the signal was delivered to.
        @[JSON::Field(key: "workflowExecution")]
        getter workflow_execution : Types::WorkflowExecution

        def initialize(
          @initiated_event_id : Int64,
          @workflow_execution : Types::WorkflowExecution
        )
        end
      end

      # Provides the details of the FailWorkflowExecution decision. Access Control You can use IAM policies
      # to control this decision's access to Amazon SWF resources as follows: Use a Resource element with
      # the domain name to limit the action to only specified domains. Use an Action element to allow or
      # deny permission to call this action. You cannot use an IAM policy to constrain this action's
      # parameters. If the caller doesn't have sufficient permissions to invoke the action, or the parameter
      # values fall outside the specified constraints, the action fails. The associated event attribute's
      # cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using
      # IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct FailWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # Details of the failure.
        @[JSON::Field(key: "details")]
        getter details : String?

        # A descriptive reason for the failure that may help in diagnostics.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides the details of the FailWorkflowExecutionFailed event.
      struct FailWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # FailWorkflowExecution decision to fail this execution. This information can be useful for diagnosing
        # problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      struct GetWorkflowExecutionHistoryInput
        include JSON::Serializable

        # The name of the domain containing the workflow execution.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Specifies the workflow execution for which to return the history.
        @[JSON::Field(key: "execution")]
        getter execution : Types::WorkflowExecution

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the events in reverse order. By default the results are returned in
        # ascending order of the eventTimeStamp of the events.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @domain : String,
          @execution : Types::WorkflowExecution,
          @maximum_page_size : Int32? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end

      # Paginated representation of a workflow history for a workflow execution. This is the up to date,
      # complete and authoritative record of the events related to all tasks and events in the life of the
      # workflow execution.
      struct History
        include JSON::Serializable

        # The list of history events.
        @[JSON::Field(key: "events")]
        getter events : Array(Types::HistoryEvent)

        # If a NextPageToken was returned by a previous call, there are more results available. To retrieve
        # the next page of results, make the call again using the returned token in nextPageToken . Keep all
        # other arguments unchanged. The configured maximumPageSize determines how many results can be
        # returned in a single call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @events : Array(Types::HistoryEvent),
          @next_page_token : String? = nil
        )
        end
      end

      # Event within a workflow execution. A history event can be one of these types:
      # ActivityTaskCancelRequested – A RequestCancelActivityTask decision was received by the system.
      # ActivityTaskCanceled – The activity task was successfully canceled. ActivityTaskCompleted – An
      # activity worker successfully completed an activity task by calling RespondActivityTaskCompleted .
      # ActivityTaskFailed – An activity worker failed an activity task by calling RespondActivityTaskFailed
      # . ActivityTaskScheduled – An activity task was scheduled for execution. ActivityTaskStarted – The
      # scheduled activity task was dispatched to a worker. ActivityTaskTimedOut – The activity task timed
      # out. CancelTimerFailed – Failed to process CancelTimer decision. This happens when the decision
      # isn't configured properly, for example no timer exists with the specified timer Id.
      # CancelWorkflowExecutionFailed – A request to cancel a workflow execution failed.
      # ChildWorkflowExecutionCanceled – A child workflow execution, started by this workflow execution, was
      # canceled and closed. ChildWorkflowExecutionCompleted – A child workflow execution, started by this
      # workflow execution, completed successfully and was closed. ChildWorkflowExecutionFailed – A child
      # workflow execution, started by this workflow execution, failed to complete successfully and was
      # closed. ChildWorkflowExecutionStarted – A child workflow execution was successfully started.
      # ChildWorkflowExecutionTerminated – A child workflow execution, started by this workflow execution,
      # was terminated. ChildWorkflowExecutionTimedOut – A child workflow execution, started by this
      # workflow execution, timed out and was closed. CompleteWorkflowExecutionFailed – The workflow
      # execution failed to complete. ContinueAsNewWorkflowExecutionFailed – The workflow execution failed
      # to complete after being continued as a new workflow execution. DecisionTaskCompleted – The decider
      # successfully completed a decision task by calling RespondDecisionTaskCompleted .
      # DecisionTaskScheduled – A decision task was scheduled for the workflow execution.
      # DecisionTaskStarted – The decision task was dispatched to a decider. DecisionTaskTimedOut – The
      # decision task timed out. ExternalWorkflowExecutionCancelRequested – Request to cancel an external
      # workflow execution was successfully delivered to the target execution.
      # ExternalWorkflowExecutionSignaled – A signal, requested by this workflow execution, was successfully
      # delivered to the target external workflow execution. FailWorkflowExecutionFailed – A request to mark
      # a workflow execution as failed, itself failed. MarkerRecorded – A marker was recorded in the
      # workflow history as the result of a RecordMarker decision. RecordMarkerFailed – A RecordMarker
      # decision was returned as failed. RequestCancelActivityTaskFailed – Failed to process
      # RequestCancelActivityTask decision. This happens when the decision isn't configured properly.
      # RequestCancelExternalWorkflowExecutionFailed – Request to cancel an external workflow execution
      # failed. RequestCancelExternalWorkflowExecutionInitiated – A request was made to request the
      # cancellation of an external workflow execution. ScheduleActivityTaskFailed – Failed to process
      # ScheduleActivityTask decision. This happens when the decision isn't configured properly, for example
      # the activity type specified isn't registered. SignalExternalWorkflowExecutionFailed – The request to
      # signal an external workflow execution failed. SignalExternalWorkflowExecutionInitiated – A request
      # to signal an external workflow was made. StartActivityTaskFailed – A scheduled activity task failed
      # to start. StartChildWorkflowExecutionFailed – Failed to process StartChildWorkflowExecution
      # decision. This happens when the decision isn't configured properly, for example the workflow type
      # specified isn't registered. StartChildWorkflowExecutionInitiated – A request was made to start a
      # child workflow execution. StartTimerFailed – Failed to process StartTimer decision. This happens
      # when the decision isn't configured properly, for example a timer already exists with the specified
      # timer Id. TimerCanceled – A timer, previously started for this workflow execution, was successfully
      # canceled. TimerFired – A timer, previously started for this workflow execution, fired. TimerStarted
      # – A timer was started for the workflow execution due to a StartTimer decision.
      # WorkflowExecutionCancelRequested – A request to cancel this workflow execution was made.
      # WorkflowExecutionCanceled – The workflow execution was successfully canceled and closed.
      # WorkflowExecutionCompleted – The workflow execution was closed due to successful completion.
      # WorkflowExecutionContinuedAsNew – The workflow execution was closed and a new execution of the same
      # type was created with the same workflowId. WorkflowExecutionFailed – The workflow execution closed
      # due to a failure. WorkflowExecutionSignaled – An external signal was received for the workflow
      # execution. WorkflowExecutionStarted – The workflow execution was started.
      # WorkflowExecutionTerminated – The workflow execution was terminated. WorkflowExecutionTimedOut – The
      # workflow execution was closed because a time out was exceeded.
      struct HistoryEvent
        include JSON::Serializable

        # The system generated ID of the event. This ID uniquely identifies the event with in the workflow
        # execution history.
        @[JSON::Field(key: "eventId")]
        getter event_id : Int64

        # The date and time when the event occurred.
        @[JSON::Field(key: "eventTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter event_timestamp : Time

        # The type of the history event.
        @[JSON::Field(key: "eventType")]
        getter event_type : String

        # If the event is of type ActivityTaskcancelRequested then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskCancelRequestedEventAttributes")]
        getter activity_task_cancel_requested_event_attributes : Types::ActivityTaskCancelRequestedEventAttributes?

        # If the event is of type ActivityTaskCanceled then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskCanceledEventAttributes")]
        getter activity_task_canceled_event_attributes : Types::ActivityTaskCanceledEventAttributes?

        # If the event is of type ActivityTaskCompleted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskCompletedEventAttributes")]
        getter activity_task_completed_event_attributes : Types::ActivityTaskCompletedEventAttributes?

        # If the event is of type ActivityTaskFailed then this member is set and provides detailed information
        # about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskFailedEventAttributes")]
        getter activity_task_failed_event_attributes : Types::ActivityTaskFailedEventAttributes?

        # If the event is of type ActivityTaskScheduled then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskScheduledEventAttributes")]
        getter activity_task_scheduled_event_attributes : Types::ActivityTaskScheduledEventAttributes?

        # If the event is of type ActivityTaskStarted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskStartedEventAttributes")]
        getter activity_task_started_event_attributes : Types::ActivityTaskStartedEventAttributes?

        # If the event is of type ActivityTaskTimedOut then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "activityTaskTimedOutEventAttributes")]
        getter activity_task_timed_out_event_attributes : Types::ActivityTaskTimedOutEventAttributes?

        # If the event is of type CancelTimerFailed then this member is set and provides detailed information
        # about the event. It isn't set for other event types.
        @[JSON::Field(key: "cancelTimerFailedEventAttributes")]
        getter cancel_timer_failed_event_attributes : Types::CancelTimerFailedEventAttributes?

        # If the event is of type CancelWorkflowExecutionFailed then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "cancelWorkflowExecutionFailedEventAttributes")]
        getter cancel_workflow_execution_failed_event_attributes : Types::CancelWorkflowExecutionFailedEventAttributes?

        # If the event is of type ChildWorkflowExecutionCanceled then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "childWorkflowExecutionCanceledEventAttributes")]
        getter child_workflow_execution_canceled_event_attributes : Types::ChildWorkflowExecutionCanceledEventAttributes?

        # If the event is of type ChildWorkflowExecutionCompleted then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "childWorkflowExecutionCompletedEventAttributes")]
        getter child_workflow_execution_completed_event_attributes : Types::ChildWorkflowExecutionCompletedEventAttributes?

        # If the event is of type ChildWorkflowExecutionFailed then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "childWorkflowExecutionFailedEventAttributes")]
        getter child_workflow_execution_failed_event_attributes : Types::ChildWorkflowExecutionFailedEventAttributes?

        # If the event is of type ChildWorkflowExecutionStarted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "childWorkflowExecutionStartedEventAttributes")]
        getter child_workflow_execution_started_event_attributes : Types::ChildWorkflowExecutionStartedEventAttributes?

        # If the event is of type ChildWorkflowExecutionTerminated then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "childWorkflowExecutionTerminatedEventAttributes")]
        getter child_workflow_execution_terminated_event_attributes : Types::ChildWorkflowExecutionTerminatedEventAttributes?

        # If the event is of type ChildWorkflowExecutionTimedOut then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "childWorkflowExecutionTimedOutEventAttributes")]
        getter child_workflow_execution_timed_out_event_attributes : Types::ChildWorkflowExecutionTimedOutEventAttributes?

        # If the event is of type CompleteWorkflowExecutionFailed then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "completeWorkflowExecutionFailedEventAttributes")]
        getter complete_workflow_execution_failed_event_attributes : Types::CompleteWorkflowExecutionFailedEventAttributes?

        # If the event is of type ContinueAsNewWorkflowExecutionFailed then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "continueAsNewWorkflowExecutionFailedEventAttributes")]
        getter continue_as_new_workflow_execution_failed_event_attributes : Types::ContinueAsNewWorkflowExecutionFailedEventAttributes?

        # If the event is of type DecisionTaskCompleted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "decisionTaskCompletedEventAttributes")]
        getter decision_task_completed_event_attributes : Types::DecisionTaskCompletedEventAttributes?

        # If the event is of type DecisionTaskScheduled then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "decisionTaskScheduledEventAttributes")]
        getter decision_task_scheduled_event_attributes : Types::DecisionTaskScheduledEventAttributes?

        # If the event is of type DecisionTaskStarted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "decisionTaskStartedEventAttributes")]
        getter decision_task_started_event_attributes : Types::DecisionTaskStartedEventAttributes?

        # If the event is of type DecisionTaskTimedOut then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "decisionTaskTimedOutEventAttributes")]
        getter decision_task_timed_out_event_attributes : Types::DecisionTaskTimedOutEventAttributes?

        # If the event is of type ExternalWorkflowExecutionCancelRequested then this member is set and
        # provides detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "externalWorkflowExecutionCancelRequestedEventAttributes")]
        getter external_workflow_execution_cancel_requested_event_attributes : Types::ExternalWorkflowExecutionCancelRequestedEventAttributes?

        # If the event is of type ExternalWorkflowExecutionSignaled then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "externalWorkflowExecutionSignaledEventAttributes")]
        getter external_workflow_execution_signaled_event_attributes : Types::ExternalWorkflowExecutionSignaledEventAttributes?

        # If the event is of type FailWorkflowExecutionFailed then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "failWorkflowExecutionFailedEventAttributes")]
        getter fail_workflow_execution_failed_event_attributes : Types::FailWorkflowExecutionFailedEventAttributes?

        # Provides the details of the LambdaFunctionCompleted event. It isn't set for other event types.
        @[JSON::Field(key: "lambdaFunctionCompletedEventAttributes")]
        getter lambda_function_completed_event_attributes : Types::LambdaFunctionCompletedEventAttributes?

        # Provides the details of the LambdaFunctionFailed event. It isn't set for other event types.
        @[JSON::Field(key: "lambdaFunctionFailedEventAttributes")]
        getter lambda_function_failed_event_attributes : Types::LambdaFunctionFailedEventAttributes?

        # Provides the details of the LambdaFunctionScheduled event. It isn't set for other event types.
        @[JSON::Field(key: "lambdaFunctionScheduledEventAttributes")]
        getter lambda_function_scheduled_event_attributes : Types::LambdaFunctionScheduledEventAttributes?

        # Provides the details of the LambdaFunctionStarted event. It isn't set for other event types.
        @[JSON::Field(key: "lambdaFunctionStartedEventAttributes")]
        getter lambda_function_started_event_attributes : Types::LambdaFunctionStartedEventAttributes?

        # Provides the details of the LambdaFunctionTimedOut event. It isn't set for other event types.
        @[JSON::Field(key: "lambdaFunctionTimedOutEventAttributes")]
        getter lambda_function_timed_out_event_attributes : Types::LambdaFunctionTimedOutEventAttributes?

        # If the event is of type MarkerRecorded then this member is set and provides detailed information
        # about the event. It isn't set for other event types.
        @[JSON::Field(key: "markerRecordedEventAttributes")]
        getter marker_recorded_event_attributes : Types::MarkerRecordedEventAttributes?

        # If the event is of type DecisionTaskFailed then this member is set and provides detailed information
        # about the event. It isn't set for other event types.
        @[JSON::Field(key: "recordMarkerFailedEventAttributes")]
        getter record_marker_failed_event_attributes : Types::RecordMarkerFailedEventAttributes?

        # If the event is of type RequestCancelActivityTaskFailed then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "requestCancelActivityTaskFailedEventAttributes")]
        getter request_cancel_activity_task_failed_event_attributes : Types::RequestCancelActivityTaskFailedEventAttributes?

        # If the event is of type RequestCancelExternalWorkflowExecutionFailed then this member is set and
        # provides detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "requestCancelExternalWorkflowExecutionFailedEventAttributes")]
        getter request_cancel_external_workflow_execution_failed_event_attributes : Types::RequestCancelExternalWorkflowExecutionFailedEventAttributes?

        # If the event is of type RequestCancelExternalWorkflowExecutionInitiated then this member is set and
        # provides detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "requestCancelExternalWorkflowExecutionInitiatedEventAttributes")]
        getter request_cancel_external_workflow_execution_initiated_event_attributes : Types::RequestCancelExternalWorkflowExecutionInitiatedEventAttributes?

        # If the event is of type ScheduleActivityTaskFailed then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "scheduleActivityTaskFailedEventAttributes")]
        getter schedule_activity_task_failed_event_attributes : Types::ScheduleActivityTaskFailedEventAttributes?

        # Provides the details of the ScheduleLambdaFunctionFailed event. It isn't set for other event types.
        @[JSON::Field(key: "scheduleLambdaFunctionFailedEventAttributes")]
        getter schedule_lambda_function_failed_event_attributes : Types::ScheduleLambdaFunctionFailedEventAttributes?

        # If the event is of type SignalExternalWorkflowExecutionFailed then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "signalExternalWorkflowExecutionFailedEventAttributes")]
        getter signal_external_workflow_execution_failed_event_attributes : Types::SignalExternalWorkflowExecutionFailedEventAttributes?

        # If the event is of type SignalExternalWorkflowExecutionInitiated then this member is set and
        # provides detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "signalExternalWorkflowExecutionInitiatedEventAttributes")]
        getter signal_external_workflow_execution_initiated_event_attributes : Types::SignalExternalWorkflowExecutionInitiatedEventAttributes?

        # If the event is of type StartChildWorkflowExecutionFailed then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "startChildWorkflowExecutionFailedEventAttributes")]
        getter start_child_workflow_execution_failed_event_attributes : Types::StartChildWorkflowExecutionFailedEventAttributes?

        # If the event is of type StartChildWorkflowExecutionInitiated then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "startChildWorkflowExecutionInitiatedEventAttributes")]
        getter start_child_workflow_execution_initiated_event_attributes : Types::StartChildWorkflowExecutionInitiatedEventAttributes?

        # Provides the details of the StartLambdaFunctionFailed event. It isn't set for other event types.
        @[JSON::Field(key: "startLambdaFunctionFailedEventAttributes")]
        getter start_lambda_function_failed_event_attributes : Types::StartLambdaFunctionFailedEventAttributes?

        # If the event is of type StartTimerFailed then this member is set and provides detailed information
        # about the event. It isn't set for other event types.
        @[JSON::Field(key: "startTimerFailedEventAttributes")]
        getter start_timer_failed_event_attributes : Types::StartTimerFailedEventAttributes?

        # If the event is of type TimerCanceled then this member is set and provides detailed information
        # about the event. It isn't set for other event types.
        @[JSON::Field(key: "timerCanceledEventAttributes")]
        getter timer_canceled_event_attributes : Types::TimerCanceledEventAttributes?

        # If the event is of type TimerFired then this member is set and provides detailed information about
        # the event. It isn't set for other event types.
        @[JSON::Field(key: "timerFiredEventAttributes")]
        getter timer_fired_event_attributes : Types::TimerFiredEventAttributes?

        # If the event is of type TimerStarted then this member is set and provides detailed information about
        # the event. It isn't set for other event types.
        @[JSON::Field(key: "timerStartedEventAttributes")]
        getter timer_started_event_attributes : Types::TimerStartedEventAttributes?

        # If the event is of type WorkflowExecutionCancelRequested then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionCancelRequestedEventAttributes")]
        getter workflow_execution_cancel_requested_event_attributes : Types::WorkflowExecutionCancelRequestedEventAttributes?

        # If the event is of type WorkflowExecutionCanceled then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionCanceledEventAttributes")]
        getter workflow_execution_canceled_event_attributes : Types::WorkflowExecutionCanceledEventAttributes?

        # If the event is of type WorkflowExecutionCompleted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionCompletedEventAttributes")]
        getter workflow_execution_completed_event_attributes : Types::WorkflowExecutionCompletedEventAttributes?

        # If the event is of type WorkflowExecutionContinuedAsNew then this member is set and provides
        # detailed information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionContinuedAsNewEventAttributes")]
        getter workflow_execution_continued_as_new_event_attributes : Types::WorkflowExecutionContinuedAsNewEventAttributes?

        # If the event is of type WorkflowExecutionFailed then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionFailedEventAttributes")]
        getter workflow_execution_failed_event_attributes : Types::WorkflowExecutionFailedEventAttributes?

        # If the event is of type WorkflowExecutionSignaled then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionSignaledEventAttributes")]
        getter workflow_execution_signaled_event_attributes : Types::WorkflowExecutionSignaledEventAttributes?

        # If the event is of type WorkflowExecutionStarted then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionStartedEventAttributes")]
        getter workflow_execution_started_event_attributes : Types::WorkflowExecutionStartedEventAttributes?

        # If the event is of type WorkflowExecutionTerminated then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionTerminatedEventAttributes")]
        getter workflow_execution_terminated_event_attributes : Types::WorkflowExecutionTerminatedEventAttributes?

        # If the event is of type WorkflowExecutionTimedOut then this member is set and provides detailed
        # information about the event. It isn't set for other event types.
        @[JSON::Field(key: "workflowExecutionTimedOutEventAttributes")]
        getter workflow_execution_timed_out_event_attributes : Types::WorkflowExecutionTimedOutEventAttributes?

        def initialize(
          @event_id : Int64,
          @event_timestamp : Time,
          @event_type : String,
          @activity_task_cancel_requested_event_attributes : Types::ActivityTaskCancelRequestedEventAttributes? = nil,
          @activity_task_canceled_event_attributes : Types::ActivityTaskCanceledEventAttributes? = nil,
          @activity_task_completed_event_attributes : Types::ActivityTaskCompletedEventAttributes? = nil,
          @activity_task_failed_event_attributes : Types::ActivityTaskFailedEventAttributes? = nil,
          @activity_task_scheduled_event_attributes : Types::ActivityTaskScheduledEventAttributes? = nil,
          @activity_task_started_event_attributes : Types::ActivityTaskStartedEventAttributes? = nil,
          @activity_task_timed_out_event_attributes : Types::ActivityTaskTimedOutEventAttributes? = nil,
          @cancel_timer_failed_event_attributes : Types::CancelTimerFailedEventAttributes? = nil,
          @cancel_workflow_execution_failed_event_attributes : Types::CancelWorkflowExecutionFailedEventAttributes? = nil,
          @child_workflow_execution_canceled_event_attributes : Types::ChildWorkflowExecutionCanceledEventAttributes? = nil,
          @child_workflow_execution_completed_event_attributes : Types::ChildWorkflowExecutionCompletedEventAttributes? = nil,
          @child_workflow_execution_failed_event_attributes : Types::ChildWorkflowExecutionFailedEventAttributes? = nil,
          @child_workflow_execution_started_event_attributes : Types::ChildWorkflowExecutionStartedEventAttributes? = nil,
          @child_workflow_execution_terminated_event_attributes : Types::ChildWorkflowExecutionTerminatedEventAttributes? = nil,
          @child_workflow_execution_timed_out_event_attributes : Types::ChildWorkflowExecutionTimedOutEventAttributes? = nil,
          @complete_workflow_execution_failed_event_attributes : Types::CompleteWorkflowExecutionFailedEventAttributes? = nil,
          @continue_as_new_workflow_execution_failed_event_attributes : Types::ContinueAsNewWorkflowExecutionFailedEventAttributes? = nil,
          @decision_task_completed_event_attributes : Types::DecisionTaskCompletedEventAttributes? = nil,
          @decision_task_scheduled_event_attributes : Types::DecisionTaskScheduledEventAttributes? = nil,
          @decision_task_started_event_attributes : Types::DecisionTaskStartedEventAttributes? = nil,
          @decision_task_timed_out_event_attributes : Types::DecisionTaskTimedOutEventAttributes? = nil,
          @external_workflow_execution_cancel_requested_event_attributes : Types::ExternalWorkflowExecutionCancelRequestedEventAttributes? = nil,
          @external_workflow_execution_signaled_event_attributes : Types::ExternalWorkflowExecutionSignaledEventAttributes? = nil,
          @fail_workflow_execution_failed_event_attributes : Types::FailWorkflowExecutionFailedEventAttributes? = nil,
          @lambda_function_completed_event_attributes : Types::LambdaFunctionCompletedEventAttributes? = nil,
          @lambda_function_failed_event_attributes : Types::LambdaFunctionFailedEventAttributes? = nil,
          @lambda_function_scheduled_event_attributes : Types::LambdaFunctionScheduledEventAttributes? = nil,
          @lambda_function_started_event_attributes : Types::LambdaFunctionStartedEventAttributes? = nil,
          @lambda_function_timed_out_event_attributes : Types::LambdaFunctionTimedOutEventAttributes? = nil,
          @marker_recorded_event_attributes : Types::MarkerRecordedEventAttributes? = nil,
          @record_marker_failed_event_attributes : Types::RecordMarkerFailedEventAttributes? = nil,
          @request_cancel_activity_task_failed_event_attributes : Types::RequestCancelActivityTaskFailedEventAttributes? = nil,
          @request_cancel_external_workflow_execution_failed_event_attributes : Types::RequestCancelExternalWorkflowExecutionFailedEventAttributes? = nil,
          @request_cancel_external_workflow_execution_initiated_event_attributes : Types::RequestCancelExternalWorkflowExecutionInitiatedEventAttributes? = nil,
          @schedule_activity_task_failed_event_attributes : Types::ScheduleActivityTaskFailedEventAttributes? = nil,
          @schedule_lambda_function_failed_event_attributes : Types::ScheduleLambdaFunctionFailedEventAttributes? = nil,
          @signal_external_workflow_execution_failed_event_attributes : Types::SignalExternalWorkflowExecutionFailedEventAttributes? = nil,
          @signal_external_workflow_execution_initiated_event_attributes : Types::SignalExternalWorkflowExecutionInitiatedEventAttributes? = nil,
          @start_child_workflow_execution_failed_event_attributes : Types::StartChildWorkflowExecutionFailedEventAttributes? = nil,
          @start_child_workflow_execution_initiated_event_attributes : Types::StartChildWorkflowExecutionInitiatedEventAttributes? = nil,
          @start_lambda_function_failed_event_attributes : Types::StartLambdaFunctionFailedEventAttributes? = nil,
          @start_timer_failed_event_attributes : Types::StartTimerFailedEventAttributes? = nil,
          @timer_canceled_event_attributes : Types::TimerCanceledEventAttributes? = nil,
          @timer_fired_event_attributes : Types::TimerFiredEventAttributes? = nil,
          @timer_started_event_attributes : Types::TimerStartedEventAttributes? = nil,
          @workflow_execution_cancel_requested_event_attributes : Types::WorkflowExecutionCancelRequestedEventAttributes? = nil,
          @workflow_execution_canceled_event_attributes : Types::WorkflowExecutionCanceledEventAttributes? = nil,
          @workflow_execution_completed_event_attributes : Types::WorkflowExecutionCompletedEventAttributes? = nil,
          @workflow_execution_continued_as_new_event_attributes : Types::WorkflowExecutionContinuedAsNewEventAttributes? = nil,
          @workflow_execution_failed_event_attributes : Types::WorkflowExecutionFailedEventAttributes? = nil,
          @workflow_execution_signaled_event_attributes : Types::WorkflowExecutionSignaledEventAttributes? = nil,
          @workflow_execution_started_event_attributes : Types::WorkflowExecutionStartedEventAttributes? = nil,
          @workflow_execution_terminated_event_attributes : Types::WorkflowExecutionTerminatedEventAttributes? = nil,
          @workflow_execution_timed_out_event_attributes : Types::WorkflowExecutionTimedOutEventAttributes? = nil
        )
        end
      end

      # Provides the details of the LambdaFunctionCompleted event. It isn't set for other event types.
      struct LambdaFunctionCompletedEventAttributes
        include JSON::Serializable

        # The ID of the LambdaFunctionScheduled event that was recorded when this Lambda task was scheduled.
        # To help diagnose issues, use this information to trace back the chain of events leading up to this
        # event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the LambdaFunctionStarted event recorded when this activity task started. To help diagnose
        # issues, use this information to trace back the chain of events leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The results of the Lambda task.
        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @result : String? = nil
        )
        end
      end

      # Provides the details of the LambdaFunctionFailed event. It isn't set for other event types.
      struct LambdaFunctionFailedEventAttributes
        include JSON::Serializable

        # The ID of the LambdaFunctionScheduled event that was recorded when this activity task was scheduled.
        # To help diagnose issues, use this information to trace back the chain of events leading up to this
        # event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the LambdaFunctionStarted event recorded when this activity task started. To help diagnose
        # issues, use this information to trace back the chain of events leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The details of the failure.
        @[JSON::Field(key: "details")]
        getter details : String?

        # The reason provided for the failure.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides the details of the LambdaFunctionScheduled event. It isn't set for other event types.
      struct LambdaFunctionScheduledEventAttributes
        include JSON::Serializable

        # The ID of the LambdaFunctionCompleted event corresponding to the decision that resulted in
        # scheduling this activity task. To help diagnose issues, use this information to trace back the chain
        # of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The unique ID of the Lambda task.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the Lambda function.
        @[JSON::Field(key: "name")]
        getter name : String

        # Data attached to the event that the decider can use in subsequent workflow tasks. This data isn't
        # sent to the Lambda task.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The input provided to the Lambda task.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The maximum amount of time a worker can take to process the Lambda task.
        @[JSON::Field(key: "startToCloseTimeout")]
        getter start_to_close_timeout : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @id : String,
          @name : String,
          @control : String? = nil,
          @input : String? = nil,
          @start_to_close_timeout : String? = nil
        )
        end
      end

      # Provides the details of the LambdaFunctionStarted event. It isn't set for other event types.
      struct LambdaFunctionStartedEventAttributes
        include JSON::Serializable

        # The ID of the LambdaFunctionScheduled event that was recorded when this activity task was scheduled.
        # To help diagnose issues, use this information to trace back the chain of events leading up to this
        # event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        def initialize(
          @scheduled_event_id : Int64
        )
        end
      end

      # Provides details of the LambdaFunctionTimedOut event.
      struct LambdaFunctionTimedOutEventAttributes
        include JSON::Serializable

        # The ID of the LambdaFunctionScheduled event that was recorded when this activity task was scheduled.
        # To help diagnose issues, use this information to trace back the chain of events leading up to this
        # event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64

        # The ID of the ActivityTaskStarted event that was recorded when this activity task started. To help
        # diagnose issues, use this information to trace back the chain of events leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The type of the timeout that caused this event.
        @[JSON::Field(key: "timeoutType")]
        getter timeout_type : String?

        def initialize(
          @scheduled_event_id : Int64,
          @started_event_id : Int64,
          @timeout_type : String? = nil
        )
        end
      end

      # Returned by any operation if a system imposed limitation has been reached. To address this fault you
      # should either clean up unused resources or increase the limit by contacting AWS.
      struct LimitExceededFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct ListActivityTypesInput
        include JSON::Serializable

        # The name of the domain in which the activity types have been registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Specifies the registration status of the activity types to list.
        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If specified, only lists the activity types that have this name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the results in reverse order. By default, the results are returned in
        # ascending alphabetical order by name of the activity types.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @domain : String,
          @registration_status : String,
          @maximum_page_size : Int32? = nil,
          @name : String? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end

      struct ListClosedWorkflowExecutionsInput
        include JSON::Serializable

        # The name of the domain that contains the workflow executions to list.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # If specified, only workflow executions that match this close status are listed. For example, if
        # TERMINATED is specified, then only TERMINATED workflow executions are listed. closeStatusFilter ,
        # executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most one of
        # these in a request.
        @[JSON::Field(key: "closeStatusFilter")]
        getter close_status_filter : Types::CloseStatusFilter?

        # If specified, the workflow executions are included in the returned results based on whether their
        # close times are within the range specified by this filter. Also, if this parameter is specified, the
        # returned results are ordered by their close times. startTimeFilter and closeTimeFilter are mutually
        # exclusive. You must specify one of these in a request but not both.
        @[JSON::Field(key: "closeTimeFilter")]
        getter close_time_filter : Types::ExecutionTimeFilter?

        # If specified, only workflow executions matching the workflow ID specified in the filter are
        # returned. closeStatusFilter , executionFilter , typeFilter and tagFilter are mutually exclusive. You
        # can specify at most one of these in a request.
        @[JSON::Field(key: "executionFilter")]
        getter execution_filter : Types::WorkflowExecutionFilter?

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the results in reverse order. By default the results are returned in
        # descending order of the start or the close time of the executions.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        # If specified, the workflow executions are included in the returned results based on whether their
        # start times are within the range specified by this filter. Also, if this parameter is specified, the
        # returned results are ordered by their start times. startTimeFilter and closeTimeFilter are mutually
        # exclusive. You must specify one of these in a request but not both.
        @[JSON::Field(key: "startTimeFilter")]
        getter start_time_filter : Types::ExecutionTimeFilter?

        # If specified, only executions that have the matching tag are listed. closeStatusFilter ,
        # executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most one of
        # these in a request.
        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        # If specified, only executions of the type specified in the filter are returned. closeStatusFilter ,
        # executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most one of
        # these in a request.
        @[JSON::Field(key: "typeFilter")]
        getter type_filter : Types::WorkflowTypeFilter?

        def initialize(
          @domain : String,
          @close_status_filter : Types::CloseStatusFilter? = nil,
          @close_time_filter : Types::ExecutionTimeFilter? = nil,
          @execution_filter : Types::WorkflowExecutionFilter? = nil,
          @maximum_page_size : Int32? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil,
          @start_time_filter : Types::ExecutionTimeFilter? = nil,
          @tag_filter : Types::TagFilter? = nil,
          @type_filter : Types::WorkflowTypeFilter? = nil
        )
        end
      end

      struct ListDomainsInput
        include JSON::Serializable

        # Specifies the registration status of the domains to list.
        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the results in reverse order. By default, the results are returned in
        # ascending alphabetical order by name of the domains.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @registration_status : String,
          @maximum_page_size : Int32? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end

      struct ListOpenWorkflowExecutionsInput
        include JSON::Serializable

        # The name of the domain that contains the workflow executions to list.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Workflow executions are included in the returned results based on whether their start times are
        # within the range specified by this filter.
        @[JSON::Field(key: "startTimeFilter")]
        getter start_time_filter : Types::ExecutionTimeFilter

        # If specified, only workflow executions matching the workflow ID specified in the filter are
        # returned. executionFilter , typeFilter and tagFilter are mutually exclusive. You can specify at most
        # one of these in a request.
        @[JSON::Field(key: "executionFilter")]
        getter execution_filter : Types::WorkflowExecutionFilter?

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the results in reverse order. By default the results are returned in
        # descending order of the start time of the executions.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        # If specified, only executions that have the matching tag are listed. executionFilter , typeFilter
        # and tagFilter are mutually exclusive. You can specify at most one of these in a request.
        @[JSON::Field(key: "tagFilter")]
        getter tag_filter : Types::TagFilter?

        # If specified, only executions of the type specified in the filter are returned. executionFilter ,
        # typeFilter and tagFilter are mutually exclusive. You can specify at most one of these in a request.
        @[JSON::Field(key: "typeFilter")]
        getter type_filter : Types::WorkflowTypeFilter?

        def initialize(
          @domain : String,
          @start_time_filter : Types::ExecutionTimeFilter,
          @execution_filter : Types::WorkflowExecutionFilter? = nil,
          @maximum_page_size : Int32? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil,
          @tag_filter : Types::TagFilter? = nil,
          @type_filter : Types::WorkflowTypeFilter? = nil
        )
        end
      end

      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Amazon SWF domain.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      struct ListTagsForResourceOutput
        include JSON::Serializable

        # An array of tags associated with the domain.
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::ResourceTag)?

        def initialize(
          @tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      struct ListWorkflowTypesInput
        include JSON::Serializable

        # The name of the domain in which the workflow types have been registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Specifies the registration status of the workflow types to list.
        @[JSON::Field(key: "registrationStatus")]
        getter registration_status : String

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If specified, lists the workflow type with this name.
        @[JSON::Field(key: "name")]
        getter name : String?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the results in reverse order. By default the results are returned in
        # ascending alphabetical order of the name of the workflow types.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @domain : String,
          @registration_status : String,
          @maximum_page_size : Int32? = nil,
          @name : String? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end

      # Provides the details of the MarkerRecorded event.
      struct MarkerRecordedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # RecordMarker decision that requested this marker. This information can be useful for diagnosing
        # problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The name of the marker.
        @[JSON::Field(key: "markerName")]
        getter marker_name : String

        # The details of the marker.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @marker_name : String,
          @details : String? = nil
        )
        end
      end

      # Returned when the caller doesn't have sufficient permissions to invoke the action.
      struct OperationNotPermittedFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains the count of tasks in a task list.
      struct PendingTaskCount
        include JSON::Serializable

        # The number of tasks in the task list.
        @[JSON::Field(key: "count")]
        getter count : Int32

        # If set to true, indicates that the actual count was more than the maximum supported by this API and
        # the count returned is the truncated value.
        @[JSON::Field(key: "truncated")]
        getter truncated : Bool?

        def initialize(
          @count : Int32,
          @truncated : Bool? = nil
        )
        end
      end

      struct PollForActivityTaskInput
        include JSON::Serializable

        # The name of the domain that contains the task lists being polled.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Specifies the task list to poll for activity tasks. The specified string must not start or end with
        # whitespace. It must not contain a : (colon), / (slash), | (vertical bar), or any control characters
        # ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be the literal string arn .
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # Identity of the worker making the request, recorded in the ActivityTaskStarted event in the workflow
        # history. This enables diagnostic tracing when problems arise. The form of this identity is user
        # defined.
        @[JSON::Field(key: "identity")]
        getter identity : String?

        def initialize(
          @domain : String,
          @task_list : Types::TaskList,
          @identity : String? = nil
        )
        end
      end

      struct PollForDecisionTaskInput
        include JSON::Serializable

        # The name of the domain containing the task lists to poll.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # Specifies the task list to poll for decision tasks. The specified string must not contain a :
        # (colon), / (slash), | (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ).
        # Also, it must not be the literal string arn .
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # Identity of the decider making the request, which is recorded in the DecisionTaskStarted event in
        # the workflow history. This enables diagnostic tracing when problems arise. The form of this identity
        # is user defined.
        @[JSON::Field(key: "identity")]
        getter identity : String?

        # The maximum number of results that are returned per call. Use nextPageToken to obtain further pages
        # of results. This is an upper limit only; the actual number of results returned per call may be fewer
        # than the specified maximum.
        @[JSON::Field(key: "maximumPageSize")]
        getter maximum_page_size : Int32?

        # If NextPageToken is returned there are more results available. The value of NextPageToken is a
        # unique pagination token for each page. Make the call again using the returned token to retrieve the
        # next page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using
        # an expired pagination token will return a 400 error: " Specified token has exceeded its maximum
        # lifetime ". The configured maximumPageSize determines how many results can be returned in a single
        # call. The nextPageToken returned by this action cannot be used with GetWorkflowExecutionHistory to
        # get the next page. You must call PollForDecisionTask again (with the nextPageToken ) to retrieve the
        # next page of history records. Calling PollForDecisionTask with a nextPageToken doesn't return a new
        # decision task.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        # When set to true , returns the events in reverse order. By default the results are returned in
        # ascending order of the eventTimestamp of the events.
        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        # When set to true , returns the events with eventTimestamp greater than or equal to eventTimestamp of
        # the most recent DecisionTaskStarted event. By default, this parameter is set to false .
        @[JSON::Field(key: "startAtPreviousStartedEvent")]
        getter start_at_previous_started_event : Bool?

        def initialize(
          @domain : String,
          @task_list : Types::TaskList,
          @identity : String? = nil,
          @maximum_page_size : Int32? = nil,
          @next_page_token : String? = nil,
          @reverse_order : Bool? = nil,
          @start_at_previous_started_event : Bool? = nil
        )
        end
      end

      struct RecordActivityTaskHeartbeatInput
        include JSON::Serializable

        # The taskToken of the ActivityTask . taskToken is generated by the service and should be treated as
        # an opaque value. If the task is passed to another process, its taskToken must also be passed. This
        # enables it to provide its progress and respond with results.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # If specified, contains details about the progress of the task.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @task_token : String,
          @details : String? = nil
        )
        end
      end

      # Provides the details of the RecordMarker decision. Access Control You can use IAM policies to
      # control this decision's access to Amazon SWF resources as follows: Use a Resource element with the
      # domain name to limit the action to only specified domains. Use an Action element to allow or deny
      # permission to call this action. You cannot use an IAM policy to constrain this action's parameters.
      # If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall
      # outside the specified constraints, the action fails. The associated event attribute's cause
      # parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to
      # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct RecordMarkerDecisionAttributes
        include JSON::Serializable

        # The name of the marker.
        @[JSON::Field(key: "markerName")]
        getter marker_name : String

        # The details of the marker.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @marker_name : String,
          @details : String? = nil
        )
        end
      end

      # Provides the details of the RecordMarkerFailed event.
      struct RecordMarkerFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # RecordMarkerFailed decision for this cancellation request. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The marker's name.
        @[JSON::Field(key: "markerName")]
        getter marker_name : String

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @marker_name : String
        )
        end
      end

      struct RegisterActivityTypeInput
        include JSON::Serializable

        # The name of the domain in which this activity is to be registered.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the activity type within the domain. The specified string must not contain a : (colon),
        # / (slash), | (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it
        # must not be the literal string arn .
        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the activity type. The activity type consists of the name and version, the
        # combination of which must be unique within the domain. The specified string must not contain a :
        # (colon), / (slash), | (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ).
        # Also, it must not be the literal string arn .
        @[JSON::Field(key: "version")]
        getter version : String

        # If set, specifies the default maximum time before which a worker processing a task of this type must
        # report progress by calling RecordActivityTaskHeartbeat . If the timeout is exceeded, the activity
        # task is automatically timed out. This default can be overridden when scheduling an activity task
        # using the ScheduleActivityTask Decision . If the activity worker subsequently attempts to record a
        # heartbeat or returns a result, the activity worker receives an UnknownResource fault. In this case,
        # Amazon SWF no longer considers the activity task to be valid; the activity worker should clean up
        # the activity task. The duration is specified in seconds, an integer greater than or equal to 0 . You
        # can use NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskHeartbeatTimeout")]
        getter default_task_heartbeat_timeout : String?

        # If set, specifies the default task list to use for scheduling tasks of this activity type. This
        # default task list is used if a task list isn't provided when a task is scheduled through the
        # ScheduleActivityTask Decision .
        @[JSON::Field(key: "defaultTaskList")]
        getter default_task_list : Types::TaskList?

        # The default task priority to assign to the activity type. If not assigned, then 0 is used. Valid
        # values are integers that range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE
        # (2147483647). Higher numbers indicate higher priority. For more information about setting task
        # priority, see Setting Task Priority in the in the Amazon SWF Developer Guide . .
        @[JSON::Field(key: "defaultTaskPriority")]
        getter default_task_priority : String?

        # If set, specifies the default maximum duration for a task of this activity type. This default can be
        # overridden when scheduling an activity task using the ScheduleActivityTask Decision . The duration
        # is specified in seconds, an integer greater than or equal to 0 . You can use NONE to specify
        # unlimited duration.
        @[JSON::Field(key: "defaultTaskScheduleToCloseTimeout")]
        getter default_task_schedule_to_close_timeout : String?

        # If set, specifies the default maximum duration that a task of this activity type can wait before
        # being assigned to a worker. This default can be overridden when scheduling an activity task using
        # the ScheduleActivityTask Decision . The duration is specified in seconds, an integer greater than or
        # equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskScheduleToStartTimeout")]
        getter default_task_schedule_to_start_timeout : String?

        # If set, specifies the default maximum duration that a worker can take to process tasks of this
        # activity type. This default can be overridden when scheduling an activity task using the
        # ScheduleActivityTask Decision . The duration is specified in seconds, an integer greater than or
        # equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskStartToCloseTimeout")]
        getter default_task_start_to_close_timeout : String?

        # A textual description of the activity type.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain : String,
          @name : String,
          @version : String,
          @default_task_heartbeat_timeout : String? = nil,
          @default_task_list : Types::TaskList? = nil,
          @default_task_priority : String? = nil,
          @default_task_schedule_to_close_timeout : String? = nil,
          @default_task_schedule_to_start_timeout : String? = nil,
          @default_task_start_to_close_timeout : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct RegisterDomainInput
        include JSON::Serializable

        # Name of the domain to register. The name must be unique in the region that the domain is registered
        # in. The specified string must not start or end with whitespace. It must not contain a : (colon), /
        # (slash), | (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it
        # must not be the literal string arn .
        @[JSON::Field(key: "name")]
        getter name : String

        # The duration (in days) that records and histories of workflow executions on the domain should be
        # kept by the service. After the retention period, the workflow execution isn't available in the
        # results of visibility calls. If you pass the value NONE or 0 (zero), then the workflow execution
        # history isn't retained. As soon as the workflow execution completes, the execution record and its
        # history are deleted. The maximum workflow execution retention period is 90 days. For more
        # information about Amazon SWF service limits, see: Amazon SWF Service Limits in the Amazon SWF
        # Developer Guide .
        @[JSON::Field(key: "workflowExecutionRetentionPeriodInDays")]
        getter workflow_execution_retention_period_in_days : String

        # A text description of the domain.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Tags to be added when registering a domain. Tags may only contain unicode letters, digits,
        # whitespace, or these symbols: _ . : / = + - @ .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::ResourceTag)?

        def initialize(
          @name : String,
          @workflow_execution_retention_period_in_days : String,
          @description : String? = nil,
          @tags : Array(Types::ResourceTag)? = nil
        )
        end
      end

      struct RegisterWorkflowTypeInput
        include JSON::Serializable

        # The name of the domain in which to register the workflow type.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the workflow type. The specified string must not contain a : (colon), / (slash), |
        # (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be
        # the literal string arn .
        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the workflow type. The workflow type consists of the name and version, the
        # combination of which must be unique within the domain. To get a list of all currently registered
        # workflow types, use the ListWorkflowTypes action. The specified string must not contain a : (colon),
        # / (slash), | (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it
        # must not be the literal string arn .
        @[JSON::Field(key: "version")]
        getter version : String

        # If set, specifies the default policy to use for the child workflow executions when a workflow
        # execution of this type is terminated, by calling the TerminateWorkflowExecution action explicitly or
        # due to an expired timeout. This default can be overridden when starting a workflow execution using
        # the StartWorkflowExecution action or the StartChildWorkflowExecution Decision . The supported child
        # policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to cancel
        # is attempted for each child execution by recording a WorkflowExecutionCancelRequested event in its
        # history. It is up to the decider to take appropriate actions when it receives an execution history
        # with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "defaultChildPolicy")]
        getter default_child_policy : String?

        # If set, specifies the default maximum duration for executions of this workflow type. You can
        # override this default when starting an execution through the StartWorkflowExecution Action or
        # StartChildWorkflowExecution Decision . The duration is specified in seconds; an integer greater than
        # or equal to 0. Unlike some of the other timeout parameters in Amazon SWF, you cannot specify a value
        # of "NONE" for defaultExecutionStartToCloseTimeout ; there is a one-year max limit on the time that a
        # workflow execution can run. Exceeding this limit always causes the workflow execution to time out.
        @[JSON::Field(key: "defaultExecutionStartToCloseTimeout")]
        getter default_execution_start_to_close_timeout : String?

        # The default IAM role attached to this workflow type. Executions of this workflow type need IAM roles
        # to invoke Lambda functions. If you don't specify an IAM role when you start this workflow type, the
        # default Lambda role is attached to the execution. For more information, see
        # https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html in the Amazon SWF
        # Developer Guide .
        @[JSON::Field(key: "defaultLambdaRole")]
        getter default_lambda_role : String?

        # If set, specifies the default task list to use for scheduling decision tasks for executions of this
        # workflow type. This default is used only if a task list isn't provided when starting the execution
        # through the StartWorkflowExecution Action or StartChildWorkflowExecution Decision .
        @[JSON::Field(key: "defaultTaskList")]
        getter default_task_list : Types::TaskList?

        # The default task priority to assign to the workflow type. If not assigned, then 0 is used. Valid
        # values are integers that range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE
        # (2147483647). Higher numbers indicate higher priority. For more information about setting task
        # priority, see Setting Task Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "defaultTaskPriority")]
        getter default_task_priority : String?

        # If set, specifies the default maximum duration of decision tasks for this workflow type. This
        # default can be overridden when starting a workflow execution using the StartWorkflowExecution action
        # or the StartChildWorkflowExecution Decision . The duration is specified in seconds, an integer
        # greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskStartToCloseTimeout")]
        getter default_task_start_to_close_timeout : String?

        # Textual description of the workflow type.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @domain : String,
          @name : String,
          @version : String,
          @default_child_policy : String? = nil,
          @default_execution_start_to_close_timeout : String? = nil,
          @default_lambda_role : String? = nil,
          @default_task_list : Types::TaskList? = nil,
          @default_task_priority : String? = nil,
          @default_task_start_to_close_timeout : String? = nil,
          @description : String? = nil
        )
        end
      end

      # Provides the details of the RequestCancelActivityTask decision. Access Control You can use IAM
      # policies to control this decision's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. You cannot use an IAM policy to constrain this
      # action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or the
      # parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct RequestCancelActivityTaskDecisionAttributes
        include JSON::Serializable

        # The activityId of the activity task to be canceled.
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        def initialize(
          @activity_id : String
        )
        end
      end

      # Provides the details of the RequestCancelActivityTaskFailed event.
      struct RequestCancelActivityTaskFailedEventAttributes
        include JSON::Serializable

        # The activityId provided in the RequestCancelActivityTask decision that failed.
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # RequestCancelActivityTask decision for this cancellation request. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @activity_id : String,
          @cause : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      # Provides the details of the RequestCancelExternalWorkflowExecution decision. Access Control You can
      # use IAM policies to control this decision's access to Amazon SWF resources as follows: Use a
      # Resource element with the domain name to limit the action to only specified domains. Use an Action
      # element to allow or deny permission to call this action. You cannot use an IAM policy to constrain
      # this action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or
      # the parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct RequestCancelExternalWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # The workflowId of the external workflow execution to cancel.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The data attached to the event that can be used by the decider in subsequent workflow tasks.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The runId of the external workflow execution to cancel.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @workflow_id : String,
          @control : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the RequestCancelExternalWorkflowExecutionFailed event.
      struct RequestCancelExternalWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # RequestCancelExternalWorkflowExecution decision for this cancellation request. This information can
        # be useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The ID of the RequestCancelExternalWorkflowExecutionInitiated event corresponding to the
        # RequestCancelExternalWorkflowExecution decision to cancel this external workflow execution. This
        # information can be useful for diagnosing problems by tracing back the chain of events leading up to
        # this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The workflowId of the external workflow to which the cancel request was to be delivered.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The data attached to the event that the decider can use in subsequent workflow tasks. This data
        # isn't sent to the workflow execution.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The runId of the external workflow execution.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @initiated_event_id : Int64,
          @workflow_id : String,
          @control : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the RequestCancelExternalWorkflowExecutionInitiated event.
      struct RequestCancelExternalWorkflowExecutionInitiatedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # RequestCancelExternalWorkflowExecution decision for this cancellation request. This information can
        # be useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The workflowId of the external workflow execution to be canceled.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # Data attached to the event that can be used by the decider in subsequent workflow tasks.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The runId of the external workflow execution to be canceled.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @workflow_id : String,
          @control : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      struct RequestCancelWorkflowExecutionInput
        include JSON::Serializable

        # The name of the domain containing the workflow execution to cancel.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The workflowId of the workflow execution to cancel.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The runId of the workflow execution to cancel.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @domain : String,
          @workflow_id : String,
          @run_id : String? = nil
        )
        end
      end

      # Tags are key-value pairs that can be associated with Amazon SWF state machines and activities. Tags
      # may only contain unicode letters, digits, whitespace, or these symbols: _ . : / = + - @ .
      struct ResourceTag
        include JSON::Serializable

        # The key of a tag.
        @[JSON::Field(key: "key")]
        getter key : String

        # The value of a tag.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String,
          @value : String? = nil
        )
        end
      end

      struct RespondActivityTaskCanceledInput
        include JSON::Serializable

        # The taskToken of the ActivityTask . taskToken is generated by the service and should be treated as
        # an opaque value. If the task is passed to another process, its taskToken must also be passed. This
        # enables it to provide its progress and respond with results.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # Information about the cancellation.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @task_token : String,
          @details : String? = nil
        )
        end
      end

      struct RespondActivityTaskCompletedInput
        include JSON::Serializable

        # The taskToken of the ActivityTask . taskToken is generated by the service and should be treated as
        # an opaque value. If the task is passed to another process, its taskToken must also be passed. This
        # enables it to provide its progress and respond with results.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # The result of the activity task. It is a free form string that is implementation specific.
        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @task_token : String,
          @result : String? = nil
        )
        end
      end

      struct RespondActivityTaskFailedInput
        include JSON::Serializable

        # The taskToken of the ActivityTask . taskToken is generated by the service and should be treated as
        # an opaque value. If the task is passed to another process, its taskToken must also be passed. This
        # enables it to provide its progress and respond with results.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # Detailed information about the failure.
        @[JSON::Field(key: "details")]
        getter details : String?

        # Description of the error that may assist in diagnostics.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @task_token : String,
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Input data for a TaskCompleted response to a decision task.
      struct RespondDecisionTaskCompletedInput
        include JSON::Serializable

        # The taskToken from the DecisionTask . taskToken is generated by the service and should be treated as
        # an opaque value. If the task is passed to another process, its taskToken must also be passed. This
        # enables it to provide its progress and respond with results.
        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # The list of decisions (possibly empty) made by the decider while processing this decision task. See
        # the docs for the Decision structure for details.
        @[JSON::Field(key: "decisions")]
        getter decisions : Array(Types::Decision)?

        # User defined context to add to workflow execution.
        @[JSON::Field(key: "executionContext")]
        getter execution_context : String?

        # The task list to use for the future decision tasks of this workflow execution. This list overrides
        # the original task list you specified while starting the workflow execution.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList?

        # Specifies a timeout (in seconds) for the task list override. When this parameter is missing, the
        # task list override is permanent. This parameter makes it possible to temporarily override the task
        # list. If a decision task scheduled on the override task list is not started within the timeout, the
        # decision task will time out. Amazon SWF will revert the override and schedule a new decision task to
        # the original task list. If a decision task scheduled on the override task list is started within the
        # timeout, but not completed within the start-to-close timeout, Amazon SWF will also revert the
        # override and schedule a new decision task to the original task list.
        @[JSON::Field(key: "taskListScheduleToStartTimeout")]
        getter task_list_schedule_to_start_timeout : String?

        def initialize(
          @task_token : String,
          @decisions : Array(Types::Decision)? = nil,
          @execution_context : String? = nil,
          @task_list : Types::TaskList? = nil,
          @task_list_schedule_to_start_timeout : String? = nil
        )
        end
      end

      # Specifies the runId of a workflow execution.
      struct Run
        include JSON::Serializable

        # The runId of a workflow execution. This ID is generated by the service and can be used to uniquely
        # identify the workflow execution within a domain.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the ScheduleActivityTask decision. Access Control You can use IAM policies
      # to control this decision's access to Amazon SWF resources as follows: Use a Resource element with
      # the domain name to limit the action to only specified domains. Use an Action element to allow or
      # deny permission to call this action. Constrain the following parameters by using a Condition element
      # with the appropriate keys. activityType.name – String constraint. The key is swf:activityType.name .
      # activityType.version – String constraint. The key is swf:activityType.version . taskList – String
      # constraint. The key is swf:taskList.name . If the caller doesn't have sufficient permissions to
      # invoke the action, or the parameter values fall outside the specified constraints, the action fails.
      # The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and
      # example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF
      # Developer Guide .
      struct ScheduleActivityTaskDecisionAttributes
        include JSON::Serializable

        # The activityId of the activity task. The specified string must not contain a : (colon), / (slash), |
        # (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be
        # the literal string arn .
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The type of the activity task to schedule.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # Data attached to the event that can be used by the decider in subsequent workflow tasks. This data
        # isn't sent to the activity.
        @[JSON::Field(key: "control")]
        getter control : String?

        # If set, specifies the maximum time before which a worker processing a task of this type must report
        # progress by calling RecordActivityTaskHeartbeat . If the timeout is exceeded, the activity task is
        # automatically timed out. If the worker subsequently attempts to record a heartbeat or returns a
        # result, it is ignored. This overrides the default heartbeat timeout specified when registering the
        # activity type using RegisterActivityType . The duration is specified in seconds, an integer greater
        # than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "heartbeatTimeout")]
        getter heartbeat_timeout : String?

        # The input provided to the activity task.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The maximum duration for this activity task. The duration is specified in seconds, an integer
        # greater than or equal to 0 . You can use NONE to specify unlimited duration. A schedule-to-close
        # timeout for this activity task must be specified either as a default for the activity type or
        # through this field. If neither this field is set nor a default schedule-to-close timeout was
        # specified at registration time then a fault is returned.
        @[JSON::Field(key: "scheduleToCloseTimeout")]
        getter schedule_to_close_timeout : String?

        # If set, specifies the maximum duration the activity task can wait to be assigned to a worker. This
        # overrides the default schedule-to-start timeout specified when registering the activity type using
        # RegisterActivityType . The duration is specified in seconds, an integer greater than or equal to 0 .
        # You can use NONE to specify unlimited duration. A schedule-to-start timeout for this activity task
        # must be specified either as a default for the activity type or through this field. If neither this
        # field is set nor a default schedule-to-start timeout was specified at registration time then a fault
        # is returned.
        @[JSON::Field(key: "scheduleToStartTimeout")]
        getter schedule_to_start_timeout : String?

        # If set, specifies the maximum duration a worker may take to process this activity task. This
        # overrides the default start-to-close timeout specified when registering the activity type using
        # RegisterActivityType . The duration is specified in seconds, an integer greater than or equal to 0 .
        # You can use NONE to specify unlimited duration. A start-to-close timeout for this activity task must
        # be specified either as a default for the activity type or through this field. If neither this field
        # is set nor a default start-to-close timeout was specified at registration time then a fault is
        # returned.
        @[JSON::Field(key: "startToCloseTimeout")]
        getter start_to_close_timeout : String?

        # If set, specifies the name of the task list in which to schedule the activity task. If not
        # specified, the defaultTaskList registered with the activity type is used. A task list for this
        # activity task must be specified either as a default for the activity type or through this field. If
        # neither this field is set nor a default task list was specified at registration time then a fault is
        # returned. The specified string must not contain a : (colon), / (slash), | (vertical bar), or any
        # control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be the literal string arn .
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList?

        # If set, specifies the priority with which the activity task is to be assigned to a worker. This
        # overrides the defaultTaskPriority specified when registering the activity type using
        # RegisterActivityType . Valid values are integers that range from Java's Integer.MIN_VALUE
        # (-2147483648) to Integer.MAX_VALUE (2147483647). Higher numbers indicate higher priority. For more
        # information about setting task priority, see Setting Task Priority in the Amazon SWF Developer Guide
        # .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        def initialize(
          @activity_id : String,
          @activity_type : Types::ActivityType,
          @control : String? = nil,
          @heartbeat_timeout : String? = nil,
          @input : String? = nil,
          @schedule_to_close_timeout : String? = nil,
          @schedule_to_start_timeout : String? = nil,
          @start_to_close_timeout : String? = nil,
          @task_list : Types::TaskList? = nil,
          @task_priority : String? = nil
        )
        end
      end

      # Provides the details of the ScheduleActivityTaskFailed event.
      struct ScheduleActivityTaskFailedEventAttributes
        include JSON::Serializable

        # The activityId provided in the ScheduleActivityTask decision that failed.
        @[JSON::Field(key: "activityId")]
        getter activity_id : String

        # The activity type provided in the ScheduleActivityTask decision that failed.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision that resulted in the
        # scheduling of this activity task. This information can be useful for diagnosing problems by tracing
        # back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        def initialize(
          @activity_id : String,
          @activity_type : Types::ActivityType,
          @cause : String,
          @decision_task_completed_event_id : Int64
        )
        end
      end

      # Decision attributes specified in scheduleLambdaFunctionDecisionAttributes within the list of
      # decisions decisions passed to RespondDecisionTaskCompleted .
      struct ScheduleLambdaFunctionDecisionAttributes
        include JSON::Serializable

        # A string that identifies the Lambda function execution in the event history.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name, or ARN, of the Lambda function to schedule.
        @[JSON::Field(key: "name")]
        getter name : String

        # The data attached to the event that the decider can use in subsequent workflow tasks. This data
        # isn't sent to the Lambda task.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The optional input data to be supplied to the Lambda function.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The timeout value, in seconds, after which the Lambda function is considered to be failed once it
        # has started. This can be any integer from 1-900 (1s-15m). If no value is supplied, then a default
        # value of 900s is assumed.
        @[JSON::Field(key: "startToCloseTimeout")]
        getter start_to_close_timeout : String?

        def initialize(
          @id : String,
          @name : String,
          @control : String? = nil,
          @input : String? = nil,
          @start_to_close_timeout : String? = nil
        )
        end
      end

      # Provides the details of the ScheduleLambdaFunctionFailed event. It isn't set for other event types.
      struct ScheduleLambdaFunctionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. To help diagnose issues, use this information to trace back the chain of
        # events leading up to this event. If cause is set to OPERATION_NOT_PERMITTED , the decision failed
        # because it lacked sufficient permissions. For details and example IAM policies, see Using IAM to
        # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the LambdaFunctionCompleted event corresponding to the decision that resulted in
        # scheduling this Lambda task. To help diagnose issues, use this information to trace back the chain
        # of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The ID provided in the ScheduleLambdaFunction decision that failed.
        @[JSON::Field(key: "id")]
        getter id : String

        # The name of the Lambda function.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @id : String,
          @name : String
        )
        end
      end

      # Provides the details of the SignalExternalWorkflowExecution decision. Access Control You can use IAM
      # policies to control this decision's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. You cannot use an IAM policy to constrain this
      # action's parameters. If the caller doesn't have sufficient permissions to invoke the action, or the
      # parameter values fall outside the specified constraints, the action fails. The associated event
      # attribute's cause parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM
      # policies, see Using IAM to Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct SignalExternalWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # The name of the signal.The target workflow execution uses the signal name and input to process the
        # signal.
        @[JSON::Field(key: "signalName")]
        getter signal_name : String

        # The workflowId of the workflow execution to be signaled.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The data attached to the event that can be used by the decider in subsequent decision tasks.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The input data to be provided with the signal. The target workflow execution uses the signal name
        # and input data to process the signal.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The runId of the workflow execution to be signaled.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @signal_name : String,
          @workflow_id : String,
          @control : String? = nil,
          @input : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the SignalExternalWorkflowExecutionFailed event.
      struct SignalExternalWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # SignalExternalWorkflowExecution decision for this signal. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The ID of the SignalExternalWorkflowExecutionInitiated event corresponding to the
        # SignalExternalWorkflowExecution decision to request this signal. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The workflowId of the external workflow execution that the signal was being delivered to.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The data attached to the event that the decider can use in subsequent workflow tasks. This data
        # isn't sent to the workflow execution.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The runId of the external workflow execution that the signal was being delivered to.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @initiated_event_id : Int64,
          @workflow_id : String,
          @control : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the SignalExternalWorkflowExecutionInitiated event.
      struct SignalExternalWorkflowExecutionInitiatedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # SignalExternalWorkflowExecution decision for this signal. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The name of the signal.
        @[JSON::Field(key: "signalName")]
        getter signal_name : String

        # The workflowId of the external workflow execution.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # Data attached to the event that can be used by the decider in subsequent decision tasks.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The input provided to the signal.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The runId of the external workflow execution to send the signal to.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @signal_name : String,
          @workflow_id : String,
          @control : String? = nil,
          @input : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      struct SignalWorkflowExecutionInput
        include JSON::Serializable

        # The name of the domain containing the workflow execution to signal.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the signal. This name must be meaningful to the target workflow.
        @[JSON::Field(key: "signalName")]
        getter signal_name : String

        # The workflowId of the workflow execution to signal.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # Data to attach to the WorkflowExecutionSignaled event in the target workflow execution's history.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The runId of the workflow execution to signal.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @domain : String,
          @signal_name : String,
          @workflow_id : String,
          @input : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the StartChildWorkflowExecution decision. Access Control You can use IAM
      # policies to control this decision's access to Amazon SWF resources as follows: Use a Resource
      # element with the domain name to limit the action to only specified domains. Use an Action element to
      # allow or deny permission to call this action. Constrain the following parameters by using a
      # Condition element with the appropriate keys. tagList.member.N – The key is "swf:tagList.N" where N
      # is the tag number from 0 to 4, inclusive. taskList – String constraint. The key is swf:taskList.name
      # . workflowType.name – String constraint. The key is swf:workflowType.name . workflowType.version –
      # String constraint. The key is swf:workflowType.version . If the caller doesn't have sufficient
      # permissions to invoke the action, or the parameter values fall outside the specified constraints,
      # the action fails. The associated event attribute's cause parameter is set to OPERATION_NOT_PERMITTED
      # . For details and example IAM policies, see Using IAM to Manage Access to Amazon SWF Workflows in
      # the Amazon SWF Developer Guide .
      struct StartChildWorkflowExecutionDecisionAttributes
        include JSON::Serializable

        # The workflowId of the workflow execution. The specified string must not contain a : (colon), /
        # (slash), | (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it
        # must not be the literal string arn .
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The type of the workflow execution to be started.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # If set, specifies the policy to use for the child workflow executions if the workflow execution
        # being started is terminated by calling the TerminateWorkflowExecution action explicitly or due to an
        # expired timeout. This policy overrides the default child policy specified when registering the
        # workflow type using RegisterWorkflowType . The supported child policies are: TERMINATE – The child
        # executions are terminated. REQUEST_CANCEL – A request to cancel is attempted for each child
        # execution by recording a WorkflowExecutionCancelRequested event in its history. It is up to the
        # decider to take appropriate actions when it receives an execution history with this event. ABANDON –
        # No action is taken. The child executions continue to run. A child policy for this workflow execution
        # must be specified either as a default for the workflow type or through this parameter. If neither
        # this parameter is set nor a default child policy was specified at registration time then a fault is
        # returned.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String?

        # The data attached to the event that can be used by the decider in subsequent workflow tasks. This
        # data isn't sent to the child workflow execution.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The total duration for this workflow execution. This overrides the
        # defaultExecutionStartToCloseTimeout specified when registering the workflow type. The duration is
        # specified in seconds, an integer greater than or equal to 0 . You can use NONE to specify unlimited
        # duration. An execution start-to-close timeout for this workflow execution must be specified either
        # as a default for the workflow type or through this parameter. If neither this parameter is set nor a
        # default execution start-to-close timeout was specified at registration time then a fault is
        # returned.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String?

        # The input to be provided to the workflow execution.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The IAM role attached to the child workflow execution.
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The list of tags to associate with the child workflow execution. A maximum of 5 tags can be
        # specified. You can list workflow executions with a specific tag by calling
        # ListOpenWorkflowExecutions or ListClosedWorkflowExecutions and specifying a TagFilter .
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        # The name of the task list to be used for decision tasks of the child workflow execution. A task list
        # for this workflow execution must be specified either as a default for the workflow type or through
        # this parameter. If neither this parameter is set nor a default task list was specified at
        # registration time then a fault is returned. The specified string must not start or end with
        # whitespace. It must not contain a : (colon), / (slash), | (vertical bar), or any control characters
        # ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be the literal string arn .
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList?

        # A task priority that, if set, specifies the priority for a decision task of this workflow execution.
        # This overrides the defaultTaskPriority specified when registering the workflow type. Valid values
        # are integers that range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE
        # (2147483647). Higher numbers indicate higher priority. For more information about setting task
        # priority, see Setting Task Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        # Specifies the maximum duration of decision tasks for this workflow execution. This parameter
        # overrides the defaultTaskStartToCloseTimout specified when registering the workflow type using
        # RegisterWorkflowType . The duration is specified in seconds, an integer greater than or equal to 0 .
        # You can use NONE to specify unlimited duration. A task start-to-close timeout for this workflow
        # execution must be specified either as a default for the workflow type or through this parameter. If
        # neither this parameter is set nor a default task start-to-close timeout was specified at
        # registration time then a fault is returned.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String?

        def initialize(
          @workflow_id : String,
          @workflow_type : Types::WorkflowType,
          @child_policy : String? = nil,
          @control : String? = nil,
          @execution_start_to_close_timeout : String? = nil,
          @input : String? = nil,
          @lambda_role : String? = nil,
          @tag_list : Array(String)? = nil,
          @task_list : Types::TaskList? = nil,
          @task_priority : String? = nil,
          @task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Provides the details of the StartChildWorkflowExecutionFailed event.
      struct StartChildWorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. When cause is set to OPERATION_NOT_PERMITTED , the decision fails because it
        # lacks sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # StartChildWorkflowExecution Decision to request this child workflow execution. This information can
        # be useful for diagnosing problems by tracing back the chain of events.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # When the cause is WORKFLOW_ALREADY_RUNNING , initiatedEventId is the ID of the
        # StartChildWorkflowExecutionInitiated event that corresponds to the StartChildWorkflowExecution
        # Decision to start the workflow execution. You can use this information to diagnose problems by
        # tracing back the chain of events leading up to this event. When the cause isn't
        # WORKFLOW_ALREADY_RUNNING , initiatedEventId is set to 0 because the
        # StartChildWorkflowExecutionInitiated event doesn't exist.
        @[JSON::Field(key: "initiatedEventId")]
        getter initiated_event_id : Int64

        # The workflowId of the child workflow execution.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The workflow type provided in the StartChildWorkflowExecution Decision that failed.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # The data attached to the event that the decider can use in subsequent workflow tasks. This data
        # isn't sent to the child workflow execution.
        @[JSON::Field(key: "control")]
        getter control : String?

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @initiated_event_id : Int64,
          @workflow_id : String,
          @workflow_type : Types::WorkflowType,
          @control : String? = nil
        )
        end
      end

      # Provides the details of the StartChildWorkflowExecutionInitiated event.
      struct StartChildWorkflowExecutionInitiatedEventAttributes
        include JSON::Serializable

        # The policy to use for the child workflow executions if this execution gets terminated by explicitly
        # calling the TerminateWorkflowExecution action or due to an expired timeout. The supported child
        # policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to cancel
        # is attempted for each child execution by recording a WorkflowExecutionCancelRequested event in its
        # history. It is up to the decider to take appropriate actions when it receives an execution history
        # with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # StartChildWorkflowExecution Decision to request this child workflow execution. This information can
        # be useful for diagnosing problems by tracing back the cause of events.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The name of the task list used for the decision tasks of the child workflow execution.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # The workflowId of the child workflow execution.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The type of the child workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # Data attached to the event that can be used by the decider in subsequent decision tasks. This data
        # isn't sent to the activity.
        @[JSON::Field(key: "control")]
        getter control : String?

        # The maximum duration for the child workflow execution. If the workflow execution isn't closed within
        # this duration, it is timed out and force-terminated. The duration is specified in seconds, an
        # integer greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String?

        # The inputs provided to the child workflow execution.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The IAM role to attach to the child workflow execution.
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The list of tags to associated with the child workflow execution.
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        # The priority assigned for the decision tasks for this workflow execution. Valid values are integers
        # that range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE (2147483647). Higher
        # numbers indicate higher priority. For more information about setting task priority, see Setting Task
        # Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        # The maximum duration allowed for the decision tasks for this workflow execution. The duration is
        # specified in seconds, an integer greater than or equal to 0 . You can use NONE to specify unlimited
        # duration.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String?

        def initialize(
          @child_policy : String,
          @decision_task_completed_event_id : Int64,
          @task_list : Types::TaskList,
          @workflow_id : String,
          @workflow_type : Types::WorkflowType,
          @control : String? = nil,
          @execution_start_to_close_timeout : String? = nil,
          @input : String? = nil,
          @lambda_role : String? = nil,
          @tag_list : Array(String)? = nil,
          @task_priority : String? = nil,
          @task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Provides the details of the StartLambdaFunctionFailed event. It isn't set for other event types.
      struct StartLambdaFunctionFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. To help diagnose issues, use this information to trace back the chain of
        # events leading up to this event. If cause is set to OPERATION_NOT_PERMITTED , the decision failed
        # because the IAM role attached to the execution lacked sufficient permissions. For details and
        # example IAM policies, see Lambda Tasks in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String?

        # A description that can help diagnose the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the ActivityTaskScheduled event that was recorded when this activity task was scheduled.
        # To help diagnose issues, use this information to trace back the chain of events leading up to this
        # event.
        @[JSON::Field(key: "scheduledEventId")]
        getter scheduled_event_id : Int64?

        def initialize(
          @cause : String? = nil,
          @message : String? = nil,
          @scheduled_event_id : Int64? = nil
        )
        end
      end

      # Provides the details of the StartTimer decision. Access Control You can use IAM policies to control
      # this decision's access to Amazon SWF resources as follows: Use a Resource element with the domain
      # name to limit the action to only specified domains. Use an Action element to allow or deny
      # permission to call this action. You cannot use an IAM policy to constrain this action's parameters.
      # If the caller doesn't have sufficient permissions to invoke the action, or the parameter values fall
      # outside the specified constraints, the action fails. The associated event attribute's cause
      # parameter is set to OPERATION_NOT_PERMITTED . For details and example IAM policies, see Using IAM to
      # Manage Access to Amazon SWF Workflows in the Amazon SWF Developer Guide .
      struct StartTimerDecisionAttributes
        include JSON::Serializable

        # The duration to wait before firing the timer. The duration is specified in seconds, an integer
        # greater than or equal to 0 .
        @[JSON::Field(key: "startToFireTimeout")]
        getter start_to_fire_timeout : String

        # The unique ID of the timer. The specified string must not contain a : (colon), / (slash), |
        # (vertical bar), or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be
        # the literal string arn .
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        # The data attached to the event that can be used by the decider in subsequent workflow tasks.
        @[JSON::Field(key: "control")]
        getter control : String?

        def initialize(
          @start_to_fire_timeout : String,
          @timer_id : String,
          @control : String? = nil
        )
        end
      end

      # Provides the details of the StartTimerFailed event.
      struct StartTimerFailedEventAttributes
        include JSON::Serializable

        # The cause of the failure. This information is generated by the system and can be useful for
        # diagnostic purposes. If cause is set to OPERATION_NOT_PERMITTED , the decision failed because it
        # lacked sufficient permissions. For details and example IAM policies, see Using IAM to Manage Access
        # to Amazon SWF Workflows in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "cause")]
        getter cause : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # StartTimer decision for this activity task. This information can be useful for diagnosing problems
        # by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The timerId provided in the StartTimer decision that failed.
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        def initialize(
          @cause : String,
          @decision_task_completed_event_id : Int64,
          @timer_id : String
        )
        end
      end

      struct StartWorkflowExecutionInput
        include JSON::Serializable

        # The name of the domain in which the workflow execution is created. The specified string must not
        # contain a : (colon), / (slash), | (vertical bar), or any control characters ( \u0000-\u001f |
        # \u007f-\u009f ). Also, it must not be the literal string arn .
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The user defined identifier associated with the workflow execution. You can use this to associate a
        # custom identifier with the workflow execution. You may specify the same identifier if a workflow
        # execution is logically a restart of a previous execution. You cannot have two open workflow
        # executions with the same workflowId at the same time within the same domain. The specified string
        # must not contain a : (colon), / (slash), | (vertical bar), or any control characters ( \u0000-\u001f
        # | \u007f-\u009f ). Also, it must not be the literal string arn .
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # The type of the workflow to start.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # If set, specifies the policy to use for the child workflow executions of this workflow execution if
        # it is terminated, by calling the TerminateWorkflowExecution action explicitly or due to an expired
        # timeout. This policy overrides the default child policy specified when registering the workflow type
        # using RegisterWorkflowType . The supported child policies are: TERMINATE – The child executions are
        # terminated. REQUEST_CANCEL – A request to cancel is attempted for each child execution by recording
        # a WorkflowExecutionCancelRequested event in its history. It is up to the decider to take appropriate
        # actions when it receives an execution history with this event. ABANDON – No action is taken. The
        # child executions continue to run. A child policy for this workflow execution must be specified
        # either as a default for the workflow type or through this parameter. If neither this parameter is
        # set nor a default child policy was specified at registration time then a fault is returned.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String?

        # The total duration for this workflow execution. This overrides the
        # defaultExecutionStartToCloseTimeout specified when registering the workflow type. The duration is
        # specified in seconds; an integer greater than or equal to 0 . Exceeding this limit causes the
        # workflow execution to time out. Unlike some of the other timeout parameters in Amazon SWF, you
        # cannot specify a value of "NONE" for this timeout; there is a one-year max limit on the time that a
        # workflow execution can run. An execution start-to-close timeout must be specified either through
        # this parameter or as a default when the workflow type is registered. If neither this parameter nor a
        # default execution start-to-close timeout is specified, a fault is returned.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String?

        # The input for the workflow execution. This is a free form string which should be meaningful to the
        # workflow you are starting. This input is made available to the new workflow execution in the
        # WorkflowExecutionStarted history event.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The IAM role to attach to this workflow execution. Executions of this workflow type need IAM roles
        # to invoke Lambda functions. If you don't attach an IAM role, any attempt to schedule a Lambda task
        # fails. This results in a ScheduleLambdaFunctionFailed history event. For more information, see
        # https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html in the Amazon SWF
        # Developer Guide .
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The list of tags to associate with the workflow execution. You can specify a maximum of 5 tags. You
        # can list workflow executions with a specific tag by calling ListOpenWorkflowExecutions or
        # ListClosedWorkflowExecutions and specifying a TagFilter .
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        # The task list to use for the decision tasks generated for this workflow execution. This overrides
        # the defaultTaskList specified when registering the workflow type. A task list for this workflow
        # execution must be specified either as a default for the workflow type or through this parameter. If
        # neither this parameter is set nor a default task list was specified at registration time then a
        # fault is returned. The specified string must not contain a : (colon), / (slash), | (vertical bar),
        # or any control characters ( \u0000-\u001f | \u007f-\u009f ). Also, it must not be the literal string
        # arn .
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList?

        # The task priority to use for this workflow execution. This overrides any default priority that was
        # assigned when the workflow type was registered. If not set, then the default task priority for the
        # workflow type is used. Valid values are integers that range from Java's Integer.MIN_VALUE
        # (-2147483648) to Integer.MAX_VALUE (2147483647). Higher numbers indicate higher priority. For more
        # information about setting task priority, see Setting Task Priority in the Amazon SWF Developer Guide
        # .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        # Specifies the maximum duration of decision tasks for this workflow execution. This parameter
        # overrides the defaultTaskStartToCloseTimout specified when registering the workflow type using
        # RegisterWorkflowType . The duration is specified in seconds, an integer greater than or equal to 0 .
        # You can use NONE to specify unlimited duration. A task start-to-close timeout for this workflow
        # execution must be specified either as a default for the workflow type or through this parameter. If
        # neither this parameter is set nor a default task start-to-close timeout was specified at
        # registration time then a fault is returned.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String?

        def initialize(
          @domain : String,
          @workflow_id : String,
          @workflow_type : Types::WorkflowType,
          @child_policy : String? = nil,
          @execution_start_to_close_timeout : String? = nil,
          @input : String? = nil,
          @lambda_role : String? = nil,
          @tag_list : Array(String)? = nil,
          @task_list : Types::TaskList? = nil,
          @task_priority : String? = nil,
          @task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Used to filter the workflow executions in visibility APIs based on a tag.
      struct TagFilter
        include JSON::Serializable

        # Specifies the tag that must be associated with the execution for it to meet the filter criteria.
        # Tags may only contain unicode letters, digits, whitespace, or these symbols: _ . : / = + - @ .
        @[JSON::Field(key: "tag")]
        getter tag : String

        def initialize(
          @tag : String
        )
        end
      end

      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Amazon SWF domain.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tags to add to a domain. Tags may only contain unicode letters, digits, whitespace, or
        # these symbols: _ . : / = + - @ .
        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::ResourceTag)

        def initialize(
          @resource_arn : String,
          @tags : Array(Types::ResourceTag)
        )
        end
      end

      # Represents a task list.
      struct TaskList
        include JSON::Serializable

        # The name of the task list.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct TerminateWorkflowExecutionInput
        include JSON::Serializable

        # The domain of the workflow execution to terminate.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The workflowId of the workflow execution to terminate.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        # If set, specifies the policy to use for the child workflow executions of the workflow execution
        # being terminated. This policy overrides the child policy specified for the workflow execution at
        # registration time or when starting the execution. The supported child policies are: TERMINATE – The
        # child executions are terminated. REQUEST_CANCEL – A request to cancel is attempted for each child
        # execution by recording a WorkflowExecutionCancelRequested event in its history. It is up to the
        # decider to take appropriate actions when it receives an execution history with this event. ABANDON –
        # No action is taken. The child executions continue to run. A child policy for this workflow execution
        # must be specified either as a default for the workflow type or through this parameter. If neither
        # this parameter is set nor a default child policy was specified at registration time then a fault is
        # returned.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String?

        # Details for terminating the workflow execution.
        @[JSON::Field(key: "details")]
        getter details : String?

        # A descriptive reason for terminating the workflow execution.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The runId of the workflow execution to terminate.
        @[JSON::Field(key: "runId")]
        getter run_id : String?

        def initialize(
          @domain : String,
          @workflow_id : String,
          @child_policy : String? = nil,
          @details : String? = nil,
          @reason : String? = nil,
          @run_id : String? = nil
        )
        end
      end

      # Provides the details of the TimerCanceled event.
      struct TimerCanceledEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # CancelTimer decision to cancel this timer. This information can be useful for diagnosing problems by
        # tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The ID of the TimerStarted event that was recorded when this timer was started. This information can
        # be useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The unique ID of the timer that was canceled.
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        def initialize(
          @decision_task_completed_event_id : Int64,
          @started_event_id : Int64,
          @timer_id : String
        )
        end
      end

      # Provides the details of the TimerFired event.
      struct TimerFiredEventAttributes
        include JSON::Serializable

        # The ID of the TimerStarted event that was recorded when this timer was started. This information can
        # be useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "startedEventId")]
        getter started_event_id : Int64

        # The unique ID of the timer that fired.
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        def initialize(
          @started_event_id : Int64,
          @timer_id : String
        )
        end
      end

      # Provides the details of the TimerStarted event.
      struct TimerStartedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # StartTimer decision for this activity task. This information can be useful for diagnosing problems
        # by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The duration of time after which the timer fires. The duration is specified in seconds, an integer
        # greater than or equal to 0 .
        @[JSON::Field(key: "startToFireTimeout")]
        getter start_to_fire_timeout : String

        # The unique ID of the timer that was started.
        @[JSON::Field(key: "timerId")]
        getter timer_id : String

        # Data attached to the event that can be used by the decider in subsequent workflow tasks.
        @[JSON::Field(key: "control")]
        getter control : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @start_to_fire_timeout : String,
          @timer_id : String,
          @control : String? = nil
        )
        end
      end

      # You've exceeded the number of tags allowed for a domain.
      struct TooManyTagsFault
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Returned if the type already exists in the specified domain. You may get this fault if you are
      # registering a type that is either already registered or deprecated, or if you undeprecate a type
      # that is currently registered.
      struct TypeAlreadyExistsFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Returned when the specified activity or workflow type was already deprecated.
      struct TypeDeprecatedFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Returned when the resource type has not been deprecated.
      struct TypeNotDeprecatedFault
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UndeprecateActivityTypeInput
        include JSON::Serializable

        # The activity type to undeprecate.
        @[JSON::Field(key: "activityType")]
        getter activity_type : Types::ActivityType

        # The name of the domain of the deprecated activity type.
        @[JSON::Field(key: "domain")]
        getter domain : String

        def initialize(
          @activity_type : Types::ActivityType,
          @domain : String
        )
        end
      end

      struct UndeprecateDomainInput
        include JSON::Serializable

        # The name of the domain of the deprecated workflow type.
        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      struct UndeprecateWorkflowTypeInput
        include JSON::Serializable

        # The name of the domain of the deprecated workflow type.
        @[JSON::Field(key: "domain")]
        getter domain : String

        # The name of the domain of the deprecated workflow type.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        def initialize(
          @domain : String,
          @workflow_type : Types::WorkflowType
        )
        end
      end

      # Returned when the named resource cannot be found with in the scope of this operation (region or
      # domain). This could happen if the named resource was never created or is no longer available for
      # this operation.
      struct UnknownResourceFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Amazon SWF domain.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tags to remove from the Amazon SWF domain.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)
        )
        end
      end

      # Represents a workflow execution.
      struct WorkflowExecution
        include JSON::Serializable

        # A system-generated unique identifier for the workflow execution.
        @[JSON::Field(key: "runId")]
        getter run_id : String

        # The user defined identifier associated with the workflow execution.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @run_id : String,
          @workflow_id : String
        )
        end
      end

      # Returned by StartWorkflowExecution when an open execution with the same workflowId is already
      # running in the specified domain.
      struct WorkflowExecutionAlreadyStartedFault
        include JSON::Serializable

        # A description that may help with diagnosing the cause of the fault.
        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionCancelRequested event.
      struct WorkflowExecutionCancelRequestedEventAttributes
        include JSON::Serializable

        # If set, indicates that the request to cancel the workflow execution was automatically generated, and
        # specifies the cause. This happens if the parent workflow execution times out or is terminated, and
        # the child policy is set to cancel child executions.
        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The ID of the RequestCancelExternalWorkflowExecutionInitiated event corresponding to the
        # RequestCancelExternalWorkflowExecution decision to cancel this workflow execution.The source event
        # with this ID can be found in the history of the source workflow execution. This information can be
        # useful for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "externalInitiatedEventId")]
        getter external_initiated_event_id : Int64?

        # The external workflow execution for which the cancellation was requested.
        @[JSON::Field(key: "externalWorkflowExecution")]
        getter external_workflow_execution : Types::WorkflowExecution?

        def initialize(
          @cause : String? = nil,
          @external_initiated_event_id : Int64? = nil,
          @external_workflow_execution : Types::WorkflowExecution? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionCanceled event.
      struct WorkflowExecutionCanceledEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # CancelWorkflowExecution decision for this cancellation request. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The details of the cancellation.
        @[JSON::Field(key: "details")]
        getter details : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @details : String? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionCompleted event.
      struct WorkflowExecutionCompletedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # CompleteWorkflowExecution decision to complete this execution. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The result produced by the workflow execution upon successful completion.
        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @result : String? = nil
        )
        end
      end

      # The configuration settings for a workflow execution including timeout values, tasklist etc. These
      # configuration settings are determined from the defaults specified when registering the workflow type
      # and those specified when starting the workflow execution.
      struct WorkflowExecutionConfiguration
        include JSON::Serializable

        # The policy to use for the child workflow executions if this workflow execution is terminated, by
        # calling the TerminateWorkflowExecution action explicitly or due to an expired timeout. The supported
        # child policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to
        # cancel is attempted for each child execution by recording a WorkflowExecutionCancelRequested event
        # in its history. It is up to the decider to take appropriate actions when it receives an execution
        # history with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String

        # The total duration for this workflow execution. The duration is specified in seconds, an integer
        # greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String

        # The task list used for the decision tasks generated for this workflow execution.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # The maximum duration allowed for decision tasks for this workflow execution. The duration is
        # specified in seconds, an integer greater than or equal to 0 . You can use NONE to specify unlimited
        # duration.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String

        # The IAM role attached to the child workflow execution.
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The priority assigned to decision tasks for this workflow execution. Valid values are integers that
        # range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE (2147483647). Higher numbers
        # indicate higher priority. For more information about setting task priority, see Setting Task
        # Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        def initialize(
          @child_policy : String,
          @execution_start_to_close_timeout : String,
          @task_list : Types::TaskList,
          @task_start_to_close_timeout : String,
          @lambda_role : String? = nil,
          @task_priority : String? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionContinuedAsNew event.
      struct WorkflowExecutionContinuedAsNewEventAttributes
        include JSON::Serializable

        # The policy to use for the child workflow executions of the new execution if it is terminated by
        # calling the TerminateWorkflowExecution action explicitly or due to an expired timeout. The supported
        # child policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to
        # cancel is attempted for each child execution by recording a WorkflowExecutionCancelRequested event
        # in its history. It is up to the decider to take appropriate actions when it receives an execution
        # history with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # ContinueAsNewWorkflowExecution decision that started this execution. This information can be useful
        # for diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The runId of the new workflow execution.
        @[JSON::Field(key: "newExecutionRunId")]
        getter new_execution_run_id : String

        # The task list to use for the decisions of the new (continued) workflow execution.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # The workflow type of this execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # The total duration allowed for the new workflow execution. The duration is specified in seconds, an
        # integer greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String?

        # The input provided to the new workflow execution.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The IAM role to attach to the new (continued) workflow execution.
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The list of tags associated with the new workflow execution.
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        # The priority of the task to use for the decisions of the new (continued) workflow execution.
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        # The maximum duration of decision tasks for the new workflow execution. The duration is specified in
        # seconds, an integer greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String?

        def initialize(
          @child_policy : String,
          @decision_task_completed_event_id : Int64,
          @new_execution_run_id : String,
          @task_list : Types::TaskList,
          @workflow_type : Types::WorkflowType,
          @execution_start_to_close_timeout : String? = nil,
          @input : String? = nil,
          @lambda_role : String? = nil,
          @tag_list : Array(String)? = nil,
          @task_priority : String? = nil,
          @task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Contains the count of workflow executions returned from CountOpenWorkflowExecutions or
      # CountClosedWorkflowExecutions
      struct WorkflowExecutionCount
        include JSON::Serializable

        # The number of workflow executions.
        @[JSON::Field(key: "count")]
        getter count : Int32

        # If set to true, indicates that the actual count was more than the maximum supported by this API and
        # the count returned is the truncated value.
        @[JSON::Field(key: "truncated")]
        getter truncated : Bool?

        def initialize(
          @count : Int32,
          @truncated : Bool? = nil
        )
        end
      end

      # Contains details about a workflow execution.
      struct WorkflowExecutionDetail
        include JSON::Serializable

        # The configuration settings for this workflow execution including timeout values, tasklist etc.
        @[JSON::Field(key: "executionConfiguration")]
        getter execution_configuration : Types::WorkflowExecutionConfiguration

        # Information about the workflow execution.
        @[JSON::Field(key: "executionInfo")]
        getter execution_info : Types::WorkflowExecutionInfo

        # The number of tasks for this workflow execution. This includes open and closed tasks of all types.
        @[JSON::Field(key: "openCounts")]
        getter open_counts : Types::WorkflowExecutionOpenCounts

        # The time when the last activity task was scheduled for this workflow execution. You can use this
        # information to determine if the workflow has not made progress for an unusually long period of time
        # and might require a corrective action.
        @[JSON::Field(key: "latestActivityTaskTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter latest_activity_task_timestamp : Time?

        # The latest executionContext provided by the decider for this workflow execution. A decider can
        # provide an executionContext (a free-form string) when closing a decision task using
        # RespondDecisionTaskCompleted .
        @[JSON::Field(key: "latestExecutionContext")]
        getter latest_execution_context : String?

        def initialize(
          @execution_configuration : Types::WorkflowExecutionConfiguration,
          @execution_info : Types::WorkflowExecutionInfo,
          @open_counts : Types::WorkflowExecutionOpenCounts,
          @latest_activity_task_timestamp : Time? = nil,
          @latest_execution_context : String? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionFailed event.
      struct WorkflowExecutionFailedEventAttributes
        include JSON::Serializable

        # The ID of the DecisionTaskCompleted event corresponding to the decision task that resulted in the
        # FailWorkflowExecution decision to fail this execution. This information can be useful for diagnosing
        # problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "decisionTaskCompletedEventId")]
        getter decision_task_completed_event_id : Int64

        # The details of the failure.
        @[JSON::Field(key: "details")]
        getter details : String?

        # The descriptive reason provided for the failure.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @decision_task_completed_event_id : Int64,
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Used to filter the workflow executions in visibility APIs by their workflowId .
      struct WorkflowExecutionFilter
        include JSON::Serializable

        # The workflowId to pass of match the criteria of this filter.
        @[JSON::Field(key: "workflowId")]
        getter workflow_id : String

        def initialize(
          @workflow_id : String
        )
        end
      end

      # Contains information about a workflow execution.
      struct WorkflowExecutionInfo
        include JSON::Serializable

        # The workflow execution this information is about.
        @[JSON::Field(key: "execution")]
        getter execution : Types::WorkflowExecution

        # The current status of the execution.
        @[JSON::Field(key: "executionStatus")]
        getter execution_status : String

        # The time when the execution was started.
        @[JSON::Field(key: "startTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_timestamp : Time

        # The type of the workflow execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # Set to true if a cancellation is requested for this workflow execution.
        @[JSON::Field(key: "cancelRequested")]
        getter cancel_requested : Bool?

        # If the execution status is closed then this specifies how the execution was closed: COMPLETED – the
        # execution was successfully completed. CANCELED – the execution was canceled.Cancellation allows the
        # implementation to gracefully clean up before the execution is closed. TERMINATED – the execution was
        # force terminated. FAILED – the execution failed to complete. TIMED_OUT – the execution did not
        # complete in the alloted time and was automatically timed out. CONTINUED_AS_NEW – the execution is
        # logically continued. This means the current execution was completed and a new execution was started
        # to carry on the workflow.
        @[JSON::Field(key: "closeStatus")]
        getter close_status : String?

        # The time when the workflow execution was closed. Set only if the execution status is CLOSED.
        @[JSON::Field(key: "closeTimestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter close_timestamp : Time?

        # If this workflow execution is a child of another execution then contains the workflow execution that
        # started this execution.
        @[JSON::Field(key: "parent")]
        getter parent : Types::WorkflowExecution?

        # The list of tags associated with the workflow execution. Tags can be used to identify and list
        # workflow executions of interest through the visibility APIs. A workflow execution can have a maximum
        # of 5 tags.
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        def initialize(
          @execution : Types::WorkflowExecution,
          @execution_status : String,
          @start_timestamp : Time,
          @workflow_type : Types::WorkflowType,
          @cancel_requested : Bool? = nil,
          @close_status : String? = nil,
          @close_timestamp : Time? = nil,
          @parent : Types::WorkflowExecution? = nil,
          @tag_list : Array(String)? = nil
        )
        end
      end

      # Contains a paginated list of information about workflow executions.
      struct WorkflowExecutionInfos
        include JSON::Serializable

        # The list of workflow information structures.
        @[JSON::Field(key: "executionInfos")]
        getter execution_infos : Array(Types::WorkflowExecutionInfo)

        # If a NextPageToken was returned by a previous call, there are more results available. To retrieve
        # the next page of results, make the call again using the returned token in nextPageToken . Keep all
        # other arguments unchanged. The configured maximumPageSize determines how many results can be
        # returned in a single call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @execution_infos : Array(Types::WorkflowExecutionInfo),
          @next_page_token : String? = nil
        )
        end
      end

      # Contains the counts of open tasks, child workflow executions and timers for a workflow execution.
      struct WorkflowExecutionOpenCounts
        include JSON::Serializable

        # The count of activity tasks whose status is OPEN .
        @[JSON::Field(key: "openActivityTasks")]
        getter open_activity_tasks : Int32

        # The count of child workflow executions whose status is OPEN .
        @[JSON::Field(key: "openChildWorkflowExecutions")]
        getter open_child_workflow_executions : Int32

        # The count of decision tasks whose status is OPEN. A workflow execution can have at most one open
        # decision task.
        @[JSON::Field(key: "openDecisionTasks")]
        getter open_decision_tasks : Int32

        # The count of timers started by this workflow execution that have not fired yet.
        @[JSON::Field(key: "openTimers")]
        getter open_timers : Int32

        # The count of Lambda tasks whose status is OPEN .
        @[JSON::Field(key: "openLambdaFunctions")]
        getter open_lambda_functions : Int32?

        def initialize(
          @open_activity_tasks : Int32,
          @open_child_workflow_executions : Int32,
          @open_decision_tasks : Int32,
          @open_timers : Int32,
          @open_lambda_functions : Int32? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionSignaled event.
      struct WorkflowExecutionSignaledEventAttributes
        include JSON::Serializable

        # The name of the signal received. The decider can use the signal name and inputs to determine how to
        # the process the signal.
        @[JSON::Field(key: "signalName")]
        getter signal_name : String

        # The ID of the SignalExternalWorkflowExecutionInitiated event corresponding to the
        # SignalExternalWorkflow decision to signal this workflow execution.The source event with this ID can
        # be found in the history of the source workflow execution. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event. This field is set
        # only if the signal was initiated by another workflow execution.
        @[JSON::Field(key: "externalInitiatedEventId")]
        getter external_initiated_event_id : Int64?

        # The workflow execution that sent the signal. This is set only of the signal was sent by another
        # workflow execution.
        @[JSON::Field(key: "externalWorkflowExecution")]
        getter external_workflow_execution : Types::WorkflowExecution?

        # The inputs provided with the signal. The decider can use the signal name and inputs to determine how
        # to process the signal.
        @[JSON::Field(key: "input")]
        getter input : String?

        def initialize(
          @signal_name : String,
          @external_initiated_event_id : Int64? = nil,
          @external_workflow_execution : Types::WorkflowExecution? = nil,
          @input : String? = nil
        )
        end
      end

      # Provides details of WorkflowExecutionStarted event.
      struct WorkflowExecutionStartedEventAttributes
        include JSON::Serializable

        # The policy to use for the child workflow executions if this workflow execution is terminated, by
        # calling the TerminateWorkflowExecution action explicitly or due to an expired timeout. The supported
        # child policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to
        # cancel is attempted for each child execution by recording a WorkflowExecutionCancelRequested event
        # in its history. It is up to the decider to take appropriate actions when it receives an execution
        # history with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String

        # The name of the task list for scheduling the decision tasks for this workflow execution.
        @[JSON::Field(key: "taskList")]
        getter task_list : Types::TaskList

        # The workflow type of this execution.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # If this workflow execution was started due to a ContinueAsNewWorkflowExecution decision, then it
        # contains the runId of the previous workflow execution that was closed and continued as this
        # execution.
        @[JSON::Field(key: "continuedExecutionRunId")]
        getter continued_execution_run_id : String?

        # The maximum duration for this workflow execution. The duration is specified in seconds, an integer
        # greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "executionStartToCloseTimeout")]
        getter execution_start_to_close_timeout : String?

        # The input provided to the workflow execution.
        @[JSON::Field(key: "input")]
        getter input : String?

        # The IAM role attached to the workflow execution.
        @[JSON::Field(key: "lambdaRole")]
        getter lambda_role : String?

        # The ID of the StartChildWorkflowExecutionInitiated event corresponding to the
        # StartChildWorkflowExecution Decision to start this workflow execution. The source event with this ID
        # can be found in the history of the source workflow execution. This information can be useful for
        # diagnosing problems by tracing back the chain of events leading up to this event.
        @[JSON::Field(key: "parentInitiatedEventId")]
        getter parent_initiated_event_id : Int64?

        # The source workflow execution that started this workflow execution. The member isn't set if the
        # workflow execution was not started by a workflow.
        @[JSON::Field(key: "parentWorkflowExecution")]
        getter parent_workflow_execution : Types::WorkflowExecution?

        # The list of tags associated with this workflow execution. An execution can have up to 5 tags.
        @[JSON::Field(key: "tagList")]
        getter tag_list : Array(String)?

        # The priority of the decision tasks in the workflow execution.
        @[JSON::Field(key: "taskPriority")]
        getter task_priority : String?

        # The maximum duration of decision tasks for this workflow type. The duration is specified in seconds,
        # an integer greater than or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "taskStartToCloseTimeout")]
        getter task_start_to_close_timeout : String?

        def initialize(
          @child_policy : String,
          @task_list : Types::TaskList,
          @workflow_type : Types::WorkflowType,
          @continued_execution_run_id : String? = nil,
          @execution_start_to_close_timeout : String? = nil,
          @input : String? = nil,
          @lambda_role : String? = nil,
          @parent_initiated_event_id : Int64? = nil,
          @parent_workflow_execution : Types::WorkflowExecution? = nil,
          @tag_list : Array(String)? = nil,
          @task_priority : String? = nil,
          @task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionTerminated event.
      struct WorkflowExecutionTerminatedEventAttributes
        include JSON::Serializable

        # The policy used for the child workflow executions of this workflow execution. The supported child
        # policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to cancel
        # is attempted for each child execution by recording a WorkflowExecutionCancelRequested event in its
        # history. It is up to the decider to take appropriate actions when it receives an execution history
        # with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String

        # If set, indicates that the workflow execution was automatically terminated, and specifies the cause.
        # This happens if the parent workflow execution times out or is terminated and the child policy is set
        # to terminate child executions.
        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The details provided for the termination.
        @[JSON::Field(key: "details")]
        getter details : String?

        # The reason provided for the termination.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @child_policy : String,
          @cause : String? = nil,
          @details : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # Provides the details of the WorkflowExecutionTimedOut event.
      struct WorkflowExecutionTimedOutEventAttributes
        include JSON::Serializable

        # The policy used for the child workflow executions of this workflow execution. The supported child
        # policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to cancel
        # is attempted for each child execution by recording a WorkflowExecutionCancelRequested event in its
        # history. It is up to the decider to take appropriate actions when it receives an execution history
        # with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "childPolicy")]
        getter child_policy : String

        # The type of timeout that caused this event.
        @[JSON::Field(key: "timeoutType")]
        getter timeout_type : String

        def initialize(
          @child_policy : String,
          @timeout_type : String
        )
        end
      end

      # Represents a workflow type.
      struct WorkflowType
        include JSON::Serializable

        # The name of the workflow type. The combination of workflow type name and version must be unique with
        # in a domain.
        @[JSON::Field(key: "name")]
        getter name : String

        # The version of the workflow type. The combination of workflow type name and version must be unique
        # with in a domain.
        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @name : String,
          @version : String
        )
        end
      end

      # The configuration settings of a workflow type.
      struct WorkflowTypeConfiguration
        include JSON::Serializable

        # The default policy to use for the child workflow executions when a workflow execution of this type
        # is terminated, by calling the TerminateWorkflowExecution action explicitly or due to an expired
        # timeout. This default can be overridden when starting a workflow execution using the
        # StartWorkflowExecution action or the StartChildWorkflowExecution Decision . The supported child
        # policies are: TERMINATE – The child executions are terminated. REQUEST_CANCEL – A request to cancel
        # is attempted for each child execution by recording a WorkflowExecutionCancelRequested event in its
        # history. It is up to the decider to take appropriate actions when it receives an execution history
        # with this event. ABANDON – No action is taken. The child executions continue to run.
        @[JSON::Field(key: "defaultChildPolicy")]
        getter default_child_policy : String?

        # The default maximum duration, specified when registering the workflow type, for executions of this
        # workflow type. This default can be overridden when starting a workflow execution using the
        # StartWorkflowExecution action or the StartChildWorkflowExecution Decision . The duration is
        # specified in seconds, an integer greater than or equal to 0 . You can use NONE to specify unlimited
        # duration.
        @[JSON::Field(key: "defaultExecutionStartToCloseTimeout")]
        getter default_execution_start_to_close_timeout : String?

        # The default IAM role attached to this workflow type. Executions of this workflow type need IAM roles
        # to invoke Lambda functions. If you don't specify an IAM role when starting this workflow type, the
        # default Lambda role is attached to the execution. For more information, see
        # https://docs.aws.amazon.com/amazonswf/latest/developerguide/lambda-task.html in the Amazon SWF
        # Developer Guide .
        @[JSON::Field(key: "defaultLambdaRole")]
        getter default_lambda_role : String?

        # The default task list, specified when registering the workflow type, for decisions tasks scheduled
        # for workflow executions of this type. This default can be overridden when starting a workflow
        # execution using the StartWorkflowExecution action or the StartChildWorkflowExecution Decision .
        @[JSON::Field(key: "defaultTaskList")]
        getter default_task_list : Types::TaskList?

        # The default task priority, specified when registering the workflow type, for all decision tasks of
        # this workflow type. This default can be overridden when starting a workflow execution using the
        # StartWorkflowExecution action or the StartChildWorkflowExecution decision. Valid values are integers
        # that range from Java's Integer.MIN_VALUE (-2147483648) to Integer.MAX_VALUE (2147483647). Higher
        # numbers indicate higher priority. For more information about setting task priority, see Setting Task
        # Priority in the Amazon SWF Developer Guide .
        @[JSON::Field(key: "defaultTaskPriority")]
        getter default_task_priority : String?

        # The default maximum duration, specified when registering the workflow type, that a decision task for
        # executions of this workflow type might take before returning completion or failure. If the task
        # doesn'tdo close in the specified time then the task is automatically timed out and rescheduled. If
        # the decider eventually reports a completion or failure, it is ignored. This default can be
        # overridden when starting a workflow execution using the StartWorkflowExecution action or the
        # StartChildWorkflowExecution Decision . The duration is specified in seconds, an integer greater than
        # or equal to 0 . You can use NONE to specify unlimited duration.
        @[JSON::Field(key: "defaultTaskStartToCloseTimeout")]
        getter default_task_start_to_close_timeout : String?

        def initialize(
          @default_child_policy : String? = nil,
          @default_execution_start_to_close_timeout : String? = nil,
          @default_lambda_role : String? = nil,
          @default_task_list : Types::TaskList? = nil,
          @default_task_priority : String? = nil,
          @default_task_start_to_close_timeout : String? = nil
        )
        end
      end

      # Contains details about a workflow type.
      struct WorkflowTypeDetail
        include JSON::Serializable

        # Configuration settings of the workflow type registered through RegisterWorkflowType
        @[JSON::Field(key: "configuration")]
        getter configuration : Types::WorkflowTypeConfiguration

        # General information about the workflow type. The status of the workflow type (returned in the
        # WorkflowTypeInfo structure) can be one of the following. REGISTERED – The type is registered and
        # available. Workers supporting this type should be running. DEPRECATED – The type was deprecated
        # using DeprecateWorkflowType , but is still in use. You should keep workers supporting this type
        # running. You cannot create new workflow executions of this type.
        @[JSON::Field(key: "typeInfo")]
        getter type_info : Types::WorkflowTypeInfo

        def initialize(
          @configuration : Types::WorkflowTypeConfiguration,
          @type_info : Types::WorkflowTypeInfo
        )
        end
      end

      # Used to filter workflow execution query results by type. Each parameter, if specified, defines a
      # rule that must be satisfied by each returned result.
      struct WorkflowTypeFilter
        include JSON::Serializable

        # Name of the workflow type.
        @[JSON::Field(key: "name")]
        getter name : String

        # Version of the workflow type.
        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @name : String,
          @version : String? = nil
        )
        end
      end

      # Contains information about a workflow type.
      struct WorkflowTypeInfo
        include JSON::Serializable

        # The date when this type was registered.
        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The current status of the workflow type.
        @[JSON::Field(key: "status")]
        getter status : String

        # The workflow type this information is about.
        @[JSON::Field(key: "workflowType")]
        getter workflow_type : Types::WorkflowType

        # If the type is in deprecated state, then it is set to the date when the type was deprecated.
        @[JSON::Field(key: "deprecationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter deprecation_date : Time?

        # The description of the type registered through RegisterWorkflowType .
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @creation_date : Time,
          @status : String,
          @workflow_type : Types::WorkflowType,
          @deprecation_date : Time? = nil,
          @description : String? = nil
        )
        end
      end

      # Contains a paginated list of information structures about workflow types.
      struct WorkflowTypeInfos
        include JSON::Serializable

        # The list of workflow type information.
        @[JSON::Field(key: "typeInfos")]
        getter type_infos : Array(Types::WorkflowTypeInfo)

        # If a NextPageToken was returned by a previous call, there are more results available. To retrieve
        # the next page of results, make the call again using the returned token in nextPageToken . Keep all
        # other arguments unchanged. The configured maximumPageSize determines how many results can be
        # returned in a single call.
        @[JSON::Field(key: "nextPageToken")]
        getter next_page_token : String?

        def initialize(
          @type_infos : Array(Types::WorkflowTypeInfo),
          @next_page_token : String? = nil
        )
        end
      end
    end
  end
end
