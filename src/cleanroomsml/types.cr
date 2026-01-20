require "json"
require "time"

module Aws
  module CleanRoomsML
    module Types

      # An access budget that defines consumption limits for a specific resource within defined time
      # periods.

      struct AccessBudget
        include JSON::Serializable

        # The total remaining budget across all active budget periods for this resource.

        @[JSON::Field(key: "aggregateRemainingBudget")]
        getter aggregate_remaining_budget : Int32

        # A list of budget details for this resource. Contains active budget periods that apply to the
        # resource.

        @[JSON::Field(key: "details")]
        getter details : Array(Types::AccessBudgetDetails)

        # The Amazon Resource Name (ARN) of the resource that this access budget applies to.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @aggregate_remaining_budget : Int32,
          @details : Array(Types::AccessBudgetDetails),
          @resource_arn : String
        )
        end
      end

      # The detailed information for a specific budget period, including time boundaries and budget amounts.

      struct AccessBudgetDetails
        include JSON::Serializable

        # The total budget amount allocated for this period.

        @[JSON::Field(key: "budget")]
        getter budget : Int32

        # The type of budget period. Calendar-based types reset automatically at regular intervals, while
        # LIFETIME budgets never reset.

        @[JSON::Field(key: "budgetType")]
        getter budget_type : String

        # The amount of budget remaining in this period.

        @[JSON::Field(key: "remainingBudget")]
        getter remaining_budget : Int32

        # The start time of this budget period.

        @[JSON::Field(key: "startTime")]
        getter start_time : Time

        # Specifies whether this budget automatically refreshes when the current period ends.

        @[JSON::Field(key: "autoRefresh")]
        getter auto_refresh : String?

        # The end time of this budget period. If not specified, the budget period continues indefinitely.

        @[JSON::Field(key: "endTime")]
        getter end_time : Time?

        def initialize(
          @budget : Int32,
          @budget_type : String,
          @remaining_budget : Int32,
          @start_time : Time,
          @auto_refresh : String? = nil,
          @end_time : Time? = nil
        )
        end
      end

      # You do not have sufficient access to perform this action.

      struct AccessDeniedException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Defines the Amazon S3 bucket where the configured audience is stored.

      struct AudienceDestination
        include JSON::Serializable

        # The Amazon S3 bucket and path for the configured audience.

        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3ConfigMap

        def initialize(
          @s3_destination : Types::S3ConfigMap
        )
        end
      end

      # Provides information about the audience export job.

      struct AudienceExportJobSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job that was exported.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String


        @[JSON::Field(key: "audienceSize")]
        getter audience_size : Types::AudienceSize

        # The time at which the audience export job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the audience export job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the audience export job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the audience export job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the audience export job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon S3 bucket where the audience export is stored.

        @[JSON::Field(key: "outputLocation")]
        getter output_location : String?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        def initialize(
          @audience_generation_job_arn : String,
          @audience_size : Types::AudienceSize,
          @create_time : Time,
          @name : String,
          @status : String,
          @update_time : Time,
          @description : String? = nil,
          @output_location : String? = nil,
          @status_details : Types::StatusDetails? = nil
        )
        end
      end

      # Defines the Amazon S3 bucket where the seed audience for the generating audience is stored.

      struct AudienceGenerationJobDataSource
        include JSON::Serializable

        # The ARN of the IAM role that can read the Amazon S3 bucket where the seed audience is stored.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # Defines the Amazon S3 bucket where the seed audience for the generating audience is stored. A valid
        # data source is a JSON line file in the following format: {"user_id": "111111"} {"user_id": "222222"}
        # ...

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::S3ConfigMap?


        @[JSON::Field(key: "sqlComputeConfiguration")]
        getter sql_compute_configuration : Types::ComputeConfiguration?

        # The protected SQL query parameters.

        @[JSON::Field(key: "sqlParameters")]
        getter sql_parameters : Types::ProtectedQuerySQLParameters?

        def initialize(
          @role_arn : String,
          @data_source : Types::S3ConfigMap? = nil,
          @sql_compute_configuration : Types::ComputeConfiguration? = nil,
          @sql_parameters : Types::ProtectedQuerySQLParameters? = nil
        )
        end
      end

      # Provides information about the configured audience generation job.

      struct AudienceGenerationJobSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String

        # The Amazon Resource Name (ARN) of the configured audience model that was used for this audience
        # generation job.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the audience generation job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the audience generation job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the audience generation job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the audience generation job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The identifier of the collaboration that contains this audience generation job.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String?

        # The description of the audience generation job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The AWS Account that submitted the job.

        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        def initialize(
          @audience_generation_job_arn : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @name : String,
          @status : String,
          @update_time : Time,
          @collaboration_id : String? = nil,
          @description : String? = nil,
          @started_by : String? = nil
        )
        end
      end

      # Information about the audience model.

      struct AudienceModelSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        # The time at which the audience model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the audience model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the audience model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the training dataset that was used for the audience model.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        # The most recent time at which the audience model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @audience_model_arn : String,
          @create_time : Time,
          @name : String,
          @status : String,
          @training_dataset_arn : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Metrics that describe the quality of the generated audience.

      struct AudienceQualityMetrics
        include JSON::Serializable

        # The relevance scores of the generated audience.

        @[JSON::Field(key: "relevanceMetrics")]
        getter relevance_metrics : Array(Types::RelevanceMetric)

        # The recall score of the generated audience. Recall is the percentage of the most similar users (by
        # default, the most similar 20%) from a sample of the training data that are included in the seed
        # audience by the audience generation job. Values range from 0-1, larger values indicate a better
        # audience. A recall value approximately equal to the maximum bin size indicates that the audience
        # model is equivalent to random selection.

        @[JSON::Field(key: "recallMetric")]
        getter recall_metric : Float64?

        def initialize(
          @relevance_metrics : Array(Types::RelevanceMetric),
          @recall_metric : Float64? = nil
        )
        end
      end

      # The size of the generated audience. Must match one of the sizes in the configured audience model.

      struct AudienceSize
        include JSON::Serializable

        # Whether the audience size is defined in absolute terms or as a percentage. You can use the ABSOLUTE
        # AudienceSize to configure out audience sizes using the count of identifiers in the output. You can
        # use the Percentage AudienceSize to configure sizes in the range 1-100 percent.

        @[JSON::Field(key: "type")]
        getter type : String

        # Specify an audience size value.

        @[JSON::Field(key: "value")]
        getter value : Int32

        def initialize(
          @type : String,
          @value : Int32
        )
        end
      end

      # Returns the relevance scores at these audience sizes when used in the GetAudienceGenerationJob for a
      # specified audience generation job and configured audience model. Specifies the list of allowed
      # audienceSize values when used in the StartAudienceExportJob for an audience generation job. You can
      # use the ABSOLUTE AudienceSize to configure out audience sizes using the count of identifiers in the
      # output. You can use the Percentage AudienceSize to configure sizes in the range 1-100 percent.

      struct AudienceSizeConfig
        include JSON::Serializable

        # An array of the different audience output sizes.

        @[JSON::Field(key: "audienceSizeBins")]
        getter audience_size_bins : Array(Int32)

        # Whether the audience output sizes are defined as an absolute number or a percentage.

        @[JSON::Field(key: "audienceSizeType")]
        getter audience_size_type : String

        def initialize(
          @audience_size_bins : Array(Int32),
          @audience_size_type : String
        )
        end
      end


      struct CancelTrainedModelInferenceJobRequest
        include JSON::Serializable

        # The membership ID of the trained model inference job that you want to cancel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the trained model inference job that you want to cancel.

        @[JSON::Field(key: "trainedModelInferenceJobArn")]
        getter trained_model_inference_job_arn : String

        def initialize(
          @membership_identifier : String,
          @trained_model_inference_job_arn : String
        )
        end
      end


      struct CancelTrainedModelRequest
        include JSON::Serializable

        # The membership ID of the trained model job that you want to cancel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the trained model job that you want to cancel.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The version identifier of the trained model to cancel. This parameter allows you to specify which
        # version of the trained model you want to cancel when multiple versions exist. If versionIdentifier
        # is not specified, the base model will be cancelled.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @membership_identifier : String,
          @trained_model_arn : String,
          @version_identifier : String? = nil
        )
        end
      end

      # Provides summary information about a configured model algorithm in a collaboration.

      struct CollaborationConfiguredModelAlgorithmAssociationSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the configured model algorithm association.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm that is associated to the
        # collaboration.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the configured model algorithm association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the configured model algorithm association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured model algorithm association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured model algorithm association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_arn : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Provides summary information about an ML input channel in a collaboration.

      struct CollaborationMLInputChannelSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the ML input channel.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The associated configured model algorithms used to create the ML input channel.

        @[JSON::Field(key: "configuredModelAlgorithmAssociations")]
        getter configured_model_algorithm_associations : Array(String)

        # The time at which the ML input channel was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member who created the ML input channel.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the membership that contains the ML input channel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        # The name of the ML input channel.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the ML input channel.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the ML input channel was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ML input channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_associations : Array(String),
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @ml_input_channel_arn : String,
          @name : String,
          @status : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Provides summary information about a trained model export job in a collaboration.

      struct CollaborationTrainedModelExportJobSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model export job.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The time at which the trained model export job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member that created the trained model.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the member that created the trained model export job.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model export job.

        @[JSON::Field(key: "name")]
        getter name : String


        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::TrainedModelExportOutputConfiguration

        # The status of the trained model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model that is being exported.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The most recent time at which the trained model export job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the trained model.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The version identifier of the trained model that was exported in this job.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @name : String,
          @output_configuration : Types::TrainedModelExportOutputConfiguration,
          @status : String,
          @trained_model_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @status_details : Types::StatusDetails? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end

      # Provides summary information about a trained model inference job in a collaboration.

      struct CollaborationTrainedModelInferenceJobSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model inference job.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The time at which the trained model inference job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID that created the trained model inference job.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the membership that contains the trained model inference job.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model inference job.

        @[JSON::Field(key: "name")]
        getter name : String

        # Returns output configuration information for the trained model inference job.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::InferenceOutputConfiguration

        # The status of the trained model inference job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model that is used for the trained model inference
        # job.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The Amazon Resource Name (ARN) of the trained model inference job.

        @[JSON::Field(key: "trainedModelInferenceJobArn")]
        getter trained_model_inference_job_arn : String

        # The most recent time at which the trained model inference job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Amazon Resource Name (ARN) of the configured model algorithm association that is used for the
        # trained model inference job.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String?

        # The description of the trained model inference job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The trained model inference job logs status.

        @[JSON::Field(key: "logsStatus")]
        getter logs_status : String?

        # Details about the logs status for the trained model inference job.

        @[JSON::Field(key: "logsStatusDetails")]
        getter logs_status_details : String?

        # the trained model inference job metrics status.

        @[JSON::Field(key: "metricsStatus")]
        getter metrics_status : String?

        # Details about the metrics status for trained model inference job.

        @[JSON::Field(key: "metricsStatusDetails")]
        getter metrics_status_details : String?

        # The version identifier of the trained model that was used for inference in this job.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @name : String,
          @output_configuration : Types::InferenceOutputConfiguration,
          @status : String,
          @trained_model_arn : String,
          @trained_model_inference_job_arn : String,
          @update_time : Time,
          @configured_model_algorithm_association_arn : String? = nil,
          @description : String? = nil,
          @logs_status : String? = nil,
          @logs_status_details : String? = nil,
          @metrics_status : String? = nil,
          @metrics_status_details : String? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end

      # Provides summary information about a trained model in a collaboration.

      struct CollaborationTrainedModelSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association that is used for this
        # trained model.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the trained model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member that created the trained model.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the member that created the trained model.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the trained model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The most recent time at which the trained model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the trained model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about the incremental training data channels used to create this version of the trained
        # model.

        @[JSON::Field(key: "incrementalTrainingDataChannels")]
        getter incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)?

        # The version identifier of this trained model version.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @name : String,
          @status : String,
          @trained_model_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)? = nil,
          @version_identifier : String? = nil
        )
        end
      end

      # Contains classification information for data columns, including mappings that specify how columns
      # should be handled during synthetic data generation and privacy analysis.

      struct ColumnClassificationDetails
        include JSON::Serializable

        # A mapping that defines the classification of data columns for synthetic data generation and
        # specifies how each column should be handled during the privacy-preserving data synthesis process.

        @[JSON::Field(key: "columnMapping")]
        getter column_mapping : Array(Types::SyntheticDataColumnProperties)

        def initialize(
          @column_mapping : Array(Types::SyntheticDataColumnProperties)
        )
        end
      end

      # Metadata for a column.

      struct ColumnSchema
        include JSON::Serializable

        # The name of a column.

        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The data type of column.

        @[JSON::Field(key: "columnTypes")]
        getter column_types : Array(String)

        def initialize(
          @column_name : String,
          @column_types : Array(String)
        )
        end
      end

      # Provides configuration information for the instances that will perform the compute work.

      struct ComputeConfiguration
        include JSON::Serializable

        # The worker instances that will perform the compute work.

        @[JSON::Field(key: "worker")]
        getter worker : Types::WorkerComputeConfiguration?

        def initialize(
          @worker : Types::WorkerComputeConfiguration? = nil
        )
        end
      end

      # Configuration information necessary for the configure audience model output.

      struct ConfiguredAudienceModelOutputConfig
        include JSON::Serializable


        @[JSON::Field(key: "destination")]
        getter destination : Types::AudienceDestination

        # The ARN of the IAM role that can write the Amazon S3 bucket.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @destination : Types::AudienceDestination,
          @role_arn : String
        )
        end
      end

      # Information about the configured audience model.

      struct ConfiguredAudienceModelSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model that was used to create the configured audience
        # model.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        # The Amazon Resource Name (ARN) of the configured audience model that you are interested in.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the configured audience model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the configured audience model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The output configuration of the configured audience model.

        @[JSON::Field(key: "outputConfig")]
        getter output_config : Types::ConfiguredAudienceModelOutputConfig

        # The status of the configured audience model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the configured audience model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @audience_model_arn : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @name : String,
          @output_config : Types::ConfiguredAudienceModelOutputConfig,
          @status : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Provides summary information about the configured model algorithm association.

      struct ConfiguredModelAlgorithmAssociationSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the configured model algorithm association.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm that is being associated.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the configured model algorithm association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The membership ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the configured model algorithm association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured model algorithm association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured model algorithm association.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_arn : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @membership_identifier : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # Provides summary information about a configured model algorithm.

      struct ConfiguredModelAlgorithmSummary
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The time at which the configured model algorithm was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the configured model algorithm.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured model algorithm was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured model algorithm.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @configured_model_algorithm_arn : String,
          @create_time : Time,
          @name : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end

      # You can't complete this action because another resource depends on this resource.

      struct ConflictException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides configuration information for the dockerized container where the model algorithm is stored.

      struct ContainerConfig
        include JSON::Serializable

        # The registry path of the docker image that contains the algorithm. Clean Rooms ML currently only
        # supports the registry/repository[:tag] image path format. For more information about using images in
        # Clean Rooms ML, see the Sagemaker API reference .

        @[JSON::Field(key: "imageUri")]
        getter image_uri : String

        # The arguments for a container used to run a training job. See How Amazon SageMaker Runs Your
        # Training Image for additional information. For more information, see How Sagemaker runs your
        # training image .

        @[JSON::Field(key: "arguments")]
        getter arguments : Array(String)?

        # The entrypoint script for a Docker container used to run a training job. This script takes
        # precedence over the default train processing instructions. See How Amazon SageMaker Runs Your
        # Training Image for additional information. For more information, see How Sagemaker runs your
        # training image .

        @[JSON::Field(key: "entrypoint")]
        getter entrypoint : Array(String)?

        # A list of metric definition objects. Each object specifies the metric name and regular expressions
        # used to parse algorithm logs. Amazon Web Services Clean Rooms ML publishes each metric to all
        # members' Amazon CloudWatch using IAM role configured in PutMLConfiguration .

        @[JSON::Field(key: "metricDefinitions")]
        getter metric_definitions : Array(Types::MetricDefinition)?

        def initialize(
          @image_uri : String,
          @arguments : Array(String)? = nil,
          @entrypoint : Array(String)? = nil,
          @metric_definitions : Array(Types::MetricDefinition)? = nil
        )
        end
      end


      struct CreateAudienceModelRequest
        include JSON::Serializable

        # The name of the audience model resource.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the training dataset for this audience model.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        # The description of the audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the trained ML model and the associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The end date and time of the training window.

        @[JSON::Field(key: "trainingDataEndTime")]
        getter training_data_end_time : Time?

        # The start date and time of the training window.

        @[JSON::Field(key: "trainingDataStartTime")]
        getter training_data_start_time : Time?

        def initialize(
          @name : String,
          @training_dataset_arn : String,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @training_data_end_time : Time? = nil,
          @training_data_start_time : Time? = nil
        )
        end
      end


      struct CreateAudienceModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        def initialize(
          @audience_model_arn : String
        )
        end
      end


      struct CreateConfiguredAudienceModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model to use for the configured audience model.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        # The name of the configured audience model.

        @[JSON::Field(key: "name")]
        getter name : String

        # Configure the Amazon S3 location and IAM Role for audiences created using this configured audience
        # model. Each audience will have a unique location. The IAM Role must have s3:PutObject permission on
        # the destination Amazon S3 location. If the destination is protected with Amazon S3 KMS-SSE, then the
        # Role must also have the required KMS permissions.

        @[JSON::Field(key: "outputConfig")]
        getter output_config : Types::ConfiguredAudienceModelOutputConfig

        # Whether audience metrics are shared.

        @[JSON::Field(key: "sharedAudienceMetrics")]
        getter shared_audience_metrics : Array(String)

        # Configure the list of output sizes of audiences that can be created using this configured audience
        # model. A request to StartAudienceGenerationJob that uses this configured audience model must have an
        # audienceSize selected from this list. You can use the ABSOLUTE AudienceSize to configure out
        # audience sizes using the count of identifiers in the output. You can use the Percentage AudienceSize
        # to configure sizes in the range 1-100 percent.

        @[JSON::Field(key: "audienceSizeConfig")]
        getter audience_size_config : Types::AudienceSizeConfig?

        # Configure how the service tags audience generation jobs created using this configured audience
        # model. If you specify NONE , the tags from the StartAudienceGenerationJob request determine the tags
        # of the audience generation job. If you specify FROM_PARENT_RESOURCE , the audience generation job
        # inherits the tags from the configured audience model, by default. Tags in the
        # StartAudienceGenerationJob will override the default. When the client is in a different account than
        # the configured audience model, the tags from the client are never applied to a resource in the
        # caller's account.

        @[JSON::Field(key: "childResourceTagOnCreatePolicy")]
        getter child_resource_tag_on_create_policy : String?

        # The description of the configured audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The minimum number of users from the seed audience that must match with users in the training data
        # of the audience model. The default value is 500.

        @[JSON::Field(key: "minMatchingSeedSize")]
        getter min_matching_seed_size : Int32?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @audience_model_arn : String,
          @name : String,
          @output_config : Types::ConfiguredAudienceModelOutputConfig,
          @shared_audience_metrics : Array(String),
          @audience_size_config : Types::AudienceSizeConfig? = nil,
          @child_resource_tag_on_create_policy : String? = nil,
          @description : String? = nil,
          @min_matching_seed_size : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConfiguredAudienceModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        def initialize(
          @configured_audience_model_arn : String
        )
        end
      end


      struct CreateConfiguredModelAlgorithmAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm that you want to associate.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The membership ID of the member who is associating this configured model algorithm.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the configured model algorithm association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the configured model algorithm association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Specifies the privacy configuration information for the configured model algorithm association. This
        # information includes the maximum data size that can be exported.

        @[JSON::Field(key: "privacyConfiguration")]
        getter privacy_configuration : Types::PrivacyConfiguration?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configured_model_algorithm_arn : String,
          @membership_identifier : String,
          @name : String,
          @description : String? = nil,
          @privacy_configuration : Types::PrivacyConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateConfiguredModelAlgorithmAssociationResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm association.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        def initialize(
          @configured_model_algorithm_association_arn : String
        )
        end
      end


      struct CreateConfiguredModelAlgorithmRequest
        include JSON::Serializable

        # The name of the configured model algorithm.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the role that is used to access the repository.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The description of the configured model algorithm.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration information for the inference container that is used when you run an inference job on
        # a configured model algorithm.

        @[JSON::Field(key: "inferenceContainerConfig")]
        getter inference_container_config : Types::InferenceContainerConfig?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the configured ML model algorithm and associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Configuration information for the training container, including entrypoints and arguments.

        @[JSON::Field(key: "trainingContainerConfig")]
        getter training_container_config : Types::ContainerConfig?

        def initialize(
          @name : String,
          @role_arn : String,
          @description : String? = nil,
          @inference_container_config : Types::InferenceContainerConfig? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @training_container_config : Types::ContainerConfig? = nil
        )
        end
      end


      struct CreateConfiguredModelAlgorithmResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        def initialize(
          @configured_model_algorithm_arn : String
        )
        end
      end


      struct CreateMLInputChannelRequest
        include JSON::Serializable

        # The associated configured model algorithms that are necessary to create this ML input channel.

        @[JSON::Field(key: "configuredModelAlgorithmAssociations")]
        getter configured_model_algorithm_associations : Array(String)

        # The input data that is used to create this ML input channel.

        @[JSON::Field(key: "inputChannel")]
        getter input_channel : Types::InputChannel

        # The membership ID of the member that is creating the ML input channel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the ML input channel.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of days that the data in the ML input channel is retained.

        @[JSON::Field(key: "retentionInDays")]
        getter retention_in_days : Int32

        # The description of the ML input channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the KMS key that is used to access the input channel.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configured_model_algorithm_associations : Array(String),
          @input_channel : Types::InputChannel,
          @membership_identifier : String,
          @name : String,
          @retention_in_days : Int32,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateMLInputChannelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ML input channel.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        def initialize(
          @ml_input_channel_arn : String
        )
        end
      end


      struct CreateTrainedModelRequest
        include JSON::Serializable

        # The associated configured model algorithm used to train this model.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # Defines the data channels that are used as input for the trained model request. Limit: Maximum of 20
        # channels total (including both dataChannels and incrementalTrainingDataChannels ).

        @[JSON::Field(key: "dataChannels")]
        getter data_channels : Array(Types::ModelTrainingDataChannel)

        # The membership ID of the member that is creating the trained model.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model.

        @[JSON::Field(key: "name")]
        getter name : String

        # Information about the EC2 resources that are used to train this model.

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::ResourceConfig

        # The description of the trained model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The environment variables to set in the Docker container.

        @[JSON::Field(key: "environment")]
        getter environment : Hash(String, String)?

        # Algorithm-specific parameters that influence the quality of the model. You set hyperparameters
        # before you start the learning process.

        @[JSON::Field(key: "hyperparameters")]
        getter hyperparameters : Hash(String, String)?

        # Specifies the incremental training data channels for the trained model. Incremental training allows
        # you to create a new trained model with updates without retraining from scratch. You can specify up
        # to one incremental training data channel that references a previously trained model and its version.
        # Limit: Maximum of 20 channels total (including both incrementalTrainingDataChannels and dataChannels
        # ).

        @[JSON::Field(key: "incrementalTrainingDataChannels")]
        getter incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannel)?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the trained ML model and the associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The criteria that is used to stop model training.

        @[JSON::Field(key: "stoppingCondition")]
        getter stopping_condition : Types::StoppingCondition?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The input mode for accessing the training data. This parameter determines how the training data is
        # made available to the training algorithm. Valid values are: File - The training data is downloaded
        # to the training instance and made available as files. FastFile - The training data is streamed
        # directly from Amazon S3 to the training algorithm, providing faster access for large datasets. Pipe
        # - The training data is streamed to the training algorithm using named pipes, which can improve
        # performance for certain algorithms.

        @[JSON::Field(key: "trainingInputMode")]
        getter training_input_mode : String?

        def initialize(
          @configured_model_algorithm_association_arn : String,
          @data_channels : Array(Types::ModelTrainingDataChannel),
          @membership_identifier : String,
          @name : String,
          @resource_config : Types::ResourceConfig,
          @description : String? = nil,
          @environment : Hash(String, String)? = nil,
          @hyperparameters : Hash(String, String)? = nil,
          @incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannel)? = nil,
          @kms_key_arn : String? = nil,
          @stopping_condition : Types::StoppingCondition? = nil,
          @tags : Hash(String, String)? = nil,
          @training_input_mode : String? = nil
        )
        end
      end


      struct CreateTrainedModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trained model.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The unique version identifier assigned to the newly created trained model. This identifier can be
        # used to reference this specific version of the trained model in subsequent operations such as
        # inference jobs or incremental training. The initial version identifier for the base version of the
        # trained model is "NULL".

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @trained_model_arn : String,
          @version_identifier : String? = nil
        )
        end
      end


      struct CreateTrainingDatasetRequest
        include JSON::Serializable

        # The name of the training dataset. This name must be unique in your account and region.

        @[JSON::Field(key: "name")]
        getter name : String

        # The ARN of the IAM role that Clean Rooms ML can assume to read the data referred to in the
        # dataSource field of each dataset. Passing a role across AWS accounts is not allowed. If you pass a
        # role that isn't in your account, you get an AccessDeniedException error.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # An array of information that lists the Dataset objects, which specifies the dataset type and details
        # on its location and schema. You must provide a role that has read access to these tables.

        @[JSON::Field(key: "trainingData")]
        getter training_data : Array(Types::Dataset)

        # The description of the training dataset.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @name : String,
          @role_arn : String,
          @training_data : Array(Types::Dataset),
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct CreateTrainingDatasetResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the training dataset resource.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        def initialize(
          @training_dataset_arn : String
        )
        end
      end

      # The configuration for defining custom patterns to be redacted from logs and error messages. This is
      # for the CUSTOM config under entitiesToRedact. Both CustomEntityConfig and entitiesToRedact need to
      # be present or not present.

      struct CustomEntityConfig
        include JSON::Serializable

        # Defines data identifiers for the custom entity configuration. Provide this only if CUSTOM redaction
        # is configured.

        @[JSON::Field(key: "customDataIdentifiers")]
        getter custom_data_identifiers : Array(String)

        def initialize(
          @custom_data_identifiers : Array(String)
        )
        end
      end

      # Privacy evaluation scores that measure the privacy characteristics of the generated synthetic data,
      # including assessments of potential privacy risks such as membership inference attacks.

      struct DataPrivacyScores
        include JSON::Serializable

        # Scores that evaluate the vulnerability of the synthetic data to membership inference attacks, which
        # attempt to determine whether a specific individual was a member of the original dataset.

        @[JSON::Field(key: "membershipInferenceAttackScores")]
        getter membership_inference_attack_scores : Array(Types::MembershipInferenceAttackScore)

        def initialize(
          @membership_inference_attack_scores : Array(Types::MembershipInferenceAttackScore)
        )
        end
      end

      # Defines information about the Glue data source that contains the training data.

      struct DataSource
        include JSON::Serializable

        # A GlueDataSource object that defines the catalog ID, database name, and table name for the training
        # data.

        @[JSON::Field(key: "glueDataSource")]
        getter glue_data_source : Types::GlueDataSource

        def initialize(
          @glue_data_source : Types::GlueDataSource
        )
        end
      end

      # Defines where the training dataset is located, what type of data it contains, and how to access the
      # data.

      struct Dataset
        include JSON::Serializable

        # A DatasetInputConfig object that defines the data source and schema mapping.

        @[JSON::Field(key: "inputConfig")]
        getter input_config : Types::DatasetInputConfig

        # What type of information is found in the dataset.

        @[JSON::Field(key: "type")]
        getter type : String

        def initialize(
          @input_config : Types::DatasetInputConfig,
          @type : String
        )
        end
      end

      # Defines the Glue data source and schema mapping information.

      struct DatasetInputConfig
        include JSON::Serializable

        # A DataSource object that specifies the Glue data source for the training data.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::DataSource

        # The schema information for the training data.

        @[JSON::Field(key: "schema")]
        getter schema : Array(Types::ColumnSchema)

        def initialize(
          @data_source : Types::DataSource,
          @schema : Array(Types::ColumnSchema)
        )
        end
      end


      struct DeleteAudienceGenerationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job that you want to delete.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String

        def initialize(
          @audience_generation_job_arn : String
        )
        end
      end


      struct DeleteAudienceModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model that you want to delete.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        def initialize(
          @audience_model_arn : String
        )
        end
      end


      struct DeleteConfiguredAudienceModelPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model policy that you want to delete.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        def initialize(
          @configured_audience_model_arn : String
        )
        end
      end


      struct DeleteConfiguredAudienceModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that you want to delete.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        def initialize(
          @configured_audience_model_arn : String
        )
        end
      end


      struct DeleteConfiguredModelAlgorithmAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm association that you want to
        # delete.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The membership ID of the member that is deleting the configured model algorithm association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @configured_model_algorithm_association_arn : String,
          @membership_identifier : String
        )
        end
      end


      struct DeleteConfiguredModelAlgorithmRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm that you want to delete.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        def initialize(
          @configured_model_algorithm_arn : String
        )
        end
      end


      struct DeleteMLConfigurationRequest
        include JSON::Serializable

        # The membership ID of the of the member that is deleting the ML modeling configuration.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @membership_identifier : String
        )
        end
      end


      struct DeleteMLInputChannelDataRequest
        include JSON::Serializable

        # The membership ID of the membership that contains the ML input channel you want to delete.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel that you want to delete.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        def initialize(
          @membership_identifier : String,
          @ml_input_channel_arn : String
        )
        end
      end


      struct DeleteTrainedModelOutputRequest
        include JSON::Serializable

        # The membership ID of the member that is deleting the trained model output.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the trained model whose output you want to delete.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The version identifier of the trained model to delete. If not specified, the operation will delete
        # the base version of the trained model. When specified, only the particular version will be deleted.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @membership_identifier : String,
          @trained_model_arn : String,
          @version_identifier : String? = nil
        )
        end
      end


      struct DeleteTrainingDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the training dataset that you want to delete.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        def initialize(
          @training_dataset_arn : String
        )
        end
      end

      # The Amazon S3 location where the exported model artifacts are stored.

      struct Destination
        include JSON::Serializable


        @[JSON::Field(key: "s3Destination")]
        getter s3_destination : Types::S3ConfigMap

        def initialize(
          @s3_destination : Types::S3ConfigMap
        )
        end
      end


      struct GetAudienceGenerationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job that you are interested in.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String

        def initialize(
          @audience_generation_job_arn : String
        )
        end
      end


      struct GetAudienceGenerationJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String

        # The Amazon Resource Name (ARN) of the configured audience model used for this audience generation
        # job.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the audience generation job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the audience generation job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the audience generation job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the audience generation job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The identifier of the collaboration that this audience generation job is associated with.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String?

        # The description of the audience generation job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configure whether the seed users are included in the output audience. By default, Clean Rooms ML
        # removes seed users from the output audience. If you specify TRUE , the seed users will appear first
        # in the output. Clean Rooms ML does not explicitly reveal whether a user was in the seed, but the
        # recipient of the audience will know that the first minimumSeedSize count of users are from the seed.

        @[JSON::Field(key: "includeSeedInOutput")]
        getter include_seed_in_output : Bool?

        # The relevance scores for different audience sizes and the recall score of the generated audience.

        @[JSON::Field(key: "metrics")]
        getter metrics : Types::AudienceQualityMetrics?

        # The unique identifier of the protected query for this audience generation job.

        @[JSON::Field(key: "protectedQueryIdentifier")]
        getter protected_query_identifier : String?

        # The seed audience that was used for this audience generation job. This field will be null if the
        # account calling the API is the account that started this audience generation job.

        @[JSON::Field(key: "seedAudience")]
        getter seed_audience : Types::AudienceGenerationJobDataSource?

        # The AWS account that started this audience generation job.

        @[JSON::Field(key: "startedBy")]
        getter started_by : String?

        # Details about the status of the audience generation job.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The tags that are associated to this audience generation job.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @audience_generation_job_arn : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @name : String,
          @status : String,
          @update_time : Time,
          @collaboration_id : String? = nil,
          @description : String? = nil,
          @include_seed_in_output : Bool? = nil,
          @metrics : Types::AudienceQualityMetrics? = nil,
          @protected_query_identifier : String? = nil,
          @seed_audience : Types::AudienceGenerationJobDataSource? = nil,
          @started_by : String? = nil,
          @status_details : Types::StatusDetails? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetAudienceModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model that you are interested in.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        def initialize(
          @audience_model_arn : String
        )
        end
      end


      struct GetAudienceModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        # The time at which the audience model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the audience model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the audience model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the training dataset that was used for this audience model.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        # The most recent time at which the audience model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The KMS key ARN used for the audience model.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # Details about the status of the audience model.

        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The tags that are assigned to the audience model.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The end date specified for the training window.

        @[JSON::Field(key: "trainingDataEndTime")]
        getter training_data_end_time : Time?

        # The start date specified for the training window.

        @[JSON::Field(key: "trainingDataStartTime")]
        getter training_data_start_time : Time?

        def initialize(
          @audience_model_arn : String,
          @create_time : Time,
          @name : String,
          @status : String,
          @training_dataset_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @status_details : Types::StatusDetails? = nil,
          @tags : Hash(String, String)? = nil,
          @training_data_end_time : Time? = nil,
          @training_data_start_time : Time? = nil
        )
        end
      end


      struct GetCollaborationConfiguredModelAlgorithmAssociationRequest
        include JSON::Serializable

        # The collaboration ID for the collaboration that contains the configured model algorithm association
        # that you want to return information about.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association that you want to return
        # information about.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_association_arn : String
        )
        end
      end


      struct GetCollaborationConfiguredModelAlgorithmAssociationResponse
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the configured model algorithm association.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the configured model algorithm association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the configured model algorithm association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured model algorithm association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured model algorithm association.

        @[JSON::Field(key: "description")]
        getter description : String?


        @[JSON::Field(key: "privacyConfiguration")]
        getter privacy_configuration : Types::PrivacyConfiguration?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_arn : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @privacy_configuration : Types::PrivacyConfiguration? = nil
        )
        end
      end


      struct GetCollaborationMLInputChannelRequest
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the ML input channel that you want to get.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel that you want to get.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        def initialize(
          @collaboration_identifier : String,
          @ml_input_channel_arn : String
        )
        end
      end


      struct GetCollaborationMLInputChannelResponse
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the ML input channel.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The configured model algorithm associations that were used to create the ML input channel.

        @[JSON::Field(key: "configuredModelAlgorithmAssociations")]
        getter configured_model_algorithm_associations : Array(String)

        # The time at which the ML input channel was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member who created the ML input channel.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the membership that contains the ML input channel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        # The name of the ML input channel.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of days to retain the data for the ML input channel.

        @[JSON::Field(key: "retentionInDays")]
        getter retention_in_days : Int32

        # The status of the ML input channel.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the ML input channel was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ML input channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The number of records in the ML input channel.

        @[JSON::Field(key: "numberOfRecords")]
        getter number_of_records : Int64?

        # Returns the privacy budgets that control access to this Clean Rooms ML input channel. Use these
        # budgets to monitor and limit resource consumption over specified time periods.

        @[JSON::Field(key: "privacyBudgets")]
        getter privacy_budgets : Types::PrivacyBudgets?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The synthetic data configuration for this ML input channel, including parameters for generating
        # privacy-preserving synthetic data and evaluation scores for measuring the privacy of the generated
        # data.

        @[JSON::Field(key: "syntheticDataConfiguration")]
        getter synthetic_data_configuration : Types::SyntheticDataConfiguration?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_associations : Array(String),
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @ml_input_channel_arn : String,
          @name : String,
          @retention_in_days : Int32,
          @status : String,
          @update_time : Time,
          @description : String? = nil,
          @number_of_records : Int64? = nil,
          @privacy_budgets : Types::PrivacyBudgets? = nil,
          @status_details : Types::StatusDetails? = nil,
          @synthetic_data_configuration : Types::SyntheticDataConfiguration? = nil
        )
        end
      end


      struct GetCollaborationTrainedModelRequest
        include JSON::Serializable

        # The collaboration ID that contains the trained model that you want to return information about.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the trained model that you want to return information about.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The version identifier of the trained model to retrieve. If not specified, the operation returns
        # information about the latest version of the trained model.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @trained_model_arn : String,
          @version_identifier : String? = nil
        )
        end
      end


      struct GetCollaborationTrainedModelResponse
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association that was used to create
        # this trained model.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the trained model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The account ID of the member that created the trained model.

        @[JSON::Field(key: "creatorAccountId")]
        getter creator_account_id : String

        # The membership ID of the member that created the trained model.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the trained model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The most recent time at which the trained model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the trained model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about the incremental training data channels used to create this version of the trained
        # model. This includes details about the base model that was used for incremental training and the
        # channel configuration.

        @[JSON::Field(key: "incrementalTrainingDataChannels")]
        getter incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)?

        # Status information for the logs.

        @[JSON::Field(key: "logsStatus")]
        getter logs_status : String?

        # Details about the status information for the logs.

        @[JSON::Field(key: "logsStatusDetails")]
        getter logs_status_details : String?

        # The status of the model metrics.

        @[JSON::Field(key: "metricsStatus")]
        getter metrics_status : String?

        # Details about the status information for the model metrics.

        @[JSON::Field(key: "metricsStatusDetails")]
        getter metrics_status_details : String?

        # The EC2 resource configuration that was used to train this model.

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::ResourceConfig?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The stopping condition that determined when model training ended.

        @[JSON::Field(key: "stoppingCondition")]
        getter stopping_condition : Types::StoppingCondition?

        # Information about the training container image.

        @[JSON::Field(key: "trainingContainerImageDigest")]
        getter training_container_image_digest : String?

        # The input mode that was used for accessing the training data when this trained model was created.
        # This indicates how the training data was made available to the training algorithm.

        @[JSON::Field(key: "trainingInputMode")]
        getter training_input_mode : String?

        # The version identifier of the trained model. This unique identifier distinguishes this version from
        # other versions of the same trained model.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @creator_account_id : String,
          @membership_identifier : String,
          @name : String,
          @status : String,
          @trained_model_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)? = nil,
          @logs_status : String? = nil,
          @logs_status_details : String? = nil,
          @metrics_status : String? = nil,
          @metrics_status_details : String? = nil,
          @resource_config : Types::ResourceConfig? = nil,
          @status_details : Types::StatusDetails? = nil,
          @stopping_condition : Types::StoppingCondition? = nil,
          @training_container_image_digest : String? = nil,
          @training_input_mode : String? = nil,
          @version_identifier : String? = nil
        )
        end
      end


      struct GetConfiguredAudienceModelPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that you are interested in.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        def initialize(
          @configured_audience_model_arn : String
        )
        end
      end


      struct GetConfiguredAudienceModelPolicyResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The configured audience model policy. This is a JSON IAM resource policy.

        @[JSON::Field(key: "configuredAudienceModelPolicy")]
        getter configured_audience_model_policy : String

        # A cryptographic hash of the contents of the policy used to prevent unexpected concurrent
        # modification of the policy.

        @[JSON::Field(key: "policyHash")]
        getter policy_hash : String

        def initialize(
          @configured_audience_model_arn : String,
          @configured_audience_model_policy : String,
          @policy_hash : String
        )
        end
      end


      struct GetConfiguredAudienceModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that you are interested in.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        def initialize(
          @configured_audience_model_arn : String
        )
        end
      end


      struct GetConfiguredAudienceModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience model used for this configured audience model.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String

        # The Amazon Resource Name (ARN) of the configured audience model.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The time at which the configured audience model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the configured audience model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The output configuration of the configured audience model

        @[JSON::Field(key: "outputConfig")]
        getter output_config : Types::ConfiguredAudienceModelOutputConfig

        # Whether audience metrics are shared.

        @[JSON::Field(key: "sharedAudienceMetrics")]
        getter shared_audience_metrics : Array(String)

        # The status of the configured audience model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the configured audience model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The list of output sizes of audiences that can be created using this configured audience model. A
        # request to StartAudienceGenerationJob that uses this configured audience model must have an
        # audienceSize selected from this list. You can use the ABSOLUTE AudienceSize to configure out
        # audience sizes using the count of identifiers in the output. You can use the Percentage AudienceSize
        # to configure sizes in the range 1-100 percent.

        @[JSON::Field(key: "audienceSizeConfig")]
        getter audience_size_config : Types::AudienceSizeConfig?

        # Provides the childResourceTagOnCreatePolicy that was used for this configured audience model.

        @[JSON::Field(key: "childResourceTagOnCreatePolicy")]
        getter child_resource_tag_on_create_policy : String?

        # The description of the configured audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The minimum number of users from the seed audience that must match with users in the training data
        # of the audience model.

        @[JSON::Field(key: "minMatchingSeedSize")]
        getter min_matching_seed_size : Int32?

        # The tags that are associated to this configured audience model.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @audience_model_arn : String,
          @configured_audience_model_arn : String,
          @create_time : Time,
          @name : String,
          @output_config : Types::ConfiguredAudienceModelOutputConfig,
          @shared_audience_metrics : Array(String),
          @status : String,
          @update_time : Time,
          @audience_size_config : Types::AudienceSizeConfig? = nil,
          @child_resource_tag_on_create_policy : String? = nil,
          @description : String? = nil,
          @min_matching_seed_size : Int32? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetConfiguredModelAlgorithmAssociationRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm association that you want to return
        # information about.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The membership ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @configured_model_algorithm_association_arn : String,
          @membership_identifier : String
        )
        end
      end


      struct GetConfiguredModelAlgorithmAssociationResponse
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the configured model algorithm association.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm that was associated to the
        # collaboration.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the configured model algorithm association was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The membership ID of the member that created the configured model algorithm association.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the configured model algorithm association.

        @[JSON::Field(key: "name")]
        getter name : String

        # The most recent time at which the configured model algorithm association was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured model algorithm association.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The privacy configuration information for the configured model algorithm association.

        @[JSON::Field(key: "privacyConfiguration")]
        getter privacy_configuration : Types::PrivacyConfiguration?

        # The optional metadata that you applied to the resource to help you categorize and organize them.
        # Each tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_arn : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @membership_identifier : String,
          @name : String,
          @update_time : Time,
          @description : String? = nil,
          @privacy_configuration : Types::PrivacyConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetConfiguredModelAlgorithmRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm that you want to return information
        # about.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        def initialize(
          @configured_model_algorithm_arn : String
        )
        end
      end


      struct GetConfiguredModelAlgorithmResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured model algorithm.

        @[JSON::Field(key: "configuredModelAlgorithmArn")]
        getter configured_model_algorithm_arn : String

        # The time at which the configured model algorithm was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the configured model algorithm.

        @[JSON::Field(key: "name")]
        getter name : String

        # The Amazon Resource Name (ARN) of the service role that was used to create the configured model
        # algorithm.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The most recent time at which the configured model algorithm was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the configured model algorithm.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Configuration information for the inference container.

        @[JSON::Field(key: "inferenceContainerConfig")]
        getter inference_container_config : Types::InferenceContainerConfig?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the configured ML model and associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The optional metadata that you applied to the resource to help you categorize and organize them.
        # Each tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The configuration information of the training container for the configured model algorithm.

        @[JSON::Field(key: "trainingContainerConfig")]
        getter training_container_config : Types::ContainerConfig?

        def initialize(
          @configured_model_algorithm_arn : String,
          @create_time : Time,
          @name : String,
          @role_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @inference_container_config : Types::InferenceContainerConfig? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @training_container_config : Types::ContainerConfig? = nil
        )
        end
      end


      struct GetMLConfigurationRequest
        include JSON::Serializable

        # The membership ID of the member that owns the ML configuration you want to return information about.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @membership_identifier : String
        )
        end
      end


      struct GetMLConfigurationResponse
        include JSON::Serializable

        # The time at which the ML configuration was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The Amazon S3 location where ML model output is stored.

        @[JSON::Field(key: "defaultOutputLocation")]
        getter default_output_location : Types::MLOutputConfiguration

        # The membership ID of the member that owns the ML configuration you requested.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The most recent time at which the ML configuration was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        def initialize(
          @create_time : Time,
          @default_output_location : Types::MLOutputConfiguration,
          @membership_identifier : String,
          @update_time : Time
        )
        end
      end


      struct GetMLInputChannelRequest
        include JSON::Serializable

        # The membership ID of the membership that contains the ML input channel that you want to get.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel that you want to get.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        def initialize(
          @membership_identifier : String,
          @ml_input_channel_arn : String
        )
        end
      end


      struct GetMLInputChannelResponse
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the ML input channel.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The configured model algorithm associations that were used to create the ML input channel.

        @[JSON::Field(key: "configuredModelAlgorithmAssociations")]
        getter configured_model_algorithm_associations : Array(String)

        # The time at which the ML input channel was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The input channel that was used to create the ML input channel.

        @[JSON::Field(key: "inputChannel")]
        getter input_channel : Types::InputChannel

        # The membership ID of the membership that contains the ML input channel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        # The name of the ML input channel.

        @[JSON::Field(key: "name")]
        getter name : String

        # The number of days to keep the data in the ML input channel.

        @[JSON::Field(key: "retentionInDays")]
        getter retention_in_days : Int32

        # The status of the ML input channel.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the ML input channel was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ML input channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The Amazon Resource Name (ARN) of the KMS key that was used to create the ML input channel.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The number of files in the ML input channel.

        @[JSON::Field(key: "numberOfFiles")]
        getter number_of_files : Float64?

        # The number of records in the ML input channel.

        @[JSON::Field(key: "numberOfRecords")]
        getter number_of_records : Int64?

        # Returns the privacy budgets that control access to this Clean Rooms ML input channel. Use these
        # budgets to monitor and limit resource consumption over specified time periods.

        @[JSON::Field(key: "privacyBudgets")]
        getter privacy_budgets : Types::PrivacyBudgets?

        # The ID of the protected query that was used to create the ML input channel.

        @[JSON::Field(key: "protectedQueryIdentifier")]
        getter protected_query_identifier : String?

        # The size, in GB, of the ML input channel.

        @[JSON::Field(key: "sizeInGb")]
        getter size_in_gb : Float64?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The synthetic data configuration for this ML input channel, including parameters for generating
        # privacy-preserving synthetic data and evaluation scores for measuring the privacy of the generated
        # data.

        @[JSON::Field(key: "syntheticDataConfiguration")]
        getter synthetic_data_configuration : Types::SyntheticDataConfiguration?

        # The optional metadata that you applied to the resource to help you categorize and organize them.
        # Each tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_associations : Array(String),
          @create_time : Time,
          @input_channel : Types::InputChannel,
          @membership_identifier : String,
          @ml_input_channel_arn : String,
          @name : String,
          @retention_in_days : Int32,
          @status : String,
          @update_time : Time,
          @description : String? = nil,
          @kms_key_arn : String? = nil,
          @number_of_files : Float64? = nil,
          @number_of_records : Int64? = nil,
          @privacy_budgets : Types::PrivacyBudgets? = nil,
          @protected_query_identifier : String? = nil,
          @size_in_gb : Float64? = nil,
          @status_details : Types::StatusDetails? = nil,
          @synthetic_data_configuration : Types::SyntheticDataConfiguration? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct GetTrainedModelInferenceJobRequest
        include JSON::Serializable

        # Provides the membership ID of the membership that contains the trained model inference job that you
        # are interested in.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # Provides the Amazon Resource Name (ARN) of the trained model inference job that you are interested
        # in.

        @[JSON::Field(key: "trainedModelInferenceJobArn")]
        getter trained_model_inference_job_arn : String

        def initialize(
          @membership_identifier : String,
          @trained_model_inference_job_arn : String
        )
        end
      end


      struct GetTrainedModelInferenceJobResponse
        include JSON::Serializable

        # The time at which the trained model inference job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The data source that was used for the trained model inference job.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::ModelInferenceDataSource

        # The membership ID of the membership that contains the trained model inference job.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model inference job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The output configuration information for the trained model inference job.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::InferenceOutputConfiguration

        # The resource configuration information for the trained model inference job.

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::InferenceResourceConfig

        # The status of the trained model inference job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) for the trained model that was used for the trained model inference
        # job.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The Amazon Resource Name (ARN) of the trained model inference job.

        @[JSON::Field(key: "trainedModelInferenceJobArn")]
        getter trained_model_inference_job_arn : String

        # The most recent time at which the trained model inference job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Amazon Resource Name (ARN) of the configured model algorithm association that was used for the
        # trained model inference job.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String?

        # The execution parameters for the model inference job container.

        @[JSON::Field(key: "containerExecutionParameters")]
        getter container_execution_parameters : Types::InferenceContainerExecutionParameters?

        # The description of the trained model inference job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The environment variables to set in the Docker container.

        @[JSON::Field(key: "environment")]
        getter environment : Hash(String, String)?

        # Information about the training container image.

        @[JSON::Field(key: "inferenceContainerImageDigest")]
        getter inference_container_image_digest : String?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the ML inference job and associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The logs status for the trained model inference job.

        @[JSON::Field(key: "logsStatus")]
        getter logs_status : String?

        # Details about the logs status for the trained model inference job.

        @[JSON::Field(key: "logsStatusDetails")]
        getter logs_status_details : String?

        # The metrics status for the trained model inference job.

        @[JSON::Field(key: "metricsStatus")]
        getter metrics_status : String?

        # Details about the metrics status for the trained model inference job.

        @[JSON::Field(key: "metricsStatusDetails")]
        getter metrics_status_details : String?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The optional metadata that you applied to the resource to help you categorize and organize them.
        # Each tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The version identifier of the trained model used for this inference job. This identifies the
        # specific version of the trained model that was used to generate the inference results.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @create_time : Time,
          @data_source : Types::ModelInferenceDataSource,
          @membership_identifier : String,
          @name : String,
          @output_configuration : Types::InferenceOutputConfiguration,
          @resource_config : Types::InferenceResourceConfig,
          @status : String,
          @trained_model_arn : String,
          @trained_model_inference_job_arn : String,
          @update_time : Time,
          @configured_model_algorithm_association_arn : String? = nil,
          @container_execution_parameters : Types::InferenceContainerExecutionParameters? = nil,
          @description : String? = nil,
          @environment : Hash(String, String)? = nil,
          @inference_container_image_digest : String? = nil,
          @kms_key_arn : String? = nil,
          @logs_status : String? = nil,
          @logs_status_details : String? = nil,
          @metrics_status : String? = nil,
          @metrics_status_details : String? = nil,
          @status_details : Types::StatusDetails? = nil,
          @tags : Hash(String, String)? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end


      struct GetTrainedModelRequest
        include JSON::Serializable

        # The membership ID of the member that created the trained model that you are interested in.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the trained model that you are interested in.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The version identifier of the trained model to retrieve. If not specified, the operation returns
        # information about the latest version of the trained model.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @membership_identifier : String,
          @trained_model_arn : String,
          @version_identifier : String? = nil
        )
        end
      end


      struct GetTrainedModelResponse
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association that was used to create
        # the trained model.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the trained model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The data channels that were used for the trained model.

        @[JSON::Field(key: "dataChannels")]
        getter data_channels : Array(Types::ModelTrainingDataChannel)

        # The membership ID of the member that created the trained model.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the trained model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The most recent time at which the trained model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the trained model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The EC2 environment that was used to create the trained model.

        @[JSON::Field(key: "environment")]
        getter environment : Hash(String, String)?

        # The hyperparameters that were used to create the trained model.

        @[JSON::Field(key: "hyperparameters")]
        getter hyperparameters : Hash(String, String)?

        # Information about the incremental training data channels used to create this version of the trained
        # model. This includes details about the base model that was used for incremental training and the
        # channel configuration.

        @[JSON::Field(key: "incrementalTrainingDataChannels")]
        getter incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the trained ML model and associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The logs status for the trained model.

        @[JSON::Field(key: "logsStatus")]
        getter logs_status : String?

        # Details about the logs status for the trained model.

        @[JSON::Field(key: "logsStatusDetails")]
        getter logs_status_details : String?

        # The status of the model metrics.

        @[JSON::Field(key: "metricsStatus")]
        getter metrics_status : String?

        # Details about the metrics status for the trained model.

        @[JSON::Field(key: "metricsStatusDetails")]
        getter metrics_status_details : String?

        # The EC2 resource configuration that was used to create the trained model.

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::ResourceConfig?


        @[JSON::Field(key: "statusDetails")]
        getter status_details : Types::StatusDetails?

        # The stopping condition that was used to terminate model training.

        @[JSON::Field(key: "stoppingCondition")]
        getter stopping_condition : Types::StoppingCondition?

        # The optional metadata that you applied to the resource to help you categorize and organize them.
        # Each tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # Information about the training image container.

        @[JSON::Field(key: "trainingContainerImageDigest")]
        getter training_container_image_digest : String?

        # The input mode that was used for accessing the training data when this trained model was created.
        # This indicates how the training data was made available to the training algorithm.

        @[JSON::Field(key: "trainingInputMode")]
        getter training_input_mode : String?

        # The version identifier of the trained model. This unique identifier distinguishes this version from
        # other versions of the same trained model.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @data_channels : Array(Types::ModelTrainingDataChannel),
          @membership_identifier : String,
          @name : String,
          @status : String,
          @trained_model_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @environment : Hash(String, String)? = nil,
          @hyperparameters : Hash(String, String)? = nil,
          @incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)? = nil,
          @kms_key_arn : String? = nil,
          @logs_status : String? = nil,
          @logs_status_details : String? = nil,
          @metrics_status : String? = nil,
          @metrics_status_details : String? = nil,
          @resource_config : Types::ResourceConfig? = nil,
          @status_details : Types::StatusDetails? = nil,
          @stopping_condition : Types::StoppingCondition? = nil,
          @tags : Hash(String, String)? = nil,
          @training_container_image_digest : String? = nil,
          @training_input_mode : String? = nil,
          @version_identifier : String? = nil
        )
        end
      end


      struct GetTrainingDatasetRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the training dataset that you are interested in.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        def initialize(
          @training_dataset_arn : String
        )
        end
      end


      struct GetTrainingDatasetResponse
        include JSON::Serializable

        # The time at which the training dataset was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the training dataset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The IAM role used to read the training data.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The status of the training dataset.

        @[JSON::Field(key: "status")]
        getter status : String

        # Metadata about the requested training data.

        @[JSON::Field(key: "trainingData")]
        getter training_data : Array(Types::Dataset)

        # The Amazon Resource Name (ARN) of the training dataset.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        # The most recent time at which the training dataset was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the training dataset.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The tags that are assigned to this training dataset.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @create_time : Time,
          @name : String,
          @role_arn : String,
          @status : String,
          @training_data : Array(Types::Dataset),
          @training_dataset_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end

      # Defines the Glue data source that contains the training data.

      struct GlueDataSource
        include JSON::Serializable

        # The Glue database that contains the training data.

        @[JSON::Field(key: "databaseName")]
        getter database_name : String

        # The Glue table that contains the training data.

        @[JSON::Field(key: "tableName")]
        getter table_name : String

        # The Glue catalog that contains the training data.

        @[JSON::Field(key: "catalogId")]
        getter catalog_id : String?

        def initialize(
          @database_name : String,
          @table_name : String,
          @catalog_id : String? = nil
        )
        end
      end

      # Defines an incremental training data channel that references a previously trained model. Incremental
      # training allows you to update an existing trained model with new data, building upon the knowledge
      # from a base model rather than training from scratch. This can significantly reduce training time and
      # computational costs while improving model performance with additional data.

      struct IncrementalTrainingDataChannel
        include JSON::Serializable

        # The name of the incremental training data channel. This name is used to identify the channel during
        # the training process and must be unique within the training job.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The Amazon Resource Name (ARN) of the base trained model to use for incremental training. This model
        # serves as the starting point for the incremental training process.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The version identifier of the base trained model to use for incremental training. If not specified,
        # the latest version of the trained model is used.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @channel_name : String,
          @trained_model_arn : String,
          @version_identifier : String? = nil
        )
        end
      end

      # Contains information about an incremental training data channel that was used to create a trained
      # model. This structure provides details about the base model and channel configuration used during
      # incremental training.

      struct IncrementalTrainingDataChannelOutput
        include JSON::Serializable

        # The name of the incremental training data channel that was used.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The name of the base trained model that was used for incremental training.

        @[JSON::Field(key: "modelName")]
        getter model_name : String

        # The version identifier of the trained model that was used for incremental training.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @channel_name : String,
          @model_name : String,
          @version_identifier : String? = nil
        )
        end
      end

      # Provides configuration information for the inference container.

      struct InferenceContainerConfig
        include JSON::Serializable

        # The registry path of the docker image that contains the inference algorithm. Clean Rooms ML
        # currently only supports the registry/repository[:tag] image path format. For more information about
        # using images in Clean Rooms ML, see the Sagemaker API reference .

        @[JSON::Field(key: "imageUri")]
        getter image_uri : String

        def initialize(
          @image_uri : String
        )
        end
      end

      # Provides execution parameters for the inference container.

      struct InferenceContainerExecutionParameters
        include JSON::Serializable

        # The maximum size of the inference container payload, specified in MB.

        @[JSON::Field(key: "maxPayloadInMB")]
        getter max_payload_in_mb : Int32?

        def initialize(
          @max_payload_in_mb : Int32? = nil
        )
        end
      end

      # Configuration information about how the inference output is stored.

      struct InferenceOutputConfiguration
        include JSON::Serializable

        # Defines the members that can receive inference output.

        @[JSON::Field(key: "members")]
        getter members : Array(Types::InferenceReceiverMember)

        # The MIME type used to specify the output data.

        @[JSON::Field(key: "accept")]
        getter accept : String?

        def initialize(
          @members : Array(Types::InferenceReceiverMember),
          @accept : String? = nil
        )
        end
      end

      # Defines who will receive inference results.

      struct InferenceReceiverMember
        include JSON::Serializable

        # The account ID of the member that can receive inference results.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Defines the resources used to perform model inference.

      struct InferenceResourceConfig
        include JSON::Serializable

        # The type of instance that is used to perform model inference.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The number of instances to use.

        @[JSON::Field(key: "instanceCount")]
        getter instance_count : Int32?

        def initialize(
          @instance_type : String,
          @instance_count : Int32? = nil
        )
        end
      end

      # Provides information about the data source that is used to create an ML input channel.

      struct InputChannel
        include JSON::Serializable

        # The data source that is used to create the ML input channel.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::InputChannelDataSource

        # The Amazon Resource Name (ARN) of the role used to run the query specified in the dataSource field
        # of the input channel. Passing a role across AWS accounts is not allowed. If you pass a role that
        # isn't in your account, you get an AccessDeniedException error.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        def initialize(
          @data_source : Types::InputChannelDataSource,
          @role_arn : String
        )
        end
      end

      # Provides the data source that is used to define an input channel.

      struct InputChannelDataSource
        include JSON::Serializable


        @[JSON::Field(key: "protectedQueryInputParameters")]
        getter protected_query_input_parameters : Types::ProtectedQueryInputParameters?

        def initialize(
          @protected_query_input_parameters : Types::ProtectedQueryInputParameters? = nil
        )
        end
      end

      # An internal service error occurred. Retry your request. If the problem persists, contact AWS
      # Support.

      struct InternalServiceException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end


      struct ListAudienceExportJobsRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job that you are interested in.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String?

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @audience_generation_job_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAudienceExportJobsResponse
        include JSON::Serializable

        # The audience export jobs that match the request.

        @[JSON::Field(key: "audienceExportJobs")]
        getter audience_export_jobs : Array(Types::AudienceExportJobSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @audience_export_jobs : Array(Types::AudienceExportJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAudienceGenerationJobsRequest
        include JSON::Serializable

        # The identifier of the collaboration that contains the audience generation jobs that you are
        # interested in.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String?

        # The Amazon Resource Name (ARN) of the configured audience model that was used for the audience
        # generation jobs that you are interested in.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String?

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_id : String? = nil,
          @configured_audience_model_arn : String? = nil,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAudienceGenerationJobsResponse
        include JSON::Serializable

        # The audience generation jobs that match the request.

        @[JSON::Field(key: "audienceGenerationJobs")]
        getter audience_generation_jobs : Array(Types::AudienceGenerationJobSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @audience_generation_jobs : Array(Types::AudienceGenerationJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListAudienceModelsRequest
        include JSON::Serializable

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListAudienceModelsResponse
        include JSON::Serializable

        # The audience models that match the request.

        @[JSON::Field(key: "audienceModels")]
        getter audience_models : Array(Types::AudienceModelSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @audience_models : Array(Types::AudienceModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationConfiguredModelAlgorithmAssociationsRequest
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the configured model algorithm associations
        # that you are interested in.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationConfiguredModelAlgorithmAssociationsResponse
        include JSON::Serializable

        # The configured model algorithm associations that belong to this collaboration.

        @[JSON::Field(key: "collaborationConfiguredModelAlgorithmAssociations")]
        getter collaboration_configured_model_algorithm_associations : Array(Types::CollaborationConfiguredModelAlgorithmAssociationSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_configured_model_algorithm_associations : Array(Types::CollaborationConfiguredModelAlgorithmAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationMLInputChannelsRequest
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the ML input channels that you want to list.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum number of results to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationMLInputChannelsResponse
        include JSON::Serializable

        # The list of ML input channels that you wanted.

        @[JSON::Field(key: "collaborationMLInputChannelsList")]
        getter collaboration_ml_input_channels_list : Array(Types::CollaborationMLInputChannelSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_ml_input_channels_list : Array(Types::CollaborationMLInputChannelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationTrainedModelExportJobsRequest
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model export jobs that you are
        # interested in.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the trained model that was used to create the export jobs that you
        # are interested in.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The version identifier of the trained model to filter export jobs by. When specified, only export
        # jobs for this specific version of the trained model are returned.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @trained_model_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end


      struct ListCollaborationTrainedModelExportJobsResponse
        include JSON::Serializable

        # The exports jobs that exist for the requested trained model in the requested collaboration.

        @[JSON::Field(key: "collaborationTrainedModelExportJobs")]
        getter collaboration_trained_model_export_jobs : Array(Types::CollaborationTrainedModelExportJobSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_trained_model_export_jobs : Array(Types::CollaborationTrainedModelExportJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationTrainedModelInferenceJobsRequest
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model inference jobs that you
        # are interested in.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of the trained model that was used to create the trained model
        # inference jobs that you are interested in.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String?

        # The version identifier of the trained model to filter inference jobs by. When specified, only
        # inference jobs that used this specific version of the trained model are returned.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @trained_model_arn : String? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end


      struct ListCollaborationTrainedModelInferenceJobsResponse
        include JSON::Serializable

        # The trained model inference jobs that you are interested in.

        @[JSON::Field(key: "collaborationTrainedModelInferenceJobs")]
        getter collaboration_trained_model_inference_jobs : Array(Types::CollaborationTrainedModelInferenceJobSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_trained_model_inference_jobs : Array(Types::CollaborationTrainedModelInferenceJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationTrainedModelsRequest
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained models you are interested in.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListCollaborationTrainedModelsResponse
        include JSON::Serializable

        # The trained models in the collaboration that you requested.

        @[JSON::Field(key: "collaborationTrainedModels")]
        getter collaboration_trained_models : Array(Types::CollaborationTrainedModelSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @collaboration_trained_models : Array(Types::CollaborationTrainedModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredAudienceModelsRequest
        include JSON::Serializable

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredAudienceModelsResponse
        include JSON::Serializable

        # The configured audience models.

        @[JSON::Field(key: "configuredAudienceModels")]
        getter configured_audience_models : Array(Types::ConfiguredAudienceModelSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configured_audience_models : Array(Types::ConfiguredAudienceModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredModelAlgorithmAssociationsRequest
        include JSON::Serializable

        # The membership ID of the member that created the configured model algorithm associations you are
        # interested in.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredModelAlgorithmAssociationsResponse
        include JSON::Serializable

        # The list of configured model algorithm associations.

        @[JSON::Field(key: "configuredModelAlgorithmAssociations")]
        getter configured_model_algorithm_associations : Array(Types::ConfiguredModelAlgorithmAssociationSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configured_model_algorithm_associations : Array(Types::ConfiguredModelAlgorithmAssociationSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredModelAlgorithmsRequest
        include JSON::Serializable

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListConfiguredModelAlgorithmsResponse
        include JSON::Serializable

        # The list of configured model algorithms.

        @[JSON::Field(key: "configuredModelAlgorithms")]
        getter configured_model_algorithms : Array(Types::ConfiguredModelAlgorithmSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @configured_model_algorithms : Array(Types::ConfiguredModelAlgorithmSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListMLInputChannelsRequest
        include JSON::Serializable

        # The membership ID of the membership that contains the ML input channels that you want to list.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum number of ML input channels to return.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListMLInputChannelsResponse
        include JSON::Serializable

        # The list of ML input channels that you wanted.

        @[JSON::Field(key: "mlInputChannelsList")]
        getter ml_input_channels_list : Array(Types::MLInputChannelSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @ml_input_channels_list : Array(Types::MLInputChannelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTagsForResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you are interested in.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        def initialize(
          @resource_arn : String
        )
        end
      end


      struct ListTagsForResourceResponse
        include JSON::Serializable

        # The tags that are associated with the resource.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)

        def initialize(
          @tags : Hash(String, String)
        )
        end
      end


      struct ListTrainedModelInferenceJobsRequest
        include JSON::Serializable

        # The membership

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # The Amazon Resource Name (ARN) of a trained model that was used to create the trained model
        # inference jobs that you are interested in.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String?

        # The version identifier of the trained model to filter inference jobs by. When specified, only
        # inference jobs that used this specific version of the trained model are returned.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @trained_model_arn : String? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end


      struct ListTrainedModelInferenceJobsResponse
        include JSON::Serializable

        # Returns the requested trained model inference jobs.

        @[JSON::Field(key: "trainedModelInferenceJobs")]
        getter trained_model_inference_jobs : Array(Types::TrainedModelInferenceJobSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @trained_model_inference_jobs : Array(Types::TrainedModelInferenceJobSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTrainedModelVersionsRequest
        include JSON::Serializable

        # The membership identifier for the collaboration that contains the trained model.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the trained model for which to list versions.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The maximum number of trained model versions to return in a single page. The default value is 10,
        # and the maximum value is 100.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The pagination token from a previous ListTrainedModelVersions request. Use this token to retrieve
        # the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        # Filter the results to only include trained model versions with the specified status. Valid values
        # include CREATE_PENDING , CREATE_IN_PROGRESS , ACTIVE , CREATE_FAILED , and others.

        @[JSON::Field(key: "status")]
        getter status : String?

        def initialize(
          @membership_identifier : String,
          @trained_model_arn : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil,
          @status : String? = nil
        )
        end
      end


      struct ListTrainedModelVersionsResponse
        include JSON::Serializable

        # A list of trained model versions that match the specified criteria. Each entry contains summary
        # information about a trained model version, including its version identifier, status, and creation
        # details.

        @[JSON::Field(key: "trainedModels")]
        getter trained_models : Array(Types::TrainedModelSummary)

        # The pagination token to use in a subsequent ListTrainedModelVersions request to retrieve the next
        # page of results. This value is null when there are no more results to return.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @trained_models : Array(Types::TrainedModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTrainedModelsRequest
        include JSON::Serializable

        # The membership ID of the member that created the trained models you are interested in.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @membership_identifier : String,
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTrainedModelsResponse
        include JSON::Serializable

        # The list of trained models.

        @[JSON::Field(key: "trainedModels")]
        getter trained_models : Array(Types::TrainedModelSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @trained_models : Array(Types::TrainedModelSummary),
          @next_token : String? = nil
        )
        end
      end


      struct ListTrainingDatasetsRequest
        include JSON::Serializable

        # The maximum size of the results that is returned per call.

        @[JSON::Field(key: "maxResults")]
        getter max_results : Int32?

        # The token value retrieved from a previous call to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @max_results : Int32? = nil,
          @next_token : String? = nil
        )
        end
      end


      struct ListTrainingDatasetsResponse
        include JSON::Serializable

        # The training datasets that match the request.

        @[JSON::Field(key: "trainingDatasets")]
        getter training_datasets : Array(Types::TrainingDatasetSummary)

        # The token value used to access the next page of results.

        @[JSON::Field(key: "nextToken")]
        getter next_token : String?

        def initialize(
          @training_datasets : Array(Types::TrainingDatasetSummary),
          @next_token : String? = nil
        )
        end
      end

      # The configuration for log redaction.

      struct LogRedactionConfiguration
        include JSON::Serializable

        # Specifies the entities to be redacted from logs. Entities to redact are
        # "ALL_PERSONALLY_IDENTIFIABLE_INFORMATION", "NUMBERS","CUSTOM". If CUSTOM is supplied or configured,
        # custom patterns (customDataIdentifiers) should be provided, and the patterns will be redacted in
        # logs or error messages.

        @[JSON::Field(key: "entitiesToRedact")]
        getter entities_to_redact : Array(String)

        # Specifies the configuration for custom entities in the context of log redaction.

        @[JSON::Field(key: "customEntityConfig")]
        getter custom_entity_config : Types::CustomEntityConfig?

        def initialize(
          @entities_to_redact : Array(String),
          @custom_entity_config : Types::CustomEntityConfig? = nil
        )
        end
      end

      # Provides the information necessary for a user to access the logs.

      struct LogsConfigurationPolicy
        include JSON::Serializable

        # A list of account IDs that are allowed to access the logs.

        @[JSON::Field(key: "allowedAccountIds")]
        getter allowed_account_ids : Array(String)

        # A regular expression pattern that is used to parse the logs and return information that matches the
        # pattern.

        @[JSON::Field(key: "filterPattern")]
        getter filter_pattern : String?

        # Specifies the log redaction configuration for this policy.

        @[JSON::Field(key: "logRedactionConfiguration")]
        getter log_redaction_configuration : Types::LogRedactionConfiguration?

        # Specifies the type of log this policy applies to. The currently supported policies are ALL or
        # ERROR_SUMMARY.

        @[JSON::Field(key: "logType")]
        getter log_type : String?

        def initialize(
          @allowed_account_ids : Array(String),
          @filter_pattern : String? = nil,
          @log_redaction_configuration : Types::LogRedactionConfiguration? = nil,
          @log_type : String? = nil
        )
        end
      end

      # Provides summary information about the ML input channel.

      struct MLInputChannelSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the ML input channel.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The associated configured model algorithms used to create the ML input channel.

        @[JSON::Field(key: "configuredModelAlgorithmAssociations")]
        getter configured_model_algorithm_associations : Array(String)

        # The time at which the ML input channel was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The membership ID of the membership that contains the ML input channel.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The Amazon Resource Name (ARN) of the ML input channel.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        # The name of the ML input channel.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the ML input channel.

        @[JSON::Field(key: "status")]
        getter status : String

        # The most recent time at which the ML input channel was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the ML input channel.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The ID of the protected query that was used to create the ML input channel.

        @[JSON::Field(key: "protectedQueryIdentifier")]
        getter protected_query_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_associations : Array(String),
          @create_time : Time,
          @membership_identifier : String,
          @ml_input_channel_arn : String,
          @name : String,
          @status : String,
          @update_time : Time,
          @description : String? = nil,
          @protected_query_identifier : String? = nil
        )
        end
      end

      # Configuration information about how the exported model artifacts are stored.

      struct MLOutputConfiguration
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the service access role that is used to store the model artifacts.

        @[JSON::Field(key: "roleArn")]
        getter role_arn : String

        # The Amazon S3 location where exported model artifacts are stored.

        @[JSON::Field(key: "destination")]
        getter destination : Types::Destination?

        def initialize(
          @role_arn : String,
          @destination : Types::Destination? = nil
        )
        end
      end

      # Parameters that control the generation of synthetic data for custom model training, including
      # privacy settings and column classification details.

      struct MLSyntheticDataParameters
        include JSON::Serializable

        # The epsilon value for differential privacy, which controls the privacy-utility tradeoff in synthetic
        # data generation. Lower values provide stronger privacy guarantees but may reduce data utility.

        @[JSON::Field(key: "epsilon")]
        getter epsilon : Float64

        # The maximum acceptable score for membership inference attack vulnerability. Synthetic data
        # generation fails if the score for the resulting data exceeds this threshold.

        @[JSON::Field(key: "maxMembershipInferenceAttackScore")]
        getter max_membership_inference_attack_score : Float64

        # Classification details for data columns that specify how each column should be treated during
        # synthetic data generation.

        @[JSON::Field(key: "columnClassification")]
        getter column_classification : Types::ColumnClassificationDetails?

        def initialize(
          @epsilon : Float64,
          @max_membership_inference_attack_score : Float64,
          @column_classification : Types::ColumnClassificationDetails? = nil
        )
        end
      end

      # A score that measures the vulnerability of synthetic data to membership inference attacks and
      # provides both the numerical score and the version of the attack methodology used for evaluation.

      struct MembershipInferenceAttackScore
        include JSON::Serializable

        # The version of the membership inference attack, which consists of the attack type and its version
        # number, used to generate this privacy score.

        @[JSON::Field(key: "attackVersion")]
        getter attack_version : String

        # The numerical score representing the vulnerability to membership inference attacks.

        @[JSON::Field(key: "score")]
        getter score : Float64

        def initialize(
          @attack_version : String,
          @score : Float64
        )
        end
      end

      # Information about the model metric that is reported for a trained model.

      struct MetricDefinition
        include JSON::Serializable

        # The name of the model metric.

        @[JSON::Field(key: "name")]
        getter name : String

        # The regular expression statement that defines how the model metric is reported.

        @[JSON::Field(key: "regex")]
        getter regex : String

        def initialize(
          @name : String,
          @regex : String
        )
        end
      end

      # Provides the configuration policy for metrics generation.

      struct MetricsConfigurationPolicy
        include JSON::Serializable

        # The noise level for the generated metrics.

        @[JSON::Field(key: "noiseLevel")]
        getter noise_level : String

        def initialize(
          @noise_level : String
        )
        end
      end

      # Defines information about the data source used for model inference.

      struct ModelInferenceDataSource
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the ML input channel for this model inference data source.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        def initialize(
          @ml_input_channel_arn : String
        )
        end
      end

      # Information about the model training data channel. A training data channel is a named data source
      # that the training algorithms can consume.

      struct ModelTrainingDataChannel
        include JSON::Serializable

        # The name of the training data channel.

        @[JSON::Field(key: "channelName")]
        getter channel_name : String

        # The Amazon Resource Name (ARN) of the ML input channel for this model training data channel.

        @[JSON::Field(key: "mlInputChannelArn")]
        getter ml_input_channel_arn : String

        # Specifies how the training data stored in Amazon S3 should be distributed to training instances.
        # This parameter controls the data distribution strategy for the training job: FullyReplicated - The
        # entire dataset is replicated on each training instance. This is suitable for smaller datasets and
        # algorithms that require access to the complete dataset. ShardedByS3Key - The dataset is distributed
        # across training instances based on Amazon S3 key names. This is suitable for larger datasets and
        # distributed training scenarios where each instance processes a subset of the data.

        @[JSON::Field(key: "s3DataDistributionType")]
        getter s3_data_distribution_type : String?

        def initialize(
          @channel_name : String,
          @ml_input_channel_arn : String,
          @s3_data_distribution_type : String? = nil
        )
        end
      end

      # The privacy budget information that controls access to Clean Rooms ML input channels.

      struct PrivacyBudgets
        include JSON::Serializable

        # A list of access budgets that apply to resources associated with this Clean Rooms ML input channel.

        @[JSON::Field(key: "accessBudgets")]
        getter access_budgets : Array(Types::AccessBudget)?

        def initialize(
          @access_budgets : Array(Types::AccessBudget)? = nil
        )
        end
      end

      # Information about the privacy configuration for a configured model algorithm association.

      struct PrivacyConfiguration
        include JSON::Serializable

        # The privacy configuration policies for a configured model algorithm association.

        @[JSON::Field(key: "policies")]
        getter policies : Types::PrivacyConfigurationPolicies

        def initialize(
          @policies : Types::PrivacyConfigurationPolicies
        )
        end
      end

      # Information about the privacy configuration policies for a configured model algorithm association.

      struct PrivacyConfigurationPolicies
        include JSON::Serializable

        # Specifies who will receive the trained model export.

        @[JSON::Field(key: "trainedModelExports")]
        getter trained_model_exports : Types::TrainedModelExportsConfigurationPolicy?

        # Specifies who will receive the trained model inference jobs.

        @[JSON::Field(key: "trainedModelInferenceJobs")]
        getter trained_model_inference_jobs : Types::TrainedModelInferenceJobsConfigurationPolicy?

        # Specifies who will receive the trained models.

        @[JSON::Field(key: "trainedModels")]
        getter trained_models : Types::TrainedModelsConfigurationPolicy?

        def initialize(
          @trained_model_exports : Types::TrainedModelExportsConfigurationPolicy? = nil,
          @trained_model_inference_jobs : Types::TrainedModelInferenceJobsConfigurationPolicy? = nil,
          @trained_models : Types::TrainedModelsConfigurationPolicy? = nil
        )
        end
      end

      # Provides information necessary to perform the protected query.

      struct ProtectedQueryInputParameters
        include JSON::Serializable


        @[JSON::Field(key: "sqlParameters")]
        getter sql_parameters : Types::ProtectedQuerySQLParameters

        # Provides configuration information for the workers that will perform the protected query.

        @[JSON::Field(key: "computeConfiguration")]
        getter compute_configuration : Types::ComputeConfiguration?

        # The format in which the query results should be returned. If not specified, defaults to CSV .

        @[JSON::Field(key: "resultFormat")]
        getter result_format : String?

        def initialize(
          @sql_parameters : Types::ProtectedQuerySQLParameters,
          @compute_configuration : Types::ComputeConfiguration? = nil,
          @result_format : String? = nil
        )
        end
      end

      # The parameters for the SQL type Protected Query.

      struct ProtectedQuerySQLParameters
        include JSON::Serializable

        # The Amazon Resource Name (ARN) associated with the analysis template within a collaboration.

        @[JSON::Field(key: "analysisTemplateArn")]
        getter analysis_template_arn : String?

        # The protected query SQL parameters.

        @[JSON::Field(key: "parameters")]
        getter parameters : Hash(String, String)?

        # The query string to be submitted.

        @[JSON::Field(key: "queryString")]
        getter query_string : String?

        def initialize(
          @analysis_template_arn : String? = nil,
          @parameters : Hash(String, String)? = nil,
          @query_string : String? = nil
        )
        end
      end


      struct PutConfiguredAudienceModelPolicyRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that the resource policy will
        # govern.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The IAM resource policy.

        @[JSON::Field(key: "configuredAudienceModelPolicy")]
        getter configured_audience_model_policy : String

        # Use this to prevent unexpected concurrent modification of the policy.

        @[JSON::Field(key: "policyExistenceCondition")]
        getter policy_existence_condition : String?

        # A cryptographic hash of the contents of the policy used to prevent unexpected concurrent
        # modification of the policy.

        @[JSON::Field(key: "previousPolicyHash")]
        getter previous_policy_hash : String?

        def initialize(
          @configured_audience_model_arn : String,
          @configured_audience_model_policy : String,
          @policy_existence_condition : String? = nil,
          @previous_policy_hash : String? = nil
        )
        end
      end


      struct PutConfiguredAudienceModelPolicyResponse
        include JSON::Serializable

        # The IAM resource policy.

        @[JSON::Field(key: "configuredAudienceModelPolicy")]
        getter configured_audience_model_policy : String

        # A cryptographic hash of the contents of the policy used to prevent unexpected concurrent
        # modification of the policy.

        @[JSON::Field(key: "policyHash")]
        getter policy_hash : String

        def initialize(
          @configured_audience_model_policy : String,
          @policy_hash : String
        )
        end
      end


      struct PutMLConfigurationRequest
        include JSON::Serializable

        # The default Amazon S3 location where ML output is stored for the specified member.

        @[JSON::Field(key: "defaultOutputLocation")]
        getter default_output_location : Types::MLOutputConfiguration

        # The membership ID of the member that is being configured.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        def initialize(
          @default_output_location : Types::MLOutputConfiguration,
          @membership_identifier : String
        )
        end
      end

      # The relevance score of a generated audience.

      struct RelevanceMetric
        include JSON::Serializable


        @[JSON::Field(key: "audienceSize")]
        getter audience_size : Types::AudienceSize

        # The relevance score of the generated audience.

        @[JSON::Field(key: "score")]
        getter score : Float64?

        def initialize(
          @audience_size : Types::AudienceSize,
          @score : Float64? = nil
        )
        end
      end

      # Information about the EC2 resources that are used to train the model.

      struct ResourceConfig
        include JSON::Serializable

        # The instance type that is used to train the model.

        @[JSON::Field(key: "instanceType")]
        getter instance_type : String

        # The volume size of the instance that is used to train the model. Please see EC2 volume limit for
        # volume size limitations on different instance types.

        @[JSON::Field(key: "volumeSizeInGB")]
        getter volume_size_in_gb : Int32

        # The number of resources that are used to train the model.

        @[JSON::Field(key: "instanceCount")]
        getter instance_count : Int32?

        def initialize(
          @instance_type : String,
          @volume_size_in_gb : Int32,
          @instance_count : Int32? = nil
        )
        end
      end

      # The resource you are requesting does not exist.

      struct ResourceNotFoundException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Provides information about an Amazon S3 bucket and path.

      struct S3ConfigMap
        include JSON::Serializable

        # The Amazon S3 location URI.

        @[JSON::Field(key: "s3Uri")]
        getter s3_uri : String

        def initialize(
          @s3_uri : String
        )
        end
      end

      # You have exceeded your service quota.

      struct ServiceQuotaExceededException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        # The name of the service quota limit that was exceeded

        @[JSON::Field(key: "quotaName")]
        getter quota_name : String?

        # The current limit on the service quota that was exceeded

        @[JSON::Field(key: "quotaValue")]
        getter quota_value : Float64?

        def initialize(
          @message : String,
          @quota_name : String? = nil,
          @quota_value : Float64? = nil
        )
        end
      end


      struct StartAudienceExportJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job that you want to export.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String


        @[JSON::Field(key: "audienceSize")]
        getter audience_size : Types::AudienceSize

        # The name of the audience export job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The description of the audience export job.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @audience_generation_job_arn : String,
          @audience_size : Types::AudienceSize,
          @name : String,
          @description : String? = nil
        )
        end
      end


      struct StartAudienceGenerationJobRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that is used for this audience
        # generation job.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The name of the audience generation job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The seed audience that is used to generate the audience.

        @[JSON::Field(key: "seedAudience")]
        getter seed_audience : Types::AudienceGenerationJobDataSource

        # The identifier of the collaboration that contains the audience generation job.

        @[JSON::Field(key: "collaborationId")]
        getter collaboration_id : String?

        # The description of the audience generation job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Whether the seed audience is included in the audience generation output.

        @[JSON::Field(key: "includeSeedInOutput")]
        getter include_seed_in_output : Bool?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        def initialize(
          @configured_audience_model_arn : String,
          @name : String,
          @seed_audience : Types::AudienceGenerationJobDataSource,
          @collaboration_id : String? = nil,
          @description : String? = nil,
          @include_seed_in_output : Bool? = nil,
          @tags : Hash(String, String)? = nil
        )
        end
      end


      struct StartAudienceGenerationJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the audience generation job.

        @[JSON::Field(key: "audienceGenerationJobArn")]
        getter audience_generation_job_arn : String

        def initialize(
          @audience_generation_job_arn : String
        )
        end
      end


      struct StartTrainedModelExportJobRequest
        include JSON::Serializable

        # The membership ID of the member that is receiving the exported trained model artifacts.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model export job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The output configuration information for the trained model export job.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::TrainedModelExportOutputConfiguration

        # The Amazon Resource Name (ARN) of the trained model that you want to export.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The description of the trained model export job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The version identifier of the trained model to export. This specifies which version of the trained
        # model should be exported to the specified destination.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @membership_identifier : String,
          @name : String,
          @output_configuration : Types::TrainedModelExportOutputConfiguration,
          @trained_model_arn : String,
          @description : String? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end


      struct StartTrainedModelInferenceJobRequest
        include JSON::Serializable

        # Defines the data source that is used for the trained model inference job.

        @[JSON::Field(key: "dataSource")]
        getter data_source : Types::ModelInferenceDataSource

        # The membership ID of the membership that contains the trained model inference job.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model inference job.

        @[JSON::Field(key: "name")]
        getter name : String

        # Defines the output configuration information for the trained model inference job.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::InferenceOutputConfiguration

        # Defines the resource configuration for the trained model inference job.

        @[JSON::Field(key: "resourceConfig")]
        getter resource_config : Types::InferenceResourceConfig

        # The Amazon Resource Name (ARN) of the trained model that is used for this trained model inference
        # job.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association that is used for this
        # trained model inference job.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String?

        # The execution parameters for the container.

        @[JSON::Field(key: "containerExecutionParameters")]
        getter container_execution_parameters : Types::InferenceContainerExecutionParameters?

        # The description of the trained model inference job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The environment variables to set in the Docker container.

        @[JSON::Field(key: "environment")]
        getter environment : Hash(String, String)?

        # The Amazon Resource Name (ARN) of the KMS key. This key is used to encrypt and decrypt
        # customer-owned data in the ML inference job and associated data.

        @[JSON::Field(key: "kmsKeyArn")]
        getter kms_key_arn : String?

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms ML considers it
        # to be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws
        # do not count against your tags per resource limit.

        @[JSON::Field(key: "tags")]
        getter tags : Hash(String, String)?

        # The version identifier of the trained model to use for inference. This specifies which version of
        # the trained model should be used to generate predictions on the input data.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @data_source : Types::ModelInferenceDataSource,
          @membership_identifier : String,
          @name : String,
          @output_configuration : Types::InferenceOutputConfiguration,
          @resource_config : Types::InferenceResourceConfig,
          @trained_model_arn : String,
          @configured_model_algorithm_association_arn : String? = nil,
          @container_execution_parameters : Types::InferenceContainerExecutionParameters? = nil,
          @description : String? = nil,
          @environment : Hash(String, String)? = nil,
          @kms_key_arn : String? = nil,
          @tags : Hash(String, String)? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end


      struct StartTrainedModelInferenceJobResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the trained model inference job.

        @[JSON::Field(key: "trainedModelInferenceJobArn")]
        getter trained_model_inference_job_arn : String

        def initialize(
          @trained_model_inference_job_arn : String
        )
        end
      end

      # Details about the status of a resource.

      struct StatusDetails
        include JSON::Serializable

        # The error message that was returned. The message is intended for human consumption and can change at
        # any time. Use the statusCode for programmatic error handling.

        @[JSON::Field(key: "message")]
        getter message : String?

        # The status code that was returned. The status code is intended for programmatic error handling.
        # Clean Rooms ML will not change the status code for existing error conditions.

        @[JSON::Field(key: "statusCode")]
        getter status_code : String?

        def initialize(
          @message : String? = nil,
          @status_code : String? = nil
        )
        end
      end

      # The criteria used to stop model training.

      struct StoppingCondition
        include JSON::Serializable

        # The maximum amount of time, in seconds, that model training can run before it is terminated.

        @[JSON::Field(key: "maxRuntimeInSeconds")]
        getter max_runtime_in_seconds : Int32?

        def initialize(
          @max_runtime_in_seconds : Int32? = nil
        )
        end
      end

      # Properties that define how a specific data column should be handled during synthetic data
      # generation, including its name, type, and role in predictive modeling.

      struct SyntheticDataColumnProperties
        include JSON::Serializable

        # The name of the data column as it appears in the dataset.

        @[JSON::Field(key: "columnName")]
        getter column_name : String

        # The data type of the column, which determines how the synthetic data generation algorithm processes
        # and synthesizes values for this column.

        @[JSON::Field(key: "columnType")]
        getter column_type : String

        # Indicates if this column contains predictive values that should be treated as target variables in
        # machine learning models. This affects how the synthetic data generation preserves statistical
        # relationships.

        @[JSON::Field(key: "isPredictiveValue")]
        getter is_predictive_value : Bool

        def initialize(
          @column_name : String,
          @column_type : String,
          @is_predictive_value : Bool
        )
        end
      end

      # Configuration settings for synthetic data generation, including the parameters that control data
      # synthesis and the evaluation scores that measure the quality and privacy characteristics of the
      # generated synthetic data.

      struct SyntheticDataConfiguration
        include JSON::Serializable

        # The parameters that control how synthetic data is generated, including privacy settings, column
        # classifications, and other configuration options that affect the data synthesis process.

        @[JSON::Field(key: "syntheticDataParameters")]
        getter synthetic_data_parameters : Types::MLSyntheticDataParameters

        # Evaluation scores that assess the quality and privacy characteristics of the generated synthetic
        # data, providing metrics on data utility and privacy preservation.

        @[JSON::Field(key: "syntheticDataEvaluationScores")]
        getter synthetic_data_evaluation_scores : Types::SyntheticDataEvaluationScores?

        def initialize(
          @synthetic_data_parameters : Types::MLSyntheticDataParameters,
          @synthetic_data_evaluation_scores : Types::SyntheticDataEvaluationScores? = nil
        )
        end
      end

      # Comprehensive evaluation metrics for synthetic data that assess both the utility of the generated
      # data for machine learning tasks and its privacy preservation characteristics.

      struct SyntheticDataEvaluationScores
        include JSON::Serializable

        # Privacy-specific evaluation scores that measure how well the synthetic data protects individual
        # privacy, including assessments of potential privacy risks such as membership inference attacks.

        @[JSON::Field(key: "dataPrivacyScores")]
        getter data_privacy_scores : Types::DataPrivacyScores

        def initialize(
          @data_privacy_scores : Types::DataPrivacyScores
        )
        end
      end


      struct TagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to assign tags.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The optional metadata that you apply to the resource to help you categorize and organize them. Each
        # tag consists of a key and an optional value, both of which you define. The following basic
        # restrictions apply to tags: Maximum number of tags per resource - 50. For each resource, each tag
        # key must be unique, and each tag key can have only one value. Maximum key length - 128 Unicode
        # characters in UTF-8. Maximum value length - 256 Unicode characters in UTF-8. If your tagging schema
        # is used across multiple services and resources, remember that other services may have restrictions
        # on allowed characters. Generally allowed characters are: letters, numbers, and spaces representable
        # in UTF-8, and the following characters: + - = . _ : / @. Tag keys and values are case sensitive. Do
        # not use aws:, AWS:, or any upper or lowercase combination of such as a prefix for keys as it is
        # reserved for AWS use. You cannot edit or delete tag keys with this prefix. Values can have this
        # prefix. If a tag value has aws as its prefix but the key does not, then Clean Rooms considers it to
        # be a user tag and will count against the limit of 50 tags. Tags with only the key prefix of aws do
        # not count against your tags per resource limit.

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

      # The request was denied due to request throttling.

      struct ThrottlingException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Specifies the maximum size limit for trained model artifacts. This configuration helps control
      # storage costs and ensures that trained models don't exceed specified size constraints. The size
      # limit applies to the total size of all artifacts produced by the training job.

      struct TrainedModelArtifactMaxSize
        include JSON::Serializable

        # The unit of measurement for the maximum artifact size. Valid values include common storage units
        # such as bytes, kilobytes, megabytes, gigabytes, and terabytes.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The numerical value for the maximum artifact size limit. This value is interpreted according to the
        # specified unit.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @unit : String,
          @value : Float64
        )
        end
      end

      # Information about the output of the trained model export job.

      struct TrainedModelExportOutputConfiguration
        include JSON::Serializable

        # The members that will received the exported trained model output.

        @[JSON::Field(key: "members")]
        getter members : Array(Types::TrainedModelExportReceiverMember)

        def initialize(
          @members : Array(Types::TrainedModelExportReceiverMember)
        )
        end
      end

      # Provides information about the member who will receive trained model exports.

      struct TrainedModelExportReceiverMember
        include JSON::Serializable

        # The account ID of the member who will receive trained model exports.

        @[JSON::Field(key: "accountId")]
        getter account_id : String

        def initialize(
          @account_id : String
        )
        end
      end

      # Information about how the trained model exports are configured.

      struct TrainedModelExportsConfigurationPolicy
        include JSON::Serializable

        # The files that are exported during the trained model export job.

        @[JSON::Field(key: "filesToExport")]
        getter files_to_export : Array(String)

        # The maximum size of the data that can be exported.

        @[JSON::Field(key: "maxSize")]
        getter max_size : Types::TrainedModelExportsMaxSize

        def initialize(
          @files_to_export : Array(String),
          @max_size : Types::TrainedModelExportsMaxSize
        )
        end
      end

      # The maximum size of the trained model metrics that can be exported. If the trained model metrics
      # dataset is larger than this value, it will not be exported.

      struct TrainedModelExportsMaxSize
        include JSON::Serializable

        # The unit of measurement for the data size.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The maximum size of the dataset to export.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @unit : String,
          @value : Float64
        )
        end
      end

      # Provides information about the trained model inference job.

      struct TrainedModelInferenceJobSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model inference job.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The time at which the trained model inference job was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The membership ID of the membership that contains the trained model inference job.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model inference job.

        @[JSON::Field(key: "name")]
        getter name : String

        # The output configuration information of the trained model job.

        @[JSON::Field(key: "outputConfiguration")]
        getter output_configuration : Types::InferenceOutputConfiguration

        # The status of the trained model inference job.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model that is used for the trained model inference
        # job.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The Amazon Resource Name (ARN) of the trained model inference job.

        @[JSON::Field(key: "trainedModelInferenceJobArn")]
        getter trained_model_inference_job_arn : String

        # The most recent time at which the trained model inference job was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The Amazon Resource Name (ARN) of the configured model algorithm association that is used for the
        # trained model inference job.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String?

        # The description of the trained model inference job.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The log status of the trained model inference job.

        @[JSON::Field(key: "logsStatus")]
        getter logs_status : String?

        # Details about the log status for the trained model inference job.

        @[JSON::Field(key: "logsStatusDetails")]
        getter logs_status_details : String?

        # The metric status of the trained model inference job.

        @[JSON::Field(key: "metricsStatus")]
        getter metrics_status : String?

        # Details about the metrics status for the trained model inference job.

        @[JSON::Field(key: "metricsStatusDetails")]
        getter metrics_status_details : String?

        # The version identifier of the trained model that was used for inference in this job.

        @[JSON::Field(key: "trainedModelVersionIdentifier")]
        getter trained_model_version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @create_time : Time,
          @membership_identifier : String,
          @name : String,
          @output_configuration : Types::InferenceOutputConfiguration,
          @status : String,
          @trained_model_arn : String,
          @trained_model_inference_job_arn : String,
          @update_time : Time,
          @configured_model_algorithm_association_arn : String? = nil,
          @description : String? = nil,
          @logs_status : String? = nil,
          @logs_status_details : String? = nil,
          @metrics_status : String? = nil,
          @metrics_status_details : String? = nil,
          @trained_model_version_identifier : String? = nil
        )
        end
      end

      # Provides configuration information for the trained model inference job.

      struct TrainedModelInferenceJobsConfigurationPolicy
        include JSON::Serializable

        # The logs container for the trained model inference job.

        @[JSON::Field(key: "containerLogs")]
        getter container_logs : Array(Types::LogsConfigurationPolicy)?

        # The maximum allowed size of the output of the trained model inference job.

        @[JSON::Field(key: "maxOutputSize")]
        getter max_output_size : Types::TrainedModelInferenceMaxOutputSize?

        def initialize(
          @container_logs : Array(Types::LogsConfigurationPolicy)? = nil,
          @max_output_size : Types::TrainedModelInferenceMaxOutputSize? = nil
        )
        end
      end

      # Information about the maximum output size for a trained model inference job.

      struct TrainedModelInferenceMaxOutputSize
        include JSON::Serializable

        # The measurement unit to use.

        @[JSON::Field(key: "unit")]
        getter unit : String

        # The maximum output size value.

        @[JSON::Field(key: "value")]
        getter value : Float64

        def initialize(
          @unit : String,
          @value : Float64
        )
        end
      end

      # Summary information about the trained model.

      struct TrainedModelSummary
        include JSON::Serializable

        # The collaboration ID of the collaboration that contains the trained model.

        @[JSON::Field(key: "collaborationIdentifier")]
        getter collaboration_identifier : String

        # The Amazon Resource Name (ARN) of the configured model algorithm association that was used to create
        # this trained model.

        @[JSON::Field(key: "configuredModelAlgorithmAssociationArn")]
        getter configured_model_algorithm_association_arn : String

        # The time at which the trained model was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The membership ID of the member that created the trained model.

        @[JSON::Field(key: "membershipIdentifier")]
        getter membership_identifier : String

        # The name of the trained model.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the trained model.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the trained model.

        @[JSON::Field(key: "trainedModelArn")]
        getter trained_model_arn : String

        # The most recent time at which the trained model was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the trained model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # Information about the incremental training data channels used to create this version of the trained
        # model.

        @[JSON::Field(key: "incrementalTrainingDataChannels")]
        getter incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)?

        # The version identifier of this trained model version.

        @[JSON::Field(key: "versionIdentifier")]
        getter version_identifier : String?

        def initialize(
          @collaboration_identifier : String,
          @configured_model_algorithm_association_arn : String,
          @create_time : Time,
          @membership_identifier : String,
          @name : String,
          @status : String,
          @trained_model_arn : String,
          @update_time : Time,
          @description : String? = nil,
          @incremental_training_data_channels : Array(Types::IncrementalTrainingDataChannelOutput)? = nil,
          @version_identifier : String? = nil
        )
        end
      end

      # The configuration policy for the trained models.

      struct TrainedModelsConfigurationPolicy
        include JSON::Serializable

        # The container for the logs of the trained model.

        @[JSON::Field(key: "containerLogs")]
        getter container_logs : Array(Types::LogsConfigurationPolicy)?

        # The container for the metrics of the trained model.

        @[JSON::Field(key: "containerMetrics")]
        getter container_metrics : Types::MetricsConfigurationPolicy?

        # The maximum size limit for trained model artifacts as defined in the configuration policy. This
        # setting helps enforce consistent size limits across trained models in the collaboration.

        @[JSON::Field(key: "maxArtifactSize")]
        getter max_artifact_size : Types::TrainedModelArtifactMaxSize?

        def initialize(
          @container_logs : Array(Types::LogsConfigurationPolicy)? = nil,
          @container_metrics : Types::MetricsConfigurationPolicy? = nil,
          @max_artifact_size : Types::TrainedModelArtifactMaxSize? = nil
        )
        end
      end

      # Provides information about the training dataset.

      struct TrainingDatasetSummary
        include JSON::Serializable

        # The time at which the training dataset was created.

        @[JSON::Field(key: "createTime")]
        getter create_time : Time

        # The name of the training dataset.

        @[JSON::Field(key: "name")]
        getter name : String

        # The status of the training dataset.

        @[JSON::Field(key: "status")]
        getter status : String

        # The Amazon Resource Name (ARN) of the training dataset.

        @[JSON::Field(key: "trainingDatasetArn")]
        getter training_dataset_arn : String

        # The most recent time at which the training dataset was updated.

        @[JSON::Field(key: "updateTime")]
        getter update_time : Time

        # The description of the training dataset.

        @[JSON::Field(key: "description")]
        getter description : String?

        def initialize(
          @create_time : Time,
          @name : String,
          @status : String,
          @training_dataset_arn : String,
          @update_time : Time,
          @description : String? = nil
        )
        end
      end


      struct UntagResourceRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the resource that you want to remove tags from.

        @[JSON::Field(key: "resourceArn")]
        getter resource_arn : String

        # The key values of tags that you want to remove.

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


      struct UpdateConfiguredAudienceModelRequest
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that you want to update.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        # The Amazon Resource Name (ARN) of the new audience model that you want to use.

        @[JSON::Field(key: "audienceModelArn")]
        getter audience_model_arn : String?

        # The new audience size configuration.

        @[JSON::Field(key: "audienceSizeConfig")]
        getter audience_size_config : Types::AudienceSizeConfig?

        # The new description of the configured audience model.

        @[JSON::Field(key: "description")]
        getter description : String?

        # The minimum number of users from the seed audience that must match with users in the training data
        # of the audience model.

        @[JSON::Field(key: "minMatchingSeedSize")]
        getter min_matching_seed_size : Int32?

        # The new output configuration.

        @[JSON::Field(key: "outputConfig")]
        getter output_config : Types::ConfiguredAudienceModelOutputConfig?

        # The new value for whether to share audience metrics.

        @[JSON::Field(key: "sharedAudienceMetrics")]
        getter shared_audience_metrics : Array(String)?

        def initialize(
          @configured_audience_model_arn : String,
          @audience_model_arn : String? = nil,
          @audience_size_config : Types::AudienceSizeConfig? = nil,
          @description : String? = nil,
          @min_matching_seed_size : Int32? = nil,
          @output_config : Types::ConfiguredAudienceModelOutputConfig? = nil,
          @shared_audience_metrics : Array(String)? = nil
        )
        end
      end


      struct UpdateConfiguredAudienceModelResponse
        include JSON::Serializable

        # The Amazon Resource Name (ARN) of the configured audience model that was updated.

        @[JSON::Field(key: "configuredAudienceModelArn")]
        getter configured_audience_model_arn : String

        def initialize(
          @configured_audience_model_arn : String
        )
        end
      end

      # The request parameters for this request are incorrect.

      struct ValidationException
        include JSON::Serializable


        @[JSON::Field(key: "message")]
        getter message : String

        def initialize(
          @message : String
        )
        end
      end

      # Configuration information about the compute workers that perform the transform job.

      struct WorkerComputeConfiguration
        include JSON::Serializable

        # The number of compute workers that are used.

        @[JSON::Field(key: "number")]
        getter number : Int32?


        @[JSON::Field(key: "properties")]
        getter properties : Types::WorkerComputeConfigurationProperties?

        # The instance type of the compute workers that are used.

        @[JSON::Field(key: "type")]
        getter type : String?

        def initialize(
          @number : Int32? = nil,
          @properties : Types::WorkerComputeConfigurationProperties? = nil,
          @type : String? = nil
        )
        end
      end

      # The configuration properties for the worker compute environment. These properties allow you to
      # customize the compute settings for your Clean Rooms workloads.

      struct WorkerComputeConfigurationProperties
        include JSON::Serializable

        # The Spark configuration properties for SQL workloads. This map contains key-value pairs that
        # configure Apache Spark settings to optimize performance for your data processing jobs. You can
        # specify up to 50 Spark properties, with each key being 1-200 characters and each value being 0-500
        # characters. These properties allow you to adjust compute capacity for large datasets and complex
        # workloads.

        @[JSON::Field(key: "spark")]
        getter spark : Hash(String, String)?

        def initialize(
          @spark : Hash(String, String)? = nil
        )
        end
      end
    end
  end
end
