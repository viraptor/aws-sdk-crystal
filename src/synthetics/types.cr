require "json"
require "time"

module Aws
  module Synthetics
    module Types

      # You don't have permission to perform this operation on this resource.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure that contains the configuration for canary artifacts, including the encryption-at-rest
      # settings for artifacts that the canary uploads to Amazon S3.

      struct ArtifactConfigInput
        include JSON::Serializable

        # A structure that contains the configuration of the encryption-at-rest settings for artifacts that
        # the canary uploads to Amazon S3. Artifact encryption functionality is available only for canaries
        # that use Synthetics runtime version syn-nodejs-puppeteer-3.3 or later. For more information, see
        # Encrypting canary artifacts

        @[JSON::Field(key: "S3Encryption")]
        getter s3_encryption : Types::S3EncryptionConfig?

        def initialize(
          @s3_encryption : Types::S3EncryptionConfig? = nil
        )
        end
      end

      # A structure that contains the configuration for canary artifacts, including the encryption-at-rest
      # settings for artifacts that the canary uploads to Amazon S3.

      struct ArtifactConfigOutput
        include JSON::Serializable

        # A structure that contains the configuration of encryption settings for canary artifacts that are
        # stored in Amazon S3.

        @[JSON::Field(key: "S3Encryption")]
        getter s3_encryption : Types::S3EncryptionConfig?

        def initialize(
          @s3_encryption : Types::S3EncryptionConfig? = nil
        )
        end
      end


      struct AssociateResourceRequest
        include JSON::Serializable

        # Specifies the group. You can specify the group name, the ARN, or the group ID as the GroupIdentifier
        # .

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # The ARN of the canary that you want to associate with the specified group.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @group_identifier : String,
          @resource_arn : String
        )
        end
      end


      struct AssociateResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # The request was not valid.

      struct BadRequestException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A structure representing a screenshot that is used as a baseline during visual monitoring
      # comparisons made by the canary.

      struct BaseScreenshot
        include JSON::Serializable

        # The name of the screenshot. This is generated the first time the canary is run after the
        # UpdateCanary operation that specified for this canary to perform visual monitoring.

        @[JSON::Field(key: "ScreenshotName")]
        getter screenshot_name : String

        # Coordinates that define the part of a screen to ignore during screenshot comparisons. To obtain the
        # coordinates to use here, use the CloudWatch console to draw the boundaries on the screen. For more
        # information, see Editing or deleting a canary

        @[JSON::Field(key: "IgnoreCoordinates")]
        getter ignore_coordinates : Array(String)?

        def initialize(
          @screenshot_name : String,
          @ignore_coordinates : Array(String)? = nil
        )
        end
      end

      # A structure that specifies the browser type to use for a canary run.

      struct BrowserConfig
        include JSON::Serializable

        # The browser type associated with this browser configuration.

        @[JSON::Field(key: "BrowserType")]
        getter browser_type : String?

        def initialize(
          @browser_type : String? = nil
        )
        end
      end

      # This structure contains all information about one canary in your account.

      struct Canary
        include JSON::Serializable

        # A structure that contains the configuration for canary artifacts, including the encryption-at-rest
        # settings for artifacts that the canary uploads to Amazon S3.

        @[JSON::Field(key: "ArtifactConfig")]
        getter artifact_config : Types::ArtifactConfigOutput?

        # The location in Amazon S3 where Synthetics stores artifacts from the runs of this canary. Artifacts
        # include the log file, screenshots, and HAR files.

        @[JSON::Field(key: "ArtifactS3Location")]
        getter artifact_s3_location : String?

        # A structure that specifies the browser type to use for a canary run. CloudWatch Synthetics supports
        # running canaries on both CHROME and FIREFOX browsers. If not specified, browserConfigs defaults to
        # Chrome.

        @[JSON::Field(key: "BrowserConfigs")]
        getter browser_configs : Array(Types::BrowserConfig)?


        @[JSON::Field(key: "Code")]
        getter code : Types::CanaryCodeOutput?

        # Returns the dry run configurations for a canary.

        @[JSON::Field(key: "DryRunConfig")]
        getter dry_run_config : Types::DryRunConfigOutput?

        # The ARN of the Lambda function that is used as your canary's engine. For more information about
        # Lambda ARN format, see Resources and Conditions for Lambda Actions .

        @[JSON::Field(key: "EngineArn")]
        getter engine_arn : String?

        # A list of engine configurations for the canary, one for each browser type that the canary is
        # configured to run on. All runtime versions syn-nodejs-puppeteer-11.0 and above, and
        # syn-nodejs-playwright-3.0 and above, use engineConfigs only. You can no longer use engineArn in
        # these versions. Runtime versions older than syn-nodejs-puppeteer-11.0 and syn-nodejs-playwright-3.0
        # continue to support engineArn to ensure backward compatibility.

        @[JSON::Field(key: "EngineConfigs")]
        getter engine_configs : Array(Types::EngineConfig)?

        # The ARN of the IAM role used to run the canary. This role must include lambda.amazonaws.com as a
        # principal in the trust policy.

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The number of days to retain data about failed runs of this canary. This setting affects the range
        # of information returned by GetCanaryRuns , as well as the range of information displayed in the
        # Synthetics console.

        @[JSON::Field(key: "FailureRetentionPeriodInDays")]
        getter failure_retention_period_in_days : Int32?

        # The unique ID of this canary.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the canary.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # Specifies whether to also delete the Lambda functions and layers used by this canary when the canary
        # is deleted. If it is AUTOMATIC , the Lambda functions and layers will be deleted when the canary is
        # deleted. If the value of this parameter is OFF , then the value of the DeleteLambda parameter of the
        # DeleteCanary operation determines whether the Lambda functions and layers will be deleted.

        @[JSON::Field(key: "ProvisionedResourceCleanup")]
        getter provisioned_resource_cleanup : String?


        @[JSON::Field(key: "RunConfig")]
        getter run_config : Types::CanaryRunConfigOutput?

        # Specifies the runtime version to use for the canary. For more information about runtime versions,
        # see Canary Runtime Versions .

        @[JSON::Field(key: "RuntimeVersion")]
        getter runtime_version : String?

        # A structure that contains information about how often the canary is to run, and when these runs are
        # to stop.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::CanaryScheduleOutput?

        # A structure that contains information about the canary's status.

        @[JSON::Field(key: "Status")]
        getter status : Types::CanaryStatus?

        # The number of days to retain data about successful runs of this canary. This setting affects the
        # range of information returned by GetCanaryRuns , as well as the range of information displayed in
        # the Synthetics console.

        @[JSON::Field(key: "SuccessRetentionPeriodInDays")]
        getter success_retention_period_in_days : Int32?

        # The list of key-value pairs that are associated with the canary.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # A structure that contains information about when the canary was created, modified, and most recently
        # run.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::CanaryTimeline?

        # If this canary performs visual monitoring by comparing screenshots, this structure contains the ID
        # of the canary run to use as the baseline for screenshots, and the coordinates of any parts of the
        # screen to ignore during the visual monitoring comparison.

        @[JSON::Field(key: "VisualReference")]
        getter visual_reference : Types::VisualReferenceOutput?

        # A list of visual reference configurations for the canary, one for each browser type that the canary
        # is configured to run on. Visual references are used for visual monitoring comparisons.
        # syn-nodejs-puppeteer-11.0 and above, and syn-nodejs-playwright-3.0 and above, only supports
        # visualReferences . visualReference field is not supported. Versions older than
        # syn-nodejs-puppeteer-11.0 supports both visualReference and visualReferences for backward
        # compatibility. It is recommended to use visualReferences for consistency and future compatibility.

        @[JSON::Field(key: "VisualReferences")]
        getter visual_references : Array(Types::VisualReferenceOutput)?


        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfigOutput?

        def initialize(
          @artifact_config : Types::ArtifactConfigOutput? = nil,
          @artifact_s3_location : String? = nil,
          @browser_configs : Array(Types::BrowserConfig)? = nil,
          @code : Types::CanaryCodeOutput? = nil,
          @dry_run_config : Types::DryRunConfigOutput? = nil,
          @engine_arn : String? = nil,
          @engine_configs : Array(Types::EngineConfig)? = nil,
          @execution_role_arn : String? = nil,
          @failure_retention_period_in_days : Int32? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @provisioned_resource_cleanup : String? = nil,
          @run_config : Types::CanaryRunConfigOutput? = nil,
          @runtime_version : String? = nil,
          @schedule : Types::CanaryScheduleOutput? = nil,
          @status : Types::CanaryStatus? = nil,
          @success_retention_period_in_days : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @timeline : Types::CanaryTimeline? = nil,
          @visual_reference : Types::VisualReferenceOutput? = nil,
          @visual_references : Array(Types::VisualReferenceOutput)? = nil,
          @vpc_config : Types::VpcConfigOutput? = nil
        )
        end
      end

      # Use this structure to input your script code for the canary. This structure contains the Lambda
      # handler with the location where the canary should start running the script. If the script is stored
      # in an Amazon S3 bucket, the bucket name, key, and version are also included. If the script was
      # passed into the canary directly, the script code is contained in the value of Zipfile . If you are
      # uploading your canary scripts with an Amazon S3 bucket, your zip file should include your script in
      # a certain folder structure. For Node.js canaries, the folder structure must be nodejs/node_modules/
      # myCanaryFilename.js For more information, see Packaging your Node.js canary files For Python
      # canaries, the folder structure must be python/ myCanaryFilename.py or python/
      # myFolder/myCanaryFilename.py For more information, see Packaging your Python canary files

      struct CanaryCodeInput
        include JSON::Serializable

        # BlueprintTypes is a list of templates that enable simplified canary creation. You can create
        # canaries for common monitoring scenarios by providing only a JSON configuration file instead of
        # writing custom scripts. The only supported value is multi-checks . Multi-checks monitors
        # HTTP/DNS/SSL/TCP endpoints with built-in authentication schemes (Basic, API Key, OAuth, SigV4) and
        # assertion capabilities. When you specify BlueprintTypes , the Handler field cannot be specified
        # since the blueprint provides a pre-defined entry point. BlueprintTypes is supported only on canaries
        # for syn-nodejs-3.0 runtime or later.

        @[JSON::Field(key: "BlueprintTypes")]
        getter blueprint_types : Array(String)?

        # A list of dependencies that should be used for running this canary. Specify the dependencies as a
        # key-value pair, where the key is the type of dependency and the value is the dependency reference.

        @[JSON::Field(key: "Dependencies")]
        getter dependencies : Array(Types::Dependency)?

        # The entry point to use for the source code when running the canary. For canaries that use the
        # syn-python-selenium-1.0 runtime or a syn-nodejs.puppeteer runtime earlier than
        # syn-nodejs.puppeteer-3.4 , the handler must be specified as fileName .handler . For
        # syn-python-selenium-1.1 , syn-nodejs.puppeteer-3.4 , and later runtimes, the handler can be
        # specified as fileName . functionName , or you can specify a folder where canary scripts reside as
        # folder / fileName . functionName . This field is required when you don't specify BlueprintTypes and
        # is not allowed when you specify BlueprintTypes .

        @[JSON::Field(key: "Handler")]
        getter handler : String?

        # If your canary script is located in Amazon S3, specify the bucket name here. Do not include s3:// as
        # the start of the bucket name.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key of your script. For more information, see Working with Amazon S3 Objects .

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        # The Amazon S3 version ID of your script.

        @[JSON::Field(key: "S3Version")]
        getter s3_version : String?

        # If you input your canary script directly into the canary instead of referring to an Amazon S3
        # location, the value of this parameter is the base64-encoded contents of the .zip file that contains
        # the script. It must be smaller than 225 Kb. For large canary scripts, we recommend that you use an
        # Amazon S3 location instead of inputting it directly with this parameter.

        @[JSON::Field(key: "ZipFile")]
        getter zip_file : Bytes?

        def initialize(
          @blueprint_types : Array(String)? = nil,
          @dependencies : Array(Types::Dependency)? = nil,
          @handler : String? = nil,
          @s3_bucket : String? = nil,
          @s3_key : String? = nil,
          @s3_version : String? = nil,
          @zip_file : Bytes? = nil
        )
        end
      end

      # This structure contains information about the canary's Lambda handler and where its code is stored
      # by CloudWatch Synthetics.

      struct CanaryCodeOutput
        include JSON::Serializable

        # BlueprintTypes is a list of templates that enable simplified canary creation. You can create
        # canaries for common monitoring scenarios by providing only a JSON configuration file instead of
        # writing custom scripts. The only supported value is multi-checks . Multi-checks monitors
        # HTTP/DNS/SSL/TCP endpoints with built-in authentication schemes (Basic, API Key, OAuth, SigV4) and
        # assertion capabilities. When you specify BlueprintTypes , the Handler field cannot be specified
        # since the blueprint provides a pre-defined entry point. BlueprintTypes is supported only on canaries
        # for syn-nodejs-3.0 runtime or later.

        @[JSON::Field(key: "BlueprintTypes")]
        getter blueprint_types : Array(String)?

        # A list of dependencies that are used for running this canary. The dependencies are specified as a
        # key-value pair, where the key is the type of dependency and the value is the dependency reference.

        @[JSON::Field(key: "Dependencies")]
        getter dependencies : Array(Types::Dependency)?

        # The entry point to use for the source code when running the canary. This field is required when you
        # don't specify BlueprintTypes and is not allowed when you specify BlueprintTypes .

        @[JSON::Field(key: "Handler")]
        getter handler : String?

        # The ARN of the Lambda layer where Synthetics stores the canary script code.

        @[JSON::Field(key: "SourceLocationArn")]
        getter source_location_arn : String?

        def initialize(
          @blueprint_types : Array(String)? = nil,
          @dependencies : Array(Types::Dependency)? = nil,
          @handler : String? = nil,
          @source_location_arn : String? = nil
        )
        end
      end

      # Returns the dry run configurations set for a canary.

      struct CanaryDryRunConfigOutput
        include JSON::Serializable

        # The DryRunId associated with an existing canary’s dry run. You can use this DryRunId to retrieve
        # information about the dry run.

        @[JSON::Field(key: "DryRunId")]
        getter dry_run_id : String?

        def initialize(
          @dry_run_id : String? = nil
        )
        end
      end

      # This structure contains information about the most recent run of a single canary.

      struct CanaryLastRun
        include JSON::Serializable

        # The name of the canary.

        @[JSON::Field(key: "CanaryName")]
        getter canary_name : String?

        # The results from this canary's most recent run.

        @[JSON::Field(key: "LastRun")]
        getter last_run : Types::CanaryRun?

        def initialize(
          @canary_name : String? = nil,
          @last_run : Types::CanaryRun? = nil
        )
        end
      end

      # This structure contains the details about one run of one canary.

      struct CanaryRun
        include JSON::Serializable

        # The location where the canary stored artifacts from the run. Artifacts include the log file,
        # screenshots, and HAR files.

        @[JSON::Field(key: "ArtifactS3Location")]
        getter artifact_s3_location : String?

        # The browser type associated with this canary run.

        @[JSON::Field(key: "BrowserType")]
        getter browser_type : String?

        # Returns the dry run configurations for a canary.

        @[JSON::Field(key: "DryRunConfig")]
        getter dry_run_config : Types::CanaryDryRunConfigOutput?

        # A unique ID that identifies this canary run.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the canary.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The count in number of the retry attempt.

        @[JSON::Field(key: "RetryAttempt")]
        getter retry_attempt : Int32?

        # The ID of the scheduled canary run.

        @[JSON::Field(key: "ScheduledRunId")]
        getter scheduled_run_id : String?

        # The status of this run.

        @[JSON::Field(key: "Status")]
        getter status : Types::CanaryRunStatus?

        # A structure that contains the start and end times of this run.

        @[JSON::Field(key: "Timeline")]
        getter timeline : Types::CanaryRunTimeline?

        def initialize(
          @artifact_s3_location : String? = nil,
          @browser_type : String? = nil,
          @dry_run_config : Types::CanaryDryRunConfigOutput? = nil,
          @id : String? = nil,
          @name : String? = nil,
          @retry_attempt : Int32? = nil,
          @scheduled_run_id : String? = nil,
          @status : Types::CanaryRunStatus? = nil,
          @timeline : Types::CanaryRunTimeline? = nil
        )
        end
      end

      # A structure that contains input information for a canary run.

      struct CanaryRunConfigInput
        include JSON::Serializable

        # Specifies whether this canary is to use active X-Ray tracing when it runs. Active tracing enables
        # this canary run to be displayed in the ServiceLens and X-Ray service maps even if the canary does
        # not hit an endpoint that has X-Ray tracing enabled. Using X-Ray tracing incurs charges. For more
        # information, see Canaries and X-Ray tracing . You can enable active tracing only for canaries that
        # use version syn-nodejs-2.0 or later for their canary runtime.

        @[JSON::Field(key: "ActiveTracing")]
        getter active_tracing : Bool?

        # Specifies the keys and values to use for any environment variables used in the canary script. Use
        # the following format: { "key1" : "value1", "key2" : "value2", ...} Keys must start with a letter and
        # be at least two characters. The total size of your environment variables cannot exceed 4 KB. You
        # can't specify any Lambda reserved environment variables as the keys for your environment variables.
        # For more information about reserved keys, see Runtime environment variables . Environment variable
        # keys and values are encrypted at rest using Amazon Web Services owned KMS keys. However, the
        # environment variables are not encrypted on the client side. Do not store sensitive information in
        # them.

        @[JSON::Field(key: "EnvironmentVariables")]
        getter environment_variables : Hash(String, String)?

        # Specifies the amount of ephemeral storage (in MB) to allocate for the canary run during execution.
        # This temporary storage is used for storing canary run artifacts (which are uploaded to an Amazon S3
        # bucket at the end of the run), and any canary browser operations. This temporary storage is cleared
        # after the run is completed. Default storage value is 1024 MB.

        @[JSON::Field(key: "EphemeralStorage")]
        getter ephemeral_storage : Int32?

        # The maximum amount of memory available to the canary while it is running, in MB. This value must be
        # a multiple of 64.

        @[JSON::Field(key: "MemoryInMB")]
        getter memory_in_mb : Int32?

        # How long the canary is allowed to run before it must stop. You can't set this time to be longer than
        # the frequency of the runs of this canary. If you omit this field, the frequency of the canary is
        # used as this value, up to a maximum of 14 minutes.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @active_tracing : Bool? = nil,
          @environment_variables : Hash(String, String)? = nil,
          @ephemeral_storage : Int32? = nil,
          @memory_in_mb : Int32? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # A structure that contains information about a canary run.

      struct CanaryRunConfigOutput
        include JSON::Serializable

        # Displays whether this canary run used active X-Ray tracing.

        @[JSON::Field(key: "ActiveTracing")]
        getter active_tracing : Bool?

        # Specifies the amount of ephemeral storage (in MB) to allocate for the canary run during execution.
        # This temporary storage is used for storing canary run artifacts (which are uploaded to an Amazon S3
        # bucket at the end of the run), and any canary browser operations. This temporary storage is cleared
        # after the run is completed. Default storage value is 1024 MB.

        @[JSON::Field(key: "EphemeralStorage")]
        getter ephemeral_storage : Int32?

        # The maximum amount of memory available to the canary while it is running, in MB. This value must be
        # a multiple of 64.

        @[JSON::Field(key: "MemoryInMB")]
        getter memory_in_mb : Int32?

        # How long the canary is allowed to run before it must stop.

        @[JSON::Field(key: "TimeoutInSeconds")]
        getter timeout_in_seconds : Int32?

        def initialize(
          @active_tracing : Bool? = nil,
          @ephemeral_storage : Int32? = nil,
          @memory_in_mb : Int32? = nil,
          @timeout_in_seconds : Int32? = nil
        )
        end
      end

      # This structure contains the status information about a canary run.

      struct CanaryRunStatus
        include JSON::Serializable

        # The current state of the run.

        @[JSON::Field(key: "State")]
        getter state : String?

        # If run of the canary failed, this field contains the reason for the error.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # If this value is CANARY_FAILURE , either the canary script failed or Synthetics ran into a fatal
        # error when running the canary. For example, a canary timeout misconfiguration setting can cause the
        # canary to timeout before Synthetics can evaluate its status. If this value is EXECUTION_FAILURE , a
        # non-critical failure occurred such as failing to save generated debug artifacts (for example,
        # screenshots or har files). If both types of failures occurred, the CANARY_FAILURE takes precedence.
        # To understand the exact error, use the StateReason API.

        @[JSON::Field(key: "StateReasonCode")]
        getter state_reason_code : String?

        # Specifies the status of canary script for this run. When Synthetics tries to determine the status
        # but fails, the result is marked as UNKNOWN . For the overall status of canary run, see State .

        @[JSON::Field(key: "TestResult")]
        getter test_result : String?

        def initialize(
          @state : String? = nil,
          @state_reason : String? = nil,
          @state_reason_code : String? = nil,
          @test_result : String? = nil
        )
        end
      end

      # This structure contains the start and end times of a single canary run.

      struct CanaryRunTimeline
        include JSON::Serializable

        # The end time of the run.

        @[JSON::Field(key: "Completed")]
        getter completed : Time?

        # The time at which the metrics will be generated for this run or retries.

        @[JSON::Field(key: "MetricTimestampForRunAndRetries")]
        getter metric_timestamp_for_run_and_retries : Time?

        # The start time of the run.

        @[JSON::Field(key: "Started")]
        getter started : Time?

        def initialize(
          @completed : Time? = nil,
          @metric_timestamp_for_run_and_retries : Time? = nil,
          @started : Time? = nil
        )
        end
      end

      # This structure specifies how often a canary is to make runs and the date and time when it should
      # stop making runs.

      struct CanaryScheduleInput
        include JSON::Serializable

        # A rate expression or a cron expression that defines how often the canary is to run. For a rate
        # expression, The syntax is rate( number unit ) . unit can be minute , minutes , or hour . For
        # example, rate(1 minute) runs the canary once a minute, rate(10 minutes) runs it once every 10
        # minutes, and rate(1 hour) runs it once every hour. You can specify a frequency between rate(1
        # minute) and rate(1 hour) . Specifying rate(0 minute) or rate(0 hour) is a special value that causes
        # the canary to run only once when it is started. Use cron( expression ) to specify a cron expression.
        # You can't schedule a canary to wait for more than a year before running. For information about the
        # syntax for cron expressions, see Scheduling canary runs using cron .

        @[JSON::Field(key: "Expression")]
        getter expression : String

        # How long, in seconds, for the canary to continue making regular runs according to the schedule in
        # the Expression value. If you specify 0, the canary continues making runs until you stop it. If you
        # omit this field, the default of 0 is used.

        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int64?

        # A structure that contains the retry configuration for a canary

        @[JSON::Field(key: "RetryConfig")]
        getter retry_config : Types::RetryConfigInput?

        def initialize(
          @expression : String,
          @duration_in_seconds : Int64? = nil,
          @retry_config : Types::RetryConfigInput? = nil
        )
        end
      end

      # How long, in seconds, for the canary to continue making regular runs according to the schedule in
      # the Expression value.

      struct CanaryScheduleOutput
        include JSON::Serializable

        # How long, in seconds, for the canary to continue making regular runs after it was created. The runs
        # are performed according to the schedule in the Expression value.

        @[JSON::Field(key: "DurationInSeconds")]
        getter duration_in_seconds : Int64?

        # A rate expression or a cron expression that defines how often the canary is to run. For a rate
        # expression, The syntax is rate( number unit ) . unit can be minute , minutes , or hour . For
        # example, rate(1 minute) runs the canary once a minute, rate(10 minutes) runs it once every 10
        # minutes, and rate(1 hour) runs it once every hour. You can specify a frequency between rate(1
        # minute) and rate(1 hour) . Specifying rate(0 minute) or rate(0 hour) is a special value that causes
        # the canary to run only once when it is started. Use cron( expression ) to specify a cron expression.
        # For information about the syntax for cron expressions, see Scheduling canary runs using cron .

        @[JSON::Field(key: "Expression")]
        getter expression : String?

        # A structure that contains the retry configuration for a canary

        @[JSON::Field(key: "RetryConfig")]
        getter retry_config : Types::RetryConfigOutput?

        def initialize(
          @duration_in_seconds : Int64? = nil,
          @expression : String? = nil,
          @retry_config : Types::RetryConfigOutput? = nil
        )
        end
      end

      # A structure that contains the current state of the canary.

      struct CanaryStatus
        include JSON::Serializable

        # The current state of the canary.

        @[JSON::Field(key: "State")]
        getter state : String?

        # If the canary creation or update failed, this field provides details on the failure.

        @[JSON::Field(key: "StateReason")]
        getter state_reason : String?

        # If the canary creation or update failed, this field displays the reason code.

        @[JSON::Field(key: "StateReasonCode")]
        getter state_reason_code : String?

        def initialize(
          @state : String? = nil,
          @state_reason : String? = nil,
          @state_reason_code : String? = nil
        )
        end
      end

      # This structure contains information about when the canary was created and modified.

      struct CanaryTimeline
        include JSON::Serializable

        # The date and time the canary was created.

        @[JSON::Field(key: "Created")]
        getter created : Time?

        # The date and time the canary was most recently modified.

        @[JSON::Field(key: "LastModified")]
        getter last_modified : Time?

        # The date and time that the canary's most recent run started.

        @[JSON::Field(key: "LastStarted")]
        getter last_started : Time?

        # The date and time that the canary's most recent run ended.

        @[JSON::Field(key: "LastStopped")]
        getter last_stopped : Time?

        def initialize(
          @created : Time? = nil,
          @last_modified : Time? = nil,
          @last_started : Time? = nil,
          @last_stopped : Time? = nil
        )
        end
      end

      # A conflicting operation is already in progress.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct CreateCanaryRequest
        include JSON::Serializable

        # The location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary.
        # Artifacts include the log file, screenshots, and HAR files. The name of the Amazon S3 bucket can't
        # include a period (.).

        @[JSON::Field(key: "ArtifactS3Location")]
        getter artifact_s3_location : String

        # A structure that includes the entry point from which the canary should start running your script. If
        # the script is stored in an Amazon S3 bucket, the bucket name, key, and version are also included.

        @[JSON::Field(key: "Code")]
        getter code : Types::CanaryCodeInput

        # The ARN of the IAM role to be used to run the canary. This role must already exist, and must include
        # lambda.amazonaws.com as a principal in the trust policy. The role must also have the following
        # permissions: s3:PutObject s3:GetBucketLocation s3:ListAllMyBuckets cloudwatch:PutMetricData
        # logs:CreateLogGroup logs:CreateLogStream logs:PutLogEvents

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String

        # The name for this canary. Be sure to give it a descriptive name that distinguishes it from other
        # canaries in your account. Do not include secrets or proprietary information in your canary names.
        # The canary name makes up part of the canary ARN, and the ARN is included in outbound calls over the
        # internet. For more information, see Security Considerations for Synthetics Canaries .

        @[JSON::Field(key: "Name")]
        getter name : String

        # Specifies the runtime version to use for the canary. For a list of valid runtime versions and more
        # information about runtime versions, see Canary Runtime Versions .

        @[JSON::Field(key: "RuntimeVersion")]
        getter runtime_version : String

        # A structure that contains information about how often the canary is to run and when these test runs
        # are to stop.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::CanaryScheduleInput

        # A structure that contains the configuration for canary artifacts, including the encryption-at-rest
        # settings for artifacts that the canary uploads to Amazon S3.

        @[JSON::Field(key: "ArtifactConfig")]
        getter artifact_config : Types::ArtifactConfigInput?

        # CloudWatch Synthetics now supports multibrowser canaries for syn-nodejs-puppeteer-11.0 and
        # syn-nodejs-playwright-3.0 runtimes. This feature allows you to run your canaries on both Firefox and
        # Chrome browsers. To create a multibrowser canary, you need to specify the BrowserConfigs with a list
        # of browsers you want to use. If not specified, browserConfigs defaults to Chrome.

        @[JSON::Field(key: "BrowserConfigs")]
        getter browser_configs : Array(Types::BrowserConfig)?

        # The number of days to retain data about failed runs of this canary. If you omit this field, the
        # default of 31 days is used. The valid range is 1 to 455 days. This setting affects the range of
        # information returned by GetCanaryRuns , as well as the range of information displayed in the
        # Synthetics console.

        @[JSON::Field(key: "FailureRetentionPeriodInDays")]
        getter failure_retention_period_in_days : Int32?

        # Specifies whether to also delete the Lambda functions and layers used by this canary when the canary
        # is deleted. If you omit this parameter, the default of AUTOMATIC is used, which means that the
        # Lambda functions and layers will be deleted when the canary is deleted. If the value of this
        # parameter is OFF , then the value of the DeleteLambda parameter of the DeleteCanary operation
        # determines whether the Lambda functions and layers will be deleted.

        @[JSON::Field(key: "ProvisionedResourceCleanup")]
        getter provisioned_resource_cleanup : String?

        # To have the tags that you apply to this canary also be applied to the Lambda function that the
        # canary uses, specify this parameter with the value lambda-function . If you specify this parameter
        # and don't specify any tags in the Tags parameter, the canary creation fails.

        @[JSON::Field(key: "ResourcesToReplicateTags")]
        getter resources_to_replicate_tags : Array(String)?

        # A structure that contains the configuration for individual canary runs, such as timeout value and
        # environment variables. Environment variable keys and values are encrypted at rest using Amazon Web
        # Services owned KMS keys. However, the environment variables are not encrypted on the client side. Do
        # not store sensitive information in them.

        @[JSON::Field(key: "RunConfig")]
        getter run_config : Types::CanaryRunConfigInput?

        # The number of days to retain data about successful runs of this canary. If you omit this field, the
        # default of 31 days is used. The valid range is 1 to 455 days. This setting affects the range of
        # information returned by GetCanaryRuns , as well as the range of information displayed in the
        # Synthetics console.

        @[JSON::Field(key: "SuccessRetentionPeriodInDays")]
        getter success_retention_period_in_days : Int32?

        # A list of key-value pairs to associate with the canary. You can associate as many as 50 tags with a
        # canary. Tags can help you organize and categorize your resources. You can also use them to scope
        # user permissions, by granting a user permission to access or change only the resources that have
        # certain tag values. To have the tags that you apply to this canary also be applied to the Lambda
        # function that the canary uses, specify this parameter with the value lambda-function .

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        # If this canary is to test an endpoint in a VPC, this structure contains information about the subnet
        # and security groups of the VPC endpoint. For more information, see Running a Canary in a VPC .

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfigInput?

        def initialize(
          @artifact_s3_location : String,
          @code : Types::CanaryCodeInput,
          @execution_role_arn : String,
          @name : String,
          @runtime_version : String,
          @schedule : Types::CanaryScheduleInput,
          @artifact_config : Types::ArtifactConfigInput? = nil,
          @browser_configs : Array(Types::BrowserConfig)? = nil,
          @failure_retention_period_in_days : Int32? = nil,
          @provisioned_resource_cleanup : String? = nil,
          @resources_to_replicate_tags : Array(String)? = nil,
          @run_config : Types::CanaryRunConfigInput? = nil,
          @success_retention_period_in_days : Int32? = nil,
          @tags : Hash(String, String)? = nil,
          @vpc_config : Types::VpcConfigInput? = nil
        )
        end
      end


      struct CreateCanaryResponse
        include JSON::Serializable

        # The full details about the canary you have created.

        @[JSON::Field(key: "Canary")]
        getter canary : Types::Canary?

        def initialize(
          @canary : Types::Canary? = nil
        )
        end
      end


      struct CreateGroupRequest
        include JSON::Serializable

        # The name for the group. It can include any Unicode characters. The names for all groups in your
        # account, across all Regions, must be unique.

        @[JSON::Field(key: "Name")]
        getter name : String

        # A list of key-value pairs to associate with the group. You can associate as many as 50 tags with a
        # group. Tags can help you organize and categorize your resources. You can also use them to scope user
        # permissions, by granting a user permission to access or change only the resources that have certain
        # tag values.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateGroupResponse
        include JSON::Serializable

        # A structure that contains information about the group that was just created.

        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end


      struct DeleteCanaryRequest
        include JSON::Serializable

        # The name of the canary that you want to delete. To find the names of your canaries, use
        # DescribeCanaries .

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether to also delete the Lambda functions and layers used by this canary. The default is
        # false . Your setting for this parameter is used only if the canary doesn't have AUTOMATIC for its
        # ProvisionedResourceCleanup field. If that field is set to AUTOMATIC , then the Lambda functions and
        # layers will be deleted when this canary is deleted. Type: Boolean

        @[JSON::Field(key: "deleteLambda")]
        getter delete_lambda : Bool?

        def initialize(
          @name : String,
          @delete_lambda : Bool? = nil
        )
        end
      end


      struct DeleteCanaryResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteGroupRequest
        include JSON::Serializable

        # Specifies which group to delete. You can specify the group name, the ARN, or the group ID as the
        # GroupIdentifier .

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        def initialize(
          @group_identifier : String
        )
        end
      end


      struct DeleteGroupResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A structure that contains information about a dependency for a canary.

      struct Dependency
        include JSON::Serializable

        # The dependency reference. For Lambda layers, this is the ARN of the Lambda layer. For more
        # information about Lambda ARN format, see Lambda .

        @[JSON::Field(key: "Reference")]
        getter reference : String

        # The type of dependency. Valid value is LambdaLayer .

        @[JSON::Field(key: "Type")]
        getter type : String?

        def initialize(
          @reference : String,
          @type : String? = nil
        )
        end
      end


      struct DescribeCanariesLastRunRequest
        include JSON::Serializable

        # The type of browser to use for the canary run.

        @[JSON::Field(key: "BrowserType")]
        getter browser_type : String?

        # Specify this parameter to limit how many runs are returned each time you use the DescribeLastRun
        # operation. If you omit this parameter, the default of 100 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter to return only canaries that match the names that you specify here. You can
        # specify as many as five canary names. If you specify this parameter, the operation is successful
        # only if you have authorization to view all the canaries that you specify in your request. If you do
        # not have permission to view any of the canaries, the request fails with a 403 response. You are
        # required to use the Names parameter if you are logged on to a user or role that has an IAM policy
        # that restricts which canaries that you are allowed to view. For more information, see Limiting a
        # user to viewing specific canaries .

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # DescribeCanariesLastRun operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @browser_type : String? = nil,
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCanariesLastRunResponse
        include JSON::Serializable

        # An array that contains the information from the most recent run of each canary.

        @[JSON::Field(key: "CanariesLastRun")]
        getter canaries_last_run : Array(Types::CanaryLastRun)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # DescribeCanariesLastRun operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @canaries_last_run : Array(Types::CanaryLastRun)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCanariesRequest
        include JSON::Serializable

        # Specify this parameter to limit how many canaries are returned each time you use the
        # DescribeCanaries operation. If you omit this parameter, the default of 20 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # Use this parameter to return only canaries that match the names that you specify here. You can
        # specify as many as five canary names. If you specify this parameter, the operation is successful
        # only if you have authorization to view all the canaries that you specify in your request. If you do
        # not have permission to view any of the canaries, the request fails with a 403 response. You are
        # required to use this parameter if you are logged on to a user or role that has an IAM policy that
        # restricts which canaries that you are allowed to view. For more information, see Limiting a user to
        # viewing specific canaries .

        @[JSON::Field(key: "Names")]
        getter names : Array(String)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @names : Array(String)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeCanariesResponse
        include JSON::Serializable

        # Returns an array. Each item in the array contains the full information about one canary.

        @[JSON::Field(key: "Canaries")]
        getter canaries : Array(Types::Canary)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # DescribeCanaries operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @canaries : Array(Types::Canary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRuntimeVersionsRequest
        include JSON::Serializable

        # Specify this parameter to limit how many runs are returned each time you use the
        # DescribeRuntimeVersions operation. If you omit this parameter, the default of 100 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # DescribeRuntimeVersions operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct DescribeRuntimeVersionsResponse
        include JSON::Serializable

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # DescribeRuntimeVersions operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of objects that display the details about each Synthetics canary runtime version.

        @[JSON::Field(key: "RuntimeVersions")]
        getter runtime_versions : Array(Types::RuntimeVersion)?

        def initialize(
          @next_token : String? = nil,
          @runtime_versions : Array(Types::RuntimeVersion)? = nil
        )
        end
      end


      struct DisassociateResourceRequest
        include JSON::Serializable

        # Specifies the group. You can specify the group name, the ARN, or the group ID as the GroupIdentifier
        # .

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # The ARN of the canary that you want to remove from the specified group.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @group_identifier : String,
          @resource_arn : String
        )
        end
      end


      struct DisassociateResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Returns the dry run configurations set for a canary.

      struct DryRunConfigOutput
        include JSON::Serializable

        # The DryRunId associated with an existing canary’s dry run. You can use this DryRunId to retrieve
        # information about the dry run.

        @[JSON::Field(key: "DryRunId")]
        getter dry_run_id : String?

        # Returns the last execution status for a canary's dry run.

        @[JSON::Field(key: "LastDryRunExecutionStatus")]
        getter last_dry_run_execution_status : String?

        def initialize(
          @dry_run_id : String? = nil,
          @last_dry_run_execution_status : String? = nil
        )
        end
      end

      # A structure of engine configurations for the canary, one for each browser type that the canary is
      # configured to run on.

      struct EngineConfig
        include JSON::Serializable

        # The browser type associated with this engine configuration.

        @[JSON::Field(key: "BrowserType")]
        getter browser_type : String?

        # Each engine configuration contains the ARN of the Lambda function that is used as the canary's
        # engine for a specific browser type.

        @[JSON::Field(key: "EngineArn")]
        getter engine_arn : String?

        def initialize(
          @browser_type : String? = nil,
          @engine_arn : String? = nil
        )
        end
      end


      struct GetCanaryRequest
        include JSON::Serializable

        # The name of the canary that you want details for.

        @[JSON::Field(key: "name")]
        getter name : String

        # The DryRunId associated with an existing canary’s dry run. You can use this DryRunId to retrieve
        # information about the dry run.

        @[JSON::Field(key: "dryRunId")]
        getter dry_run_id : String?

        def initialize(
          @name : String,
          @dry_run_id : String? = nil
        )
        end
      end


      struct GetCanaryResponse
        include JSON::Serializable

        # A structure that contains the full information about the canary.

        @[JSON::Field(key: "Canary")]
        getter canary : Types::Canary?

        def initialize(
          @canary : Types::Canary? = nil
        )
        end
      end


      struct GetCanaryRunsRequest
        include JSON::Serializable

        # The name of the canary that you want to see runs for.

        @[JSON::Field(key: "name")]
        getter name : String

        # The DryRunId associated with an existing canary’s dry run. You can use this DryRunId to retrieve
        # information about the dry run.

        @[JSON::Field(key: "DryRunId")]
        getter dry_run_id : String?

        # Specify this parameter to limit how many runs are returned each time you use the GetCanaryRuns
        # operation. If you omit this parameter, the default of 100 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # GetCanaryRuns operation to retrieve the next set of results. When auto retry is enabled for the
        # canary, the first subsequent retry is suffixed with *1 indicating its the first retry and the next
        # subsequent try is suffixed with *2.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # When you provide RunType=CANARY_RUN and dryRunId , you will get an exception When a value is not
        # provided for RunType , the default value is CANARY_RUN When CANARY_RUN is provided, all canary runs
        # excluding dry runs are returned When DRY_RUN is provided, all dry runs excluding canary runs are
        # returned

        @[JSON::Field(key: "RunType")]
        getter run_type : String?

        def initialize(
          @name : String,
          @dry_run_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @run_type : String? = nil
        )
        end
      end


      struct GetCanaryRunsResponse
        include JSON::Serializable

        # An array of structures. Each structure contains the details of one of the retrieved canary runs.

        @[JSON::Field(key: "CanaryRuns")]
        getter canary_runs : Array(Types::CanaryRun)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # GetCanaryRuns operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @canary_runs : Array(Types::CanaryRun)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct GetGroupRequest
        include JSON::Serializable

        # Specifies the group to return information for. You can specify the group name, the ARN, or the group
        # ID as the GroupIdentifier .

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        def initialize(
          @group_identifier : String
        )
        end
      end


      struct GetGroupResponse
        include JSON::Serializable

        # A structure that contains information about the group.

        @[JSON::Field(key: "Group")]
        getter group : Types::Group?

        def initialize(
          @group : Types::Group? = nil
        )
        end
      end

      # This structure contains information about one group.

      struct Group
        include JSON::Serializable

        # The ARN of the group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The date and time that the group was created.

        @[JSON::Field(key: "CreatedTime")]
        getter created_time : Time?

        # The unique ID of the group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The date and time that the group was most recently updated.

        @[JSON::Field(key: "LastModifiedTime")]
        getter last_modified_time : Time?

        # The name of the group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The list of key-value pairs that are associated with the canary.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @created_time : Time? = nil,
          @id : String? = nil,
          @last_modified_time : Time? = nil,
          @name : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # A structure containing some information about a group.

      struct GroupSummary
        include JSON::Serializable

        # The ARN of the group.

        @[JSON::Field(key: "Arn")]
        getter arn : String?

        # The unique ID of the group.

        @[JSON::Field(key: "Id")]
        getter id : String?

        # The name of the group.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # An internal failure occurred. Try the operation again.

      struct InternalFailureException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An unknown internal error occurred.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct ListAssociatedGroupsRequest
        include JSON::Serializable

        # The ARN of the canary that you want to view groups for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # Specify this parameter to limit how many groups are returned each time you use the
        # ListAssociatedGroups operation. If you omit this parameter, the default of 20 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAssociatedGroupsResponse
        include JSON::Serializable

        # An array of structures that contain information about the groups that this canary is associated
        # with.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupSummary)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # ListAssociatedGroups operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupResourcesRequest
        include JSON::Serializable

        # Specifies the group to return information for. You can specify the group name, the ARN, or the group
        # ID as the GroupIdentifier .

        @[JSON::Field(key: "groupIdentifier")]
        getter group_identifier : String

        # Specify this parameter to limit how many canary ARNs are returned each time you use the
        # ListGroupResources operation. If you omit this parameter, the default of 20 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @group_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupResourcesResponse
        include JSON::Serializable

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # ListGroupResources operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # An array of ARNs. These ARNs are for the canaries that are associated with the group.

        @[JSON::Field(key: "Resources")]
        getter resources : Array(String)?

        def initialize(
          @next_token : String? = nil,
          @resources : Array(String)? = nil
        )
        end
      end


      struct ListGroupsRequest
        include JSON::Serializable

        # Specify this parameter to limit how many groups are returned each time you use the ListGroups
        # operation. If you omit this parameter, the default of 20 is used.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListGroupsResponse
        include JSON::Serializable

        # An array of structures that each contain information about one group.

        @[JSON::Field(key: "Groups")]
        getter groups : Array(Types::GroupSummary)?

        # A token that indicates that there is more data available. You can use this token in a subsequent
        # ListGroups operation to retrieve the next set of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @groups : Array(Types::GroupSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the canary or group that you want to view tags for. The ARN format of a canary is
        # arn:aws:synthetics: Region : account-id :canary: canary-name . The ARN format of a group is
        # arn:aws:synthetics: Region : account-id :group: group-name

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tag keys and values associated with the resource that you specified.

        @[JSON::Field(key: "Tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # The specified resource was not found.

      struct NotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One of the input resources is larger than is allowed.

      struct RequestEntityTooLargeException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # One of the specified resources was not found.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This structure contains information about the canary's retry configuration. The default account
      # level concurrent execution limit from Lambda is 1000. When you have more than 1000 canaries, it's
      # possible there are more than 1000 Lambda invocations due to retries and the console might hang. For
      # more information on the Lambda execution limit, see Understanding Lambda function scaling . For
      # canary with MaxRetries = 2 , you need to set the CanaryRunConfigInput.TimeoutInSeconds to less than
      # 600 seconds to avoid validation errors.

      struct RetryConfigInput
        include JSON::Serializable

        # The maximum number of retries. The value must be less than or equal to 2.

        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32

        def initialize(
          @max_retries : Int32
        )
        end
      end

      # This structure contains information about the canary's retry configuration.

      struct RetryConfigOutput
        include JSON::Serializable

        # The maximum number of retries. The value must be less than or equal to 2.

        @[JSON::Field(key: "MaxRetries")]
        getter max_retries : Int32?

        def initialize(
          @max_retries : Int32? = nil
        )
        end
      end

      # This structure contains information about one canary runtime version. For more information about
      # runtime versions, see Canary Runtime Versions .

      struct RuntimeVersion
        include JSON::Serializable

        # If this runtime version is deprecated, this value is the date of deprecation.

        @[JSON::Field(key: "DeprecationDate")]
        getter deprecation_date : Time?

        # A description of the runtime version, created by Amazon.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The date that the runtime version was released.

        @[JSON::Field(key: "ReleaseDate")]
        getter release_date : Time?

        # The name of the runtime version. For a list of valid runtime versions, see Canary Runtime Versions .

        @[JSON::Field(key: "VersionName")]
        getter version_name : String?

        def initialize(
          @deprecation_date : Time? = nil,
          @description : String? = nil,
          @release_date : Time? = nil,
          @version_name : String? = nil
        )
        end
      end

      # A structure that contains the configuration of encryption-at-rest settings for canary artifacts that
      # the canary uploads to Amazon S3. For more information, see Encrypting canary artifacts

      struct S3EncryptionConfig
        include JSON::Serializable

        # The encryption method to use for artifacts created by this canary. Specify SSE_S3 to use server-side
        # encryption (SSE) with an Amazon S3-managed key. Specify SSE-KMS to use server-side encryption with a
        # customer-managed KMS key. If you omit this parameter, an Amazon Web Services-managed KMS key is
        # used.

        @[JSON::Field(key: "EncryptionMode")]
        getter encryption_mode : String?

        # The ARN of the customer-managed KMS key to use, if you specify SSE-KMS for EncryptionMode

        @[JSON::Field(key: "KmsKeyArn")]
        getter kms_key_arn : String?

        def initialize(
          @encryption_mode : String? = nil,
          @kms_key_arn : String? = nil
        )
        end
      end

      # The request exceeded a service quota value.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartCanaryDryRunRequest
        include JSON::Serializable

        # The name of the canary that you want to dry run. To find canary names, use DescribeCanaries .

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "ArtifactConfig")]
        getter artifact_config : Types::ArtifactConfigInput?

        # The location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary.
        # Artifacts include the log file, screenshots, and HAR files. The name of the Amazon S3 bucket can't
        # include a period (.).

        @[JSON::Field(key: "ArtifactS3Location")]
        getter artifact_s3_location : String?

        # A structure that specifies the browser type to use for a canary run. CloudWatch Synthetics supports
        # running canaries on both CHROME and FIREFOX browsers. If not specified, browserConfigs defaults to
        # Chrome.

        @[JSON::Field(key: "BrowserConfigs")]
        getter browser_configs : Array(Types::BrowserConfig)?


        @[JSON::Field(key: "Code")]
        getter code : Types::CanaryCodeInput?

        # The ARN of the IAM role to be used to run the canary. This role must already exist, and must include
        # lambda.amazonaws.com as a principal in the trust policy. The role must also have the following
        # permissions:

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The number of days to retain data about failed runs of this canary. If you omit this field, the
        # default of 31 days is used. The valid range is 1 to 455 days. This setting affects the range of
        # information returned by GetCanaryRuns , as well as the range of information displayed in the
        # Synthetics console.

        @[JSON::Field(key: "FailureRetentionPeriodInDays")]
        getter failure_retention_period_in_days : Int32?

        # Specifies whether to also delete the Lambda functions and layers used by this canary when the canary
        # is deleted. If you omit this parameter, the default of AUTOMATIC is used, which means that the
        # Lambda functions and layers will be deleted when the canary is deleted. If the value of this
        # parameter is OFF , then the value of the DeleteLambda parameter of the DeleteCanary operation
        # determines whether the Lambda functions and layers will be deleted.

        @[JSON::Field(key: "ProvisionedResourceCleanup")]
        getter provisioned_resource_cleanup : String?


        @[JSON::Field(key: "RunConfig")]
        getter run_config : Types::CanaryRunConfigInput?

        # Specifies the runtime version to use for the canary. For a list of valid runtime versions and for
        # more information about runtime versions, see Canary Runtime Versions .

        @[JSON::Field(key: "RuntimeVersion")]
        getter runtime_version : String?

        # The number of days to retain data about successful runs of this canary. If you omit this field, the
        # default of 31 days is used. The valid range is 1 to 455 days. This setting affects the range of
        # information returned by GetCanaryRuns , as well as the range of information displayed in the
        # Synthetics console.

        @[JSON::Field(key: "SuccessRetentionPeriodInDays")]
        getter success_retention_period_in_days : Int32?


        @[JSON::Field(key: "VisualReference")]
        getter visual_reference : Types::VisualReferenceInput?

        # A list of visual reference configurations for the canary, one for each browser type that the canary
        # is configured to run on. Visual references are used for visual monitoring comparisons.
        # syn-nodejs-puppeteer-11.0 and above, and syn-nodejs-playwright-3.0 and above, only supports
        # visualReferences . visualReference field is not supported. Versions older than
        # syn-nodejs-puppeteer-11.0 supports both visualReference and visualReferences for backward
        # compatibility. It is recommended to use visualReferences for consistency and future compatibility.

        @[JSON::Field(key: "VisualReferences")]
        getter visual_references : Array(Types::VisualReferenceInput)?


        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfigInput?

        def initialize(
          @name : String,
          @artifact_config : Types::ArtifactConfigInput? = nil,
          @artifact_s3_location : String? = nil,
          @browser_configs : Array(Types::BrowserConfig)? = nil,
          @code : Types::CanaryCodeInput? = nil,
          @execution_role_arn : String? = nil,
          @failure_retention_period_in_days : Int32? = nil,
          @provisioned_resource_cleanup : String? = nil,
          @run_config : Types::CanaryRunConfigInput? = nil,
          @runtime_version : String? = nil,
          @success_retention_period_in_days : Int32? = nil,
          @visual_reference : Types::VisualReferenceInput? = nil,
          @visual_references : Array(Types::VisualReferenceInput)? = nil,
          @vpc_config : Types::VpcConfigInput? = nil
        )
        end
      end


      struct StartCanaryDryRunResponse
        include JSON::Serializable

        # Returns the dry run configurations for a canary.

        @[JSON::Field(key: "DryRunConfig")]
        getter dry_run_config : Types::DryRunConfigOutput?

        def initialize(
          @dry_run_config : Types::DryRunConfigOutput? = nil
        )
        end
      end


      struct StartCanaryRequest
        include JSON::Serializable

        # The name of the canary that you want to run. To find canary names, use DescribeCanaries .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StartCanaryResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct StopCanaryRequest
        include JSON::Serializable

        # The name of the canary that you want to stop. To find the names of your canaries, use ListCanaries .

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct StopCanaryResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the canary or group that you're adding tags to. The ARN format of a canary is
        # arn:aws:synthetics: Region : account-id :canary: canary-name . The ARN format of a group is
        # arn:aws:synthetics: Region : account-id :group: group-name

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.

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

      # There were too many simultaneous requests. Try the operation again.

      struct TooManyRequestsException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the canary or group that you're removing tags from. The ARN format of a canary is
        # arn:aws:synthetics: Region : account-id :canary: canary-name . The ARN format of a group is
        # arn:aws:synthetics: Region : account-id :group: group-name

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of tag keys to remove from the resource.

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


      struct UpdateCanaryRequest
        include JSON::Serializable

        # The name of the canary that you want to update. To find the names of your canaries, use
        # DescribeCanaries . You cannot change the name of a canary that has already been created.

        @[JSON::Field(key: "name")]
        getter name : String

        # A structure that contains the configuration for canary artifacts, including the encryption-at-rest
        # settings for artifacts that the canary uploads to Amazon S3.

        @[JSON::Field(key: "ArtifactConfig")]
        getter artifact_config : Types::ArtifactConfigInput?

        # The location in Amazon S3 where Synthetics stores artifacts from the test runs of this canary.
        # Artifacts include the log file, screenshots, and HAR files. The name of the Amazon S3 bucket can't
        # include a period (.).

        @[JSON::Field(key: "ArtifactS3Location")]
        getter artifact_s3_location : String?

        # A structure that specifies the browser type to use for a canary run. CloudWatch Synthetics supports
        # running canaries on both CHROME and FIREFOX browsers. If not specified, browserConfigs defaults to
        # Chrome.

        @[JSON::Field(key: "BrowserConfigs")]
        getter browser_configs : Array(Types::BrowserConfig)?

        # A structure that includes the entry point from which the canary should start running your script. If
        # the script is stored in an Amazon S3 bucket, the bucket name, key, and version are also included.

        @[JSON::Field(key: "Code")]
        getter code : Types::CanaryCodeInput?

        # Update the existing canary using the updated configurations from the DryRun associated with the
        # DryRunId. When you use the dryRunId field when updating a canary, the only other field you can
        # provide is the Schedule . Adding any other field will thrown an exception.

        @[JSON::Field(key: "DryRunId")]
        getter dry_run_id : String?

        # The ARN of the IAM role to be used to run the canary. This role must already exist, and must include
        # lambda.amazonaws.com as a principal in the trust policy. The role must also have the following
        # permissions: s3:PutObject s3:GetBucketLocation s3:ListAllMyBuckets cloudwatch:PutMetricData
        # logs:CreateLogGroup logs:CreateLogStream logs:CreateLogStream

        @[JSON::Field(key: "ExecutionRoleArn")]
        getter execution_role_arn : String?

        # The number of days to retain data about failed runs of this canary. This setting affects the range
        # of information returned by GetCanaryRuns , as well as the range of information displayed in the
        # Synthetics console.

        @[JSON::Field(key: "FailureRetentionPeriodInDays")]
        getter failure_retention_period_in_days : Int32?

        # Specifies whether to also delete the Lambda functions and layers used by this canary when the canary
        # is deleted. If the value of this parameter is OFF , then the value of the DeleteLambda parameter of
        # the DeleteCanary operation determines whether the Lambda functions and layers will be deleted.

        @[JSON::Field(key: "ProvisionedResourceCleanup")]
        getter provisioned_resource_cleanup : String?

        # A structure that contains the timeout value that is used for each individual run of the canary.
        # Environment variable keys and values are encrypted at rest using Amazon Web Services owned KMS keys.
        # However, the environment variables are not encrypted on the client side. Do not store sensitive
        # information in them.

        @[JSON::Field(key: "RunConfig")]
        getter run_config : Types::CanaryRunConfigInput?

        # Specifies the runtime version to use for the canary. For a list of valid runtime versions and for
        # more information about runtime versions, see Canary Runtime Versions .

        @[JSON::Field(key: "RuntimeVersion")]
        getter runtime_version : String?

        # A structure that contains information about how often the canary is to run, and when these runs are
        # to stop.

        @[JSON::Field(key: "Schedule")]
        getter schedule : Types::CanaryScheduleInput?

        # The number of days to retain data about successful runs of this canary. This setting affects the
        # range of information returned by GetCanaryRuns , as well as the range of information displayed in
        # the Synthetics console.

        @[JSON::Field(key: "SuccessRetentionPeriodInDays")]
        getter success_retention_period_in_days : Int32?

        # Defines the screenshots to use as the baseline for comparisons during visual monitoring comparisons
        # during future runs of this canary. If you omit this parameter, no changes are made to any baseline
        # screenshots that the canary might be using already. Visual monitoring is supported only on canaries
        # running the syn-puppeteer-node-3.2 runtime or later. For more information, see Visual monitoring and
        # Visual monitoring blueprint

        @[JSON::Field(key: "VisualReference")]
        getter visual_reference : Types::VisualReferenceInput?

        # A list of visual reference configurations for the canary, one for each browser type that the canary
        # is configured to run on. Visual references are used for visual monitoring comparisons.
        # syn-nodejs-puppeteer-11.0 and above, and syn-nodejs-playwright-3.0 and above, only supports
        # visualReferences . visualReference field is not supported. Versions older than
        # syn-nodejs-puppeteer-11.0 supports both visualReference and visualReferences for backward
        # compatibility. It is recommended to use visualReferences for consistency and future compatibility.
        # For multibrowser visual monitoring, you can update the baseline for all configured browsers in a
        # single update call by specifying a list of VisualReference objects, one per browser. Each
        # VisualReference object maps to a specific browser configuration, allowing you to manage visual
        # baselines for multiple browsers simultaneously. For single configuration canaries using Chrome
        # browser (default browser), use visualReferences for syn-nodejs-puppeteer-11.0 and above, and
        # syn-nodejs-playwright-3.0 and above canaries. The browserType in the visualReference object is not
        # mandatory.

        @[JSON::Field(key: "VisualReferences")]
        getter visual_references : Array(Types::VisualReferenceInput)?

        # If this canary is to test an endpoint in a VPC, this structure contains information about the subnet
        # and security groups of the VPC endpoint. For more information, see Running a Canary in a VPC .

        @[JSON::Field(key: "VpcConfig")]
        getter vpc_config : Types::VpcConfigInput?

        def initialize(
          @name : String,
          @artifact_config : Types::ArtifactConfigInput? = nil,
          @artifact_s3_location : String? = nil,
          @browser_configs : Array(Types::BrowserConfig)? = nil,
          @code : Types::CanaryCodeInput? = nil,
          @dry_run_id : String? = nil,
          @execution_role_arn : String? = nil,
          @failure_retention_period_in_days : Int32? = nil,
          @provisioned_resource_cleanup : String? = nil,
          @run_config : Types::CanaryRunConfigInput? = nil,
          @runtime_version : String? = nil,
          @schedule : Types::CanaryScheduleInput? = nil,
          @success_retention_period_in_days : Int32? = nil,
          @visual_reference : Types::VisualReferenceInput? = nil,
          @visual_references : Array(Types::VisualReferenceInput)? = nil,
          @vpc_config : Types::VpcConfigInput? = nil
        )
        end
      end


      struct UpdateCanaryResponse
        include JSON::Serializable

        def initialize
        end
      end

      # A parameter could not be validated.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "Message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # An object that specifies what screenshots to use as a baseline for visual monitoring by this canary.
      # It can optionally also specify parts of the screenshots to ignore during the visual monitoring
      # comparison. Visual monitoring is supported only on canaries running the syn-puppeteer-node-3.2
      # runtime or later. For more information, see Visual monitoring and Visual monitoring blueprint

      struct VisualReferenceInput
        include JSON::Serializable

        # Specifies which canary run to use the screenshots from as the baseline for future visual monitoring
        # with this canary. Valid values are nextrun to use the screenshots from the next run after this
        # update is made, lastrun to use the screenshots from the most recent run before this update was made,
        # or the value of Id in the CanaryRun from a run of this a canary in the past 31 days. If you specify
        # the Id of a canary run older than 31 days, the operation returns a 400 validation exception error..

        @[JSON::Field(key: "BaseCanaryRunId")]
        getter base_canary_run_id : String

        # An array of screenshots that will be used as the baseline for visual monitoring in future runs of
        # this canary. If there is a screenshot that you don't want to be used for visual monitoring, remove
        # it from this array.

        @[JSON::Field(key: "BaseScreenshots")]
        getter base_screenshots : Array(Types::BaseScreenshot)?

        # The browser type associated with this visual reference.

        @[JSON::Field(key: "BrowserType")]
        getter browser_type : String?

        def initialize(
          @base_canary_run_id : String,
          @base_screenshots : Array(Types::BaseScreenshot)? = nil,
          @browser_type : String? = nil
        )
        end
      end

      # If this canary performs visual monitoring by comparing screenshots, this structure contains the ID
      # of the canary run that is used as the baseline for screenshots, and the coordinates of any parts of
      # those screenshots that are ignored during visual monitoring comparison. Visual monitoring is
      # supported only on canaries running the syn-puppeteer-node-3.2 runtime or later.

      struct VisualReferenceOutput
        include JSON::Serializable

        # The ID of the canary run that produced the baseline screenshots that are used for visual monitoring
        # comparisons by this canary.

        @[JSON::Field(key: "BaseCanaryRunId")]
        getter base_canary_run_id : String?

        # An array of screenshots that are used as the baseline for comparisons during visual monitoring.

        @[JSON::Field(key: "BaseScreenshots")]
        getter base_screenshots : Array(Types::BaseScreenshot)?

        # The browser type associated with this visual reference.

        @[JSON::Field(key: "BrowserType")]
        getter browser_type : String?

        def initialize(
          @base_canary_run_id : String? = nil,
          @base_screenshots : Array(Types::BaseScreenshot)? = nil,
          @browser_type : String? = nil
        )
        end
      end

      # If this canary is to test an endpoint in a VPC, this structure contains information about the
      # subnets and security groups of the VPC endpoint. For more information, see Running a Canary in a VPC
      # .

      struct VpcConfigInput
        include JSON::Serializable

        # Set this to true to allow outbound IPv6 traffic on VPC canaries that are connected to dual-stack
        # subnets. The default is false

        @[JSON::Field(key: "Ipv6AllowedForDualStack")]
        getter ipv6_allowed_for_dual_stack : Bool?

        # The IDs of the security groups for this canary.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The IDs of the subnets where this canary is to run.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        def initialize(
          @ipv6_allowed_for_dual_stack : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil
        )
        end
      end

      # If this canary is to test an endpoint in a VPC, this structure contains information about the
      # subnets and security groups of the VPC endpoint. For more information, see Running a Canary in a VPC
      # .

      struct VpcConfigOutput
        include JSON::Serializable

        # Indicates whether this canary allows outbound IPv6 traffic if it is connected to dual-stack subnets.

        @[JSON::Field(key: "Ipv6AllowedForDualStack")]
        getter ipv6_allowed_for_dual_stack : Bool?

        # The IDs of the security groups for this canary.

        @[JSON::Field(key: "SecurityGroupIds")]
        getter security_group_ids : Array(String)?

        # The IDs of the subnets where this canary is to run.

        @[JSON::Field(key: "SubnetIds")]
        getter subnet_ids : Array(String)?

        # The IDs of the VPC where this canary is to run.

        @[JSON::Field(key: "VpcId")]
        getter vpc_id : String?

        def initialize(
          @ipv6_allowed_for_dual_stack : Bool? = nil,
          @security_group_ids : Array(String)? = nil,
          @subnet_ids : Array(String)? = nil,
          @vpc_id : String? = nil
        )
        end
      end
    end
  end
end
