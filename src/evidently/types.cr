require "json"
require "time"

module Aws
  module Evidently
    module Types

      # You do not have sufficient permissions to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct BatchEvaluateFeatureRequest
        include JSON::Serializable

        # The name or ARN of the project that contains the feature being evaluated.

        @[JSON::Field(key: "project")]
        getter project : String

        # An array of structures, where each structure assigns a feature variation to one user session.

        @[JSON::Field(key: "requests")]
        getter requests : Array(Types::EvaluationRequest)

        def initialize(
          @project : String,
          @requests : Array(Types::EvaluationRequest)
        )
        end
      end


      struct BatchEvaluateFeatureResponse
        include JSON::Serializable

        # An array of structures, where each structure displays the results of one feature evaluation
        # assignment to one user session.

        @[JSON::Field(key: "results")]
        getter results : Array(Types::EvaluationResult)?

        def initialize(
          @results : Array(Types::EvaluationResult)? = nil
        )
        end
      end

      # A structure containing the CloudWatch Logs log group where the project stores evaluation events.

      struct CloudWatchLogsDestination
        include JSON::Serializable

        # The name of the log group where the project stores evaluation events.

        @[JSON::Field(key: "logGroup")]
        getter log_group : String?

        def initialize(
          @log_group : String? = nil
        )
        end
      end

      # A structure containing the CloudWatch Logs log group where the project stores evaluation events.

      struct CloudWatchLogsDestinationConfig
        include JSON::Serializable

        # The name of the log group where the project stores evaluation events.

        @[JSON::Field(key: "logGroup")]
        getter log_group : String?

        def initialize(
          @log_group : String? = nil
        )
        end
      end

      # A resource was in an inconsistent state during an update or a deletion.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the resource that caused the exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end


      struct CreateExperimentRequest
        include JSON::Serializable

        # An array of structures that defines the metrics used for the experiment, and whether a higher or
        # lower value for each metric is the goal.

        @[JSON::Field(key: "metricGoals")]
        getter metric_goals : Array(Types::MetricGoalConfig)

        # A name for the new experiment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name or ARN of the project that you want to create the new experiment in.

        @[JSON::Field(key: "project")]
        getter project : String

        # An array of structures that describe the configuration of each feature variation used in the
        # experiment.

        @[JSON::Field(key: "treatments")]
        getter treatments : Array(Types::TreatmentConfig)

        # An optional description of the experiment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A structure that contains the configuration of which variation to use as the "control" version. tThe
        # "control" version is used for comparison with other variations. This structure also specifies how
        # much experiment traffic is allocated to each variation.

        @[JSON::Field(key: "onlineAbConfig")]
        getter online_ab_config : Types::OnlineAbConfig?

        # When Evidently assigns a particular user session to an experiment, it must use a randomization ID to
        # determine which variation the user session is served. This randomization ID is a combination of the
        # entity ID and randomizationSalt . If you omit randomizationSalt , Evidently uses the experiment name
        # as the randomizationSalt .

        @[JSON::Field(key: "randomizationSalt")]
        getter randomization_salt : String?

        # The portion of the available audience that you want to allocate to this experiment, in thousandths
        # of a percent. The available audience is the total audience minus the audience that you have
        # allocated to overrides or current launches of this feature. This is represented in thousandths of a
        # percent. For example, specify 10,000 to allocate 10% of the available audience.

        @[JSON::Field(key: "samplingRate")]
        getter sampling_rate : Int64?

        # Specifies an audience segment to use in the experiment. When a segment is used in an experiment,
        # only user sessions that match the segment pattern are used in the experiment.

        @[JSON::Field(key: "segment")]
        getter segment : String?

        # Assigns one or more tags (key-value pairs) to the experiment. Tags can help you organize and
        # categorize your resources. You can also use them to scope user permissions by granting a user
        # permission to access or change only resources with certain tag values. Tags don't have any semantic
        # meaning to Amazon Web Services and are interpreted strictly as strings of characters. You can
        # associate as many as 50 tags with an experiment. For more information, see Tagging Amazon Web
        # Services resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @metric_goals : Array(Types::MetricGoalConfig),
          @name : String,
          @project : String,
          @treatments : Array(Types::TreatmentConfig),
          @description : String? = nil,
          @online_ab_config : Types::OnlineAbConfig? = nil,
          @randomization_salt : String? = nil,
          @sampling_rate : Int64? = nil,
          @segment : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateExperimentResponse
        include JSON::Serializable

        # A structure containing the configuration details of the experiment that you created.

        @[JSON::Field(key: "experiment")]
        getter experiment : Types::Experiment

        def initialize(
          @experiment : Types::Experiment
        )
        end
      end


      struct CreateFeatureRequest
        include JSON::Serializable

        # The name for the new feature.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name or ARN of the project that is to contain the new feature.

        @[JSON::Field(key: "project")]
        getter project : String

        # An array of structures that contain the configuration of the feature's different variations.

        @[JSON::Field(key: "variations")]
        getter variations : Array(Types::VariationConfig)

        # The name of the variation to use as the default variation. The default variation is served to users
        # who are not allocated to any ongoing launches or experiments of this feature. This variation must
        # also be listed in the variations structure. If you omit defaultVariation , the first variation
        # listed in the variations structure is used as the default variation.

        @[JSON::Field(key: "defaultVariation")]
        getter default_variation : String?

        # An optional description of the feature.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specify users that should always be served a specific variation of a feature. Each user is specified
        # by a key-value pair . For each key, specify a user by entering their user ID, account ID, or some
        # other identifier. For the value, specify the name of the variation that they are to be served. This
        # parameter is limited to 2500 overrides or a total of 40KB. The 40KB limit includes an overhead of 6
        # bytes per override.

        @[JSON::Field(key: "entityOverrides")]
        getter entity_overrides : Hash(String, String)?

        # Specify ALL_RULES to activate the traffic allocation specified by any ongoing launches or
        # experiments. Specify DEFAULT_VARIATION to serve the default variation to all users instead.

        @[JSON::Field(key: "evaluationStrategy")]
        getter evaluation_strategy : String?

        # Assigns one or more tags (key-value pairs) to the feature. Tags can help you organize and categorize
        # your resources. You can also use them to scope user permissions by granting a user permission to
        # access or change only resources with certain tag values. Tags don't have any semantic meaning to
        # Amazon Web Services and are interpreted strictly as strings of characters. You can associate as many
        # as 50 tags with a feature. For more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @project : String,
          @variations : Array(Types::VariationConfig),
          @default_variation : String? = nil,
          @description : String? = nil,
          @entity_overrides : Hash(String, String)? = nil,
          @evaluation_strategy : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateFeatureResponse
        include JSON::Serializable

        # A structure that contains information about the new feature.

        @[JSON::Field(key: "feature")]
        getter feature : Types::Feature?

        def initialize(
          @feature : Types::Feature? = nil
        )
        end
      end


      struct CreateLaunchRequest
        include JSON::Serializable

        # An array of structures that contains the feature and variations that are to be used for the launch.

        @[JSON::Field(key: "groups")]
        getter groups : Array(Types::LaunchGroupConfig)

        # The name for the new launch.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name or ARN of the project that you want to create the launch in.

        @[JSON::Field(key: "project")]
        getter project : String

        # An optional description for the launch.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An array of structures that define the metrics that will be used to monitor the launch performance.

        @[JSON::Field(key: "metricMonitors")]
        getter metric_monitors : Array(Types::MetricMonitorConfig)?

        # When Evidently assigns a particular user session to a launch, it must use a randomization ID to
        # determine which variation the user session is served. This randomization ID is a combination of the
        # entity ID and randomizationSalt . If you omit randomizationSalt , Evidently uses the launch name as
        # the randomizationSalt .

        @[JSON::Field(key: "randomizationSalt")]
        getter randomization_salt : String?

        # An array of structures that define the traffic allocation percentages among the feature variations
        # during each step of the launch.

        @[JSON::Field(key: "scheduledSplitsConfig")]
        getter scheduled_splits_config : Types::ScheduledSplitsLaunchConfig?

        # Assigns one or more tags (key-value pairs) to the launch. Tags can help you organize and categorize
        # your resources. You can also use them to scope user permissions by granting a user permission to
        # access or change only resources with certain tag values. Tags don't have any semantic meaning to
        # Amazon Web Services and are interpreted strictly as strings of characters. You can associate as many
        # as 50 tags with a launch. For more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @groups : Array(Types::LaunchGroupConfig),
          @name : String,
          @project : String,
          @description : String? = nil,
          @metric_monitors : Array(Types::MetricMonitorConfig)? = nil,
          @randomization_salt : String? = nil,
          @scheduled_splits_config : Types::ScheduledSplitsLaunchConfig? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateLaunchResponse
        include JSON::Serializable

        # A structure that contains the configuration of the launch that was created.

        @[JSON::Field(key: "launch")]
        getter launch : Types::Launch

        def initialize(
          @launch : Types::Launch
        )
        end
      end


      struct CreateProjectRequest
        include JSON::Serializable

        # The name for the project.

        @[JSON::Field(key: "name")]
        getter name : String

        # Use this parameter if the project will use client-side evaluation powered by AppConfig . Client-side
        # evaluation allows your application to assign variations to user sessions locally instead of by
        # calling the EvaluateFeature operation. This mitigates the latency and availability risks that come
        # with an API call. For more information, see Client-side evaluation - powered by AppConfig. This
        # parameter is a structure that contains information about the AppConfig application and environment
        # that will be used as for client-side evaluation. To create a project that uses client-side
        # evaluation, you must have the evidently:ExportProjectAsConfiguration permission.

        @[JSON::Field(key: "appConfigResource")]
        getter app_config_resource : Types::ProjectAppConfigResourceConfig?

        # A structure that contains information about where Evidently is to store evaluation events for longer
        # term storage, if you choose to do so. If you choose not to store these events, Evidently deletes
        # them after using them to produce metrics and other experiment results that you can view.

        @[JSON::Field(key: "dataDelivery")]
        getter data_delivery : Types::ProjectDataDeliveryConfig?

        # An optional description of the project.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Assigns one or more tags (key-value pairs) to the project. Tags can help you organize and categorize
        # your resources. You can also use them to scope user permissions by granting a user permission to
        # access or change only resources with certain tag values. Tags don't have any semantic meaning to
        # Amazon Web Services and are interpreted strictly as strings of characters. You can associate as many
        # as 50 tags with a project. For more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @app_config_resource : Types::ProjectAppConfigResourceConfig? = nil,
          @data_delivery : Types::ProjectDataDeliveryConfig? = nil,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateProjectResponse
        include JSON::Serializable

        # A structure that contains information about the created project.

        @[JSON::Field(key: "project")]
        getter project : Types::Project

        def initialize(
          @project : Types::Project
        )
        end
      end


      struct CreateSegmentRequest
        include JSON::Serializable

        # A name for the segment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The pattern to use for the segment. For more information about pattern syntax, see Segment rule
        # pattern syntax .

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # An optional description for this segment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Assigns one or more tags (key-value pairs) to the segment. Tags can help you organize and categorize
        # your resources. You can also use them to scope user permissions by granting a user permission to
        # access or change only resources with certain tag values. Tags don't have any semantic meaning to
        # Amazon Web Services and are interpreted strictly as strings of characters. You can associate as many
        # as 50 tags with a segment. For more information, see Tagging Amazon Web Services resources .

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @pattern : String,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateSegmentResponse
        include JSON::Serializable

        # A structure that contains the complete information about the segment that was just created.

        @[JSON::Field(key: "segment")]
        getter segment : Types::Segment

        def initialize(
          @segment : Types::Segment
        )
        end
      end


      struct DeleteExperimentRequest
        include JSON::Serializable

        # The name of the experiment to delete.

        @[JSON::Field(key: "experiment")]
        getter experiment : String

        # The name or ARN of the project that contains the experiment to delete.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @experiment : String,
          @project : String
        )
        end
      end


      struct DeleteExperimentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteFeatureRequest
        include JSON::Serializable

        # The name of the feature to delete.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # The name or ARN of the project that contains the feature to delete.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @feature : String,
          @project : String
        )
        end
      end


      struct DeleteFeatureResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteLaunchRequest
        include JSON::Serializable

        # The name of the launch to delete.

        @[JSON::Field(key: "launch")]
        getter launch : String

        # The name or ARN of the project that contains the launch to delete.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @launch : String,
          @project : String
        )
        end
      end


      struct DeleteLaunchResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteProjectRequest
        include JSON::Serializable

        # The name or ARN of the project to delete.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @project : String
        )
        end
      end


      struct DeleteProjectResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct DeleteSegmentRequest
        include JSON::Serializable

        # Specifies the segment to delete.

        @[JSON::Field(key: "segment")]
        getter segment : String

        def initialize(
          @segment : String
        )
        end
      end


      struct DeleteSegmentResponse
        include JSON::Serializable

        def initialize
        end
      end


      struct EvaluateFeatureRequest
        include JSON::Serializable

        # An internal ID that represents a unique user of the application. This entityID is checked against
        # any override rules assigned for this feature.

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The name of the feature being evaluated.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # The name or ARN of the project that contains this feature.

        @[JSON::Field(key: "project")]
        getter project : String

        # A JSON object of attributes that you can optionally pass in as part of the evaluation event sent to
        # Evidently from the user session. Evidently can use this value to match user sessions with defined
        # audience segments. For more information, see Use segments to focus your audience . If you include
        # this parameter, the value must be a JSON object. A JSON array is not supported.

        @[JSON::Field(key: "evaluationContext")]
        getter evaluation_context : String?

        def initialize(
          @entity_id : String,
          @feature : String,
          @project : String,
          @evaluation_context : String? = nil
        )
        end
      end


      struct EvaluateFeatureResponse
        include JSON::Serializable

        # If this user was assigned to a launch or experiment, this field lists the launch or experiment name.

        @[JSON::Field(key: "details")]
        getter details : String?

        # Specifies the reason that the user session was assigned this variation. Possible values include
        # DEFAULT , meaning the user was served the default variation; LAUNCH_RULE_MATCH , if the user session
        # was enrolled in a launch; EXPERIMENT_RULE_MATCH , if the user session was enrolled in an experiment;
        # or ENTITY_OVERRIDES_MATCH , if the user's entityId matches an override rule.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The value assigned to this variation to differentiate it from the other variations of this feature.

        @[JSON::Field(key: "value")]
        getter value : Types::VariableValue?

        # The name of the variation that was served to the user session.

        @[JSON::Field(key: "variation")]
        getter variation : String?

        def initialize(
          @details : String? = nil,
          @reason : String? = nil,
          @value : Types::VariableValue? = nil,
          @variation : String? = nil
        )
        end
      end

      # This structure assigns a feature variation to one user session.

      struct EvaluationRequest
        include JSON::Serializable

        # An internal ID that represents a unique user session of the application. This entityID is checked
        # against any override rules assigned for this feature.

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The name of the feature being evaluated.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # A JSON block of attributes that you can optionally pass in. This JSON block is included in the
        # evaluation events sent to Evidently from the user session.

        @[JSON::Field(key: "evaluationContext")]
        getter evaluation_context : String?

        def initialize(
          @entity_id : String,
          @feature : String,
          @evaluation_context : String? = nil
        )
        end
      end

      # This structure displays the results of one feature evaluation assignment to one user session.

      struct EvaluationResult
        include JSON::Serializable

        # An internal ID that represents a unique user session of the application.

        @[JSON::Field(key: "entityId")]
        getter entity_id : String

        # The name of the feature being evaluated.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # If this user was assigned to a launch or experiment, this field lists the launch or experiment name.

        @[JSON::Field(key: "details")]
        getter details : String?

        # The name or ARN of the project that contains the feature being evaluated.

        @[JSON::Field(key: "project")]
        getter project : String?

        # Specifies the reason that the user session was assigned this variation. Possible values include
        # DEFAULT , meaning the user was served the default variation; LAUNCH_RULE_MATCH , if the user session
        # was enrolled in a launch; or EXPERIMENT_RULE_MATCH , if the user session was enrolled in an
        # experiment.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        # The value assigned to this variation to differentiate it from the other variations of this feature.

        @[JSON::Field(key: "value")]
        getter value : Types::VariableValue?

        # The name of the variation that was served to the user session.

        @[JSON::Field(key: "variation")]
        getter variation : String?

        def initialize(
          @entity_id : String,
          @feature : String,
          @details : String? = nil,
          @project : String? = nil,
          @reason : String? = nil,
          @value : Types::VariableValue? = nil,
          @variation : String? = nil
        )
        end
      end

      # A structure that contains the information about an evaluation rule for this feature, if it is used
      # in a launch or experiment.

      struct EvaluationRule
        include JSON::Serializable

        # This value is aws.evidently.splits if this is an evaluation rule for a launch, and it is
        # aws.evidently.onlineab if this is an evaluation rule for an experiment.

        @[JSON::Field(key: "type")]
        getter type : String

        # The name of the experiment or launch.

        @[JSON::Field(key: "name")]
        getter name : String?

        def initialize(
          @type : String,
          @name : String? = nil
        )
        end
      end

      # A structure that contains the information about one evaluation event or custom event sent to
      # Evidently. This is a JSON payload. If this event specifies a pre-defined event type, the payload
      # must follow the defined event schema.

      struct Event
        include JSON::Serializable

        # The event data.

        @[JSON::Field(key: "data")]
        getter data : String

        # The timestamp of the event.

        @[JSON::Field(key: "timestamp")]
        getter timestamp : Time

        # aws.evidently.evaluation specifies an evaluation event, which determines which feature variation
        # that a user sees. aws.evidently.custom specifies a custom event, which generates metrics from user
        # actions such as clicks and checkouts.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @data : String,
          @timestamp : Time,
          @type : String
        )
        end
      end

      # A structure containing the configuration details of an experiment.

      struct Experiment
        include JSON::Serializable

        # The ARN of the experiment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the experiment is first created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The date and time that the experiment was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the experiment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the experiment.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of this experiment. Currently, this value must be aws.experiment.onlineab .

        @[JSON::Field(key: "type")]
        getter type : String

        # A description of the experiment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A structure that contains the date and time that the experiment started and ended.

        @[JSON::Field(key: "execution")]
        getter execution : Types::ExperimentExecution?

        # An array of structures that defines the metrics used for the experiment, and whether a higher or
        # lower value for each metric is the goal.

        @[JSON::Field(key: "metricGoals")]
        getter metric_goals : Array(Types::MetricGoal)?

        # A structure that contains the configuration of which variation to use as the "control" version. The
        # "control" version is used for comparison with other variations. This structure also specifies how
        # much experiment traffic is allocated to each variation.

        @[JSON::Field(key: "onlineAbDefinition")]
        getter online_ab_definition : Types::OnlineAbDefinition?

        # The name or ARN of the project that contains this experiment.

        @[JSON::Field(key: "project")]
        getter project : String?

        # This value is used when Evidently assigns a particular user session to the experiment. It helps
        # create a randomization ID to determine which variation the user session is served. This
        # randomization ID is a combination of the entity ID and randomizationSalt .

        @[JSON::Field(key: "randomizationSalt")]
        getter randomization_salt : String?

        # In thousandths of a percent, the amount of the available audience that is allocated to this
        # experiment. The available audience is the total audience minus the audience that you have allocated
        # to overrides or current launches of this feature. This is represented in thousandths of a percent,
        # so a value of 10,000 is 10% of the available audience.

        @[JSON::Field(key: "samplingRate")]
        getter sampling_rate : Int64?

        # A structure that contains the time and date that Evidently completed the analysis of the experiment.

        @[JSON::Field(key: "schedule")]
        getter schedule : Types::ExperimentSchedule?

        # The audience segment being used for the experiment, if a segment is being used.

        @[JSON::Field(key: "segment")]
        getter segment : String?

        # If the experiment was stopped, this is the string that was entered by the person who stopped the
        # experiment, to explain why it was stopped.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The list of tag keys and values associated with this experiment.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # An array of structures that describe the configuration of each feature variation used in the
        # experiment.

        @[JSON::Field(key: "treatments")]
        getter treatments : Array(Types::Treatment)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @status : String,
          @type : String,
          @description : String? = nil,
          @execution : Types::ExperimentExecution? = nil,
          @metric_goals : Array(Types::MetricGoal)? = nil,
          @online_ab_definition : Types::OnlineAbDefinition? = nil,
          @project : String? = nil,
          @randomization_salt : String? = nil,
          @sampling_rate : Int64? = nil,
          @schedule : Types::ExperimentSchedule? = nil,
          @segment : String? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil,
          @treatments : Array(Types::Treatment)? = nil
        )
        end
      end

      # This structure contains the date and time that the experiment started and ended.

      struct ExperimentExecution
        include JSON::Serializable

        # The date and time that the experiment ended.

        @[JSON::Field(key: "endedTime")]
        getter ended_time : Time?

        # The date and time that the experiment started.

        @[JSON::Field(key: "startedTime")]
        getter started_time : Time?

        def initialize(
          @ended_time : Time? = nil,
          @started_time : Time? = nil
        )
        end
      end

      # A structure that contains results of an experiment.

      struct ExperimentReport
        include JSON::Serializable

        # The content of the report.

        @[JSON::Field(key: "content")]
        getter content : String?

        # The name of the metric that is analyzed in this experiment report.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The type of analysis used for this report.

        @[JSON::Field(key: "reportName")]
        getter report_name : String?

        # The name of the variation that this report pertains to.

        @[JSON::Field(key: "treatmentName")]
        getter treatment_name : String?

        def initialize(
          @content : String? = nil,
          @metric_name : String? = nil,
          @report_name : String? = nil,
          @treatment_name : String? = nil
        )
        end
      end

      # A structure that contains experiment results for one metric that is monitored in the experiment.

      struct ExperimentResultsData
        include JSON::Serializable

        # The name of the metric.

        @[JSON::Field(key: "metricName")]
        getter metric_name : String?

        # The experiment statistic that these results pertain to.

        @[JSON::Field(key: "resultStat")]
        getter result_stat : String?

        # The treatment, or variation, that returned the values in this structure.

        @[JSON::Field(key: "treatmentName")]
        getter treatment_name : String?

        # The values for the metricName that were recorded in the experiment.

        @[JSON::Field(key: "values")]
        getter values : Array(Float64)?

        def initialize(
          @metric_name : String? = nil,
          @result_stat : String? = nil,
          @treatment_name : String? = nil,
          @values : Array(Float64)? = nil
        )
        end
      end

      # This structure contains the time and date that Evidently completed the analysis of the experiment.

      struct ExperimentSchedule
        include JSON::Serializable

        # The time and date that Evidently completed the analysis of the experiment.

        @[JSON::Field(key: "analysisCompleteTime")]
        getter analysis_complete_time : Time?

        def initialize(
          @analysis_complete_time : Time? = nil
        )
        end
      end

      # This structure contains information about one Evidently feature in your account.

      struct Feature
        include JSON::Serializable

        # The ARN of the feature.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the feature is created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # If this value is ALL_RULES , the traffic allocation specified by any ongoing launches or experiments
        # is being used. If this is DEFAULT_VARIATION , the default variation is being served to all users.

        @[JSON::Field(key: "evaluationStrategy")]
        getter evaluation_strategy : String

        # The date and time that the feature was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the feature.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the feature.

        @[JSON::Field(key: "status")]
        getter status : String

        # Defines the type of value used to define the different feature variations. For more information, see
        # Variation types

        @[JSON::Field(key: "valueType")]
        getter value_type : String

        # An array of structures that contain the configuration of the feature's different variations.

        @[JSON::Field(key: "variations")]
        getter variations : Array(Types::Variation)

        # The name of the variation that is used as the default variation. The default variation is served to
        # users who are not allocated to any ongoing launches or experiments of this feature. This variation
        # must also be listed in the variations structure. If you omit defaultVariation , the first variation
        # listed in the variations structure is used as the default variation.

        @[JSON::Field(key: "defaultVariation")]
        getter default_variation : String?

        # The description of the feature.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A set of key-value pairs that specify users who should always be served a specific variation of a
        # feature. Each key specifies a user using their user ID, account ID, or some other identifier. The
        # value specifies the name of the variation that the user is to be served. For the override to be
        # successful, the value of the key must match the entityId used in the EvaluateFeature operation.

        @[JSON::Field(key: "entityOverrides")]
        getter entity_overrides : Hash(String, String)?

        # An array of structures that define the evaluation rules for the feature.

        @[JSON::Field(key: "evaluationRules")]
        getter evaluation_rules : Array(Types::EvaluationRule)?

        # The name or ARN of the project that contains the feature.

        @[JSON::Field(key: "project")]
        getter project : String?

        # The list of tag keys and values associated with this feature.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @evaluation_strategy : String,
          @last_updated_time : Time,
          @name : String,
          @status : String,
          @value_type : String,
          @variations : Array(Types::Variation),
          @default_variation : String? = nil,
          @description : String? = nil,
          @entity_overrides : Hash(String, String)? = nil,
          @evaluation_rules : Array(Types::EvaluationRule)? = nil,
          @project : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This structure contains information about one Evidently feature in your account.

      struct FeatureSummary
        include JSON::Serializable

        # The ARN of the feature.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the feature is created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # If this value is ALL_RULES , the traffic allocation specified by any ongoing launches or experiments
        # is being used. If this is DEFAULT_VARIATION , the default variation is being served to all users.

        @[JSON::Field(key: "evaluationStrategy")]
        getter evaluation_strategy : String

        # The date and time that the feature was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the feature.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the feature.

        @[JSON::Field(key: "status")]
        getter status : String

        # The name of the variation that is used as the default variation. The default variation is served to
        # users who are not allocated to any ongoing launches or experiments of this feature.

        @[JSON::Field(key: "defaultVariation")]
        getter default_variation : String?

        # An array of structures that define

        @[JSON::Field(key: "evaluationRules")]
        getter evaluation_rules : Array(Types::EvaluationRule)?

        # The name or ARN of the project that contains the feature.

        @[JSON::Field(key: "project")]
        getter project : String?

        # The list of tag keys and values associated with this feature.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @evaluation_strategy : String,
          @last_updated_time : Time,
          @name : String,
          @status : String,
          @default_variation : String? = nil,
          @evaluation_rules : Array(Types::EvaluationRule)? = nil,
          @project : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetExperimentRequest
        include JSON::Serializable

        # The name of the experiment that you want to see the details of.

        @[JSON::Field(key: "experiment")]
        getter experiment : String

        # The name or ARN of the project that contains the experiment.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @experiment : String,
          @project : String
        )
        end
      end


      struct GetExperimentResponse
        include JSON::Serializable

        # A structure containing the configuration details of the experiment.

        @[JSON::Field(key: "experiment")]
        getter experiment : Types::Experiment?

        def initialize(
          @experiment : Types::Experiment? = nil
        )
        end
      end


      struct GetExperimentResultsRequest
        include JSON::Serializable

        # The name of the experiment to retrieve the results of.

        @[JSON::Field(key: "experiment")]
        getter experiment : String

        # The names of the experiment metrics that you want to see the results of.

        @[JSON::Field(key: "metricNames")]
        getter metric_names : Array(String)

        # The name or ARN of the project that contains the experiment that you want to see the results of.

        @[JSON::Field(key: "project")]
        getter project : String

        # The names of the experiment treatments that you want to see the results for.

        @[JSON::Field(key: "treatmentNames")]
        getter treatment_names : Array(String)

        # The statistic used to calculate experiment results. Currently the only valid value is mean , which
        # uses the mean of the collected values as the statistic.

        @[JSON::Field(key: "baseStat")]
        getter base_stat : String?

        # The date and time that the experiment ended, if it is completed. This must be no longer than 30 days
        # after the experiment start time.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        # In seconds, the amount of time to aggregate results together.

        @[JSON::Field(key: "period")]
        getter period : Int64?

        # The names of the report types that you want to see. Currently, BayesianInference is the only valid
        # value.

        @[JSON::Field(key: "reportNames")]
        getter report_names : Array(String)?

        # The statistics that you want to see in the returned results. PValue specifies to use p-values for
        # the results. A p-value is used in hypothesis testing to measure how often you are willing to make a
        # mistake in rejecting the null hypothesis. A general practice is to reject the null hypothesis and
        # declare that the results are statistically significant when the p-value is less than 0.05.
        # ConfidenceInterval specifies a confidence interval for the results. The confidence interval
        # represents the range of values for the chosen metric that is likely to contain the true difference
        # between the baseStat of a variation and the baseline. Evidently returns the 95% confidence interval.
        # TreatmentEffect is the difference in the statistic specified by the baseStat parameter between each
        # variation and the default variation. BaseStat returns the statistical values collected for the
        # metric for each variation. The statistic uses the same statistic specified in the baseStat
        # parameter. Therefore, if baseStat is mean , this returns the mean of the values collected for each
        # variation.

        @[JSON::Field(key: "resultStats")]
        getter result_stats : Array(String)?

        # The date and time that the experiment started.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time?

        def initialize(
          @experiment : String,
          @metric_names : Array(String),
          @project : String,
          @treatment_names : Array(String),
          @base_stat : String? = nil,
          @end_time : Time? = nil,
          @period : Int64? = nil,
          @report_names : Array(String)? = nil,
          @result_stats : Array(String)? = nil,
          @start_time : Time? = nil
        )
        end
      end


      struct GetExperimentResultsResponse
        include JSON::Serializable

        # If the experiment doesn't yet have enough events to provide valid results, this field is returned
        # with the message Not enough events to generate results . If there are enough events to provide valid
        # results, this field is not returned.

        @[JSON::Field(key: "details")]
        getter details : String?

        # An array of structures that include the reports that you requested.

        @[JSON::Field(key: "reports")]
        getter reports : Array(Types::ExperimentReport)?

        # An array of structures that include experiment results including metric names and values.

        @[JSON::Field(key: "resultsData")]
        getter results_data : Array(Types::ExperimentResultsData)?

        # The timestamps of each result returned.

        @[JSON::Field(key: "timestamps")]
        getter timestamps : Array(Time)?

        def initialize(
          @details : String? = nil,
          @reports : Array(Types::ExperimentReport)? = nil,
          @results_data : Array(Types::ExperimentResultsData)? = nil,
          @timestamps : Array(Time)? = nil
        )
        end
      end


      struct GetFeatureRequest
        include JSON::Serializable

        # The name of the feature that you want to retrieve information for.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # The name or ARN of the project that contains the feature.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @feature : String,
          @project : String
        )
        end
      end


      struct GetFeatureResponse
        include JSON::Serializable

        # A structure containing the configuration details of the feature.

        @[JSON::Field(key: "feature")]
        getter feature : Types::Feature

        def initialize(
          @feature : Types::Feature
        )
        end
      end


      struct GetLaunchRequest
        include JSON::Serializable

        # The name of the launch that you want to see the details of.

        @[JSON::Field(key: "launch")]
        getter launch : String

        # The name or ARN of the project that contains the launch.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @launch : String,
          @project : String
        )
        end
      end


      struct GetLaunchResponse
        include JSON::Serializable

        # A structure containing the configuration details of the launch.

        @[JSON::Field(key: "launch")]
        getter launch : Types::Launch?

        def initialize(
          @launch : Types::Launch? = nil
        )
        end
      end


      struct GetProjectRequest
        include JSON::Serializable

        # The name or ARN of the project that you want to see the details of.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @project : String
        )
        end
      end


      struct GetProjectResponse
        include JSON::Serializable

        # A structure containing the configuration details of the project.

        @[JSON::Field(key: "project")]
        getter project : Types::Project

        def initialize(
          @project : Types::Project
        )
        end
      end


      struct GetSegmentRequest
        include JSON::Serializable

        # The ARN of the segment to return information for.

        @[JSON::Field(key: "segment")]
        getter segment : String

        def initialize(
          @segment : String
        )
        end
      end


      struct GetSegmentResponse
        include JSON::Serializable

        # A structure that contains the complete information about the segment.

        @[JSON::Field(key: "segment")]
        getter segment : Types::Segment

        def initialize(
          @segment : Types::Segment
        )
        end
      end

      # Unexpected error while processing the request. Retry the request.

      struct InternalServerException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end

      # This structure contains the configuration details of one Evidently launch.

      struct Launch
        include JSON::Serializable

        # The ARN of the launch.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the launch is created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The date and time that the launch was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the launch.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the launch.

        @[JSON::Field(key: "status")]
        getter status : String

        # The type of launch.

        @[JSON::Field(key: "type")]
        getter type : String

        # The description of the launch.

        @[JSON::Field(key: "description")]
        getter description : String?

        # A structure that contains information about the start and end times of the launch.

        @[JSON::Field(key: "execution")]
        getter execution : Types::LaunchExecution?

        # An array of structures that define the feature variations that are being used in the launch.

        @[JSON::Field(key: "groups")]
        getter groups : Array(Types::LaunchGroup)?

        # An array of structures that define the metrics that are being used to monitor the launch
        # performance.

        @[JSON::Field(key: "metricMonitors")]
        getter metric_monitors : Array(Types::MetricMonitor)?

        # The name or ARN of the project that contains the launch.

        @[JSON::Field(key: "project")]
        getter project : String?

        # This value is used when Evidently assigns a particular user session to the launch, to help create a
        # randomization ID to determine which variation the user session is served. This randomization ID is a
        # combination of the entity ID and randomizationSalt .

        @[JSON::Field(key: "randomizationSalt")]
        getter randomization_salt : String?

        # An array of structures that define the traffic allocation percentages among the feature variations
        # during each step of the launch.

        @[JSON::Field(key: "scheduledSplitsDefinition")]
        getter scheduled_splits_definition : Types::ScheduledSplitsLaunchDefinition?

        # If the launch was stopped, this is the string that was entered by the person who stopped the launch,
        # to explain why it was stopped.

        @[JSON::Field(key: "statusReason")]
        getter status_reason : String?

        # The list of tag keys and values associated with this launch.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @status : String,
          @type : String,
          @description : String? = nil,
          @execution : Types::LaunchExecution? = nil,
          @groups : Array(Types::LaunchGroup)? = nil,
          @metric_monitors : Array(Types::MetricMonitor)? = nil,
          @project : String? = nil,
          @randomization_salt : String? = nil,
          @scheduled_splits_definition : Types::ScheduledSplitsLaunchDefinition? = nil,
          @status_reason : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This structure contains information about the start and end times of the launch.

      struct LaunchExecution
        include JSON::Serializable

        # The date and time that the launch ended.

        @[JSON::Field(key: "endedTime")]
        getter ended_time : Time?

        # The date and time that the launch started.

        @[JSON::Field(key: "startedTime")]
        getter started_time : Time?

        def initialize(
          @ended_time : Time? = nil,
          @started_time : Time? = nil
        )
        end
      end

      # A structure that defines one launch group in a launch. A launch group is a variation of the feature
      # that you are including in the launch.

      struct LaunchGroup
        include JSON::Serializable

        # The feature variation for this launch group. This is a key-value pair.

        @[JSON::Field(key: "featureVariations")]
        getter feature_variations : Hash(String, String)

        # The name of the launch group.

        @[JSON::Field(key: "name")]
        getter name : String

        # A description of the launch group.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @feature_variations : Hash(String, String),
          @name : String,
          @description : String? = nil
        )
        end
      end

      # A structure that defines one launch group in a launch. A launch group is a variation of the feature
      # that you are including in the launch.

      struct LaunchGroupConfig
        include JSON::Serializable

        # The feature that this launch is using.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # A name for this launch group.

        @[JSON::Field(key: "name")]
        getter name : String

        # The feature variation to use for this launch group.

        @[JSON::Field(key: "variation")]
        getter variation : String

        # A description of the launch group.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @feature : String,
          @name : String,
          @variation : String,
          @description : String? = nil
        )
        end
      end


      struct ListExperimentsRequest
        include JSON::Serializable

        # The name or ARN of the project to return the experiment list from.

        @[JSON::Field(key: "project")]
        getter project : String

        # The maximum number of results to include in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListExperiments operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Use this optional parameter to limit the returned results to only the experiments with the status
        # that you specify here.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @project : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListExperimentsResponse
        include JSON::Serializable

        # An array of structures that contain the configuration details of the experiments in the specified
        # project.

        @[JSON::Field(key: "experiments")]
        getter experiments : Array(Types::Experiment)?

        # The token to use in a subsequent ListExperiments operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @experiments : Array(Types::Experiment)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFeaturesRequest
        include JSON::Serializable

        # The name or ARN of the project to return the feature list from.

        @[JSON::Field(key: "project")]
        getter project : String

        # The maximum number of results to include in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListFeatures operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @project : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListFeaturesResponse
        include JSON::Serializable

        # An array of structures that contain the configuration details of the features in the specified
        # project.

        @[JSON::Field(key: "features")]
        getter features : Array(Types::FeatureSummary)?

        # The token to use in a subsequent ListFeatures operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @features : Array(Types::FeatureSummary)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListLaunchesRequest
        include JSON::Serializable

        # The name or ARN of the project to return the launch list from.

        @[JSON::Field(key: "project")]
        getter project : String

        # The maximum number of results to include in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListLaunches operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Use this optional parameter to limit the returned results to only the launches with the status that
        # you specify here.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @project : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListLaunchesResponse
        include JSON::Serializable

        # An array of structures that contain the configuration details of the launches in the specified
        # project.

        @[JSON::Field(key: "launches")]
        getter launches : Array(Types::Launch)?

        # The token to use in a subsequent ListLaunches operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @launches : Array(Types::Launch)? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProjectsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListProjects operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListProjectsResponse
        include JSON::Serializable

        # The token to use in a subsequent ListProjects operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of structures that contain the configuration details of the projects in the Region.

        @[JSON::Field(key: "projects")]
        getter projects : Array(Types::ProjectSummary)?

        def initialize(
          @next_token : String? = nil,
          @projects : Array(Types::ProjectSummary)? = nil
        )
        end
      end


      struct ListSegmentReferencesRequest
        include JSON::Serializable

        # The ARN of the segment that you want to view information for.

        @[JSON::Field(key: "segment")]
        getter segment : String

        # Specifies whether to return information about launches or experiments that use this segment.

        @[JSON::Field(key: "type")]
        getter type : String

        # The maximum number of results to include in the response. If you omit this, the default of 50 is
        # used.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListSegmentReferences operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @segment : String,
          @type : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSegmentReferencesResponse
        include JSON::Serializable

        # The token to use in a subsequent ListSegmentReferences operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of structures, where each structure contains information about one experiment or launch
        # that uses this segment.

        @[JSON::Field(key: "referencedBy")]
        getter referenced_by : Array(Types::RefResource)?

        def initialize(
          @next_token : String? = nil,
          @referenced_by : Array(Types::RefResource)? = nil
        )
        end
      end


      struct ListSegmentsRequest
        include JSON::Serializable

        # The maximum number of results to include in the response. If you omit this, the default of 50 is
        # used.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token to use when requesting the next set of results. You received this token from a previous
        # ListSegments operation.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListSegmentsResponse
        include JSON::Serializable

        # The token to use in a subsequent ListSegments operation to return the next set of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # An array of structures that contain information about the segments in this Region.

        @[JSON::Field(key: "segments")]
        getter segments : Array(Types::Segment)?

        def initialize(
          @next_token : String? = nil,
          @segments : Array(Types::Segment)? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The ARN of the resource that you want to see the tags of.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The list of tag keys and values associated with the resource you specified.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This structure defines a metric that is being used to evaluate the variations during a launch or
      # experiment.

      struct MetricDefinition
        include JSON::Serializable

        # The entity, such as a user or session, that does an action that causes a metric value to be
        # recorded.

        @[JSON::Field(key: "entityIdKey")]
        getter entity_id_key : String?

        # The EventBridge event pattern that defines how the metric is recorded. For more information about
        # EventBridge event patterns, see Amazon EventBridge event patterns .

        @[JSON::Field(key: "eventPattern")]
        getter event_pattern : String?

        # The name of the metric.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The label for the units that the metric is measuring.

        @[JSON::Field(key: "unitLabel")]
        getter unit_label : String?

        # The value that is tracked to produce the metric.

        @[JSON::Field(key: "valueKey")]
        getter value_key : String?

        def initialize(
          @entity_id_key : String? = nil,
          @event_pattern : String? = nil,
          @name : String? = nil,
          @unit_label : String? = nil,
          @value_key : String? = nil
        )
        end
      end

      # This structure defines a metric that you want to use to evaluate the variations during a launch or
      # experiment.

      struct MetricDefinitionConfig
        include JSON::Serializable

        # The entity, such as a user or session, that does an action that causes a metric value to be
        # recorded. An example is userDetails.userID .

        @[JSON::Field(key: "entityIdKey")]
        getter entity_id_key : String

        # A name for the metric.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value that is tracked to produce the metric.

        @[JSON::Field(key: "valueKey")]
        getter value_key : String

        # The EventBridge event pattern that defines how the metric is recorded. For more information about
        # EventBridge event patterns, see Amazon EventBridge event patterns .

        @[JSON::Field(key: "eventPattern")]
        getter event_pattern : String?

        # A label for the units that the metric is measuring.

        @[JSON::Field(key: "unitLabel")]
        getter unit_label : String?

        def initialize(
          @entity_id_key : String,
          @name : String,
          @value_key : String,
          @event_pattern : String? = nil,
          @unit_label : String? = nil
        )
        end
      end

      # A structure that tells Evidently whether higher or lower values are desired for a metric that is
      # used in an experiment.

      struct MetricGoal
        include JSON::Serializable

        # A structure that contains details about the metric.

        @[JSON::Field(key: "metricDefinition")]
        getter metric_definition : Types::MetricDefinition

        # INCREASE means that a variation with a higher number for this metric is performing better. DECREASE
        # means that a variation with a lower number for this metric is performing better.

        @[JSON::Field(key: "desiredChange")]
        getter desired_change : String?

        def initialize(
          @metric_definition : Types::MetricDefinition,
          @desired_change : String? = nil
        )
        end
      end

      # Use this structure to tell Evidently whether higher or lower values are desired for a metric that is
      # used in an experiment.

      struct MetricGoalConfig
        include JSON::Serializable

        # A structure that contains details about the metric.

        @[JSON::Field(key: "metricDefinition")]
        getter metric_definition : Types::MetricDefinitionConfig

        # INCREASE means that a variation with a higher number for this metric is performing better. DECREASE
        # means that a variation with a lower number for this metric is performing better.

        @[JSON::Field(key: "desiredChange")]
        getter desired_change : String?

        def initialize(
          @metric_definition : Types::MetricDefinitionConfig,
          @desired_change : String? = nil
        )
        end
      end

      # A structure that defines a metric to be used to monitor performance of the variations during a
      # launch.

      struct MetricMonitor
        include JSON::Serializable

        # A structure that defines the metric.

        @[JSON::Field(key: "metricDefinition")]
        getter metric_definition : Types::MetricDefinition

        def initialize(
          @metric_definition : Types::MetricDefinition
        )
        end
      end

      # A structure that defines a metric to be used to monitor performance of the variations during a
      # launch.

      struct MetricMonitorConfig
        include JSON::Serializable

        # A structure that defines the metric.

        @[JSON::Field(key: "metricDefinition")]
        getter metric_definition : Types::MetricDefinitionConfig

        def initialize(
          @metric_definition : Types::MetricDefinitionConfig
        )
        end
      end

      # A structure that contains the configuration of which variation to use as the "control" version. The
      # "control" version is used for comparison with other variations. This structure also specifies how
      # much experiment traffic is allocated to each variation.

      struct OnlineAbConfig
        include JSON::Serializable

        # The name of the variation that is to be the default variation that the other variations are compared
        # to.

        @[JSON::Field(key: "controlTreatmentName")]
        getter control_treatment_name : String?

        # A set of key-value pairs. The keys are variation names, and the values are the portion of experiment
        # traffic to be assigned to that variation. Specify the traffic portion in thousandths of a percent,
        # so 20,000 for a variation would allocate 20% of the experiment traffic to that variation.

        @[JSON::Field(key: "treatmentWeights")]
        getter treatment_weights : Hash(String, Int64)?

        def initialize(
          @control_treatment_name : String? = nil,
          @treatment_weights : Hash(String, Int64)? = nil
        )
        end
      end

      # A structure that contains the configuration of which variation to use as the "control" version. The
      # "control" version is used for comparison with other variations. This structure also specifies how
      # much experiment traffic is allocated to each variation.

      struct OnlineAbDefinition
        include JSON::Serializable

        # The name of the variation that is the default variation that the other variations are compared to.

        @[JSON::Field(key: "controlTreatmentName")]
        getter control_treatment_name : String?

        # A set of key-value pairs. The keys are variation names, and the values are the portion of experiment
        # traffic to be assigned to that variation. The traffic portion is specified in thousandths of a
        # percent, so 20,000 for a variation would allocate 20% of the experiment traffic to that variation.

        @[JSON::Field(key: "treatmentWeights")]
        getter treatment_weights : Hash(String, Int64)?

        def initialize(
          @control_treatment_name : String? = nil,
          @treatment_weights : Hash(String, Int64)? = nil
        )
        end
      end

      # This structure defines a project, which is the logical object in Evidently that can contain
      # features, launches, and experiments. Use projects to group similar features together.

      struct Project
        include JSON::Serializable

        # The name or ARN of the project.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the project is created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The date and time that the project was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the project.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the project.

        @[JSON::Field(key: "status")]
        getter status : String

        # The number of ongoing experiments currently in the project.

        @[JSON::Field(key: "activeExperimentCount")]
        getter active_experiment_count : Int64?

        # The number of ongoing launches currently in the project.

        @[JSON::Field(key: "activeLaunchCount")]
        getter active_launch_count : Int64?

        # This structure defines the configuration of how your application integrates with AppConfig to run
        # client-side evaluation.

        @[JSON::Field(key: "appConfigResource")]
        getter app_config_resource : Types::ProjectAppConfigResource?

        # A structure that contains information about where Evidently is to store evaluation events for longer
        # term storage.

        @[JSON::Field(key: "dataDelivery")]
        getter data_delivery : Types::ProjectDataDelivery?

        # The user-entered description of the project.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The number of experiments currently in the project. This includes all experiments that have been
        # created and not deleted, whether they are ongoing or not.

        @[JSON::Field(key: "experimentCount")]
        getter experiment_count : Int64?

        # The number of features currently in the project.

        @[JSON::Field(key: "featureCount")]
        getter feature_count : Int64?

        # The number of launches currently in the project. This includes all launches that have been created
        # and not deleted, whether they are ongoing or not.

        @[JSON::Field(key: "launchCount")]
        getter launch_count : Int64?

        # The list of tag keys and values associated with this project.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @status : String,
          @active_experiment_count : Int64? = nil,
          @active_launch_count : Int64? = nil,
          @app_config_resource : Types::ProjectAppConfigResource? = nil,
          @data_delivery : Types::ProjectDataDelivery? = nil,
          @description : String? = nil,
          @experiment_count : Int64? = nil,
          @feature_count : Int64? = nil,
          @launch_count : Int64? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This is a structure that defines the configuration of how your application integrates with AppConfig
      # to run client-side evaluation.

      struct ProjectAppConfigResource
        include JSON::Serializable

        # The ID of the AppConfig application to use for client-side evaluation.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String

        # The ID of the AppConfig profile to use for client-side evaluation.

        @[JSON::Field(key: "configurationProfileId")]
        getter configuration_profile_id : String

        # The ID of the AppConfig environment to use for client-side evaluation. This must be an environment
        # that is within the application that you specify for applicationId .

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String

        def initialize(
          @application_id : String,
          @configuration_profile_id : String,
          @environment_id : String
        )
        end
      end

      # Use this parameter to configure client-side evaluation for your project. Client-side evaluation
      # allows your application to assign variations to user sessions locally instead of by calling the
      # EvaluateFeature operation to assign the variations. This mitigates the latency and availability
      # risks that come with an API call. ProjectAppConfigResource is a structure that defines the
      # configuration of how your application integrates with AppConfig to run client-side evaluation.

      struct ProjectAppConfigResourceConfig
        include JSON::Serializable

        # The ID of the AppConfig application to use for client-side evaluation.

        @[JSON::Field(key: "applicationId")]
        getter application_id : String?

        # The ID of the AppConfig environment to use for client-side evaluation. This must be an environment
        # that is within the application that you specify for applicationId .

        @[JSON::Field(key: "environmentId")]
        getter environment_id : String?

        def initialize(
          @application_id : String? = nil,
          @environment_id : String? = nil
        )
        end
      end

      # A structure that contains information about where Evidently is to store evaluation events for longer
      # term storage.

      struct ProjectDataDelivery
        include JSON::Serializable

        # If the project stores evaluation events in CloudWatch Logs, this structure stores the log group
        # name.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsDestination?

        # If the project stores evaluation events in an Amazon S3 bucket, this structure stores the bucket
        # name and bucket prefix.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3Destination?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsDestination? = nil,
          @s3_destination : Types::S3Destination? = nil
        )
        end
      end

      # A structure that contains information about where Evidently is to store evaluation events for longer
      # term storage.

      struct ProjectDataDeliveryConfig
        include JSON::Serializable

        # If the project stores evaluation events in CloudWatch Logs, this structure stores the log group
        # name.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsDestinationConfig?

        # If the project stores evaluation events in an Amazon S3 bucket, this structure stores the bucket
        # name and bucket prefix.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3DestinationConfig?

        def initialize(
          @cloud_watch_logs : Types::CloudWatchLogsDestinationConfig? = nil,
          @s3_destination : Types::S3DestinationConfig? = nil
        )
        end
      end

      # A structure that contains configuration information about an Evidently project.

      struct ProjectSummary
        include JSON::Serializable

        # The name or ARN of the project.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that the project is created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The date and time that the project was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the project.

        @[JSON::Field(key: "name")]
        getter name : String

        # The current state of the project.

        @[JSON::Field(key: "status")]
        getter status : String

        # The number of experiments currently in the project.

        @[JSON::Field(key: "activeExperimentCount")]
        getter active_experiment_count : Int64?

        # The number of ongoing launches currently in the project.

        @[JSON::Field(key: "activeLaunchCount")]
        getter active_launch_count : Int64?

        # The description of the project.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The number of experiments currently in the project.

        @[JSON::Field(key: "experimentCount")]
        getter experiment_count : Int64?

        # The number of features currently in the project.

        @[JSON::Field(key: "featureCount")]
        getter feature_count : Int64?

        # The number of launches currently in the project, including launches that are ongoing, completed, and
        # not started yet.

        @[JSON::Field(key: "launchCount")]
        getter launch_count : Int64?

        # The list of tag keys and values associated with this project.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @status : String,
          @active_experiment_count : Int64? = nil,
          @active_launch_count : Int64? = nil,
          @description : String? = nil,
          @experiment_count : Int64? = nil,
          @feature_count : Int64? = nil,
          @launch_count : Int64? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct PutProjectEventsRequest
        include JSON::Serializable

        # An array of event structures that contain the performance data that is being sent to Evidently.

        @[JSON::Field(key: "events")]
        getter events : Array(Types::Event)

        # The name or ARN of the project to write the events to.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @events : Array(Types::Event),
          @project : String
        )
        end
      end


      struct PutProjectEventsResponse
        include JSON::Serializable

        # A structure that contains Evidently's response to the sent events, including an event ID and error
        # codes, if any.

        @[JSON::Field(key: "eventResults")]
        getter event_results : Array(Types::PutProjectEventsResultEntry)?

        # The number of events in the operation that could not be used by Evidently.

        @[JSON::Field(key: "failedEventCount")]
        getter failed_event_count : Int32?

        def initialize(
          @event_results : Array(Types::PutProjectEventsResultEntry)? = nil,
          @failed_event_count : Int32? = nil
        )
        end
      end

      # A structure that contains Evidently's response to the sent events, including an event ID and error
      # codes, if any.

      struct PutProjectEventsResultEntry
        include JSON::Serializable

        # If the PutProjectEvents operation has an error, the error code is returned here.

        @[JSON::Field(key: "errorCode")]
        getter error_code : String?

        # If the PutProjectEvents operation has an error, the error message is returned here.

        @[JSON::Field(key: "errorMessage")]
        getter error_message : String?

        # A unique ID assigned to this PutProjectEvents operation.

        @[JSON::Field(key: "eventId")]
        getter event_id : String?

        def initialize(
          @error_code : String? = nil,
          @error_message : String? = nil,
          @event_id : String? = nil
        )
        end
      end

      # A structure that contains information about one experiment or launch that uses the specified
      # segment.

      struct RefResource
        include JSON::Serializable

        # The name of the experiment or launch.

        @[JSON::Field(key: "name")]
        getter name : String

        # Specifies whether the resource that this structure contains information about is an experiment or a
        # launch.

        @[JSON::Field(key: "type")]
        getter type : String

        # The ARN of the experiment or launch.

        @[JSON::Field(key: "arn")]
        getter arn : String?

        # The day and time that this experiment or launch ended.

        @[JSON::Field(key: "endTime")]
        getter end_time : String?

        # The day and time that this experiment or launch was most recently updated.

        @[JSON::Field(key: "lastUpdatedOn")]
        getter last_updated_on : String?

        # The day and time that this experiment or launch started.

        @[JSON::Field(key: "startTime")]
        getter start_time : String?

        # The status of the experiment or launch.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @name : String,
          @type : String,
          @arn : String? = nil,
          @end_time : String? = nil,
          @last_updated_on : String? = nil,
          @start_time : String? = nil,
          @status : String? = nil
        )
        end
      end

      # The request references a resource that does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the resource that caused the exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        def initialize(
          @message : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil
        )
        end
      end

      # If the project stores evaluation events in an Amazon S3 bucket, this structure stores the bucket
      # name and bucket prefix.

      struct S3Destination
        include JSON::Serializable

        # The name of the bucket in which Evidently stores evaluation events.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The bucket prefix in which Evidently stores evaluation events.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # If the project stores evaluation events in an Amazon S3 bucket, this structure stores the bucket
      # name and bucket prefix.

      struct S3DestinationConfig
        include JSON::Serializable

        # The name of the bucket in which Evidently stores evaluation events.

        @[JSON::Field(key: "bucket")]
        getter bucket : String?

        # The bucket prefix in which Evidently stores evaluation events.

        @[JSON::Field(key: "prefix")]
        getter prefix : String?

        def initialize(
          @bucket : String? = nil,
          @prefix : String? = nil
        )
        end
      end

      # This structure defines the traffic allocation percentages among the feature variations during one
      # step of a launch, and the start time of that step.

      struct ScheduledSplit
        include JSON::Serializable

        # The date and time that this step of the launch starts.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # The traffic allocation percentages among the feature variations during one step of a launch. This is
        # a set of key-value pairs. The keys are variation names. The values represent the percentage of
        # traffic to allocate to that variation during this step. The values is expressed in thousandths of a
        # percent, so assigning a weight of 50000 assigns 50% of traffic to that variation. If the sum of the
        # weights for all the variations in a segment override does not add up to 100,000, then the remaining
        # traffic that matches this segment is not assigned by this segment override, and instead moves on to
        # the next segment override or the default traffic split.

        @[JSON::Field(key: "groupWeights")]
        getter group_weights : Hash(String, Int64)?

        # Use this parameter to specify different traffic splits for one or more audience segments . A segment
        # is a portion of your audience that share one or more characteristics. Examples could be Chrome
        # browser users, users in Europe, or Firefox browser users in Europe who also fit other criteria that
        # your application collects, such as age. This parameter is an array of up to six segment override
        # objects. Each of these objects specifies a segment that you have already created, and defines the
        # traffic split for that segment.

        @[JSON::Field(key: "segmentOverrides")]
        getter segment_overrides : Array(Types::SegmentOverride)?

        def initialize(
          @start_time : Time,
          @group_weights : Hash(String, Int64)? = nil,
          @segment_overrides : Array(Types::SegmentOverride)? = nil
        )
        end
      end

      # This structure defines the traffic allocation percentages among the feature variations during one
      # step of a launch, and the start time of that step.

      struct ScheduledSplitConfig
        include JSON::Serializable

        # The traffic allocation percentages among the feature variations during one step of a launch. This is
        # a set of key-value pairs. The keys are variation names. The values represent the percentage of
        # traffic to allocate to that variation during this step. The values is expressed in thousandths of a
        # percent, so assigning a weight of 50000 assigns 50% of traffic to that variation. If the sum of the
        # weights for all the variations in a segment override does not add up to 100,000, then the remaining
        # traffic that matches this segment is not assigned by this segment override, and instead moves on to
        # the next segment override or the default traffic split.

        @[JSON::Field(key: "groupWeights")]
        getter group_weights : Hash(String, Int64)

        # The date and time that this step of the launch starts.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # Use this parameter to specify different traffic splits for one or more audience segments . A segment
        # is a portion of your audience that share one or more characteristics. Examples could be Chrome
        # browser users, users in Europe, or Firefox browser users in Europe who also fit other criteria that
        # your application collects, such as age. This parameter is an array of up to six segment override
        # objects. Each of these objects specifies a segment that you have already created, and defines the
        # traffic split for that segment.

        @[JSON::Field(key: "segmentOverrides")]
        getter segment_overrides : Array(Types::SegmentOverride)?

        def initialize(
          @group_weights : Hash(String, Int64),
          @start_time : Time,
          @segment_overrides : Array(Types::SegmentOverride)? = nil
        )
        end
      end

      # An array of structures that define the traffic allocation percentages among the feature variations
      # during each step of a launch. This also defines the start time of each step.

      struct ScheduledSplitsLaunchConfig
        include JSON::Serializable

        # An array of structures that define the traffic allocation percentages among the feature variations
        # during each step of the launch. This also defines the start time of each step.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::ScheduledSplitConfig)

        def initialize(
          @steps : Array(Types::ScheduledSplitConfig)
        )
        end
      end

      # An array of structures that define the traffic allocation percentages among the feature variations
      # during each step of a launch. This also defines the start time of each step.

      struct ScheduledSplitsLaunchDefinition
        include JSON::Serializable

        # An array of structures that define the traffic allocation percentages among the feature variations
        # during each step of the launch. This also defines the start time of each step.

        @[JSON::Field(key: "steps")]
        getter steps : Array(Types::ScheduledSplit)?

        def initialize(
          @steps : Array(Types::ScheduledSplit)? = nil
        )
        end
      end

      # This structure contains information about one audience segment . You can use segments in your
      # experiments and launches to narrow the user sessions used for experiment or launch to only the user
      # sessions that match one or more criteria.

      struct Segment
        include JSON::Serializable

        # The ARN of the segment.

        @[JSON::Field(key: "arn")]
        getter arn : String

        # The date and time that this segment was created.

        @[JSON::Field(key: "createdTime")]
        getter created_time : Time

        # The date and time that this segment was most recently updated.

        @[JSON::Field(key: "lastUpdatedTime")]
        getter last_updated_time : Time

        # The name of the segment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The pattern that defines the attributes to use to evalute whether a user session will be in the
        # segment. For more information about the pattern syntax, see Segment rule pattern syntax .

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # The customer-created description for this segment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The number of experiments that this segment is used in. This count includes all current experiments,
        # not just those that are currently running.

        @[JSON::Field(key: "experimentCount")]
        getter experiment_count : Int64?

        # The number of launches that this segment is used in. This count includes all current launches, not
        # just those that are currently running.

        @[JSON::Field(key: "launchCount")]
        getter launch_count : Int64?

        # The list of tag keys and values associated with this launch.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @arn : String,
          @created_time : Time,
          @last_updated_time : Time,
          @name : String,
          @pattern : String,
          @description : String? = nil,
          @experiment_count : Int64? = nil,
          @launch_count : Int64? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # This structure specifies a segment that you have already created, and defines the traffic split for
      # that segment to be used in a launch.

      struct SegmentOverride
        include JSON::Serializable

        # A number indicating the order to use to evaluate segment overrides, if there are more than one.
        # Segment overrides with lower numbers are evaluated first.

        @[JSON::Field(key: "evaluationOrder")]
        getter evaluation_order : Int64

        # The ARN of the segment to use.

        @[JSON::Field(key: "segment")]
        getter segment : String

        # The traffic allocation percentages among the feature variations to assign to this segment. This is a
        # set of key-value pairs. The keys are variation names. The values represent the amount of traffic to
        # allocate to that variation for this segment. This is expressed in thousandths of a percent, so a
        # weight of 50000 represents 50% of traffic.

        @[JSON::Field(key: "weights")]
        getter weights : Hash(String, Int64)

        def initialize(
          @evaluation_order : Int64,
          @segment : String,
          @weights : Hash(String, Int64)
        )
        end
      end

      # The request would cause a service quota to be exceeded.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the service quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The ID of the resource that caused the exception.

        @[JSON::Field(key: "resourceId")]
        getter resource_id : String?

        # The type of the resource that is associated with the error.

        @[JSON::Field(key: "resourceType")]
        getter resource_type : String?

        # The ID of the service that is associated with the error.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @resource_id : String? = nil,
          @resource_type : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # The service was unavailable. Retry the request.

      struct ServiceUnavailableException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        def initialize(
          @message : String? = nil
        )
        end
      end


      struct StartExperimentRequest
        include JSON::Serializable

        # The date and time to end the experiment. This must be no more than 30 days after the experiment
        # starts.

        @[JSON::Field(key: "analysisCompleteTime")]
        getter analysis_complete_time : Time

        # The name of the experiment to start.

        @[JSON::Field(key: "experiment")]
        getter experiment : String

        # The name or ARN of the project that contains the experiment to start.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @analysis_complete_time : Time,
          @experiment : String,
          @project : String
        )
        end
      end


      struct StartExperimentResponse
        include JSON::Serializable

        # A timestamp that indicates when the experiment started.

        @[JSON::Field(key: "startedTime")]
        getter started_time : Time?

        def initialize(
          @started_time : Time? = nil
        )
        end
      end


      struct StartLaunchRequest
        include JSON::Serializable

        # The name of the launch to start.

        @[JSON::Field(key: "launch")]
        getter launch : String

        # The name or ARN of the project that contains the launch to start.

        @[JSON::Field(key: "project")]
        getter project : String

        def initialize(
          @launch : String,
          @project : String
        )
        end
      end


      struct StartLaunchResponse
        include JSON::Serializable

        # A structure that contains information about the launch that was started.

        @[JSON::Field(key: "launch")]
        getter launch : Types::Launch

        def initialize(
          @launch : Types::Launch
        )
        end
      end


      struct StopExperimentRequest
        include JSON::Serializable

        # The name of the experiment to stop.

        @[JSON::Field(key: "experiment")]
        getter experiment : String

        # The name or ARN of the project that contains the experiment to stop.

        @[JSON::Field(key: "project")]
        getter project : String

        # Specify whether the experiment is to be considered COMPLETED or CANCELLED after it stops.

        @[JSON::Field(key: "desiredState")]
        getter desired_state : String?

        # A string that describes why you are stopping the experiment.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @experiment : String,
          @project : String,
          @desired_state : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct StopExperimentResponse
        include JSON::Serializable

        # The date and time that the experiment stopped.

        @[JSON::Field(key: "endedTime")]
        getter ended_time : Time?

        def initialize(
          @ended_time : Time? = nil
        )
        end
      end


      struct StopLaunchRequest
        include JSON::Serializable

        # The name of the launch to stop.

        @[JSON::Field(key: "launch")]
        getter launch : String

        # The name or ARN of the project that contains the launch that you want to stop.

        @[JSON::Field(key: "project")]
        getter project : String

        # Specify whether to consider the launch as COMPLETED or CANCELLED after it stops.

        @[JSON::Field(key: "desiredState")]
        getter desired_state : String?

        # A string that describes why you are stopping the launch.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @launch : String,
          @project : String,
          @desired_state : String? = nil,
          @reason : String? = nil
        )
        end
      end


      struct StopLaunchResponse
        include JSON::Serializable

        # The date and time that the launch stopped.

        @[JSON::Field(key: "endedTime")]
        getter ended_time : Time?

        def initialize(
          @ended_time : Time? = nil
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The ARN of the CloudWatch Evidently resource that you're adding tags to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The list of key-value pairs to associate with the resource.

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


      struct TestSegmentPatternRequest
        include JSON::Serializable

        # The pattern to test.

        @[JSON::Field(key: "pattern")]
        getter pattern : String

        # A sample evaluationContext JSON block to test against the specified pattern.

        @[JSON::Field(key: "payload")]
        getter payload : String

        def initialize(
          @pattern : String,
          @payload : String
        )
        end
      end


      struct TestSegmentPatternResponse
        include JSON::Serializable

        # Returns true if the pattern matches the payload.

        @[JSON::Field(key: "match")]
        getter match : Bool

        def initialize(
          @match : Bool
        )
        end
      end

      # The request was denied because of request throttling. Retry the request.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String?

        # The ID of the service quota that was exceeded.

        @[JSON::Field(key: "quotaCode")]
        getter quota_code : String?

        # The ID of the service that is associated with the error.

        @[JSON::Field(key: "serviceCode")]
        getter service_code : String?

        def initialize(
          @message : String? = nil,
          @quota_code : String? = nil,
          @service_code : String? = nil
        )
        end
      end

      # A structure that defines one treatment in an experiment. A treatment is a variation of the feature
      # that you are including in the experiment.

      struct Treatment
        include JSON::Serializable

        # The name of this treatment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the treatment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The feature variation used for this treatment. This is a key-value pair. The key is the feature
        # name, and the value is the variation name.

        @[JSON::Field(key: "featureVariations")]
        getter feature_variations : Hash(String, String)?

        def initialize(
          @name : String,
          @description : String? = nil,
          @feature_variations : Hash(String, String)? = nil
        )
        end
      end

      # A structure that defines one treatment in an experiment. A treatment is a variation of the feature
      # that you are including in the experiment.

      struct TreatmentConfig
        include JSON::Serializable

        # The feature that this experiment is testing.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # A name for this treatment.

        @[JSON::Field(key: "name")]
        getter name : String

        # The name of the variation to use as this treatment in the experiment.

        @[JSON::Field(key: "variation")]
        getter variation : String

        # A description for this treatment.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @feature : String,
          @name : String,
          @variation : String,
          @description : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The ARN of the CloudWatch Evidently resource that you're removing tags from.

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


      struct UpdateExperimentRequest
        include JSON::Serializable

        # The name of the experiment to update.

        @[JSON::Field(key: "experiment")]
        getter experiment : String

        # The name or ARN of the project that contains the experiment that you want to update.

        @[JSON::Field(key: "project")]
        getter project : String

        # An optional description of the experiment.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An array of structures that defines the metrics used for the experiment, and whether a higher or
        # lower value for each metric is the goal.

        @[JSON::Field(key: "metricGoals")]
        getter metric_goals : Array(Types::MetricGoalConfig)?

        # A structure that contains the configuration of which variation o use as the "control" version. The
        # "control" version is used for comparison with other variations. This structure also specifies how
        # much experiment traffic is allocated to each variation.

        @[JSON::Field(key: "onlineAbConfig")]
        getter online_ab_config : Types::OnlineAbConfig?

        # When Evidently assigns a particular user session to an experiment, it must use a randomization ID to
        # determine which variation the user session is served. This randomization ID is a combination of the
        # entity ID and randomizationSalt . If you omit randomizationSalt , Evidently uses the experiment name
        # as the randomizationSalt .

        @[JSON::Field(key: "randomizationSalt")]
        getter randomization_salt : String?

        # Removes a segment from being used in an experiment. You can't use this parameter if the experiment
        # is currently running.

        @[JSON::Field(key: "removeSegment")]
        getter remove_segment : Bool?

        # The portion of the available audience that you want to allocate to this experiment, in thousandths
        # of a percent. The available audience is the total audience minus the audience that you have
        # allocated to overrides or current launches of this feature. This is represented in thousandths of a
        # percent. For example, specify 20,000 to allocate 20% of the available audience.

        @[JSON::Field(key: "samplingRate")]
        getter sampling_rate : Int64?

        # Adds an audience segment to an experiment. When a segment is used in an experiment, only user
        # sessions that match the segment pattern are used in the experiment. You can't use this parameter if
        # the experiment is currently running.

        @[JSON::Field(key: "segment")]
        getter segment : String?

        # An array of structures that define the variations being tested in the experiment.

        @[JSON::Field(key: "treatments")]
        getter treatments : Array(Types::TreatmentConfig)?

        def initialize(
          @experiment : String,
          @project : String,
          @description : String? = nil,
          @metric_goals : Array(Types::MetricGoalConfig)? = nil,
          @online_ab_config : Types::OnlineAbConfig? = nil,
          @randomization_salt : String? = nil,
          @remove_segment : Bool? = nil,
          @sampling_rate : Int64? = nil,
          @segment : String? = nil,
          @treatments : Array(Types::TreatmentConfig)? = nil
        )
        end
      end


      struct UpdateExperimentResponse
        include JSON::Serializable

        # A structure containing the configuration details of the experiment that was updated.

        @[JSON::Field(key: "experiment")]
        getter experiment : Types::Experiment

        def initialize(
          @experiment : Types::Experiment
        )
        end
      end


      struct UpdateFeatureRequest
        include JSON::Serializable

        # The name of the feature to be updated.

        @[JSON::Field(key: "feature")]
        getter feature : String

        # The name or ARN of the project that contains the feature to be updated.

        @[JSON::Field(key: "project")]
        getter project : String

        # To update variation configurations for this feature, or add new ones, specify this structure. In
        # this array, include any variations that you want to add or update. If the array includes a variation
        # name that already exists for this feature, it is updated. If it includes a new variation name, it is
        # added as a new variation.

        @[JSON::Field(key: "addOrUpdateVariations")]
        getter add_or_update_variations : Array(Types::VariationConfig)?

        # The name of the variation to use as the default variation. The default variation is served to users
        # who are not allocated to any ongoing launches or experiments of this feature.

        @[JSON::Field(key: "defaultVariation")]
        getter default_variation : String?

        # An optional description of the feature.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specified users that should always be served a specific variation of a feature. Each user is
        # specified by a key-value pair . For each key, specify a user by entering their user ID, account ID,
        # or some other identifier. For the value, specify the name of the variation that they are to be
        # served. This parameter is limited to 2500 overrides or a total of 40KB. The 40KB limit includes an
        # overhead of 6 bytes per override.

        @[JSON::Field(key: "entityOverrides")]
        getter entity_overrides : Hash(String, String)?

        # Specify ALL_RULES to activate the traffic allocation specified by any ongoing launches or
        # experiments. Specify DEFAULT_VARIATION to serve the default variation to all users instead.

        @[JSON::Field(key: "evaluationStrategy")]
        getter evaluation_strategy : String?

        # Removes a variation from the feature. If the variation you specify doesn't exist, then this makes no
        # change and does not report an error. This operation fails if you try to remove a variation that is
        # part of an ongoing launch or experiment.

        @[JSON::Field(key: "removeVariations")]
        getter remove_variations : Array(String)?

        def initialize(
          @feature : String,
          @project : String,
          @add_or_update_variations : Array(Types::VariationConfig)? = nil,
          @default_variation : String? = nil,
          @description : String? = nil,
          @entity_overrides : Hash(String, String)? = nil,
          @evaluation_strategy : String? = nil,
          @remove_variations : Array(String)? = nil
        )
        end
      end


      struct UpdateFeatureResponse
        include JSON::Serializable

        # A structure that contains information about the updated feature.

        @[JSON::Field(key: "feature")]
        getter feature : Types::Feature

        def initialize(
          @feature : Types::Feature
        )
        end
      end


      struct UpdateLaunchRequest
        include JSON::Serializable

        # The name of the launch that is to be updated.

        @[JSON::Field(key: "launch")]
        getter launch : String

        # The name or ARN of the project that contains the launch that you want to update.

        @[JSON::Field(key: "project")]
        getter project : String

        # An optional description for the launch.

        @[JSON::Field(key: "description")]
        getter description : String?

        # An array of structures that contains the feature and variations that are to be used for the launch.

        @[JSON::Field(key: "groups")]
        getter groups : Array(Types::LaunchGroupConfig)?

        # An array of structures that define the metrics that will be used to monitor the launch performance.

        @[JSON::Field(key: "metricMonitors")]
        getter metric_monitors : Array(Types::MetricMonitorConfig)?

        # When Evidently assigns a particular user session to a launch, it must use a randomization ID to
        # determine which variation the user session is served. This randomization ID is a combination of the
        # entity ID and randomizationSalt . If you omit randomizationSalt , Evidently uses the launch name as
        # the randomizationSalt .

        @[JSON::Field(key: "randomizationSalt")]
        getter randomization_salt : String?

        # An array of structures that define the traffic allocation percentages among the feature variations
        # during each step of the launch.

        @[JSON::Field(key: "scheduledSplitsConfig")]
        getter scheduled_splits_config : Types::ScheduledSplitsLaunchConfig?

        def initialize(
          @launch : String,
          @project : String,
          @description : String? = nil,
          @groups : Array(Types::LaunchGroupConfig)? = nil,
          @metric_monitors : Array(Types::MetricMonitorConfig)? = nil,
          @randomization_salt : String? = nil,
          @scheduled_splits_config : Types::ScheduledSplitsLaunchConfig? = nil
        )
        end
      end


      struct UpdateLaunchResponse
        include JSON::Serializable

        # A structure that contains the new configuration of the launch that was updated.

        @[JSON::Field(key: "launch")]
        getter launch : Types::Launch

        def initialize(
          @launch : Types::Launch
        )
        end
      end


      struct UpdateProjectDataDeliveryRequest
        include JSON::Serializable

        # The name or ARN of the project that you want to modify the data storage options for.

        @[JSON::Field(key: "project")]
        getter project : String

        # A structure containing the CloudWatch Logs log group where you want to store evaluation events.

        @[JSON::Field(key: "cloudWatchLogs")]
        getter cloud_watch_logs : Types::CloudWatchLogsDestinationConfig?

        # A structure containing the S3 bucket name and bucket prefix where you want to store evaluation
        # events.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3DestinationConfig?

        def initialize(
          @project : String,
          @cloud_watch_logs : Types::CloudWatchLogsDestinationConfig? = nil,
          @s3_destination : Types::S3DestinationConfig? = nil
        )
        end
      end


      struct UpdateProjectDataDeliveryResponse
        include JSON::Serializable

        # A structure containing details about the project that you updated.

        @[JSON::Field(key: "project")]
        getter project : Types::Project

        def initialize(
          @project : Types::Project
        )
        end
      end


      struct UpdateProjectRequest
        include JSON::Serializable

        # The name or ARN of the project to update.

        @[JSON::Field(key: "project")]
        getter project : String

        # Use this parameter if the project will use client-side evaluation powered by AppConfig. Client-side
        # evaluation allows your application to assign variations to user sessions locally instead of by
        # calling the EvaluateFeature operation. This mitigates the latency and availability risks that come
        # with an API call. allows you to This parameter is a structure that contains information about the
        # AppConfig application that will be used for client-side evaluation.

        @[JSON::Field(key: "appConfigResource")]
        getter app_config_resource : Types::ProjectAppConfigResourceConfig?

        # An optional description of the project.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @project : String,
          @app_config_resource : Types::ProjectAppConfigResourceConfig? = nil,
          @description : String? = nil
        )
        end
      end


      struct UpdateProjectResponse
        include JSON::Serializable

        # A structure containing information about the updated project.

        @[JSON::Field(key: "project")]
        getter project : Types::Project

        def initialize(
          @project : Types::Project
        )
        end
      end

      # The value of a parameter in the request caused an error.

      struct ValidationException
        include JSON::Serializable

        # The parameter that caused the exception.

        @[JSON::Field(key: "fieldList")]
        getter field_list : Array(Types::ValidationExceptionField)?


        @[JSON::Field(key: "message")]
        getter message : String?

        # A reason for the error.

        @[JSON::Field(key: "reason")]
        getter reason : String?

        def initialize(
          @field_list : Array(Types::ValidationExceptionField)? = nil,
          @message : String? = nil,
          @reason : String? = nil
        )
        end
      end

      # A structure containing an error name and message.

      struct ValidationExceptionField
        include JSON::Serializable

        # The error message.

        @[JSON::Field(key: "message")]
        getter message : String

        # The error name.

        @[JSON::Field(key: "name")]
        getter name : String

        def initialize(
          @message : String,
          @name : String
        )
        end
      end

      # The value assigned to a feature variation. This structure must contain exactly one field. It can be
      # boolValue , doubleValue , longValue , or stringValue .

      struct VariableValue
        include JSON::Serializable

        # If this feature uses the Boolean variation type, this field contains the Boolean value of this
        # variation.

        @[JSON::Field(key: "boolValue")]
        getter bool_value : Bool?

        # If this feature uses the double integer variation type, this field contains the double integer value
        # of this variation.

        @[JSON::Field(key: "doubleValue")]
        getter double_value : Float64?

        # If this feature uses the long variation type, this field contains the long value of this variation.

        @[JSON::Field(key: "longValue")]
        getter long_value : Int64?

        # If this feature uses the string variation type, this field contains the string value of this
        # variation.

        @[JSON::Field(key: "stringValue")]
        getter string_value : String?

        def initialize(
          @bool_value : Bool? = nil,
          @double_value : Float64? = nil,
          @long_value : Int64? = nil,
          @string_value : String? = nil
        )
        end
      end

      # This structure contains the name and variation value of one variation of a feature.

      struct Variation
        include JSON::Serializable

        # The name of the variation.

        @[JSON::Field(key: "name")]
        getter name : String?

        # The value assigned to this variation.

        @[JSON::Field(key: "value")]
        getter value : Types::VariableValue?

        def initialize(
          @name : String? = nil,
          @value : Types::VariableValue? = nil
        )
        end
      end

      # This structure contains the name and variation value of one variation of a feature.

      struct VariationConfig
        include JSON::Serializable

        # The name of the variation.

        @[JSON::Field(key: "name")]
        getter name : String

        # The value assigned to this variation.

        @[JSON::Field(key: "value")]
        getter value : Types::VariableValue

        def initialize(
          @name : String,
          @value : Types::VariableValue
        )
        end
      end
    end
  end
end
