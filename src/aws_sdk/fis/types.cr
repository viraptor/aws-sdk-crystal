require "json"
require "time"

module AwsSdk
  module Fis
    module Types

      # Describes an action. For more information, see FIS actions in the Fault Injection Service User Guide
      # .
      struct Action
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the action.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The description for the action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the action.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The action parameters, if applicable.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::ActionParameter)?

        # The tags for the action.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The supported targets for the action.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, Types::ActionTarget)?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @parameters : Hash(String, Types::ActionParameter)? = nil,
          @tags : Hash(String, String)? = nil,
          @targets : Hash(String, Types::ActionTarget)? = nil
        )
        end
      end

      # Describes a parameter for an action.
      struct ActionParameter
        include JSON::Serializable

        # The parameter description.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the parameter is required.
        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @description : String? = nil,
          @required : Bool? = nil
        )
        end
      end

      # Provides a summary of an action.
      struct ActionSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the action.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The description for the action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the action.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The tags for the action.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The targets for the action.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, Types::ActionTarget)?

        def initialize(
          @arn : String? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @tags : Hash(String, String)? = nil,
          @targets : Hash(String, Types::ActionTarget)? = nil
        )
        end
      end

      # Describes a target for an action.
      struct ActionTarget
        include JSON::Serializable

        # The resource type of the target.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @resource_type : String? = nil
        )
        end
      end

      # The request could not be processed because of a conflict.
      struct ConflictException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies an action for an experiment template. For more information, see Actions in the Fault
      # Injection Service User Guide .
      struct CreateExperimentTemplateActionInput
        include JSON::Serializable

        # The ID of the action. The format of the action ID is: aws: service-name : action-type .
        @[JSON::Field(key: "actionId")]
        getter action_id : String

        # A description for the action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The parameters for the action, if applicable.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The name of the action that must be completed before the current action starts. Omit this parameter
        # to run the action at the start of the experiment.
        @[JSON::Field(key: "startAfter")]
        getter start_after : Array(String)?

        # The targets for the action.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, String)?

        def initialize(
          @action_id : String,
          @description : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @start_after : Array(String)? = nil,
          @targets : Hash(String, String)? = nil
        )
        end
      end

      # Specifies experiment options for an experiment template.
      struct CreateExperimentTemplateExperimentOptionsInput
        include JSON::Serializable

        # Specifies the account targeting setting for experiment options.
        @[JSON::Field(key: "accountTargeting")]
        getter account_targeting : String?

        # Specifies the empty target resolution mode for experiment options.
        @[JSON::Field(key: "emptyTargetResolutionMode")]
        getter empty_target_resolution_mode : String?

        def initialize(
          @account_targeting : String? = nil,
          @empty_target_resolution_mode : String? = nil
        )
        end
      end

      # Specifies the configuration for experiment logging.
      struct CreateExperimentTemplateLogConfigurationInput
        include JSON::Serializable

        # The schema version.
        @[JSON::Field(key: "logSchemaVersion")]
        getter log_schema_version : Int32

        # The configuration for experiment logging to Amazon CloudWatch Logs.
        @[JSON::Field(key: "cloudWatchLogsConfiguration")]
        getter cloud_watch_logs_configuration : Types::ExperimentTemplateCloudWatchLogsLogConfigurationInput?

        # The configuration for experiment logging to Amazon S3.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ExperimentTemplateS3LogConfigurationInput?

        def initialize(
          @log_schema_version : Int32,
          @cloud_watch_logs_configuration : Types::ExperimentTemplateCloudWatchLogsLogConfigurationInput? = nil,
          @s3_configuration : Types::ExperimentTemplateS3LogConfigurationInput? = nil
        )
        end
      end

      # Specifies the configuration for experiment reports.
      struct CreateExperimentTemplateReportConfigurationInput
        include JSON::Serializable

        # The data sources for the experiment report.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::ExperimentTemplateReportConfigurationDataSourcesInput?

        # The output destinations of the experiment report.
        @[JSON::Field(key: "outputs")]
        getter outputs : Types::ExperimentTemplateReportConfigurationOutputsInput?

        # The duration after the experiment end time for the data sources to include in the report.
        @[JSON::Field(key: "postExperimentDuration")]
        getter post_experiment_duration : String?

        # The duration before the experiment start time for the data sources to include in the report.
        @[JSON::Field(key: "preExperimentDuration")]
        getter pre_experiment_duration : String?

        def initialize(
          @data_sources : Types::ExperimentTemplateReportConfigurationDataSourcesInput? = nil,
          @outputs : Types::ExperimentTemplateReportConfigurationOutputsInput? = nil,
          @post_experiment_duration : String? = nil,
          @pre_experiment_duration : String? = nil
        )
        end
      end

      struct CreateExperimentTemplateRequest
        include JSON::Serializable

        # The actions for the experiment.
        @[JSON::Field(key: "actions")]
        getter actions : Hash(String, Types::CreateExperimentTemplateActionInput)

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # A description for the experiment template.
        @[JSON::Field(key: "description")]
        getter description : String

        # The Amazon Resource Name (ARN) of an IAM role that grants the FIS service permission to perform
        # service actions on your behalf.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The stop conditions.
        @[JSON::Field(key: "stopConditions")]
        getter stop_conditions : Array(Types::CreateExperimentTemplateStopConditionInput)

        # The experiment options for the experiment template.
        @[JSON::Field(key: "experimentOptions")]
        getter experiment_options : Types::CreateExperimentTemplateExperimentOptionsInput?

        # The experiment report configuration for the experiment template.
        @[JSON::Field(key: "experimentReportConfiguration")]
        getter experiment_report_configuration : Types::CreateExperimentTemplateReportConfigurationInput?

        # The configuration for experiment logging.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::CreateExperimentTemplateLogConfigurationInput?

        # The tags to apply to the experiment template.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The targets for the experiment.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, Types::CreateExperimentTemplateTargetInput)?

        def initialize(
          @actions : Hash(String, Types::CreateExperimentTemplateActionInput),
          @client_token : String,
          @description : String,
          @role_arn : String,
          @stop_conditions : Array(Types::CreateExperimentTemplateStopConditionInput),
          @experiment_options : Types::CreateExperimentTemplateExperimentOptionsInput? = nil,
          @experiment_report_configuration : Types::CreateExperimentTemplateReportConfigurationInput? = nil,
          @log_configuration : Types::CreateExperimentTemplateLogConfigurationInput? = nil,
          @tags : Hash(String, String)? = nil,
          @targets : Hash(String, Types::CreateExperimentTemplateTargetInput)? = nil
        )
        end
      end

      struct CreateExperimentTemplateResponse
        include JSON::Serializable

        # Information about the experiment template.
        @[JSON::Field(key: "experimentTemplate")]
        getter experiment_template : Types::ExperimentTemplate?

        def initialize(
          @experiment_template : Types::ExperimentTemplate? = nil
        )
        end
      end

      # Specifies a stop condition for an experiment template.
      struct CreateExperimentTemplateStopConditionInput
        include JSON::Serializable

        # The source for the stop condition. Specify aws:cloudwatch:alarm if the stop condition is defined by
        # a CloudWatch alarm. Specify none if there is no stop condition.
        @[JSON::Field(key: "source")]
        getter source : String

        # The Amazon Resource Name (ARN) of the CloudWatch alarm. This is required if the source is a
        # CloudWatch alarm.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @source : String,
          @value : String? = nil
        )
        end
      end

      # Specifies a target for an experiment. You must specify at least one Amazon Resource Name (ARN) or at
      # least one resource tag. You cannot specify both ARNs and tags. For more information, see Targets in
      # the Fault Injection Service User Guide .
      struct CreateExperimentTemplateTargetInput
        include JSON::Serializable

        # The resource type. The resource type must be supported for the specified action.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Scopes the identified resources to a specific count of the resources at random, or a percentage of
        # the resources. All identified resources are included in the target. ALL - Run the action on all
        # identified targets. This is the default. COUNT(n) - Run the action on the specified number of
        # targets, chosen from the identified targets at random. For example, COUNT(1) selects one of the
        # targets. PERCENT(n) - Run the action on the specified percentage of targets, chosen from the
        # identified targets at random. For example, PERCENT(25) selects 25% of the targets.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # The filters to apply to identify target resources using specific attributes.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExperimentTemplateTargetInputFilter)?

        # The resource type parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The Amazon Resource Names (ARNs) of the resources.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # The tags for the target resources.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        def initialize(
          @resource_type : String,
          @selection_mode : String,
          @filters : Array(Types::ExperimentTemplateTargetInputFilter)? = nil,
          @parameters : Hash(String, String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_tags : Hash(String, String)? = nil
        )
        end
      end

      struct CreateTargetAccountConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The experiment template ID.
        @[JSON::Field(key: "id")]
        getter experiment_template_id : String

        # The Amazon Resource Name (ARN) of an IAM role for the target account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String?

        # The description of the target account.
        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @account_id : String,
          @experiment_template_id : String,
          @role_arn : String,
          @client_token : String? = nil,
          @description : String? = nil
        )
        end
      end

      struct CreateTargetAccountConfigurationResponse
        include JSON::Serializable

        # Information about the target account configuration.
        @[JSON::Field(key: "targetAccountConfiguration")]
        getter target_account_configuration : Types::TargetAccountConfiguration?

        def initialize(
          @target_account_configuration : Types::TargetAccountConfiguration? = nil
        )
        end
      end

      struct DeleteExperimentTemplateRequest
        include JSON::Serializable

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct DeleteExperimentTemplateResponse
        include JSON::Serializable

        # Information about the experiment template.
        @[JSON::Field(key: "experimentTemplate")]
        getter experiment_template : Types::ExperimentTemplate?

        def initialize(
          @experiment_template : Types::ExperimentTemplate? = nil
        )
        end
      end

      struct DeleteTargetAccountConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter experiment_template_id : String

        def initialize(
          @account_id : String,
          @experiment_template_id : String
        )
        end
      end

      struct DeleteTargetAccountConfigurationResponse
        include JSON::Serializable

        # Information about the target account configuration.
        @[JSON::Field(key: "targetAccountConfiguration")]
        getter target_account_configuration : Types::TargetAccountConfiguration?

        def initialize(
          @target_account_configuration : Types::TargetAccountConfiguration? = nil
        )
        end
      end

      # Describes an experiment.
      struct Experiment
        include JSON::Serializable

        # The actions for the experiment.
        @[JSON::Field(key: "actions")]
        getter actions : Hash(String, Types::ExperimentAction)?

        # The Amazon Resource Name (ARN) of the experiment.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time that the experiment was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The time that the experiment ended.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The experiment options for the experiment.
        @[JSON::Field(key: "experimentOptions")]
        getter experiment_options : Types::ExperimentOptions?

        # The experiment report for the experiment.
        @[JSON::Field(key: "experimentReport")]
        getter experiment_report : Types::ExperimentReport?

        # The experiment report configuration for the experiment.
        @[JSON::Field(key: "experimentReportConfiguration")]
        getter experiment_report_configuration : Types::ExperimentReportConfiguration?

        # The ID of the experiment template.
        @[JSON::Field(key: "experimentTemplateId")]
        getter experiment_template_id : String?

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The configuration for experiment logging.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::ExperimentLogConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role that grants the FIS service permission to perform
        # service actions on your behalf.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The time that the experiment started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The state of the experiment.
        @[JSON::Field(key: "state")]
        getter state : Types::ExperimentState?

        # The stop conditions for the experiment.
        @[JSON::Field(key: "stopConditions")]
        getter stop_conditions : Array(Types::ExperimentStopCondition)?

        # The tags for the experiment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The count of target account configurations for the experiment.
        @[JSON::Field(key: "targetAccountConfigurationsCount")]
        getter target_account_configurations_count : Int64?

        # The targets for the experiment.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, Types::ExperimentTarget)?

        def initialize(
          @actions : Hash(String, Types::ExperimentAction)? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @end_time : Time? = nil,
          @experiment_options : Types::ExperimentOptions? = nil,
          @experiment_report : Types::ExperimentReport? = nil,
          @experiment_report_configuration : Types::ExperimentReportConfiguration? = nil,
          @experiment_template_id : String? = nil,
          @id : String? = nil,
          @log_configuration : Types::ExperimentLogConfiguration? = nil,
          @role_arn : String? = nil,
          @start_time : Time? = nil,
          @state : Types::ExperimentState? = nil,
          @stop_conditions : Array(Types::ExperimentStopCondition)? = nil,
          @tags : Hash(String, String)? = nil,
          @target_account_configurations_count : Int64? = nil,
          @targets : Hash(String, Types::ExperimentTarget)? = nil
        )
        end
      end

      # Describes the action for an experiment.
      struct ExperimentAction
        include JSON::Serializable

        # The ID of the action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # The description for the action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The time that the action ended.
        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # The parameters for the action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The name of the action that must be completed before this action starts.
        @[JSON::Field(key: "startAfter")]
        getter start_after : Array(String)?

        # The time that the action started.
        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        # The state of the action.
        @[JSON::Field(key: "state")]
        getter state : Types::ExperimentActionState?

        # The targets for the action.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, String)?

        def initialize(
          @action_id : String? = nil,
          @description : String? = nil,
          @end_time : Time? = nil,
          @parameters : Hash(String, String)? = nil,
          @start_after : Array(String)? = nil,
          @start_time : Time? = nil,
          @state : Types::ExperimentActionState? = nil,
          @targets : Hash(String, String)? = nil
        )
        end
      end

      # Describes the state of an action.
      struct ExperimentActionState
        include JSON::Serializable

        # The reason for the state.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The state of the action.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the configuration for experiment logging to Amazon CloudWatch Logs.
      struct ExperimentCloudWatchLogsLogConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination Amazon CloudWatch Logs log group.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @log_group_arn : String? = nil
        )
        end
      end

      # Describes the error when an experiment has failed .
      struct ExperimentError
        include JSON::Serializable

        # The Amazon Web Services Account ID where the experiment failure occurred.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The error code for the failed experiment.
        @[JSON::Field(key: "code")]
        getter code : String?

        # Context for the section of the experiment template that failed.
        @[JSON::Field(key: "location")]
        getter location : String?

        def initialize(
          @account_id : String? = nil,
          @code : String? = nil,
          @location : String? = nil
        )
        end
      end

      # Describes the configuration for experiment logging.
      struct ExperimentLogConfiguration
        include JSON::Serializable

        # The configuration for experiment logging to Amazon CloudWatch Logs.
        @[JSON::Field(key: "cloudWatchLogsConfiguration")]
        getter cloud_watch_logs_configuration : Types::ExperimentCloudWatchLogsLogConfiguration?

        # The schema version.
        @[JSON::Field(key: "logSchemaVersion")]
        getter log_schema_version : Int32?

        # The configuration for experiment logging to Amazon S3.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ExperimentS3LogConfiguration?

        def initialize(
          @cloud_watch_logs_configuration : Types::ExperimentCloudWatchLogsLogConfiguration? = nil,
          @log_schema_version : Int32? = nil,
          @s3_configuration : Types::ExperimentS3LogConfiguration? = nil
        )
        end
      end

      # Describes the options for an experiment.
      struct ExperimentOptions
        include JSON::Serializable

        # The account targeting setting for an experiment.
        @[JSON::Field(key: "accountTargeting")]
        getter account_targeting : String?

        # The actions mode of the experiment that is set from the StartExperiment API command.
        @[JSON::Field(key: "actionsMode")]
        getter actions_mode : String?

        # The empty target resolution mode for an experiment.
        @[JSON::Field(key: "emptyTargetResolutionMode")]
        getter empty_target_resolution_mode : String?

        def initialize(
          @account_targeting : String? = nil,
          @actions_mode : String? = nil,
          @empty_target_resolution_mode : String? = nil
        )
        end
      end

      # Describes the experiment report.
      struct ExperimentReport
        include JSON::Serializable

        # The S3 destination of the experiment report.
        @[JSON::Field(key: "s3Reports")]
        getter s3_reports : Array(Types::ExperimentReportS3Report)?

        # The state of the experiment report.
        @[JSON::Field(key: "state")]
        getter state : Types::ExperimentReportState?

        def initialize(
          @s3_reports : Array(Types::ExperimentReportS3Report)? = nil,
          @state : Types::ExperimentReportState? = nil
        )
        end
      end

      # Describes the report configuration for the experiment. For more information, see Experiment report
      # configurations for AWS FIS .
      struct ExperimentReportConfiguration
        include JSON::Serializable

        # The data sources for the experiment report.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::ExperimentReportConfigurationDataSources?

        # The output destinations of the experiment report.
        @[JSON::Field(key: "outputs")]
        getter outputs : Types::ExperimentReportConfigurationOutputs?

        # The duration after the experiment end time for the data sources to include in the report.
        @[JSON::Field(key: "postExperimentDuration")]
        getter post_experiment_duration : String?

        # The duration before the experiment start time for the data sources to include in the report.
        @[JSON::Field(key: "preExperimentDuration")]
        getter pre_experiment_duration : String?

        def initialize(
          @data_sources : Types::ExperimentReportConfigurationDataSources? = nil,
          @outputs : Types::ExperimentReportConfigurationOutputs? = nil,
          @post_experiment_duration : String? = nil,
          @pre_experiment_duration : String? = nil
        )
        end
      end

      # Specifies the CloudWatch dashboard to include in the experiment report. The dashboard widgets will
      # be captured as snapshot graphs within the report.
      struct ExperimentReportConfigurationCloudWatchDashboard
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch dashboard to include in the experiment report.
        @[JSON::Field(key: "dashboardIdentifier")]
        getter dashboard_identifier : String?

        def initialize(
          @dashboard_identifier : String? = nil
        )
        end
      end

      # Describes the data sources for the experiment report.
      struct ExperimentReportConfigurationDataSources
        include JSON::Serializable

        # The CloudWatch dashboards to include as data sources in the experiment report.
        @[JSON::Field(key: "cloudWatchDashboards")]
        getter cloud_watch_dashboards : Array(Types::ExperimentReportConfigurationCloudWatchDashboard)?

        def initialize(
          @cloud_watch_dashboards : Array(Types::ExperimentReportConfigurationCloudWatchDashboard)? = nil
        )
        end
      end

      # Describes the output destinations of the experiment report.
      struct ExperimentReportConfigurationOutputs
        include JSON::Serializable

        # The S3 destination for the experiment report.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ExperimentReportConfigurationOutputsS3Configuration?

        def initialize(
          @s3_configuration : Types::ExperimentReportConfigurationOutputsS3Configuration? = nil
        )
        end
      end

      # Specifies the S3 destination for the experiment report.
      struct ExperimentReportConfigurationOutputsS3Configuration
        include JSON::Serializable

        # The name of the S3 bucket where the experiment report will be stored.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The prefix of the S3 bucket where the experiment report will be stored.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes the error when experiment report generation has failed.
      struct ExperimentReportError
        include JSON::Serializable

        # The error code for the failed experiment report generation.
        @[JSON::Field(key: "code")]
        getter code : String?

        def initialize(
          @code : String? = nil
        )
        end
      end

      # Describes the S3 destination for the report.
      struct ExperimentReportS3Report
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the generated report.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The report type for the experiment report.
        @[JSON::Field(key: "reportType")]
        getter report_type : String?

        def initialize(
          @arn : String? = nil,
          @report_type : String? = nil
        )
        end
      end

      # Describes the state of the experiment report generation.
      struct ExperimentReportState
        include JSON::Serializable

        # The error information of the experiment when the experiment report generation has failed.
        @[JSON::Field(key: "error")]
        getter error : Types::ExperimentReportError?

        # The reason for the state of the experiment report generation.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The state of the experiment report generation.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error : Types::ExperimentReportError? = nil,
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the configuration for experiment logging to Amazon S3.
      struct ExperimentS3LogConfiguration
        include JSON::Serializable

        # The name of the destination bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The bucket prefix.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes the state of an experiment.
      struct ExperimentState
        include JSON::Serializable

        # The error information of the experiment when the action has failed .
        @[JSON::Field(key: "error")]
        getter error : Types::ExperimentError?

        # The reason for the state.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The state of the experiment.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @error : Types::ExperimentError? = nil,
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # Describes the stop condition for an experiment.
      struct ExperimentStopCondition
        include JSON::Serializable

        # The source for the stop condition.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The Amazon Resource Name (ARN) of the CloudWatch alarm, if applicable.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @source : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Provides a summary of an experiment.
      struct ExperimentSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the experiment.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time that the experiment was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The experiment options for the experiment.
        @[JSON::Field(key: "experimentOptions")]
        getter experiment_options : Types::ExperimentOptions?

        # The ID of the experiment template.
        @[JSON::Field(key: "experimentTemplateId")]
        getter experiment_template_id : String?

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The state of the experiment.
        @[JSON::Field(key: "state")]
        getter state : Types::ExperimentState?

        # The tags for the experiment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @experiment_options : Types::ExperimentOptions? = nil,
          @experiment_template_id : String? = nil,
          @id : String? = nil,
          @state : Types::ExperimentState? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes a target for an experiment.
      struct ExperimentTarget
        include JSON::Serializable

        # The filters to apply to identify target resources using specific attributes.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExperimentTargetFilter)?

        # The resource type parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The Amazon Resource Names (ARNs) of the resources.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # The tags for the target resources.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Scopes the identified resources to a specific count or percentage.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String?

        def initialize(
          @filters : Array(Types::ExperimentTargetFilter)? = nil,
          @parameters : Hash(String, String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @resource_type : String? = nil,
          @selection_mode : String? = nil
        )
        end
      end

      # Describes a target account configuration for an experiment.
      struct ExperimentTargetAccountConfiguration
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The description of the target account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an IAM role for the target account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @account_id : String? = nil,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Provides a summary of a target account configuration.
      struct ExperimentTargetAccountConfigurationSummary
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The description of the target account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an IAM role for the target account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @account_id : String? = nil,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describes a filter used for the target resources in an experiment.
      struct ExperimentTargetFilter
        include JSON::Serializable

        # The attribute path for the filter.
        @[JSON::Field(key: "path")]
        getter path : String?

        # The attribute values for the filter.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @path : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Describes an experiment template.
      struct ExperimentTemplate
        include JSON::Serializable

        # The actions for the experiment.
        @[JSON::Field(key: "actions")]
        getter actions : Hash(String, Types::ExperimentTemplateAction)?

        # The Amazon Resource Name (ARN) of the experiment template.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time the experiment template was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description for the experiment template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The experiment options for an experiment template.
        @[JSON::Field(key: "experimentOptions")]
        getter experiment_options : Types::ExperimentTemplateExperimentOptions?

        # Describes the report configuration for the experiment template.
        @[JSON::Field(key: "experimentReportConfiguration")]
        getter experiment_report_configuration : Types::ExperimentTemplateReportConfiguration?

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The time the experiment template was last updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The configuration for experiment logging.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::ExperimentTemplateLogConfiguration?

        # The Amazon Resource Name (ARN) of an IAM role.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The stop conditions for the experiment.
        @[JSON::Field(key: "stopConditions")]
        getter stop_conditions : Array(Types::ExperimentTemplateStopCondition)?

        # The tags for the experiment template.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The count of target account configurations for the experiment template.
        @[JSON::Field(key: "targetAccountConfigurationsCount")]
        getter target_account_configurations_count : Int64?

        # The targets for the experiment.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, Types::ExperimentTemplateTarget)?

        def initialize(
          @actions : Hash(String, Types::ExperimentTemplateAction)? = nil,
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @experiment_options : Types::ExperimentTemplateExperimentOptions? = nil,
          @experiment_report_configuration : Types::ExperimentTemplateReportConfiguration? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @log_configuration : Types::ExperimentTemplateLogConfiguration? = nil,
          @role_arn : String? = nil,
          @stop_conditions : Array(Types::ExperimentTemplateStopCondition)? = nil,
          @tags : Hash(String, String)? = nil,
          @target_account_configurations_count : Int64? = nil,
          @targets : Hash(String, Types::ExperimentTemplateTarget)? = nil
        )
        end
      end

      # Describes an action for an experiment template.
      struct ExperimentTemplateAction
        include JSON::Serializable

        # The ID of the action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # A description for the action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The parameters for the action.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The name of the action that must be completed before the current action starts.
        @[JSON::Field(key: "startAfter")]
        getter start_after : Array(String)?

        # The targets for the action.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, String)?

        def initialize(
          @action_id : String? = nil,
          @description : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @start_after : Array(String)? = nil,
          @targets : Hash(String, String)? = nil
        )
        end
      end

      # Describes the configuration for experiment logging to Amazon CloudWatch Logs.
      struct ExperimentTemplateCloudWatchLogsLogConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination Amazon CloudWatch Logs log group.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String?

        def initialize(
          @log_group_arn : String? = nil
        )
        end
      end

      # Specifies the configuration for experiment logging to Amazon CloudWatch Logs.
      struct ExperimentTemplateCloudWatchLogsLogConfigurationInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the destination Amazon CloudWatch Logs log group.
        @[JSON::Field(key: "logGroupArn")]
        getter log_group_arn : String

        def initialize(
          @log_group_arn : String
        )
        end
      end

      # Describes the experiment options for an experiment template.
      struct ExperimentTemplateExperimentOptions
        include JSON::Serializable

        # The account targeting setting for an experiment template.
        @[JSON::Field(key: "accountTargeting")]
        getter account_targeting : String?

        # The empty target resolution mode for an experiment template.
        @[JSON::Field(key: "emptyTargetResolutionMode")]
        getter empty_target_resolution_mode : String?

        def initialize(
          @account_targeting : String? = nil,
          @empty_target_resolution_mode : String? = nil
        )
        end
      end

      # Describes the configuration for experiment logging.
      struct ExperimentTemplateLogConfiguration
        include JSON::Serializable

        # The configuration for experiment logging to Amazon CloudWatch Logs.
        @[JSON::Field(key: "cloudWatchLogsConfiguration")]
        getter cloud_watch_logs_configuration : Types::ExperimentTemplateCloudWatchLogsLogConfiguration?

        # The schema version.
        @[JSON::Field(key: "logSchemaVersion")]
        getter log_schema_version : Int32?

        # The configuration for experiment logging to Amazon S3.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ExperimentTemplateS3LogConfiguration?

        def initialize(
          @cloud_watch_logs_configuration : Types::ExperimentTemplateCloudWatchLogsLogConfiguration? = nil,
          @log_schema_version : Int32? = nil,
          @s3_configuration : Types::ExperimentTemplateS3LogConfiguration? = nil
        )
        end
      end

      # Describes the experiment report configuration. For more information, see Experiment report
      # configurations for AWS FIS .
      struct ExperimentTemplateReportConfiguration
        include JSON::Serializable

        # The data sources for the experiment report.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::ExperimentTemplateReportConfigurationDataSources?

        # Describes the output destinations of the experiment report.
        @[JSON::Field(key: "outputs")]
        getter outputs : Types::ExperimentTemplateReportConfigurationOutputs?

        # The duration after the experiment end time for the data sources to include in the report.
        @[JSON::Field(key: "postExperimentDuration")]
        getter post_experiment_duration : String?

        # The duration before the experiment start time for the data sources to include in the report.
        @[JSON::Field(key: "preExperimentDuration")]
        getter pre_experiment_duration : String?

        def initialize(
          @data_sources : Types::ExperimentTemplateReportConfigurationDataSources? = nil,
          @outputs : Types::ExperimentTemplateReportConfigurationOutputs? = nil,
          @post_experiment_duration : String? = nil,
          @pre_experiment_duration : String? = nil
        )
        end
      end

      # The CloudWatch dashboards to include as data sources in the experiment report.
      struct ExperimentTemplateReportConfigurationCloudWatchDashboard
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch dashboard to include in the experiment report.
        @[JSON::Field(key: "dashboardIdentifier")]
        getter dashboard_identifier : String?

        def initialize(
          @dashboard_identifier : String? = nil
        )
        end
      end

      # Describes the data sources for the experiment report.
      struct ExperimentTemplateReportConfigurationDataSources
        include JSON::Serializable

        # The CloudWatch dashboards to include as data sources in the experiment report.
        @[JSON::Field(key: "cloudWatchDashboards")]
        getter cloud_watch_dashboards : Array(Types::ExperimentTemplateReportConfigurationCloudWatchDashboard)?

        def initialize(
          @cloud_watch_dashboards : Array(Types::ExperimentTemplateReportConfigurationCloudWatchDashboard)? = nil
        )
        end
      end

      # Specifies the data sources for the experiment report.
      struct ExperimentTemplateReportConfigurationDataSourcesInput
        include JSON::Serializable

        # The CloudWatch dashboards to include as data sources in the experiment report.
        @[JSON::Field(key: "cloudWatchDashboards")]
        getter cloud_watch_dashboards : Array(Types::ReportConfigurationCloudWatchDashboardInput)?

        def initialize(
          @cloud_watch_dashboards : Array(Types::ReportConfigurationCloudWatchDashboardInput)? = nil
        )
        end
      end

      # The output destinations of the experiment report.
      struct ExperimentTemplateReportConfigurationOutputs
        include JSON::Serializable

        # The S3 destination for the experiment report.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ReportConfigurationS3Output?

        def initialize(
          @s3_configuration : Types::ReportConfigurationS3Output? = nil
        )
        end
      end

      # Specifies the outputs for the experiment templates.
      struct ExperimentTemplateReportConfigurationOutputsInput
        include JSON::Serializable

        # The S3 destination for the experiment report.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ReportConfigurationS3OutputInput?

        def initialize(
          @s3_configuration : Types::ReportConfigurationS3OutputInput? = nil
        )
        end
      end

      # Describes the configuration for experiment logging to Amazon S3.
      struct ExperimentTemplateS3LogConfiguration
        include JSON::Serializable

        # The name of the destination bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The bucket prefix.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Specifies the configuration for experiment logging to Amazon S3.
      struct ExperimentTemplateS3LogConfigurationInput
        include JSON::Serializable

        # The name of the destination bucket.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String

        # The bucket prefix.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String,
          @prefix : String? = nil
        )
        end
      end

      # Describes a stop condition for an experiment template.
      struct ExperimentTemplateStopCondition
        include JSON::Serializable

        # The source for the stop condition.
        @[JSON::Field(key: "source")]
        getter source : String?

        # The Amazon Resource Name (ARN) of the CloudWatch alarm, if applicable.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @source : String? = nil,
          @value : String? = nil
        )
        end
      end

      # Provides a summary of an experiment template.
      struct ExperimentTemplateSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the experiment template.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The time that the experiment template was created.
        @[JSON::Field(key: "creationTime")]
        getter creation_time : Time?

        # The description of the experiment template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The time that the experiment template was last updated.
        @[JSON::Field(key: "lastUpdateTime")]
        getter last_update_time : Time?

        # The tags for the experiment template.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String? = nil,
          @creation_time : Time? = nil,
          @description : String? = nil,
          @id : String? = nil,
          @last_update_time : Time? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Describes a target for an experiment template.
      struct ExperimentTemplateTarget
        include JSON::Serializable

        # The filters to apply to identify target resources using specific attributes.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExperimentTemplateTargetFilter)?

        # The resource type parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The Amazon Resource Names (ARNs) of the targets.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # The tags for the target resources.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Scopes the identified resources to a specific count or percentage.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String?

        def initialize(
          @filters : Array(Types::ExperimentTemplateTargetFilter)? = nil,
          @parameters : Hash(String, String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_tags : Hash(String, String)? = nil,
          @resource_type : String? = nil,
          @selection_mode : String? = nil
        )
        end
      end

      # Describes a filter used for the target resources in an experiment template.
      struct ExperimentTemplateTargetFilter
        include JSON::Serializable

        # The attribute path for the filter.
        @[JSON::Field(key: "path")]
        getter path : String?

        # The attribute values for the filter.
        @[JSON::Field(key: "values")]
        getter values : Array(String)?

        def initialize(
          @path : String? = nil,
          @values : Array(String)? = nil
        )
        end
      end

      # Specifies a filter used for the target resource input in an experiment template. For more
      # information, see Resource filters in the Fault Injection Service User Guide .
      struct ExperimentTemplateTargetInputFilter
        include JSON::Serializable

        # The attribute path for the filter.
        @[JSON::Field(key: "path")]
        getter path : String

        # The attribute values for the filter.
        @[JSON::Field(key: "values")]
        getter values : Array(String)

        def initialize(
          @path : String,
          @values : Array(String)
        )
        end
      end

      struct GetActionRequest
        include JSON::Serializable

        # The ID of the action.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetActionResponse
        include JSON::Serializable

        # Information about the action.
        @[JSON::Field(key: "action")]
        getter action : Types::Action?

        def initialize(
          @action : Types::Action? = nil
        )
        end
      end

      struct GetExperimentRequest
        include JSON::Serializable

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetExperimentResponse
        include JSON::Serializable

        # Information about the experiment.
        @[JSON::Field(key: "experiment")]
        getter experiment : Types::Experiment?

        def initialize(
          @experiment : Types::Experiment? = nil
        )
        end
      end

      struct GetExperimentTargetAccountConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter experiment_id : String

        def initialize(
          @account_id : String,
          @experiment_id : String
        )
        end
      end

      struct GetExperimentTargetAccountConfigurationResponse
        include JSON::Serializable

        # Information about the target account configuration.
        @[JSON::Field(key: "targetAccountConfiguration")]
        getter target_account_configuration : Types::ExperimentTargetAccountConfiguration?

        def initialize(
          @target_account_configuration : Types::ExperimentTargetAccountConfiguration? = nil
        )
        end
      end

      struct GetExperimentTemplateRequest
        include JSON::Serializable

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetExperimentTemplateResponse
        include JSON::Serializable

        # Information about the experiment template.
        @[JSON::Field(key: "experimentTemplate")]
        getter experiment_template : Types::ExperimentTemplate?

        def initialize(
          @experiment_template : Types::ExperimentTemplate? = nil
        )
        end
      end

      struct GetSafetyLeverRequest
        include JSON::Serializable

        # The ID of the safety lever.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct GetSafetyLeverResponse
        include JSON::Serializable

        # Information about the safety lever.
        @[JSON::Field(key: "safetyLever")]
        getter safety_lever : Types::SafetyLever?

        def initialize(
          @safety_lever : Types::SafetyLever? = nil
        )
        end
      end

      struct GetTargetAccountConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter experiment_template_id : String

        def initialize(
          @account_id : String,
          @experiment_template_id : String
        )
        end
      end

      struct GetTargetAccountConfigurationResponse
        include JSON::Serializable

        # Information about the target account configuration.
        @[JSON::Field(key: "targetAccountConfiguration")]
        getter target_account_configuration : Types::TargetAccountConfiguration?

        def initialize(
          @target_account_configuration : Types::TargetAccountConfiguration? = nil
        )
        end
      end

      struct GetTargetResourceTypeRequest
        include JSON::Serializable

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        def initialize(
          @resource_type : String
        )
        end
      end

      struct GetTargetResourceTypeResponse
        include JSON::Serializable

        # Information about the resource type.
        @[JSON::Field(key: "targetResourceType")]
        getter target_resource_type : Types::TargetResourceType?

        def initialize(
          @target_resource_type : Types::TargetResourceType? = nil
        )
        end
      end

      struct ListActionsRequest
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListActionsResponse
        include JSON::Serializable

        # The actions.
        @[JSON::Field(key: "actions")]
        getter actions : Array(Types::ActionSummary)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @actions : Array(Types::ActionSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExperimentResolvedTargetsRequest
        include JSON::Serializable

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter experiment_id : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The name of the target.
        @[JSON::Field(key: "targetName")]
        getter target_name : String?

        def initialize(
          @experiment_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @target_name : String? = nil
        )
        end
      end

      struct ListExperimentResolvedTargetsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The resolved targets.
        @[JSON::Field(key: "resolvedTargets")]
        getter resolved_targets : Array(Types::ResolvedTarget)?

        def initialize(
          @next_token : String? = nil,
          @resolved_targets : Array(Types::ResolvedTarget)? = nil
        )
        end
      end

      struct ListExperimentTargetAccountConfigurationsRequest
        include JSON::Serializable

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter experiment_id : String

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @experiment_id : String,
          @next_token : String? = nil
        )
        end
      end

      struct ListExperimentTargetAccountConfigurationsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The target account configurations.
        @[JSON::Field(key: "targetAccountConfigurations")]
        getter target_account_configurations : Array(Types::ExperimentTargetAccountConfigurationSummary)?

        def initialize(
          @next_token : String? = nil,
          @target_account_configurations : Array(Types::ExperimentTargetAccountConfigurationSummary)? = nil
        )
        end
      end

      struct ListExperimentTemplatesRequest
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExperimentTemplatesResponse
        include JSON::Serializable

        # The experiment templates.
        @[JSON::Field(key: "experimentTemplates")]
        getter experiment_templates : Array(Types::ExperimentTemplateSummary)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @experiment_templates : Array(Types::ExperimentTemplateSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExperimentsRequest
        include JSON::Serializable

        # The ID of the experiment template.
        @[JSON::Field(key: "experimentTemplateId")]
        getter experiment_template_id : String?

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @experiment_template_id : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListExperimentsResponse
        include JSON::Serializable

        # The experiments.
        @[JSON::Field(key: "experiments")]
        getter experiments : Array(Types::ExperimentSummary)?

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @experiments : Array(Types::ExperimentSummary)? = nil,
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
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct ListTargetAccountConfigurationsRequest
        include JSON::Serializable

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter experiment_template_id : String

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @experiment_template_id : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTargetAccountConfigurationsResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The target account configurations.
        @[JSON::Field(key: "targetAccountConfigurations")]
        getter target_account_configurations : Array(Types::TargetAccountConfigurationSummary)?

        def initialize(
          @next_token : String? = nil,
          @target_account_configurations : Array(Types::TargetAccountConfigurationSummary)? = nil
        )
        end
      end

      struct ListTargetResourceTypesRequest
        include JSON::Serializable

        # The maximum number of results to return with a single call. To retrieve the remaining results, make
        # another call with the returned nextToken value.
        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token for the next page of results.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end

      struct ListTargetResourceTypesResponse
        include JSON::Serializable

        # The token to use to retrieve the next page of results. This value is null when there are no more
        # results to return.
        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The target resource types.
        @[JSON::Field(key: "targetResourceTypes")]
        getter target_resource_types : Array(Types::TargetResourceTypeSummary)?

        def initialize(
          @next_token : String? = nil,
          @target_resource_types : Array(Types::TargetResourceTypeSummary)? = nil
        )
        end
      end

      # Specifies the CloudWatch dashboard for the experiment report.
      struct ReportConfigurationCloudWatchDashboardInput
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the CloudWatch dashboard to include in the experiment report.
        @[JSON::Field(key: "dashboardIdentifier")]
        getter dashboard_identifier : String?

        def initialize(
          @dashboard_identifier : String? = nil
        )
        end
      end

      # Describes the S3 destination for the experiment report.
      struct ReportConfigurationS3Output
        include JSON::Serializable

        # The name of the S3 bucket where the experiment report will be stored.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The prefix of the S3 bucket where the experiment report will be stored.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Specifies the S3 destination for the experiment report.
      struct ReportConfigurationS3OutputInput
        include JSON::Serializable

        # The name of the S3 bucket where the experiment report will be stored.
        @[JSON::Field(key: "bucketName")]
        getter bucket_name : String?

        # The prefix of the S3 bucket where the experiment report will be stored.
        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket_name : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # Describes a resolved target.
      struct ResolvedTarget
        include JSON::Serializable

        # The resource type of the target.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # Information about the target.
        @[JSON::Field(key: "targetInformation")]
        getter target_information : Hash(String, String)?

        # The name of the target.
        @[JSON::Field(key: "targetName")]
        getter target_name : String?

        def initialize(
          @resource_type : String? = nil,
          @target_information : Hash(String, String)? = nil,
          @target_name : String? = nil
        )
        end
      end

      # The specified resource cannot be found.
      struct ResourceNotFoundException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Describes a safety lever.
      struct SafetyLever
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the safety lever.
        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The ID of the safety lever.
        @[JSON::Field(key: "id")]
        getter id : String?

        # The state of the safety lever.
        @[JSON::Field(key: "state")]
        getter state : Types::SafetyLeverState?

        def initialize(
          @arn : String? = nil,
          @id : String? = nil,
          @state : Types::SafetyLeverState? = nil
        )
        end
      end

      # Describes the state of the safety lever.
      struct SafetyLeverState
        include JSON::Serializable

        # The reason for the state of the safety lever.
        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The state of the safety lever.
        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @reason : String? = nil,
          @status : String? = nil
        )
        end
      end

      # You have exceeded your service quota.
      struct ServiceQuotaExceededException
        include JSON::Serializable

        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # Specifies experiment options for running an experiment.
      struct StartExperimentExperimentOptionsInput
        include JSON::Serializable

        # Specifies the actions mode for experiment options.
        @[JSON::Field(key: "actionsMode")]
        getter actions_mode : String?

        def initialize(
          @actions_mode : String? = nil
        )
        end
      end

      struct StartExperimentRequest
        include JSON::Serializable

        # Unique, case-sensitive identifier that you provide to ensure the idempotency of the request.
        @[JSON::Field(key: "clientToken")]
        getter client_token : String

        # The ID of the experiment template.
        @[JSON::Field(key: "experimentTemplateId")]
        getter experiment_template_id : String

        # The experiment options for running the experiment.
        @[JSON::Field(key: "experimentOptions")]
        getter experiment_options : Types::StartExperimentExperimentOptionsInput?

        # The tags to apply to the experiment.
        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @client_token : String,
          @experiment_template_id : String,
          @experiment_options : Types::StartExperimentExperimentOptionsInput? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      struct StartExperimentResponse
        include JSON::Serializable

        # Information about the experiment.
        @[JSON::Field(key: "experiment")]
        getter experiment : Types::Experiment?

        def initialize(
          @experiment : Types::Experiment? = nil
        )
        end
      end

      struct StopExperimentRequest
        include JSON::Serializable

        # The ID of the experiment.
        @[JSON::Field(key: "id")]
        getter id : String

        def initialize(
          @id : String
        )
        end
      end

      struct StopExperimentResponse
        include JSON::Serializable

        # Information about the experiment.
        @[JSON::Field(key: "experiment")]
        getter experiment : Types::Experiment?

        def initialize(
          @experiment : Types::Experiment? = nil
        )
        end
      end

      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tags for the resource.
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

      # Describes a target account configuration.
      struct TargetAccountConfiguration
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The description of the target account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an IAM role for the target account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @account_id : String? = nil,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Provides a summary of a target account configuration.
      struct TargetAccountConfigurationSummary
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String?

        # The description of the target account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an IAM role for the target account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @account_id : String? = nil,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      # Describes a resource type.
      struct TargetResourceType
        include JSON::Serializable

        # A description of the resource type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The parameters for the resource type.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, Types::TargetResourceTypeParameter)?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @description : String? = nil,
          @parameters : Hash(String, Types::TargetResourceTypeParameter)? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # Describes the parameters for a resource type. Use parameters to determine which tasks are identified
      # during target resolution.
      struct TargetResourceTypeParameter
        include JSON::Serializable

        # A description of the parameter.
        @[JSON::Field(key: "description")]
        getter description : String?

        # Indicates whether the parameter is required.
        @[JSON::Field(key: "required")]
        getter required : Bool?

        def initialize(
          @description : String? = nil,
          @required : Bool? = nil
        )
        end
      end

      # Describes a resource type.
      struct TargetResourceTypeSummary
        include JSON::Serializable

        # A description of the resource type.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The resource type.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @description : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource.
        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The tag keys to remove.
        @[JSON::Field(key: "tagKeys")]
        getter tag_keys : Array(String)?

        def initialize(
          @resource_arn : String,
          @tag_keys : Array(String)? = nil
        )
        end
      end

      struct UntagResourceResponse
        include JSON::Serializable

        def initialize
        end
      end

      # Specifies an action for an experiment template.
      struct UpdateExperimentTemplateActionInputItem
        include JSON::Serializable

        # The ID of the action.
        @[JSON::Field(key: "actionId")]
        getter action_id : String?

        # A description for the action.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The parameters for the action, if applicable.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The name of the action that must be completed before the current action starts. Omit this parameter
        # to run the action at the start of the experiment.
        @[JSON::Field(key: "startAfter")]
        getter start_after : Array(String)?

        # The targets for the action.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, String)?

        def initialize(
          @action_id : String? = nil,
          @description : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @start_after : Array(String)? = nil,
          @targets : Hash(String, String)? = nil
        )
        end
      end

      # Specifies an experiment option for an experiment template.
      struct UpdateExperimentTemplateExperimentOptionsInput
        include JSON::Serializable

        # The empty target resolution mode of the experiment template.
        @[JSON::Field(key: "emptyTargetResolutionMode")]
        getter empty_target_resolution_mode : String?

        def initialize(
          @empty_target_resolution_mode : String? = nil
        )
        end
      end

      # Specifies the configuration for experiment logging.
      struct UpdateExperimentTemplateLogConfigurationInput
        include JSON::Serializable

        # The configuration for experiment logging to Amazon CloudWatch Logs.
        @[JSON::Field(key: "cloudWatchLogsConfiguration")]
        getter cloud_watch_logs_configuration : Types::ExperimentTemplateCloudWatchLogsLogConfigurationInput?

        # The schema version.
        @[JSON::Field(key: "logSchemaVersion")]
        getter log_schema_version : Int32?

        # The configuration for experiment logging to Amazon S3.
        @[JSON::Field(key: "s3Configuration")]
        getter s3_configuration : Types::ExperimentTemplateS3LogConfigurationInput?

        def initialize(
          @cloud_watch_logs_configuration : Types::ExperimentTemplateCloudWatchLogsLogConfigurationInput? = nil,
          @log_schema_version : Int32? = nil,
          @s3_configuration : Types::ExperimentTemplateS3LogConfigurationInput? = nil
        )
        end
      end

      # Specifies the input for the experiment report configuration.
      struct UpdateExperimentTemplateReportConfigurationInput
        include JSON::Serializable

        # The data sources for the experiment report.
        @[JSON::Field(key: "dataSources")]
        getter data_sources : Types::ExperimentTemplateReportConfigurationDataSourcesInput?

        # Describes the output destinations of the experiment report.
        @[JSON::Field(key: "outputs")]
        getter outputs : Types::ExperimentTemplateReportConfigurationOutputsInput?

        # The duration after the experiment end time for the data sources to include in the report.
        @[JSON::Field(key: "postExperimentDuration")]
        getter post_experiment_duration : String?

        # The duration before the experiment start time for the data sources to include in the report.
        @[JSON::Field(key: "preExperimentDuration")]
        getter pre_experiment_duration : String?

        def initialize(
          @data_sources : Types::ExperimentTemplateReportConfigurationDataSourcesInput? = nil,
          @outputs : Types::ExperimentTemplateReportConfigurationOutputsInput? = nil,
          @post_experiment_duration : String? = nil,
          @pre_experiment_duration : String? = nil
        )
        end
      end

      struct UpdateExperimentTemplateRequest
        include JSON::Serializable

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter id : String

        # The actions for the experiment.
        @[JSON::Field(key: "actions")]
        getter actions : Hash(String, Types::UpdateExperimentTemplateActionInputItem)?

        # A description for the template.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The experiment options for the experiment template.
        @[JSON::Field(key: "experimentOptions")]
        getter experiment_options : Types::UpdateExperimentTemplateExperimentOptionsInput?

        # The experiment report configuration for the experiment template.
        @[JSON::Field(key: "experimentReportConfiguration")]
        getter experiment_report_configuration : Types::UpdateExperimentTemplateReportConfigurationInput?

        # The configuration for experiment logging.
        @[JSON::Field(key: "logConfiguration")]
        getter log_configuration : Types::UpdateExperimentTemplateLogConfigurationInput?

        # The Amazon Resource Name (ARN) of an IAM role that grants the FIS service permission to perform
        # service actions on your behalf.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        # The stop conditions for the experiment.
        @[JSON::Field(key: "stopConditions")]
        getter stop_conditions : Array(Types::UpdateExperimentTemplateStopConditionInput)?

        # The targets for the experiment.
        @[JSON::Field(key: "targets")]
        getter targets : Hash(String, Types::UpdateExperimentTemplateTargetInput)?

        def initialize(
          @id : String,
          @actions : Hash(String, Types::UpdateExperimentTemplateActionInputItem)? = nil,
          @description : String? = nil,
          @experiment_options : Types::UpdateExperimentTemplateExperimentOptionsInput? = nil,
          @experiment_report_configuration : Types::UpdateExperimentTemplateReportConfigurationInput? = nil,
          @log_configuration : Types::UpdateExperimentTemplateLogConfigurationInput? = nil,
          @role_arn : String? = nil,
          @stop_conditions : Array(Types::UpdateExperimentTemplateStopConditionInput)? = nil,
          @targets : Hash(String, Types::UpdateExperimentTemplateTargetInput)? = nil
        )
        end
      end

      struct UpdateExperimentTemplateResponse
        include JSON::Serializable

        # Information about the experiment template.
        @[JSON::Field(key: "experimentTemplate")]
        getter experiment_template : Types::ExperimentTemplate?

        def initialize(
          @experiment_template : Types::ExperimentTemplate? = nil
        )
        end
      end

      # Specifies a stop condition for an experiment. You can define a stop condition as a CloudWatch alarm.
      struct UpdateExperimentTemplateStopConditionInput
        include JSON::Serializable

        # The source for the stop condition. Specify aws:cloudwatch:alarm if the stop condition is defined by
        # a CloudWatch alarm. Specify none if there is no stop condition.
        @[JSON::Field(key: "source")]
        getter source : String

        # The Amazon Resource Name (ARN) of the CloudWatch alarm.
        @[JSON::Field(key: "value")]
        getter value : String?

        def initialize(
          @source : String,
          @value : String? = nil
        )
        end
      end

      # Specifies a target for an experiment. You must specify at least one Amazon Resource Name (ARN) or at
      # least one resource tag. You cannot specify both.
      struct UpdateExperimentTemplateTargetInput
        include JSON::Serializable

        # The resource type. The resource type must be supported for the specified action.
        @[JSON::Field(key: "resourceType")]
        getter resource_type : String

        # Scopes the identified resources to a specific count or percentage.
        @[JSON::Field(key: "selectionMode")]
        getter selection_mode : String

        # The filters to apply to identify target resources using specific attributes.
        @[JSON::Field(key: "filters")]
        getter filters : Array(Types::ExperimentTemplateTargetInputFilter)?

        # The resource type parameters.
        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The Amazon Resource Names (ARNs) of the targets.
        @[JSON::Field(key: "resourceArns")]
        getter resource_arns : Array(String)?

        # The tags for the target resources.
        @[JSON::Field(key: "resourceTags")]
        getter resource_tags : Hash(String, String)?

        def initialize(
          @resource_type : String,
          @selection_mode : String,
          @filters : Array(Types::ExperimentTemplateTargetInputFilter)? = nil,
          @parameters : Hash(String, String)? = nil,
          @resource_arns : Array(String)? = nil,
          @resource_tags : Hash(String, String)? = nil
        )
        end
      end

      # Specifies a state for a safety lever.
      struct UpdateSafetyLeverStateInput
        include JSON::Serializable

        # The reason for updating the state of the safety lever.
        @[JSON::Field(key: "reason")]
        getter reason : String

        # The updated state of the safety lever.
        @[JSON::Field(key: "status")]
        getter status : String

        def initialize(
          @reason : String,
          @status : String
        )
        end
      end

      struct UpdateSafetyLeverStateRequest
        include JSON::Serializable

        # The ID of the safety lever.
        @[JSON::Field(key: "id")]
        getter id : String

        # The state of the safety lever.
        @[JSON::Field(key: "state")]
        getter state : Types::UpdateSafetyLeverStateInput

        def initialize(
          @id : String,
          @state : Types::UpdateSafetyLeverStateInput
        )
        end
      end

      struct UpdateSafetyLeverStateResponse
        include JSON::Serializable

        # Information about the safety lever.
        @[JSON::Field(key: "safetyLever")]
        getter safety_lever : Types::SafetyLever?

        def initialize(
          @safety_lever : Types::SafetyLever? = nil
        )
        end
      end

      struct UpdateTargetAccountConfigurationRequest
        include JSON::Serializable

        # The Amazon Web Services account ID of the target account.
        @[JSON::Field(key: "accountId")]
        getter account_id : String

        # The ID of the experiment template.
        @[JSON::Field(key: "id")]
        getter experiment_template_id : String

        # The description of the target account.
        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of an IAM role for the target account.
        @[JSON::Field(key: "roleArn")]
        getter role_arn : String?

        def initialize(
          @account_id : String,
          @experiment_template_id : String,
          @description : String? = nil,
          @role_arn : String? = nil
        )
        end
      end

      struct UpdateTargetAccountConfigurationResponse
        include JSON::Serializable

        # Information about the target account configuration.
        @[JSON::Field(key: "targetAccountConfiguration")]
        getter target_account_configuration : Types::TargetAccountConfiguration?

        def initialize(
          @target_account_configuration : Types::TargetAccountConfiguration? = nil
        )
        end
      end

      # The specified input is not valid, or fails to satisfy the constraints for the request.
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
