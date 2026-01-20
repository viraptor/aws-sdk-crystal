require "json"
require "time"

module AwsSdk
  module ElasticBeanstalk
    module Types


      struct AbortEnvironmentUpdateMessage
        include JSON::Serializable

        # This specifies the ID of the environment with the in-progress update that you want to cancel.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # This specifies the name of the environment with the in-progress update that you want to cancel.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # Describes the properties of an application.

      struct ApplicationDescription
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the application.

        @[JSON::Field(key: "ApplicationArn")]
        getter application_arn : String?

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The names of the configuration templates associated with this application.

        @[JSON::Field(key: "ConfigurationTemplates")]
        getter configuration_templates : Array(String)?

        # The date when the application was created.

        @[JSON::Field(key: "DateCreated")]
        getter date_created : Time?

        # The date when the application was last modified.

        @[JSON::Field(key: "DateUpdated")]
        getter date_updated : Time?

        # User-defined description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The lifecycle settings for the application.

        @[JSON::Field(key: "ResourceLifecycleConfig")]
        getter resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig?

        # The names of the versions for this application.

        @[JSON::Field(key: "Versions")]
        getter versions : Array(String)?

        def initialize(
          @application_arn : String? = nil,
          @application_name : String? = nil,
          @configuration_templates : Array(String)? = nil,
          @date_created : Time? = nil,
          @date_updated : Time? = nil,
          @description : String? = nil,
          @resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig? = nil,
          @versions : Array(String)? = nil
        )
        end
      end

      # Result message containing a single description of an application.

      struct ApplicationDescriptionMessage
        include JSON::Serializable

        # The ApplicationDescription of the application.

        @[JSON::Field(key: "Application")]
        getter application : Types::ApplicationDescription?

        def initialize(
          @application : Types::ApplicationDescription? = nil
        )
        end
      end

      # Result message containing a list of application descriptions.

      struct ApplicationDescriptionsMessage
        include JSON::Serializable

        # This parameter contains a list of ApplicationDescription .

        @[JSON::Field(key: "Applications")]
        getter applications : Array(Types::ApplicationDescription)?

        def initialize(
          @applications : Array(Types::ApplicationDescription)? = nil
        )
        end
      end

      # Application request metrics for an AWS Elastic Beanstalk environment.

      struct ApplicationMetrics
        include JSON::Serializable

        # The amount of time that the metrics cover (usually 10 seconds). For example, you might have 5
        # requests ( request_count ) within the most recent time slice of 10 seconds ( duration ).

        @[JSON::Field(key: "Duration")]
        getter duration : Int32?

        # Represents the average latency for the slowest X percent of requests over the last 10 seconds.
        # Latencies are in seconds with one millisecond resolution.

        @[JSON::Field(key: "Latency")]
        getter latency : Types::Latency?

        # Average number of requests handled by the web server per second over the last 10 seconds.

        @[JSON::Field(key: "RequestCount")]
        getter request_count : Int32?

        # Represents the percentage of requests over the last 10 seconds that resulted in each type of status
        # code response.

        @[JSON::Field(key: "StatusCodes")]
        getter status_codes : Types::StatusCodes?

        def initialize(
          @duration : Int32? = nil,
          @latency : Types::Latency? = nil,
          @request_count : Int32? = nil,
          @status_codes : Types::StatusCodes? = nil
        )
        end
      end

      # The resource lifecycle configuration for an application. Defines lifecycle settings for resources
      # that belong to the application, and the service role that AWS Elastic Beanstalk assumes in order to
      # apply lifecycle settings. The version lifecycle configuration defines lifecycle settings for
      # application versions.

      struct ApplicationResourceLifecycleConfig
        include JSON::Serializable

        # The ARN of an IAM service role that Elastic Beanstalk has permission to assume. The ServiceRole
        # property is required the first time that you provide a VersionLifecycleConfig for the application in
        # one of the supporting calls ( CreateApplication or UpdateApplicationResourceLifecycle ). After you
        # provide it once, in either one of the calls, Elastic Beanstalk persists the Service Role with the
        # application, and you don't need to specify it again in subsequent UpdateApplicationResourceLifecycle
        # calls. You can, however, specify it in subsequent calls to change the Service Role to another value.

        @[JSON::Field(key: "ServiceRole")]
        getter service_role : String?

        # Defines lifecycle settings for application versions.

        @[JSON::Field(key: "VersionLifecycleConfig")]
        getter version_lifecycle_config : Types::ApplicationVersionLifecycleConfig?

        def initialize(
          @service_role : String? = nil,
          @version_lifecycle_config : Types::ApplicationVersionLifecycleConfig? = nil
        )
        end
      end


      struct ApplicationResourceLifecycleDescriptionMessage
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The lifecycle configuration.

        @[JSON::Field(key: "ResourceLifecycleConfig")]
        getter resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig?

        def initialize(
          @application_name : String? = nil,
          @resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig? = nil
        )
        end
      end

      # Describes the properties of an application version.

      struct ApplicationVersionDescription
        include JSON::Serializable

        # The name of the application to which the application version belongs.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The Amazon Resource Name (ARN) of the application version.

        @[JSON::Field(key: "ApplicationVersionArn")]
        getter application_version_arn : String?

        # Reference to the artifact from the AWS CodeBuild build.

        @[JSON::Field(key: "BuildArn")]
        getter build_arn : String?

        # The creation date of the application version.

        @[JSON::Field(key: "DateCreated")]
        getter date_created : Time?

        # The last modified date of the application version.

        @[JSON::Field(key: "DateUpdated")]
        getter date_updated : Time?

        # The description of the application version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If the version's source code was retrieved from AWS CodeCommit, the location of the source code for
        # the application version.

        @[JSON::Field(key: "SourceBuildInformation")]
        getter source_build_information : Types::SourceBuildInformation?

        # The storage location of the application version's source bundle in Amazon S3.

        @[JSON::Field(key: "SourceBundle")]
        getter source_bundle : Types::S3Location?

        # The processing status of the application version. Reflects the state of the application version
        # during its creation. Many of the values are only applicable if you specified True for the Process
        # parameter of the CreateApplicationVersion action. The following list describes the possible values.
        # Unprocessed – Application version wasn't pre-processed or validated. Elastic Beanstalk will validate
        # configuration files during deployment of the application version to an environment. Processing –
        # Elastic Beanstalk is currently processing the application version. Building – Application version is
        # currently undergoing an AWS CodeBuild build. Processed – Elastic Beanstalk was successfully
        # pre-processed and validated. Failed – Either the AWS CodeBuild build failed or configuration files
        # didn't pass validation. This application version isn't usable.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # A unique identifier for the application version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_name : String? = nil,
          @application_version_arn : String? = nil,
          @build_arn : String? = nil,
          @date_created : Time? = nil,
          @date_updated : Time? = nil,
          @description : String? = nil,
          @source_build_information : Types::SourceBuildInformation? = nil,
          @source_bundle : Types::S3Location? = nil,
          @status : String? = nil,
          @version_label : String? = nil
        )
        end
      end

      # Result message wrapping a single description of an application version.

      struct ApplicationVersionDescriptionMessage
        include JSON::Serializable

        # The ApplicationVersionDescription of the application version.

        @[JSON::Field(key: "ApplicationVersion")]
        getter application_version : Types::ApplicationVersionDescription?

        def initialize(
          @application_version : Types::ApplicationVersionDescription? = nil
        )
        end
      end

      # Result message wrapping a list of application version descriptions.

      struct ApplicationVersionDescriptionsMessage
        include JSON::Serializable

        # List of ApplicationVersionDescription objects sorted in order of creation.

        @[JSON::Field(key: "ApplicationVersions")]
        getter application_versions : Array(Types::ApplicationVersionDescription)?

        # In a paginated request, the token that you can pass in a subsequent request to get the next response
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @application_versions : Array(Types::ApplicationVersionDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The application version lifecycle settings for an application. Defines the rules that Elastic
      # Beanstalk applies to an application's versions in order to avoid hitting the per-region limit for
      # application versions. When Elastic Beanstalk deletes an application version from its database, you
      # can no longer deploy that version to an environment. The source bundle remains in S3 unless you
      # configure the rule to delete it.

      struct ApplicationVersionLifecycleConfig
        include JSON::Serializable

        # Specify a max age rule to restrict the length of time that application versions are retained for an
        # application.

        @[JSON::Field(key: "MaxAgeRule")]
        getter max_age_rule : Types::MaxAgeRule?

        # Specify a max count rule to restrict the number of application versions that are retained for an
        # application.

        @[JSON::Field(key: "MaxCountRule")]
        getter max_count_rule : Types::MaxCountRule?

        def initialize(
          @max_age_rule : Types::MaxAgeRule? = nil,
          @max_count_rule : Types::MaxCountRule? = nil
        )
        end
      end

      # Request to execute a scheduled managed action immediately.

      struct ApplyEnvironmentManagedActionRequest
        include JSON::Serializable

        # The action ID of the scheduled managed action to execute.

        @[JSON::Field(key: "ActionId")]
        getter action_id : String

        # The environment ID of the target environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the target environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @action_id : String,
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # The result message containing information about the managed action.

      struct ApplyEnvironmentManagedActionResult
        include JSON::Serializable

        # A description of the managed action.

        @[JSON::Field(key: "ActionDescription")]
        getter action_description : String?

        # The action ID of the managed action.

        @[JSON::Field(key: "ActionId")]
        getter action_id : String?

        # The type of managed action.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The status of the managed action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @action_description : String? = nil,
          @action_id : String? = nil,
          @action_type : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Request to add or change the operations role used by an environment.

      struct AssociateEnvironmentOperationsRoleMessage
        include JSON::Serializable

        # The name of the environment to which to set the operations role.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String

        # The Amazon Resource Name (ARN) of an existing IAM role to be used as the environment's operations
        # role.

        @[JSON::Field(key: "OperationsRole")]
        getter operations_role : String

        def initialize(
          @environment_name : String,
          @operations_role : String
        )
        end
      end

      # Describes an Auto Scaling launch configuration.

      struct AutoScalingGroup
        include JSON::Serializable

        # The name of the AutoScalingGroup .

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Settings for an AWS CodeBuild build.

      struct BuildConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that enables AWS
        # CodeBuild to interact with dependent AWS services on behalf of the AWS account.

        @[JSON::Field(key: "CodeBuildServiceRole")]
        getter code_build_service_role : String

        # The ID of the Docker image to use for this build project.

        @[JSON::Field(key: "Image")]
        getter image : String

        # The name of the artifact of the CodeBuild build. If provided, Elastic Beanstalk stores the build
        # artifact in the S3 location S3-bucket /resources/ application-name /codebuild/codebuild-
        # version-label - artifact-name .zip. If not provided, Elastic Beanstalk stores the build artifact in
        # the S3 location S3-bucket /resources/ application-name /codebuild/codebuild- version-label .zip.

        @[JSON::Field(key: "ArtifactName")]
        getter artifact_name : String?

        # Information about the compute resources the build project will use. BUILD_GENERAL1_SMALL: Use up to
        # 3 GB memory and 2 vCPUs for builds BUILD_GENERAL1_MEDIUM: Use up to 7 GB memory and 4 vCPUs for
        # builds BUILD_GENERAL1_LARGE: Use up to 15 GB memory and 8 vCPUs for builds

        @[JSON::Field(key: "ComputeType")]
        getter compute_type : String?

        # How long in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait until timing out any related
        # build that does not get marked as completed. The default is 60 minutes.

        @[JSON::Field(key: "TimeoutInMinutes")]
        getter timeout_in_minutes : Int32?

        def initialize(
          @code_build_service_role : String,
          @image : String,
          @artifact_name : String? = nil,
          @compute_type : String? = nil,
          @timeout_in_minutes : Int32? = nil
        )
        end
      end

      # The builder used to build the custom platform.

      struct Builder
        include JSON::Serializable

        # The ARN of the builder.

        @[JSON::Field(key: "ARN")]
        getter arn : String?

        def initialize(
          @arn : String? = nil
        )
        end
      end

      # CPU utilization metrics for an instance.

      struct CPUUtilization
        include JSON::Serializable

        # Available on Linux environments only. Percentage of time that the CPU has spent in the I/O Wait
        # state over the last 10 seconds.

        @[JSON::Field(key: "IOWait")]
        getter io_wait : Float64?

        # Available on Linux environments only. Percentage of time that the CPU has spent in the IRQ state
        # over the last 10 seconds.

        @[JSON::Field(key: "IRQ")]
        getter irq : Float64?

        # Percentage of time that the CPU has spent in the Idle state over the last 10 seconds.

        @[JSON::Field(key: "Idle")]
        getter idle : Float64?

        # Available on Linux environments only. Percentage of time that the CPU has spent in the Nice state
        # over the last 10 seconds.

        @[JSON::Field(key: "Nice")]
        getter nice : Float64?

        # Available on Windows environments only. Percentage of time that the CPU has spent in the Privileged
        # state over the last 10 seconds.

        @[JSON::Field(key: "Privileged")]
        getter privileged : Float64?

        # Available on Linux environments only. Percentage of time that the CPU has spent in the SoftIRQ state
        # over the last 10 seconds.

        @[JSON::Field(key: "SoftIRQ")]
        getter soft_irq : Float64?

        # Available on Linux environments only. Percentage of time that the CPU has spent in the System state
        # over the last 10 seconds.

        @[JSON::Field(key: "System")]
        getter system : Float64?

        # Percentage of time that the CPU has spent in the User state over the last 10 seconds.

        @[JSON::Field(key: "User")]
        getter user : Float64?

        def initialize(
          @io_wait : Float64? = nil,
          @irq : Float64? = nil,
          @idle : Float64? = nil,
          @nice : Float64? = nil,
          @privileged : Float64? = nil,
          @soft_irq : Float64? = nil,
          @system : Float64? = nil,
          @user : Float64? = nil
        )
        end
      end

      # Results message indicating whether a CNAME is available.

      struct CheckDNSAvailabilityMessage
        include JSON::Serializable

        # The prefix used when this CNAME is reserved.

        @[JSON::Field(key: "CNAMEPrefix")]
        getter cname_prefix : String

        def initialize(
          @cname_prefix : String
        )
        end
      end

      # Indicates if the specified CNAME is available.

      struct CheckDNSAvailabilityResultMessage
        include JSON::Serializable

        # Indicates if the specified CNAME is available: true : The CNAME is available. false : The CNAME is
        # not available.

        @[JSON::Field(key: "Available")]
        getter available : Bool?

        # The fully qualified CNAME to reserve when CreateEnvironment is called with the provided prefix.

        @[JSON::Field(key: "FullyQualifiedCNAME")]
        getter fully_qualified_cname : String?

        def initialize(
          @available : Bool? = nil,
          @fully_qualified_cname : String? = nil
        )
        end
      end

      # AWS CodeBuild is not available in the specified region.

      struct CodeBuildNotInServiceRegionException
        include JSON::Serializable

        def initialize
        end
      end

      # Request to create or update a group of environments.

      struct ComposeEnvironmentsMessage
        include JSON::Serializable

        # The name of the application to which the specified source bundles belong.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The name of the group to which the target environments belong. Specify a group name only if the
        # environment name defined in each target environment's manifest ends with a + (plus) character. See
        # Environment Manifest (env.yaml) for details.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # A list of version labels, specifying one or more application source bundles that belong to the
        # target application. Each source bundle must include an environment manifest that specifies the name
        # of the environment and the name of the solution stack to use, and optionally can specify environment
        # links to create.

        @[JSON::Field(key: "VersionLabels")]
        getter version_labels : Array(String)?

        def initialize(
          @application_name : String? = nil,
          @group_name : String? = nil,
          @version_labels : Array(String)? = nil
        )
        end
      end

      # Describes the possible values for a configuration option.

      struct ConfigurationOptionDescription
        include JSON::Serializable

        # An indication of which action is required if the value for this configuration option changes:
        # NoInterruption : There is no interruption to the environment or application availability.
        # RestartEnvironment : The environment is entirely restarted, all AWS resources are deleted and
        # recreated, and the environment is unavailable during the process. RestartApplicationServer : The
        # environment is available the entire time. However, a short application outage occurs when the
        # application servers on the running Amazon EC2 instances are restarted.

        @[JSON::Field(key: "ChangeSeverity")]
        getter change_severity : String?

        # The default value for this configuration option.

        @[JSON::Field(key: "DefaultValue")]
        getter default_value : String?

        # If specified, the configuration option must be a string value no longer than this value.

        @[JSON::Field(key: "MaxLength")]
        getter max_length : Int32?

        # If specified, the configuration option must be a numeric value less than this value.

        @[JSON::Field(key: "MaxValue")]
        getter max_value : Int32?

        # If specified, the configuration option must be a numeric value greater than this value.

        @[JSON::Field(key: "MinValue")]
        getter min_value : Int32?

        # The name of the configuration option.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # A unique namespace identifying the option's associated AWS resource.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # If specified, the configuration option must be a string value that satisfies this regular
        # expression.

        @[JSON::Field(key: "Regex")]
        getter regex : Types::OptionRestrictionRegex?

        # An indication of whether the user defined this configuration option: true : This configuration
        # option was defined by the user. It is a valid choice for specifying if this as an Option to Remove
        # when updating configuration settings. false : This configuration was not defined by the user.
        # Constraint: You can remove only UserDefined options from a configuration. Valid Values: true | false

        @[JSON::Field(key: "UserDefined")]
        getter user_defined : Bool?

        # If specified, values for the configuration option are selected from this list.

        @[JSON::Field(key: "ValueOptions")]
        getter value_options : Array(String)?

        # An indication of which type of values this option has and whether it is allowable to select one or
        # more than one of the possible values: Scalar : Values for this option are a single selection from
        # the possible values, or an unformatted string, or numeric value governed by the MIN/MAX/Regex
        # constraints. List : Values for this option are multiple selections from the possible values. Boolean
        # : Values for this option are either true or false . Json : Values for this option are a JSON
        # representation of a ConfigDocument .

        @[JSON::Field(key: "ValueType")]
        getter value_type : String?

        def initialize(
          @change_severity : String? = nil,
          @default_value : String? = nil,
          @max_length : Int32? = nil,
          @max_value : Int32? = nil,
          @min_value : Int32? = nil,
          @name : String? = nil,
          @namespace : String? = nil,
          @regex : Types::OptionRestrictionRegex? = nil,
          @user_defined : Bool? = nil,
          @value_options : Array(String)? = nil,
          @value_type : String? = nil
        )
        end
      end

      # A specification identifying an individual configuration option along with its current value. For a
      # list of possible namespaces and option values, see Option Values in the AWS Elastic Beanstalk
      # Developer Guide .

      struct ConfigurationOptionSetting
        include JSON::Serializable

        # A unique namespace that identifies the option's associated AWS resource.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The name of the configuration option.

        @[JSON::Field(key: "OptionName")]
        getter option_name : String?

        # A unique resource name for the option setting. Use it for a time–based scaling configuration option.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        # The current value for the configuration option.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @namespace : String? = nil,
          @option_name : String? = nil,
          @resource_name : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Describes the settings for a specified configuration set.

      struct ConfigurationOptionsDescription
        include JSON::Serializable

        # A list of ConfigurationOptionDescription .

        @[JSON::Field(key: "Options")]
        getter options : Array(Types::ConfigurationOptionDescription)?

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The name of the solution stack these configuration options belong to.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        def initialize(
          @options : Array(Types::ConfigurationOptionDescription)? = nil,
          @platform_arn : String? = nil,
          @solution_stack_name : String? = nil
        )
        end
      end

      # Describes the settings for a configuration set.

      struct ConfigurationSettingsDescription
        include JSON::Serializable

        # The name of the application associated with this configuration set.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The date (in UTC time) when this configuration set was created.

        @[JSON::Field(key: "DateCreated")]
        getter date_created : Time?

        # The date (in UTC time) when this configuration set was last modified.

        @[JSON::Field(key: "DateUpdated")]
        getter date_updated : Time?

        # If this configuration set is associated with an environment, the DeploymentStatus parameter
        # indicates the deployment status of this configuration set: null : This configuration is not
        # associated with a running environment. pending : This is a draft configuration that is not deployed
        # to the associated environment but is in the process of deploying. deployed : This is the
        # configuration that is currently deployed to the associated running environment. failed : This is a
        # draft configuration that failed to successfully deploy.

        @[JSON::Field(key: "DeploymentStatus")]
        getter deployment_status : String?

        # Describes this configuration set.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # If not null , the name of the environment for this configuration set.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # A list of the configuration options and their values in this configuration set.

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)?

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The name of the solution stack this configuration set uses.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # If not null , the name of the configuration template for this configuration set.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @application_name : String? = nil,
          @date_created : Time? = nil,
          @date_updated : Time? = nil,
          @deployment_status : String? = nil,
          @description : String? = nil,
          @environment_name : String? = nil,
          @option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
          @platform_arn : String? = nil,
          @solution_stack_name : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # The results from a request to change the configuration settings of an environment.

      struct ConfigurationSettingsDescriptions
        include JSON::Serializable

        # A list of ConfigurationSettingsDescription .

        @[JSON::Field(key: "ConfigurationSettings")]
        getter configuration_settings : Array(Types::ConfigurationSettingsDescription)?

        def initialize(
          @configuration_settings : Array(Types::ConfigurationSettingsDescription)? = nil
        )
        end
      end

      # Provides a list of validation messages.

      struct ConfigurationSettingsValidationMessages
        include JSON::Serializable

        # A list of ValidationMessage .

        @[JSON::Field(key: "Messages")]
        getter messages : Array(Types::ValidationMessage)?

        def initialize(
          @messages : Array(Types::ValidationMessage)? = nil
        )
        end
      end

      # Request to create an application.

      struct CreateApplicationMessage
        include JSON::Serializable

        # The name of the application. Must be unique within your account.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # Your description of the application.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Specifies an application resource lifecycle configuration to prevent your application from
        # accumulating too many versions.

        @[JSON::Field(key: "ResourceLifecycleConfig")]
        getter resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig?

        # Specifies the tags applied to the application. Elastic Beanstalk applies these tags only to the
        # application. Environments that you create in the application don't inherit the tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_name : String,
          @description : String? = nil,
          @resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateApplicationVersionMessage
        include JSON::Serializable

        # The name of the application. If no application is found with this name, and AutoCreateApplication is
        # false , returns an InvalidParameterValue error.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # A label identifying this version. Constraint: Must be unique per application. If an application
        # version already exists with this label for the specified application, AWS Elastic Beanstalk returns
        # an InvalidParameterValue error.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String

        # Set to true to create an application with the specified name if it doesn't already exist.

        @[JSON::Field(key: "AutoCreateApplication")]
        getter auto_create_application : Bool?

        # Settings for an AWS CodeBuild build.

        @[JSON::Field(key: "BuildConfiguration")]
        getter build_configuration : Types::BuildConfiguration?

        # A description of this application version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # Pre-processes and validates the environment manifest ( env.yaml ) and configuration files ( *.config
        # files in the .ebextensions folder) in the source bundle. Validating configuration files can identify
        # issues prior to deploying the application version to an environment. You must turn processing on for
        # application versions that you create using AWS CodeBuild or AWS CodeCommit. For application versions
        # built from a source bundle in Amazon S3, processing is optional. The Process option validates
        # Elastic Beanstalk configuration files. It doesn't validate your application's configuration files,
        # like proxy server or Docker configuration.

        @[JSON::Field(key: "Process")]
        getter process : Bool?

        # Specify a commit in an AWS CodeCommit Git repository to use as the source code for the application
        # version.

        @[JSON::Field(key: "SourceBuildInformation")]
        getter source_build_information : Types::SourceBuildInformation?

        # The Amazon S3 bucket and key that identify the location of the source bundle for this version. The
        # Amazon S3 bucket must be in the same region as the environment. Specify a source bundle in S3 or a
        # commit in an AWS CodeCommit repository (with SourceBuildInformation ), but not both. If neither
        # SourceBundle nor SourceBuildInformation are provided, Elastic Beanstalk uses a sample application.

        @[JSON::Field(key: "SourceBundle")]
        getter source_bundle : Types::S3Location?

        # Specifies the tags applied to the application version. Elastic Beanstalk applies these tags only to
        # the application version. Environments that use the application version don't inherit the tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_name : String,
          @version_label : String,
          @auto_create_application : Bool? = nil,
          @build_configuration : Types::BuildConfiguration? = nil,
          @description : String? = nil,
          @process : Bool? = nil,
          @source_build_information : Types::SourceBuildInformation? = nil,
          @source_bundle : Types::S3Location? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end

      # Request to create a configuration template.

      struct CreateConfigurationTemplateMessage
        include JSON::Serializable

        # The name of the Elastic Beanstalk application to associate with this configuration template.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The name of the configuration template. Constraint: This name must be unique per application.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # An optional description for this configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of an environment whose settings you want to use to create the configuration template. You
        # must specify EnvironmentId if you don't specify PlatformArn , SolutionStackName , or
        # SourceConfiguration .

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Option values for the Elastic Beanstalk configuration, such as the instance type. If specified,
        # these values override the values obtained from the solution stack or the source configuration
        # template. For a complete list of Elastic Beanstalk configuration options, see Option Values in the
        # AWS Elastic Beanstalk Developer Guide .

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)?

        # The Amazon Resource Name (ARN) of the custom platform. For more information, see Custom Platforms in
        # the AWS Elastic Beanstalk Developer Guide . If you specify PlatformArn , then don't specify
        # SolutionStackName .

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The name of an Elastic Beanstalk solution stack (platform version) that this configuration uses. For
        # example, 64bit Amazon Linux 2013.09 running Tomcat 7 Java 7 . A solution stack specifies the
        # operating system, runtime, and application server for a configuration template. It also determines
        # the set of configuration options as well as the possible and default values. For more information,
        # see Supported Platforms in the AWS Elastic Beanstalk Developer Guide . You must specify
        # SolutionStackName if you don't specify PlatformArn , EnvironmentId , or SourceConfiguration . Use
        # the ListAvailableSolutionStacks API to obtain a list of available solution stacks.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # An Elastic Beanstalk configuration template to base this one on. If specified, Elastic Beanstalk
        # uses the configuration values from the specified configuration template to create a new
        # configuration. Values specified in OptionSettings override any values obtained from the
        # SourceConfiguration . You must specify SourceConfiguration if you don't specify PlatformArn ,
        # EnvironmentId , or SolutionStackName . Constraint: If both solution stack name and source
        # configuration are specified, the solution stack of the source configuration template must match the
        # specified solution stack name.

        @[JSON::Field(key: "SourceConfiguration")]
        getter source_configuration : Types::SourceConfiguration?

        # Specifies the tags applied to the configuration template.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @application_name : String,
          @template_name : String,
          @description : String? = nil,
          @environment_id : String? = nil,
          @option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
          @platform_arn : String? = nil,
          @solution_stack_name : String? = nil,
          @source_configuration : Types::SourceConfiguration? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreateEnvironmentMessage
        include JSON::Serializable

        # The name of the application that is associated with this environment.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # If specified, the environment attempts to use this value as the prefix for the CNAME in your Elastic
        # Beanstalk environment URL. If not specified, the CNAME is generated automatically by appending a
        # random alphanumeric string to the environment name.

        @[JSON::Field(key: "CNAMEPrefix")]
        getter cname_prefix : String?

        # Your description for this environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A unique name for the environment. Constraint: Must be from 4 to 40 characters in length. The name
        # can contain only letters, numbers, and hyphens. It can't start or end with a hyphen. This name must
        # be unique within a region in your account. If the specified name already exists in the region,
        # Elastic Beanstalk returns an InvalidParameterValue error. If you don't specify the CNAMEPrefix
        # parameter, the environment name becomes part of the CNAME, and therefore part of the visible URL for
        # your application.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The name of the group to which the target environment belongs. Specify a group name only if the
        # environment's name is specified in an environment manifest and not with the environment name
        # parameter. See Environment Manifest (env.yaml) for details.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # The Amazon Resource Name (ARN) of an existing IAM role to be used as the environment's operations
        # role. If specified, Elastic Beanstalk uses the operations role for permissions to downstream
        # services during this call and during subsequent calls acting on this environment. To specify an
        # operations role, you must have the iam:PassRole permission for the role. For more information, see
        # Operations roles in the AWS Elastic Beanstalk Developer Guide .

        @[JSON::Field(key: "OperationsRole")]
        getter operations_role : String?

        # If specified, AWS Elastic Beanstalk sets the specified configuration options to the requested value
        # in the configuration set for the new environment. These override the values obtained from the
        # solution stack or the configuration template.

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)?

        # A list of custom user-defined configuration options to remove from the configuration set for this
        # new environment.

        @[JSON::Field(key: "OptionsToRemove")]
        getter options_to_remove : Array(Types::OptionSpecification)?

        # The Amazon Resource Name (ARN) of the custom platform to use with the environment. For more
        # information, see Custom Platforms in the AWS Elastic Beanstalk Developer Guide . If you specify
        # PlatformArn , don't specify SolutionStackName .

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The name of an Elastic Beanstalk solution stack (platform version) to use with the environment. If
        # specified, Elastic Beanstalk sets the configuration values to the default values associated with the
        # specified solution stack. For a list of current solution stacks, see Elastic Beanstalk Supported
        # Platforms in the AWS Elastic Beanstalk Platforms guide. If you specify SolutionStackName , don't
        # specify PlatformArn or TemplateName .

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # Specifies the tags applied to resources in the environment.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        # The name of the Elastic Beanstalk configuration template to use with the environment. If you specify
        # TemplateName , then don't specify SolutionStackName .

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # Specifies the tier to use in creating this environment. The environment tier that you choose
        # determines whether Elastic Beanstalk provisions resources to support a web application that handles
        # HTTP(S) requests or a web application that handles background-processing tasks.

        @[JSON::Field(key: "Tier")]
        getter tier : Types::EnvironmentTier?

        # The name of the application version to deploy. Default: If not specified, Elastic Beanstalk attempts
        # to deploy the sample application.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_name : String,
          @cname_prefix : String? = nil,
          @description : String? = nil,
          @environment_name : String? = nil,
          @group_name : String? = nil,
          @operations_role : String? = nil,
          @option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
          @options_to_remove : Array(Types::OptionSpecification)? = nil,
          @platform_arn : String? = nil,
          @solution_stack_name : String? = nil,
          @tags : Array(Types::Tag)? = nil,
          @template_name : String? = nil,
          @tier : Types::EnvironmentTier? = nil,
          @version_label : String? = nil
        )
        end
      end

      # Request to create a new platform version.

      struct CreatePlatformVersionRequest
        include JSON::Serializable

        # The location of the platform definition archive in Amazon S3.

        @[JSON::Field(key: "PlatformDefinitionBundle")]
        getter platform_definition_bundle : Types::S3Location

        # The name of your custom platform.

        @[JSON::Field(key: "PlatformName")]
        getter platform_name : String

        # The number, such as 1.0.2, for the new platform version.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String

        # The name of the builder environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The configuration option settings to apply to the builder environment.

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)?

        # Specifies the tags applied to the new platform version. Elastic Beanstalk applies these tags only to
        # the platform version. Environments that you create using the platform version don't inherit the
        # tags.

        @[JSON::Field(key: "Tags")]
        getter tags : Array(Types::Tag)?

        def initialize(
          @platform_definition_bundle : Types::S3Location,
          @platform_name : String,
          @platform_version : String,
          @environment_name : String? = nil,
          @option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
          @tags : Array(Types::Tag)? = nil
        )
        end
      end


      struct CreatePlatformVersionResult
        include JSON::Serializable

        # The builder used to create the custom platform.

        @[JSON::Field(key: "Builder")]
        getter builder : Types::Builder?

        # Detailed information about the new version of the custom platform.

        @[JSON::Field(key: "PlatformSummary")]
        getter platform_summary : Types::PlatformSummary?

        def initialize(
          @builder : Types::Builder? = nil,
          @platform_summary : Types::PlatformSummary? = nil
        )
        end
      end

      # Results of a CreateStorageLocationResult call.

      struct CreateStorageLocationResultMessage
        include JSON::Serializable

        # The name of the Amazon S3 bucket created.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        def initialize(
          @s3_bucket : String? = nil
        )
        end
      end

      # A custom AMI available to platforms.

      struct CustomAmi
        include JSON::Serializable

        # THe ID of the image used to create the custom AMI.

        @[JSON::Field(key: "ImageId")]
        getter image_id : String?

        # The type of virtualization used to create the custom AMI.

        @[JSON::Field(key: "VirtualizationType")]
        getter virtualization_type : String?

        def initialize(
          @image_id : String? = nil,
          @virtualization_type : String? = nil
        )
        end
      end

      # Request to delete an application.

      struct DeleteApplicationMessage
        include JSON::Serializable

        # The name of the application to delete.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # When set to true, running environments will be terminated before deleting the application.

        @[JSON::Field(key: "TerminateEnvByForce")]
        getter terminate_env_by_force : Bool?

        def initialize(
          @application_name : String,
          @terminate_env_by_force : Bool? = nil
        )
        end
      end

      # Request to delete an application version.

      struct DeleteApplicationVersionMessage
        include JSON::Serializable

        # The name of the application to which the version belongs.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The label of the version to delete.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String

        # Set to true to delete the source bundle from your storage bucket. Otherwise, the application version
        # is deleted only from Elastic Beanstalk and the source bundle remains in Amazon S3.

        @[JSON::Field(key: "DeleteSourceBundle")]
        getter delete_source_bundle : Bool?

        def initialize(
          @application_name : String,
          @version_label : String,
          @delete_source_bundle : Bool? = nil
        )
        end
      end

      # Request to delete a configuration template.

      struct DeleteConfigurationTemplateMessage
        include JSON::Serializable

        # The name of the application to delete the configuration template from.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The name of the configuration template to delete.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        def initialize(
          @application_name : String,
          @template_name : String
        )
        end
      end

      # Request to delete a draft environment configuration.

      struct DeleteEnvironmentConfigurationMessage
        include JSON::Serializable

        # The name of the application the environment is associated with.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The name of the environment to delete the draft configuration from.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String

        def initialize(
          @application_name : String,
          @environment_name : String
        )
        end
      end


      struct DeletePlatformVersionRequest
        include JSON::Serializable

        # The ARN of the version of the custom platform.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        def initialize(
          @platform_arn : String? = nil
        )
        end
      end


      struct DeletePlatformVersionResult
        include JSON::Serializable

        # Detailed information about the version of the custom platform.

        @[JSON::Field(key: "PlatformSummary")]
        getter platform_summary : Types::PlatformSummary?

        def initialize(
          @platform_summary : Types::PlatformSummary? = nil
        )
        end
      end

      # Information about an application version deployment.

      struct Deployment
        include JSON::Serializable

        # The ID of the deployment. This number increases by one each time that you deploy source code or
        # change instance configuration settings.

        @[JSON::Field(key: "DeploymentId")]
        getter deployment_id : Int64?

        # For in-progress deployments, the time that the deployment started. For completed deployments, the
        # time that the deployment ended.

        @[JSON::Field(key: "DeploymentTime")]
        getter deployment_time : Time?

        # The status of the deployment: In Progress : The deployment is in progress. Deployed : The deployment
        # succeeded. Failed : The deployment failed.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The version label of the application version in the deployment.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @deployment_id : Int64? = nil,
          @deployment_time : Time? = nil,
          @status : String? = nil,
          @version_label : String? = nil
        )
        end
      end


      struct DescribeAccountAttributesResult
        include JSON::Serializable

        # The Elastic Beanstalk resource quotas associated with the calling AWS account.

        @[JSON::Field(key: "ResourceQuotas")]
        getter resource_quotas : Types::ResourceQuotas?

        def initialize(
          @resource_quotas : Types::ResourceQuotas? = nil
        )
        end
      end

      # Request to describe application versions.

      struct DescribeApplicationVersionsMessage
        include JSON::Serializable

        # Specify an application name to show only application versions for that application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # For a paginated request. Specify a maximum number of application versions to include in each
        # response. If no MaxRecords is specified, all available application versions are retrieved in a
        # single response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # For a paginated request. Specify a token from a previous response page to retrieve the next response
        # page. All other parameter values must be identical to the ones specified in the initial request. If
        # no NextToken is specified, the first page is retrieved.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Specify a version label to show a specific application version.

        @[JSON::Field(key: "VersionLabels")]
        getter version_labels : Array(String)?

        def initialize(
          @application_name : String? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil,
          @version_labels : Array(String)? = nil
        )
        end
      end

      # Request to describe one or more applications.

      struct DescribeApplicationsMessage
        include JSON::Serializable

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to only include those with
        # the specified names.

        @[JSON::Field(key: "ApplicationNames")]
        getter application_names : Array(String)?

        def initialize(
          @application_names : Array(String)? = nil
        )
        end
      end

      # Result message containing a list of application version descriptions.

      struct DescribeConfigurationOptionsMessage
        include JSON::Serializable

        # The name of the application associated with the configuration template or environment. Only needed
        # if you want to describe the configuration options associated with either the configuration template
        # or environment.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The name of the environment whose configuration options you want to describe.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # If specified, restricts the descriptions to only the specified options.

        @[JSON::Field(key: "Options")]
        getter options : Array(Types::OptionSpecification)?

        # The ARN of the custom platform.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The name of the solution stack whose configuration options you want to describe.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # The name of the configuration template whose configuration options you want to describe.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @application_name : String? = nil,
          @environment_name : String? = nil,
          @options : Array(Types::OptionSpecification)? = nil,
          @platform_arn : String? = nil,
          @solution_stack_name : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # Result message containing all of the configuration settings for a specified solution stack or
      # configuration template.

      struct DescribeConfigurationSettingsMessage
        include JSON::Serializable

        # The application for the environment or configuration template.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The name of the environment to describe. Condition: You must specify either this or a TemplateName,
        # but not both. If you specify both, AWS Elastic Beanstalk returns an InvalidParameterCombination
        # error. If you do not specify either, AWS Elastic Beanstalk returns MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The name of the configuration template to describe. Conditional: You must specify either this
        # parameter or an EnvironmentName, but not both. If you specify both, AWS Elastic Beanstalk returns an
        # InvalidParameterCombination error. If you do not specify either, AWS Elastic Beanstalk returns a
        # MissingRequiredParameter error.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @application_name : String,
          @environment_name : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # See the example below to learn how to create a request body.

      struct DescribeEnvironmentHealthRequest
        include JSON::Serializable

        # Specify the response elements to return. To retrieve all attributes, set to All . If no attribute
        # names are specified, returns the name of the environment.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        # Specify the environment by ID. You must specify either this or an EnvironmentName, or both.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Specify the environment by name. You must specify either this or an EnvironmentName, or both.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @attribute_names : Array(String)? = nil,
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # Health details for an AWS Elastic Beanstalk environment.

      struct DescribeEnvironmentHealthResult
        include JSON::Serializable

        # Application request metrics for the environment.

        @[JSON::Field(key: "ApplicationMetrics")]
        getter application_metrics : Types::ApplicationMetrics?

        # Descriptions of the data that contributed to the environment's current health status.

        @[JSON::Field(key: "Causes")]
        getter causes : Array(String)?

        # The health color of the environment.

        @[JSON::Field(key: "Color")]
        getter color : String?

        # The environment's name.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The health status of the environment. For example, Ok .

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # Summary health information for the instances in the environment.

        @[JSON::Field(key: "InstancesHealth")]
        getter instances_health : Types::InstanceHealthSummary?

        # The date and time that the health information was retrieved.

        @[JSON::Field(key: "RefreshedAt")]
        getter refreshed_at : Time?

        # The environment's operational status. Ready , Launching , Updating , Terminating , or Terminated .

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @application_metrics : Types::ApplicationMetrics? = nil,
          @causes : Array(String)? = nil,
          @color : String? = nil,
          @environment_name : String? = nil,
          @health_status : String? = nil,
          @instances_health : Types::InstanceHealthSummary? = nil,
          @refreshed_at : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Request to list completed and failed managed actions.

      struct DescribeEnvironmentManagedActionHistoryRequest
        include JSON::Serializable

        # The environment ID of the target environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the target environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The maximum number of items to return for a single request.

        @[JSON::Field(key: "MaxItems")]
        getter max_items : Int32?

        # The pagination token returned by a previous request.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @max_items : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      # A result message containing a list of completed and failed managed actions.

      struct DescribeEnvironmentManagedActionHistoryResult
        include JSON::Serializable

        # A list of completed and failed managed actions.

        @[JSON::Field(key: "ManagedActionHistoryItems")]
        getter managed_action_history_items : Array(Types::ManagedActionHistoryItem)?

        # A pagination token that you pass to DescribeEnvironmentManagedActionHistory to get the next page of
        # results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @managed_action_history_items : Array(Types::ManagedActionHistoryItem)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Request to list an environment's upcoming and in-progress managed actions.

      struct DescribeEnvironmentManagedActionsRequest
        include JSON::Serializable

        # The environment ID of the target environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the target environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # To show only actions with a particular status, specify a status.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The result message containing a list of managed actions.

      struct DescribeEnvironmentManagedActionsResult
        include JSON::Serializable

        # A list of upcoming and in-progress managed actions.

        @[JSON::Field(key: "ManagedActions")]
        getter managed_actions : Array(Types::ManagedAction)?

        def initialize(
          @managed_actions : Array(Types::ManagedAction)? = nil
        )
        end
      end

      # Request to describe the resources in an environment.

      struct DescribeEnvironmentResourcesMessage
        include JSON::Serializable

        # The ID of the environment to retrieve AWS resource usage data. Condition: You must specify either
        # this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the environment to retrieve AWS resource usage data. Condition: You must specify either
        # this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # Request to describe one or more environments.

      struct DescribeEnvironmentsMessage
        include JSON::Serializable

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that
        # are associated with this application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that
        # have the specified IDs.

        @[JSON::Field(key: "EnvironmentIds")]
        getter environment_ids : Array(String)?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that
        # have the specified names.

        @[JSON::Field(key: "EnvironmentNames")]
        getter environment_names : Array(String)?

        # Indicates whether to include deleted environments: true : Environments that have been deleted after
        # IncludedDeletedBackTo are displayed. false : Do not include deleted environments.

        @[JSON::Field(key: "IncludeDeleted")]
        getter include_deleted : Bool?

        # If specified when IncludeDeleted is set to true , then environments deleted after this date are
        # displayed.

        @[JSON::Field(key: "IncludedDeletedBackTo")]
        getter included_deleted_back_to : Time?

        # For a paginated request. Specify a maximum number of environments to include in each response. If no
        # MaxRecords is specified, all available environments are retrieved in a single response.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # For a paginated request. Specify a token from a previous response page to retrieve the next response
        # page. All other parameter values must be identical to the ones specified in the initial request. If
        # no NextToken is specified, the first page is retrieved.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those that
        # are associated with this application version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_name : String? = nil,
          @environment_ids : Array(String)? = nil,
          @environment_names : Array(String)? = nil,
          @include_deleted : Bool? = nil,
          @included_deleted_back_to : Time? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil,
          @version_label : String? = nil
        )
        end
      end

      # Request to retrieve a list of events for an environment.

      struct DescribeEventsMessage
        include JSON::Serializable

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to include only those
        # associated with this application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that occur up to,
        # but not including, the EndTime .

        @[JSON::Field(key: "EndTime")]
        getter end_time : Time?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with
        # this environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with
        # this environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # Specifies the maximum number of events that can be returned, beginning with the most recent event.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # Pagination token. If specified, the events return the next batch of results.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The ARN of a custom platform version. If specified, AWS Elastic Beanstalk restricts the returned
        # descriptions to those associated with this custom platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # If specified, AWS Elastic Beanstalk restricts the described events to include only those associated
        # with this request ID.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # If specified, limits the events returned from this call to include only those with the specified
        # severity or higher.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that occur on or
        # after this time.

        @[JSON::Field(key: "StartTime")]
        getter start_time : Time?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to those that are associated
        # with this environment configuration.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # If specified, AWS Elastic Beanstalk restricts the returned descriptions to those associated with
        # this application version.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_name : String? = nil,
          @end_time : Time? = nil,
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil,
          @platform_arn : String? = nil,
          @request_id : String? = nil,
          @severity : String? = nil,
          @start_time : Time? = nil,
          @template_name : String? = nil,
          @version_label : String? = nil
        )
        end
      end

      # Parameters for a call to DescribeInstancesHealth .

      struct DescribeInstancesHealthRequest
        include JSON::Serializable

        # Specifies the response elements you wish to receive. To retrieve all attributes, set to All . If no
        # attribute names are specified, returns a list of instances.

        @[JSON::Field(key: "AttributeNames")]
        getter attribute_names : Array(String)?

        # Specify the AWS Elastic Beanstalk environment by ID.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # Specify the AWS Elastic Beanstalk environment by name.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # Specify the pagination token returned by a previous call.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @attribute_names : Array(String)? = nil,
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @next_token : String? = nil
        )
        end
      end

      # Detailed health information about the Amazon EC2 instances in an AWS Elastic Beanstalk environment.

      struct DescribeInstancesHealthResult
        include JSON::Serializable

        # Detailed health information about each instance. The output differs slightly between Linux and
        # Windows environments. There is a difference in the members that are supported under the
        # &lt;CPUUtilization&gt; type.

        @[JSON::Field(key: "InstanceHealthList")]
        getter instance_health_list : Array(Types::SingleInstanceHealth)?

        # Pagination token for the next page of results, if available.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # The date and time that the health information was retrieved.

        @[JSON::Field(key: "RefreshedAt")]
        getter refreshed_at : Time?

        def initialize(
          @instance_health_list : Array(Types::SingleInstanceHealth)? = nil,
          @next_token : String? = nil,
          @refreshed_at : Time? = nil
        )
        end
      end


      struct DescribePlatformVersionRequest
        include JSON::Serializable

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        def initialize(
          @platform_arn : String? = nil
        )
        end
      end


      struct DescribePlatformVersionResult
        include JSON::Serializable

        # Detailed information about the platform version.

        @[JSON::Field(key: "PlatformDescription")]
        getter platform_description : Types::PlatformDescription?

        def initialize(
          @platform_description : Types::PlatformDescription? = nil
        )
        end
      end

      # Request to disassociate the operations role from an environment.

      struct DisassociateEnvironmentOperationsRoleMessage
        include JSON::Serializable

        # The name of the environment from which to disassociate the operations role.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String

        def initialize(
          @environment_name : String
        )
        end
      end

      # A generic service exception has occurred.

      struct ElasticBeanstalkServiceException
        include JSON::Serializable

        # The exception error message.

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes the properties of an environment.

      struct EnvironmentDescription
        include JSON::Serializable

        # Indicates if there is an in-progress environment configuration update or application version
        # deployment that you can cancel. true: There is an update in progress. false: There are no updates
        # currently in progress.

        @[JSON::Field(key: "AbortableOperationInProgress")]
        getter abortable_operation_in_progress : Bool?

        # The name of the application associated with this environment.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The URL to the CNAME for this environment.

        @[JSON::Field(key: "CNAME")]
        getter cname : String?

        # The creation date for this environment.

        @[JSON::Field(key: "DateCreated")]
        getter date_created : Time?

        # The last modified date for this environment.

        @[JSON::Field(key: "DateUpdated")]
        getter date_updated : Time?

        # Describes this environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # For load-balanced, autoscaling environments, the URL to the LoadBalancer. For single-instance
        # environments, the IP address of the instance.

        @[JSON::Field(key: "EndpointURL")]
        getter endpoint_url : String?

        # The environment's Amazon Resource Name (ARN), which can be used in other API requests that require
        # an ARN.

        @[JSON::Field(key: "EnvironmentArn")]
        getter environment_arn : String?

        # The ID of this environment.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # A list of links to other environments in the same group.

        @[JSON::Field(key: "EnvironmentLinks")]
        getter environment_links : Array(Types::EnvironmentLink)?

        # The name of this environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # Describes the health status of the environment. AWS Elastic Beanstalk indicates the failure levels
        # for a running environment: Red : Indicates the environment is not responsive. Occurs when three or
        # more consecutive failures occur for an environment. Yellow : Indicates that something is wrong.
        # Occurs when two consecutive failures occur for an environment. Green : Indicates the environment is
        # healthy and fully functional. Grey : Default health for a new environment. The environment is not
        # fully launched and health checks have not started or health checks are suspended during an
        # UpdateEnvironment or RestartEnvironment request. Default: Grey

        @[JSON::Field(key: "Health")]
        getter health : String?

        # Returns the health status of the application running in your environment. For more information, see
        # Health Colors and Statuses .

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # The Amazon Resource Name (ARN) of the environment's operations role. For more information, see
        # Operations roles in the AWS Elastic Beanstalk Developer Guide .

        @[JSON::Field(key: "OperationsRole")]
        getter operations_role : String?

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The description of the AWS resources used by this environment.

        @[JSON::Field(key: "Resources")]
        getter resources : Types::EnvironmentResourcesDescription?

        # The name of the SolutionStack deployed with this environment.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # The current operational status of the environment: Launching : Environment is in the process of
        # initial deployment. Updating : Environment is in the process of updating its configuration settings
        # or application version. Ready : Environment is available to have an action performed on it, such as
        # update or terminate. Terminating : Environment is in the shut-down process. Terminated : Environment
        # is not running.

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The name of the configuration template used to originally launch this environment.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # Describes the current tier of this environment.

        @[JSON::Field(key: "Tier")]
        getter tier : Types::EnvironmentTier?

        # The application version deployed in this environment.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @abortable_operation_in_progress : Bool? = nil,
          @application_name : String? = nil,
          @cname : String? = nil,
          @date_created : Time? = nil,
          @date_updated : Time? = nil,
          @description : String? = nil,
          @endpoint_url : String? = nil,
          @environment_arn : String? = nil,
          @environment_id : String? = nil,
          @environment_links : Array(Types::EnvironmentLink)? = nil,
          @environment_name : String? = nil,
          @health : String? = nil,
          @health_status : String? = nil,
          @operations_role : String? = nil,
          @platform_arn : String? = nil,
          @resources : Types::EnvironmentResourcesDescription? = nil,
          @solution_stack_name : String? = nil,
          @status : String? = nil,
          @template_name : String? = nil,
          @tier : Types::EnvironmentTier? = nil,
          @version_label : String? = nil
        )
        end
      end

      # Result message containing a list of environment descriptions.

      struct EnvironmentDescriptionsMessage
        include JSON::Serializable

        # Returns an EnvironmentDescription list.

        @[JSON::Field(key: "Environments")]
        getter environments : Array(Types::EnvironmentDescription)?

        # In a paginated request, the token that you can pass in a subsequent request to get the next response
        # page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @environments : Array(Types::EnvironmentDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The information retrieved from the Amazon EC2 instances.

      struct EnvironmentInfoDescription
        include JSON::Serializable

        # The Amazon EC2 Instance ID for this information.

        @[JSON::Field(key: "Ec2InstanceId")]
        getter ec2_instance_id : String?

        # The type of information retrieved.

        @[JSON::Field(key: "InfoType")]
        getter info_type : String?

        # The retrieved information. Currently contains a presigned Amazon S3 URL. The files are deleted after
        # 15 minutes. Anyone in possession of this URL can access the files before they are deleted. Make the
        # URL available only to trusted parties.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The time stamp when this information was retrieved.

        @[JSON::Field(key: "SampleTimestamp")]
        getter sample_timestamp : Time?

        def initialize(
          @ec2_instance_id : String? = nil,
          @info_type : String? = nil,
          @message : String? = nil,
          @sample_timestamp : Time? = nil
        )
        end
      end

      # A link to another environment, defined in the environment's manifest. Links provide connection
      # information in system properties that can be used to connect to another environment in the same
      # group. See Environment Manifest (env.yaml) for details.

      struct EnvironmentLink
        include JSON::Serializable

        # The name of the linked environment (the dependency).

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The name of the link.

        @[JSON::Field(key: "LinkName")]
        getter link_name : String?

        def initialize(
          @environment_name : String? = nil,
          @link_name : String? = nil
        )
        end
      end

      # Describes the AWS resources in use by this environment. This data is live.

      struct EnvironmentResourceDescription
        include JSON::Serializable

        # The AutoScalingGroups used by this environment.

        @[JSON::Field(key: "AutoScalingGroups")]
        getter auto_scaling_groups : Array(Types::AutoScalingGroup)?

        # The name of the environment.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The Amazon EC2 instances used by this environment.

        @[JSON::Field(key: "Instances")]
        getter instances : Array(Types::Instance)?

        # The Auto Scaling launch configurations in use by this environment.

        @[JSON::Field(key: "LaunchConfigurations")]
        getter launch_configurations : Array(Types::LaunchConfiguration)?

        # The Amazon EC2 launch templates in use by this environment.

        @[JSON::Field(key: "LaunchTemplates")]
        getter launch_templates : Array(Types::LaunchTemplate)?

        # The LoadBalancers in use by this environment.

        @[JSON::Field(key: "LoadBalancers")]
        getter load_balancers : Array(Types::LoadBalancer)?

        # The queues used by this environment.

        @[JSON::Field(key: "Queues")]
        getter queues : Array(Types::Queue)?

        # The AutoScaling triggers in use by this environment.

        @[JSON::Field(key: "Triggers")]
        getter triggers : Array(Types::Trigger)?

        def initialize(
          @auto_scaling_groups : Array(Types::AutoScalingGroup)? = nil,
          @environment_name : String? = nil,
          @instances : Array(Types::Instance)? = nil,
          @launch_configurations : Array(Types::LaunchConfiguration)? = nil,
          @launch_templates : Array(Types::LaunchTemplate)? = nil,
          @load_balancers : Array(Types::LoadBalancer)? = nil,
          @queues : Array(Types::Queue)? = nil,
          @triggers : Array(Types::Trigger)? = nil
        )
        end
      end

      # Result message containing a list of environment resource descriptions.

      struct EnvironmentResourceDescriptionsMessage
        include JSON::Serializable

        # A list of EnvironmentResourceDescription .

        @[JSON::Field(key: "EnvironmentResources")]
        getter environment_resources : Types::EnvironmentResourceDescription?

        def initialize(
          @environment_resources : Types::EnvironmentResourceDescription? = nil
        )
        end
      end

      # Describes the AWS resources in use by this environment. This data is not live data.

      struct EnvironmentResourcesDescription
        include JSON::Serializable

        # Describes the LoadBalancer.

        @[JSON::Field(key: "LoadBalancer")]
        getter load_balancer : Types::LoadBalancerDescription?

        def initialize(
          @load_balancer : Types::LoadBalancerDescription? = nil
        )
        end
      end

      # Describes the properties of an environment tier

      struct EnvironmentTier
        include JSON::Serializable

        # The name of this environment tier. Valid values: For Web server tier – WebServer For Worker tier –
        # Worker

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The type of this environment tier. Valid values: For Web server tier – Standard For Worker tier –
        # SQS/HTTP

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The version of this environment tier. When you don't set a value to it, Elastic Beanstalk uses the
        # latest compatible worker tier version. This member is deprecated. Any specific version that you set
        # may become out of date. We recommend leaving it unspecified.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @type : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Describes an event.

      struct EventDescription
        include JSON::Serializable

        # The application associated with the event.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The name of the environment associated with this event.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The date when the event occurred.

        @[JSON::Field(key: "EventDate")]
        getter event_date : Time?

        # The event message.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The web service request ID for the activity of this event.

        @[JSON::Field(key: "RequestId")]
        getter request_id : String?

        # The severity level of this event.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        # The name of the configuration associated with this event.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # The release label for the application version associated with this event.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_name : String? = nil,
          @environment_name : String? = nil,
          @event_date : Time? = nil,
          @message : String? = nil,
          @platform_arn : String? = nil,
          @request_id : String? = nil,
          @severity : String? = nil,
          @template_name : String? = nil,
          @version_label : String? = nil
        )
        end
      end

      # Result message wrapping a list of event descriptions.

      struct EventDescriptionsMessage
        include JSON::Serializable

        # A list of EventDescription .

        @[JSON::Field(key: "Events")]
        getter events : Array(Types::EventDescription)?

        # If returned, this indicates that there are more results to obtain. Use this token in the next
        # DescribeEvents call to get the next batch of events.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @events : Array(Types::EventDescription)? = nil,
          @next_token : String? = nil
        )
        end
      end

      # The description of an Amazon EC2 instance.

      struct Instance
        include JSON::Serializable

        # The ID of the Amazon EC2 instance.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # Represents summary information about the health of an instance. For more information, see Health
      # Colors and Statuses .

      struct InstanceHealthSummary
        include JSON::Serializable

        # Red. The health agent is reporting a high number of request failures or other issues for an instance
        # or environment.

        @[JSON::Field(key: "Degraded")]
        getter degraded : Int32?

        # Green. An operation is in progress on an instance.

        @[JSON::Field(key: "Info")]
        getter info : Int32?

        # Grey. AWS Elastic Beanstalk and the health agent are reporting no data on an instance.

        @[JSON::Field(key: "NoData")]
        getter no_data : Int32?

        # Green. An instance is passing health checks and the health agent is not reporting any problems.

        @[JSON::Field(key: "Ok")]
        getter ok : Int32?

        # Grey. An operation is in progress on an instance within the command timeout.

        @[JSON::Field(key: "Pending")]
        getter pending : Int32?

        # Red. The health agent is reporting a very high number of request failures or other issues for an
        # instance or environment.

        @[JSON::Field(key: "Severe")]
        getter severe : Int32?

        # Grey. AWS Elastic Beanstalk and the health agent are reporting an insufficient amount of data on an
        # instance.

        @[JSON::Field(key: "Unknown")]
        getter unknown : Int32?

        # Yellow. The health agent is reporting a moderate number of request failures or other issues for an
        # instance or environment.

        @[JSON::Field(key: "Warning")]
        getter warning : Int32?

        def initialize(
          @degraded : Int32? = nil,
          @info : Int32? = nil,
          @no_data : Int32? = nil,
          @ok : Int32? = nil,
          @pending : Int32? = nil,
          @severe : Int32? = nil,
          @unknown : Int32? = nil,
          @warning : Int32? = nil
        )
        end
      end

      # The specified account does not have sufficient privileges for one or more AWS services.

      struct InsufficientPrivilegesException
        include JSON::Serializable

        def initialize
        end
      end

      # One or more input parameters is not valid. Please correct the input parameters and try the operation
      # again.

      struct InvalidRequestException
        include JSON::Serializable

        def initialize
        end
      end

      # Represents the average latency for the slowest X percent of requests over the last 10 seconds.

      struct Latency
        include JSON::Serializable

        # The average latency for the slowest 90 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P10")]
        getter p10 : Float64?

        # The average latency for the slowest 50 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P50")]
        getter p50 : Float64?

        # The average latency for the slowest 25 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P75")]
        getter p75 : Float64?

        # The average latency for the slowest 15 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P85")]
        getter p85 : Float64?

        # The average latency for the slowest 10 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P90")]
        getter p90 : Float64?

        # The average latency for the slowest 5 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P95")]
        getter p95 : Float64?

        # The average latency for the slowest 1 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P99")]
        getter p99 : Float64?

        # The average latency for the slowest 0.1 percent of requests over the last 10 seconds.

        @[JSON::Field(key: "P999")]
        getter p999 : Float64?

        def initialize(
          @p10 : Float64? = nil,
          @p50 : Float64? = nil,
          @p75 : Float64? = nil,
          @p85 : Float64? = nil,
          @p90 : Float64? = nil,
          @p95 : Float64? = nil,
          @p99 : Float64? = nil,
          @p999 : Float64? = nil
        )
        end
      end

      # Describes an Auto Scaling launch configuration.

      struct LaunchConfiguration
        include JSON::Serializable

        # The name of the launch configuration.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Describes an Amazon EC2 launch template.

      struct LaunchTemplate
        include JSON::Serializable

        # The ID of the launch template.

        @[JSON::Field(key: "Id")]
        getter id : String?

        def initialize(
          @id : String? = nil
        )
        end
      end

      # A list of available AWS Elastic Beanstalk solution stacks.

      struct ListAvailableSolutionStacksResultMessage
        include JSON::Serializable

        # A list of available solution stacks and their SolutionStackDescription .

        @[JSON::Field(key: "SolutionStackDetails")]
        getter solution_stack_details : Array(Types::SolutionStackDescription)?

        # A list of available solution stacks.

        @[JSON::Field(key: "SolutionStacks")]
        getter solution_stacks : Array(String)?

        def initialize(
          @solution_stack_details : Array(Types::SolutionStackDescription)? = nil,
          @solution_stacks : Array(String)? = nil
        )
        end
      end


      struct ListPlatformBranchesRequest
        include JSON::Serializable

        # Criteria for restricting the resulting list of platform branches. The filter is evaluated as a
        # logical conjunction (AND) of the separate SearchFilter terms. The following list shows valid
        # attribute values for each of the SearchFilter terms. Most operators take a single value. The in and
        # not_in operators can take multiple values. Attribute = BranchName : Operator : = | != | begins_with
        # | ends_with | contains | in | not_in Attribute = LifecycleState : Operator : = | != | in | not_in
        # Values : beta | supported | deprecated | retired Attribute = PlatformName : Operator : = | != |
        # begins_with | ends_with | contains | in | not_in Attribute = TierType : Operator : = | != Values :
        # WebServer/Standard | Worker/SQS/HTTP Array size: limited to 10 SearchFilter objects. Within each
        # SearchFilter item, the Values array is limited to 10 items.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::SearchFilter)?

        # The maximum number of platform branch values returned in one call.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # For a paginated request. Specify a token from a previous response page to retrieve the next response
        # page. All other parameter values must be identical to the ones specified in the initial request. If
        # no NextToken is specified, the first page is retrieved.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::SearchFilter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPlatformBranchesResult
        include JSON::Serializable

        # In a paginated request, if this value isn't null , it's the token that you can pass in a subsequent
        # request to get the next response page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Summary information about the platform branches.

        @[JSON::Field(key: "PlatformBranchSummaryList")]
        getter platform_branch_summary_list : Array(Types::PlatformBranchSummary)?

        def initialize(
          @next_token : String? = nil,
          @platform_branch_summary_list : Array(Types::PlatformBranchSummary)? = nil
        )
        end
      end


      struct ListPlatformVersionsRequest
        include JSON::Serializable

        # Criteria for restricting the resulting list of platform versions. The filter is interpreted as a
        # logical conjunction (AND) of the separate PlatformFilter terms.

        @[JSON::Field(key: "Filters")]
        getter filters : Array(Types::PlatformFilter)?

        # The maximum number of platform version values returned in one call.

        @[JSON::Field(key: "MaxRecords")]
        getter max_records : Int32?

        # For a paginated request. Specify a token from a previous response page to retrieve the next response
        # page. All other parameter values must be identical to the ones specified in the initial request. If
        # no NextToken is specified, the first page is retrieved.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        def initialize(
          @filters : Array(Types::PlatformFilter)? = nil,
          @max_records : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListPlatformVersionsResult
        include JSON::Serializable

        # In a paginated request, if this value isn't null , it's the token that you can pass in a subsequent
        # request to get the next response page.

        @[JSON::Field(key: "NextToken")]
        getter next_token : String?

        # Summary information about the platform versions.

        @[JSON::Field(key: "PlatformSummaryList")]
        getter platform_summary_list : Array(Types::PlatformSummary)?

        def initialize(
          @next_token : String? = nil,
          @platform_summary_list : Array(Types::PlatformSummary)? = nil
        )
        end
      end


      struct ListTagsForResourceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resouce for which a tag list is requested. Must be the ARN of
        # an Elastic Beanstalk resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end

      # Describes the properties of a Listener for the LoadBalancer.

      struct Listener
        include JSON::Serializable

        # The port that is used by the Listener.

        @[JSON::Field(key: "Port")]
        getter port : Int32?

        # The protocol that is used by the Listener.

        @[JSON::Field(key: "Protocol")]
        getter protocol : String?

        def initialize(
          @port : Int32? = nil,
          @protocol : String? = nil
        )
        end
      end

      # Describes a LoadBalancer.

      struct LoadBalancer
        include JSON::Serializable

        # The name of the LoadBalancer.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Describes the details of a LoadBalancer.

      struct LoadBalancerDescription
        include JSON::Serializable

        # The domain name of the LoadBalancer.

        @[JSON::Field(key: "Domain")]
        getter domain : String?

        # A list of Listeners used by the LoadBalancer.

        @[JSON::Field(key: "Listeners")]
        getter listeners : Array(Types::Listener)?

        # The name of the LoadBalancer.

        @[JSON::Field(key: "LoadBalancerName")]
        getter load_balancer_name : String?

        def initialize(
          @domain : String? = nil,
          @listeners : Array(Types::Listener)? = nil,
          @load_balancer_name : String? = nil
        )
        end
      end

      # The record of an upcoming or in-progress managed action.

      struct ManagedAction
        include JSON::Serializable

        # A description of the managed action.

        @[JSON::Field(key: "ActionDescription")]
        getter action_description : String?

        # A unique identifier for the managed action.

        @[JSON::Field(key: "ActionId")]
        getter action_id : String?

        # The type of managed action.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The status of the managed action. If the action is Scheduled , you can apply it immediately with
        # ApplyEnvironmentManagedAction .

        @[JSON::Field(key: "Status")]
        getter status : String?

        # The start time of the maintenance window in which the managed action will execute.

        @[JSON::Field(key: "WindowStartTime")]
        getter window_start_time : Time?

        def initialize(
          @action_description : String? = nil,
          @action_id : String? = nil,
          @action_type : String? = nil,
          @status : String? = nil,
          @window_start_time : Time? = nil
        )
        end
      end

      # The record of a completed or failed managed action.

      struct ManagedActionHistoryItem
        include JSON::Serializable

        # A description of the managed action.

        @[JSON::Field(key: "ActionDescription")]
        getter action_description : String?

        # A unique identifier for the managed action.

        @[JSON::Field(key: "ActionId")]
        getter action_id : String?

        # The type of the managed action.

        @[JSON::Field(key: "ActionType")]
        getter action_type : String?

        # The date and time that the action started executing.

        @[JSON::Field(key: "ExecutedTime")]
        getter executed_time : Time?

        # If the action failed, a description of the failure.

        @[JSON::Field(key: "FailureDescription")]
        getter failure_description : String?

        # If the action failed, the type of failure.

        @[JSON::Field(key: "FailureType")]
        getter failure_type : String?

        # The date and time that the action finished executing.

        @[JSON::Field(key: "FinishedTime")]
        getter finished_time : Time?

        # The status of the action.

        @[JSON::Field(key: "Status")]
        getter status : String?

        def initialize(
          @action_description : String? = nil,
          @action_id : String? = nil,
          @action_type : String? = nil,
          @executed_time : Time? = nil,
          @failure_description : String? = nil,
          @failure_type : String? = nil,
          @finished_time : Time? = nil,
          @status : String? = nil
        )
        end
      end

      # Cannot modify the managed action in its current state.

      struct ManagedActionInvalidStateException
        include JSON::Serializable

        def initialize
        end
      end

      # A lifecycle rule that deletes application versions after the specified number of days.

      struct MaxAgeRule
        include JSON::Serializable

        # Specify true to apply the rule, or false to disable it.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Set to true to delete a version's source bundle from Amazon S3 when Elastic Beanstalk deletes the
        # application version.

        @[JSON::Field(key: "DeleteSourceFromS3")]
        getter delete_source_from_s3 : Bool?

        # Specify the number of days to retain an application versions.

        @[JSON::Field(key: "MaxAgeInDays")]
        getter max_age_in_days : Int32?

        def initialize(
          @enabled : Bool,
          @delete_source_from_s3 : Bool? = nil,
          @max_age_in_days : Int32? = nil
        )
        end
      end

      # A lifecycle rule that deletes the oldest application version when the maximum count is exceeded.

      struct MaxCountRule
        include JSON::Serializable

        # Specify true to apply the rule, or false to disable it.

        @[JSON::Field(key: "Enabled")]
        getter enabled : Bool

        # Set to true to delete a version's source bundle from Amazon S3 when Elastic Beanstalk deletes the
        # application version.

        @[JSON::Field(key: "DeleteSourceFromS3")]
        getter delete_source_from_s3 : Bool?

        # Specify the maximum number of application versions to retain.

        @[JSON::Field(key: "MaxCount")]
        getter max_count : Int32?

        def initialize(
          @enabled : Bool,
          @delete_source_from_s3 : Bool? = nil,
          @max_count : Int32? = nil
        )
        end
      end

      # Unable to perform the specified operation because another operation that effects an element in this
      # activity is already in progress.

      struct OperationInProgressException
        include JSON::Serializable

        def initialize
        end
      end

      # A regular expression representing a restriction on a string configuration option value.

      struct OptionRestrictionRegex
        include JSON::Serializable

        # A unique name representing this regular expression.

        @[JSON::Field(key: "Label")]
        getter label : String?

        # The regular expression pattern that a string configuration option value with this restriction must
        # match.

        @[JSON::Field(key: "Pattern")]
        getter pattern : String?

        def initialize(
          @label : String? = nil,
          @pattern : String? = nil
        )
        end
      end

      # A specification identifying an individual configuration option.

      struct OptionSpecification
        include JSON::Serializable

        # A unique namespace identifying the option's associated AWS resource.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The name of the configuration option.

        @[JSON::Field(key: "OptionName")]
        getter option_name : String?

        # A unique resource name for a time-based scaling configuration option.

        @[JSON::Field(key: "ResourceName")]
        getter resource_name : String?

        def initialize(
          @namespace : String? = nil,
          @option_name : String? = nil,
          @resource_name : String? = nil
        )
        end
      end

      # Summary information about a platform branch.

      struct PlatformBranchSummary
        include JSON::Serializable

        # The name of the platform branch.

        @[JSON::Field(key: "BranchName")]
        getter branch_name : String?

        # An ordinal number that designates the order in which platform branches have been added to a
        # platform. This can be helpful, for example, if your code calls the ListPlatformBranches action and
        # then displays a list of platform branches. A larger BranchOrder value designates a newer platform
        # branch within the platform.

        @[JSON::Field(key: "BranchOrder")]
        getter branch_order : Int32?

        # The support life cycle state of the platform branch. Possible values: beta | supported | deprecated
        # | retired

        @[JSON::Field(key: "LifecycleState")]
        getter lifecycle_state : String?

        # The name of the platform to which this platform branch belongs.

        @[JSON::Field(key: "PlatformName")]
        getter platform_name : String?

        # The environment tiers that platform versions in this branch support. Possible values:
        # WebServer/Standard | Worker/SQS/HTTP

        @[JSON::Field(key: "SupportedTierList")]
        getter supported_tier_list : Array(String)?

        def initialize(
          @branch_name : String? = nil,
          @branch_order : Int32? = nil,
          @lifecycle_state : String? = nil,
          @platform_name : String? = nil,
          @supported_tier_list : Array(String)? = nil
        )
        end
      end

      # Detailed information about a platform version.

      struct PlatformDescription
        include JSON::Serializable

        # The custom AMIs supported by the platform version.

        @[JSON::Field(key: "CustomAmiList")]
        getter custom_ami_list : Array(Types::CustomAmi)?

        # The date when the platform version was created.

        @[JSON::Field(key: "DateCreated")]
        getter date_created : Time?

        # The date when the platform version was last updated.

        @[JSON::Field(key: "DateUpdated")]
        getter date_updated : Time?

        # The description of the platform version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The frameworks supported by the platform version.

        @[JSON::Field(key: "Frameworks")]
        getter frameworks : Array(Types::PlatformFramework)?

        # Information about the maintainer of the platform version.

        @[JSON::Field(key: "Maintainer")]
        getter maintainer : String?

        # The operating system used by the platform version.

        @[JSON::Field(key: "OperatingSystemName")]
        getter operating_system_name : String?

        # The version of the operating system used by the platform version.

        @[JSON::Field(key: "OperatingSystemVersion")]
        getter operating_system_version : String?

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The state of the platform version's branch in its lifecycle. Possible values: Beta | Supported |
        # Deprecated | Retired

        @[JSON::Field(key: "PlatformBranchLifecycleState")]
        getter platform_branch_lifecycle_state : String?

        # The platform branch to which the platform version belongs.

        @[JSON::Field(key: "PlatformBranchName")]
        getter platform_branch_name : String?

        # The category of the platform version.

        @[JSON::Field(key: "PlatformCategory")]
        getter platform_category : String?

        # The state of the platform version in its lifecycle. Possible values: Recommended | null If a null
        # value is returned, the platform version isn't the recommended one for its branch. Each platform
        # branch has a single recommended platform version, typically the most recent one.

        @[JSON::Field(key: "PlatformLifecycleState")]
        getter platform_lifecycle_state : String?

        # The name of the platform version.

        @[JSON::Field(key: "PlatformName")]
        getter platform_name : String?

        # The AWS account ID of the person who created the platform version.

        @[JSON::Field(key: "PlatformOwner")]
        getter platform_owner : String?

        # The status of the platform version.

        @[JSON::Field(key: "PlatformStatus")]
        getter platform_status : String?

        # The version of the platform version.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # The programming languages supported by the platform version.

        @[JSON::Field(key: "ProgrammingLanguages")]
        getter programming_languages : Array(Types::PlatformProgrammingLanguage)?

        # The name of the solution stack used by the platform version.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # The additions supported by the platform version.

        @[JSON::Field(key: "SupportedAddonList")]
        getter supported_addon_list : Array(String)?

        # The tiers supported by the platform version.

        @[JSON::Field(key: "SupportedTierList")]
        getter supported_tier_list : Array(String)?

        def initialize(
          @custom_ami_list : Array(Types::CustomAmi)? = nil,
          @date_created : Time? = nil,
          @date_updated : Time? = nil,
          @description : String? = nil,
          @frameworks : Array(Types::PlatformFramework)? = nil,
          @maintainer : String? = nil,
          @operating_system_name : String? = nil,
          @operating_system_version : String? = nil,
          @platform_arn : String? = nil,
          @platform_branch_lifecycle_state : String? = nil,
          @platform_branch_name : String? = nil,
          @platform_category : String? = nil,
          @platform_lifecycle_state : String? = nil,
          @platform_name : String? = nil,
          @platform_owner : String? = nil,
          @platform_status : String? = nil,
          @platform_version : String? = nil,
          @programming_languages : Array(Types::PlatformProgrammingLanguage)? = nil,
          @solution_stack_name : String? = nil,
          @supported_addon_list : Array(String)? = nil,
          @supported_tier_list : Array(String)? = nil
        )
        end
      end

      # Describes criteria to restrict the results when listing platform versions. The filter is evaluated
      # as follows: Type Operator Values[1]

      struct PlatformFilter
        include JSON::Serializable

        # The operator to apply to the Type with each of the Values . Valid values: = | != | &lt; | &lt;= |
        # &gt; | &gt;= | contains | begins_with | ends_with

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        # The platform version attribute to which the filter values are applied. Valid values: PlatformName |
        # PlatformVersion | PlatformStatus | PlatformBranchName | PlatformLifecycleState | PlatformOwner |
        # SupportedTier | SupportedAddon | ProgrammingLanguageName | OperatingSystemName

        @[JSON::Field(key: "Type")]
        getter type : String?

        # The list of values applied to the filtering platform version attribute. Only one value is supported
        # for all current operators. The following list shows valid filter values for some filter attributes.
        # PlatformStatus : Creating | Failed | Ready | Deleting | Deleted PlatformLifecycleState : recommended
        # SupportedTier : WebServer/Standard | Worker/SQS/HTTP SupportedAddon : Log/S3 | Monitoring/Healthd |
        # WorkerDaemon/SQSD

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @operator : String? = nil,
          @type : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # A framework supported by the platform.

      struct PlatformFramework
        include JSON::Serializable

        # The name of the framework.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The version of the framework.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # A programming language supported by the platform.

      struct PlatformProgrammingLanguage
        include JSON::Serializable

        # The name of the programming language.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The version of the programming language.

        @[JSON::Field(key: "Version")]
        getter version : String?

        def initialize(
          @name : String? = nil,
          @version : String? = nil
        )
        end
      end

      # Summary information about a platform version.

      struct PlatformSummary
        include JSON::Serializable

        # The operating system used by the platform version.

        @[JSON::Field(key: "OperatingSystemName")]
        getter operating_system_name : String?

        # The version of the operating system used by the platform version.

        @[JSON::Field(key: "OperatingSystemVersion")]
        getter operating_system_version : String?

        # The ARN of the platform version.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # The state of the platform version's branch in its lifecycle. Possible values: beta | supported |
        # deprecated | retired

        @[JSON::Field(key: "PlatformBranchLifecycleState")]
        getter platform_branch_lifecycle_state : String?

        # The platform branch to which the platform version belongs.

        @[JSON::Field(key: "PlatformBranchName")]
        getter platform_branch_name : String?

        # The category of platform version.

        @[JSON::Field(key: "PlatformCategory")]
        getter platform_category : String?

        # The state of the platform version in its lifecycle. Possible values: recommended | empty If an empty
        # value is returned, the platform version is supported but isn't the recommended one for its branch.

        @[JSON::Field(key: "PlatformLifecycleState")]
        getter platform_lifecycle_state : String?

        # The AWS account ID of the person who created the platform version.

        @[JSON::Field(key: "PlatformOwner")]
        getter platform_owner : String?

        # The status of the platform version. You can create an environment from the platform version once it
        # is ready.

        @[JSON::Field(key: "PlatformStatus")]
        getter platform_status : String?

        # The version string of the platform version.

        @[JSON::Field(key: "PlatformVersion")]
        getter platform_version : String?

        # The additions associated with the platform version.

        @[JSON::Field(key: "SupportedAddonList")]
        getter supported_addon_list : Array(String)?

        # The tiers in which the platform version runs.

        @[JSON::Field(key: "SupportedTierList")]
        getter supported_tier_list : Array(String)?

        def initialize(
          @operating_system_name : String? = nil,
          @operating_system_version : String? = nil,
          @platform_arn : String? = nil,
          @platform_branch_lifecycle_state : String? = nil,
          @platform_branch_name : String? = nil,
          @platform_category : String? = nil,
          @platform_lifecycle_state : String? = nil,
          @platform_owner : String? = nil,
          @platform_status : String? = nil,
          @platform_version : String? = nil,
          @supported_addon_list : Array(String)? = nil,
          @supported_tier_list : Array(String)? = nil
        )
        end
      end

      # You cannot delete the platform version because there are still environments running on it.

      struct PlatformVersionStillReferencedException
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a queue.

      struct Queue
        include JSON::Serializable

        # The name of the queue.

        @[JSON::Field(key: "Name")]
        getter name : String?

        # The URL of the queue.

        @[JSON::Field(key: "URL")]
        getter url : String?

        def initialize(
          @name : String? = nil,
          @url : String? = nil
        )
        end
      end


      struct RebuildEnvironmentMessage
        include JSON::Serializable

        # The ID of the environment to rebuild. Condition: You must specify either this or an EnvironmentName,
        # or both. If you do not specify either, AWS Elastic Beanstalk returns MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the environment to rebuild. Condition: You must specify either this or an EnvironmentId,
        # or both. If you do not specify either, AWS Elastic Beanstalk returns MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # Request to retrieve logs from an environment and store them in your Elastic Beanstalk storage
      # bucket.

      struct RequestEnvironmentInfoMessage
        include JSON::Serializable

        # The type of information to request.

        @[JSON::Field(key: "InfoType")]
        getter info_type : String

        # The ID of the environment of the requested data. If no such environment is found,
        # RequestEnvironmentInfo returns an InvalidParameterValue error. Condition: You must specify either
        # this or an EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the environment of the requested data. If no such environment is found,
        # RequestEnvironmentInfo returns an InvalidParameterValue error. Condition: You must specify either
        # this or an EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @info_type : String,
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # A resource doesn't exist for the specified Amazon Resource Name (ARN).

      struct ResourceNotFoundException
        include JSON::Serializable

        def initialize
        end
      end

      # The AWS Elastic Beanstalk quota information for a single resource type in an AWS account. It
      # reflects the resource's limits for this account.

      struct ResourceQuota
        include JSON::Serializable

        # The maximum number of instances of this Elastic Beanstalk resource type that an AWS account can use.

        @[JSON::Field(key: "Maximum")]
        getter maximum : Int32?

        def initialize(
          @maximum : Int32? = nil
        )
        end
      end

      # A set of per-resource AWS Elastic Beanstalk quotas associated with an AWS account. They reflect
      # Elastic Beanstalk resource limits for this account.

      struct ResourceQuotas
        include JSON::Serializable

        # The quota for applications in the AWS account.

        @[JSON::Field(key: "ApplicationQuota")]
        getter application_quota : Types::ResourceQuota?

        # The quota for application versions in the AWS account.

        @[JSON::Field(key: "ApplicationVersionQuota")]
        getter application_version_quota : Types::ResourceQuota?

        # The quota for configuration templates in the AWS account.

        @[JSON::Field(key: "ConfigurationTemplateQuota")]
        getter configuration_template_quota : Types::ResourceQuota?

        # The quota for custom platforms in the AWS account.

        @[JSON::Field(key: "CustomPlatformQuota")]
        getter custom_platform_quota : Types::ResourceQuota?

        # The quota for environments in the AWS account.

        @[JSON::Field(key: "EnvironmentQuota")]
        getter environment_quota : Types::ResourceQuota?

        def initialize(
          @application_quota : Types::ResourceQuota? = nil,
          @application_version_quota : Types::ResourceQuota? = nil,
          @configuration_template_quota : Types::ResourceQuota? = nil,
          @custom_platform_quota : Types::ResourceQuota? = nil,
          @environment_quota : Types::ResourceQuota? = nil
        )
        end
      end


      struct ResourceTagsDescriptionMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource for which a tag list was requested.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String?

        # A list of tag key-value pairs.

        @[JSON::Field(key: "ResourceTags")]
        getter resource_tags : Array(Types::Tag)?

        def initialize(
          @resource_arn : String? = nil,
          @resource_tags : Array(Types::Tag)? = nil
        )
        end
      end

      # The type of the specified Amazon Resource Name (ARN) isn't supported for this operation.

      struct ResourceTypeNotSupportedException
        include JSON::Serializable

        def initialize
        end
      end


      struct RestartAppServerMessage
        include JSON::Serializable

        # The ID of the environment to restart the server for. Condition: You must specify either this or an
        # EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the environment to restart the server for. Condition: You must specify either this or an
        # EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # Request to download logs retrieved with RequestEnvironmentInfo .

      struct RetrieveEnvironmentInfoMessage
        include JSON::Serializable

        # The type of information to retrieve.

        @[JSON::Field(key: "InfoType")]
        getter info_type : String

        # The ID of the data's environment. If no such environment is found, returns an InvalidParameterValue
        # error. Condition: You must specify either this or an EnvironmentName, or both. If you do not specify
        # either, AWS Elastic Beanstalk returns MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the data's environment. If no such environment is found, returns an
        # InvalidParameterValue error. Condition: You must specify either this or an EnvironmentId, or both.
        # If you do not specify either, AWS Elastic Beanstalk returns MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        def initialize(
          @info_type : String,
          @environment_id : String? = nil,
          @environment_name : String? = nil
        )
        end
      end

      # Result message containing a description of the requested environment info.

      struct RetrieveEnvironmentInfoResultMessage
        include JSON::Serializable

        # The EnvironmentInfoDescription of the environment.

        @[JSON::Field(key: "EnvironmentInfo")]
        getter environment_info : Array(Types::EnvironmentInfoDescription)?

        def initialize(
          @environment_info : Array(Types::EnvironmentInfoDescription)? = nil
        )
        end
      end

      # The bucket and key of an item stored in Amazon S3.

      struct S3Location
        include JSON::Serializable

        # The Amazon S3 bucket where the data is located.

        @[JSON::Field(key: "S3Bucket")]
        getter s3_bucket : String?

        # The Amazon S3 key where the data is located.

        @[JSON::Field(key: "S3Key")]
        getter s3_key : String?

        def initialize(
          @s3_bucket : String? = nil,
          @s3_key : String? = nil
        )
        end
      end

      # The specified S3 bucket does not belong to the S3 region in which the service is running. The
      # following regions are supported: IAD/us-east-1 PDX/us-west-2 DUB/eu-west-1

      struct S3LocationNotInServiceRegionException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified account does not have a subscription to Amazon S3.

      struct S3SubscriptionRequiredException
        include JSON::Serializable

        def initialize
        end
      end

      # Describes criteria to restrict a list of results. For operators that apply a single value to the
      # attribute, the filter is evaluated as follows: Attribute Operator Values[1] Some operators, e.g. in
      # , can apply multiple values. In this case, the filter is evaluated as a logical union (OR) of
      # applications of the operator to the attribute with each one of the values: (Attribute Operator
      # Values[1]) OR (Attribute Operator Values[2]) OR ... The valid values for attributes of SearchFilter
      # depend on the API action. For valid values, see the reference page for the API action you're calling
      # that takes a SearchFilter parameter.

      struct SearchFilter
        include JSON::Serializable

        # The result attribute to which the filter values are applied. Valid values vary by API action.

        @[JSON::Field(key: "Attribute")]
        getter attribute : String?

        # The operator to apply to the Attribute with each of the Values . Valid values vary by Attribute .

        @[JSON::Field(key: "Operator")]
        getter operator : String?

        # The list of values applied to the Attribute and Operator attributes. Number of values and valid
        # values vary by Attribute .

        @[JSON::Field(key: "Values")]
        getter values : Array(String)?

        def initialize(
          @attribute : String? = nil,
          @operator : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Detailed health information about an Amazon EC2 instance in your Elastic Beanstalk environment.

      struct SingleInstanceHealth
        include JSON::Serializable

        # Request metrics from your application.

        @[JSON::Field(key: "ApplicationMetrics")]
        getter application_metrics : Types::ApplicationMetrics?

        # The availability zone in which the instance runs.

        @[JSON::Field(key: "AvailabilityZone")]
        getter availability_zone : String?

        # Represents the causes, which provide more information about the current health status.

        @[JSON::Field(key: "Causes")]
        getter causes : Array(String)?

        # Represents the color indicator that gives you information about the health of the EC2 instance. For
        # more information, see Health Colors and Statuses .

        @[JSON::Field(key: "Color")]
        getter color : String?

        # Information about the most recent deployment to an instance.

        @[JSON::Field(key: "Deployment")]
        getter deployment : Types::Deployment?

        # Returns the health status of the specified instance. For more information, see Health Colors and
        # Statuses .

        @[JSON::Field(key: "HealthStatus")]
        getter health_status : String?

        # The ID of the Amazon EC2 instance.

        @[JSON::Field(key: "InstanceId")]
        getter instance_id : String?

        # The instance's type.

        @[JSON::Field(key: "InstanceType")]
        getter instance_type : String?

        # The time at which the EC2 instance was launched.

        @[JSON::Field(key: "LaunchedAt")]
        getter launched_at : Time?

        # Operating system metrics from the instance.

        @[JSON::Field(key: "System")]
        getter system : Types::SystemStatus?

        def initialize(
          @application_metrics : Types::ApplicationMetrics? = nil,
          @availability_zone : String? = nil,
          @causes : Array(String)? = nil,
          @color : String? = nil,
          @deployment : Types::Deployment? = nil,
          @health_status : String? = nil,
          @instance_id : String? = nil,
          @instance_type : String? = nil,
          @launched_at : Time? = nil,
          @system : Types::SystemStatus? = nil
        )
        end
      end

      # Describes the solution stack.

      struct SolutionStackDescription
        include JSON::Serializable

        # The permitted file types allowed for a solution stack.

        @[JSON::Field(key: "PermittedFileTypes")]
        getter permitted_file_types : Array(String)?

        # The name of the solution stack.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        def initialize(
          @permitted_file_types : Array(String)? = nil,
          @solution_stack_name : String? = nil
        )
        end
      end

      # Location of the source code for an application version.

      struct SourceBuildInformation
        include JSON::Serializable

        # The location of the source code, as a formatted string, depending on the value of SourceRepository
        # For CodeCommit , the format is the repository name and commit ID, separated by a forward slash. For
        # example, my-git-repo/265cfa0cf6af46153527f55d6503ec030551f57a . For S3 , the format is the S3 bucket
        # name and object key, separated by a forward slash. For example, my-s3-bucket/Folders/my-source-file
        # .

        @[JSON::Field(key: "SourceLocation")]
        getter source_location : String

        # Location where the repository is stored. CodeCommit S3

        @[JSON::Field(key: "SourceRepository")]
        getter source_repository : String

        # The type of repository. Git Zip

        @[JSON::Field(key: "SourceType")]
        getter source_type : String

        def initialize(
          @source_location : String,
          @source_repository : String,
          @source_type : String
        )
        end
      end

      # Unable to delete the Amazon S3 source bundle associated with the application version. The
      # application version was deleted successfully.

      struct SourceBundleDeletionException
        include JSON::Serializable

        def initialize
        end
      end

      # A specification for an environment configuration.

      struct SourceConfiguration
        include JSON::Serializable

        # The name of the application associated with the configuration.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # The name of the configuration template.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @application_name : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # Represents the percentage of requests over the last 10 seconds that resulted in each type of status
      # code response. For more information, see Status Code Definitions .

      struct StatusCodes
        include JSON::Serializable

        # The percentage of requests over the last 10 seconds that resulted in a 2xx (200, 201, etc.) status
        # code.

        @[JSON::Field(key: "Status2xx")]
        getter status2xx : Int32?

        # The percentage of requests over the last 10 seconds that resulted in a 3xx (300, 301, etc.) status
        # code.

        @[JSON::Field(key: "Status3xx")]
        getter status3xx : Int32?

        # The percentage of requests over the last 10 seconds that resulted in a 4xx (400, 401, etc.) status
        # code.

        @[JSON::Field(key: "Status4xx")]
        getter status4xx : Int32?

        # The percentage of requests over the last 10 seconds that resulted in a 5xx (500, 501, etc.) status
        # code.

        @[JSON::Field(key: "Status5xx")]
        getter status5xx : Int32?

        def initialize(
          @status2xx : Int32? = nil,
          @status3xx : Int32? = nil,
          @status4xx : Int32? = nil,
          @status5xx : Int32? = nil
        )
        end
      end

      # Swaps the CNAMEs of two environments.

      struct SwapEnvironmentCNAMEsMessage
        include JSON::Serializable

        # The ID of the destination environment. Condition: You must specify at least the
        # DestinationEnvironmentID or the DestinationEnvironmentName . You may also specify both. You must
        # specify the SourceEnvironmentId with the DestinationEnvironmentId .

        @[JSON::Field(key: "DestinationEnvironmentId")]
        getter destination_environment_id : String?

        # The name of the destination environment. Condition: You must specify at least the
        # DestinationEnvironmentID or the DestinationEnvironmentName . You may also specify both. You must
        # specify the SourceEnvironmentName with the DestinationEnvironmentName .

        @[JSON::Field(key: "DestinationEnvironmentName")]
        getter destination_environment_name : String?

        # The ID of the source environment. Condition: You must specify at least the SourceEnvironmentID or
        # the SourceEnvironmentName . You may also specify both. If you specify the SourceEnvironmentId , you
        # must specify the DestinationEnvironmentId .

        @[JSON::Field(key: "SourceEnvironmentId")]
        getter source_environment_id : String?

        # The name of the source environment. Condition: You must specify at least the SourceEnvironmentID or
        # the SourceEnvironmentName . You may also specify both. If you specify the SourceEnvironmentName ,
        # you must specify the DestinationEnvironmentName .

        @[JSON::Field(key: "SourceEnvironmentName")]
        getter source_environment_name : String?

        def initialize(
          @destination_environment_id : String? = nil,
          @destination_environment_name : String? = nil,
          @source_environment_id : String? = nil,
          @source_environment_name : String? = nil
        )
        end
      end

      # CPU utilization and load average metrics for an Amazon EC2 instance.

      struct SystemStatus
        include JSON::Serializable

        # CPU utilization metrics for the instance.

        @[JSON::Field(key: "CPUUtilization")]
        getter cpu_utilization : Types::CPUUtilization?

        # Load average in the last 1-minute, 5-minute, and 15-minute periods. For more information, see
        # Operating System Metrics .

        @[JSON::Field(key: "LoadAverage")]
        getter load_average : Array(Float64)?

        def initialize(
          @cpu_utilization : Types::CPUUtilization? = nil,
          @load_average : Array(Float64)? = nil
        )
        end
      end

      # Describes a tag applied to a resource in an environment.

      struct Tag
        include JSON::Serializable

        # The key of the tag.

        @[JSON::Field(key: "Key")]
        getter key : String?

        # The value of the tag.

        @[JSON::Field(key: "Value")]
        getter value : String?

        def initialize(
          @key : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Request to terminate an environment.

      struct TerminateEnvironmentMessage
        include JSON::Serializable

        # The ID of the environment to terminate. Condition: You must specify either this or an
        # EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the environment to terminate. Condition: You must specify either this or an
        # EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # Terminates the target environment even if another environment in the same group is dependent on it.

        @[JSON::Field(key: "ForceTerminate")]
        getter force_terminate : Bool?

        # Indicates whether the associated AWS resources should shut down when the environment is terminated:
        # true : The specified environment as well as the associated AWS resources, such as Auto Scaling group
        # and LoadBalancer, are terminated. false : AWS Elastic Beanstalk resource management is removed from
        # the environment, but the AWS resources continue to operate. For more information, see the AWS
        # Elastic Beanstalk User Guide. Default: true Valid Values: true | false

        @[JSON::Field(key: "TerminateResources")]
        getter terminate_resources : Bool?

        def initialize(
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @force_terminate : Bool? = nil,
          @terminate_resources : Bool? = nil
        )
        end
      end

      # The specified account has reached its limit of application versions.

      struct TooManyApplicationVersionsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified account has reached its limit of applications.

      struct TooManyApplicationsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified account has reached its limit of Amazon S3 buckets.

      struct TooManyBucketsException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified account has reached its limit of configuration templates.

      struct TooManyConfigurationTemplatesException
        include JSON::Serializable

        def initialize
        end
      end

      # The specified account has reached its limit of environments.

      struct TooManyEnvironmentsException
        include JSON::Serializable

        def initialize
        end
      end

      # You have exceeded the maximum number of allowed platforms associated with the account.

      struct TooManyPlatformsException
        include JSON::Serializable

        def initialize
        end
      end

      # The number of tags in the resource would exceed the number of tags that each resource can have. To
      # calculate this, the operation considers both the number of tags the resource already has and the
      # tags this operation would add if it succeeded.

      struct TooManyTagsException
        include JSON::Serializable

        def initialize
        end
      end

      # Describes a trigger.

      struct Trigger
        include JSON::Serializable

        # The name of the trigger.

        @[JSON::Field(key: "Name")]
        getter name : String?

        def initialize(
          @name : String? = nil
        )
        end
      end

      # Request to update an application.

      struct UpdateApplicationMessage
        include JSON::Serializable

        # The name of the application to update. If no such application is found, UpdateApplication returns an
        # InvalidParameterValue error.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # A new description for the application. Default: If not specified, AWS Elastic Beanstalk does not
        # update the description.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @application_name : String,
          @description : String? = nil
        )
        end
      end


      struct UpdateApplicationResourceLifecycleMessage
        include JSON::Serializable

        # The name of the application.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The lifecycle configuration.

        @[JSON::Field(key: "ResourceLifecycleConfig")]
        getter resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig

        def initialize(
          @application_name : String,
          @resource_lifecycle_config : Types::ApplicationResourceLifecycleConfig
        )
        end
      end


      struct UpdateApplicationVersionMessage
        include JSON::Serializable

        # The name of the application associated with this version. If no application is found with this name,
        # UpdateApplication returns an InvalidParameterValue error.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The name of the version to update. If no application version is found with this label,
        # UpdateApplication returns an InvalidParameterValue error.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String

        # A new description for this version.

        @[JSON::Field(key: "Description")]
        getter description : String?

        def initialize(
          @application_name : String,
          @version_label : String,
          @description : String? = nil
        )
        end
      end

      # The result message containing the options for the specified solution stack.

      struct UpdateConfigurationTemplateMessage
        include JSON::Serializable

        # The name of the application associated with the configuration template to update. If no application
        # is found with this name, UpdateConfigurationTemplate returns an InvalidParameterValue error.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # The name of the configuration template to update. If no configuration template is found with this
        # name, UpdateConfigurationTemplate returns an InvalidParameterValue error.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String

        # A new description for the configuration.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # A list of configuration option settings to update with the new specified option value.

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)?

        # A list of configuration options to remove from the configuration set. Constraint: You can remove
        # only UserDefined configuration options.

        @[JSON::Field(key: "OptionsToRemove")]
        getter options_to_remove : Array(Types::OptionSpecification)?

        def initialize(
          @application_name : String,
          @template_name : String,
          @description : String? = nil,
          @option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
          @options_to_remove : Array(Types::OptionSpecification)? = nil
        )
        end
      end

      # Request to update an environment.

      struct UpdateEnvironmentMessage
        include JSON::Serializable

        # The name of the application with which the environment is associated.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String?

        # If this parameter is specified, AWS Elastic Beanstalk updates the description of this environment.

        @[JSON::Field(key: "Description")]
        getter description : String?

        # The ID of the environment to update. If no environment with this ID exists, AWS Elastic Beanstalk
        # returns an InvalidParameterValue error. Condition: You must specify either this or an
        # EnvironmentName, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentId")]
        getter environment_id : String?

        # The name of the environment to update. If no environment with this name exists, AWS Elastic
        # Beanstalk returns an InvalidParameterValue error. Condition: You must specify either this or an
        # EnvironmentId, or both. If you do not specify either, AWS Elastic Beanstalk returns
        # MissingRequiredParameter error.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The name of the group to which the target environment belongs. Specify a group name only if the
        # environment's name is specified in an environment manifest and not with the environment name or
        # environment ID parameters. See Environment Manifest (env.yaml) for details.

        @[JSON::Field(key: "GroupName")]
        getter group_name : String?

        # If specified, AWS Elastic Beanstalk updates the configuration set associated with the running
        # environment and sets the specified configuration options to the requested value.

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)?

        # A list of custom user-defined configuration options to remove from the configuration set for this
        # environment.

        @[JSON::Field(key: "OptionsToRemove")]
        getter options_to_remove : Array(Types::OptionSpecification)?

        # The ARN of the platform, if used.

        @[JSON::Field(key: "PlatformArn")]
        getter platform_arn : String?

        # This specifies the platform version that the environment will run after the environment is updated.

        @[JSON::Field(key: "SolutionStackName")]
        getter solution_stack_name : String?

        # If this parameter is specified, AWS Elastic Beanstalk deploys this configuration template to the
        # environment. If no such configuration template is found, AWS Elastic Beanstalk returns an
        # InvalidParameterValue error.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        # This specifies the tier to use to update the environment. Condition: At this time, if you change the
        # tier version, name, or type, AWS Elastic Beanstalk returns InvalidParameterValue error.

        @[JSON::Field(key: "Tier")]
        getter tier : Types::EnvironmentTier?

        # If this parameter is specified, AWS Elastic Beanstalk deploys the named application version to the
        # environment. If no such application version is found, returns an InvalidParameterValue error.

        @[JSON::Field(key: "VersionLabel")]
        getter version_label : String?

        def initialize(
          @application_name : String? = nil,
          @description : String? = nil,
          @environment_id : String? = nil,
          @environment_name : String? = nil,
          @group_name : String? = nil,
          @option_settings : Array(Types::ConfigurationOptionSetting)? = nil,
          @options_to_remove : Array(Types::OptionSpecification)? = nil,
          @platform_arn : String? = nil,
          @solution_stack_name : String? = nil,
          @template_name : String? = nil,
          @tier : Types::EnvironmentTier? = nil,
          @version_label : String? = nil
        )
        end
      end


      struct UpdateTagsForResourceMessage
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resouce to be updated. Must be the ARN of an Elastic Beanstalk
        # resource.

        @[JSON::Field(key: "ResourceArn")]
        getter resource_arn : String

        # A list of tags to add or update. If a key of an existing tag is added, the tag's value is updated.
        # Specify at least one of these parameters: TagsToAdd , TagsToRemove .

        @[JSON::Field(key: "TagsToAdd")]
        getter tags_to_add : Array(Types::Tag)?

        # A list of tag keys to remove. If a tag key doesn't exist, it is silently ignored. Specify at least
        # one of these parameters: TagsToAdd , TagsToRemove .

        @[JSON::Field(key: "TagsToRemove")]
        getter tags_to_remove : Array(String)?

        def initialize(
          @resource_arn : String,
          @tags_to_add : Array(Types::Tag)? = nil,
          @tags_to_remove : Array(String)? = nil
        )
        end
      end

      # A list of validation messages for a specified configuration template.

      struct ValidateConfigurationSettingsMessage
        include JSON::Serializable

        # The name of the application that the configuration template or environment belongs to.

        @[JSON::Field(key: "ApplicationName")]
        getter application_name : String

        # A list of the options and desired values to evaluate.

        @[JSON::Field(key: "OptionSettings")]
        getter option_settings : Array(Types::ConfigurationOptionSetting)

        # The name of the environment to validate the settings against. Condition: You cannot specify both
        # this and a configuration template name.

        @[JSON::Field(key: "EnvironmentName")]
        getter environment_name : String?

        # The name of the configuration template to validate the settings against. Condition: You cannot
        # specify both this and an environment name.

        @[JSON::Field(key: "TemplateName")]
        getter template_name : String?

        def initialize(
          @application_name : String,
          @option_settings : Array(Types::ConfigurationOptionSetting),
          @environment_name : String? = nil,
          @template_name : String? = nil
        )
        end
      end

      # An error or warning for a desired configuration option value.

      struct ValidationMessage
        include JSON::Serializable

        # A message describing the error or warning.

        @[JSON::Field(key: "Message")]
        getter message : String?

        # The namespace to which the option belongs.

        @[JSON::Field(key: "Namespace")]
        getter namespace : String?

        # The name of the option.

        @[JSON::Field(key: "OptionName")]
        getter option_name : String?

        # An indication of the severity of this message: error : This message indicates that this is not a
        # valid setting for an option. warning : This message is providing information you should take into
        # account.

        @[JSON::Field(key: "Severity")]
        getter severity : String?

        def initialize(
          @message : String? = nil,
          @namespace : String? = nil,
          @option_name : String? = nil,
          @severity : String? = nil
        )
        end
      end
    end
  end
end
