require "json"
require "time"

module AwsSdk
  module SFN
    module Types

      # Activity already exists. EncryptionConfiguration may not be updated.

      struct ActivityAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified activity does not exist.

      struct ActivityDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an activity that failed during an execution.

      struct ActivityFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # The maximum number of activities has been reached. Existing activities must be deleted before a new
      # activity can be created.

      struct ActivityLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an activity.

      struct ActivityListItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the activity.

        @[JSON::Field(key: "activityArn")]
        getter activity_arn : String

        # The date the activity is created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The name of the activity. A name must not contain: white space brackets &lt; &gt; { } [ ] wildcard
        # characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters ( U+0000-001F ,
        # U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF ) To enable
        # logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @activity_arn : String,
          @creation_date : Time,
          @name : String
        )
        end
      end

      # Contains details about an activity schedule failure that occurred during an execution.

      struct ActivityScheduleFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about an activity scheduled during an execution.

      struct ActivityScheduledEventDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scheduled activity.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The maximum allowed duration between two heartbeats for the activity task.

        @[JSON::Field(key: "heartbeatInSeconds")]
        getter heartbeat_in_seconds : Int64?

        # The JSON data input to the activity task. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Contains details about the input for an execution history event.

        @[JSON::Field(key: "inputDetails")]
        getter input_details : Types::HistoryEventExecutionDataDetails?

        # The maximum allowed duration of the activity task.

        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int64?

        def initialize(
          @resource : String,
          @heartbeat_in_seconds : Int64? = nil,
          @input : String? = nil,
          @input_details : Types::HistoryEventExecutionDataDetails? = nil,
          @timeout_in_seconds : Int64? = nil
        )
        end
      end

      # Contains details about the start of an activity during an execution.

      struct ActivityStartedEventDetails
        include JSON::Serializable

        # The name of the worker that the task is assigned to. These names are provided by the workers when
        # calling GetActivityTask .

        @[JSON::Field(key: "workerName")]
        getter worker_name : String?

        def initialize(
          @worker_name : String? = nil
        )
        end
      end

      # Contains details about an activity that successfully terminated during an execution.

      struct ActivitySucceededEventDetails
        include JSON::Serializable

        # The JSON data output by the activity task. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # Contains details about the output of an execution history event.

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @output : String? = nil,
          @output_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # Contains details about an activity timeout that occurred during an execution.

      struct ActivityTimedOutEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the timeout.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # The maximum number of workers concurrently polling for activity tasks has been reached.

      struct ActivityWorkerLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Provides details about assigned variables in an execution history event.

      struct AssignedVariablesDetails
        include JSON::Serializable

        # Indicates whether assigned variables were truncated in the response. Always false for API calls. In
        # CloudWatch logs, the value will be true if the data is truncated due to size limits.

        @[JSON::Field(key: "truncated")]
        getter truncated : Bool?

        def initialize(
          @truncated : Bool? = nil
        )
        end
      end

      # An object that describes workflow billing details.

      struct BillingDetails
        include JSON::Serializable

        # Billed duration of your workflow, in milliseconds.

        @[JSON::Field(key: "billedDurationInMilliseconds")]
        getter billed_duration_in_milliseconds : Int64?

        # Billed memory consumption of your workflow, in MB.

        @[JSON::Field(key: "billedMemoryUsedInMB")]
        getter billed_memory_used_in_mb : Int64?

        def initialize(
          @billed_duration_in_milliseconds : Int64? = nil,
          @billed_memory_used_in_mb : Int64? = nil
        )
        end
      end

      # Provides details about execution input or output.

      struct CloudWatchEventsExecutionDataDetails
        include JSON::Serializable

        # Indicates whether input or output was included in the response. Always true for API calls.

        @[JSON::Field(key: "included")]
        getter included : Bool?

        def initialize(
          @included : Bool? = nil
        )
        end
      end


      struct CloudWatchLogsLogGroup
        include JSON::Serializable

        # The ARN of the the CloudWatch log group to which you want your logs emitted to. The ARN must end
        # with :*

        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @log_group_arn : String? = nil
        )
        end
      end

      # Updating or deleting a resource can cause an inconsistent state. This error occurs when there're
      # concurrent requests for DeleteStateMachineVersion , PublishStateMachineVersion , or
      # UpdateStateMachine with the publish parameter set to true . HTTP Status Code: 409

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateActivityInput
        include JSON::Serializable

        # The name of the activity to create. This name must be unique for your Amazon Web Services account
        # and region for 90 days. For more information, see Limits Related to State Machine Executions in the
        # Step Functions Developer Guide . A name must not contain: white space brackets &lt; &gt; { } [ ]
        # wildcard characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters (
        # U+0000-001F , U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF )
        # To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # Settings to configure server-side encryption.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # The list of tags to add to a resource. An array of key-value pairs. For more information, see Using
        # Cost Allocation Tags in the Amazon Web Services Billing and Cost Management User Guide , and
        # Controlling Access Using IAM Tags . Tags may only contain Unicode letters, digits, white space, or
        # these symbols: _ . : / = + - @ .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateActivityOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the created activity.

        @[JSON::Field(key: "activityArn")]
        getter activity_arn : String

        # The date the activity is created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        def initialize(
          @activity_arn : String,
          @creation_date : Time
        )
        end
      end


      struct CreateStateMachineAliasInput
        include JSON::Serializable

        # The name of the state machine alias. To avoid conflict with version ARNs, don't use an integer in
        # the name of the alias.

        @[JSON::Field(key: "name")]
        getter name : String

        # The routing configuration of a state machine alias. The routing configuration shifts execution
        # traffic between two state machine versions. routingConfiguration contains an array of RoutingConfig
        # objects that specify up to two state machine versions. Step Functions then randomly choses which
        # version to run an execution with based on the weight assigned to each RoutingConfig .

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::RoutingConfigurationListItem)

        # A description for the state machine alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @routing_configuration : Array(Types::RoutingConfigurationListItem),
          @description : String? = nil
        )
        end
      end


      struct CreateStateMachineAliasOutput
        include JSON::Serializable

        # The date the state machine alias was created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The Amazon Resource Name (ARN) that identifies the created state machine alias.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String

        def initialize(
          @creation_date : Time,
          @state_machine_alias_arn : String
        )
        end
      end


      struct CreateStateMachineInput
        include JSON::Serializable

        # The Amazon States Language definition of the state machine. See Amazon States Language .

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The name of the state machine. A name must not contain: white space brackets &lt; &gt; { } [ ]
        # wildcard characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters (
        # U+0000-001F , U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF )
        # To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role to use for this state machine.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Settings to configure server-side encryption.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Defines what execution history events are logged and where they are logged. By default, the level is
        # set to OFF . For more information see Log Levels in the Step Functions User Guide.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # Set to true to publish the first version of the state machine during creation. The default is false
        # .

        @[JSON::Field(key: "publish")]
        getter publish : Bool?

        # Tags to be added when creating a state machine. An array of key-value pairs. For more information,
        # see Using Cost Allocation Tags in the Amazon Web Services Billing and Cost Management User Guide ,
        # and Controlling Access Using IAM Tags . Tags may only contain Unicode letters, digits, white space,
        # or these symbols: _ . : / = + - @ .

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        # Selects whether X-Ray tracing is enabled.

        @[JSON::Field(key: "tracingConfiguration")]
        getter tracing_configuration : Types::TracingConfiguration?

        # Determines whether a Standard or Express state machine is created. The default is STANDARD . You
        # cannot update the type of a state machine once it has been created.

        @[JSON::Field(key: "type")]
        getter type : String?

        # Sets description about the state machine version. You can only set the description if the publish
        # parameter is set to true . Otherwise, if you set versionDescription , but publish to false , this
        # API action throws ValidationException .

        @[JSON::Field(key: "versionDescription")]
        getter version_description : String?

        def initialize(
          @definition : String,
          @name : String,
          @role_arn : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @publish : Bool? = nil,
          @tags : Array(Types::Tag)? = nil,
          @tracing_configuration : Types::TracingConfiguration? = nil,
          @type : String? = nil,
          @version_description : String? = nil
        )
        end
      end


      struct CreateStateMachineOutput
        include JSON::Serializable

        # The date the state machine is created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The Amazon Resource Name (ARN) that identifies the created state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The Amazon Resource Name (ARN) that identifies the created state machine version. If you do not set
        # the publish parameter to true , this field returns null value.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String?

        def initialize(
          @creation_date : Time,
          @state_machine_arn : String,
          @state_machine_version_arn : String? = nil
        )
        end
      end


      struct DeleteActivityInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the activity to delete.

        @[JSON::Field(key: "activityArn")]
        getter activity_arn : String

        def initialize(
          @activity_arn : String
        )
        end
      end


      struct DeleteActivityOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteStateMachineAliasInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine alias to delete.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String

        def initialize(
          @state_machine_alias_arn : String
        )
        end
      end


      struct DeleteStateMachineAliasOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteStateMachineInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine to delete.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        def initialize(
          @state_machine_arn : String
        )
        end
      end


      struct DeleteStateMachineOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteStateMachineVersionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine version to delete.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String

        def initialize(
          @state_machine_version_arn : String
        )
        end
      end


      struct DeleteStateMachineVersionOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct DescribeActivityInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the activity to describe.

        @[JSON::Field(key: "activityArn")]
        getter activity_arn : String

        def initialize(
          @activity_arn : String
        )
        end
      end


      struct DescribeActivityOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the activity.

        @[JSON::Field(key: "activityArn")]
        getter activity_arn : String

        # The date the activity is created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The name of the activity. A name must not contain: white space brackets &lt; &gt; { } [ ] wildcard
        # characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters ( U+0000-001F ,
        # U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF ) To enable
        # logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # Settings for configured server-side encryption.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        def initialize(
          @activity_arn : String,
          @creation_date : Time,
          @name : String,
          @encryption_configuration : Types::EncryptionConfiguration? = nil
        )
        end
      end


      struct DescribeExecutionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the execution to describe.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # If your state machine definition is encrypted with a KMS key, callers must have kms:Decrypt
        # permission to decrypt the definition. Alternatively, you can call DescribeStateMachine API with
        # includedData = METADATA_ONLY to get a successful response without the encrypted definition.

        @[JSON::Field(key: "includedData")]
        getter included_data : String?

        def initialize(
          @execution_arn : String,
          @included_data : String? = nil
        )
        end
      end


      struct DescribeExecutionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the execution.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The date the execution is started.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        # The Amazon Resource Name (ARN) of the executed stated machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The current status of the execution.

        @[JSON::Field(key: "status")]
        getter status : String

        # The cause string if the state machine execution failed.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error string if the state machine execution failed.

        @[JSON::Field(key: "error")]
        getter error : String?

        # The string that contains the JSON input data of the execution. Length constraints apply to the
        # payload size, and are expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?


        @[JSON::Field(key: "inputDetails")]
        getter input_details : Types::CloudWatchEventsExecutionDataDetails?

        # The Amazon Resource Name (ARN) that identifies a Map Run, which dispatched this execution.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String?

        # The name of the execution. A name must not contain: white space brackets &lt; &gt; { } [ ] wildcard
        # characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters ( U+0000-001F ,
        # U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF ) To enable
        # logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The JSON output data of the execution. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding. This field is set only if the execution succeeds. If the
        # execution fails, this field is null.

        @[JSON::Field(key: "output")]
        getter output : String?


        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::CloudWatchEventsExecutionDataDetails?

        # The number of times you've redriven an execution. If you have not yet redriven an execution, the
        # redriveCount is 0. This count is only updated if you successfully redrive an execution.

        @[JSON::Field(key: "redriveCount")]
        getter redrive_count : Int32?

        # The date the execution was last redriven. If you have not yet redriven an execution, the redriveDate
        # is null. The redriveDate is unavailable if you redrive a Map Run that starts child workflow
        # executions of type EXPRESS .

        @[JSON::Field(key: "redriveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter redrive_date : Time?

        # Indicates whether or not an execution can be redriven at a given point in time. For executions of
        # type STANDARD , redriveStatus is NOT_REDRIVABLE if calling the RedriveExecution API action would
        # return the ExecutionNotRedrivable error. For a Distributed Map that includes child workflows of type
        # STANDARD , redriveStatus indicates whether or not the Map Run can redrive child workflow executions.
        # For a Distributed Map that includes child workflows of type EXPRESS , redriveStatus indicates
        # whether or not the Map Run can redrive child workflow executions. You can redrive failed or timed
        # out EXPRESS workflows only if they're a part of a Map Run. When you redrive the Map Run, these
        # workflows are restarted using the StartExecution API action.

        @[JSON::Field(key: "redriveStatus")]
        getter redrive_status : String?

        # When redriveStatus is NOT_REDRIVABLE , redriveStatusReason specifies the reason why an execution
        # cannot be redriven. For executions of type STANDARD , or for a Distributed Map that includes child
        # workflows of type STANDARD , redriveStatusReason can include one of the following reasons: State
        # machine is in DELETING status . Execution is RUNNING and cannot be redriven . Execution is SUCCEEDED
        # and cannot be redriven . Execution was started before the launch of RedriveExecution . Execution
        # history event limit exceeded . Execution has exceeded the max execution time . Execution redrivable
        # period exceeded . For a Distributed Map that includes child workflows of type EXPRESS ,
        # redriveStatusReason is only returned if the child workflows are not redrivable. This happens when
        # the child workflow executions have completed successfully.

        @[JSON::Field(key: "redriveStatusReason")]
        getter redrive_status_reason : String?

        # The Amazon Resource Name (ARN) of the state machine alias associated with the execution. The alias
        # ARN is a combination of state machine ARN and the alias name separated by a colon (:). For example,
        # stateMachineARN:PROD . If you start an execution from a StartExecution request with a state machine
        # version ARN, this field will be null.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String?

        # The Amazon Resource Name (ARN) of the state machine version associated with the execution. The
        # version ARN is a combination of state machine ARN and the version number separated by a colon (:).
        # For example, stateMachineARN:1 . If you start an execution from a StartExecution request without
        # specifying a state machine version or alias ARN, Step Functions returns a null value.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String?

        # If the execution ended, the date the execution stopped.

        @[JSON::Field(key: "stopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time?

        # The X-Ray trace header that was passed to the execution. For X-Ray traces, all Amazon Web Services
        # services use the X-Amzn-Trace-Id header from the HTTP request. Using the header is the preferred
        # mechanism to identify a trace. StartExecution and StartSyncExecution API operations can also use
        # traceHeader from the body of the request payload. If both sources are provided, Step Functions will
        # use the header value (preferred) over the value in the request body.

        @[JSON::Field(key: "traceHeader")]
        getter trace_header : String?

        def initialize(
          @execution_arn : String,
          @start_date : Time,
          @state_machine_arn : String,
          @status : String,
          @cause : String? = nil,
          @error : String? = nil,
          @input : String? = nil,
          @input_details : Types::CloudWatchEventsExecutionDataDetails? = nil,
          @map_run_arn : String? = nil,
          @name : String? = nil,
          @output : String? = nil,
          @output_details : Types::CloudWatchEventsExecutionDataDetails? = nil,
          @redrive_count : Int32? = nil,
          @redrive_date : Time? = nil,
          @redrive_status : String? = nil,
          @redrive_status_reason : String? = nil,
          @state_machine_alias_arn : String? = nil,
          @state_machine_version_arn : String? = nil,
          @stop_date : Time? = nil,
          @trace_header : String? = nil
        )
        end
      end


      struct DescribeMapRunInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies a Map Run.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String

        def initialize(
          @map_run_arn : String
        )
        end
      end


      struct DescribeMapRunOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the execution in which the Map Run was started.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # A JSON object that contains information about the total number of child workflow executions for the
        # Map Run, and the count of child workflow executions for each status, such as failed and succeeded .

        @[JSON::Field(key: "executionCounts")]
        getter execution_counts : Types::MapRunExecutionCounts

        # A JSON object that contains information about the total number of items, and the item count for each
        # processing status, such as pending and failed .

        @[JSON::Field(key: "itemCounts")]
        getter item_counts : Types::MapRunItemCounts

        # The Amazon Resource Name (ARN) that identifies a Map Run.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String

        # The maximum number of child workflow executions configured to run in parallel for the Map Run at the
        # same time.

        @[JSON::Field(key: "maxConcurrency")]
        getter max_concurrency : Int32

        # The date when the Map Run was started.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        # The current status of the Map Run.

        @[JSON::Field(key: "status")]
        getter status : String

        # The maximum number of failed child workflow executions before the Map Run fails.

        @[JSON::Field(key: "toleratedFailureCount")]
        getter tolerated_failure_count : Int64

        # The maximum percentage of failed child workflow executions before the Map Run fails.

        @[JSON::Field(key: "toleratedFailurePercentage")]
        getter tolerated_failure_percentage : Float64

        # The number of times you've redriven a Map Run. If you have not yet redriven a Map Run, the
        # redriveCount is 0. This count is only updated if you successfully redrive a Map Run.

        @[JSON::Field(key: "redriveCount")]
        getter redrive_count : Int32?

        # The date a Map Run was last redriven. If you have not yet redriven a Map Run, the redriveDate is
        # null.

        @[JSON::Field(key: "redriveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter redrive_date : Time?

        # The date when the Map Run was stopped.

        @[JSON::Field(key: "stopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time?

        def initialize(
          @execution_arn : String,
          @execution_counts : Types::MapRunExecutionCounts,
          @item_counts : Types::MapRunItemCounts,
          @map_run_arn : String,
          @max_concurrency : Int32,
          @start_date : Time,
          @status : String,
          @tolerated_failure_count : Int64,
          @tolerated_failure_percentage : Float64,
          @redrive_count : Int32? = nil,
          @redrive_date : Time? = nil,
          @stop_date : Time? = nil
        )
        end
      end


      struct DescribeStateMachineAliasInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine alias.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String

        def initialize(
          @state_machine_alias_arn : String
        )
        end
      end


      struct DescribeStateMachineAliasOutput
        include JSON::Serializable

        # The date the state machine alias was created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time?

        # A description of the alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The name of the state machine alias.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The routing configuration of the alias.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::RoutingConfigurationListItem)?

        # The Amazon Resource Name (ARN) of the state machine alias.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String?

        # The date the state machine alias was last updated. For a newly created state machine, this is the
        # same as the creation date.

        @[JSON::Field(key: "updateDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date : Time?

        def initialize(
          @creation_date : Time? = nil,
          @description : String? = nil,
          @name : String? = nil,
          @routing_configuration : Array(Types::RoutingConfigurationListItem)? = nil,
          @state_machine_alias_arn : String? = nil,
          @update_date : Time? = nil
        )
        end
      end


      struct DescribeStateMachineForExecutionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the execution you want state machine information for.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # If your state machine definition is encrypted with a KMS key, callers must have kms:Decrypt
        # permission to decrypt the definition. Alternatively, you can call the API with includedData =
        # METADATA_ONLY to get a successful response without the encrypted definition.

        @[JSON::Field(key: "includedData")]
        getter included_data : String?

        def initialize(
          @execution_arn : String,
          @included_data : String? = nil
        )
        end
      end


      struct DescribeStateMachineForExecutionOutput
        include JSON::Serializable

        # The Amazon States Language definition of the state machine. See Amazon States Language .

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The name of the state machine associated with the execution.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role of the State Machine for the execution.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) of the state machine associated with the execution.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The date and time the state machine associated with an execution was updated. For a newly created
        # state machine, this is the creation date.

        @[JSON::Field(key: "updateDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date : Time

        # Settings to configure server-side encryption.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A user-defined or an auto-generated string that identifies a Map state. This field is returned only
        # if the executionArn is a child workflow execution that was started by a Distributed Map state.

        @[JSON::Field(key: "label")]
        getter label : String?


        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # The Amazon Resource Name (ARN) of the Map Run that started the child workflow execution. This field
        # is returned only if the executionArn is a child workflow execution that was started by a Distributed
        # Map state.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String?

        # The revision identifier for the state machine. The first revision ID when you create the state
        # machine is null. Use the state machine revisionId parameter to compare the revision of a state
        # machine with the configuration of the state machine used for executions without performing a diff of
        # the properties, such as definition and roleArn .

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # Selects whether X-Ray tracing is enabled.

        @[JSON::Field(key: "tracingConfiguration")]
        getter tracing_configuration : Types::TracingConfiguration?

        # A map of state name to a list of variables referenced by that state. States that do not use variable
        # references will not be shown in the response.

        @[JSON::Field(key: "variableReferences")]
        getter variable_references : Hash(String, Array(String))?

        def initialize(
          @definition : String,
          @name : String,
          @role_arn : String,
          @state_machine_arn : String,
          @update_date : Time,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @label : String? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @map_run_arn : String? = nil,
          @revision_id : String? = nil,
          @tracing_configuration : Types::TracingConfiguration? = nil,
          @variable_references : Hash(String, Array(String))? = nil
        )
        end
      end


      struct DescribeStateMachineInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine for which you want the information. If you
        # specify a state machine version ARN, this API returns details about that version. The version ARN is
        # a combination of state machine ARN and the version number separated by a colon (:). For example,
        # stateMachineARN:1 .

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # If your state machine definition is encrypted with a KMS key, callers must have kms:Decrypt
        # permission to decrypt the definition. Alternatively, you can call the API with includedData =
        # METADATA_ONLY to get a successful response without the encrypted definition. When calling a labelled
        # ARN for an encrypted state machine, the includedData = METADATA_ONLY parameter will not apply
        # because Step Functions needs to decrypt the entire state machine definition to get the Distributed
        # Map state’s definition. In this case, the API caller needs to have kms:Decrypt permission.

        @[JSON::Field(key: "includedData")]
        getter included_data : String?

        def initialize(
          @state_machine_arn : String,
          @included_data : String? = nil
        )
        end
      end


      struct DescribeStateMachineOutput
        include JSON::Serializable

        # The date the state machine is created. For a state machine version, creationDate is the date the
        # version was created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The Amazon States Language definition of the state machine. See Amazon States Language . If called
        # with includedData = METADATA_ONLY , the returned definition will be {} .

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The name of the state machine. A name must not contain: white space brackets &lt; &gt; { } [ ]
        # wildcard characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters (
        # U+0000-001F , U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF )
        # To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the IAM role used when creating this state machine. (The IAM role
        # maintains security by granting Step Functions access to Amazon Web Services resources.)

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon Resource Name (ARN) that identifies the state machine. If you specified a state machine
        # version ARN in your request, the API returns the version ARN. The version ARN is a combination of
        # state machine ARN and the version number separated by a colon (:). For example, stateMachineARN:1 .

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The type of the state machine ( STANDARD or EXPRESS ).

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the state machine version.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Settings to configure server-side encryption.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # A user-defined or an auto-generated string that identifies a Map state. This parameter is present
        # only if the stateMachineArn specified in input is a qualified state machine ARN.

        @[JSON::Field(key: "label")]
        getter label : String?


        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # The revision identifier for the state machine. Use the revisionId parameter to compare between
        # versions of a state machine configuration used for executions without performing a diff of the
        # properties, such as definition and roleArn .

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The current status of the state machine.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Selects whether X-Ray tracing is enabled.

        @[JSON::Field(key: "tracingConfiguration")]
        getter tracing_configuration : Types::TracingConfiguration?

        # A map of state name to a list of variables referenced by that state. States that do not use variable
        # references will not be shown in the response.

        @[JSON::Field(key: "variableReferences")]
        getter variable_references : Hash(String, Array(String))?

        def initialize(
          @creation_date : Time,
          @definition : String,
          @name : String,
          @role_arn : String,
          @state_machine_arn : String,
          @type : String,
          @description : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @label : String? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @revision_id : String? = nil,
          @status : String? = nil,
          @tracing_configuration : Types::TracingConfiguration? = nil,
          @variable_references : Hash(String, Array(String))? = nil
        )
        end
      end

      # Settings to configure server-side encryption. For additional control over security, you can encrypt
      # your data using a customer-managed key for Step Functions state machines and activities. You can
      # configure a symmetric KMS key and data key reuse period when creating or updating a State Machine ,
      # and when creating an Activity . The execution history and state machine definition will be encrypted
      # with the key applied to the State Machine. Activity inputs will be encrypted with the key applied to
      # the Activity. Step Functions automatically enables encryption at rest using Amazon Web Services
      # owned keys at no charge. However, KMS charges apply when using a customer managed key. For more
      # information about pricing, see Key Management Service pricing . For more information on KMS, see
      # What is Key Management Service?

      struct EncryptionConfiguration
        include JSON::Serializable

        # Encryption type

        @[JSON::Field(key: "type")]
        getter type : String

        # Maximum duration that Step Functions will reuse data keys. When the period expires, Step Functions
        # will call GenerateDataKey . Only applies to customer managed keys.

        @[JSON::Field(key: "kmsDataKeyReusePeriodSeconds")]
        getter kms_data_key_reuse_period_seconds : Int32?

        # An alias, alias ARN, key ID, or key ARN of a symmetric encryption KMS key to encrypt data. To
        # specify a KMS key in a different Amazon Web Services account, you must use the key ARN or alias ARN.

        @[JSON::Field(key: "kmsKeyId")]
        getter kms_key_id : String?

        def initialize(
          @type : String,
          @kms_data_key_reuse_period_seconds : Int32? = nil,
          @kms_key_id : String? = nil
        )
        end
      end

      # Contains details about an evaluation failure that occurred while processing a state, for example,
      # when a JSONata expression throws an error. This event will only be present in state machines that
      # have QueryLanguage set to JSONata, or individual states set to JSONata.

      struct EvaluationFailedEventDetails
        include JSON::Serializable

        # The name of the state in which the evaluation error occurred.

        @[JSON::Field(key: "state")]
        getter state : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        # The location of the field in the state in which the evaluation error occurred.

        @[JSON::Field(key: "location")]
        getter location : String?

        def initialize(
          @state : String,
          @cause : String? = nil,
          @error : String? = nil,
          @location : String? = nil
        )
        end
      end

      # Contains details about an abort of an execution.

      struct ExecutionAbortedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # The execution has the same name as another execution (but a different input ). Executions with the
      # same name and input are considered idempotent.

      struct ExecutionAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified execution does not exist.

      struct ExecutionDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an execution failure event.

      struct ExecutionFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # The maximum number of running executions has been reached. Running executions must end or be stopped
      # before a new execution can be started.

      struct ExecutionLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about an execution.

      struct ExecutionListItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the execution.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The name of the execution. A name must not contain: white space brackets &lt; &gt; { } [ ] wildcard
        # characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters ( U+0000-001F ,
        # U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF ) To enable
        # logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # The date the execution started.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        # The Amazon Resource Name (ARN) of the state machine that ran the execution.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The current status of the execution.

        @[JSON::Field(key: "status")]
        getter status : String

        # The total number of items processed in a child workflow execution. This field is returned only if
        # mapRunArn was specified in the ListExecutions API action. If stateMachineArn was specified in
        # ListExecutions , the itemCount field isn't returned.

        @[JSON::Field(key: "itemCount")]
        getter item_count : Int32?

        # The Amazon Resource Name (ARN) of a Map Run. This field is returned only if mapRunArn was specified
        # in the ListExecutions API action. If stateMachineArn was specified in ListExecutions , the mapRunArn
        # isn't returned.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String?

        # The number of times you've redriven an execution. If you have not yet redriven an execution, the
        # redriveCount is 0. This count is only updated when you successfully redrive an execution.

        @[JSON::Field(key: "redriveCount")]
        getter redrive_count : Int32?

        # The date the execution was last redriven.

        @[JSON::Field(key: "redriveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter redrive_date : Time?

        # The Amazon Resource Name (ARN) of the state machine alias used to start an execution. If the state
        # machine execution was started with an unqualified ARN or a version ARN, it returns null.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String?

        # The Amazon Resource Name (ARN) of the state machine version associated with the execution. If the
        # state machine execution was started with an unqualified ARN, it returns null. If the execution was
        # started using a stateMachineAliasArn , both the stateMachineAliasArn and stateMachineVersionArn
        # parameters contain the respective values.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String?

        # If the execution already ended, the date the execution stopped.

        @[JSON::Field(key: "stopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time?

        def initialize(
          @execution_arn : String,
          @name : String,
          @start_date : Time,
          @state_machine_arn : String,
          @status : String,
          @item_count : Int32? = nil,
          @map_run_arn : String? = nil,
          @redrive_count : Int32? = nil,
          @redrive_date : Time? = nil,
          @state_machine_alias_arn : String? = nil,
          @state_machine_version_arn : String? = nil,
          @stop_date : Time? = nil
        )
        end
      end

      # The execution Amazon Resource Name (ARN) that you specified for executionArn cannot be redriven.

      struct ExecutionNotRedrivable
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a redriven execution.

      struct ExecutionRedrivenEventDetails
        include JSON::Serializable

        # The number of times you've redriven an execution. If you have not yet redriven an execution, the
        # redriveCount is 0. This count is not updated for redrives that failed to start or are pending to be
        # redriven.

        @[JSON::Field(key: "redriveCount")]
        getter redrive_count : Int32?

        def initialize(
          @redrive_count : Int32? = nil
        )
        end
      end

      # Contains details about the start of the execution.

      struct ExecutionStartedEventDetails
        include JSON::Serializable

        # The JSON data input to the execution. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Contains details about the input for an execution history event.

        @[JSON::Field(key: "inputDetails")]
        getter input_details : Types::HistoryEventExecutionDataDetails?

        # The Amazon Resource Name (ARN) of the IAM role used for executing Lambda tasks.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The Amazon Resource Name (ARN) that identifies a state machine alias used for starting the state
        # machine execution.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String?

        # The Amazon Resource Name (ARN) that identifies a state machine version used for starting the state
        # machine execution.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String?

        def initialize(
          @input : String? = nil,
          @input_details : Types::HistoryEventExecutionDataDetails? = nil,
          @role_arn : String? = nil,
          @state_machine_alias_arn : String? = nil,
          @state_machine_version_arn : String? = nil
        )
        end
      end

      # Contains details about the successful termination of the execution.

      struct ExecutionSucceededEventDetails
        include JSON::Serializable

        # The JSON data output by the execution. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # Contains details about the output of an execution history event.

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @output : String? = nil,
          @output_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # Contains details about the execution timeout that occurred during the execution.

      struct ExecutionTimedOutEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the timeout.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end


      struct GetActivityTaskInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the activity to retrieve tasks from (assigned when you create the
        # task using CreateActivity .)

        @[JSON::Field(key: "activityArn")]
        getter activity_arn : String

        # You can provide an arbitrary name in order to identify the worker that the task is assigned to. This
        # name is used when it is logged in the execution history.

        @[JSON::Field(key: "workerName")]
        getter worker_name : String?

        def initialize(
          @activity_arn : String,
          @worker_name : String? = nil
        )
        end
      end


      struct GetActivityTaskOutput
        include JSON::Serializable

        # The string that contains the JSON input data for the task. Length constraints apply to the payload
        # size, and are expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # A token that identifies the scheduled task. This token must be copied and included in subsequent
        # calls to SendTaskHeartbeat , SendTaskSuccess or SendTaskFailure in order to report the progress or
        # completion of the task.

        @[JSON::Field(key: "taskToken")]
        getter task_token : String?

        def initialize(
          @input : String? = nil,
          @task_token : String? = nil
        )
        end
      end


      struct GetExecutionHistoryInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the execution.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # You can select whether execution data (input or output of a history event) is returned. The default
        # is true .

        @[JSON::Field(key: "includeExecutionData")]
        getter include_execution_data : Bool?

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Lists events in descending order of their timeStamp .

        @[JSON::Field(key: "reverseOrder")]
        getter reverse_order : Bool?

        def initialize(
          @execution_arn : String,
          @include_execution_data : Bool? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @reverse_order : Bool? = nil
        )
        end
      end


      struct GetExecutionHistoryOutput
        include JSON::Serializable

        # The list of events that occurred in the execution.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::HistoryEvent)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::HistoryEvent),
          @next_token : String? = nil
        )
        end
      end

      # Contains details about the events of an execution.

      struct HistoryEvent
        include JSON::Serializable

        # The id of the event. Events are numbered sequentially, starting at one.

        @[JSON::Field(key: "id")]
        getter id : Int64

        # The date and time the event occurred, expressed in seconds and fractional milliseconds since the
        # Unix epoch, which is defined as January 1, 1970, at 00:00:00 Coordinated Universal Time (UTC).

        @[JSON::Field(key: "timestamp", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter timestamp : Time

        # The type of the event.

        @[JSON::Field(key: "type")]
        getter type : String


        @[JSON::Field(key: "activityFailedEventDetails")]
        getter activity_failed_event_details : Types::ActivityFailedEventDetails?

        # Contains details about an activity schedule event that failed during an execution.

        @[JSON::Field(key: "activityScheduleFailedEventDetails")]
        getter activity_schedule_failed_event_details : Types::ActivityScheduleFailedEventDetails?


        @[JSON::Field(key: "activityScheduledEventDetails")]
        getter activity_scheduled_event_details : Types::ActivityScheduledEventDetails?


        @[JSON::Field(key: "activityStartedEventDetails")]
        getter activity_started_event_details : Types::ActivityStartedEventDetails?


        @[JSON::Field(key: "activitySucceededEventDetails")]
        getter activity_succeeded_event_details : Types::ActivitySucceededEventDetails?


        @[JSON::Field(key: "activityTimedOutEventDetails")]
        getter activity_timed_out_event_details : Types::ActivityTimedOutEventDetails?

        # Contains details about an evaluation failure that occurred while processing a state.

        @[JSON::Field(key: "evaluationFailedEventDetails")]
        getter evaluation_failed_event_details : Types::EvaluationFailedEventDetails?


        @[JSON::Field(key: "executionAbortedEventDetails")]
        getter execution_aborted_event_details : Types::ExecutionAbortedEventDetails?


        @[JSON::Field(key: "executionFailedEventDetails")]
        getter execution_failed_event_details : Types::ExecutionFailedEventDetails?

        # Contains details about the redrive attempt of an execution.

        @[JSON::Field(key: "executionRedrivenEventDetails")]
        getter execution_redriven_event_details : Types::ExecutionRedrivenEventDetails?


        @[JSON::Field(key: "executionStartedEventDetails")]
        getter execution_started_event_details : Types::ExecutionStartedEventDetails?


        @[JSON::Field(key: "executionSucceededEventDetails")]
        getter execution_succeeded_event_details : Types::ExecutionSucceededEventDetails?


        @[JSON::Field(key: "executionTimedOutEventDetails")]
        getter execution_timed_out_event_details : Types::ExecutionTimedOutEventDetails?


        @[JSON::Field(key: "lambdaFunctionFailedEventDetails")]
        getter lambda_function_failed_event_details : Types::LambdaFunctionFailedEventDetails?


        @[JSON::Field(key: "lambdaFunctionScheduleFailedEventDetails")]
        getter lambda_function_schedule_failed_event_details : Types::LambdaFunctionScheduleFailedEventDetails?


        @[JSON::Field(key: "lambdaFunctionScheduledEventDetails")]
        getter lambda_function_scheduled_event_details : Types::LambdaFunctionScheduledEventDetails?

        # Contains details about a lambda function that failed to start during an execution.

        @[JSON::Field(key: "lambdaFunctionStartFailedEventDetails")]
        getter lambda_function_start_failed_event_details : Types::LambdaFunctionStartFailedEventDetails?

        # Contains details about a Lambda function that terminated successfully during an execution.

        @[JSON::Field(key: "lambdaFunctionSucceededEventDetails")]
        getter lambda_function_succeeded_event_details : Types::LambdaFunctionSucceededEventDetails?


        @[JSON::Field(key: "lambdaFunctionTimedOutEventDetails")]
        getter lambda_function_timed_out_event_details : Types::LambdaFunctionTimedOutEventDetails?

        # Contains details about an iteration of a Map state that was aborted.

        @[JSON::Field(key: "mapIterationAbortedEventDetails")]
        getter map_iteration_aborted_event_details : Types::MapIterationEventDetails?

        # Contains details about an iteration of a Map state that failed.

        @[JSON::Field(key: "mapIterationFailedEventDetails")]
        getter map_iteration_failed_event_details : Types::MapIterationEventDetails?

        # Contains details about an iteration of a Map state that was started.

        @[JSON::Field(key: "mapIterationStartedEventDetails")]
        getter map_iteration_started_event_details : Types::MapIterationEventDetails?

        # Contains details about an iteration of a Map state that succeeded.

        @[JSON::Field(key: "mapIterationSucceededEventDetails")]
        getter map_iteration_succeeded_event_details : Types::MapIterationEventDetails?

        # Contains error and cause details about a Map Run that failed.

        @[JSON::Field(key: "mapRunFailedEventDetails")]
        getter map_run_failed_event_details : Types::MapRunFailedEventDetails?

        # Contains details about the redrive attempt of a Map Run.

        @[JSON::Field(key: "mapRunRedrivenEventDetails")]
        getter map_run_redriven_event_details : Types::MapRunRedrivenEventDetails?

        # Contains details, such as mapRunArn , and the start date and time of a Map Run. mapRunArn is the
        # Amazon Resource Name (ARN) of the Map Run that was started.

        @[JSON::Field(key: "mapRunStartedEventDetails")]
        getter map_run_started_event_details : Types::MapRunStartedEventDetails?

        # Contains details about Map state that was started.

        @[JSON::Field(key: "mapStateStartedEventDetails")]
        getter map_state_started_event_details : Types::MapStateStartedEventDetails?

        # The id of the previous event.

        @[JSON::Field(key: "previousEventId")]
        getter previous_event_id : Int64?


        @[JSON::Field(key: "stateEnteredEventDetails")]
        getter state_entered_event_details : Types::StateEnteredEventDetails?


        @[JSON::Field(key: "stateExitedEventDetails")]
        getter state_exited_event_details : Types::StateExitedEventDetails?

        # Contains details about the failure of a task.

        @[JSON::Field(key: "taskFailedEventDetails")]
        getter task_failed_event_details : Types::TaskFailedEventDetails?

        # Contains details about a task that was scheduled.

        @[JSON::Field(key: "taskScheduledEventDetails")]
        getter task_scheduled_event_details : Types::TaskScheduledEventDetails?

        # Contains details about a task that failed to start.

        @[JSON::Field(key: "taskStartFailedEventDetails")]
        getter task_start_failed_event_details : Types::TaskStartFailedEventDetails?

        # Contains details about a task that was started.

        @[JSON::Field(key: "taskStartedEventDetails")]
        getter task_started_event_details : Types::TaskStartedEventDetails?

        # Contains details about a task that where the submit failed.

        @[JSON::Field(key: "taskSubmitFailedEventDetails")]
        getter task_submit_failed_event_details : Types::TaskSubmitFailedEventDetails?

        # Contains details about a submitted task.

        @[JSON::Field(key: "taskSubmittedEventDetails")]
        getter task_submitted_event_details : Types::TaskSubmittedEventDetails?

        # Contains details about a task that succeeded.

        @[JSON::Field(key: "taskSucceededEventDetails")]
        getter task_succeeded_event_details : Types::TaskSucceededEventDetails?

        # Contains details about a task that timed out.

        @[JSON::Field(key: "taskTimedOutEventDetails")]
        getter task_timed_out_event_details : Types::TaskTimedOutEventDetails?

        def initialize(
          @id : Int64,
          @timestamp : Time,
          @type : String,
          @activity_failed_event_details : Types::ActivityFailedEventDetails? = nil,
          @activity_schedule_failed_event_details : Types::ActivityScheduleFailedEventDetails? = nil,
          @activity_scheduled_event_details : Types::ActivityScheduledEventDetails? = nil,
          @activity_started_event_details : Types::ActivityStartedEventDetails? = nil,
          @activity_succeeded_event_details : Types::ActivitySucceededEventDetails? = nil,
          @activity_timed_out_event_details : Types::ActivityTimedOutEventDetails? = nil,
          @evaluation_failed_event_details : Types::EvaluationFailedEventDetails? = nil,
          @execution_aborted_event_details : Types::ExecutionAbortedEventDetails? = nil,
          @execution_failed_event_details : Types::ExecutionFailedEventDetails? = nil,
          @execution_redriven_event_details : Types::ExecutionRedrivenEventDetails? = nil,
          @execution_started_event_details : Types::ExecutionStartedEventDetails? = nil,
          @execution_succeeded_event_details : Types::ExecutionSucceededEventDetails? = nil,
          @execution_timed_out_event_details : Types::ExecutionTimedOutEventDetails? = nil,
          @lambda_function_failed_event_details : Types::LambdaFunctionFailedEventDetails? = nil,
          @lambda_function_schedule_failed_event_details : Types::LambdaFunctionScheduleFailedEventDetails? = nil,
          @lambda_function_scheduled_event_details : Types::LambdaFunctionScheduledEventDetails? = nil,
          @lambda_function_start_failed_event_details : Types::LambdaFunctionStartFailedEventDetails? = nil,
          @lambda_function_succeeded_event_details : Types::LambdaFunctionSucceededEventDetails? = nil,
          @lambda_function_timed_out_event_details : Types::LambdaFunctionTimedOutEventDetails? = nil,
          @map_iteration_aborted_event_details : Types::MapIterationEventDetails? = nil,
          @map_iteration_failed_event_details : Types::MapIterationEventDetails? = nil,
          @map_iteration_started_event_details : Types::MapIterationEventDetails? = nil,
          @map_iteration_succeeded_event_details : Types::MapIterationEventDetails? = nil,
          @map_run_failed_event_details : Types::MapRunFailedEventDetails? = nil,
          @map_run_redriven_event_details : Types::MapRunRedrivenEventDetails? = nil,
          @map_run_started_event_details : Types::MapRunStartedEventDetails? = nil,
          @map_state_started_event_details : Types::MapStateStartedEventDetails? = nil,
          @previous_event_id : Int64? = nil,
          @state_entered_event_details : Types::StateEnteredEventDetails? = nil,
          @state_exited_event_details : Types::StateExitedEventDetails? = nil,
          @task_failed_event_details : Types::TaskFailedEventDetails? = nil,
          @task_scheduled_event_details : Types::TaskScheduledEventDetails? = nil,
          @task_start_failed_event_details : Types::TaskStartFailedEventDetails? = nil,
          @task_started_event_details : Types::TaskStartedEventDetails? = nil,
          @task_submit_failed_event_details : Types::TaskSubmitFailedEventDetails? = nil,
          @task_submitted_event_details : Types::TaskSubmittedEventDetails? = nil,
          @task_succeeded_event_details : Types::TaskSucceededEventDetails? = nil,
          @task_timed_out_event_details : Types::TaskTimedOutEventDetails? = nil
        )
        end
      end

      # Provides details about input or output in an execution history event.

      struct HistoryEventExecutionDataDetails
        include JSON::Serializable

        # Indicates whether input or output was truncated in the response. Always false for API calls. In
        # CloudWatch logs, the value will be true if the data is truncated due to size limits.

        @[JSON::Field(key: "truncated")]
        getter truncated : Bool?

        def initialize(
          @truncated : Bool? = nil
        )
        end
      end

      # Contains additional details about the state's execution, including its input and output data
      # processing flow, and HTTP request and response information.

      struct InspectionData
        include JSON::Serializable

        # The input after Step Functions applies an Arguments filter. This event will only be present when
        # QueryLanguage for the state machine or individual states is set to JSONata. For more info, see
        # Transforming data with Step Functions .

        @[JSON::Field(key: "afterArguments")]
        getter after_arguments : String?

        # The input after Step Functions applies the InputPath filter. Not populated when QueryLanguage is
        # JSONata.

        @[JSON::Field(key: "afterInputPath")]
        getter after_input_path : String?

        # The effective input after the ItemBatcher filter is applied in a Map state.

        @[JSON::Field(key: "afterItemBatcher")]
        getter after_item_batcher : String?

        # An array containing the inputs for each Map iteration, transformed by the ItemSelector specified in
        # a Map state.

        @[JSON::Field(key: "afterItemSelector")]
        getter after_item_selector : String?

        # The effective input after the ItemsPath filter is applied. Not populated when the QueryLanguage is
        # JSONata.

        @[JSON::Field(key: "afterItemsPath")]
        getter after_items_path : String?

        # The effective input after the ItemsPointer filter is applied in a Map state.

        @[JSON::Field(key: "afterItemsPointer")]
        getter after_items_pointer : String?

        # The effective input after Step Functions applies the Parameters filter. Not populated when
        # QueryLanguage is JSONata.

        @[JSON::Field(key: "afterParameters")]
        getter after_parameters : String?

        # The effective result combined with the raw state input after Step Functions applies the ResultPath
        # filter. Not populated when QueryLanguage is JSONata.

        @[JSON::Field(key: "afterResultPath")]
        getter after_result_path : String?

        # The effective result after Step Functions applies the ResultSelector filter. Not populated when
        # QueryLanguage is JSONata.

        @[JSON::Field(key: "afterResultSelector")]
        getter after_result_selector : String?

        # An object containing data about a handled exception in the tested state.

        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::InspectionErrorDetails?

        # The raw state input.

        @[JSON::Field(key: "input")]
        getter input : String?

        # The max concurrency of the Map state.

        @[JSON::Field(key: "maxConcurrency")]
        getter max_concurrency : Int32?

        # The raw HTTP request that is sent when you test an HTTP Task.

        @[JSON::Field(key: "request")]
        getter request : Types::InspectionDataRequest?

        # The raw HTTP response that is returned when you test an HTTP Task.

        @[JSON::Field(key: "response")]
        getter response : Types::InspectionDataResponse?

        # The state's raw result.

        @[JSON::Field(key: "result")]
        getter result : String?

        # The tolerated failure threshold for a Map state as defined in number of Map state iterations.

        @[JSON::Field(key: "toleratedFailureCount")]
        getter tolerated_failure_count : Int32?

        # The tolerated failure threshold for a Map state as defined in percentage of Map state iterations.

        @[JSON::Field(key: "toleratedFailurePercentage")]
        getter tolerated_failure_percentage : Float64?

        # JSON string that contains the set of workflow variables after execution of the state. The set will
        # include variables assigned in the state and variables set up as test state input.

        @[JSON::Field(key: "variables")]
        getter variables : String?

        def initialize(
          @after_arguments : String? = nil,
          @after_input_path : String? = nil,
          @after_item_batcher : String? = nil,
          @after_item_selector : String? = nil,
          @after_items_path : String? = nil,
          @after_items_pointer : String? = nil,
          @after_parameters : String? = nil,
          @after_result_path : String? = nil,
          @after_result_selector : String? = nil,
          @error_details : Types::InspectionErrorDetails? = nil,
          @input : String? = nil,
          @max_concurrency : Int32? = nil,
          @request : Types::InspectionDataRequest? = nil,
          @response : Types::InspectionDataResponse? = nil,
          @result : String? = nil,
          @tolerated_failure_count : Int32? = nil,
          @tolerated_failure_percentage : Float64? = nil,
          @variables : String? = nil
        )
        end
      end

      # Contains additional details about the state's execution, including its input and output data
      # processing flow, and HTTP request information.

      struct InspectionDataRequest
        include JSON::Serializable

        # The request body for the HTTP request.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The request headers associated with the HTTP request.

        @[JSON::Field(key: "headers")]
        getter headers : String?

        # The HTTP method used for the HTTP request.

        @[JSON::Field(key: "method")]
        getter method : String?

        # The protocol used to make the HTTP request.

        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The API endpoint used for the HTTP request.

        @[JSON::Field(key: "url")]
        getter url : String?

        def initialize(
          @body : String? = nil,
          @headers : String? = nil,
          @method : String? = nil,
          @protocol : String? = nil,
          @url : String? = nil
        )
        end
      end

      # Contains additional details about the state's execution, including its input and output data
      # processing flow, and HTTP response information. The inspectionLevel request parameter specifies
      # which details are returned.

      struct InspectionDataResponse
        include JSON::Serializable

        # The HTTP response returned.

        @[JSON::Field(key: "body")]
        getter body : String?

        # The response headers associated with the HTTP response.

        @[JSON::Field(key: "headers")]
        getter headers : String?

        # The protocol used to return the HTTP response.

        @[JSON::Field(key: "protocol")]
        getter protocol : String?

        # The HTTP response status code for the HTTP response.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        # The message associated with the HTTP status code.

        @[JSON::Field(key: "statusMessage")]
        getter status_message : String?

        def initialize(
          @body : String? = nil,
          @headers : String? = nil,
          @protocol : String? = nil,
          @status_code : String? = nil,
          @status_message : String? = nil
        )
        end
      end

      # An object containing data about a handled exception in the tested state.

      struct InspectionErrorDetails
        include JSON::Serializable

        # The array index of the Catch which handled the exception.

        @[JSON::Field(key: "catchIndex")]
        getter catch_index : Int32?

        # The duration in seconds of the backoff for a retry on a failed state invocation.

        @[JSON::Field(key: "retryBackoffIntervalSeconds")]
        getter retry_backoff_interval_seconds : Int32?

        # The array index of the Retry which handled the exception.

        @[JSON::Field(key: "retryIndex")]
        getter retry_index : Int32?

        def initialize(
          @catch_index : Int32? = nil,
          @retry_backoff_interval_seconds : Int32? = nil,
          @retry_index : Int32? = nil
        )
        end
      end

      # The provided Amazon Resource Name (ARN) is not valid.

      struct InvalidArn
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided Amazon States Language definition is not valid.

      struct InvalidDefinition
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Received when encryptionConfiguration is specified but various conditions exist which make the
      # configuration invalid. For example, if type is set to CUSTOMER_MANAGED_KMS_KEY , but kmsKeyId is
      # null, or kmsDataKeyReusePeriodSeconds is not between 60 and 900, or the KMS key is not symmetric or
      # inactive.

      struct InvalidEncryptionConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided JSON input data is not valid.

      struct InvalidExecutionInput
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Configuration is not valid.

      struct InvalidLoggingConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided name is not valid.

      struct InvalidName
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided JSON output data is not valid.

      struct InvalidOutput
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The provided token is not valid.

      struct InvalidToken
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Your tracingConfiguration key does not match, or enabled has not been set to true or false .

      struct InvalidTracingConfiguration
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Either your KMS key policy or API caller does not have the required permissions.

      struct KmsAccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The KMS key is not in valid state, for example: Disabled or Deleted.

      struct KmsInvalidStateException
        include JSON::Serializable

        # Current status of the KMS; key. For example: DISABLED , PENDING_DELETION , PENDING_IMPORT ,
        # UNAVAILABLE , CREATING .

        @[JSON::Field(key: "kmsKeyState")]
        getter kms_key_state : String?


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @kms_key_state : String? = nil,
          @message : String? = nil
        )
        end
      end

      # Received when KMS returns ThrottlingException for a KMS call that Step Functions makes on behalf of
      # the caller.

      struct KmsThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a Lambda function that failed during an execution.

      struct LambdaFunctionFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about a failed Lambda function schedule event that occurred during an execution.

      struct LambdaFunctionScheduleFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about a Lambda function scheduled during an execution.

      struct LambdaFunctionScheduledEventDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the scheduled Lambda function.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The JSON data input to the Lambda function. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Contains details about input for an execution history event.

        @[JSON::Field(key: "inputDetails")]
        getter input_details : Types::HistoryEventExecutionDataDetails?

        # The credentials that Step Functions uses for the task.

        @[JSON::Field(key: "taskCredentials")]
        getter task_credentials : Types::TaskCredentials?

        # The maximum allowed duration of the Lambda function.

        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int64?

        def initialize(
          @resource : String,
          @input : String? = nil,
          @input_details : Types::HistoryEventExecutionDataDetails? = nil,
          @task_credentials : Types::TaskCredentials? = nil,
          @timeout_in_seconds : Int64? = nil
        )
        end
      end

      # Contains details about a lambda function that failed to start during an execution.

      struct LambdaFunctionStartFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about a Lambda function that successfully terminated during an execution.

      struct LambdaFunctionSucceededEventDetails
        include JSON::Serializable

        # The JSON data output by the Lambda function. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # Contains details about the output of an execution history event.

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @output : String? = nil,
          @output_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # Contains details about a Lambda function timeout that occurred during an execution.

      struct LambdaFunctionTimedOutEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the timeout.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end


      struct ListActivitiesInput
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListActivitiesOutput
        include JSON::Serializable

        # The list of activities.

        @[JSON::Field(key: "activities")]
        getter activities : Array(Types::ActivityListItem)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @activities : Array(Types::ActivityListItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListExecutionsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the Map Run that started the child workflow executions. If the
        # mapRunArn field is specified, a list of all of the child workflow executions started by a Map Run is
        # returned. For more information, see Examining Map Run in the Step Functions Developer Guide . You
        # can specify either a mapRunArn or a stateMachineArn , but not both.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String?

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Sets a filter to list executions based on whether or not they have been redriven. For a Distributed
        # Map, redriveFilter sets a filter to list child workflow executions based on whether or not they have
        # been redriven. If you do not provide a redriveFilter , Step Functions returns a list of both
        # redriven and non-redriven executions. If you provide a state machine ARN in redriveFilter , the API
        # returns a validation exception.

        @[JSON::Field(key: "redriveFilter")]
        getter redrive_filter : String?

        # The Amazon Resource Name (ARN) of the state machine whose executions is listed. You can specify
        # either a mapRunArn or a stateMachineArn , but not both. You can also return a list of executions
        # associated with a specific alias or version , by specifying an alias ARN or a version ARN in the
        # stateMachineArn parameter.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String?

        # If specified, only list the executions whose current execution status matches the given filter. If
        # you provide a PENDING_REDRIVE statusFilter, you must specify mapRunArn . For more information, see
        # Child workflow execution redrive behaviour in the Step Functions Developer Guide . If you provide a
        # stateMachineArn and a PENDING_REDRIVE statusFilter, the API returns a validation exception.

        @[JSON::Field(key: "statusFilter")]
        getter status_filter : String?

        def initialize(
          @map_run_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @redrive_filter : String? = nil,
          @state_machine_arn : String? = nil,
          @status_filter : String? = nil
        )
        end
      end


      struct ListExecutionsOutput
        include JSON::Serializable

        # The list of matching executions.

        @[JSON::Field(key: "executions")]
        getter executions : Array(Types::ExecutionListItem)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @executions : Array(Types::ExecutionListItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListMapRunsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the execution for which the Map Runs must be listed.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @execution_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMapRunsOutput
        include JSON::Serializable

        # An array that lists information related to a Map Run, such as the Amazon Resource Name (ARN) of the
        # Map Run and the ARN of the state machine that started the Map Run.

        @[JSON::Field(key: "mapRuns")]
        getter map_runs : Array(Types::MapRunListItem)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @map_runs : Array(Types::MapRunListItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListStateMachineAliasesInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine for which you want to list aliases. If you
        # specify a state machine version ARN, this API returns a list of aliases for that version.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @state_machine_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStateMachineAliasesOutput
        include JSON::Serializable

        # Aliases for the state machine.

        @[JSON::Field(key: "stateMachineAliases")]
        getter state_machine_aliases : Array(Types::StateMachineAliasListItem)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @state_machine_aliases : Array(Types::StateMachineAliasListItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListStateMachineVersionsInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @state_machine_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStateMachineVersionsOutput
        include JSON::Serializable

        # Versions for the state machine.

        @[JSON::Field(key: "stateMachineVersions")]
        getter state_machine_versions : Array(Types::StateMachineVersionListItem)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @state_machine_versions : Array(Types::StateMachineVersionListItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListStateMachinesInput
        include JSON::Serializable

        # The maximum number of results that are returned per call. You can use nextToken to obtain further
        # pages of results. The default is 100 and the maximum allowed page size is 1000. A value of 0 uses
        # the default. This is only an upper limit. The actual number of results returned per call might be
        # fewer than the specified maximum.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListStateMachinesOutput
        include JSON::Serializable


        @[JSON::Field(key: "stateMachines")]
        getter state_machines : Array(Types::StateMachineListItem)

        # If nextToken is returned, there are more results available. The value of nextToken is a unique
        # pagination token for each page. Make the call again using the returned token to retrieve the next
        # page. Keep all other arguments unchanged. Each pagination token expires after 24 hours. Using an
        # expired pagination token will return an HTTP 400 InvalidToken error.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @state_machines : Array(Types::StateMachineListItem),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Step Functions state machine or activity.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # An array of tags associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct LogDestination
        include JSON::Serializable

        # An object describing a CloudWatch log group. For more information, see AWS::Logs::LogGroup in the
        # CloudFormation User Guide.

        @[JSON::Field(key: "cloudWatchLogsLogGroup")]
        getter cloud_watch_logs_log_group : Types::CloudWatchLogsLogGroup?

        def initialize(
          @cloud_watch_logs_log_group : Types::CloudWatchLogsLogGroup? = nil
        )
        end
      end

      # The LoggingConfiguration data type is used to set CloudWatch Logs options.

      struct LoggingConfiguration
        include JSON::Serializable

        # An array of objects that describes where your execution history events will be logged. Limited to
        # size 1. Required, if your log level is not set to OFF .

        @[JSON::Field(key: "destinations")]
        getter destinations : Array(Types::LogDestination)?

        # Determines whether execution data is included in your log. When set to false , data is excluded.

        @[JSON::Field(key: "includeExecutionData")]
        getter include_execution_data : Bool?

        # Defines which category of execution history events are logged.

        @[JSON::Field(key: "level")]
        getter level : String?

        def initialize(
          @destinations : Array(Types::LogDestination)? = nil,
          @include_execution_data : Bool? = nil,
          @level : String? = nil
        )
        end
      end

      # Contains details about an iteration of a Map state.

      struct MapIterationEventDetails
        include JSON::Serializable

        # The index of the array belonging to the Map state iteration.

        @[JSON::Field(key: "index")]
        getter index : Int32?

        # The name of the iteration’s parent Map state.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @index : Int32? = nil,
          @name : String? = nil
        )
        end
      end

      # Contains details about all of the child workflow executions started by a Map Run.

      struct MapRunExecutionCounts
        include JSON::Serializable

        # The total number of child workflow executions that were started by a Map Run and were running, but
        # were either stopped by the user or by Step Functions because the Map Run failed.

        @[JSON::Field(key: "aborted")]
        getter aborted : Int64

        # The total number of child workflow executions that were started by a Map Run, but have failed.

        @[JSON::Field(key: "failed")]
        getter failed : Int64

        # The total number of child workflow executions that were started by a Map Run, but haven't started
        # executing yet.

        @[JSON::Field(key: "pending")]
        getter pending : Int64

        # Returns the count of child workflow executions whose results were written by ResultWriter . For more
        # information, see ResultWriter in the Step Functions Developer Guide .

        @[JSON::Field(key: "resultsWritten")]
        getter results_written : Int64

        # The total number of child workflow executions that were started by a Map Run and are currently
        # in-progress.

        @[JSON::Field(key: "running")]
        getter running : Int64

        # The total number of child workflow executions that were started by a Map Run and have completed
        # successfully.

        @[JSON::Field(key: "succeeded")]
        getter succeeded : Int64

        # The total number of child workflow executions that were started by a Map Run and have timed out.

        @[JSON::Field(key: "timedOut")]
        getter timed_out : Int64

        # The total number of child workflow executions that were started by a Map Run.

        @[JSON::Field(key: "total")]
        getter total : Int64

        # The number of FAILED , ABORTED , or TIMED_OUT child workflow executions that cannot be redriven
        # because their execution status is terminal. For example, child workflows with an execution status of
        # FAILED , ABORTED , or TIMED_OUT and a redriveStatus of NOT_REDRIVABLE .

        @[JSON::Field(key: "failuresNotRedrivable")]
        getter failures_not_redrivable : Int64?

        # The number of unsuccessful child workflow executions currently waiting to be redriven. The status of
        # these child workflow executions could be FAILED , ABORTED , or TIMED_OUT in the original execution
        # attempt or a previous redrive attempt.

        @[JSON::Field(key: "pendingRedrive")]
        getter pending_redrive : Int64?

        def initialize(
          @aborted : Int64,
          @failed : Int64,
          @pending : Int64,
          @results_written : Int64,
          @running : Int64,
          @succeeded : Int64,
          @timed_out : Int64,
          @total : Int64,
          @failures_not_redrivable : Int64? = nil,
          @pending_redrive : Int64? = nil
        )
        end
      end

      # Contains details about a Map Run failure event that occurred during a state machine execution.

      struct MapRunFailedEventDetails
        include JSON::Serializable

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the Map Run failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about items that were processed in all of the child workflow executions that were
      # started by a Map Run.

      struct MapRunItemCounts
        include JSON::Serializable

        # The total number of items processed in child workflow executions that were either stopped by the
        # user or by Step Functions, because the Map Run failed.

        @[JSON::Field(key: "aborted")]
        getter aborted : Int64

        # The total number of items processed in child workflow executions that have failed.

        @[JSON::Field(key: "failed")]
        getter failed : Int64

        # The total number of items to process in child workflow executions that haven't started running yet.

        @[JSON::Field(key: "pending")]
        getter pending : Int64

        # Returns the count of items whose results were written by ResultWriter . For more information, see
        # ResultWriter in the Step Functions Developer Guide .

        @[JSON::Field(key: "resultsWritten")]
        getter results_written : Int64

        # The total number of items being processed in child workflow executions that are currently
        # in-progress.

        @[JSON::Field(key: "running")]
        getter running : Int64

        # The total number of items processed in child workflow executions that have completed successfully.

        @[JSON::Field(key: "succeeded")]
        getter succeeded : Int64

        # The total number of items processed in child workflow executions that have timed out.

        @[JSON::Field(key: "timedOut")]
        getter timed_out : Int64

        # The total number of items processed in all the child workflow executions started by a Map Run.

        @[JSON::Field(key: "total")]
        getter total : Int64

        # The number of FAILED , ABORTED , or TIMED_OUT items in child workflow executions that cannot be
        # redriven because the execution status of those child workflows is terminal. For example, child
        # workflows with an execution status of FAILED , ABORTED , or TIMED_OUT and a redriveStatus of
        # NOT_REDRIVABLE .

        @[JSON::Field(key: "failuresNotRedrivable")]
        getter failures_not_redrivable : Int64?

        # The number of unsuccessful items in child workflow executions currently waiting to be redriven.

        @[JSON::Field(key: "pendingRedrive")]
        getter pending_redrive : Int64?

        def initialize(
          @aborted : Int64,
          @failed : Int64,
          @pending : Int64,
          @results_written : Int64,
          @running : Int64,
          @succeeded : Int64,
          @timed_out : Int64,
          @total : Int64,
          @failures_not_redrivable : Int64? = nil,
          @pending_redrive : Int64? = nil
        )
        end
      end

      # Contains details about a specific Map Run.

      struct MapRunListItem
        include JSON::Serializable

        # The executionArn of the execution from which the Map Run was started.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The Amazon Resource Name (ARN) of the Map Run.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String

        # The date on which the Map Run started.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        # The Amazon Resource Name (ARN) of the executed state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The date on which the Map Run stopped.

        @[JSON::Field(key: "stopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time?

        def initialize(
          @execution_arn : String,
          @map_run_arn : String,
          @start_date : Time,
          @state_machine_arn : String,
          @stop_date : Time? = nil
        )
        end
      end

      # Contains details about a Map Run that was redriven.

      struct MapRunRedrivenEventDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a Map Run that was redriven.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String?

        # The number of times the Map Run has been redriven at this point in the execution's history including
        # this event. The redrive count for a redriven Map Run is always greater than 0.

        @[JSON::Field(key: "redriveCount")]
        getter redrive_count : Int32?

        def initialize(
          @map_run_arn : String? = nil,
          @redrive_count : Int32? = nil
        )
        end
      end

      # Contains details about a Map Run that was started during a state machine execution.

      struct MapRunStartedEventDetails
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a Map Run that was started.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String?

        def initialize(
          @map_run_arn : String? = nil
        )
        end
      end

      # Details about a Map state that was started.

      struct MapStateStartedEventDetails
        include JSON::Serializable

        # The size of the array for Map state iterations.

        @[JSON::Field(key: "length")]
        getter length : Int32?

        def initialize(
          @length : Int32? = nil
        )
        end
      end

      # Request is missing a required parameter. This error occurs if both definition and roleArn are not
      # specified.

      struct MissingRequiredParameter
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A JSON object that contains a mocked error.

      struct MockErrorOutput
        include JSON::Serializable

        # A string containing the cause of the exception thrown when executing the state's logic.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # A string denoting the error code of the exception thrown when invoking the tested state. This field
        # is required if mock.errorOutput is specified.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # A JSON object that contains a mocked result or errorOutput .

      struct MockInput
        include JSON::Serializable

        # The mocked error output when calling TestState. When specified, the mocked response is returned as a
        # JSON object that contains an error and cause field.

        @[JSON::Field(key: "errorOutput")]
        getter error_output : Types::MockErrorOutput?

        # Determines the level of strictness when validating mocked results against their respective API
        # models. Values include: STRICT : All required fields must be present, and all present fields must
        # conform to the API's schema. PRESENT : All present fields must conform to the API's schema. NONE :
        # No validation is performed. If no value is specified, the default value is STRICT .

        @[JSON::Field(key: "fieldValidationMode")]
        getter field_validation_mode : String?

        # A JSON string containing the mocked result of the state invocation.

        @[JSON::Field(key: "result")]
        getter result : String?

        def initialize(
          @error_output : Types::MockErrorOutput? = nil,
          @field_validation_mode : String? = nil,
          @result : String? = nil
        )
        end
      end


      struct PublishStateMachineVersionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # An optional description of the state machine version.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Only publish the state machine version if the current state machine's revision ID matches the
        # specified ID. Use this option to avoid publishing a version if the state machine changed since you
        # last updated it. If the specified revision ID doesn't match the state machine's current revision ID,
        # the API returns ConflictException . To specify an initial revision ID for a state machine with no
        # revision ID assigned, specify the string INITIAL for the revisionId parameter. For example, you can
        # specify a revisionID of INITIAL when you create a state machine using the CreateStateMachine API
        # action.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        def initialize(
          @state_machine_arn : String,
          @description : String? = nil,
          @revision_id : String? = nil
        )
        end
      end


      struct PublishStateMachineVersionOutput
        include JSON::Serializable

        # The date the version was created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The Amazon Resource Name (ARN) (ARN) that identifies the state machine version.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String

        def initialize(
          @creation_date : Time,
          @state_machine_version_arn : String
        )
        end
      end


      struct RedriveExecutionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the execution to be redriven.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # A unique, case-sensitive identifier that you provide to ensure the idempotency of the request. If
        # you don’t specify a client token, the Amazon Web Services SDK automatically generates a client token
        # and uses it for the request to ensure idempotency. The API will return idempotent responses for the
        # last 10 client tokens used to successfully redrive the execution. These client tokens are valid for
        # up to 15 minutes after they are first used.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        def initialize(
          @execution_arn : String,
          @client_token : String? = nil
        )
        end
      end


      struct RedriveExecutionOutput
        include JSON::Serializable

        # The date the execution was last redriven.

        @[JSON::Field(key: "redriveDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter redrive_date : Time

        def initialize(
          @redrive_date : Time
        )
        end
      end

      # Could not find the referenced resource.

      struct ResourceNotFound
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Contains details about the routing configuration of a state machine alias. In a routing
      # configuration, you define an array of objects that specify up to two state machine versions. You
      # also specify the percentage of traffic to be routed to each version.

      struct RoutingConfigurationListItem
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies one or two state machine versions defined in the
        # routing configuration. If you specify the ARN of a second version, it must belong to the same state
        # machine as the first version.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String

        # The percentage of traffic you want to route to a state machine version. The sum of the weights in
        # the routing configuration must be equal to 100.

        @[JSON::Field(key: "weight")]
        getter weight : Int32

        def initialize(
          @state_machine_version_arn : String,
          @weight : Int32
        )
        end
      end


      struct SendTaskFailureInput
        include JSON::Serializable

        # The token that represents this task. Task tokens are generated by Step Functions when tasks are
        # assigned to a worker, or in the context object when a workflow enters a task state. See
        # GetActivityTaskOutput$taskToken .

        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @task_token : String,
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end


      struct SendTaskFailureOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct SendTaskHeartbeatInput
        include JSON::Serializable

        # The token that represents this task. Task tokens are generated by Step Functions when tasks are
        # assigned to a worker, or in the context object when a workflow enters a task state. See
        # GetActivityTaskOutput$taskToken .

        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        def initialize(
          @task_token : String
        )
        end
      end


      struct SendTaskHeartbeatOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct SendTaskSuccessInput
        include JSON::Serializable

        # The JSON output of the task. Length constraints apply to the payload size, and are expressed as
        # bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String

        # The token that represents this task. Task tokens are generated by Step Functions when tasks are
        # assigned to a worker, or in the context object when a workflow enters a task state. See
        # GetActivityTaskOutput$taskToken .

        @[JSON::Field(key: "taskToken")]
        getter task_token : String

        def initialize(
          @output : String,
          @task_token : String
        )
        end
      end


      struct SendTaskSuccessOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request would cause a service quota to be exceeded. HTTP Status Code: 402

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartExecutionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine to execute. The stateMachineArn parameter
        # accepts one of the following inputs: An unqualified state machine ARN – Refers to a state machine
        # ARN that isn't qualified with a version or alias ARN. The following is an example of an unqualified
        # state machine ARN.
        # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine&gt;
        # Step Functions doesn't associate state machine executions that you start with an unqualified ARN
        # with a version. This is true even if that version uses the same revision that the execution used. A
        # state machine version ARN – Refers to a version ARN, which is a combination of state machine ARN and
        # the version number separated by a colon (:). The following is an example of the ARN for version 10.
        # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine&gt;:10
        # Step Functions doesn't associate executions that you start with a version ARN with any aliases that
        # point to that version. A state machine alias ARN – Refers to an alias ARN, which is a combination of
        # state machine ARN and the alias name separated by a colon (:). The following is an example of the
        # ARN for an alias named PROD .
        # arn:&lt;partition&gt;:states:&lt;region&gt;:&lt;account-id&gt;:stateMachine:&lt;myStateMachine:PROD&gt;
        # Step Functions associates executions that you start with an alias ARN with that alias and the state
        # machine version used for that execution.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The string that contains the JSON input data for the execution, for example: "{\"first_name\" :
        # \"Alejandro\"}" If you don't include any JSON input data, you still must include the two braces, for
        # example: "{}" Length constraints apply to the payload size, and are expressed as bytes in UTF-8
        # encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Optional name of the execution. This name must be unique for your Amazon Web Services account,
        # Region, and state machine for 90 days. For more information, see Limits Related to State Machine
        # Executions in the Step Functions Developer Guide . If you don't provide a name for the execution,
        # Step Functions automatically generates a universally unique identifier (UUID) as the execution name.
        # A name must not contain: white space brackets &lt; &gt; { } [ ] wildcard characters ? * special
        # characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters ( U+0000-001F , U+007F-009F ,
        # U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF ) To enable logging with
        # CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Passes the X-Ray trace header. The trace header can also be passed in the request payload. For X-Ray
        # traces, all Amazon Web Services services use the X-Amzn-Trace-Id header from the HTTP request. Using
        # the header is the preferred mechanism to identify a trace. StartExecution and StartSyncExecution API
        # operations can also use traceHeader from the body of the request payload. If both sources are
        # provided, Step Functions will use the header value (preferred) over the value in the request body.

        @[JSON::Field(key: "traceHeader")]
        getter trace_header : String?

        def initialize(
          @state_machine_arn : String,
          @input : String? = nil,
          @name : String? = nil,
          @trace_header : String? = nil
        )
        end
      end


      struct StartExecutionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the execution.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The date the execution is started.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        def initialize(
          @execution_arn : String,
          @start_date : Time
        )
        end
      end


      struct StartSyncExecutionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine to execute.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # If your state machine definition is encrypted with a KMS key, callers must have kms:Decrypt
        # permission to decrypt the definition. Alternatively, you can call the API with includedData =
        # METADATA_ONLY to get a successful response without the encrypted definition.

        @[JSON::Field(key: "includedData")]
        getter included_data : String?

        # The string that contains the JSON input data for the execution, for example: "{\"first_name\" :
        # \"Alejandro\"}" If you don't include any JSON input data, you still must include the two braces, for
        # example: "{}" Length constraints apply to the payload size, and are expressed as bytes in UTF-8
        # encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # The name of the execution.

        @[JSON::Field(key: "name")]
        getter name : String?

        # Passes the X-Ray trace header. The trace header can also be passed in the request payload. For X-Ray
        # traces, all Amazon Web Services services use the X-Amzn-Trace-Id header from the HTTP request. Using
        # the header is the preferred mechanism to identify a trace. StartExecution and StartSyncExecution API
        # operations can also use traceHeader from the body of the request payload. If both sources are
        # provided, Step Functions will use the header value (preferred) over the value in the request body.

        @[JSON::Field(key: "traceHeader")]
        getter trace_header : String?

        def initialize(
          @state_machine_arn : String,
          @included_data : String? = nil,
          @input : String? = nil,
          @name : String? = nil,
          @trace_header : String? = nil
        )
        end
      end


      struct StartSyncExecutionOutput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) that identifies the execution.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # The date the execution is started.

        @[JSON::Field(key: "startDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter start_date : Time

        # The current status of the execution.

        @[JSON::Field(key: "status")]
        getter status : String

        # If the execution has already ended, the date the execution stopped.

        @[JSON::Field(key: "stopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time

        # An object that describes workflow billing details, including billed duration and memory use.

        @[JSON::Field(key: "billingDetails")]
        getter billing_details : Types::BillingDetails?

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        # The string that contains the JSON input data of the execution. Length constraints apply to the
        # payload size, and are expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?


        @[JSON::Field(key: "inputDetails")]
        getter input_details : Types::CloudWatchEventsExecutionDataDetails?

        # The name of the execution.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The JSON output data of the execution. Length constraints apply to the payload size, and are
        # expressed as bytes in UTF-8 encoding. This field is set only if the execution succeeds. If the
        # execution fails, this field is null.

        @[JSON::Field(key: "output")]
        getter output : String?


        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::CloudWatchEventsExecutionDataDetails?

        # The Amazon Resource Name (ARN) that identifies the state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String?

        # The X-Ray trace header that was passed to the execution. For X-Ray traces, all Amazon Web Services
        # services use the X-Amzn-Trace-Id header from the HTTP request. Using the header is the preferred
        # mechanism to identify a trace. StartExecution and StartSyncExecution API operations can also use
        # traceHeader from the body of the request payload. If both sources are provided, Step Functions will
        # use the header value (preferred) over the value in the request body.

        @[JSON::Field(key: "traceHeader")]
        getter trace_header : String?

        def initialize(
          @execution_arn : String,
          @start_date : Time,
          @status : String,
          @stop_date : Time,
          @billing_details : Types::BillingDetails? = nil,
          @cause : String? = nil,
          @error : String? = nil,
          @input : String? = nil,
          @input_details : Types::CloudWatchEventsExecutionDataDetails? = nil,
          @name : String? = nil,
          @output : String? = nil,
          @output_details : Types::CloudWatchEventsExecutionDataDetails? = nil,
          @state_machine_arn : String? = nil,
          @trace_header : String? = nil
        )
        end
      end

      # Contains details about a state entered during an execution.

      struct StateEnteredEventDetails
        include JSON::Serializable

        # The name of the state.

        @[JSON::Field(key: "name")]
        getter name : String

        # The string that contains the JSON input data for the state. Length constraints apply to the payload
        # size, and are expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Contains details about the input for an execution history event.

        @[JSON::Field(key: "inputDetails")]
        getter input_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @name : String,
          @input : String? = nil,
          @input_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # Contains details about an exit from a state during an execution.

      struct StateExitedEventDetails
        include JSON::Serializable

        # The name of the state. A name must not contain: white space brackets &lt; &gt; { } [ ] wildcard
        # characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters ( U+0000-001F ,
        # U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF ) To enable
        # logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # Map of variable name and value as a serialized JSON representation.

        @[JSON::Field(key: "assignedVariables")]
        getter assigned_variables : Hash(String, String)?

        # Provides details about input or output in an execution history event.

        @[JSON::Field(key: "assignedVariablesDetails")]
        getter assigned_variables_details : Types::AssignedVariablesDetails?

        # The JSON output data of the state. Length constraints apply to the payload size, and are expressed
        # as bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # Contains details about the output of an execution history event.

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @name : String,
          @assigned_variables : Hash(String, String)? = nil,
          @assigned_variables_details : Types::AssignedVariablesDetails? = nil,
          @output : String? = nil,
          @output_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # Contains details about a specific state machine alias.

      struct StateMachineAliasListItem
        include JSON::Serializable

        # The creation date of a state machine alias.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The Amazon Resource Name (ARN) that identifies a state machine alias. The alias ARN is a combination
        # of state machine ARN and the alias name separated by a colon (:). For example, stateMachineARN:PROD
        # .

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String

        def initialize(
          @creation_date : Time,
          @state_machine_alias_arn : String
        )
        end
      end

      # A state machine with the same name but a different definition or role ARN already exists.

      struct StateMachineAlreadyExists
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified state machine is being deleted.

      struct StateMachineDeleting
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified state machine does not exist.

      struct StateMachineDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The maximum number of state machines has been reached. Existing state machines must be deleted
      # before a new state machine can be created.

      struct StateMachineLimitExceeded
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about the state machine.

      struct StateMachineListItem
        include JSON::Serializable

        # The date the state machine is created.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The name of the state machine. A name must not contain: white space brackets &lt; &gt; { } [ ]
        # wildcard characters ? * special characters " # % \ ^ | ~ ` $ &amp; , ; : / control characters (
        # U+0000-001F , U+007F-009F , U+FFFE-FFFF ) surrogates ( U+D800-DFFF ) invalid characters ( U+10FFFF )
        # To enable logging with CloudWatch Logs, the name should only contain 0-9, A-Z, a-z, - and _.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) that identifies the state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String


        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @creation_date : Time,
          @name : String,
          @state_machine_arn : String,
          @type : String
        )
        end
      end

      # State machine type is not supported.

      struct StateMachineTypeNotSupported
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a specific state machine version.

      struct StateMachineVersionListItem
        include JSON::Serializable

        # The creation date of a state machine version.

        @[JSON::Field(key: "creationDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter creation_date : Time

        # The Amazon Resource Name (ARN) that identifies a state machine version. The version ARN is a
        # combination of state machine ARN and the version number separated by a colon (:). For example,
        # stateMachineARN:1 .

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String

        def initialize(
          @creation_date : Time,
          @state_machine_version_arn : String
        )
        end
      end


      struct StopExecutionInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the execution to stop.

        @[JSON::Field(key: "executionArn")]
        getter execution_arn : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @execution_arn : String,
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end


      struct StopExecutionOutput
        include JSON::Serializable

        # The date the execution is stopped.

        @[JSON::Field(key: "stopDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter stop_date : Time

        def initialize(
          @stop_date : Time
        )
        end
      end

      # Tags are key-value pairs that can be associated with Step Functions state machines and activities.
      # An array of key-value pairs. For more information, see Using Cost Allocation Tags in the Amazon Web
      # Services Billing and Cost Management User Guide , and Controlling Access Using IAM Tags . Tags may
      # only contain Unicode letters, digits, white space, or these symbols: _ . : / = + - @ .

      struct Tag
        include JSON::Serializable

        # The key of a tag.

        @[JSON::Field(key: "key")]
        getter key : String?

        # The value of a tag.

        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Step Functions state machine or activity.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tags to add to a resource. Tags may only contain Unicode letters, digits, white space,
        # or these symbols: _ . : / = + - @ .

        @[JSON::Field(key: "tags")]
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

      # Contains details about the credentials that Step Functions uses for a task.

      struct TaskCredentials
        include JSON::Serializable

        # The ARN of an IAM role that Step Functions assumes for the task. The role can allow cross-account
        # access to resources.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @role_arn : String? = nil
        )
        end
      end

      # The activity does not exist.

      struct TaskDoesNotExist
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a task failure event.

      struct TaskFailedEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @resource : String,
          @resource_type : String,
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about a task scheduled during an execution.

      struct TaskScheduledEventDetails
        include JSON::Serializable

        # The JSON data passed to the resource referenced in a task state. Length constraints apply to the
        # payload size, and are expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "parameters")]
        getter parameters : String

        # The region of the scheduled task

        @[JSON::Field(key: "region")]
        getter region : String

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The maximum allowed duration between two heartbeats for the task.

        @[JSON::Field(key: "heartbeatInSeconds")]
        getter heartbeat_in_seconds : Int64?

        # The credentials that Step Functions uses for the task.

        @[JSON::Field(key: "taskCredentials")]
        getter task_credentials : Types::TaskCredentials?

        # The maximum allowed duration of the task.

        @[JSON::Field(key: "timeoutInSeconds")]
        getter timeout_in_seconds : Int64?

        def initialize(
          @parameters : String,
          @region : String,
          @resource : String,
          @resource_type : String,
          @heartbeat_in_seconds : Int64? = nil,
          @task_credentials : Types::TaskCredentials? = nil,
          @timeout_in_seconds : Int64? = nil
        )
        end
      end

      # Contains details about a task that failed to start during an execution.

      struct TaskStartFailedEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @resource : String,
          @resource_type : String,
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about the start of a task during an execution.

      struct TaskStartedEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource : String,
          @resource_type : String
        )
        end
      end

      # Contains details about a task that failed to submit during an execution.

      struct TaskSubmitFailedEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @resource : String,
          @resource_type : String,
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains details about a task submitted to a resource .

      struct TaskSubmittedEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The response from a resource when a task has started. Length constraints apply to the payload size,
        # and are expressed as bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # Contains details about the output of an execution history event.

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @resource : String,
          @resource_type : String,
          @output : String? = nil,
          @output_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # Contains details about the successful completion of a task state.

      struct TaskSucceededEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # The full JSON response from a resource when a task has succeeded. This response becomes the output
        # of the related task. Length constraints apply to the payload size, and are expressed as bytes in
        # UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # Contains details about the output of an execution history event.

        @[JSON::Field(key: "outputDetails")]
        getter output_details : Types::HistoryEventExecutionDataDetails?

        def initialize(
          @resource : String,
          @resource_type : String,
          @output : String? = nil,
          @output_details : Types::HistoryEventExecutionDataDetails? = nil
        )
        end
      end

      # The task token has either expired or the task associated with the token has already been closed.

      struct TaskTimedOut
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains details about a resource timeout that occurred during an execution.

      struct TaskTimedOutEventDetails
        include JSON::Serializable

        # The action of the resource called by a task state.

        @[JSON::Field(key: "resource")]
        getter resource : String

        # The service name of the resource in a task state.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # A more detailed explanation of the cause of the failure.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error code of the failure.

        @[JSON::Field(key: "error")]
        getter error : String?

        def initialize(
          @resource : String,
          @resource_type : String,
          @cause : String? = nil,
          @error : String? = nil
        )
        end
      end

      # Contains configurations for the tested state.

      struct TestStateConfiguration
        include JSON::Serializable

        # The name of the state from which an error originates when an error is mocked for a Map or Parallel
        # state.

        @[JSON::Field(key: "errorCausedByState")]
        getter error_caused_by_state : String?

        # The data read by ItemReader in Distributed Map states as found in its original source.

        @[JSON::Field(key: "mapItemReaderData")]
        getter map_item_reader_data : String?

        # The number of Map state iterations that failed during the Map state invocation.

        @[JSON::Field(key: "mapIterationFailureCount")]
        getter map_iteration_failure_count : Int32?

        # The number of retry attempts that have occurred for the state's Retry that applies to the mocked
        # error.

        @[JSON::Field(key: "retrierRetryCount")]
        getter retrier_retry_count : Int32?

        def initialize(
          @error_caused_by_state : String? = nil,
          @map_item_reader_data : String? = nil,
          @map_iteration_failure_count : Int32? = nil,
          @retrier_retry_count : Int32? = nil
        )
        end
      end


      struct TestStateInput
        include JSON::Serializable

        # The Amazon States Language (ASL) definition of the state or state machine.

        @[JSON::Field(key: "definition")]
        getter definition : String

        # A JSON string representing a valid Context object for the state under test. This field may only be
        # specified if a mock is specified in the same request.

        @[JSON::Field(key: "context")]
        getter context : String?

        # A string that contains the JSON input data for the state.

        @[JSON::Field(key: "input")]
        getter input : String?

        # Determines the values to return when a state is tested. You can specify one of the following types:
        # INFO : Shows the final state output. By default, Step Functions sets inspectionLevel to INFO if you
        # don't specify a level. DEBUG : Shows the final state output along with the input and output data
        # processing result. TRACE : Shows the HTTP request and response for an HTTP Task. This level also
        # shows the final state output along with the input and output data processing result. Each of these
        # levels also provide information about the status of the state execution and the next state to
        # transition to.

        @[JSON::Field(key: "inspectionLevel")]
        getter inspection_level : String?

        # Defines a mocked result or error for the state under test. A mock can only be specified for Task,
        # Map, or Parallel states. If it is specified for another state type, an exception will be thrown.

        @[JSON::Field(key: "mock")]
        getter mock : Types::MockInput?

        # Specifies whether or not to include secret information in the test result. For HTTP Tasks, a secret
        # includes the data that an EventBridge connection adds to modify the HTTP request headers, query
        # parameters, and body. Step Functions doesn't omit any information included in the state definition
        # or the HTTP response. If you set revealSecrets to true , you must make sure that the IAM user that
        # calls the TestState API has permission for the states:RevealSecrets action. For an example of IAM
        # policy that sets the states:RevealSecrets permission, see IAM permissions to test a state . Without
        # this permission, Step Functions throws an access denied error. By default, revealSecrets is set to
        # false .

        @[JSON::Field(key: "revealSecrets")]
        getter reveal_secrets : Bool?

        # The Amazon Resource Name (ARN) of the execution role with the required IAM permissions for the
        # state.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Contains configurations for the state under test.

        @[JSON::Field(key: "stateConfiguration")]
        getter state_configuration : Types::TestStateConfiguration?

        # Denotes the particular state within a state machine definition to be tested. If this field is
        # specified, the definition must contain a fully-formed state machine definition.

        @[JSON::Field(key: "stateName")]
        getter state_name : String?

        # JSON object literal that sets variables used in the state under test. Object keys are the variable
        # names and values are the variable values.

        @[JSON::Field(key: "variables")]
        getter variables : String?

        def initialize(
          @definition : String,
          @context : String? = nil,
          @input : String? = nil,
          @inspection_level : String? = nil,
          @mock : Types::MockInput? = nil,
          @reveal_secrets : Bool? = nil,
          @role_arn : String? = nil,
          @state_configuration : Types::TestStateConfiguration? = nil,
          @state_name : String? = nil,
          @variables : String? = nil
        )
        end
      end


      struct TestStateOutput
        include JSON::Serializable

        # A detailed explanation of the cause for the error when the execution of a state fails.

        @[JSON::Field(key: "cause")]
        getter cause : String?

        # The error returned when the execution of a state fails.

        @[JSON::Field(key: "error")]
        getter error : String?

        # Returns additional details about the state's execution, including its input and output data
        # processing flow, and HTTP request and response information. The inspectionLevel request parameter
        # specifies which details are returned.

        @[JSON::Field(key: "inspectionData")]
        getter inspection_data : Types::InspectionData?

        # The name of the next state to transition to. If you haven't defined a next state in your definition
        # or if the execution of the state fails, this field doesn't contain a value.

        @[JSON::Field(key: "nextState")]
        getter next_state : String?

        # The JSON output data of the state. Length constraints apply to the payload size, and are expressed
        # as bytes in UTF-8 encoding.

        @[JSON::Field(key: "output")]
        getter output : String?

        # The execution status of the state.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @cause : String? = nil,
          @error : String? = nil,
          @inspection_data : Types::InspectionData? = nil,
          @next_state : String? = nil,
          @output : String? = nil,
          @status : String? = nil
        )
        end
      end

      # You've exceeded the number of tags allowed for a resource. See the Limits Topic in the Step
      # Functions Developer Guide.

      struct TooManyTags
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?


        @[JSON::Field(key: "resourceName")]
        getter resource_name : String?

        def initialize(
          @message : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Selects whether or not the state machine's X-Ray tracing is enabled. Default is false

      struct TracingConfiguration
        include JSON::Serializable

        # When set to true , X-Ray tracing is enabled.

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        def initialize(
          @enabled : Bool? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) for the Step Functions state machine or activity.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tags to remove from the resource.

        @[JSON::Field(key: "tagKeys")]
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


      struct UpdateMapRunInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of a Map Run.

        @[JSON::Field(key: "mapRunArn")]
        getter map_run_arn : String

        # The maximum number of child workflow executions that can be specified to run in parallel for the Map
        # Run at the same time.

        @[JSON::Field(key: "maxConcurrency")]
        getter max_concurrency : Int32?

        # The maximum number of failed items before the Map Run fails.

        @[JSON::Field(key: "toleratedFailureCount")]
        getter tolerated_failure_count : Int64?

        # The maximum percentage of failed items before the Map Run fails.

        @[JSON::Field(key: "toleratedFailurePercentage")]
        getter tolerated_failure_percentage : Float64?

        def initialize(
          @map_run_arn : String,
          @max_concurrency : Int32? = nil,
          @tolerated_failure_count : Int64? = nil,
          @tolerated_failure_percentage : Float64? = nil
        )
        end
      end


      struct UpdateMapRunOutput
        include JSON::Serializable

        def initialize
        end
      end


      struct UpdateStateMachineAliasInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine alias.

        @[JSON::Field(key: "stateMachineAliasArn")]
        getter state_machine_alias_arn : String

        # A description of the state machine alias.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The routing configuration of the state machine alias. An array of RoutingConfig objects that
        # specifies up to two state machine versions that the alias starts executions for.

        @[JSON::Field(key: "routingConfiguration")]
        getter routing_configuration : Array(Types::RoutingConfigurationListItem)?

        def initialize(
          @state_machine_alias_arn : String,
          @description : String? = nil,
          @routing_configuration : Array(Types::RoutingConfigurationListItem)? = nil
        )
        end
      end


      struct UpdateStateMachineAliasOutput
        include JSON::Serializable

        # The date and time the state machine alias was updated.

        @[JSON::Field(key: "updateDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date : Time

        def initialize(
          @update_date : Time
        )
        end
      end


      struct UpdateStateMachineInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the state machine.

        @[JSON::Field(key: "stateMachineArn")]
        getter state_machine_arn : String

        # The Amazon States Language definition of the state machine. See Amazon States Language .

        @[JSON::Field(key: "definition")]
        getter definition : String?

        # Settings to configure server-side encryption.

        @[JSON::Field(key: "encryptionConfiguration")]
        getter encryption_configuration : Types::EncryptionConfiguration?

        # Use the LoggingConfiguration data type to set CloudWatch Logs options.

        @[JSON::Field(key: "loggingConfiguration")]
        getter logging_configuration : Types::LoggingConfiguration?

        # Specifies whether the state machine version is published. The default is false . To publish a
        # version after updating the state machine, set publish to true .

        @[JSON::Field(key: "publish")]
        getter publish : Bool?

        # The Amazon Resource Name (ARN) of the IAM role of the state machine.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # Selects whether X-Ray tracing is enabled.

        @[JSON::Field(key: "tracingConfiguration")]
        getter tracing_configuration : Types::TracingConfiguration?

        # An optional description of the state machine version to publish. You can only specify the
        # versionDescription parameter if you've set publish to true .

        @[JSON::Field(key: "versionDescription")]
        getter version_description : String?

        def initialize(
          @state_machine_arn : String,
          @definition : String? = nil,
          @encryption_configuration : Types::EncryptionConfiguration? = nil,
          @logging_configuration : Types::LoggingConfiguration? = nil,
          @publish : Bool? = nil,
          @role_arn : String? = nil,
          @tracing_configuration : Types::TracingConfiguration? = nil,
          @version_description : String? = nil
        )
        end
      end


      struct UpdateStateMachineOutput
        include JSON::Serializable

        # The date and time the state machine was updated.

        @[JSON::Field(key: "updateDate", converter: AwsSdk::Runtime::UnixTimestampConverter)]
        getter update_date : Time

        # The revision identifier for the updated state machine.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # The Amazon Resource Name (ARN) of the published state machine version. If the publish parameter
        # isn't set to true , this field returns null.

        @[JSON::Field(key: "stateMachineVersionArn")]
        getter state_machine_version_arn : String?

        def initialize(
          @update_date : Time,
          @revision_id : String? = nil,
          @state_machine_version_arn : String? = nil
        )
        end
      end

      # Describes potential issues found during state machine validation. Rather than raise an exception,
      # validation will return a list of diagnostic elements containing diagnostic information. The
      # ValidateStateMachineDefinitionlAPI might add new diagnostics in the future, adjust diagnostic codes,
      # or change the message wording. Your automated processes should only rely on the value of the result
      # field value (OK, FAIL). Do not rely on the exact order, count, or wording of diagnostic messages.
      # List of warning codes NO_DOLLAR No .$ on a field that appears to be a JSONPath or Intrinsic
      # Function. NO_PATH Field value looks like a path, but field name does not end with 'Path'.
      # PASS_RESULT_IS_STATIC Attempt to use a path in the result of a pass state. List of error codes
      # INVALID_JSON_DESCRIPTION JSON syntax problem found. MISSING_DESCRIPTION Received a null or empty
      # workflow input. SCHEMA_VALIDATION_FAILED Schema validation reported errors. INVALID_RESOURCE The
      # value of a Task-state resource field is invalid. MISSING_END_STATE The workflow does not have a
      # terminal state. DUPLICATE_STATE_NAME The same state name appears more than once. INVALID_STATE_NAME
      # The state name does not follow the naming convention. STATE_MACHINE_NAME_EMPTY The state machine
      # name has not been specified. STATE_MACHINE_NAME_INVALID The state machine name does not follow the
      # naming convention. STATE_MACHINE_NAME_TOO_LONG The state name exceeds the allowed length.
      # STATE_MACHINE_NAME_ALREADY_EXISTS The state name already exists. DUPLICATE_LABEL_NAME A label name
      # appears more than once. INVALID_LABEL_NAME You have provided an invalid label name.
      # MISSING_TRANSITION_TARGET The value of "Next" field doesn't match a known state name.
      # TOO_DEEPLY_NESTED The states are too deeply nested.

      struct ValidateStateMachineDefinitionDiagnostic
        include JSON::Serializable

        # Identifying code for the diagnostic.

        @[JSON::Field(key: "code")]
        getter code : String

        # Message describing the diagnostic condition.

        @[JSON::Field(key: "message")]
        getter message : String

        # A value of ERROR means that you cannot create or update a state machine with this definition.
        # WARNING level diagnostics alert you to potential issues, but they will not prevent you from creating
        # or updating your state machine.

        @[JSON::Field(key: "severity")]
        getter severity : String

        # Location of the issue in the state machine, if available. For errors specific to a field, the
        # location could be in the format: /States/&lt;StateName&gt;/&lt;FieldName&gt; , for example:
        # /States/FailState/ErrorPath .

        @[JSON::Field(key: "location")]
        getter location : String?

        def initialize(
          @code : String,
          @message : String,
          @severity : String,
          @location : String? = nil
        )
        end
      end


      struct ValidateStateMachineDefinitionInput
        include JSON::Serializable

        # The Amazon States Language definition of the state machine. For more information, see Amazon States
        # Language (ASL).

        @[JSON::Field(key: "definition")]
        getter definition : String

        # The maximum number of diagnostics that are returned per call. The default and maximum value is 100.
        # Setting the value to 0 will also use the default of 100. If the number of diagnostics returned in
        # the response exceeds maxResults , the value of the truncated field in the response will be set to
        # true .

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # Minimum level of diagnostics to return. ERROR returns only ERROR diagnostics, whereas WARNING
        # returns both WARNING and ERROR diagnostics. The default is ERROR .

        @[JSON::Field(key: "severity")]
        getter severity : String?

        # The target type of state machine for this definition. The default is STANDARD .

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @definition : String,
          @max_results : Int32? = nil,
          @severity : String? = nil,
          @type : String? = nil
        )
        end
      end


      struct ValidateStateMachineDefinitionOutput
        include JSON::Serializable

        # An array of diagnostic errors and warnings found during validation of the state machine definition.
        # Since warnings do not prevent deploying your workflow definition, the result value could be OK even
        # when warning diagnostics are present in the response.

        @[JSON::Field(key: "diagnostics")]
        getter diagnostics : Array(Types::ValidateStateMachineDefinitionDiagnostic)

        # The result value will be OK when no syntax errors are found, or FAIL if the workflow definition does
        # not pass verification.

        @[JSON::Field(key: "result")]
        getter result : String

        # The result value will be true if the number of diagnostics found in the workflow definition exceeds
        # maxResults . When all diagnostics results are returned, the value will be false .

        @[JSON::Field(key: "truncated")]
        getter truncated : Bool?

        def initialize(
          @diagnostics : Array(Types::ValidateStateMachineDefinitionDiagnostic),
          @result : String,
          @truncated : Bool? = nil
        )
        end
      end

      # The input does not satisfy the constraints specified by an Amazon Web Services service.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The input does not satisfy the constraints specified by an Amazon Web Services service.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end
    end
  end
end
