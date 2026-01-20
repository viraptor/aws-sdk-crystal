require "json"
require "time"

module Aws
  module CodePipeline
    module Types

      # Represents an Amazon Web Services session credentials object. These credentials are temporary
      # credentials that are issued by Amazon Web Services Secure Token Service (STS). They can be used to
      # access input and output artifacts in the S3 bucket used to store artifact for the pipeline in
      # CodePipeline.

      struct AWSSessionCredentials
        include JSON::Serializable

        # The access key for the session.

        @[JSON::Field(key: "accessKeyId")]
        getter access_key_id : String

        # The secret access key for the session.

        @[JSON::Field(key: "secretAccessKey")]
        getter secret_access_key : String

        # The token for the session.

        @[JSON::Field(key: "sessionToken")]
        getter session_token : String

        def initialize(
          @access_key_id : String,
          @secret_access_key : String,
          @session_token : String
        )
        end
      end

      # Represents the input of an AcknowledgeJob action.

      struct AcknowledgeJobInput
        include JSON::Serializable

        # The unique system-generated ID of the job for which you want to confirm receipt.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A system-generated random number that CodePipeline uses to ensure that the job is being worked on by
        # only one job worker. Get this number from the response of the PollForJobs request that returned this
        # job.

        @[JSON::Field(key: "nonce")]
        getter nonce : String

        def initialize(
          @job_id : String,
          @nonce : String
        )
        end
      end

      # Represents the output of an AcknowledgeJob action.

      struct AcknowledgeJobOutput
        include JSON::Serializable

        # Whether the job worker has received the specified job.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Represents the input of an AcknowledgeThirdPartyJob action.

      struct AcknowledgeThirdPartyJobInput
        include JSON::Serializable

        # The clientToken portion of the clientId and clientToken pair used to verify that the calling entity
        # is allowed access to the job and its details.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique system-generated ID of the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A system-generated random number that CodePipeline uses to ensure that the job is being worked on by
        # only one job worker. Get this number from the response to a GetThirdPartyJobDetails request.

        @[JSON::Field(key: "nonce")]
        getter nonce : String

        def initialize(
          @client_token : String,
          @job_id : String,
          @nonce : String
        )
        end
      end

      # Represents the output of an AcknowledgeThirdPartyJob action.

      struct AcknowledgeThirdPartyJobOutput
        include JSON::Serializable

        # The status information for the third party job, if any.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @status : String? = nil
        )
        end
      end

      # Represents information about an action configuration.

      struct ActionConfiguration
        include JSON::Serializable

        # The configuration data for the action.

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        def initialize(
          @configuration : Hash(String, String)? = nil
        )
        end
      end

      # Represents information about an action configuration property.

      struct ActionConfigurationProperty
        include JSON::Serializable

        # Whether the configuration property is a key.

        @[JSON::Field(key: "key")]
        getter key : Bool

        # The name of the action configuration property.

        @[JSON::Field(key: "name")]
        getter name : String

        # Whether the configuration property is a required value.

        @[JSON::Field(key: "required")]
        getter required : Bool

        # Whether the configuration property is secret. Secrets are hidden from all calls except for
        # GetJobDetails , GetThirdPartyJobDetails , PollForJobs , and PollForThirdPartyJobs . When updating a
        # pipeline, passing * * * * * without changing any other values of the action preserves the previous
        # value of the secret.

        @[JSON::Field(key: "secret")]
        getter secret : Bool

        # The description of the action configuration property that is displayed to users.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates that the property is used with PollForJobs . When creating a custom action, an action can
        # have up to one queryable property. If it has one, that property must be both required and not
        # secret. If you create a pipeline with a custom action type, and that custom action contains a
        # queryable property, the value for that configuration property is subject to other restrictions. The
        # value must be less than or equal to twenty (20) characters. The value can contain only alphanumeric
        # characters, underscores, and hyphens.

        @[JSON::Field(key: "queryable")]
        getter queryable : Bool?

        # The type of the configuration property.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @key : Bool,
          @name : String,
          @required : Bool,
          @secret : Bool,
          @description : String? = nil,
          @queryable : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents the context of an action in the stage of a pipeline to a job worker.

      struct ActionContext
        include JSON::Serializable

        # The system-generated unique ID that corresponds to an action's execution.

        @[JSON::Field(key: "actionExecutionId")]
        getter action_execution_id : String?

        # The name of the action in the context of a job.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @action_execution_id : String? = nil,
          @name : String? = nil
        )
        end
      end

      # Represents information about an action declaration.

      struct ActionDeclaration
        include JSON::Serializable

        # Specifies the action type and the provider of the action.

        @[JSON::Field(key: "actionTypeId")]
        getter action_type_id : Types::ActionTypeId

        # The action declaration's name.

        @[JSON::Field(key: "name")]
        getter name : String

        # The shell commands to run with your compute action in CodePipeline. All commands are supported
        # except multi-line formats. While CodeBuild logs and permissions are used, you do not need to create
        # any resources in CodeBuild. Using compute time for this action will incur separate charges in
        # CodeBuild.

        @[JSON::Field(key: "commands")]
        getter commands : Array(String)?

        # The action's configuration. These are key-value pairs that specify input values for an action. For
        # more information, see Action Structure Requirements in CodePipeline . For the list of configuration
        # properties for the CloudFormation action type in CodePipeline, see Configuration Properties
        # Reference in the CloudFormation User Guide . For template snippets with examples, see Using
        # Parameter Override Functions with CodePipeline Pipelines in the CloudFormation User Guide . The
        # values can be represented in either JSON or YAML format. For example, the JSON configuration item
        # format is as follows: JSON: "Configuration" : { Key : Value },

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # The environment variables for the action.

        @[JSON::Field(key: "environmentVariables")]
        getter environment_variables : Array(Types::EnvironmentVariable)?

        # The name or ID of the artifact consumed by the action, such as a test or build artifact.

        @[JSON::Field(key: "inputArtifacts")]
        getter input_artifacts : Array(Types::InputArtifact)?

        # The variable namespace associated with the action. All variables produced as output by this action
        # fall under this namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The name or ID of the result of the action declaration, such as a test or build artifact.

        @[JSON::Field(key: "outputArtifacts")]
        getter output_artifacts : Array(Types::OutputArtifact)?

        # The list of variables that are to be exported from the compute action. This is specifically
        # CodeBuild environment variables as used for that action.

        @[JSON::Field(key: "outputVariables")]
        getter output_variables : Array(String)?

        # The action declaration's Amazon Web Services Region, such as us-east-1.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The ARN of the IAM service role that performs the declared action. This is assumed through the
        # roleArn for the pipeline.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The order in which actions are run.

        @[JSON::Field(key: "runOrder")]
        getter run_order : Int32?

        # A timeout duration in minutes that can be applied against the ActionType’s default timeout value
        # specified in Quotas for CodePipeline . This attribute is available only to the manual approval
        # ActionType.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        def initialize(
          @action_type_id : Types::ActionTypeId,
          @name : String,
          @commands : Array(String)? = nil,
          @configuration : Hash(String, String)? = nil,
          @environment_variables : Array(Types::EnvironmentVariable)? = nil,
          @input_artifacts : Array(Types::InputArtifact)? = nil,
          @namespace : String? = nil,
          @output_artifacts : Array(Types::OutputArtifact)? = nil,
          @output_variables : Array(String)? = nil,
          @region : String? = nil,
          @role_arn : String? = nil,
          @run_order : Int32? = nil,
          @timeout_in_minutes : Int32? = nil
        )
        end
      end

      # Represents information about the run of an action.

      struct ActionExecution
        include JSON::Serializable

        # ID of the workflow action execution in the current stage. Use the GetPipelineState action to
        # retrieve the current action execution details of the current stage. For older executions, this field
        # might be empty. The action execution ID is available for executions run on or after March 2020.

        @[JSON::Field(key: "actionExecutionId")]
        getter action_execution_id : String?

        # The details of an error returned by a URL external to Amazon Web Services.

        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ErrorDetails?

        # The external ID of the run of the action.

        @[JSON::Field(key: "externalExecutionId")]
        getter external_execution_id : String?

        # The URL of a resource external to Amazon Web Services that is used when running the action (for
        # example, an external repository URL).

        @[JSON::Field(key: "externalExecutionUrl")]
        getter external_execution_url : String?

        # The last status change of the action.

        @[JSON::Field(key: "lastStatusChange", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_status_change : Time?

        # The ARN of the user who last changed the pipeline.

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The Amazon Resource Name (ARN) of the log stream for the action compute.

        @[JSON::Field(key: "logStreamARN")]
        getter log_stream_arn : String?

        # A percentage of completeness of the action as it runs.

        @[JSON::Field(key: "percentComplete")]
        getter percent_complete : Int32?

        # The status of the action, or for a completed action, the last status of the action.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A summary of the run of the action.

        @[JSON::Field(key: "summary")]
        getter summary : String?

        # The system-generated token used to identify a unique approval request. The token for each open
        # approval request can be obtained using the GetPipelineState command. It is used to validate that the
        # approval request corresponding to this token is still valid.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @action_execution_id : String? = nil,
          @error_details : Types::ErrorDetails? = nil,
          @external_execution_id : String? = nil,
          @external_execution_url : String? = nil,
          @last_status_change : Time? = nil,
          @last_updated_by : String? = nil,
          @log_stream_arn : String? = nil,
          @percent_complete : Int32? = nil,
          @status : String? = nil,
          @summary : String? = nil,
          @token : String? = nil
        )
        end
      end

      # Returns information about an execution of an action, including the action execution ID, and the
      # name, version, and timing of the action.

      struct ActionExecutionDetail
        include JSON::Serializable

        # The action execution ID.

        @[JSON::Field(key: "actionExecutionId")]
        getter action_execution_id : String?

        # The name of the action.

        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Input details for the action execution, such as role ARN, Region, and input artifacts.

        @[JSON::Field(key: "input")]
        getter input : Types::ActionExecutionInput?

        # The last update time of the action execution.

        @[JSON::Field(key: "lastUpdateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # Output details for the action execution, such as the action execution result.

        @[JSON::Field(key: "output")]
        getter output : Types::ActionExecutionOutput?

        # The pipeline execution ID for the action execution.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        # The version of the pipeline where the action was run.

        @[JSON::Field(key: "pipelineVersion")]
        getter pipeline_version : Int32?

        # The name of the stage that contains the action.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        # The start time of the action execution.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the action execution. Status categories are InProgress , Succeeded , and Failed .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ARN of the user who changed the pipeline execution details.

        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @action_execution_id : String? = nil,
          @action_name : String? = nil,
          @input : Types::ActionExecutionInput? = nil,
          @last_update_time : Time? = nil,
          @output : Types::ActionExecutionOutput? = nil,
          @pipeline_execution_id : String? = nil,
          @pipeline_version : Int32? = nil,
          @stage_name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Filter values for the action execution.

      struct ActionExecutionFilter
        include JSON::Serializable

        # The latest execution in the pipeline. Filtering on the latest execution is available for executions
        # run on or after February 08, 2024.

        @[JSON::Field(key: "latestInPipelineExecution")]
        getter latest_in_pipeline_execution : Types::LatestInPipelineExecutionFilter?

        # The pipeline execution ID used to filter action execution history.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        def initialize(
          @latest_in_pipeline_execution : Types::LatestInPipelineExecutionFilter? = nil,
          @pipeline_execution_id : String? = nil
        )
        end
      end

      # Input information used for an action execution.

      struct ActionExecutionInput
        include JSON::Serializable


        @[JSON::Field(key: "actionTypeId")]
        getter action_type_id : Types::ActionTypeId?

        # Configuration data for an action execution.

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # Details of input artifacts of the action that correspond to the action execution.

        @[JSON::Field(key: "inputArtifacts")]
        getter input_artifacts : Array(Types::ArtifactDetail)?

        # The variable namespace associated with the action. All variables produced as output by this action
        # fall under this namespace.

        @[JSON::Field(key: "namespace")]
        getter namespace : String?

        # The Amazon Web Services Region for the action, such as us-east-1.

        @[JSON::Field(key: "region")]
        getter region : String?

        # Configuration data for an action execution with all variable references replaced with their real
        # values for the execution.

        @[JSON::Field(key: "resolvedConfiguration")]
        getter resolved_configuration : Hash(String, String)?

        # The ARN of the IAM service role that performs the declared action. This is assumed through the
        # roleArn for the pipeline.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @action_type_id : Types::ActionTypeId? = nil,
          @configuration : Hash(String, String)? = nil,
          @input_artifacts : Array(Types::ArtifactDetail)? = nil,
          @namespace : String? = nil,
          @region : String? = nil,
          @resolved_configuration : Hash(String, String)? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # The action execution was not found.

      struct ActionExecutionNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Output details listed for an action execution, such as the action execution result.

      struct ActionExecutionOutput
        include JSON::Serializable

        # Execution result information listed in the output details for an action execution.

        @[JSON::Field(key: "executionResult")]
        getter execution_result : Types::ActionExecutionResult?

        # Details of output artifacts of the action that correspond to the action execution.

        @[JSON::Field(key: "outputArtifacts")]
        getter output_artifacts : Array(Types::ArtifactDetail)?

        # The outputVariables field shows the key-value pairs that were output as part of that execution.

        @[JSON::Field(key: "outputVariables")]
        getter output_variables : Hash(String, String)?

        def initialize(
          @execution_result : Types::ActionExecutionResult? = nil,
          @output_artifacts : Array(Types::ArtifactDetail)? = nil,
          @output_variables : Hash(String, String)? = nil
        )
        end
      end

      # Execution result information, such as the external execution ID.

      struct ActionExecutionResult
        include JSON::Serializable


        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ErrorDetails?

        # The action provider's external ID for the action execution.

        @[JSON::Field(key: "externalExecutionId")]
        getter external_execution_id : String?

        # The action provider's summary for the action execution.

        @[JSON::Field(key: "externalExecutionSummary")]
        getter external_execution_summary : String?

        # The deepest external link to the external resource (for example, a repository URL or deployment
        # endpoint) that is used when running the action.

        @[JSON::Field(key: "externalExecutionUrl")]
        getter external_execution_url : String?

        # The Amazon Resource Name (ARN) of the log stream for the action compute.

        @[JSON::Field(key: "logStreamARN")]
        getter log_stream_arn : String?

        def initialize(
          @error_details : Types::ErrorDetails? = nil,
          @external_execution_id : String? = nil,
          @external_execution_summary : String? = nil,
          @external_execution_url : String? = nil,
          @log_stream_arn : String? = nil
        )
        end
      end

      # The specified action cannot be found.

      struct ActionNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents information about the version (or revision) of an action.

      struct ActionRevision
        include JSON::Serializable

        # The date and time when the most recent version of the action was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time

        # The unique identifier of the change that set the state to this revision (for example, a deployment
        # ID or timestamp).

        @[JSON::Field(key: "revisionChangeId")]
        getter revision_change_id : String

        # The system-generated unique ID that identifies the revision number of the action.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @created : Time,
          @revision_change_id : String,
          @revision_id : String
        )
        end
      end

      # Represents information about the state of an action.

      struct ActionState
        include JSON::Serializable

        # The name of the action.

        @[JSON::Field(key: "actionName")]
        getter action_name : String?

        # Represents information about the version (or revision) of an action.

        @[JSON::Field(key: "currentRevision")]
        getter current_revision : Types::ActionRevision?

        # A URL link for more information about the state of the action, such as a deployment group details
        # page.

        @[JSON::Field(key: "entityUrl")]
        getter entity_url : String?

        # Represents information about the run of an action.

        @[JSON::Field(key: "latestExecution")]
        getter latest_execution : Types::ActionExecution?

        # A URL link for more information about the revision, such as a commit details page.

        @[JSON::Field(key: "revisionUrl")]
        getter revision_url : String?

        def initialize(
          @action_name : String? = nil,
          @current_revision : Types::ActionRevision? = nil,
          @entity_url : String? = nil,
          @latest_execution : Types::ActionExecution? = nil,
          @revision_url : String? = nil
        )
        end
      end

      # Returns information about the details of an action type.

      struct ActionType
        include JSON::Serializable

        # Represents information about an action type.

        @[JSON::Field(key: "id")]
        getter id : Types::ActionTypeId

        # The details of the input artifact for the action, such as its commit ID.

        @[JSON::Field(key: "inputArtifactDetails")]
        getter input_artifact_details : Types::ArtifactDetails

        # The details of the output artifact of the action, such as its commit ID.

        @[JSON::Field(key: "outputArtifactDetails")]
        getter output_artifact_details : Types::ArtifactDetails

        # The configuration properties for the action type.

        @[JSON::Field(key: "actionConfigurationProperties")]
        getter action_configuration_properties : Array(Types::ActionConfigurationProperty)?

        # The settings for the action type.

        @[JSON::Field(key: "settings")]
        getter settings : Types::ActionTypeSettings?

        def initialize(
          @id : Types::ActionTypeId,
          @input_artifact_details : Types::ArtifactDetails,
          @output_artifact_details : Types::ArtifactDetails,
          @action_configuration_properties : Array(Types::ActionConfigurationProperty)? = nil,
          @settings : Types::ActionTypeSettings? = nil
        )
        end
      end

      # The specified action type already exists with a different definition.

      struct ActionTypeAlreadyExistsException
        include JSON::Serializable

        def initialize
        end
      end

      # Information about parameters for artifacts associated with the action type, such as the minimum and
      # maximum artifacts allowed.

      struct ActionTypeArtifactDetails
        include JSON::Serializable

        # The maximum number of artifacts that can be used with the actiontype. For example, you should
        # specify a minimum and maximum of zero input artifacts for an action type with a category of source .

        @[JSON::Field(key: "maximumCount")]
        getter maximum_count : Int32

        # The minimum number of artifacts that can be used with the action type. For example, you should
        # specify a minimum and maximum of zero input artifacts for an action type with a category of source .

        @[JSON::Field(key: "minimumCount")]
        getter minimum_count : Int32

        def initialize(
          @maximum_count : Int32,
          @minimum_count : Int32
        )
        end
      end

      # The parameters for the action type definition that are provided when the action type is created or
      # updated.

      struct ActionTypeDeclaration
        include JSON::Serializable

        # Information about the executor for an action type that was created with any supported integration
        # model.

        @[JSON::Field(key: "executor")]
        getter executor : Types::ActionTypeExecutor

        # The action category, owner, provider, and version of the action type to be updated.

        @[JSON::Field(key: "id")]
        getter id : Types::ActionTypeIdentifier

        # Details for the artifacts, such as application files, to be worked on by the action. For example,
        # the minimum and maximum number of input artifacts allowed.

        @[JSON::Field(key: "inputArtifactDetails")]
        getter input_artifact_details : Types::ActionTypeArtifactDetails

        # Details for the output artifacts, such as a built application, that are the result of the action.
        # For example, the minimum and maximum number of output artifacts allowed.

        @[JSON::Field(key: "outputArtifactDetails")]
        getter output_artifact_details : Types::ActionTypeArtifactDetails

        # The description for the action type to be updated.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Details identifying the accounts with permissions to use the action type.

        @[JSON::Field(key: "permissions")]
        getter permissions : Types::ActionTypePermissions?

        # The properties of the action type to be updated.

        @[JSON::Field(key: "properties")]
        getter properties : Array(Types::ActionTypeProperty)?

        # The links associated with the action type to be updated.

        @[JSON::Field(key: "urls")]
        getter urls : Types::ActionTypeUrls?

        def initialize(
          @executor : Types::ActionTypeExecutor,
          @id : Types::ActionTypeIdentifier,
          @input_artifact_details : Types::ActionTypeArtifactDetails,
          @output_artifact_details : Types::ActionTypeArtifactDetails,
          @description : String? = nil,
          @permissions : Types::ActionTypePermissions? = nil,
          @properties : Array(Types::ActionTypeProperty)? = nil,
          @urls : Types::ActionTypeUrls? = nil
        )
        end
      end

      # The action engine, or executor, for an action type created for a provider, where the action is to be
      # used by customers of the provider. The action engine is associated with the model used to create and
      # update the action, such as the Lambda integration model.

      struct ActionTypeExecutor
        include JSON::Serializable

        # The action configuration properties for the action type. These properties are specified in the
        # action definition when the action type is created.

        @[JSON::Field(key: "configuration")]
        getter configuration : Types::ExecutorConfiguration

        # The integration model used to create and update the action type, Lambda or JobWorker .

        @[JSON::Field(key: "type")]
        getter type : String

        # The timeout in seconds for the job. An action execution can have multiple jobs. This is the timeout
        # for a single job, not the entire action execution.

        @[JSON::Field(key: "jobTimeout")]
        getter job_timeout : Int32?

        # The policy statement that specifies the permissions in the CodePipeline customer account that are
        # needed to successfully run an action. To grant permission to another account, specify the account ID
        # as the Principal, a domain-style identifier defined by the service, for example
        # codepipeline.amazonaws.com . The size of the passed JSON policy document cannot exceed 2048
        # characters.

        @[JSON::Field(key: "policyStatementsTemplate")]
        getter policy_statements_template : String?

        def initialize(
          @configuration : Types::ExecutorConfiguration,
          @type : String,
          @job_timeout : Int32? = nil,
          @policy_statements_template : String? = nil
        )
        end
      end

      # Represents information about an action type.

      struct ActionTypeId
        include JSON::Serializable

        # A category defines what kind of action can be taken in the stage, and constrains the provider type
        # for the action. Valid categories are limited to one of the following values. Source Build Test
        # Deploy Invoke Approval Compute

        @[JSON::Field(key: "category")]
        getter category : String

        # The creator of the action being called. There are three valid values for the Owner field in the
        # action category section within your pipeline structure: AWS , ThirdParty , and Custom . For more
        # information, see Valid Action Types and Providers in CodePipeline .

        @[JSON::Field(key: "owner")]
        getter owner : String

        # The provider of the service being called by the action. Valid providers are determined by the action
        # category. For example, an action in the Deploy category type might have a provider of CodeDeploy,
        # which would be specified as CodeDeploy . For more information, see Valid Action Types and Providers
        # in CodePipeline .

        @[JSON::Field(key: "provider")]
        getter provider : String

        # A string that describes the action version.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @category : String,
          @owner : String,
          @provider : String,
          @version : String
        )
        end
      end

      # Specifies the category, owner, provider, and version of the action type.

      struct ActionTypeIdentifier
        include JSON::Serializable

        # Defines what kind of action can be taken in the stage, one of the following: Source Build Test
        # Deploy Approval Invoke

        @[JSON::Field(key: "category")]
        getter category : String

        # The creator of the action type being called: AWS or ThirdParty .

        @[JSON::Field(key: "owner")]
        getter owner : String

        # The provider of the action type being called. The provider name is supplied when the action type is
        # created.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # A string that describes the action type version.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @category : String,
          @owner : String,
          @provider : String,
          @version : String
        )
        end
      end

      # The specified action type cannot be found.

      struct ActionTypeNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Details identifying the users with permissions to use the action type.

      struct ActionTypePermissions
        include JSON::Serializable

        # A list of Amazon Web Services account IDs with access to use the action type in their pipelines.

        @[JSON::Field(key: "allowedAccounts")]
        getter allowed_accounts : Array(String)

        def initialize(
          @allowed_accounts : Array(String)
        )
        end
      end

      # Represents information about each property specified in the action configuration, such as the
      # description and key name that display for the customer using the action type.

      struct ActionTypeProperty
        include JSON::Serializable

        # Whether the configuration property is a key.

        @[JSON::Field(key: "key")]
        getter key : Bool

        # The property name that is displayed to users.

        @[JSON::Field(key: "name")]
        getter name : String

        # Whether to omit the field value entered by the customer in the log. If true , the value is not saved
        # in CloudTrail logs for the action execution.

        @[JSON::Field(key: "noEcho")]
        getter no_echo : Bool

        # Whether the configuration property is an optional value.

        @[JSON::Field(key: "optional")]
        getter optional : Bool

        # The description of the property that is displayed to users.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates that the property is used with polling. An action type can have up to one queryable
        # property. If it has one, that property must be both required and not secret.

        @[JSON::Field(key: "queryable")]
        getter queryable : Bool?

        def initialize(
          @key : Bool,
          @name : String,
          @no_echo : Bool,
          @optional : Bool,
          @description : String? = nil,
          @queryable : Bool? = nil
        )
        end
      end

      # Returns information about the settings for an action type.

      struct ActionTypeSettings
        include JSON::Serializable

        # The URL returned to the CodePipeline console that provides a deep link to the resources of the
        # external system, such as the configuration page for a CodeDeploy deployment group. This link is
        # provided as part of the action display in the pipeline.

        @[JSON::Field(key: "entityUrlTemplate")]
        getter entity_url_template : String?

        # The URL returned to the CodePipeline console that contains a link to the top-level landing page for
        # the external system, such as the console page for CodeDeploy. This link is shown on the pipeline
        # view page in the CodePipeline console and provides a link to the execution entity of the external
        # action.

        @[JSON::Field(key: "executionUrlTemplate")]
        getter execution_url_template : String?

        # The URL returned to the CodePipeline console that contains a link to the page where customers can
        # update or change the configuration of the external action.

        @[JSON::Field(key: "revisionUrlTemplate")]
        getter revision_url_template : String?

        # The URL of a sign-up page where users can sign up for an external service and perform initial
        # configuration of the action provided by that service.

        @[JSON::Field(key: "thirdPartyConfigurationUrl")]
        getter third_party_configuration_url : String?

        def initialize(
          @entity_url_template : String? = nil,
          @execution_url_template : String? = nil,
          @revision_url_template : String? = nil,
          @third_party_configuration_url : String? = nil
        )
        end
      end

      # Returns information about URLs for web pages that display to customers as links on the pipeline
      # view, such as an external configuration page for the action type.

      struct ActionTypeUrls
        include JSON::Serializable

        # The URL returned to the CodePipeline console that contains a link to the page where customers can
        # configure the external action.

        @[JSON::Field(key: "configurationUrl")]
        getter configuration_url : String?

        # The URL returned to the CodePipeline console that provides a deep link to the resources of the
        # external system, such as a status page. This link is provided as part of the action display in the
        # pipeline.

        @[JSON::Field(key: "entityUrlTemplate")]
        getter entity_url_template : String?

        # The link to an execution page for the action type in progress. For example, for a CodeDeploy action,
        # this link is shown on the pipeline view page in the CodePipeline console, and it links to a
        # CodeDeploy status page.

        @[JSON::Field(key: "executionUrlTemplate")]
        getter execution_url_template : String?

        # The URL returned to the CodePipeline console that contains a link to the page where customers can
        # update or change the configuration of the external action.

        @[JSON::Field(key: "revisionUrlTemplate")]
        getter revision_url_template : String?

        def initialize(
          @configuration_url : String? = nil,
          @entity_url_template : String? = nil,
          @execution_url_template : String? = nil,
          @revision_url_template : String? = nil
        )
        end
      end

      # The approval action has already been approved or rejected.

      struct ApprovalAlreadyCompletedException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents information about the result of an approval request.

      struct ApprovalResult
        include JSON::Serializable

        # The response submitted by a reviewer assigned to an approval action request.

        @[JSON::Field(key: "status")]
        getter status : String

        # The summary of the current status of the approval request.

        @[JSON::Field(key: "summary")]
        getter summary : String

        def initialize(
          @status : String,
          @summary : String
        )
        end
      end

      # Artifacts are the files that are worked on by actions in the pipeline. See the action configuration
      # for each action for details about artifact parameters. For example, the S3 source action artifact is
      # a file name (or file path), and the files are generally provided as a ZIP file. Example artifact
      # name: SampleApp_Windows.zip

      struct Artifact
        include JSON::Serializable

        # The location of an artifact.

        @[JSON::Field(key: "location")]
        getter location : Types::ArtifactLocation?

        # The artifact's name.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The artifact's revision ID. Depending on the type of object, this could be a commit ID (GitHub) or a
        # revision ID (Amazon S3).

        @[JSON::Field(key: "revision")]
        getter revision : String?

        def initialize(
          @location : Types::ArtifactLocation? = nil,
          @name : String? = nil,
          @revision : String? = nil
        )
        end
      end

      # Artifact details for the action execution, such as the artifact location.

      struct ArtifactDetail
        include JSON::Serializable

        # The artifact object name for the action execution.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The Amazon S3 artifact location for the action execution.

        @[JSON::Field(key: "s3location")]
        getter s3location : Types::S3Location?

        def initialize(
          @name : String? = nil,
          @s3location : Types::S3Location? = nil
        )
        end
      end

      # Returns information about the details of an artifact.

      struct ArtifactDetails
        include JSON::Serializable

        # The maximum number of artifacts allowed for the action type.

        @[JSON::Field(key: "maximumCount")]
        getter maximum_count : Int32

        # The minimum number of artifacts allowed for the action type.

        @[JSON::Field(key: "minimumCount")]
        getter minimum_count : Int32

        def initialize(
          @maximum_count : Int32,
          @minimum_count : Int32
        )
        end
      end

      # Represents information about the location of an artifact.

      struct ArtifactLocation
        include JSON::Serializable

        # The S3 bucket that contains the artifact.

        @[JSON::Field(key: "s3Location")]
        getter s3_location : Types::S3ArtifactLocation?

        # The type of artifact in the location.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @s3_location : Types::S3ArtifactLocation? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents revision details of an artifact.

      struct ArtifactRevision
        include JSON::Serializable

        # The date and time when the most recent revision of the artifact was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The name of an artifact. This name might be system-generated, such as "MyApp", or defined by the
        # user when an action is created.

        @[JSON::Field(key: "name")]
        getter name : String?

        # An additional identifier for a revision, such as a commit date or, for artifacts stored in Amazon S3
        # buckets, the ETag value.

        @[JSON::Field(key: "revisionChangeIdentifier")]
        getter revision_change_identifier : String?

        # The revision ID of the artifact.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # Summary information about the most recent revision of the artifact. For GitHub and CodeCommit
        # repositories, the commit message. For Amazon S3 buckets or actions, the user-provided content of a
        # codepipeline-artifact-revision-summary key specified in the object metadata.

        @[JSON::Field(key: "revisionSummary")]
        getter revision_summary : String?

        # The commit ID for the artifact revision. For artifacts stored in GitHub or CodeCommit repositories,
        # the commit ID is linked to a commit details page.

        @[JSON::Field(key: "revisionUrl")]
        getter revision_url : String?

        def initialize(
          @created : Time? = nil,
          @name : String? = nil,
          @revision_change_identifier : String? = nil,
          @revision_id : String? = nil,
          @revision_summary : String? = nil,
          @revision_url : String? = nil
        )
        end
      end

      # The S3 bucket where artifacts for the pipeline are stored. You must include either artifactStore or
      # artifactStores in your pipeline, but you cannot use both. If you create a cross-region action in
      # your pipeline, you must use artifactStores .

      struct ArtifactStore
        include JSON::Serializable

        # The S3 bucket used for storing the artifacts for a pipeline. You can specify the name of an S3
        # bucket but not a folder in the bucket. A folder to contain the pipeline artifacts is created for you
        # based on the name of the pipeline. You can use any S3 bucket in the same Amazon Web Services Region
        # as the pipeline to store your pipeline artifacts.

        @[JSON::Field(key: "location")]
        getter location : String

        # The type of the artifact store, such as S3.

        @[JSON::Field(key: "type")]
        getter type : String

        # The encryption key used to encrypt the data in the artifact store, such as an Amazon Web Services
        # Key Management Service key. If this is undefined, the default key for Amazon S3 is used.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        def initialize(
          @location : String,
          @type : String,
          @encryption_key : Types::EncryptionKey? = nil
        )
        end
      end

      # The conditions for making checks for entry to a stage. For more information about conditions, see
      # Stage conditions and How do stage conditions work? .

      struct BeforeEntryConditions
        include JSON::Serializable

        # The conditions that are configured as entry conditions.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::Condition)

        def initialize(
          @conditions : Array(Types::Condition)
        )
        end
      end

      # Reserved for future use.

      struct BlockerDeclaration
        include JSON::Serializable

        # Reserved for future use.

        @[JSON::Field(key: "name")]
        getter name : String

        # Reserved for future use.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @name : String,
          @type : String
        )
        end
      end

      # Unable to modify the tag due to a simultaneous update request.

      struct ConcurrentModificationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The pipeline has reached the limit for concurrent pipeline executions.

      struct ConcurrentPipelineExecutionsLimitExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The condition for the stage. A condition is made up of the rules and the result for the condition.
      # For more information about conditions, see Stage conditions and How do stage conditions work? .. For
      # more information about rules, see the CodePipeline rule reference .

      struct Condition
        include JSON::Serializable

        # The action to be done when the condition is met. For example, rolling back an execution for a
        # failure condition.

        @[JSON::Field(key: "result")]
        getter result : String?

        # The rules that make up the condition.

        @[JSON::Field(key: "rules")]
        getter rules : Array(Types::RuleDeclaration)?

        def initialize(
          @result : String? = nil,
          @rules : Array(Types::RuleDeclaration)? = nil
        )
        end
      end

      # The run of a condition.

      struct ConditionExecution
        include JSON::Serializable

        # The last status change of the condition.

        @[JSON::Field(key: "lastStatusChange", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_status_change : Time?

        # The status of the run for a condition.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The summary of information about a run for a condition.

        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @last_status_change : Time? = nil,
          @status : String? = nil,
          @summary : String? = nil
        )
        end
      end

      # Unable to override because the condition does not allow overrides.

      struct ConditionNotOverridableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Information about the state of the condition.

      struct ConditionState
        include JSON::Serializable

        # The state of the latest run of the rule.

        @[JSON::Field(key: "latestExecution")]
        getter latest_execution : Types::ConditionExecution?

        # The state of the rules for the condition.

        @[JSON::Field(key: "ruleStates")]
        getter rule_states : Array(Types::RuleState)?

        def initialize(
          @latest_execution : Types::ConditionExecution? = nil,
          @rule_states : Array(Types::RuleState)? = nil
        )
        end
      end

      # Your request cannot be handled because the pipeline is busy handling ongoing activities. Try again
      # later.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input of a CreateCustomActionType operation.

      struct CreateCustomActionTypeInput
        include JSON::Serializable

        # The category of the custom action, such as a build action or a test action.

        @[JSON::Field(key: "category")]
        getter category : String

        # The details of the input artifact for the action, such as its commit ID.

        @[JSON::Field(key: "inputArtifactDetails")]
        getter input_artifact_details : Types::ArtifactDetails

        # The details of the output artifact of the action, such as its commit ID.

        @[JSON::Field(key: "outputArtifactDetails")]
        getter output_artifact_details : Types::ArtifactDetails

        # The provider of the service used in the custom action, such as CodeDeploy.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # The version identifier of the custom action.

        @[JSON::Field(key: "version")]
        getter version : String

        # The configuration properties for the custom action. You can refer to a name in the configuration
        # properties of the custom action within the URL templates by following the format of {Config:name},
        # as long as the configuration property is both required and not secret. For more information, see
        # Create a Custom Action for a Pipeline .

        @[JSON::Field(key: "configurationProperties")]
        getter configuration_properties : Array(Types::ActionConfigurationProperty)?

        # URLs that provide users information about this custom action.

        @[JSON::Field(key: "settings")]
        getter settings : Types::ActionTypeSettings?

        # The tags for the custom action.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @category : String,
          @input_artifact_details : Types::ArtifactDetails,
          @output_artifact_details : Types::ArtifactDetails,
          @provider : String,
          @version : String,
          @configuration_properties : Array(Types::ActionConfigurationProperty)? = nil,
          @settings : Types::ActionTypeSettings? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the output of a CreateCustomActionType operation.

      struct CreateCustomActionTypeOutput
        include JSON::Serializable

        # Returns information about the details of an action type.

        @[JSON::Field(key: "actionType")]
        getter action_type : Types::ActionType

        # Specifies the tags applied to the custom action.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @action_type : Types::ActionType,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the input of a CreatePipeline action.

      struct CreatePipelineInput
        include JSON::Serializable

        # Represents the structure of actions and stages to be performed in the pipeline.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::PipelineDeclaration

        # The tags for the pipeline.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pipeline : Types::PipelineDeclaration,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents the output of a CreatePipeline action.

      struct CreatePipelineOutput
        include JSON::Serializable

        # Represents the structure of actions and stages to be performed in the pipeline.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::PipelineDeclaration?

        # Specifies the tags applied to the pipeline.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @pipeline : Types::PipelineDeclaration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Represents information about a current revision.

      struct CurrentRevision
        include JSON::Serializable

        # The change identifier for the current revision.

        @[JSON::Field(key: "changeIdentifier")]
        getter change_identifier : String

        # The revision ID of the current version of an artifact.

        @[JSON::Field(key: "revision")]
        getter revision : String

        # The date and time when the most recent revision of the artifact was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The summary of the most recent revision of the artifact.

        @[JSON::Field(key: "revisionSummary")]
        getter revision_summary : String?

        def initialize(
          @change_identifier : String,
          @revision : String,
          @created : Time? = nil,
          @revision_summary : String? = nil
        )
        end
      end

      # Represents the input of a DeleteCustomActionType operation. The custom action will be marked as
      # deleted.

      struct DeleteCustomActionTypeInput
        include JSON::Serializable

        # The category of the custom action that you want to delete, such as source or deploy.

        @[JSON::Field(key: "category")]
        getter category : String

        # The provider of the service used in the custom action, such as CodeDeploy.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # The version of the custom action to delete.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @category : String,
          @provider : String,
          @version : String
        )
        end
      end

      # Represents the input of a DeletePipeline action.

      struct DeletePipelineInput
        include JSON::Serializable

        # The name of the pipeline to be deleted.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteWebhookInput
        include JSON::Serializable

        # The name of the webhook you want to delete.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end


      struct DeleteWebhookOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The target for the deploy action.

      struct DeployActionExecutionTarget
        include JSON::Serializable

        # The end time for the deploy action.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The lifecycle events for the deploy action.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::DeployTargetEvent)?

        # The start time for the deploy action.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the deploy action.

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ID of the target for the deploy action.

        @[JSON::Field(key: "targetId")]
        getter target_id : String?

        # The type of target for the deploy action.

        @[JSON::Field(key: "targetType")]
        getter target_type : String?

        def initialize(
          @end_time : Time? = nil,
          @events : Array(Types::DeployTargetEvent)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @target_id : String? = nil,
          @target_type : String? = nil
        )
        end
      end

      # A lifecycle event for the deploy action.

      struct DeployTargetEvent
        include JSON::Serializable

        # The context for the event for the deploy action.

        @[JSON::Field(key: "context")]
        getter context : Types::DeployTargetEventContext?

        # The end time for the event for the deploy action.

        @[JSON::Field(key: "endTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter end_time : Time?

        # The name of the event for the deploy action.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The start time for the event for the deploy action.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the event for the deploy action.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @context : Types::DeployTargetEventContext? = nil,
          @end_time : Time? = nil,
          @name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # The context for the event for the deploy action.

      struct DeployTargetEventContext
        include JSON::Serializable

        # The context message for the event for the deploy action.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The command ID for the event for the deploy action.

        @[JSON::Field(key: "ssmCommandId")]
        getter ssm_command_id : String?

        def initialize(
          @message : String? = nil,
          @ssm_command_id : String? = nil
        )
        end
      end


      struct DeregisterWebhookWithThirdPartyInput
        include JSON::Serializable

        # The name of the webhook you want to deregister.

        @[JSON::Field(key: "webhookName")]
        getter webhook_name : String?

        def initialize(
          @webhook_name : String? = nil
        )
        end
      end


      struct DeregisterWebhookWithThirdPartyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a DisableStageTransition action.

      struct DisableStageTransitionInput
        include JSON::Serializable

        # The name of the pipeline in which you want to disable the flow of artifacts from one stage to
        # another.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The reason given to the user that a stage is disabled, such as waiting for manual approval or manual
        # tests. This message is displayed in the pipeline console UI.

        @[JSON::Field(key: "reason")]
        getter reason : String

        # The name of the stage where you want to disable the inbound or outbound transition of artifacts.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # Specifies whether artifacts are prevented from transitioning into the stage and being processed by
        # the actions in that stage (inbound), or prevented from transitioning from the stage after they have
        # been processed by the actions in that stage (outbound).

        @[JSON::Field(key: "transitionType")]
        getter transition_type : String

        def initialize(
          @pipeline_name : String,
          @reason : String,
          @stage_name : String,
          @transition_type : String
        )
        end
      end

      # The pipeline execution is already in a Stopping state. If you already chose to stop and wait, you
      # cannot make that request again. You can choose to stop and abandon now, but be aware that this
      # option can lead to failed tasks or out of sequence tasks. If you already chose to stop and abandon,
      # you cannot make that request again.

      struct DuplicatedStopRequestException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents the input of an EnableStageTransition action.

      struct EnableStageTransitionInput
        include JSON::Serializable

        # The name of the pipeline in which you want to enable the flow of artifacts from one stage to
        # another.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The name of the stage where you want to enable the transition of artifacts, either into the stage
        # (inbound) or from that stage to the next stage (outbound).

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # Specifies whether artifacts are allowed to enter the stage and be processed by the actions in that
        # stage (inbound) or whether already processed artifacts are allowed to transition to the next stage
        # (outbound).

        @[JSON::Field(key: "transitionType")]
        getter transition_type : String

        def initialize(
          @pipeline_name : String,
          @stage_name : String,
          @transition_type : String
        )
        end
      end

      # Represents information about the key used to encrypt data in the artifact store, such as an Amazon
      # Web Services Key Management Service (Key Management Service) key.

      struct EncryptionKey
        include JSON::Serializable

        # The ID used to identify the key. For an Amazon Web Services KMS key, you can use the key ID, the key
        # ARN, or the alias ARN. Aliases are recognized only in the account that created the KMS key. For
        # cross-account actions, you can only use the key ID or key ARN to identify the key. Cross-account
        # actions involve using the role from the other account (AccountB), so specifying the key ID will use
        # the key from the other account (AccountB).

        @[JSON::Field(key: "id")]
        getter id : String

        # The type of encryption key, such as an Amazon Web Services KMS key. When creating or updating a
        # pipeline, the value must be set to 'KMS'.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @id : String,
          @type : String
        )
        end
      end

      # The environment variables for the action.

      struct EnvironmentVariable
        include JSON::Serializable

        # The environment variable name in the key-value pair.

        @[JSON::Field(key: "name")]
        getter name : String

        # The environment variable value in the key-value pair.

        @[JSON::Field(key: "value")]
        getter value : String

        # Specifies the type of use for the environment variable value. The value can be either PLAINTEXT or
        # SECRETS_MANAGER . If the value is SECRETS_MANAGER , provide the Secrets reference in the
        # EnvironmentVariable value.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @name : String,
          @value : String,
          @type : String? = nil
        )
        end
      end

      # Represents information about an error in CodePipeline.

      struct ErrorDetails
        include JSON::Serializable

        # The system ID or number code of the error.

        @[JSON::Field(key: "code")]
        getter code : String?

        # The text of the error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @code : String? = nil,
          @message : String? = nil
        )
        end
      end

      # The details of the actions taken and results produced on an artifact as it passes through stages in
      # the pipeline.

      struct ExecutionDetails
        include JSON::Serializable

        # The system-generated unique ID of this action used to identify this job worker in any external
        # systems, such as CodeDeploy.

        @[JSON::Field(key: "externalExecutionId")]
        getter external_execution_id : String?

        # The percentage of work completed on the action, represented on a scale of 0 to 100 percent.

        @[JSON::Field(key: "percentComplete")]
        getter percent_complete : Int32?

        # The summary of the current status of the actions.

        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @external_execution_id : String? = nil,
          @percent_complete : Int32? = nil,
          @summary : String? = nil
        )
        end
      end

      # The interaction or event that started a pipeline execution.

      struct ExecutionTrigger
        include JSON::Serializable

        # Detail related to the event that started a pipeline execution, such as the webhook ARN of the
        # webhook that triggered the pipeline execution or the user ARN for a user-initiated
        # start-pipeline-execution CLI command.

        @[JSON::Field(key: "triggerDetail")]
        getter trigger_detail : String?

        # The type of change-detection method, command, or user interaction that started a pipeline execution.

        @[JSON::Field(key: "triggerType")]
        getter trigger_type : String?

        def initialize(
          @trigger_detail : String? = nil,
          @trigger_type : String? = nil
        )
        end
      end

      # The action engine, or executor, related to the supported integration model used to create and update
      # the action type. The available executor types are Lambda and JobWorker .

      struct ExecutorConfiguration
        include JSON::Serializable

        # Details about the JobWorker executor of the action type.

        @[JSON::Field(key: "jobWorkerExecutorConfiguration")]
        getter job_worker_executor_configuration : Types::JobWorkerExecutorConfiguration?

        # Details about the Lambda executor of the action type.

        @[JSON::Field(key: "lambdaExecutorConfiguration")]
        getter lambda_executor_configuration : Types::LambdaExecutorConfiguration?

        def initialize(
          @job_worker_executor_configuration : Types::JobWorkerExecutorConfiguration? = nil,
          @lambda_executor_configuration : Types::LambdaExecutorConfiguration? = nil
        )
        end
      end

      # The configuration that specifies the result, such as rollback, to occur upon stage failure. For more
      # information about conditions, see Stage conditions and How do stage conditions work? .

      struct FailureConditions
        include JSON::Serializable

        # The conditions that are configured as failure conditions. For more information about conditions, see
        # Stage conditions and How do stage conditions work? .

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::Condition)?

        # The specified result for when the failure conditions are met, such as rolling back the stage.

        @[JSON::Field(key: "result")]
        getter result : String?

        # The retry configuration specifies automatic retry for a failed stage, along with the configured
        # retry mode.

        @[JSON::Field(key: "retryConfiguration")]
        getter retry_configuration : Types::RetryConfiguration?

        def initialize(
          @conditions : Array(Types::Condition)? = nil,
          @result : String? = nil,
          @retry_configuration : Types::RetryConfiguration? = nil
        )
        end
      end

      # Represents information about failure details.

      struct FailureDetails
        include JSON::Serializable

        # The message about the failure.

        @[JSON::Field(key: "message")]
        getter message : String

        # The type of the failure.

        @[JSON::Field(key: "type")]
        getter type : String

        # The external ID of the run of the action that failed.

        @[JSON::Field(key: "externalExecutionId")]
        getter external_execution_id : String?

        def initialize(
          @message : String,
          @type : String,
          @external_execution_id : String? = nil
        )
        end
      end


      struct GetActionTypeInput
        include JSON::Serializable

        # Defines what kind of action can be taken in the stage. The following are the valid values: Source
        # Build Test Deploy Approval Invoke Compute

        @[JSON::Field(key: "category")]
        getter category : String

        # The creator of an action type that was created with any supported integration model. There are two
        # valid values: AWS and ThirdParty .

        @[JSON::Field(key: "owner")]
        getter owner : String

        # The provider of the action type being called. The provider name is specified when the action type is
        # created.

        @[JSON::Field(key: "provider")]
        getter provider : String

        # A string that describes the action type version.

        @[JSON::Field(key: "version")]
        getter version : String

        def initialize(
          @category : String,
          @owner : String,
          @provider : String,
          @version : String
        )
        end
      end


      struct GetActionTypeOutput
        include JSON::Serializable

        # The action type information for the requested action type, such as the action type ID.

        @[JSON::Field(key: "actionType")]
        getter action_type : Types::ActionTypeDeclaration?

        def initialize(
          @action_type : Types::ActionTypeDeclaration? = nil
        )
        end
      end

      # Represents the input of a GetJobDetails action.

      struct GetJobDetailsInput
        include JSON::Serializable

        # The unique system-generated ID for the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @job_id : String
        )
        end
      end

      # Represents the output of a GetJobDetails action.

      struct GetJobDetailsOutput
        include JSON::Serializable

        # The details of the job. If AWSSessionCredentials is used, a long-running job can call GetJobDetails
        # again to obtain new credentials.

        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::JobDetails?

        def initialize(
          @job_details : Types::JobDetails? = nil
        )
        end
      end

      # Represents the input of a GetPipelineExecution action.

      struct GetPipelineExecutionInput
        include JSON::Serializable

        # The ID of the pipeline execution about which you want to get execution details.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        # The name of the pipeline about which you want to get execution details.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        def initialize(
          @pipeline_execution_id : String,
          @pipeline_name : String
        )
        end
      end

      # Represents the output of a GetPipelineExecution action.

      struct GetPipelineExecutionOutput
        include JSON::Serializable

        # Represents information about the execution of a pipeline.

        @[JSON::Field(key: "pipelineExecution")]
        getter pipeline_execution : Types::PipelineExecution?

        def initialize(
          @pipeline_execution : Types::PipelineExecution? = nil
        )
        end
      end

      # Represents the input of a GetPipeline action.

      struct GetPipelineInput
        include JSON::Serializable

        # The name of the pipeline for which you want to get information. Pipeline names must be unique in an
        # Amazon Web Services account.

        @[JSON::Field(key: "name")]
        getter name : String

        # The version number of the pipeline. If you do not specify a version, defaults to the current
        # version.

        @[JSON::Field(key: "version")]
        getter version : Int32?

        def initialize(
          @name : String,
          @version : Int32? = nil
        )
        end
      end

      # Represents the output of a GetPipeline action.

      struct GetPipelineOutput
        include JSON::Serializable

        # Represents the pipeline metadata information returned as part of the output of a GetPipeline action.

        @[JSON::Field(key: "metadata")]
        getter metadata : Types::PipelineMetadata?

        # Represents the structure of actions and stages to be performed in the pipeline.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::PipelineDeclaration?

        def initialize(
          @metadata : Types::PipelineMetadata? = nil,
          @pipeline : Types::PipelineDeclaration? = nil
        )
        end
      end

      # Represents the input of a GetPipelineState action.

      struct GetPipelineStateInput
        include JSON::Serializable

        # The name of the pipeline about which you want to get information.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # Represents the output of a GetPipelineState action.

      struct GetPipelineStateOutput
        include JSON::Serializable

        # The date and time the pipeline was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The name of the pipeline for which you want to get the state.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String?

        # The version number of the pipeline. A newly created pipeline is always assigned a version number of
        # 1 .

        @[JSON::Field(key: "pipelineVersion")]
        getter pipeline_version : Int32?

        # A list of the pipeline stage output information, including stage name, state, most recent run
        # details, whether the stage is disabled, and other data.

        @[JSON::Field(key: "stageStates")]
        getter stage_states : Array(Types::StageState)?

        # The date and time the pipeline was last updated, in timestamp format.

        @[JSON::Field(key: "updated", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated : Time?

        def initialize(
          @created : Time? = nil,
          @pipeline_name : String? = nil,
          @pipeline_version : Int32? = nil,
          @stage_states : Array(Types::StageState)? = nil,
          @updated : Time? = nil
        )
        end
      end

      # Represents the input of a GetThirdPartyJobDetails action.

      struct GetThirdPartyJobDetailsInput
        include JSON::Serializable

        # The clientToken portion of the clientId and clientToken pair used to verify that the calling entity
        # is allowed access to the job and its details.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The unique system-generated ID used for identifying the job.

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @client_token : String,
          @job_id : String
        )
        end
      end

      # Represents the output of a GetThirdPartyJobDetails action.

      struct GetThirdPartyJobDetailsOutput
        include JSON::Serializable

        # The details of the job, including any protected values defined for the job.

        @[JSON::Field(key: "jobDetails")]
        getter job_details : Types::ThirdPartyJobDetails?

        def initialize(
          @job_details : Types::ThirdPartyJobDetails? = nil
        )
        end
      end

      # The Git repository branches specified as filter criteria to start the pipeline.

      struct GitBranchFilterCriteria
        include JSON::Serializable

        # The list of patterns of Git branches that, when a commit is pushed, are to be excluded from starting
        # the pipeline.

        @[JSON::Field(key: "excludes")]
        getter excludes : Array(String)?

        # The list of patterns of Git branches that, when a commit is pushed, are to be included as criteria
        # that starts the pipeline.

        @[JSON::Field(key: "includes")]
        getter includes : Array(String)?

        def initialize(
          @excludes : Array(String)? = nil,
          @includes : Array(String)? = nil
        )
        end
      end

      # A type of trigger configuration for Git-based source actions. You can specify the Git configuration
      # trigger type for all third-party Git-based source actions that are supported by the
      # CodeStarSourceConnection action type.

      struct GitConfiguration
        include JSON::Serializable

        # The name of the pipeline source action where the trigger configuration, such as Git tags, is
        # specified. The trigger configuration will start the pipeline upon the specified change only. You can
        # only specify one trigger configuration per source action.

        @[JSON::Field(key: "sourceActionName")]
        getter source_action_name : String

        # The field where the repository event that will start the pipeline is specified as pull requests.

        @[JSON::Field(key: "pullRequest")]
        getter pull_request : Array(Types::GitPullRequestFilter)?

        # The field where the repository event that will start the pipeline, such as pushing Git tags, is
        # specified with details.

        @[JSON::Field(key: "push")]
        getter push : Array(Types::GitPushFilter)?

        def initialize(
          @source_action_name : String,
          @pull_request : Array(Types::GitPullRequestFilter)? = nil,
          @push : Array(Types::GitPushFilter)? = nil
        )
        end
      end

      # The Git repository file paths specified as filter criteria to start the pipeline.

      struct GitFilePathFilterCriteria
        include JSON::Serializable

        # The list of patterns of Git repository file paths that, when a commit is pushed, are to be excluded
        # from starting the pipeline.

        @[JSON::Field(key: "excludes")]
        getter excludes : Array(String)?

        # The list of patterns of Git repository file paths that, when a commit is pushed, are to be included
        # as criteria that starts the pipeline.

        @[JSON::Field(key: "includes")]
        getter includes : Array(String)?

        def initialize(
          @excludes : Array(String)? = nil,
          @includes : Array(String)? = nil
        )
        end
      end

      # The event criteria for the pull request trigger configuration, such as the lists of branches or file
      # paths to include and exclude. The following are valid values for the events for this filter: CLOSED
      # OPEN UPDATED

      struct GitPullRequestFilter
        include JSON::Serializable

        # The field that specifies to filter on branches for the pull request trigger configuration.

        @[JSON::Field(key: "branches")]
        getter branches : Types::GitBranchFilterCriteria?

        # The field that specifies which pull request events to filter on (OPEN, UPDATED, CLOSED) for the
        # trigger configuration.

        @[JSON::Field(key: "events")]
        getter events : Array(String)?

        # The field that specifies to filter on file paths for the pull request trigger configuration.

        @[JSON::Field(key: "filePaths")]
        getter file_paths : Types::GitFilePathFilterCriteria?

        def initialize(
          @branches : Types::GitBranchFilterCriteria? = nil,
          @events : Array(String)? = nil,
          @file_paths : Types::GitFilePathFilterCriteria? = nil
        )
        end
      end

      # The event criteria that specify when a specified repository event will start the pipeline for the
      # specified trigger configuration, such as the lists of Git tags to include and exclude.

      struct GitPushFilter
        include JSON::Serializable

        # The field that specifies to filter on branches for the push trigger configuration.

        @[JSON::Field(key: "branches")]
        getter branches : Types::GitBranchFilterCriteria?

        # The field that specifies to filter on file paths for the push trigger configuration.

        @[JSON::Field(key: "filePaths")]
        getter file_paths : Types::GitFilePathFilterCriteria?

        # The field that contains the details for the Git tags trigger configuration.

        @[JSON::Field(key: "tags")]
        getter tags : Types::GitTagFilterCriteria?

        def initialize(
          @branches : Types::GitBranchFilterCriteria? = nil,
          @file_paths : Types::GitFilePathFilterCriteria? = nil,
          @tags : Types::GitTagFilterCriteria? = nil
        )
        end
      end

      # The Git tags specified as filter criteria for whether a Git tag repository event will start the
      # pipeline.

      struct GitTagFilterCriteria
        include JSON::Serializable

        # The list of patterns of Git tags that, when pushed, are to be excluded from starting the pipeline.

        @[JSON::Field(key: "excludes")]
        getter excludes : Array(String)?

        # The list of patterns of Git tags that, when pushed, are to be included as criteria that starts the
        # pipeline.

        @[JSON::Field(key: "includes")]
        getter includes : Array(String)?

        def initialize(
          @excludes : Array(String)? = nil,
          @includes : Array(String)? = nil
        )
        end
      end

      # Represents information about an artifact to be worked on, such as a test or build artifact.

      struct InputArtifact
        include JSON::Serializable

        # The name of the artifact to be worked on (for example, "My App"). Artifacts are the files that are
        # worked on by actions in the pipeline. See the action configuration for each action for details about
        # artifact parameters. For example, the S3 source action input artifact is a file name (or file path),
        # and the files are generally provided as a ZIP file. Example artifact name: SampleApp_Windows.zip The
        # input artifact of an action must exactly match the output artifact declared in a preceding action,
        # but the input artifact does not have to be the next action in strict sequence from the action that
        # provided the output artifact. Actions in parallel can declare different output artifacts, which are
        # in turn consumed by different following actions.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @name : String
        )
        end
      end

      # The action declaration was specified in an invalid format.

      struct InvalidActionDeclarationException
        include JSON::Serializable

        def initialize
        end
      end

      # The approval request already received a response or has expired.

      struct InvalidApprovalTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource ARN is invalid.

      struct InvalidArnException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Reserved for future use.

      struct InvalidBlockerDeclarationException
        include JSON::Serializable

        def initialize
        end
      end

      # The client token was specified in an invalid format

      struct InvalidClientTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # The job was specified in an invalid format or cannot be found.

      struct InvalidJobException
        include JSON::Serializable

        def initialize
        end
      end

      # The job state was specified in an invalid format.

      struct InvalidJobStateException
        include JSON::Serializable

        def initialize
        end
      end

      # The next token was specified in an invalid format. Make sure that the next token you provide is the
      # token returned by a previous call.

      struct InvalidNextTokenException
        include JSON::Serializable

        def initialize
        end
      end

      # The nonce was specified in an invalid format.

      struct InvalidNonceException
        include JSON::Serializable

        def initialize
        end
      end

      # The stage declaration was specified in an invalid format.

      struct InvalidStageDeclarationException
        include JSON::Serializable

        def initialize
        end
      end

      # The structure was specified in an invalid format.

      struct InvalidStructureException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified resource tags are invalid.

      struct InvalidTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified authentication type is in an invalid format.

      struct InvalidWebhookAuthenticationParametersException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified event filter rule is in an invalid format.

      struct InvalidWebhookFilterPatternException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents information about a job.

      struct Job
        include JSON::Serializable

        # The ID of the Amazon Web Services account to use when performing the job.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Other data about a job.

        @[JSON::Field(key: "data")]
        getter data : Types::JobData?

        # The unique system-generated ID of the job.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A system-generated random number that CodePipeline uses to ensure that the job is being worked on by
        # only one job worker. Use this number in an AcknowledgeJob request.

        @[JSON::Field(key: "nonce")]
        getter nonce : String?

        def initialize(
          @account_id : String? = nil,
          @data : Types::JobData? = nil,
          @id : String? = nil,
          @nonce : String? = nil
        )
        end
      end

      # Represents other information about a job required for a job worker to complete the job.

      struct JobData
        include JSON::Serializable

        # Represents information about an action configuration.

        @[JSON::Field(key: "actionConfiguration")]
        getter action_configuration : Types::ActionConfiguration?

        # Represents information about an action type.

        @[JSON::Field(key: "actionTypeId")]
        getter action_type_id : Types::ActionTypeId?

        # Represents an Amazon Web Services session credentials object. These credentials are temporary
        # credentials that are issued by Amazon Web Services Secure Token Service (STS). They can be used to
        # access input and output artifacts in the S3 bucket used to store artifacts for the pipeline in
        # CodePipeline.

        @[JSON::Field(key: "artifactCredentials")]
        getter artifact_credentials : Types::AWSSessionCredentials?

        # A system-generated token, such as a deployment ID, required by a job to continue the job
        # asynchronously.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # Represents information about the key used to encrypt data in the artifact store, such as an KMS key.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        # The artifact supplied to the job.

        @[JSON::Field(key: "inputArtifacts")]
        getter input_artifacts : Array(Types::Artifact)?

        # The output of the job.

        @[JSON::Field(key: "outputArtifacts")]
        getter output_artifacts : Array(Types::Artifact)?

        # Represents information about a pipeline to a job worker. Includes pipelineArn and
        # pipelineExecutionId for custom jobs.

        @[JSON::Field(key: "pipelineContext")]
        getter pipeline_context : Types::PipelineContext?

        def initialize(
          @action_configuration : Types::ActionConfiguration? = nil,
          @action_type_id : Types::ActionTypeId? = nil,
          @artifact_credentials : Types::AWSSessionCredentials? = nil,
          @continuation_token : String? = nil,
          @encryption_key : Types::EncryptionKey? = nil,
          @input_artifacts : Array(Types::Artifact)? = nil,
          @output_artifacts : Array(Types::Artifact)? = nil,
          @pipeline_context : Types::PipelineContext? = nil
        )
        end
      end

      # Represents information about the details of a job.

      struct JobDetails
        include JSON::Serializable

        # The Amazon Web Services account ID associated with the job.

        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # Represents other information about a job required for a job worker to complete the job.

        @[JSON::Field(key: "data")]
        getter data : Types::JobData?

        # The unique system-generated ID of the job.

        @[JSON::Field(key: "id")]
        getter id : String?

        def initialize(
          @account_id : String? = nil,
          @data : Types::JobData? = nil,
          @id : String? = nil
        )
        end
      end

      # The job was specified in an invalid format or cannot be found.

      struct JobNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Details about the polling configuration for the JobWorker action engine, or executor.

      struct JobWorkerExecutorConfiguration
        include JSON::Serializable

        # The accounts in which the job worker is configured and might poll for jobs as part of the action
        # execution.

        @[JSON::Field(key: "pollingAccounts")]
        getter polling_accounts : Array(String)?

        # The service Principals in which the job worker is configured and might poll for jobs as part of the
        # action execution.

        @[JSON::Field(key: "pollingServicePrincipals")]
        getter polling_service_principals : Array(String)?

        def initialize(
          @polling_accounts : Array(String)? = nil,
          @polling_service_principals : Array(String)? = nil
        )
        end
      end

      # Details about the configuration for the Lambda action engine, or executor.

      struct LambdaExecutorConfiguration
        include JSON::Serializable

        # The ARN of the Lambda function used by the action engine.

        @[JSON::Field(key: "lambdaFunctionArn")]
        getter lambda_function_arn : String

        def initialize(
          @lambda_function_arn : String
        )
        end
      end

      # The field that specifies to filter on the latest execution in the pipeline. Filtering on the latest
      # execution is available for executions run on or after February 08, 2024.

      struct LatestInPipelineExecutionFilter
        include JSON::Serializable

        # The execution ID for the latest execution in the pipeline.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        # The start time to filter on for the latest execution in the pipeline. Valid options: All Latest

        @[JSON::Field(key: "startTimeRange")]
        getter start_time_range : String

        def initialize(
          @pipeline_execution_id : String,
          @start_time_range : String
        )
        end
      end

      # The number of pipelines associated with the Amazon Web Services account has exceeded the limit
      # allowed for the account.

      struct LimitExceededException
        include JSON::Serializable

        def initialize
        end
      end


      struct ListActionExecutionsInput
        include JSON::Serializable

        # The name of the pipeline for which you want to list action execution history.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # Input information used to filter action execution history.

        @[JSON::Field(key: "filter")]
        getter filter : Types::ActionExecutionFilter?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. Action execution history is retained for up to 12
        # months, based on action execution start times. Default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous ListActionExecutions call, which can be used to return
        # the next set of action executions in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @pipeline_name : String,
          @filter : Types::ActionExecutionFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListActionExecutionsOutput
        include JSON::Serializable

        # The details for a list of recent executions, such as action execution ID.

        @[JSON::Field(key: "actionExecutionDetails")]
        getter action_execution_details : Array(Types::ActionExecutionDetail)?

        # If the amount of returned information is significantly large, an identifier is also returned and can
        # be used in a subsequent ListActionExecutions call to return the next set of action executions in the
        # list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @action_execution_details : Array(Types::ActionExecutionDetail)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the input of a ListActionTypes action.

      struct ListActionTypesInput
        include JSON::Serializable

        # Filters the list of action types to those created by a specified entity.

        @[JSON::Field(key: "actionOwnerFilter")]
        getter action_owner_filter : String?

        # An identifier that was returned from the previous list action types call, which can be used to
        # return the next set of action types in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Region to filter on for the list of action types.

        @[JSON::Field(key: "regionFilter")]
        getter region_filter : String?

        def initialize(
          @action_owner_filter : String? = nil,
          @next_token : String? = nil,
          @region_filter : String? = nil
        )
        end
      end

      # Represents the output of a ListActionTypes action.

      struct ListActionTypesOutput
        include JSON::Serializable

        # Provides details of the action types.

        @[JSON::Field(key: "actionTypes")]
        getter action_types : Array(Types::ActionType)

        # If the amount of returned information is significantly large, an identifier is also returned. It can
        # be used in a subsequent list action types call to return the next set of action types in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @action_types : Array(Types::ActionType),
          @next_token : String? = nil
        )
        end
      end


      struct ListDeployActionExecutionTargetsInput
        include JSON::Serializable

        # The execution ID for the deploy action.

        @[JSON::Field(key: "actionExecutionId")]
        getter action_execution_id : String

        # Filters the targets for a specified deploy action.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::TargetFilter)?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous list action types call, which can be used to
        # return the next set of action types in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the pipeline with the deploy action.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String?

        def initialize(
          @action_execution_id : String,
          @filters : Array(Types::TargetFilter)? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @pipeline_name : String? = nil
        )
        end
      end


      struct ListDeployActionExecutionTargetsOutput
        include JSON::Serializable

        # An identifier that was returned from the previous list action types call, which can be used to
        # return the next set of action types in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The targets for the deploy action.

        @[JSON::Field(key: "targets")]
        getter targets : Array(Types::DeployActionExecutionTarget)?

        def initialize(
          @next_token : String? = nil,
          @targets : Array(Types::DeployActionExecutionTarget)? = nil
        )
        end
      end

      # Represents the input of a ListPipelineExecutions action.

      struct ListPipelineExecutionsInput
        include JSON::Serializable

        # The name of the pipeline for which you want to get execution summary information.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The pipeline execution to filter on.

        @[JSON::Field(key: "filter")]
        getter filter : Types::PipelineExecutionFilter?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. Pipeline history is limited to the most recent 12
        # months, based on pipeline execution start times. Default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous ListPipelineExecutions call, which can be used to
        # return the next set of pipeline executions in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @pipeline_name : String,
          @filter : Types::PipelineExecutionFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListPipelineExecutions action.

      struct ListPipelineExecutionsOutput
        include JSON::Serializable

        # A token that can be used in the next ListPipelineExecutions call. To view all items in the list,
        # continue to call this operation with each subsequent token until no more nextToken values are
        # returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # A list of executions in the history of a pipeline.

        @[JSON::Field(key: "pipelineExecutionSummaries")]
        getter pipeline_execution_summaries : Array(Types::PipelineExecutionSummary)?

        def initialize(
          @next_token : String? = nil,
          @pipeline_execution_summaries : Array(Types::PipelineExecutionSummary)? = nil
        )
        end
      end

      # Represents the input of a ListPipelines action.

      struct ListPipelinesInput
        include JSON::Serializable

        # The maximum number of pipelines to return in a single call. To retrieve the remaining pipelines,
        # make another call with the returned nextToken value. The minimum value you can specify is 1. The
        # maximum accepted value is 1000.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # An identifier that was returned from the previous list pipelines call. It can be used to return the
        # next set of pipelines in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Represents the output of a ListPipelines action.

      struct ListPipelinesOutput
        include JSON::Serializable

        # If the amount of returned information is significantly large, an identifier is also returned. It can
        # be used in a subsequent list pipelines call to return the next set of pipelines in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The list of pipelines.

        @[JSON::Field(key: "pipelines")]
        getter pipelines : Array(Types::PipelineSummary)?

        def initialize(
          @next_token : String? = nil,
          @pipelines : Array(Types::PipelineSummary)? = nil
        )
        end
      end


      struct ListRuleExecutionsInput
        include JSON::Serializable

        # The name of the pipeline for which you want to get execution summary information.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # Input information used to filter rule execution history.

        @[JSON::Field(key: "filter")]
        getter filter : Types::RuleExecutionFilter?

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value. Pipeline history is limited to the most recent 12
        # months, based on pipeline execution start times. Default value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous ListRuleExecutions call, which can be used to return
        # the next set of rule executions in the list.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @pipeline_name : String,
          @filter : Types::RuleExecutionFilter? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListRuleExecutionsOutput
        include JSON::Serializable

        # A token that can be used in the next ListRuleExecutions call. To view all items in the list,
        # continue to call this operation with each subsequent token until no more nextToken values are
        # returned.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Details about the output for listing rule executions.

        @[JSON::Field(key: "ruleExecutionDetails")]
        getter rule_execution_details : Array(Types::RuleExecutionDetail)?

        def initialize(
          @next_token : String? = nil,
          @rule_execution_details : Array(Types::RuleExecutionDetail)? = nil
        )
        end
      end


      struct ListRuleTypesInput
        include JSON::Serializable

        # The rule Region to filter on.

        @[JSON::Field(key: "regionFilter")]
        getter region_filter : String?

        # The rule owner to filter on.

        @[JSON::Field(key: "ruleOwnerFilter")]
        getter rule_owner_filter : String?

        def initialize(
          @region_filter : String? = nil,
          @rule_owner_filter : String? = nil
        )
        end
      end


      struct ListRuleTypesOutput
        include JSON::Serializable

        # Lists the rules that are configured for the condition.

        @[JSON::Field(key: "ruleTypes")]
        getter rule_types : Array(Types::RuleType)

        def initialize(
          @rule_types : Array(Types::RuleType)
        )
        end
      end


      struct ListTagsForResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to get tags for.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The maximum number of results to return in a single call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous API call, which would be used to return the next page
        # of the list. The ListTagsforResource call lists all available tags in one call and does not use
        # pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @resource_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceOutput
        include JSON::Serializable

        # If the amount of returned information is significantly large, an identifier is also returned and can
        # be used in a subsequent API call to return the next page of the list. The ListTagsforResource call
        # lists all available tags in one call and does not use pagination.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The tags for the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @next_token : String? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The detail returned for each webhook after listing webhooks, such as the webhook URL, the webhook
      # name, and the webhook ARN.

      struct ListWebhookItem
        include JSON::Serializable

        # The detail returned for each webhook, such as the webhook authentication type and filter rules.

        @[JSON::Field(key: "definition")]
        getter definition : Types::WebhookDefinition

        # A unique URL generated by CodePipeline. When a POST request is made to this URL, the defined
        # pipeline is started as long as the body of the post request satisfies the defined authentication and
        # filtering conditions. Deleting and re-creating a webhook makes the old URL invalid and generates a
        # new one.

        @[JSON::Field(key: "url")]
        getter url : String

        # The Amazon Resource Name (ARN) of the webhook.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The number code of the error.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # The text of the error message about the webhook.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # The date and time a webhook was last successfully triggered, in timestamp format.

        @[JSON::Field(key: "lastTriggered", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_triggered : Time?

        # Specifies the tags applied to the webhook.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @definition : Types::WebhookDefinition,
          @url : String,
          @arn : String? = nil,
          @error_code : String? = nil,
          @error_message : String? = nil,
          @last_triggered : Time? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct ListWebhooksInput
        include JSON::Serializable

        # The maximum number of results to return in a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.

        @[JSON::Field(key: "MaxResults")]
        getter max_results : Int32?

        # The token that was returned from the previous ListWebhooks call, which can be used to return the
        # next set of webhooks in the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListWebhooksOutput
        include JSON::Serializable

        # If the amount of returned information is significantly large, an identifier is also returned and can
        # be used in a subsequent ListWebhooks call to return the next set of webhooks in the list.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The JSON detail returned for each webhook in the list output for the ListWebhooks call.

        @[JSON::Field(key: "webhooks")]
        getter webhooks : Array(Types::ListWebhookItem)?

        def initialize(
          @next_token : String? = nil,
          @webhooks : Array(Types::ListWebhookItem)? = nil
        )
        end
      end

      # The stage has failed in a later run of the pipeline and the pipelineExecutionId associated with the
      # request is out of date.

      struct NotLatestPipelineExecutionException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents information about the output of an action.

      struct OutputArtifact
        include JSON::Serializable

        # The name of the output of an artifact, such as "My App". The input artifact of an action must
        # exactly match the output artifact declared in a preceding action, but the input artifact does not
        # have to be the next action in strict sequence from the action that provided the output artifact.
        # Actions in parallel can declare different output artifacts, which are in turn consumed by different
        # following actions. Output artifact names must be unique within a pipeline.

        @[JSON::Field(key: "name")]
        getter name : String

        # The files that you want to associate with the output artifact that will be exported from the compute
        # action.

        @[JSON::Field(key: "files")]
        getter files : Array(String)?

        def initialize(
          @name : String,
          @files : Array(String)? = nil
        )
        end
      end

      # Exceeded the total size limit for all variables in the pipeline.

      struct OutputVariablesSizeExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct OverrideStageConditionInput
        include JSON::Serializable

        # The type of condition to override for the stage, such as entry conditions, failure conditions, or
        # success conditions.

        @[JSON::Field(key: "conditionType")]
        getter condition_type : String

        # The ID of the pipeline execution for the override.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        # The name of the pipeline with the stage that will override the condition.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The name of the stage for the override.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @condition_type : String,
          @pipeline_execution_id : String,
          @pipeline_name : String,
          @stage_name : String
        )
        end
      end

      # Represents information about a pipeline to a job worker. PipelineContext contains pipelineArn and
      # pipelineExecutionId for custom action jobs. The pipelineArn and pipelineExecutionId fields are not
      # populated for ThirdParty action jobs.

      struct PipelineContext
        include JSON::Serializable

        # The context of an action to a job worker in the stage of a pipeline.

        @[JSON::Field(key: "action")]
        getter action : Types::ActionContext?

        # The Amazon Resource Name (ARN) of the pipeline.

        @[JSON::Field(key: "pipelineArn")]
        getter pipeline_arn : String?

        # The execution ID of the pipeline.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        # The name of the pipeline. This is a user-specified value. Pipeline names must be unique across all
        # pipeline names under an Amazon Web Services account.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String?

        # The stage of the pipeline.

        @[JSON::Field(key: "stage")]
        getter stage : Types::StageContext?

        def initialize(
          @action : Types::ActionContext? = nil,
          @pipeline_arn : String? = nil,
          @pipeline_execution_id : String? = nil,
          @pipeline_name : String? = nil,
          @stage : Types::StageContext? = nil
        )
        end
      end

      # Represents the structure of actions and stages to be performed in the pipeline.

      struct PipelineDeclaration
        include JSON::Serializable

        # The name of the pipeline.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) for CodePipeline to use to either perform actions with no
        # actionRoleArn , or to use to assume roles for actions with an actionRoleArn .

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The stage in which to perform the action.

        @[JSON::Field(key: "stages")]
        getter stages : Array(Types::StageDeclaration)

        # Represents information about the S3 bucket where artifacts are stored for the pipeline. You must
        # include either artifactStore or artifactStores in your pipeline, but you cannot use both. If you
        # create a cross-region action in your pipeline, you must use artifactStores .

        @[JSON::Field(key: "artifactStore")]
        getter artifact_store : Types::ArtifactStore?

        # A mapping of artifactStore objects and their corresponding Amazon Web Services Regions. There must
        # be an artifact store for the pipeline Region and for each cross-region action in the pipeline. You
        # must include either artifactStore or artifactStores in your pipeline, but you cannot use both. If
        # you create a cross-region action in your pipeline, you must use artifactStores .

        @[JSON::Field(key: "artifactStores")]
        getter artifact_stores : Hash(String, Types::ArtifactStore)?

        # The method that the pipeline will use to handle multiple executions. The default mode is SUPERSEDED.

        @[JSON::Field(key: "executionMode")]
        getter execution_mode : String?

        # CodePipeline provides the following pipeline types, which differ in characteristics and price, so
        # that you can tailor your pipeline features and cost to the needs of your applications. V1 type
        # pipelines have a JSON structure that contains standard pipeline, stage, and action-level parameters.
        # V2 type pipelines have the same structure as a V1 type, along with additional parameters for release
        # safety and trigger configuration. Including V2 parameters, such as triggers on Git tags, in the
        # pipeline JSON when creating or updating a pipeline will result in the pipeline having the V2 type of
        # pipeline and the associated costs. For information about pricing for CodePipeline, see Pricing . For
        # information about which type of pipeline to choose, see What type of pipeline is right for me? .

        @[JSON::Field(key: "pipelineType")]
        getter pipeline_type : String?

        # The trigger configuration specifying a type of event, such as Git tags, that starts the pipeline.
        # When a trigger configuration is specified, default change detection for repository and branch
        # commits is disabled.

        @[JSON::Field(key: "triggers")]
        getter triggers : Array(Types::PipelineTriggerDeclaration)?

        # A list that defines the pipeline variables for a pipeline resource. Variable names can have
        # alphanumeric and underscore characters, and the values must match [A-Za-z0-9@\-_]+ .

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::PipelineVariableDeclaration)?

        # The version number of the pipeline. A new pipeline always has a version number of 1. This number is
        # incremented when a pipeline is updated.

        @[JSON::Field(key: "version")]
        getter version : Int32?

        def initialize(
          @name : String,
          @role_arn : String,
          @stages : Array(Types::StageDeclaration),
          @artifact_store : Types::ArtifactStore? = nil,
          @artifact_stores : Hash(String, Types::ArtifactStore)? = nil,
          @execution_mode : String? = nil,
          @pipeline_type : String? = nil,
          @triggers : Array(Types::PipelineTriggerDeclaration)? = nil,
          @variables : Array(Types::PipelineVariableDeclaration)? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Represents information about an execution of a pipeline.

      struct PipelineExecution
        include JSON::Serializable

        # A list of ArtifactRevision objects included in a pipeline execution.

        @[JSON::Field(key: "artifactRevisions")]
        getter artifact_revisions : Array(Types::ArtifactRevision)?

        # The method that the pipeline will use to handle multiple executions. The default mode is SUPERSEDED.

        @[JSON::Field(key: "executionMode")]
        getter execution_mode : String?

        # The type of the pipeline execution.

        @[JSON::Field(key: "executionType")]
        getter execution_type : String?

        # The ID of the pipeline execution.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        # The name of the pipeline with the specified pipeline execution.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String?

        # The version number of the pipeline with the specified pipeline execution.

        @[JSON::Field(key: "pipelineVersion")]
        getter pipeline_version : Int32?

        # The metadata about the execution pertaining to stage rollback.

        @[JSON::Field(key: "rollbackMetadata")]
        getter rollback_metadata : Types::PipelineRollbackMetadata?

        # The status of the pipeline execution. Cancelled: The pipeline’s definition was updated before the
        # pipeline execution could be completed. InProgress: The pipeline execution is currently running.
        # Stopped: The pipeline execution was manually stopped. For more information, see Stopped Executions .
        # Stopping: The pipeline execution received a request to be manually stopped. Depending on the
        # selected stop mode, the execution is either completing or abandoning in-progress actions. For more
        # information, see Stopped Executions . Succeeded: The pipeline execution was completed successfully.
        # Superseded: While this pipeline execution was waiting for the next stage to be completed, a newer
        # pipeline execution advanced and continued through the pipeline instead. For more information, see
        # Superseded Executions . Failed: The pipeline execution was not completed successfully.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A summary that contains a description of the pipeline execution status.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : String?


        @[JSON::Field(key: "trigger")]
        getter trigger : Types::ExecutionTrigger?

        # A list of pipeline variables used for the pipeline execution.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::ResolvedPipelineVariable)?

        def initialize(
          @artifact_revisions : Array(Types::ArtifactRevision)? = nil,
          @execution_mode : String? = nil,
          @execution_type : String? = nil,
          @pipeline_execution_id : String? = nil,
          @pipeline_name : String? = nil,
          @pipeline_version : Int32? = nil,
          @rollback_metadata : Types::PipelineRollbackMetadata? = nil,
          @status : String? = nil,
          @status_summary : String? = nil,
          @trigger : Types::ExecutionTrigger? = nil,
          @variables : Array(Types::ResolvedPipelineVariable)? = nil
        )
        end
      end

      # The pipeline execution to filter on.

      struct PipelineExecutionFilter
        include JSON::Serializable

        # Filter for pipeline executions where the stage was successful in the current pipeline version.

        @[JSON::Field(key: "succeededInStage")]
        getter succeeded_in_stage : Types::SucceededInStageFilter?

        def initialize(
          @succeeded_in_stage : Types::SucceededInStageFilter? = nil
        )
        end
      end

      # The pipeline execution was specified in an invalid format or cannot be found, or an execution ID
      # does not belong to the specified pipeline.

      struct PipelineExecutionNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Unable to stop the pipeline execution. The execution might already be in a Stopped state, or it
      # might no longer be in progress.

      struct PipelineExecutionNotStoppableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # The specified pipeline execution is outdated and cannot be used as a target pipeline execution for
      # rollback.

      struct PipelineExecutionOutdatedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Summary information about a pipeline execution.

      struct PipelineExecutionSummary
        include JSON::Serializable

        # The method that the pipeline will use to handle multiple executions. The default mode is SUPERSEDED.

        @[JSON::Field(key: "executionMode")]
        getter execution_mode : String?

        # Type of the pipeline execution.

        @[JSON::Field(key: "executionType")]
        getter execution_type : String?

        # The date and time of the last change to the pipeline execution, in timestamp format.

        @[JSON::Field(key: "lastUpdateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # The ID of the pipeline execution.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        # The metadata for the stage execution to be rolled back.

        @[JSON::Field(key: "rollbackMetadata")]
        getter rollback_metadata : Types::PipelineRollbackMetadata?

        # A list of the source artifact revisions that initiated a pipeline execution.

        @[JSON::Field(key: "sourceRevisions")]
        getter source_revisions : Array(Types::SourceRevision)?

        # The date and time when the pipeline execution began, in timestamp format.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the pipeline execution. InProgress: The pipeline execution is currently running.
        # Stopped: The pipeline execution was manually stopped. For more information, see Stopped Executions .
        # Stopping: The pipeline execution received a request to be manually stopped. Depending on the
        # selected stop mode, the execution is either completing or abandoning in-progress actions. For more
        # information, see Stopped Executions . Succeeded: The pipeline execution was completed successfully.
        # Superseded: While this pipeline execution was waiting for the next stage to be completed, a newer
        # pipeline execution advanced and continued through the pipeline instead. For more information, see
        # Superseded Executions . Failed: The pipeline execution was not completed successfully.

        @[JSON::Field(key: "status")]
        getter status : String?

        # Status summary for the pipeline.

        @[JSON::Field(key: "statusSummary")]
        getter status_summary : String?

        # The interaction that stopped a pipeline execution.

        @[JSON::Field(key: "stopTrigger")]
        getter stop_trigger : Types::StopExecutionTrigger?

        # The interaction or event that started a pipeline execution, such as automated change detection or a
        # StartPipelineExecution API call.

        @[JSON::Field(key: "trigger")]
        getter trigger : Types::ExecutionTrigger?

        def initialize(
          @execution_mode : String? = nil,
          @execution_type : String? = nil,
          @last_update_time : Time? = nil,
          @pipeline_execution_id : String? = nil,
          @rollback_metadata : Types::PipelineRollbackMetadata? = nil,
          @source_revisions : Array(Types::SourceRevision)? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @status_summary : String? = nil,
          @stop_trigger : Types::StopExecutionTrigger? = nil,
          @trigger : Types::ExecutionTrigger? = nil
        )
        end
      end

      # Information about a pipeline.

      struct PipelineMetadata
        include JSON::Serializable

        # The date and time the pipeline was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The Amazon Resource Name (ARN) of the pipeline.

        @[JSON::Field(key: "pipelineArn")]
        getter pipeline_arn : String?

        # The date and time that polling for source changes (periodic checks) was stopped for the pipeline, in
        # timestamp format. Pipelines that are inactive for longer than 30 days will have polling disabled for
        # the pipeline. For more information, see pollingDisabledAt in the pipeline structure reference. For
        # the steps to migrate your pipeline from polling to event-based change detection, see Migrate polling
        # pipelines to use event-based change detection . You can migrate (update) a polling pipeline to use
        # event-based change detection. For example, for a pipeline with a CodeCommit source, we recommend you
        # migrate (update) your pipeline to use CloudWatch Events. To learn more, see Migrate polling
        # pipelines to use event-based change detection in the CodePipeline User Guide .

        @[JSON::Field(key: "pollingDisabledAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter polling_disabled_at : Time?

        # The date and time the pipeline was last updated, in timestamp format.

        @[JSON::Field(key: "updated", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated : Time?

        def initialize(
          @created : Time? = nil,
          @pipeline_arn : String? = nil,
          @polling_disabled_at : Time? = nil,
          @updated : Time? = nil
        )
        end
      end

      # The specified pipeline name is already in use.

      struct PipelineNameInUseException
        include JSON::Serializable

        def initialize
        end
      end

      # The pipeline was specified in an invalid format or cannot be found.

      struct PipelineNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The metadata for the stage execution to be rolled back.

      struct PipelineRollbackMetadata
        include JSON::Serializable

        # The pipeline execution ID to which the stage will be rolled back.

        @[JSON::Field(key: "rollbackTargetPipelineExecutionId")]
        getter rollback_target_pipeline_execution_id : String?

        def initialize(
          @rollback_target_pipeline_execution_id : String? = nil
        )
        end
      end

      # Returns a summary of a pipeline.

      struct PipelineSummary
        include JSON::Serializable

        # The date and time the pipeline was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time?

        # The method that the pipeline will use to handle multiple executions. The default mode is SUPERSEDED.

        @[JSON::Field(key: "executionMode")]
        getter execution_mode : String?

        # The name of the pipeline.

        @[JSON::Field(key: "name")]
        getter name : String?

        # CodePipeline provides the following pipeline types, which differ in characteristics and price, so
        # that you can tailor your pipeline features and cost to the needs of your applications. V1 type
        # pipelines have a JSON structure that contains standard pipeline, stage, and action-level parameters.
        # V2 type pipelines have the same structure as a V1 type, along with additional parameters for release
        # safety and trigger configuration. Including V2 parameters, such as triggers on Git tags, in the
        # pipeline JSON when creating or updating a pipeline will result in the pipeline having the V2 type of
        # pipeline and the associated costs. For information about pricing for CodePipeline, see Pricing . For
        # information about which type of pipeline to choose, see What type of pipeline is right for me? .

        @[JSON::Field(key: "pipelineType")]
        getter pipeline_type : String?

        # The date and time of the last update to the pipeline, in timestamp format.

        @[JSON::Field(key: "updated", converter: Aws::Runtime::UnixTimestampConverter)]
        getter updated : Time?

        # The version number of the pipeline.

        @[JSON::Field(key: "version")]
        getter version : Int32?

        def initialize(
          @created : Time? = nil,
          @execution_mode : String? = nil,
          @name : String? = nil,
          @pipeline_type : String? = nil,
          @updated : Time? = nil,
          @version : Int32? = nil
        )
        end
      end

      # Represents information about the specified trigger configuration, such as the filter criteria and
      # the source stage for the action that contains the trigger. This is only supported for the
      # CodeStarSourceConnection action type. When a trigger configuration is specified, default change
      # detection for repository and branch commits is disabled.

      struct PipelineTriggerDeclaration
        include JSON::Serializable

        # Provides the filter criteria and the source stage for the repository event that starts the pipeline,
        # such as Git tags.

        @[JSON::Field(key: "gitConfiguration")]
        getter git_configuration : Types::GitConfiguration

        # The source provider for the event, such as connections configured for a repository with Git tags,
        # for the specified trigger configuration.

        @[JSON::Field(key: "providerType")]
        getter provider_type : String

        def initialize(
          @git_configuration : Types::GitConfiguration,
          @provider_type : String
        )
        end
      end

      # A pipeline-level variable used for a pipeline execution.

      struct PipelineVariable
        include JSON::Serializable

        # The name of a pipeline-level variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of a pipeline-level variable.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @name : String,
          @value : String
        )
        end
      end

      # A variable declared at the pipeline level.

      struct PipelineVariableDeclaration
        include JSON::Serializable

        # The name of a pipeline-level variable.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value of a pipeline-level variable.

        @[JSON::Field(key: "defaultValue")]
        getter default_value : String?

        # The description of a pipeline-level variable. It's used to add additional context about the
        # variable, and not being used at time when pipeline executes.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @name : String,
          @default_value : String? = nil,
          @description : String? = nil
        )
        end
      end

      # The pipeline version was specified in an invalid format or cannot be found.

      struct PipelineVersionNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the input of a PollForJobs action.

      struct PollForJobsInput
        include JSON::Serializable

        # Represents information about an action type.

        @[JSON::Field(key: "actionTypeId")]
        getter action_type_id : Types::ActionTypeId

        # The maximum number of jobs to return in a poll for jobs call.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        # A map of property names and values. For an action type with no queryable properties, this value must
        # be null or an empty map. For an action type with a queryable property, you must supply that property
        # as a key in the map. Only jobs whose action configuration matches the mapped value are returned.

        @[JSON::Field(key: "queryParam")]
        getter query_param : Hash(String, String)?

        def initialize(
          @action_type_id : Types::ActionTypeId,
          @max_batch_size : Int32? = nil,
          @query_param : Hash(String, String)? = nil
        )
        end
      end

      # Represents the output of a PollForJobs action.

      struct PollForJobsOutput
        include JSON::Serializable

        # Information about the jobs to take action on.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::Job)?

        def initialize(
          @jobs : Array(Types::Job)? = nil
        )
        end
      end

      # Represents the input of a PollForThirdPartyJobs action.

      struct PollForThirdPartyJobsInput
        include JSON::Serializable

        # Represents information about an action type.

        @[JSON::Field(key: "actionTypeId")]
        getter action_type_id : Types::ActionTypeId

        # The maximum number of jobs to return in a poll for jobs call.

        @[JSON::Field(key: "maxBatchSize")]
        getter max_batch_size : Int32?

        def initialize(
          @action_type_id : Types::ActionTypeId,
          @max_batch_size : Int32? = nil
        )
        end
      end

      # Represents the output of a PollForThirdPartyJobs action.

      struct PollForThirdPartyJobsOutput
        include JSON::Serializable

        # Information about the jobs to take action on.

        @[JSON::Field(key: "jobs")]
        getter jobs : Array(Types::ThirdPartyJob)?

        def initialize(
          @jobs : Array(Types::ThirdPartyJob)? = nil
        )
        end
      end

      # Represents the input of a PutActionRevision action.

      struct PutActionRevisionInput
        include JSON::Serializable

        # The name of the action that processes the revision.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # Represents information about the version (or revision) of an action.

        @[JSON::Field(key: "actionRevision")]
        getter action_revision : Types::ActionRevision

        # The name of the pipeline that starts processing the revision to the source.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The name of the stage that contains the action that acts on the revision.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @action_name : String,
          @action_revision : Types::ActionRevision,
          @pipeline_name : String,
          @stage_name : String
        )
        end
      end

      # Represents the output of a PutActionRevision action.

      struct PutActionRevisionOutput
        include JSON::Serializable

        # Indicates whether the artifact revision was previously used in an execution of the specified
        # pipeline.

        @[JSON::Field(key: "newRevision")]
        getter new_revision : Bool?

        # The ID of the current workflow state of the pipeline.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        def initialize(
          @new_revision : Bool? = nil,
          @pipeline_execution_id : String? = nil
        )
        end
      end

      # Represents the input of a PutApprovalResult action.

      struct PutApprovalResultInput
        include JSON::Serializable

        # The name of the action for which approval is requested.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # The name of the pipeline that contains the action.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # Represents information about the result of the approval request.

        @[JSON::Field(key: "result")]
        getter result : Types::ApprovalResult

        # The name of the stage that contains the action.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # The system-generated token used to identify a unique approval request. The token for each open
        # approval request can be obtained using the GetPipelineState action. It is used to validate that the
        # approval request corresponding to this token is still valid. For a pipeline where the execution mode
        # is set to PARALLEL, the token required to approve/reject an approval request as detailed above is
        # not available. Instead, use the externalExecutionId in the response output from the
        # ListActionExecutions action as the token in the approval request.

        @[JSON::Field(key: "token")]
        getter token : String

        def initialize(
          @action_name : String,
          @pipeline_name : String,
          @result : Types::ApprovalResult,
          @stage_name : String,
          @token : String
        )
        end
      end

      # Represents the output of a PutApprovalResult action.

      struct PutApprovalResultOutput
        include JSON::Serializable

        # The timestamp showing when the approval or rejection was submitted.

        @[JSON::Field(key: "approvedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter approved_at : Time?

        def initialize(
          @approved_at : Time? = nil
        )
        end
      end

      # Represents the input of a PutJobFailureResult action.

      struct PutJobFailureResultInput
        include JSON::Serializable

        # The details about the failure of a job.

        @[JSON::Field(key: "failureDetails")]
        getter failure_details : Types::FailureDetails

        # The unique system-generated ID of the job that failed. This is the same ID returned from PollForJobs
        # .

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @failure_details : Types::FailureDetails,
          @job_id : String
        )
        end
      end

      # Represents the input of a PutJobSuccessResult action.

      struct PutJobSuccessResultInput
        include JSON::Serializable

        # The unique system-generated ID of the job that succeeded. This is the same ID returned from
        # PollForJobs .

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A token generated by a job worker, such as a CodeDeploy deployment ID, that a successful job
        # provides to identify a custom action in progress. Future jobs use this token to identify the running
        # instance of the action. It can be reused to return more information about the progress of the custom
        # action. When the action is complete, no continuation token should be supplied.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # The ID of the current revision of the artifact successfully worked on by the job.

        @[JSON::Field(key: "currentRevision")]
        getter current_revision : Types::CurrentRevision?

        # The execution details of the successful job, such as the actions taken by the job worker.

        @[JSON::Field(key: "executionDetails")]
        getter execution_details : Types::ExecutionDetails?

        # Key-value pairs produced as output by a job worker that can be made available to a downstream action
        # configuration. outputVariables can be included only when there is no continuation token on the
        # request.

        @[JSON::Field(key: "outputVariables")]
        getter output_variables : Hash(String, String)?

        def initialize(
          @job_id : String,
          @continuation_token : String? = nil,
          @current_revision : Types::CurrentRevision? = nil,
          @execution_details : Types::ExecutionDetails? = nil,
          @output_variables : Hash(String, String)? = nil
        )
        end
      end

      # Represents the input of a PutThirdPartyJobFailureResult action.

      struct PutThirdPartyJobFailureResultInput
        include JSON::Serializable

        # The clientToken portion of the clientId and clientToken pair used to verify that the calling entity
        # is allowed access to the job and its details.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # Represents information about failure details.

        @[JSON::Field(key: "failureDetails")]
        getter failure_details : Types::FailureDetails

        # The ID of the job that failed. This is the same ID returned from PollForThirdPartyJobs .

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        def initialize(
          @client_token : String,
          @failure_details : Types::FailureDetails,
          @job_id : String
        )
        end
      end

      # Represents the input of a PutThirdPartyJobSuccessResult action.

      struct PutThirdPartyJobSuccessResultInput
        include JSON::Serializable

        # The clientToken portion of the clientId and clientToken pair used to verify that the calling entity
        # is allowed access to the job and its details.

        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ID of the job that successfully completed. This is the same ID returned from
        # PollForThirdPartyJobs .

        @[JSON::Field(key: "jobId")]
        getter job_id : String

        # A token generated by a job worker, such as a CodeDeploy deployment ID, that a successful job
        # provides to identify a partner action in progress. Future jobs use this token to identify the
        # running instance of the action. It can be reused to return more information about the progress of
        # the partner action. When the action is complete, no continuation token should be supplied.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # Represents information about a current revision.

        @[JSON::Field(key: "currentRevision")]
        getter current_revision : Types::CurrentRevision?

        # The details of the actions taken and results produced on an artifact as it passes through stages in
        # the pipeline.

        @[JSON::Field(key: "executionDetails")]
        getter execution_details : Types::ExecutionDetails?

        def initialize(
          @client_token : String,
          @job_id : String,
          @continuation_token : String? = nil,
          @current_revision : Types::CurrentRevision? = nil,
          @execution_details : Types::ExecutionDetails? = nil
        )
        end
      end


      struct PutWebhookInput
        include JSON::Serializable

        # The detail provided in an input file to create the webhook, such as the webhook name, the pipeline
        # name, and the action name. Give the webhook a unique name that helps you identify it. You might name
        # the webhook after the pipeline and action it targets so that you can easily recognize what it's used
        # for later.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::WebhookDefinition

        # The tags for the webhook.

        @[JSON::Field(key: "tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @webhook : Types::WebhookDefinition,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct PutWebhookOutput
        include JSON::Serializable

        # The detail returned from creating the webhook, such as the webhook name, webhook URL, and webhook
        # ARN.

        @[JSON::Field(key: "webhook")]
        getter webhook : Types::ListWebhookItem?

        def initialize(
          @webhook : Types::ListWebhookItem? = nil
        )
        end
      end


      struct RegisterWebhookWithThirdPartyInput
        include JSON::Serializable

        # The name of an existing webhook created with PutWebhook to register with a supported third party.

        @[JSON::Field(key: "webhookName")]
        getter webhook_name : String?

        def initialize(
          @webhook_name : String? = nil
        )
        end
      end


      struct RegisterWebhookWithThirdPartyOutput
        include JSON::Serializable

        def initialize
        end
      end

      # The request failed because of an unknown error, exception, or failure.

      struct RequestFailedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # A pipeline-level variable used for a pipeline execution.

      struct ResolvedPipelineVariable
        include JSON::Serializable

        # The name of a pipeline-level variable.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The resolved value of a pipeline-level variable.

        @[JSON::Field(key: "resolvedValue")]
        getter resolved_value : String?

        def initialize(
          @name : String? = nil,
          @resolved_value : String? = nil
        )
        end
      end

      # The resource was specified in an invalid format.

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The retry configuration specifies automatic retry for a failed stage, along with the configured
      # retry mode.

      struct RetryConfiguration
        include JSON::Serializable

        # The method that you want to configure for automatic stage retry on stage failure. You can specify to
        # retry only failed action in the stage or all actions in the stage.

        @[JSON::Field(key: "retryMode")]
        getter retry_mode : String?

        def initialize(
          @retry_mode : String? = nil
        )
        end
      end

      # Represents the input of a RetryStageExecution action.

      struct RetryStageExecutionInput
        include JSON::Serializable

        # The ID of the pipeline execution in the failed stage to be retried. Use the GetPipelineState action
        # to retrieve the current pipelineExecutionId of the failed stage

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        # The name of the pipeline that contains the failed stage.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The scope of the retry attempt.

        @[JSON::Field(key: "retryMode")]
        getter retry_mode : String

        # The name of the failed stage to be retried.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        def initialize(
          @pipeline_execution_id : String,
          @pipeline_name : String,
          @retry_mode : String,
          @stage_name : String
        )
        end
      end

      # Represents the output of a RetryStageExecution action.

      struct RetryStageExecutionOutput
        include JSON::Serializable

        # The ID of the current workflow execution in the failed stage.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        def initialize(
          @pipeline_execution_id : String? = nil
        )
        end
      end

      # The details of a specific automatic retry on stage failure, including the attempt number and
      # trigger.

      struct RetryStageMetadata
        include JSON::Serializable

        # The number of attempts for a specific stage with automatic retry on stage failure. One attempt is
        # allowed for automatic stage retry on failure.

        @[JSON::Field(key: "autoStageRetryAttempt")]
        getter auto_stage_retry_attempt : Int32?

        # The latest trigger for a specific stage where manual or automatic retries have been made upon stage
        # failure.

        @[JSON::Field(key: "latestRetryTrigger")]
        getter latest_retry_trigger : String?

        # The number of attempts for a specific stage where manual retries have been made upon stage failure.

        @[JSON::Field(key: "manualStageRetryAttempt")]
        getter manual_stage_retry_attempt : Int32?

        def initialize(
          @auto_stage_retry_attempt : Int32? = nil,
          @latest_retry_trigger : String? = nil,
          @manual_stage_retry_attempt : Int32? = nil
        )
        end
      end


      struct RollbackStageInput
        include JSON::Serializable

        # The name of the pipeline for which the stage will be rolled back.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # The name of the stage in the pipeline to be rolled back.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String

        # The pipeline execution ID for the stage to be rolled back to.

        @[JSON::Field(key: "targetPipelineExecutionId")]
        getter target_pipeline_execution_id : String

        def initialize(
          @pipeline_name : String,
          @stage_name : String,
          @target_pipeline_execution_id : String
        )
        end
      end


      struct RollbackStageOutput
        include JSON::Serializable

        # The execution ID of the pipeline execution for the stage that has been rolled back.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        def initialize(
          @pipeline_execution_id : String
        )
        end
      end

      # Represents information about a rule configuration property.

      struct RuleConfigurationProperty
        include JSON::Serializable

        # Whether the configuration property is a key.

        @[JSON::Field(key: "key")]
        getter key : Bool

        # The name of the rule configuration property.

        @[JSON::Field(key: "name")]
        getter name : String

        # Whether the configuration property is a required value.

        @[JSON::Field(key: "required")]
        getter required : Bool

        # Whether the configuration property is secret. When updating a pipeline, passing * * * * * without
        # changing any other values of the action preserves the previous value of the secret.

        @[JSON::Field(key: "secret")]
        getter secret : Bool

        # The description of the action configuration property that is displayed to users.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the property can be queried. If you create a pipeline with a condition and rule,
        # and that rule contains a queryable property, the value for that configuration property is subject to
        # other restrictions. The value must be less than or equal to twenty (20) characters. The value can
        # contain only alphanumeric characters, underscores, and hyphens.

        @[JSON::Field(key: "queryable")]
        getter queryable : Bool?

        # The type of the configuration property.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @key : Bool,
          @name : String,
          @required : Bool,
          @secret : Bool,
          @description : String? = nil,
          @queryable : Bool? = nil,
          @type : String? = nil
        )
        end
      end

      # Represents information about the rule to be created for an associated condition. An example would be
      # creating a new rule for an entry condition, such as a rule that checks for a test result before
      # allowing the run to enter the deployment stage. For more information about conditions, see Stage
      # conditions and How do stage conditions work? . For more information about rules, see the
      # CodePipeline rule reference .

      struct RuleDeclaration
        include JSON::Serializable

        # The name of the rule that is created for the condition, such as VariableCheck .

        @[JSON::Field(key: "name")]
        getter name : String

        # The ID for the rule type, which is made up of the combined values for category, owner, provider, and
        # version.

        @[JSON::Field(key: "ruleTypeId")]
        getter rule_type_id : Types::RuleTypeId

        # The shell commands to run with your commands rule in CodePipeline. All commands are supported except
        # multi-line formats. While CodeBuild logs and permissions are used, you do not need to create any
        # resources in CodeBuild. Using compute time for this action will incur separate charges in CodeBuild.

        @[JSON::Field(key: "commands")]
        getter commands : Array(String)?

        # The action configuration fields for the rule.

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # The input artifacts fields for the rule, such as specifying an input file for the rule.

        @[JSON::Field(key: "inputArtifacts")]
        getter input_artifacts : Array(Types::InputArtifact)?

        # The Region for the condition associated with the rule.

        @[JSON::Field(key: "region")]
        getter region : String?

        # The pipeline role ARN associated with the rule.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The action timeout for the rule.

        @[JSON::Field(key: "timeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        def initialize(
          @name : String,
          @rule_type_id : Types::RuleTypeId,
          @commands : Array(String)? = nil,
          @configuration : Hash(String, String)? = nil,
          @input_artifacts : Array(Types::InputArtifact)? = nil,
          @region : String? = nil,
          @role_arn : String? = nil,
          @timeout_in_minutes : Int32? = nil
        )
        end
      end

      # Represents information about each time a rule is run as part of the pipeline execution for a
      # pipeline configured with conditions.

      struct RuleExecution
        include JSON::Serializable


        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ErrorDetails?

        # The external ID of the run of the rule.

        @[JSON::Field(key: "externalExecutionId")]
        getter external_execution_id : String?

        # The URL of a resource external to Amazon Web Services that is used when running the rule (for
        # example, an external repository URL).

        @[JSON::Field(key: "externalExecutionUrl")]
        getter external_execution_url : String?

        # The last status change of the rule.

        @[JSON::Field(key: "lastStatusChange", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_status_change : Time?

        # The ARN of the user who last changed the rule.

        @[JSON::Field(key: "lastUpdatedBy")]
        getter last_updated_by : String?

        # The execution ID for the run of the rule.

        @[JSON::Field(key: "ruleExecutionId")]
        getter rule_execution_id : String?

        # The status of the run of the rule, such as FAILED.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A summary of the run of the rule.

        @[JSON::Field(key: "summary")]
        getter summary : String?

        # The system-generated token used to identify a unique request.

        @[JSON::Field(key: "token")]
        getter token : String?

        def initialize(
          @error_details : Types::ErrorDetails? = nil,
          @external_execution_id : String? = nil,
          @external_execution_url : String? = nil,
          @last_status_change : Time? = nil,
          @last_updated_by : String? = nil,
          @rule_execution_id : String? = nil,
          @status : String? = nil,
          @summary : String? = nil,
          @token : String? = nil
        )
        end
      end

      # The details of the runs for a rule and the results produced on an artifact as it passes through
      # stages in the pipeline.

      struct RuleExecutionDetail
        include JSON::Serializable

        # Input details for the rule execution, such as role ARN, Region, and input artifacts.

        @[JSON::Field(key: "input")]
        getter input : Types::RuleExecutionInput?

        # The date and time of the last change to the rule execution, in timestamp format.

        @[JSON::Field(key: "lastUpdateTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_update_time : Time?

        # Output details for the rule execution, such as the rule execution result.

        @[JSON::Field(key: "output")]
        getter output : Types::RuleExecutionOutput?

        # The ID of the pipeline execution in the stage where the rule was run. Use the GetPipelineState
        # action to retrieve the current pipelineExecutionId of the stage.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        # The version number of the pipeline with the stage where the rule was run.

        @[JSON::Field(key: "pipelineVersion")]
        getter pipeline_version : Int32?

        # The ID of the run for the rule.

        @[JSON::Field(key: "ruleExecutionId")]
        getter rule_execution_id : String?

        # The name of the rule that was run in the stage.

        @[JSON::Field(key: "ruleName")]
        getter rule_name : String?

        # The name of the stage where the rule was run.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        # The start time of the rule execution.

        @[JSON::Field(key: "startTime", converter: Aws::Runtime::UnixTimestampConverter)]
        getter start_time : Time?

        # The status of the rule execution. Status categories are InProgress , Succeeded , and Failed .

        @[JSON::Field(key: "status")]
        getter status : String?

        # The ARN of the user who changed the rule execution details.

        @[JSON::Field(key: "updatedBy")]
        getter updated_by : String?

        def initialize(
          @input : Types::RuleExecutionInput? = nil,
          @last_update_time : Time? = nil,
          @output : Types::RuleExecutionOutput? = nil,
          @pipeline_execution_id : String? = nil,
          @pipeline_version : Int32? = nil,
          @rule_execution_id : String? = nil,
          @rule_name : String? = nil,
          @stage_name : String? = nil,
          @start_time : Time? = nil,
          @status : String? = nil,
          @updated_by : String? = nil
        )
        end
      end

      # Filter values for the rule execution.

      struct RuleExecutionFilter
        include JSON::Serializable


        @[JSON::Field(key: "latestInPipelineExecution")]
        getter latest_in_pipeline_execution : Types::LatestInPipelineExecutionFilter?

        # The pipeline execution ID used to filter rule execution history.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        def initialize(
          @latest_in_pipeline_execution : Types::LatestInPipelineExecutionFilter? = nil,
          @pipeline_execution_id : String? = nil
        )
        end
      end

      # Input information used for a rule execution.

      struct RuleExecutionInput
        include JSON::Serializable

        # Configuration data for a rule execution, such as the resolved values for that run.

        @[JSON::Field(key: "configuration")]
        getter configuration : Hash(String, String)?

        # Details of input artifacts of the rule that correspond to the rule execution.

        @[JSON::Field(key: "inputArtifacts")]
        getter input_artifacts : Array(Types::ArtifactDetail)?

        # The Amazon Web Services Region for the rule, such as us-east-1.

        @[JSON::Field(key: "region")]
        getter region : String?

        # Configuration data for a rule execution with all variable references replaced with their real values
        # for the execution.

        @[JSON::Field(key: "resolvedConfiguration")]
        getter resolved_configuration : Hash(String, String)?

        # The ARN of the IAM service role that performs the declared rule. This is assumed through the roleArn
        # for the pipeline.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The ID for the rule type, which is made up of the combined values for category, owner, provider, and
        # version. For more information about conditions, see Stage conditions . For more information about
        # rules, see the CodePipeline rule reference .

        @[JSON::Field(key: "ruleTypeId")]
        getter rule_type_id : Types::RuleTypeId?

        def initialize(
          @configuration : Hash(String, String)? = nil,
          @input_artifacts : Array(Types::ArtifactDetail)? = nil,
          @region : String? = nil,
          @resolved_configuration : Hash(String, String)? = nil,
          @role_arn : String? = nil,
          @rule_type_id : Types::RuleTypeId? = nil
        )
        end
      end

      # Output details listed for a rule execution, such as the rule execution result.

      struct RuleExecutionOutput
        include JSON::Serializable

        # Execution result information listed in the output details for a rule execution.

        @[JSON::Field(key: "executionResult")]
        getter execution_result : Types::RuleExecutionResult?

        def initialize(
          @execution_result : Types::RuleExecutionResult? = nil
        )
        end
      end

      # Execution result information, such as the external execution ID.

      struct RuleExecutionResult
        include JSON::Serializable


        @[JSON::Field(key: "errorDetails")]
        getter error_details : Types::ErrorDetails?

        # The external ID for the rule execution.

        @[JSON::Field(key: "externalExecutionId")]
        getter external_execution_id : String?

        # The external provider summary for the rule execution.

        @[JSON::Field(key: "externalExecutionSummary")]
        getter external_execution_summary : String?

        # The deepest external link to the external resource (for example, a repository URL or deployment
        # endpoint) that is used when running the rule.

        @[JSON::Field(key: "externalExecutionUrl")]
        getter external_execution_url : String?

        def initialize(
          @error_details : Types::ErrorDetails? = nil,
          @external_execution_id : String? = nil,
          @external_execution_summary : String? = nil,
          @external_execution_url : String? = nil
        )
        end
      end

      # The change to a rule that creates a revision of the rule.

      struct RuleRevision
        include JSON::Serializable

        # The date and time when the most recent version of the rule was created, in timestamp format.

        @[JSON::Field(key: "created", converter: Aws::Runtime::UnixTimestampConverter)]
        getter created : Time

        # The unique identifier of the change that set the state to this revision (for example, a deployment
        # ID or timestamp).

        @[JSON::Field(key: "revisionChangeId")]
        getter revision_change_id : String

        # The system-generated unique ID that identifies the revision number of the rule.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String

        def initialize(
          @created : Time,
          @revision_change_id : String,
          @revision_id : String
        )
        end
      end

      # Returns information about the state of a rule. Values returned in the revisionId field indicate the
      # rule revision information, such as the commit ID, for the current state.

      struct RuleState
        include JSON::Serializable

        # The ID of the current revision of the artifact successfully worked on by the job.

        @[JSON::Field(key: "currentRevision")]
        getter current_revision : Types::RuleRevision?

        # A URL link for more information about the state of the action, such as a details page.

        @[JSON::Field(key: "entityUrl")]
        getter entity_url : String?

        # Represents information about the latest run of an rule.

        @[JSON::Field(key: "latestExecution")]
        getter latest_execution : Types::RuleExecution?

        # A URL link for more information about the revision, such as a commit details page.

        @[JSON::Field(key: "revisionUrl")]
        getter revision_url : String?

        # The name of the rule.

        @[JSON::Field(key: "ruleName")]
        getter rule_name : String?

        def initialize(
          @current_revision : Types::RuleRevision? = nil,
          @entity_url : String? = nil,
          @latest_execution : Types::RuleExecution? = nil,
          @revision_url : String? = nil,
          @rule_name : String? = nil
        )
        end
      end

      # The rule type, which is made up of the combined values for category, owner, provider, and version.

      struct RuleType
        include JSON::Serializable

        # Represents information about a rule type.

        @[JSON::Field(key: "id")]
        getter id : Types::RuleTypeId


        @[JSON::Field(key: "inputArtifactDetails")]
        getter input_artifact_details : Types::ArtifactDetails

        # The configuration properties for the rule type.

        @[JSON::Field(key: "ruleConfigurationProperties")]
        getter rule_configuration_properties : Array(Types::RuleConfigurationProperty)?

        # Returns information about the settings for a rule type.

        @[JSON::Field(key: "settings")]
        getter settings : Types::RuleTypeSettings?

        def initialize(
          @id : Types::RuleTypeId,
          @input_artifact_details : Types::ArtifactDetails,
          @rule_configuration_properties : Array(Types::RuleConfigurationProperty)? = nil,
          @settings : Types::RuleTypeSettings? = nil
        )
        end
      end

      # The ID for the rule type, which is made up of the combined values for category, owner, provider, and
      # version. For more information about conditions, see Stage conditions . For more information about
      # rules, see the CodePipeline rule reference .

      struct RuleTypeId
        include JSON::Serializable

        # A category defines what kind of rule can be run in the stage, and constrains the provider type for
        # the rule. The valid category is Rule .

        @[JSON::Field(key: "category")]
        getter category : String

        # The rule provider, such as the DeploymentWindow rule. For a list of rule provider names, see the
        # rules listed in the CodePipeline rule reference .

        @[JSON::Field(key: "provider")]
        getter provider : String

        # The creator of the rule being called. The valid value for the Owner field in the rule category is
        # AWS .

        @[JSON::Field(key: "owner")]
        getter owner : String?

        # A string that describes the rule version.

        @[JSON::Field(key: "version")]
        getter version : String?

        def initialize(
          @category : String,
          @provider : String,
          @owner : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Returns information about the settings for a rule type.

      struct RuleTypeSettings
        include JSON::Serializable

        # The URL returned to the CodePipeline console that provides a deep link to the resources of the
        # external system, such as the configuration page for a CodeDeploy deployment group. This link is
        # provided as part of the action display in the pipeline.

        @[JSON::Field(key: "entityUrlTemplate")]
        getter entity_url_template : String?

        # The URL returned to the CodePipeline console that contains a link to the top-level landing page for
        # the external system, such as the console page for CodeDeploy. This link is shown on the pipeline
        # view page in the CodePipeline console and provides a link to the execution entity of the external
        # action.

        @[JSON::Field(key: "executionUrlTemplate")]
        getter execution_url_template : String?

        # The URL returned to the CodePipeline console that contains a link to the page where customers can
        # update or change the configuration of the external action.

        @[JSON::Field(key: "revisionUrlTemplate")]
        getter revision_url_template : String?

        # The URL of a sign-up page where users can sign up for an external service and perform initial
        # configuration of the action provided by that service.

        @[JSON::Field(key: "thirdPartyConfigurationUrl")]
        getter third_party_configuration_url : String?

        def initialize(
          @entity_url_template : String? = nil,
          @execution_url_template : String? = nil,
          @revision_url_template : String? = nil,
          @third_party_configuration_url : String? = nil
        )
        end
      end

      # The location of the S3 bucket that contains a revision.

      struct S3ArtifactLocation
        include JSON::Serializable

        # The name of the S3 bucket.

        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The key of the object in the S3 bucket, which uniquely identifies the object in the bucket.

        @[JSON::Field(key: "objectKey")]
        getter object_key : String

        def initialize(
          @bucket_name : String,
          @object_key : String
        )
        end
      end

      # The Amazon S3 artifact location for an action's artifacts.

      struct S3Location
        include JSON::Serializable

        # The Amazon S3 artifact bucket for an action's artifacts.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The artifact name.

        @[JSON::Field(key: "key")]
        getter key : String?

        def initialize(
          @bucket : String? = nil,
          @key : String? = nil
        )
        end
      end

      # Information about the version (or revision) of a source artifact that initiated a pipeline
      # execution.

      struct SourceRevision
        include JSON::Serializable

        # The name of the action that processed the revision to the source artifact.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # The system-generated unique ID that identifies the revision number of the artifact.

        @[JSON::Field(key: "revisionId")]
        getter revision_id : String?

        # Summary information about the most recent revision of the artifact. For GitHub and CodeCommit
        # repositories, the commit message. For Amazon S3 buckets or actions, the user-provided content of a
        # codepipeline-artifact-revision-summary key specified in the object metadata.

        @[JSON::Field(key: "revisionSummary")]
        getter revision_summary : String?

        # The commit ID for the artifact revision. For artifacts stored in GitHub or CodeCommit repositories,
        # the commit ID is linked to a commit details page.

        @[JSON::Field(key: "revisionUrl")]
        getter revision_url : String?

        def initialize(
          @action_name : String,
          @revision_id : String? = nil,
          @revision_summary : String? = nil,
          @revision_url : String? = nil
        )
        end
      end

      # A list that allows you to specify, or override, the source revision for a pipeline execution that's
      # being started. A source revision is the version with all the changes to your application code, or
      # source artifact, for the pipeline execution. For the S3_OBJECT_VERSION_ID and S3_OBJECT_KEY types of
      # source revisions, either of the types can be used independently, or they can be used together to
      # override the source with a specific ObjectKey and VersionID.

      struct SourceRevisionOverride
        include JSON::Serializable

        # The name of the action where the override will be applied.

        @[JSON::Field(key: "actionName")]
        getter action_name : String

        # The type of source revision, based on the source provider. For example, the revision type for the
        # CodeCommit action provider is the commit ID.

        @[JSON::Field(key: "revisionType")]
        getter revision_type : String

        # The source revision, or version of your source artifact, with the changes that you want to run in
        # the pipeline execution.

        @[JSON::Field(key: "revisionValue")]
        getter revision_value : String

        def initialize(
          @action_name : String,
          @revision_type : String,
          @revision_value : String
        )
        end
      end

      # The state of a run of a condition for a stage.

      struct StageConditionState
        include JSON::Serializable

        # The states of the conditions for a run of a condition for a stage.

        @[JSON::Field(key: "conditionStates")]
        getter condition_states : Array(Types::ConditionState)?

        # Represents information about the latest run of a condition for a stage.

        @[JSON::Field(key: "latestExecution")]
        getter latest_execution : Types::StageConditionsExecution?

        def initialize(
          @condition_states : Array(Types::ConditionState)? = nil,
          @latest_execution : Types::StageConditionsExecution? = nil
        )
        end
      end

      # Represents information about the run of a condition for a stage.

      struct StageConditionsExecution
        include JSON::Serializable

        # The status of a run of a condition for a stage.

        @[JSON::Field(key: "status")]
        getter status : String?

        # A summary of the run of the condition for a stage.

        @[JSON::Field(key: "summary")]
        getter summary : String?

        def initialize(
          @status : String? = nil,
          @summary : String? = nil
        )
        end
      end

      # Represents information about a stage to a job worker.

      struct StageContext
        include JSON::Serializable

        # The name of the stage.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Represents information about a stage and its definition.

      struct StageDeclaration
        include JSON::Serializable

        # The actions included in a stage.

        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionDeclaration)

        # The name of the stage.

        @[JSON::Field(key: "name")]
        getter name : String

        # The method to use when a stage allows entry. For example, configuring this field for conditions will
        # allow entry to the stage when the conditions are met.

        @[JSON::Field(key: "beforeEntry")]
        getter before_entry : Types::BeforeEntryConditions?

        # Reserved for future use.

        @[JSON::Field(key: "blockers")]
        getter blockers : Array(Types::BlockerDeclaration)?

        # The method to use when a stage has not completed successfully. For example, configuring this field
        # for rollback will roll back a failed stage automatically to the last successful pipeline execution
        # in the stage.

        @[JSON::Field(key: "onFailure")]
        getter on_failure : Types::FailureConditions?

        # The method to use when a stage has succeeded. For example, configuring this field for conditions
        # will allow the stage to succeed when the conditions are met.

        @[JSON::Field(key: "onSuccess")]
        getter on_success : Types::SuccessConditions?

        def initialize(
          @actions : Array(Types::ActionDeclaration),
          @name : String,
          @before_entry : Types::BeforeEntryConditions? = nil,
          @blockers : Array(Types::BlockerDeclaration)? = nil,
          @on_failure : Types::FailureConditions? = nil,
          @on_success : Types::SuccessConditions? = nil
        )
        end
      end

      # Represents information about the run of a stage.

      struct StageExecution
        include JSON::Serializable

        # The ID of the pipeline execution associated with the stage.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        # The status of the stage, or for a completed stage, the last status of the stage. A status of
        # cancelled means that the pipeline’s definition was updated before the stage execution could be
        # completed.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of pipeline execution for the stage, such as a rollback pipeline execution.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @pipeline_execution_id : String,
          @status : String,
          @type : String? = nil
        )
        end
      end

      # The stage was specified in an invalid format or cannot be found.

      struct StageNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # Unable to retry. The pipeline structure or stage state might have changed while actions awaited
      # retry, or the stage contains no failed actions.

      struct StageNotRetryableException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents information about the state of the stage.

      struct StageState
        include JSON::Serializable

        # The state of the stage.

        @[JSON::Field(key: "actionStates")]
        getter action_states : Array(Types::ActionState)?

        # The state of the entry conditions for a stage.

        @[JSON::Field(key: "beforeEntryConditionState")]
        getter before_entry_condition_state : Types::StageConditionState?


        @[JSON::Field(key: "inboundExecution")]
        getter inbound_execution : Types::StageExecution?

        # The inbound executions for a stage.

        @[JSON::Field(key: "inboundExecutions")]
        getter inbound_executions : Array(Types::StageExecution)?

        # The state of the inbound transition, which is either enabled or disabled.

        @[JSON::Field(key: "inboundTransitionState")]
        getter inbound_transition_state : Types::TransitionState?

        # Information about the latest execution in the stage, including its ID and status.

        @[JSON::Field(key: "latestExecution")]
        getter latest_execution : Types::StageExecution?

        # The state of the failure conditions for a stage.

        @[JSON::Field(key: "onFailureConditionState")]
        getter on_failure_condition_state : Types::StageConditionState?

        # The state of the success conditions for a stage.

        @[JSON::Field(key: "onSuccessConditionState")]
        getter on_success_condition_state : Types::StageConditionState?

        # he details of a specific automatic retry on stage failure, including the attempt number and trigger.

        @[JSON::Field(key: "retryStageMetadata")]
        getter retry_stage_metadata : Types::RetryStageMetadata?

        # The name of the stage.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @action_states : Array(Types::ActionState)? = nil,
          @before_entry_condition_state : Types::StageConditionState? = nil,
          @inbound_execution : Types::StageExecution? = nil,
          @inbound_executions : Array(Types::StageExecution)? = nil,
          @inbound_transition_state : Types::TransitionState? = nil,
          @latest_execution : Types::StageExecution? = nil,
          @on_failure_condition_state : Types::StageConditionState? = nil,
          @on_success_condition_state : Types::StageConditionState? = nil,
          @retry_stage_metadata : Types::RetryStageMetadata? = nil,
          @stage_name : String? = nil
        )
        end
      end

      # Represents the input of a StartPipelineExecution action.

      struct StartPipelineExecutionInput
        include JSON::Serializable

        # The name of the pipeline to start.

        @[JSON::Field(key: "name")]
        getter name : String

        # The system-generated unique ID used to identify a unique execution request.

        @[JSON::Field(key: "clientRequestToken")]
        getter client_request_token : String?

        # A list that allows you to specify, or override, the source revision for a pipeline execution that's
        # being started. A source revision is the version with all the changes to your application code, or
        # source artifact, for the pipeline execution.

        @[JSON::Field(key: "sourceRevisions")]
        getter source_revisions : Array(Types::SourceRevisionOverride)?

        # A list that overrides pipeline variables for a pipeline execution that's being started. Variable
        # names must match [A-Za-z0-9@\-_]+ , and the values can be anything except an empty string.

        @[JSON::Field(key: "variables")]
        getter variables : Array(Types::PipelineVariable)?

        def initialize(
          @name : String,
          @client_request_token : String? = nil,
          @source_revisions : Array(Types::SourceRevisionOverride)? = nil,
          @variables : Array(Types::PipelineVariable)? = nil
        )
        end
      end

      # Represents the output of a StartPipelineExecution action.

      struct StartPipelineExecutionOutput
        include JSON::Serializable

        # The unique system-generated ID of the pipeline execution that was started.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        def initialize(
          @pipeline_execution_id : String? = nil
        )
        end
      end

      # The interaction that stopped a pipeline execution.

      struct StopExecutionTrigger
        include JSON::Serializable

        # The user-specified reason the pipeline was stopped.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @reason : String? = nil
        )
        end
      end


      struct StopPipelineExecutionInput
        include JSON::Serializable

        # The ID of the pipeline execution to be stopped in the current stage. Use the GetPipelineState action
        # to retrieve the current pipelineExecutionId.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String

        # The name of the pipeline to stop.

        @[JSON::Field(key: "pipelineName")]
        getter pipeline_name : String

        # Use this option to stop the pipeline execution by abandoning, rather than finishing, in-progress
        # actions. This option can lead to failed or out-of-sequence tasks.

        @[JSON::Field(key: "abandon")]
        getter abandon : Bool?

        # Use this option to enter comments, such as the reason the pipeline was stopped.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @pipeline_execution_id : String,
          @pipeline_name : String,
          @abandon : Bool? = nil,
          @reason : String? = nil
        )
        end
      end


      struct StopPipelineExecutionOutput
        include JSON::Serializable

        # The unique system-generated ID of the pipeline execution that was stopped.

        @[JSON::Field(key: "pipelineExecutionId")]
        getter pipeline_execution_id : String?

        def initialize(
          @pipeline_execution_id : String? = nil
        )
        end
      end

      # Filter for pipeline executions that have successfully completed the stage in the current pipeline
      # version.

      struct SucceededInStageFilter
        include JSON::Serializable

        # The name of the stage for filtering for pipeline executions where the stage was successful in the
        # current pipeline version.

        @[JSON::Field(key: "stageName")]
        getter stage_name : String?

        def initialize(
          @stage_name : String? = nil
        )
        end
      end

      # The conditions for making checks that, if met, succeed a stage. For more information about
      # conditions, see Stage conditions and How do stage conditions work? .

      struct SuccessConditions
        include JSON::Serializable

        # The conditions that are success conditions.

        @[JSON::Field(key: "conditions")]
        getter conditions : Array(Types::Condition)

        def initialize(
          @conditions : Array(Types::Condition)
        )
        end
      end

      # A tag is a key-value pair that is used to manage the resource.

      struct Tag
        include JSON::Serializable

        # The tag's key.

        @[JSON::Field(key: "key")]
        getter key : String

        # The tag's value.

        @[JSON::Field(key: "value")]
        getter value : String

        def initialize(
          @key : String,
          @value : String
        )
        end
      end


      struct TagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource you want to add tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags you want to modify or add to the resource.

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

      # Filters the list of targets.

      struct TargetFilter
        include JSON::Serializable

        # The name on which to filter.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The values on which to filter.

        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @name : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A response to a PollForThirdPartyJobs request returned by CodePipeline when there is a job to be
      # worked on by a partner action.

      struct ThirdPartyJob
        include JSON::Serializable

        # The clientToken portion of the clientId and clientToken pair used to verify that the calling entity
        # is allowed access to the job and its details.

        @[JSON::Field(key: "clientId")]
        getter client_id : String?

        # The identifier used to identify the job in CodePipeline.

        @[JSON::Field(key: "jobId")]
        getter job_id : String?

        def initialize(
          @client_id : String? = nil,
          @job_id : String? = nil
        )
        end
      end

      # Represents information about the job data for a partner action.

      struct ThirdPartyJobData
        include JSON::Serializable

        # Represents information about an action configuration.

        @[JSON::Field(key: "actionConfiguration")]
        getter action_configuration : Types::ActionConfiguration?

        # Represents information about an action type.

        @[JSON::Field(key: "actionTypeId")]
        getter action_type_id : Types::ActionTypeId?

        # Represents an Amazon Web Services session credentials object. These credentials are temporary
        # credentials that are issued by Amazon Web Services Secure Token Service (STS). They can be used to
        # access input and output artifacts in the S3 bucket used to store artifact for the pipeline in
        # CodePipeline.

        @[JSON::Field(key: "artifactCredentials")]
        getter artifact_credentials : Types::AWSSessionCredentials?

        # A system-generated token, such as a CodeDeploy deployment ID, that a job requires to continue the
        # job asynchronously.

        @[JSON::Field(key: "continuationToken")]
        getter continuation_token : String?

        # The encryption key used to encrypt and decrypt data in the artifact store for the pipeline, such as
        # an Amazon Web Services Key Management Service (Amazon Web Services KMS) key. This is optional and
        # might not be present.

        @[JSON::Field(key: "encryptionKey")]
        getter encryption_key : Types::EncryptionKey?

        # The name of the artifact that is worked on by the action, if any. This name might be
        # system-generated, such as "MyApp", or it might be defined by the user when the action is created.
        # The input artifact name must match the name of an output artifact generated by an action in an
        # earlier action or stage of the pipeline.

        @[JSON::Field(key: "inputArtifacts")]
        getter input_artifacts : Array(Types::Artifact)?

        # The name of the artifact that is the result of the action, if any. This name might be
        # system-generated, such as "MyBuiltApp", or it might be defined by the user when the action is
        # created.

        @[JSON::Field(key: "outputArtifacts")]
        getter output_artifacts : Array(Types::Artifact)?

        # Represents information about a pipeline to a job worker. Does not include pipelineArn and
        # pipelineExecutionId for ThirdParty jobs.

        @[JSON::Field(key: "pipelineContext")]
        getter pipeline_context : Types::PipelineContext?

        def initialize(
          @action_configuration : Types::ActionConfiguration? = nil,
          @action_type_id : Types::ActionTypeId? = nil,
          @artifact_credentials : Types::AWSSessionCredentials? = nil,
          @continuation_token : String? = nil,
          @encryption_key : Types::EncryptionKey? = nil,
          @input_artifacts : Array(Types::Artifact)? = nil,
          @output_artifacts : Array(Types::Artifact)? = nil,
          @pipeline_context : Types::PipelineContext? = nil
        )
        end
      end

      # The details of a job sent in response to a GetThirdPartyJobDetails request.

      struct ThirdPartyJobDetails
        include JSON::Serializable

        # The data to be returned by the third party job worker.

        @[JSON::Field(key: "data")]
        getter data : Types::ThirdPartyJobData?

        # The identifier used to identify the job details in CodePipeline.

        @[JSON::Field(key: "id")]
        getter id : String?

        # A system-generated random number that CodePipeline uses to ensure that the job is being worked on by
        # only one job worker. Use this number in an AcknowledgeThirdPartyJob request.

        @[JSON::Field(key: "nonce")]
        getter nonce : String?

        def initialize(
          @data : Types::ThirdPartyJobData? = nil,
          @id : String? = nil,
          @nonce : String? = nil
        )
        end
      end

      # The tags limit for a resource has been exceeded.

      struct TooManyTagsException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Represents information about the state of transitions between one stage and another stage.

      struct TransitionState
        include JSON::Serializable

        # The user-specified reason why the transition between two stages of a pipeline was disabled.

        @[JSON::Field(key: "disabledReason")]
        getter disabled_reason : String?

        # Whether the transition between stages is enabled (true) or disabled (false).

        @[JSON::Field(key: "enabled")]
        getter enabled : Bool?

        # The timestamp when the transition state was last changed.

        @[JSON::Field(key: "lastChangedAt", converter: Aws::Runtime::UnixTimestampConverter)]
        getter last_changed_at : Time?

        # The ID of the user who last changed the transition state.

        @[JSON::Field(key: "lastChangedBy")]
        getter last_changed_by : String?

        def initialize(
          @disabled_reason : String? = nil,
          @enabled : Bool? = nil,
          @last_changed_at : Time? = nil,
          @last_changed_by : String? = nil
        )
        end
      end

      # Unable to roll back the stage. The cause might be if the pipeline version has changed since the
      # target pipeline execution was deployed, the stage is currently running, or an incorrect target
      # pipeline execution ID was provided.

      struct UnableToRollbackStageException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct UntagResourceInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of keys for the tags to be removed from the resource.

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


      struct UpdateActionTypeInput
        include JSON::Serializable

        # The action type definition for the action type to be updated.

        @[JSON::Field(key: "actionType")]
        getter action_type : Types::ActionTypeDeclaration

        def initialize(
          @action_type : Types::ActionTypeDeclaration
        )
        end
      end

      # Represents the input of an UpdatePipeline action.

      struct UpdatePipelineInput
        include JSON::Serializable

        # The name of the pipeline to be updated.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::PipelineDeclaration

        def initialize(
          @pipeline : Types::PipelineDeclaration
        )
        end
      end

      # Represents the output of an UpdatePipeline action.

      struct UpdatePipelineOutput
        include JSON::Serializable

        # The structure of the updated pipeline.

        @[JSON::Field(key: "pipeline")]
        getter pipeline : Types::PipelineDeclaration?

        def initialize(
          @pipeline : Types::PipelineDeclaration? = nil
        )
        end
      end

      # The validation was specified in an invalid format.

      struct ValidationException
        include JSON::Serializable

        def initialize
        end
      end

      # The authentication applied to incoming webhook trigger requests.

      struct WebhookAuthConfiguration
        include JSON::Serializable

        # The property used to configure acceptance of webhooks in an IP address range. For IP, only the
        # AllowedIPRange property must be set. This property must be set to a valid CIDR range.

        @[JSON::Field(key: "AllowedIPRange")]
        getter allowed_ip_range : String?

        # The property used to configure GitHub authentication. For GITHUB_HMAC, only the SecretToken property
        # must be set. When creating CodePipeline webhooks, do not use your own credentials or reuse the same
        # secret token across multiple webhooks. For optimal security, generate a unique secret token for each
        # webhook you create. The secret token is an arbitrary string that you provide, which GitHub uses to
        # compute and sign the webhook payloads sent to CodePipeline, for protecting the integrity and
        # authenticity of the webhook payloads. Using your own credentials or reusing the same token across
        # multiple webhooks can lead to security vulnerabilities. If a secret token was provided, it will be
        # redacted in the response.

        @[JSON::Field(key: "SecretToken")]
        getter secret_token : String?

        def initialize(
          @allowed_ip_range : String? = nil,
          @secret_token : String? = nil
        )
        end
      end

      # Represents information about a webhook and its definition.

      struct WebhookDefinition
        include JSON::Serializable

        # Supported options are GITHUB_HMAC, IP, and UNAUTHENTICATED. When creating CodePipeline webhooks, do
        # not use your own credentials or reuse the same secret token across multiple webhooks. For optimal
        # security, generate a unique secret token for each webhook you create. The secret token is an
        # arbitrary string that you provide, which GitHub uses to compute and sign the webhook payloads sent
        # to CodePipeline, for protecting the integrity and authenticity of the webhook payloads. Using your
        # own credentials or reusing the same token across multiple webhooks can lead to security
        # vulnerabilities. If a secret token was provided, it will be redacted in the response. For
        # information about the authentication scheme implemented by GITHUB_HMAC, see Securing your webhooks
        # on the GitHub Developer website. IP rejects webhooks trigger requests unless they originate from an
        # IP address in the IP range whitelisted in the authentication configuration. UNAUTHENTICATED accepts
        # all webhook trigger requests regardless of origin.

        @[JSON::Field(key: "authentication")]
        getter authentication : String

        # Properties that configure the authentication applied to incoming webhook trigger requests. The
        # required properties depend on the authentication type. For GITHUB_HMAC, only the SecretToken
        # property must be set. For IP, only the AllowedIPRange property must be set to a valid CIDR range.
        # For UNAUTHENTICATED, no properties can be set.

        @[JSON::Field(key: "authenticationConfiguration")]
        getter authentication_configuration : Types::WebhookAuthConfiguration

        # A list of rules applied to the body/payload sent in the POST request to a webhook URL. All defined
        # rules must pass for the request to be accepted and the pipeline started.

        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::WebhookFilterRule)

        # The name of the webhook.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the action in a pipeline you want to connect to the webhook. The action must be from the
        # source (first) stage of the pipeline.

        @[JSON::Field(key: "targetAction")]
        getter target_action : String

        # The name of the pipeline you want to connect to the webhook.

        @[JSON::Field(key: "targetPipeline")]
        getter target_pipeline : String

        def initialize(
          @authentication : String,
          @authentication_configuration : Types::WebhookAuthConfiguration,
          @filters : Array(Types::WebhookFilterRule),
          @name : String,
          @target_action : String,
          @target_pipeline : String
        )
        end
      end

      # The event criteria that specify when a webhook notification is sent to your URL.

      struct WebhookFilterRule
        include JSON::Serializable

        # A JsonPath expression that is applied to the body/payload of the webhook. The value selected by the
        # JsonPath expression must match the value specified in the MatchEquals field. Otherwise, the request
        # is ignored. For more information, see Java JsonPath implementation in GitHub.

        @[JSON::Field(key: "jsonPath")]
        getter json_path : String

        # The value selected by the JsonPath expression must match what is supplied in the MatchEquals field.
        # Otherwise, the request is ignored. Properties from the target action configuration can be included
        # as placeholders in this value by surrounding the action configuration key with curly brackets. For
        # example, if the value supplied here is "refs/heads/{Branch}" and the target action has an action
        # configuration property called "Branch" with a value of "main", the MatchEquals value is evaluated as
        # "refs/heads/main". For a list of action configuration properties for built-in action types, see
        # Pipeline Structure Reference Action Requirements .

        @[JSON::Field(key: "matchEquals")]
        getter match_equals : String?

        def initialize(
          @json_path : String,
          @match_equals : String? = nil
        )
        end
      end

      # The specified webhook was entered in an invalid format or cannot be found.

      struct WebhookNotFoundException
        include JSON::Serializable

        def initialize
        end
      end
    end
  end
end
