require "json"

module AwsSdk
  module IoTJobsDataPlane
    module Types

      # The certificate is invalid.

      struct CertificateValidationException
        include JSON::Serializable

        # Additional information about the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The list of values used to describe a specific command parameter.

      struct CommandParameterValue
        include JSON::Serializable

        # An attribute of type Boolean. For example: "BOOL": true

        @[JSON::Field(key: "B")]
        getter b : Bool?

        # An attribute of type Binary.

        @[JSON::Field(key: "BIN")]
        getter bin : Bytes?

        # An attribute of type Double (Sixty-Four Bits).

        @[JSON::Field(key: "D")]
        getter d : Float64?

        # An attribute of type Integer (Thirty-Two Bits).

        @[JSON::Field(key: "I")]
        getter i : Int32?

        # An attribute of type Long.

        @[JSON::Field(key: "L")]
        getter l : Int64?

        # An attribute of type String. For example: "S": "Hello"

        @[JSON::Field(key: "S")]
        getter s : String?

        # An attribute of type Unsigned Long.

        @[JSON::Field(key: "UL")]
        getter ul : String?

        def initialize(
          @b : Bool? = nil,
          @bin : Bytes? = nil,
          @d : Float64? = nil,
          @i : Int32? = nil,
          @l : Int64? = nil,
          @s : String? = nil,
          @ul : String? = nil
        )
        end
      end

      # A conflict has occurred when performing the API request.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # A conflict occurred while performing the API request on the resource ID.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil
        )
        end
      end


      struct DescribeJobExecutionRequest
        include JSON::Serializable

        # The unique identifier assigned to this job when it was created.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The thing name associated with the device the job execution is running on.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # Optional. A number that identifies a particular job execution on a particular device. If not
        # specified, the latest job execution is returned.

        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        # Optional. Unless set to false, the response contains the job document. The default is true.

        @[JSON::Field(key: "includeJobDocument")]
        getter include_job_document : Bool?

        def initialize(
          @job_id : String,
          @thing_name : String,
          @execution_number : Int64? = nil,
          @include_job_document : Bool? = nil
        )
        end
      end


      struct DescribeJobExecutionResponse
        include JSON::Serializable

        # Contains data about a job execution.

        @[JSON::Field(key: "execution")]
        getter execution : Types::JobExecution?

        def initialize(
          @execution : Types::JobExecution? = nil
        )
        end
      end


      struct GetPendingJobExecutionsRequest
        include JSON::Serializable

        # The name of the thing that is executing the job.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        def initialize(
          @thing_name : String
        )
        end
      end


      struct GetPendingJobExecutionsResponse
        include JSON::Serializable

        # A list of JobExecutionSummary objects with status IN_PROGRESS.

        @[JSON::Field(key: "inProgressJobs")]
        getter in_progress_jobs : Array(Types::JobExecutionSummary)?

        # A list of JobExecutionSummary objects with status QUEUED.

        @[JSON::Field(key: "queuedJobs")]
        getter queued_jobs : Array(Types::JobExecutionSummary)?

        def initialize(
          @in_progress_jobs : Array(Types::JobExecutionSummary)? = nil,
          @queued_jobs : Array(Types::JobExecutionSummary)? = nil
        )
        end
      end

      # An internal server error occurred when performing the API request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The contents of the request were invalid.

      struct InvalidRequestException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An update attempted to change the job execution to a state that is invalid because of the job
      # execution's current state (for example, an attempt to change a request in state SUCCESS to state
      # IN_PROGRESS). In this case, the body of the error message also contains the executionState field.

      struct InvalidStateTransitionException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Contains data about a job execution.

      struct JobExecution
        include JSON::Serializable

        # The estimated number of seconds that remain before the job execution status will be changed to
        # TIMED_OUT . The actual job execution timeout can occur up to 60 seconds later than the estimated
        # duration.

        @[JSON::Field(key: "approximateSecondsBeforeTimedOut")]
        getter approximate_seconds_before_timed_out : Int64?

        # A number that identifies a particular job execution on a particular device. It can be used later in
        # commands that return or update job execution information.

        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        # The content of the job document.

        @[JSON::Field(key: "jobDocument")]
        getter job_document : String?

        # The unique identifier you assigned to this job when it was created.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The time, in seconds since the epoch, when the job execution was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Int64?

        # The time, in seconds since the epoch, when the job execution was enqueued.

        @[JSON::Field(key: "queuedAt")]
        getter queued_at : Int64?

        # The time, in seconds since the epoch, when the job execution was started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS", "FAILED", "SUCCESS",
        # "CANCELED", "TIMED_OUT", "REJECTED", or "REMOVED".

        @[JSON::Field(key: "status")]
        getter status : String?

        # A collection of name/value pairs that describe the status of the job execution. The maximum length
        # of the value in the name/value pair is 1,024 characters.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Hash(String, String)?

        # The name of the thing that is executing the job.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String?

        # The version of the job execution. Job execution versions are incremented each time they are updated
        # by a device.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @approximate_seconds_before_timed_out : Int64? = nil,
          @execution_number : Int64? = nil,
          @job_document : String? = nil,
          @job_id : String? = nil,
          @last_updated_at : Int64? = nil,
          @queued_at : Int64? = nil,
          @started_at : Int64? = nil,
          @status : String? = nil,
          @status_details : Hash(String, String)? = nil,
          @thing_name : String? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # Contains data about the state of a job execution.

      struct JobExecutionState
        include JSON::Serializable

        # The status of the job execution. Can be one of: "QUEUED", "IN_PROGRESS", "FAILED", "SUCCESS",
        # "CANCELED", "TIMED_OUT", "REJECTED", or "REMOVED".

        @[JSON::Field(key: "status")]
        getter status : String?

        # A collection of name/value pairs that describe the status of the job execution. The maximum length
        # of the value in the name/value pair is 1,024 characters.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Hash(String, String)?

        # The version of the job execution. Job execution versions are incremented each time they are updated
        # by a device.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @status : String? = nil,
          @status_details : Hash(String, String)? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # Contains a subset of information about a job execution.

      struct JobExecutionSummary
        include JSON::Serializable

        # A number that identifies a particular job execution on a particular device.

        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        # The unique identifier you assigned to this job when it was created.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        # The time, in seconds since the epoch, when the job execution was last updated.

        @[JSON::Field(key: "lastUpdatedAt")]
        getter last_updated_at : Int64?

        # The time, in seconds since the epoch, when the job execution was enqueued.

        @[JSON::Field(key: "queuedAt")]
        getter queued_at : Int64?

        # The time, in seconds since the epoch, when the job execution started.

        @[JSON::Field(key: "startedAt")]
        getter started_at : Int64?

        # The version of the job execution. Job execution versions are incremented each time IoT Jobs receives
        # an update from a device.

        @[JSON::Field(key: "versionNumber")]
        getter version_number : Int64?

        def initialize(
          @execution_number : Int64? = nil,
          @job_id : String? = nil,
          @last_updated_at : Int64? = nil,
          @queued_at : Int64? = nil,
          @started_at : Int64? = nil,
          @version_number : Int64? = nil
        )
        end
      end

      # The specified resource does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service quota has been exceeded for this request.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The service is temporarily unavailable.

      struct ServiceUnavailableException
        include JSON::Serializable

        # The message for the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartCommandExecutionRequest
        include JSON::Serializable

        # The Amazon Resource Number (ARN) of the command. For example,
        # arn:aws:iot:&lt;region&gt;:&lt;accountid&gt;:command/&lt;commandName&gt;

        @[JSON::Field(key: "commandArn")]
        getter command_arn : String

        # The Amazon Resource Number (ARN) of the device where the command execution is occurring.

        @[JSON::Field(key: "targetArn")]
        getter target_arn : String

        # The client token is used to implement idempotency. It ensures that the request completes no more
        # than one time. If you retry a request with the same token and the same parameters, the request will
        # complete successfully. However, if you retry the request using the same token but different
        # parameters, an HTTP 409 conflict occurs. If you omit this value, Amazon Web Services SDKs will
        # automatically generate a unique client request.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # Specifies the amount of time in second the device has to finish the command execution. A timer is
        # started as soon as the command execution is created. If the command execution status is not set to
        # another terminal state before the timer expires, it will automatically update to TIMED_OUT .

        @[JSON::Field(key: "executionTimeoutSeconds")]
        getter execution_timeout_seconds : Int64?

        # A list of parameters that are required by the StartCommandExecution API when performing the command
        # on a device.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::CommandParameterValue)?

        def initialize(
          @command_arn : String,
          @target_arn : String,
          @client_token : String? = nil,
          @execution_timeout_seconds : Int64? = nil,
          @parameters : Hash(String, Types::CommandParameterValue)? = nil
        )
        end
      end


      struct StartCommandExecutionResponse
        include JSON::Serializable

        # A unique identifier for the command execution.

        @[JSON::Field(key: "executionId")]
        getter execution_id : String?

        def initialize(
          @execution_id : String? = nil
        )
        end
      end


      struct StartNextPendingJobExecutionRequest
        include JSON::Serializable

        # The name of the thing associated with the device.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # A collection of name/value pairs that describe the status of the job execution. If not specified,
        # the statusDetails are unchanged. The maximum length of the value in the name/value pair is 1,024
        # characters.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Hash(String, String)?

        # Specifies the amount of time this device has to finish execution of this job. If the job execution
        # status is not set to a terminal state before this timer expires, or before the timer is reset (by
        # calling UpdateJobExecution , setting the status to IN_PROGRESS , and specifying a new timeout value
        # in field stepTimeoutInMinutes ) the job execution status will be automatically set to TIMED_OUT .
        # Note that setting the step timeout has no effect on the in progress timeout that may have been
        # specified when the job was created ( CreateJob using field timeoutConfig ). Valid values for this
        # parameter range from 1 to 10080 (1 minute to 7 days).

        @[JSON::Field(key: "stepTimeoutInMinutes")]
        getter step_timeout_in_minutes : Int64?

        def initialize(
          @thing_name : String,
          @status_details : Hash(String, String)? = nil,
          @step_timeout_in_minutes : Int64? = nil
        )
        end
      end


      struct StartNextPendingJobExecutionResponse
        include JSON::Serializable

        # A JobExecution object.

        @[JSON::Field(key: "execution")]
        getter execution : Types::JobExecution?

        def initialize(
          @execution : Types::JobExecution? = nil
        )
        end
      end

      # The job is in a terminal state.

      struct TerminalStateException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The rate exceeds the limit.

      struct ThrottlingException
        include JSON::Serializable

        # The message associated with the exception.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The payload associated with the exception.

        @[JSON::Field(key: "payload")]
        getter payload : Bytes?

        def initialize(
          @message : String? = nil,
          @payload : Bytes? = nil
        )
        end
      end


      struct UpdateJobExecutionRequest
        include JSON::Serializable

        # The unique identifier assigned to this job when it was created.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # The new status for the job execution (IN_PROGRESS, FAILED, SUCCESS, or REJECTED). This must be
        # specified on every update.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the thing associated with the device.

        @[JSON::Field(key: "thingName")]
        getter thing_name : String

        # Optional. A number that identifies a particular job execution on a particular device.

        @[JSON::Field(key: "executionNumber")]
        getter execution_number : Int64?

        # Optional. The expected current version of the job execution. Each time you update the job execution,
        # its version is incremented. If the version of the job execution stored in Jobs does not match, the
        # update is rejected with a VersionMismatch error, and an ErrorResponse that contains the current job
        # execution status data is returned. (This makes it unnecessary to perform a separate
        # DescribeJobExecution request in order to obtain the job execution status data.)

        @[JSON::Field(key: "expectedVersion")]
        getter expected_version : Int64?

        # Optional. When set to true, the response contains the job document. The default is false.

        @[JSON::Field(key: "includeJobDocument")]
        getter include_job_document : Bool?

        # Optional. When included and set to true, the response contains the JobExecutionState data. The
        # default is false.

        @[JSON::Field(key: "includeJobExecutionState")]
        getter include_job_execution_state : Bool?

        # Optional. A collection of name/value pairs that describe the status of the job execution. If not
        # specified, the statusDetails are unchanged. The maximum length of the value in the name/value pair
        # is 1,024 characters.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Hash(String, String)?

        # Specifies the amount of time this device has to finish execution of this job. If the job execution
        # status is not set to a terminal state before this timer expires, or before the timer is reset (by
        # again calling UpdateJobExecution , setting the status to IN_PROGRESS , and specifying a new timeout
        # value in this field) the job execution status will be automatically set to TIMED_OUT . Note that
        # setting or resetting the step timeout has no effect on the in progress timeout that may have been
        # specified when the job was created ( CreateJob using field timeoutConfig ). Valid values for this
        # parameter range from 1 to 10080 (1 minute to 7 days). A value of -1 is also valid and will cancel
        # the current step timer (created by an earlier use of UpdateJobExecutionRequest ).

        @[JSON::Field(key: "stepTimeoutInMinutes")]
        getter step_timeout_in_minutes : Int64?

        def initialize(
          @job_id : String,
          @status : String,
          @thing_name : String,
          @execution_number : Int64? = nil,
          @expected_version : Int64? = nil,
          @include_job_document : Bool? = nil,
          @include_job_execution_state : Bool? = nil,
          @status_details : Hash(String, String)? = nil,
          @step_timeout_in_minutes : Int64? = nil
        )
        end
      end


      struct UpdateJobExecutionResponse
        include JSON::Serializable

        # A JobExecutionState object.

        @[JSON::Field(key: "executionState")]
        getter execution_state : Types::JobExecutionState?

        # The contents of the Job Documents.

        @[JSON::Field(key: "jobDocument")]
        getter job_document : String?

        def initialize(
          @execution_state : Types::JobExecutionState? = nil,
          @job_document : String? = nil
        )
        end
      end

      # A validation error occurred when performing the API request.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end
    end
  end
end
